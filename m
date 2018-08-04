From: hch@lst.de (Christoph Hellwig)
Date: Sat, 4 Aug 2018 12:12:53 +0200
Subject: [PATCH 3/3] PCI/xilinx: Depend on OF instead of the ARCH
In-Reply-To: <20180802165623.GB13725@red-moon>
References: <20180801151403.20660-1-hch@lst.de>
 <20180801151403.20660-4-hch@lst.de> <20180802165623.GB13725@red-moon>
Message-ID: <20180804101253.GB12948@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Aug 02, 2018 at 05:56:23PM +0100, Lorenzo Pieralisi wrote:
> I could have taken it for this merge window but unfortunately it is a
> bit late (ie PCI patches queue is close), I can certainly queue it up
> for v4.20 though.

It is a little sad that we can't take a trivial kconfig patch more than a
week before the end of the merge window.  But then against given how long
a version of this patch has been around and not submitted who am I to
complain..
