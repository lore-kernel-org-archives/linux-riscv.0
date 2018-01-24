From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 24 Jan 2018 14:19:09 -0800
Subject: [PATCH] riscv: don't use the symbolic satp name in assembler code
In-Reply-To: <20180124132447.5517-1-hch@lst.de>
References: <20180124132447.5517-1-hch@lst.de>
Message-ID: <20180124221913.6613-1-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 24 Jan 2018 05:24:47 PST (-0800), Christoph Hellwig wrote:
> The most recent release binutils release (2.29) doesn't know about
> the satp name yet, so stick to the name from the previous privileged
> ISA release and comment on the fact.

I think it'd be better to squash these into the previous cleanup you sent, just
to make sure the kernel always builds.  How do these look?

[PATCH 1/4] riscv: remove the unused current_pgdir function
[PATCH 2/4] riscv: don't read back satp in paging_init
[PATCH 3/4] riscv: rename sptbr to satp
[PATCH 4/4] riscv: inline set_pgdir into its only caller
