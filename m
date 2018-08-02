From: hch@lst.de (Christoph Hellwig)
Date: Thu, 2 Aug 2018 09:14:14 +0200
Subject: add support for Xilinx PCIe root ports on RISC-V v2
In-Reply-To: <CAMgXwThU2h3Grm+10S0Env1ZUYK5Q7pze+ckADjjyHEUVGs7=A@mail.gmail.com>
References: <20180801151403.20660-1-hch@lst.de>
 <CAMgXwThU2h3Grm+10S0Env1ZUYK5Q7pze+ckADjjyHEUVGs7=A@mail.gmail.com>
Message-ID: <20180802071414.GA11584@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Aug 01, 2018 at 04:02:34PM -0700, Wesley Terpstra wrote:
> FYI, I don't believe this solution is the one we intended to merge
> upstream. There is a different approach used in the riscv-linux tree
> from Palmer.

This is the solution I as the dma-mapping maintainer want for upstream,
and I'm trying to convince the PCI maintainers to agree with me.

What is in the RISC-V trees is a horribly bad idea that should have
never seen the light of day (copying dma_map_ops and patching them up).
