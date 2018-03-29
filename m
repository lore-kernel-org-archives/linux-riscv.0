From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 28 Mar 2018 17:41:11 -0700 (PDT)
Subject: [PATCH 1/2] perf: riscv: preliminary RISC-V support
In-Reply-To: <CAJ2AOiNQiTpJ9cBCb_fXVCyVNj9U-Xk3tUG=9toAC7HpQTRQvA@mail.gmail.com>
Message-ID: <mhng-98d52ac2-733f-48af-9a31-5717c7ee5d01@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 28 Mar 2018 15:31:30 PDT (-0700), sols at sifive.com wrote:
> Also, core IDs and socket IDs are wrong in perf report:

It looks like for this we need the stuff in topology.h.  I've cobbled something 
together quickly for Alex to use for now to see if that fixes other problems, 
I'll submit a sane version when we can.
