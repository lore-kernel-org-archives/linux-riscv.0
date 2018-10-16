From: thierry.reding@gmail.com (Thierry Reding)
Date: Tue, 16 Oct 2018 13:13:24 +0200
Subject: [RFC 1/4] pwm: sifive: Add DT documentation for SiFive PWM
 Controller.
In-Reply-To: <CAMgXwTieXNa13_xGp2mkw99+VJm-R1xrxMHSmRLZV-hG5oSdzA@mail.gmail.com>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
 <20181010134926.GD21134@ulmo>
 <25758ab9-eb36-741b-6264-42412b3ddd8e@wdc.com>
 <CAMgXwTieXNa13_xGp2mkw99+VJm-R1xrxMHSmRLZV-hG5oSdzA@mail.gmail.com>
Message-ID: <20181016111324.GD8852@ulmo>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Oct 15, 2018 at 04:19:20PM -0700, Wesley Terpstra wrote:
> On Mon, Oct 15, 2018 at 3:57 PM Atish Patra <atish.patra@wdc.com> wrote:
> > >> +SiFive PWM controller
> > >> +
> > >> +Unlike most other PWM controllers, the SiFive PWM controller currently only
> > >> +supports one period for all channels in the PWM. This is set globally in DTS.
> > >> +The period also has significant restrictions on the values it can achieve,
> > >> +which the driver rounds to the nearest achievable frequency.
> > >
> > > What restrictions are these? If "nearest achievable" is too far off the
> > > target period it might be preferable to error out.
> > >
> >
> > @Wes: Any comments?
> 
> When I last looked at this driver and hardware, I briefly considered
> throwing up my hands and pretending that this PWM device had no period
> control at all, only duty-cycle. There are several examples of PWM
> controllers in linux already that behave that way.

Can you point those out? So far we've always opted to refuse changing
the period of PWM channels that share a period if it didn't match the
current period.

> Most of the uses of this PWM are only going to care about the
> duty-cycle, not the period. So failing when the period is unachievable
> seems worse to me than just completely eliminating access to period
> control.

I'm not sure we've ever tried to completely take period out of the
picture. You could probably do it if you use only the atomic API because
then you just leave the period untouched. And if you have a post-clock
change you just need to make sure to record the new period and update
the duty cycle so that the ratio remains the same.

I think that could work, but I think it'd be best to be explicit about
it, rather than just handwaving it.

Thierry
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20181016/9e78c63c/attachment.sig>
