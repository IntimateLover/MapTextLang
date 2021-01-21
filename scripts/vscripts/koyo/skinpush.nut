koyo <- null;
Pscale <- 70;


function target() 
{
    koyo = activator;
}

function push()
{

    if (activator == null || koyo == null) return;
    local a = koyo.GetCenter();
    local b = activator.GetCenter();
    local dir = Vector(a.x - b.x, a.y - b.y, a.z - b.z);
    dir.Norm();
    local vel = Vector(Pscale * dir.x, Pscale * dir.y, Pscale * dir.z);
    koyo.__KeyValueFromVector("basevelocity", vel);

}

