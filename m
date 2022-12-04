Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CF0C4332F
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Dec 2022 23:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4nyU98gYc4e5C6eyX1xR+klrINWdLpz4AMJdyzFnwQ=; b=xWCYIYB+s5BgzCNDZt7RzCzMV8
	SQxXOKk6vLcmmfC1gs6kyUYpGPiPRD+hbCsCzq/vw1kgR4WNRfPUlpDsJkq+n/4HUHoOxBfyamHza
	4W23nGipt71vVUfuxJD9XicmqRihRKXwyOhXsA84YHz+HKHcSOCUdBJT4H9aT8Lm3YijOIz5JzkhM
	BCtdLlNAWbVZPIiWCKuqUTsxbbAbYsN2g8Ti9jGY20aYaeQKoB+K0f0MzBYEaw0e45OyWeqiiJBOT
	+J7MKsj41xsRMYzKjJ9fglTVnGHVvCvvgXCynez+dIwEjdtbP2OhOq7iv8Uhepb/H5vQ3n3b/NsAM
	u4fLLCIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1yVE-00BgRY-NB; Sun, 04 Dec 2022 23:34:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1yVB-00BgO9-Rd
	for linux-riscv@lists.infradead.org; Sun, 04 Dec 2022 23:34:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 00285B80AC0;
	Sun,  4 Dec 2022 23:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19EE3C433C1;
	Sun,  4 Dec 2022 23:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670196863;
	bh=0cK0lUJ9KkiCl80pkQTKTOocwELvWyVAqXmQVTnv1c0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lovS8maHB9ktQb+Ww5yw81rPcCZRXSE1XC/6VM5+f/JzRlywQpDbXevjsTf3XGvwo
	 hscWSSHlMxx3ebYCbnH326mOeJsoC5YYQGGFW6Ht9lcNBlPL24prA8E9YlkLl0+iXS
	 gT7b/JylxCuJNt1lrjulIfpbqQbDa8QczvHB3edaPIrjidCAFPcARr2CadVdz3r0S9
	 gA6chTikmaPXADK1iQkCKLL6y6E5g3Csy8L2MmjmnSKtZKyAcXC6nAplTg1PCwNide
	 61gS7CsPom3Y5PON4htb0C6MeaLRDxBTApvUrtVGdJQwIChLQAb1g1+of2ruMJFfSA
	 5pm8SjNmeoAgg==
Date: Sun, 4 Dec 2022 23:34:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh@kernel.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v5 3/3] clocksource: timer-riscv: Set
 CLOCK_EVT_FEAT_C3STOP based on DT
Message-ID: <Y40ueQiTZK6hi7RS@spud>
References: <20221201123954.1111603-1-apatel@ventanamicro.com>
 <20221201123954.1111603-4-apatel@ventanamicro.com>
 <20221202000603.GA1720201-robh@kernel.org>
 <CAK9=C2VbM+CP0Y9Xx-SM9O4TFrQmOKvVWy-u5mxdPxrhacK4JQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK9=C2VbM+CP0Y9Xx-SM9O4TFrQmOKvVWy-u5mxdPxrhacK4JQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_153430_219179_90B4FD77 
X-CRM114-Status: GOOD (  35.75  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5829973216697282200=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5829973216697282200==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HlfaDJpKZhs96dAp"
Content-Disposition: inline


--HlfaDJpKZhs96dAp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Rob, Anup, Prabhakar,

On Fri, Dec 02, 2022 at 12:03:05PM +0530, Anup Patel wrote:
> On Fri, Dec 2, 2022 at 5:36 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Thu, Dec 01, 2022 at 06:09:54PM +0530, Anup Patel wrote:
> > > We should set CLOCK_EVT_FEAT_C3STOP for a clock_event_device only
> > > when riscv,timer-cannot-wake-cpu DT property is present in the RISC-V
> > > timer DT node.
> > >
> > > This way CLOCK_EVT_FEAT_C3STOP feature is set for clock_event_device
> > > based on RISC-V platform capabilities rather than having it set for
> > > all RISC-V platforms.
> > >
> > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > ---
> > >  drivers/clocksource/timer-riscv.c | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/=
timer-riscv.c
> > > index 969a552da8d2..1b4b36df5484 100644
> > > --- a/drivers/clocksource/timer-riscv.c
> > > +++ b/drivers/clocksource/timer-riscv.c
> > > @@ -28,6 +28,7 @@
> > >  #include <asm/timex.h>
> > >
> > >  static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
> > > +static bool riscv_timer_cannot_wake_cpu;
> > >
> > >  static int riscv_clock_next_event(unsigned long delta,
> > >               struct clock_event_device *ce)
> > > @@ -51,7 +52,7 @@ static int riscv_clock_next_event(unsigned long del=
ta,
> > >  static unsigned int riscv_clock_event_irq;
> > >  static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) =
=3D {
> > >       .name                   =3D "riscv_timer_clockevent",
> > > -     .features               =3D CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_=
FEAT_C3STOP,
> > > +     .features               =3D CLOCK_EVT_FEAT_ONESHOT,
> >
> > A platform that depended on CLOCK_EVT_FEAT_C3STOP being set will break
> > with this change because its existing DT will not have the new property.
> >
> > It needs to be the other way around which would effectively be the
> > existing 'always-on' property.
>=20
> There are no RISC-V platforms using C3STOP. The patch which
> added C3STOP has been reverted.
> (Refer, https://lore.kernel.org/lkml/a218ebf8-0fba-168d-6598-c970bbff5faf=
@sholland.org/T/)
>=20
> I just need to rebase this patch upon the C3STOP revert patch.

I guess you could say that the C3STOP addition was done spec-ulatively*,
as the platform that actually exhibits that behaviour does not use the
riscv-timer & its maintainer acked the revert (allwinner d1 family).

*The spec does not make any guarantees about whether events arrive
during suspend, only the behaviour *if* they arrive.

Switching the property to "always-on" would require retrofitting that
property to every other existing platform (and therefore regressing some
behaviour there, no?).

Most of the existing platforms are "toys" or demo platforms though, so
it would not, I guess, be the end of the world to do so. Doubly so since
none of them actually implement any sleep states that making it an
"always-on" property.

I've said since the start that defaulting to C3STOP is the "safer" thing
to do, and although we disagreed on this last time Anup, I think the
better outcome of someone missing a DT property is inaccessible sleep
states rather than going into sleep states they cannot get out of.

For PolarFire SoC, which I guess is one of the few "commerical"
platforms, I'd be willing to accept retrofitting, since we have not yet
implemented such sleep states yet.

Maybe Prabhakar knows whether the RZ/Five has either a) implemented
sleep states and b) which side of the "timer events arrive in suspend"
divide their platform lies on.
I'm particular interested here since that is not a SiFive core complex.

I would like to get DT maintainer approval of an approach here soon-ish
so that we can something sorted for the jh7110 stuff and for the
bouffalolabs SoC - the latter of which may very well be in the "no
events in suspend" camp as it also uses thead stuff.

Sorry for kinda rowing back on my previous acceptance of the approach,
but I am really between two minds on this.

Thanks,
Conor.


--HlfaDJpKZhs96dAp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY40uVQAKCRB4tDGHoIJi
0iXwAQDvaIbyKF4NJU9VaT5Lh4McyjHE+Y8vdOlJksMvF+Hc1AEA60gVnGIV8CWe
iMzMzE7jeqmjP23QMLt5HftoInManQg=
=ydQx
-----END PGP SIGNATURE-----

--HlfaDJpKZhs96dAp--


--===============5829973216697282200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5829973216697282200==--

