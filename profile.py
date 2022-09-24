# Import the Portal object.
import geni.portal as portal
# Import the ProtoGENI library.
import geni.rspec.pg as pg

# Create a portal context.
pc = portal.Context()

# Create a Request object to start building the RSpec.
request = pc.makeRequestRSpec()

# Add a raw PC to the request.
node = request.RawPC("node")

# We need a link to talk to the remote file system, so make an interface.
#iface = node.addInterface()

# The remote file system is represented by special node.
#fsnode = request.RemoteBlockstore("fsnode", "/mydata")

# This URN is displayed in the web interfaace for your dataset.
#fsnode.dataset = "urn:publicid:IDN+utah.cloudlab.us:rstorage-pg0+ltdataset+ctsai"
#fsnode.readonly = False

# Now we add the link between the node and the special node
#fslink = request.Link("fslink")
#fslink.addInterface(iface)
#fslink.addInterface(fsnode.interface)

# Special attributes for this link that we must use.
#fslink.best_effort = True
#fslink.vlan_tagging = True

# Install and execute a script that is contained in the repository.
node.addService(pg.Execute(shell="sh", command="/local/repository/setup.sh"))

# Print the RSpec to the enclosing page.
pc.printRequestRSpec(request)
