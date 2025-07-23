<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de Empleados</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            padding: 0.8rem 1rem;
        }
        .navbar .nav-link, .navbar a {
            color: white;
        }
        .card {
            border-radius: 1rem;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .card h3 {
            margin-bottom: 1rem;
        }
        table th, table td {
            vertical-align: middle;
        }
        .btn-sm i {
            margin-right: 5px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-dark bg-dark justify-content-between">
    <a class="navbar-brand text-white"><i class="fa fa-home"></i> Home</a>
    <div class="dropdown">
        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Cerrar Sesión</a>
        <div class="dropdown-menu dropdown-menu-end p-3 text-center">
            <img src="img/user1.png" height="80" width="80" class="rounded-circle mb-2">
            <p class="mb-1 fw-bold">${nom}</p>
            <p class="mb-2 small">${correo}</p>
            <div class="dropdown-divider"></div>
            <a href="index2.jsp" class="btn btn-outline-danger btn-sm">Salir</a>
        </div>
    </div>
</nav>

<div class="container mt-4">
  

    <div class="card">
        <div class="card-body">
            <h3>Solicitud de Prestamos</h3>
            <hr>
            <a href="EmpleadoControlador?accion=nuevo" class="btn btn-success btn-sm mb-3">
                <i class="fa fa-plus-circle"></i> Nuevo
            </a>

            <jsp:include page="Mensaje.jsp" />

            <table class="table table-hover table-bordered align-middle text-center">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Fecha Ingreso</th>
                        <th>Prestamo</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${empleados}" var="item">
                        <tr>
                            <td>${item.id}</td>
                            <td>${item.nombres}</td>
                            <td>${item.apellidos}</td>
                            <td>${item.fechaIngreso}</td>
                            <td>S/. ${item.sueldo}</td>
                            <td>
                                <a href="EmpleadoControlador?accion=editar&id=${item.id}" class="btn btn-primary btn-sm">
                                    <i class="fa fa-edit"></i> Editar
                                </a>
                                <a href="EmpleadoControlador?accion=eliminar&id=${item.id}"
                                   onclick="return confirm('¿Estás seguro de eliminar al empleado con ID ${item.id}?')"
                                   class="btn btn-danger btn-sm">
                                    <i class="fa fa-trash"></i> Eliminar
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empleados.size() == 0}">
                        <tr>
                            <td colspan="6" class="text-center text-muted">No hay registros disponibles.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Scripts Bootstrap 5 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

</body>
</html>

