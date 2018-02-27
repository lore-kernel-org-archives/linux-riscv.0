From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 27 Feb 2018 13:21:42 -0800 (PST)
Subject: [PATCH 0/9] RISC-V: Make modules loadable.
In-Reply-To: <CADJ6UvM2ibbrCTc2YWwgtU-NhOO_RL5J_xi+GkZrpY8Y-TqXCw@mail.gmail.com>
Message-ID: <mhng-1909df50-1ef0-493a-9b2d-b3cc6bb5cd35@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 27 Feb 2018 10:26:48 PST (-0800), sorear2 at gmail.com wrote:
> On Tue, Feb 27, 2018 at 10:21 AM, Palmer Dabbelt <palmer@sifive.com> wrote:
>> * Relaxation is too time consuming.  In this case you want to disable all
>> relaxation, and GAS will already emit code without R_RISCV_ALIGN when run
>> with relaxation disabled.
>
> Tangentially, I described a linear time algorithm for relaxation a
> while ago, but binutils is still using a quadratic time one.  Would
> patches be accepted?

Yes.  There's a tiny bit of support in there for it via R_RISCV_DELETE, I think 
we just need to convert the rest of the relaxations over to that and then flip 
around the pass that handles R_RISCV_DELETE and we should be good.

Of course, R_RISCV_DELETE isn't a public relocation so if you have a better way 
to handle it then I'm all ears :).
