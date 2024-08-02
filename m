Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9700BC3DA49
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 08:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eV2azmOJ09jGA/8YQjal5IdzScC1Xcsbd0Arx6iZbJo=; b=ir5Va98Zt55E2gSIB+JnNIJmsF
	fDEh+IQvaQGqarCyg+PgHRcuMomk6Of/hEMCTgP7c1Zt7c1TJ1nTFs4SFNFt6Idr63iJBf7UAtF0D
	z5L4bRTCfdj2eeNa1bY5WhryEaHeJd6T3AhfcbHlXJOe/1ZUHdWUCmT0zkTIyl5l6WX14NcZ7fnQ+
	m+A1JRxnMgO+54DGSp8T41lD/aONjf0mFJlBMiOiRYUasym7z+8xHW5O5/DN9BeomLI0mUnysoOV/
	CRiV6R3bPbEnMkVPlpCTaT4rTCkWsBeOGsycrap8vsymIPWjJlfHbFVky/CwS7FKMybQMxynqtBRF
	c9gNH6zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZnL6-000000083eD-3kEw;
	Fri, 02 Aug 2024 08:08:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZnL4-000000083dZ-2LJ4
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 08:08:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A21B3629DB;
	Fri,  2 Aug 2024 08:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E191C32782;
	Fri,  2 Aug 2024 08:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722586117;
	bh=FsH3wdtcvgjhgqn/vSYrToks9tDfFD/g6p47+4HujaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rwm8/92ZOEienicTuhNeHn1BDzsUuaqNfkgUmv7ZS/UVNhlkK8lyge0Viw9rT223I
	 l+yFXEzO+PUYPeeFhNAntoTMz5pAIjZ9nIL/o4u/OVs+iEyr4C7GswpSbDHK1P86jc
	 k107v7h8c2I+JuT3bkKtRQ+w2UdIVW0ThJH46cXrmgEaAK5gjqzRQ8zQeEICkbdC1R
	 NuNK68ASsCQ8UM11W4sc+9JdIso37yG3cI5SHkj8l/zOQd00zeVDJ/TjWIezKwryU0
	 Q1tMbr5alcN33lMXyUgBskpxEKSrt6fpZI9XLV5afs0CTmJK2xzuyNtq2ipNf5ewAN
	 Byds7sIy/BBcg==
Date: Fri, 2 Aug 2024 09:08:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC v7 3/6] irqchip: add mpfs gpio interrupt mux
Message-ID: <20240802-rippling-clubbing-5318f914f16a@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-flatworm-cornflake-8023212f6584@wendy>
 <87le1k8oq2.ffs@tglx>
 <20240801-palpitate-swinger-7bc8ae8deaaf@spud>
 <87r0b82i57.ffs@tglx>
MIME-Version: 1.0
In-Reply-To: <87r0b82i57.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_010838_682915_EE0C4F57 
X-CRM114-Status: GOOD (  17.91  )
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
Content-Type: multipart/mixed; boundary="===============2581778377874267306=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2581778377874267306==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xOPLd7jspMNzpBg/"
Content-Disposition: inline


--xOPLd7jspMNzpBg/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 01, 2024 at 08:49:08PM +0200, Thomas Gleixner wrote:
> On Thu, Aug 01 2024 at 16:09, Conor Dooley wrote:
> > On Mon, Jul 29, 2024 at 12:41:25PM +0200, Thomas Gleixner wrote:
> >> > +	/*
> >> > +	 * If a bit is set in the mux, GPIO the corresponding interrupt fr=
om
> >> > +	 * controller 2 is direct and that controllers 0 or 1 is muxed.
> >>=20
> >> This is not a coherent sentence.
> >
> > It should read "controller 0 or 1;s interrupt is muxed". Does that make

Heh, I even typoed here, the ; should be a '.

> > more sense to you?
>=20
> No: If a bit is set in the mux, GPIO the corresponding...
>=20
> I'm already failing at 'GPIO'. My parser expects a verb there :)

Ah, so double mistake in the sentence. s/GPIO// I suppose. An updated
comment could be:

"If a bit is set in the mux, the corresponding interrupt from GPIO
controller 2 is direct and controller 0 or 1's interrupt is muxed"

--xOPLd7jspMNzpBg/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqyUAAAKCRB4tDGHoIJi
0tJiAQDK/ooWrAM9WcdKj0bqR5Zx9ER6sCblcL1m6FezXQWh7wEAiwKCvoyld4er
8BIEk1XDwZm2ul8Wx7vA1q98pn9HHwQ=
=8fH1
-----END PGP SIGNATURE-----

--xOPLd7jspMNzpBg/--


--===============2581778377874267306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2581778377874267306==--

