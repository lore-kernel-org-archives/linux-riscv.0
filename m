Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7074AC7114C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 21:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpzWNdy6+syHP6dEDLdVR5R64khKFr/1sHhpMEyExXQ=; b=qZ5xTXM2jd9bLY2eJlOFJZ9N53
	9Ec1ZZUlbvYkU+aLxOJxf69PB0vzSxjMxd9PNlotLEI906vh07+eS1GXOuCu8HVFpwQLoVGCWdIW+
	IBQjztOHOavfIcV7n+C0NZ0pb/c2G+gnSkr//KAPHGfPvh15KAIOHmdh5vrMwjMCvUU4bB/7otqf5
	WRPqo7rDzNYA5CeNe0Sda5HT9mkTfFqo/tkYviijZBYYF267yhlVEKJbesG9keyFH2rLMqt9KpOQU
	P6FIs/b6RIJJbwnFhxYv9AaKt3vBQVQ8uFvE+cqpRURo0o5DYjdf4GX4mIjPIEvIgnDIOZlj/owTK
	ZFlPraYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSoF-0000000BGSV-359Q;
	Wed, 11 Jun 2025 21:16:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPOD8-0000000Ab9f-2kmH
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 16:22:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EFC515C1088;
	Wed, 11 Jun 2025 16:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F368C4CEE3;
	Wed, 11 Jun 2025 16:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749658917;
	bh=yhHILjKN4KyXc1dRjfmoVhQCyL5X32w0a/kSF1NLxBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ejXfaqT5ChdI9lgxLtgwiwpEUUdoc1+RZsXtNiosz3LchFdWCUqSR8Q0bgwYt/Q18
	 3+ppiRipP3woOMIi2Am2nrwOlIjyk9yAZq/FjOH15PcGPKXpbYpAWErFzB08MK3yIv
	 35vhhrA5WAahlU85+oRRA9sD/5GjVkw4bNN1kYoAGqEm7jhgsCX+MnpCDxF5/xt9xP
	 edXaXtO8K1ftob4CjK/toomYa/ChJJSNi9pwSfADBgOVINVAIAOXkfY67dxj6fChCU
	 BQwRqspGLTF10ryMJb4LpDj3zE2k5KLHMHm1I6lSsN9G7ysycHXMxJ06rJ8K6jW6wv
	 TYvmCI8ikEMTQ==
Date: Wed, 11 Jun 2025 17:21:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	tim609@andestech.com, arnd@arndb.de
Subject: Re: [PATCH v5 0/8] add Voyager board support
Message-ID: <20250611-tapeless-arson-a6ace3c42c00@spud>
References: <20250602060747.689824-1-ben717@andestech.com>
 <20250606-booth-icky-b416c1827a43@spud>
 <aEbOLztcBsKs84pn@atctrx.andestech.com>
 <20250609-donut-oozy-4dcc8b8a292d@spud>
 <20250609-twiddling-clamp-eaa0dd2b1cad@spud>
 <aEmrHPd7RxUSOLAY@atctrx.andestech.com>
MIME-Version: 1.0
In-Reply-To: <aEmrHPd7RxUSOLAY@atctrx.andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_092158_777493_DF365825 
X-CRM114-Status: GOOD (  32.85  )
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
Content-Type: multipart/mixed; boundary="===============0044768779093304558=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0044768779093304558==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WFYaPWbEs/9kFIBx"
Content-Disposition: inline


--WFYaPWbEs/9kFIBx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+CC Arnd,

