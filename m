From: wesley@sifive.com (Wesley Terpstra)
Date: Mon, 15 Oct 2018 16:19:20 -0700
Subject: [RFC 1/4] pwm: sifive: Add DT documentation for SiFive PWM
 Controller.
In-Reply-To: <25758ab9-eb36-741b-6264-42412b3ddd8e@wdc.com>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
 <20181010134926.GD21134@ulmo>
 <25758ab9-eb36-741b-6264-42412b3ddd8e@wdc.com>
Message-ID: <CAMgXwTieXNa13_xGp2mkw99+VJm-R1xrxMHSmRLZV-hG5oSdzA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Oct 15, 2018 at 3:57 PM Atish Patra <atish.patra@wdc.com> wrote:
> >> +SiFive PWM controller
> >> +
> >> +Unlike most other PWM controllers, the SiFive PWM controller currently only
> >> +supports one period for all channels in the PWM. This is set globally in DTS.
> >> +The period also has significant restrictions on the values it can achieve,
> >> +which the driver rounds to the nearest achievable frequency.
> >
> > What restrictions are these? If "nearest achievable" is too far off the
> > target period it might be preferable to error out.
> >
>
> @Wes: Any comments?

When I last looked at this driver and hardware, I briefly considered
throwing up my hands and pretending that this PWM device had no period
control at all, only duty-cycle. There are several examples of PWM
controllers in linux already that behave that way.

Most of the uses of this PWM are only going to care about the
duty-cycle, not the period. So failing when the period is unachievable
seems worse to me than just completely eliminating access to period
control.

> I think yes. Since fu540 is the first Linux capable RISC-V core, SiFive
> Guys decided mark it as version 0.
>
> @Wesly: Please correct me if I am wrong.

Correct.
