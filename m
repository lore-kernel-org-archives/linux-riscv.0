From: arnd@arndb.de (Arnd Bergmann)
Date: Sun, 5 Aug 2018 23:29:30 +0200
Subject: [PATCH v3 3/7] riscv: Delete asm/compat.h
In-Reply-To: <20180803073916.GA19580@infradead.org>
References: <20180707054247.19802-4-deepa.kernel@gmail.com>
 <mhng-ca3e24c4-d59b-491d-a9c5-c8466168b638@palmer-si-x1c4>
 <20180803073916.GA19580@infradead.org>
Message-ID: <CAK8P3a2i2Por7Xy_7GQEbdOx_CW4jF69MW3VXqc8AnxFjEd4BQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Aug 3, 2018 at 9:39 AM, Christoph Hellwig <hch@infradead.org> wrote:
> On Thu, Aug 02, 2018 at 06:26:58PM -0700, Palmer Dabbelt wrote:
>> I thought we were using this to make uname print "riscv64" (or "riscv32")
>> instead of just "riscv"?  Is there another mechanism to do that?
>
> That is set in the UTS_MACHINE variable in arch/riscv/Makefile
> and doesn't involve compat.h at all except when actually implementing
> 32-bit compat on 64 bit, which RISC-V doesn't (at least yet).

Note that the logic was also wrong, if we had an implementation of
CONFIG_COMPAT for arch/riscv, it would always result in the
"riscv64" string for both PER_LINUX and PER_LINUX32, when
it should be "riscv32" for the PER_LINUX32 personaliy.

      Arnd