On Thu, Jun 12, 2025 at 12:13:16AM +0800, Ben Zong-You Xie wrote:
> On Mon, Jun 09, 2025 at 05:17:50PM +0100, Conor Dooley wrote:
> > [EXTERNAL MAIL]
>=20
> > Date: Mon, 9 Jun 2025 17:17:50 +0100
> > From: Conor Dooley <conor@kernel.org>
> > To: Ben Zong-You Xie <ben717@andestech.com>
> > Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
> >  alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.or=
g,
> >  tglx@linutronix.de, daniel.lezcano@linaro.org,
> >  prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
> >  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
> >  tim609@andestech.com
> > Subject: Re: [PATCH v5 0/8] add Voyager board support
> >=20
> > On Mon, Jun 09, 2025 at 05:16:54PM +0100, Conor Dooley wrote:
> > > On Mon, Jun 09, 2025 at 08:06:07PM +0800, Ben Zong-You Xie wrote:
> > > > On Fri, Jun 06, 2025 at 05:00:06PM +0100, Conor Dooley wrote:
> > > > > [EXTERNAL MAIL]
> > > >=20
> > > > > Date: Fri, 6 Jun 2025 17:00:06 +0100
> > > > > From: Conor Dooley <conor@kernel.org>
> > > > > To: Ben Zong-You Xie <ben717@andestech.com>
> > > > > Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkel=
ey.edu,
> > > > >  alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, conor+dt@ker=
nel.org,
> > > > >  tglx@linutronix.de, daniel.lezcano@linaro.org,
> > > > >  prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.=
org,
> > > > >  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
> > > > >  tim609@andestech.com
> > > > > Subject: Re: [PATCH v5 0/8] add Voyager board support
> > > > >=20
> > > > > On Mon, Jun 02, 2025 at 02:07:39PM +0800, Ben Zong-You Xie wrote:
> > > > > > The Voyager is a 9.6=E2=80=9D x 9.6=E2=80=9D Micro ATX form fac=
tor development board
> > > > > > including Andes QiLai SoC. This patch series adds minimal devic=
e tree
> > > > > > files for the QiLai SoC and the Voyager board [1].
> > > > > >=20
> > > > > > Now only support basic uart drivers to boot up into a basic con=
sole. Other
> > > > > > features will be added later.
> > > > > >=20
> > > > > > [1] https://www.andestech.com/en/products-solutions/andeshape-p=
latforms/qilai-chip/
> > > > >=20
> > > > > Ball is in your court now, after rc1 make a tree and get it in
> > > > > linux-next, and then send a pr to soc@kernel.org with this new co=
ntent.
> > > > > Perhaps the defconfig should go separately, I can take that one i=
f you
> > > > > want.

> > > > Thanks for your guidance on these patches. I will send a PR to
> > > > soc@kernel.org as you suggested.
> > > >=20
> > > > For the defconfig patch, I'm happy for you to handle it. Just let me
> > > > know if there's anything specific you'd like me to include.
> > >=20
> > > Okay, I picked it up on the basis that you'll send this all to Arnd f=
or
> > > 6.17
> >=20
> > Sorry, I think that was really poorly worded. I picked it up on the
> > basis that you're going to send the other patches in the series to Arnd
> > for 6.17.
>=20
> According to the SoC maintainer documentation [1], I should send a
> patchset (not a PR) to soc@kernel.org. Since I'm not a submaintainer yet.
> I think I should not sent a PR to the main SoC maintainer. Is that right?

I think you can send a PR and not worry about it.

> Further, I have two questions about sending a patchset:  =20
> 1. Should I send v5 or start a new patchset?
> 2. Should I continue excluding the defconfig patch, as we discussed
>    previously? I think it should be included now.

Arnd, you okay with a defconfig in the same branch as the dts/core
bindings for a new platform? I'll happily drop it from by branch if it
can all go as one.


--WFYaPWbEs/9kFIBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEmtHwAKCRB4tDGHoIJi
0hxOAQC1qmiuQTIkth0fjU0BJkWcNXeY7/dI2Y9Yvqiy9smpQAEAuhnCv1kfdYjO
ksxcZcHeMKiBLF6hIeHx76zK6daflAo=
=jply
-----END PGP SIGNATURE-----

--WFYaPWbEs/9kFIBx--


--===============0044768779093304558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0044768779093304558==--

