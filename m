Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B1AC001DF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 17:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANecffSzj1rkHgCDmjiNeQESJIX+QkSjgyoExogmUUk=; b=kEOldo/pjdgVohNlNUSvXkkRlI
	HvDmtzozw49wtDZXxUrbyzqx5fGMAbSWgtGaD5rw67SDJd3b0ZOope5lEMfM1EtLlDZt5GDP4Msx7
	mOOBNEDk8ScDjqVe2Z0Xi4r0IKlGt56AqOS5Iqz2hSLMevbccbCPGGEGszdn6iE7KPIVGlAJgWPSH
	F7IdB8XpEeTesi8deUW+SrxmuAwJdwnpljTelRWJYhvFGgEo5PAsXehCGdjo+I7uqKsMzB0kdtSoF
	CME1Q/8303ezbMDT+bvZNmx5+5u0/sm1O1XOp8CvOTdVQhiq8hlV0SzO7CjoPUsK+Q2bJrE8+BSxH
	tw8/g56Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRFUz-005TxT-12;
	Wed, 02 Aug 2023 17:19:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRFUw-005Tws-1u
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 17:18:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1AF5161A56;
	Wed,  2 Aug 2023 17:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39522C433C7;
	Wed,  2 Aug 2023 17:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690996737;
	bh=1bs5fAM+RgwhOoYuMXjxSteSlIzHxQlTrE/hEJz35s8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KFMrGcadzeAB7Am7LXjRf//SwRph7sh+o/I56xAeE2y+O9NqVIVtgU+dK+YotbrQs
	 RhvDgRNMYN/N1Eu+yo0I60FCvY5nXSCojcYeotzFskq4WUgGsr97sFysmdTcMyZePj
	 t70OfGPCUpyP+g5+LnsX1MOjPan0+9MLWGA9ZKwgLWuc6a8YfBtV918w08xSqQSCVS
	 XnyZ6y9ByyWDwQ8cAXQ99aho4IdhpKnqtWMVgrV43BXUydY+uV2EgfFa7qigEG6xUv
	 dMeyOR00ZClxuyx//nBTSpSL/StwxBLtvwS21AAt7VTmfHH3PO5SuHJVfYv3b9TWs+
	 jkU0SeaQ24D2g==
Date: Wed, 2 Aug 2023 18:18:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v7 01/15] RISC-V: Add riscv_get_intc_hartid() function
Message-ID: <20230802-recharger-chuck-6ace9f1157ac@spud>
References: <20230802150018.327079-1-apatel@ventanamicro.com>
 <20230802150018.327079-2-apatel@ventanamicro.com>
 <20230802-b0c478839e55890385d98f31@orel>
MIME-Version: 1.0
In-Reply-To: <20230802-b0c478839e55890385d98f31@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_101858_708888_78D74A1B 
X-CRM114-Status: GOOD (  24.10  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4196716533341924672=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4196716533341924672==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FOD65xhEHS8tTgmj"
Content-Disposition: inline


--FOD65xhEHS8tTgmj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 08:09:18PM +0300, Andrew Jones wrote:
> On Wed, Aug 02, 2023 at 08:30:04PM +0530, Anup Patel wrote:
> > We add a common riscv_get_intc_hartid() which help device drivers to
> > get hartid of the HART associated with a INTC (i.e. local interrupt
> > controller) fwnode. This new function is more generic compared to
> > the existing riscv_of_parent_hartid() function hence we also replace
> > use of riscv_of_parent_hartid() with riscv_get_intc_hartid().
> >=20
> > Also, while we are here let us update riscv_of_parent_hartid() to
> > always return the hartid irrespective whether the CPU/HART DT node
> > is disabled or not.
>=20
> This change should probably be a separate patch with its own
> justification in its commit message.

Yeah, it certainly needs a justification, not just an "oh, btw I did
this". It also invalidates the comment above the function, so that
would need to be changed too.

> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index a2fc952318e9..c3eaa8a55bbe 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -81,21 +81,35 @@ int riscv_early_of_processor_hartid(struct device_n=
ode *node, unsigned long *har
> >   * To achieve this, we walk up the DT tree until we find an active
                                                                 ^^^^^^

> >   * RISC-V core (HART) node and extract the cpuid from it.
> >   */
> > -int riscv_of_parent_hartid(struct device_node *node, unsigned long *ha=
rtid)
> > +static int riscv_of_parent_hartid(struct device_node *node,

--FOD65xhEHS8tTgmj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMqP+wAKCRB4tDGHoIJi
0lh3AQC3eFBSnuEsujkdYBVsE92Pc2O1XtCda+1HBQsxZ2KZIwEA1jFJa2D09Z7n
38T7/YEAvBKqPBgLCeE8Z74ZqqunaAM=
=uU6c
-----END PGP SIGNATURE-----

--FOD65xhEHS8tTgmj--


--===============4196716533341924672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4196716533341924672==--

