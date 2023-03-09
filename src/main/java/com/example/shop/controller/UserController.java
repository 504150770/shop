package com.example.shop.controller;

import com.example.shop.dao.UserDao;
import com.example.shop.entity.*;
import com.example.shop.service.IUserService;
import com.example.shop.util.R;
import com.example.shop.util.FileUpload;
import com.example.shop.util.Function;
import com.example.shop.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static com.example.shop.util.Function.getUserId;
import static com.example.shop.util.Function.getUserId;

@RestController
@RequestMapping("/")
public class UserController {
    @Resource
    private FileUpload fileUpload;
    @Resource
    private HttpServletRequest request;
    @Resource
    private HttpServletResponse response;
    @Autowired
    private IUserService userService;
    @Autowired
    private UserDao userDao;

    /**
     * 跳转登录界面
     * @return
     */
    @GetMapping("login")
    public ModelAndView login() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("login");
        return mv;
    }
    /**
     * 登录，校验用户身份
     * @param user
     * @return
     */
    @PostMapping("loginAction")
    public int loginAction(User user) {
        //校验用户邮箱、密码是否正确
        User user1 = userDao.login(user);
        if (user1 == null) {
            return 0;
        }
        request.getSession().setAttribute("userId", user1.getId());
        if (user1.getIsAdmin() == 1) {
            //是管理员用户
            return 1;
        } else {
            //不是管理员用户
            return 2;
        }
    }

    /**
     * 跳转注册界面
     * @return
     */
    @GetMapping("register")
    public ModelAndView register() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("register");
        return mv;
    }
    /**
     * 注册，校验用户是否存在
     * @param user
     * @return
     */
    @PostMapping("registerAction")
    public int registerAction(User user) {
        //判断用户是否存在
        int n = userDao.check(user);
        if (n == 1) {
            return 0;
        }
        if (!"".equals(user.getEmail()) && !"".equals(user.getName()) &&
                !"".equals(user.getPassword()) && !"".equals(user.getSex())) {
            userDao.insert(user);
            return 1;
        }else{
            return 2;
        }
    }

    /**
     * 用户注销
     * @throws IOException
     */
    @GetMapping("logout")
    public void logout() throws IOException {
        request.getSession().setAttribute("userId", null);
        response.sendRedirect("/login");
        return ;
    }

    /**
     * 用户信息查询：通过保存的id查询
     * @return
     */
    @GetMapping("info")
    public ModelAndView info() {
        ModelAndView mv = new ModelAndView();
        User user = userDao.selectById(getUserId(request));
        mv.addObject(user);
        mv.setViewName("info");
        return mv;
    }
    @GetMapping
    public List<User> getAll(){
        return userService.list();
    }

    @PostMapping
    public Boolean save(@RequestBody User user){
        return userService.save(user);
    }

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    @PostMapping("update")
    public boolean update(User user) {
        if (user.getFile() != null) {
            //保存头像
            user.setImg(fileUpload.save(user.getFile()));
        }
        user.setId((Integer) request.getSession().getAttribute("userId"));
        userDao.update(user);
        return true;
    }

    /**
     * 后台管理分页查询
     * @param query
     * @return
     */
    @GetMapping("query")
    public TableData query(UserQuery query){
        query.setPage((query.getPage() - 1) * query.getLimit());
        TableData tableData = new TableData();
        tableData.setData(userDao.query(query));
        tableData.setCount(userDao.queryCount(query));
        return tableData;
    }

    @DeleteMapping("{id}")
    public Boolean detele(@PathVariable Integer id){
        return userService.removeById(id);
    }

    @GetMapping("{id}")
    public User getById(@PathVariable Integer id){
        return userService.getById(id);
    }

    @GetMapping("{currentPage}/{pageSize}")
    public List<User> getPage(@PathVariable int currentPage,@PathVariable int pageSize){
        return userService.getPage(currentPage,pageSize).getRecords();
    }

    /**
     * 后台更新：通过id更新用户信息
     * @param user
     * @return
     */
    @PostMapping("user/update")
    public boolean userUpdate(User user){
        userDao.userUpdate(user);
        return true;
    }



}
