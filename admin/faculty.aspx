﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="faculty.aspx.cs" Inherits="admin_faculty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content_BForm" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content_Form" Runat="Server">
   <div class="my-3">
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="Default.aspx">Dashboard</a></li>
            <li class="breadcrumb-item">Faculties</li>
        </ol>
    </div>
    <div class="card my-4">
        <div class="card-header bg-dark text-white">
            <i class="fas fa-chalkboard-teacher mr-1"></i>
            Add Faculty
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-3">
                    <div class="btn-container" style="position: relative;">
                        <img runat="server" id="img_Faculty" class="w-100" style="border-radius: 50%" />
                        <button class="btn btn-success btn-sm" onclick="document.getElementById('<%= f_Image.ClientID %>').click()" type="button">Change</button>
                        <asp:FileUpload ID="f_Image" runat="server" CssClass="d-none" />
                    </div>
                    <script>
                        var fr = new FileReader();
                        fr.onload = function (e) {
                            document.getElementById("<%= img_Faculty.ClientID %>").src = this.result;
                        };
                        document.getElementById("<%= f_Image.ClientID %>").addEventListener("change", function () {
                            fr.readAsDataURL(this.files[0]);
                        });
                    </script>
                </div>
                <div class="col-9">
                    <div class="row">
                        <div class="form-group col-4">
                            <asp:Label runat="server" AssociatedControlID="txt_Faculty_Name">Faculty Name</asp:Label>
                            <asp:TextBox ID="txt_Faculty_Name" CssClass="form-control" placeholder="Firstname Middlename Lastname" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="student_rfv" runat="server"
                                        ErrorMessage="* Please Select Name"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="txt_Faculty_Name" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-4">
                            <asp:Label runat="server" AssociatedControlID="txt_Faculty_Dob">DOB</asp:Label>
                            <asp:TextBox ID="txt_Faculty_Dob" TextMode="Date" CssClass="form-control" runat="server">              
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="txt_Faculty_Dob_rfv" runat="server"
                                        ErrorMessage="* Please Select DOB"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="txt_Faculty_Dob" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-4">
                            <asp:Label runat="server" AssociatedControlID="ddl_Gender" ID="ddl_Faculty_gender">Gender</asp:Label>
                            <asp:DropDownList ID="ddl_Gender" CssClass="form-control" runat="server">
                                <asp:ListItem Value="">Gender</asp:ListItem>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ddl_Gender_rfv" runat="server"
                                        ErrorMessage="* Please Select Gender"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="ddl_Gender" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-4">
                            <asp:Label runat="server" AssociatedControlID="txt_Faculty_Mobile">Mobile</asp:Label>
                            <asp:TextBox ID="txt_Faculty_Mobile" CssClass="form-control" runat="server">     
                            </asp:TextBox>
                             <asp:RequiredFieldValidator ID="txt_Faculty_Mobile_rfv" runat="server"
                                        ErrorMessage="* Please Select Mobile"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="txt_Faculty_Mobile" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-4">
                            <asp:Label runat="server" AssociatedControlID="txt_Faculty_email">Email</asp:Label>
                            <asp:TextBox ID="txt_Faculty_email" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="txt_Faculty_email_rfv" runat="server"
                                        ErrorMessage="* Please Select Email"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="txt_Faculty_email" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-4">
                            <asp:Label runat="server" AssociatedControlID="txt_Faculty_address">Address</asp:Label>
                            <asp:TextBox ID="txt_Faculty_address" CssClass="form-control" TextMode="multiline" Columns="30" Rows="2" runat="server" />
                             <asp:RequiredFieldValidator ID="txt_Faculty_address_rfv" runat="server"
                                        ErrorMessage="* Please Select Address"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="txt_Faculty_address" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">                        
                        <div class="form-group col-4">
                            <asp:Label runat="server" AssociatedControlID="txt_Faculty_city">City</asp:Label>
                            <asp:TextBox ID="txt_Faculty_city" CssClass="form-control" runat="server">      </asp:TextBox>
                             <asp:RequiredFieldValidator ID="txt_Faculty_city_rfv" runat="server"
                                        ErrorMessage="* Please Select City"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="txt_Faculty_city" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-4">
                            <asp:Label runat="server" AssociatedControlID="txt_Faculty_pincode">Pincode</asp:Label>
                            <asp:TextBox ID="txt_Faculty_pincode" CssClass="form-control" runat="server">      </asp:TextBox>
                            <asp:RequiredFieldValidator ID="txt_Faculty_pincode_rfv" runat="server"
                                        ErrorMessage="* Please Select Pincode"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="txt_Faculty_pincode" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="card-footer pb-2">
            <asp:Button CssClass="btn btn-success" Text="Add Faculty" ID="txt_Add_Faculty" runat="server" OnClick="add_faculty" />
            <asp:Button CssClass="btn btn-warning" Text="Update Faculty" ID="txt_Upd_Faculty" runat="server" OnClick="upd_faculty" Visible="false" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content_AForm" Runat="Server">
    <div class="card mb-4" runat="server" id="area_Faculty_list">
        <div class="card-header bg-dark text-white">
            <i class="fas fa-chalkboard-teacher mr-1"></i>
            Faculties
        </div>
        <div class="card-body overflow-auto">
            <table class="table table-bordered w-100" id="dataTable">
                <thead>
                    <tr>
                       <th>Faculty ID</th>
                        <th>photo</th>
                        <th>Faculty Details</th>
                        <th>Contact</th>
                        <th>Address</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                                           
                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                        con.Open();
                        SqlCommand cmd = new SqlCommand("SELECT * FROM faculty", con);
                        SqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        { %>
                    <tr>
                        <td>
                            <%= reader["f_id"].ToString().Trim() %>
                        </td>
                        <td>
                            <img height="100" src="../<%=Helper.get_Faculty_Image(reader["f_image"].ToString().Trim())%>" />
                        </td>
                        <td>
                            <b>Name :</b><br />
                            <%= reader["f_name"].ToString().Trim() %><br />
                            <b>DOB :</b><br />
                            <%= reader["f_dob"].ToString().Trim() %><br />
                            <b>Gender :</b><br />
                            <%= reader["f_gender"].ToString().Trim() %>
                        </td>
                        <td>
                            <b>Mobile :</b><br />
                            <%= reader["f_mobile"].ToString().Trim() %><br />
                            <b>Email :</b><br />
                            <%= reader["f_email"].ToString().Trim() %>
                        </td>
                        <td>
                            <b>Addresss :</b><br />
                            <%= reader["f_address"].ToString().Trim() %><br />
                            <b>City :</b><br />
                            <%= reader["f_city"].ToString().Trim() %>
                            <br />
                            <b>Pincode :</b><br />
                            <%= reader["f_pincode"].ToString().Trim() %>
                        </td>
                        <td>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <a class="myedit" href="faculty.aspx?edit=<%= reader["f_id"].ToString().Trim() %>"><i class="btn btn-primary"><i class="fas fa-edit"></i>&nbsp; Edit</i></i></a>
                                    </a>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <a class="myedit" href="faculty.aspx?delete=<%= reader["f_id"].ToString().Trim() %>"><i class="btn btn-danger"><i class="fas fa-trash"></i>&nbsp; Delete</i></i></a>
                                </div>
                            </div>
                        </td>

                    </tr>
                    <% } %>
                </tbody>
                <tfoot>
                    <tr>
                       <th>Faculty ID</th>
                        <th>photo</th>
                        <th>Faculty Details</th>
                        <th>Contact</th>
                        <th>Address</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </tfoot>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Script_Area" Runat="Server">
</asp:Content>

