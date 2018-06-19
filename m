From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 19 Jun 2018 10:14:44 -0700
Subject: an initial RISC-V Linux 4.18 tree
Message-ID: <20180619171444.GA10395@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi all,

there had been some requests for a more updated working RISC-V
tree.  Based on that I decided that instead of a private working
tree for 4.18 I'd start a public tree:

    git://git.infradead.org/users/hch/riscv.git riscv-linux-4.18

Gitweb:

    http://git.infradead.org/users/hch/riscv.git/shortlog/refs/heads/riscv-linux-4.18

For now this just contains core patches, that is whatever I want/need
on Qemu, or what looks like it.  I've also done all the usual cleanups
to get the code submission ready, the only exception is the
documentation of the PLIC register map as pointed out by Jonathan last
time around - I'll need someone more familiar with the hardware and
driver to fix that up.

Except for that the patches should be good to be submitted, I can
help a bit with that, but in general having the original authors submit
it would be preferred.

The tree is going to get rebased as needed.
