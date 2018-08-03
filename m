From: hch@infradead.org (Christoph Hellwig)
Date: Fri, 3 Aug 2018 00:39:16 -0700
Subject: [PATCH v3 3/7] riscv: Delete asm/compat.h
In-Reply-To: <mhng-ca3e24c4-d59b-491d-a9c5-c8466168b638@palmer-si-x1c4>
References: <20180707054247.19802-4-deepa.kernel@gmail.com>
 <mhng-ca3e24c4-d59b-491d-a9c5-c8466168b638@palmer-si-x1c4>
Message-ID: <20180803073916.GA19580@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Aug 02, 2018 at 06:26:58PM -0700, Palmer Dabbelt wrote:
> I thought we were using this to make uname print "riscv64" (or "riscv32")
> instead of just "riscv"?  Is there another mechanism to do that?

That is set in the UTS_MACHINE variable in arch/riscv/Makefile
and doesn't involve compat.h at all except when actually implementing
32-bit compat on 64 bit, which RISC-V doesn't (at least yet).
