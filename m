From: sorear2@gmail.com (Stef O'Rear)
Date: Tue, 27 Feb 2018 10:26:48 -0800
Subject: [PATCH 0/9] RISC-V: Make modules loadable.
In-Reply-To: <mhng-c4e04870-37da-41d2-a541-c9fbb6d5de9b@palmer-si-x1c4>
References: <CADJ6UvO88DUdH0paanf9=2UCrt-VC-U25nQu4xRZ4SxzJ1G1Ww@mail.gmail.com>
 <mhng-c4e04870-37da-41d2-a541-c9fbb6d5de9b@palmer-si-x1c4>
Message-ID: <CADJ6UvM2ibbrCTc2YWwgtU-NhOO_RL5J_xi+GkZrpY8Y-TqXCw@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Feb 27, 2018 at 10:21 AM, Palmer Dabbelt <palmer@sifive.com> wrote:
> * Relaxation is too time consuming.  In this case you want to disable all
> relaxation, and GAS will already emit code without R_RISCV_ALIGN when run
> with relaxation disabled.

Tangentially, I described a linear time algorithm for relaxation a
while ago, but binutils is still using a quadratic time one.  Would
patches be accepted?

-s
