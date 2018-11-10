From: me@packi.ch (Patrick Staehlin)
Date: Sat, 10 Nov 2018 09:35:15 +0100
Subject: [PATCH] riscv: add S and U modes to ISA string
In-Reply-To: <20181110064543.12411-1-david.abdurachmanov@gmail.com>
References: <20181110064543.12411-1-david.abdurachmanov@gmail.com>
Message-ID: <7958aa50-8808-e909-753c-e232b3d1f84e@packi.ch>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 10.11.18 07:45, David Abdurachmanov wrote:
> 
> The patch adds the missing S and U modes.

This is the same patch I submitted earlier (see v2 here [1], based on
Palmer's feedback). Palmer stated that the "S" extension should not be
exposed to usermode.

Since two people arrived at the same solution, I wonder if the
supervisor mode should really be hidden from userspace, as it's about
the CPU information, not about the environment the calling code is
running as.

[1] https://lkml.org/lkml/2018/11/10/96

Patrick
