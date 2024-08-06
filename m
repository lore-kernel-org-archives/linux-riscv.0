Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A34C52D70
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 17:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYEOJmJ/lTC4dEzgIcJKd67h4GEmIGTvCWKC9Ru62OU=; b=rTMlRRVJBTxxJTSElkR0dieAHB
	X4NKfGgNEzJSVyfAhGWjsdpj5giYg8l64geV+cEmRQy8oLdVt4w9KUBrM1UrM5m0t2x39c9E52Myi
	dtv7ed4xaK3qe8g47S82woWKPz8vcFO1RQrzL9jpIrFI2L34buw2OXLu/c2fFsISIN0yMiNO8QgMp
	QAE6O74piaRXY5fpnovFrjJjwdm3hEVSFutA8dMifhSD2DX2qqrl3HI1cBalMydcB7HMDgs9ES219
	lpYzblJ+mRf2A6lRV4/WtlS9PyqbUNxcGR5Mm5MOEpYotv7a5OUC6j6LFoetyPmBdM7AO0NMFn8i+
	qZ6xf9Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbNvH-00000002U6s-2ZfD;
	Tue, 06 Aug 2024 17:24:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbNvF-00000002U65-0GBy
	for linux-riscv@lists.infradead.org;
	Tue, 06 Aug 2024 17:24:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 32CB5CE0EC4;
	Tue,  6 Aug 2024 17:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251CCC32786;
	Tue,  6 Aug 2024 17:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722965068;
	bh=wPSRzRGpwzmF82mrv16loYp6AIiurWjq69qMI7IdNjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MT9lOAVT/MW5+lKZD86HtDMYtX+lUJ4jVxLv6qHLRXYRvNAlABzMXBKj8m95OtZSl
	 vRxHJZdv/sEY121ed37HSh6fR6F6sqxtWQOI5pFI4G9X1cs8kgKNXGY4qJHOX66WRZ
	 GaDrku53SSEKzjR+0uRZoWBkUD5EtFK2svhO6Dkks329pkia9vY0O1+XSVh/xegXuS
	 8LRbOtBTElzmfjiEyeAW2dR3WsUDzmQ6N9jtcc+nN032JFIU3wFBxIDCNOpWCtOFHN
	 ArrFvUIYeurTB4yW42lLnQt0dO8eJThG9ZbS9GevKXGjetR6/wOdJD9Y+1K9QZ0L1N
	 iVKwoogYU9A/w==
Date: Tue, 6 Aug 2024 18:24:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC v7 5/6] gpio: mpfs: pass gpio line number as irq data
Message-ID: <20240806-baking-frustrate-32d0af5ed39c@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-handoff-race-33160609553f@wendy>
 <CACRpkdYdxdLG8=_Xd7HLwQ5+pxwGw6Xte7=UNbknB8HR474bcQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdYdxdLG8=_Xd7HLwQ5+pxwGw6Xte7=UNbknB8HR474bcQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_102433_301767_71AD5903 
X-CRM114-Status: GOOD (  17.95  )
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
Content-Type: multipart/mixed; boundary="===============5020394576162674057=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5020394576162674057==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DLvlmKu678eDGQat"
Content-Disposition: inline


--DLvlmKu678eDGQat
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2024 at 10:11:09AM +0200, Linus Walleij wrote:
> Hi Conor,
>=20
> thanks for your patch!
>=20
> On Tue, Jul 23, 2024 at 1:28=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
>=20
> > Since the interrupt mux is going to provide us a 1:1 mapping for
> > interrupts, and it is no longer correct to hit all of the set bits in
> > the interrupt handler, store the GPIO that "owns" an interrupt in its
> > data pointer, so that we can determine which bit to clear.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> I don't quite get this, the irqchip of the GPIO is clearly hard-coded
> hierarchical, then why don't you:
>=20
> select IRQ_DOMAIN_HIERARCHY
>=20
> And use e.g. girq->child_to_parent_hwirq() to handle the
> hierarchy?
>=20
> See drivers/gpio/gpio-ixp4xx.c for a simple example of a hierarchical
> GPIO interrupt controller.

Cool, I'll check that out. I've got some re-figuring out of the
interrupt controller to do given Thomas' comment there. Maybe the
combination will solve the horrible % 32 hack...

Cheers,
Conor.

--DLvlmKu678eDGQat
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrJcRwAKCRB4tDGHoIJi
0uwCAP9KBPLktC1E1wnlwW7qvgZUaqUS4vNcQJ5ncTOE0NAcpgEA1Fb78h/UyI/0
zjV8D2T7x8EesEC+pTd1Pr7+5l8KsAs=
=8WPg
-----END PGP SIGNATURE-----

--DLvlmKu678eDGQat--


--===============5020394576162674057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5020394576162674057==--

