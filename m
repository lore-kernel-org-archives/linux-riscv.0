From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 24 Oct 2018 13:40:34 -0700
Subject: [PATCH 0/2] RISC-V: Add support for SECCOMP
In-Reply-To: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
Message-ID: <20181024204036.8799-1-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 23 Oct 2018 01:20:28 PDT (-0700), david.abdurachmanov at gmail.com wrote:
> On Tue, Oct 23, 2018 at 3:20 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
>> I'm pretty sure this is our largest patch set since the original kernel
>> contribution, and it's certainly the one with the most contributors.
>> While I don't have anything else I know I'm going to submit for the
>> merge window, I would be somewhat surprised if I didn't screw anything
>> up.
>
> Hi Palmer,
>
> Do you plan to land wip-seccomp in 4.20?
>
> It was mentioned back in August:
> http://lists.infradead.org/pipermail/linux-riscv/2018-August/001182.html
>
> david

I've updated the patches to live on top of 4.19 as well as cleaning up
the Kconfig entry.  Unless anyone has any comments I'll add them to
for-next and submit a PR next week.

Thanks for the reminder!
