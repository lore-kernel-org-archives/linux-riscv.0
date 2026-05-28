Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F164DCD4F54
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 22:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5/OZtRSO00bX8NlH6DdQ2lTxAxCDsXlZxV9Dt8pCe4=; b=2poH3j+1TIq1Jt02O3bULN+CFZ
	qNZtL/cvw2a2+s5DeVcOVKpDUi8WMXheqNJzC/RyjneoOMSsNEaZO/aaQVigaF/cL3xHCqNKAhrG9
	QPHcHlCGhqIg8bAcdMu2tceBVtLt2Wi8WGZw+J7uXowYx51YqyRYJOdcNXsXqggMYewYRDtYTcqee
	3a/lDg1UVr7V4CYruJybGCCwwkZXUQ5bzR5aoJhLVh9Rvmu3YQQ9Ucy0WxBa02PEISd6e6iXAvFSi
	CFxB2DPgOWqEmM3OPU58Et44itTZc2I59rigvpJQycaIMpwm6Xhj8DPC6IfgQjFefb5LPP3HSft6X
	cbnQ40oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSjJQ-00000006UPB-30cJ;
	Thu, 28 May 2026 22:34:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSjJN-00000006UOZ-1RbN
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 22:34:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CC22740B17;
	Thu, 28 May 2026 22:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 990D61F000E9;
	Thu, 28 May 2026 22:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780007684;
	bh=T+A8B0Lkq8CucUJxIXZD63zdSoO1bk3N54bukijHHms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wixk+w0zrDvzUA9+b715i8Nur/PrQSMHRzRElj+lxfCwP2zEBGYfdtDffUNEG2gEz
	 mcrTTh9lXiLPw6iEFXOPBgNqjmx5pp0CRQLy7miWuMmgqZ2UkTLe6uA9vwEw0WUn6w
	 08eeTuPI45sC8JYHcgyqYR2qPqDt/z6eADE9v0kPx7ExN0U+GAMPR+FHtnWJzaLbAZ
	 0T8ZkEAlVLDRqCM58Vdd4S5du5fRVxI7JvMDo7OZUsVpL8KsYUvND+QDo/2fryq7lY
	 Zyil7d9oGYL2nrSETAwqRDmpeWQMzR1u74OKEwl5/ynx2hzRq+C8yepizpdIUXiPbD
	 aG/KrVbf6hL/Q==
Date: Thu, 28 May 2026 23:34:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Lars Randers <lranders@mail.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Valentina.FernandezAlanis@microchip.com
Subject: Re: [RFC] hwmon: add a driver for the temp/voltage sensor on
 PolarFire SoC
Message-ID: <20260528-defog-lasso-84891a72775a@spud>
References: <20260527-earring-bully-eb4a268c2e68@spud>
 <b49d4781-0827-4f26-9ca2-ccd177f90237@roeck-us.net>
MIME-Version: 1.0
In-Reply-To: <b49d4781-0827-4f26-9ca2-ccd177f90237@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_153445_422729_975990BF 
X-CRM114-Status: GOOD (  25.17  )
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
Content-Type: multipart/mixed; boundary="===============9191623384967513427=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9191623384967513427==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/dY6UJR7eVAiYQsM"
Content-Disposition: inline


--/dY6UJR7eVAiYQsM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 09:07:20PM -0700, Guenter Roeck wrote:
> On Wed, May 27, 2026 at 10:06:11AM +0100, Conor Dooley wrote:
> > From: Lars Randers <lranders@mail.dk>
> >=20
> > Add a driver for the temperature and voltage sensors on PolarFire SoC.
> > The temperature reports how hot the die is, and the voltages are the
> > SoC's 1.05, 1.8 and 2.5 volt rails respectively.
> >=20
> > The hardware supports alarms in theory, but there is an unconfirmed
> > erratum that prevents clearing them once triggered, so no support is
> > added.
> >=20
> > The hardware measures voltage with 16 bits, of which 1 is a sign bit and
> > the remainder holds the voltage as a fixed point integer value. It's
> > improbable that the hardware will work if the voltages are negative, so
> > the driver ignores the sign bits.
> >=20
> > There's no dt support etc here because this is the child of a simple-mfd
> > syscon.
> >=20
> > Signed-off-by: Lars Randers <lranders@mail.dk>
> > Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > Guenter, there's one question here about the unit that update_interval
> > is in, I didn't see anyone else using us, but I assume that's okay since
> > the resolution that ms would give would be 8 steps only?
> > RFC cos the question is also in the driver as a comment.
> >=20
>=20
> That just came up in a different context. We'll add a new standard attrib=
ute
> update_interval_us. The existing attribute MUST use ms. Everything else
> would be an ABI violation.

Cool. Sounds like Ferdinand is working on that based on the other
thread.

Do you think I should support both update_interval and update_interval_us in
this driver?

If yes, should I do the ms version now and add the us version later once
Ferdinand's work is complete?

Cheers,
Conor.

--/dY6UJR7eVAiYQsM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahjDAAAKCRB4tDGHoIJi
0umqAQCFXSx/b46Px06mubHpDqQJZ3Dlo4pIUwEr8Pe8FDNJVQD/SkBJj7iAvvsa
IVlWnxRmcMZb0DAcbwlLRhhdwJdPOgc=
=0zap
-----END PGP SIGNATURE-----

--/dY6UJR7eVAiYQsM--


--===============9191623384967513427==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9191623384967513427==--

