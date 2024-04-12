Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41518C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 20:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymNcw63pniGRgfLulrxBvA+LR8eXszs9x7VrVqUp4UM=; b=AemfNJCbWgnRfWHg7+b3K5nVmP
	Iy4yKfRK9zfSk6/x2XOfiFozaFKk691fJF0bCxJQ8UPzpvnXxyICcj+V+DVDC8uhFCPLeKD4n3UYs
	Qc2CcKSpqXojxY0QMQLszNPC42Ph49RvgU/cJYpXhvu91FOkXTB45Zbti+s346TKgUQhwktKooCXY
	RKjGtKYGSeQYmtyiY/ElDucvydiIUoOtyfPEWnjn/WU/pKaIz1Dzx61HbL756AHtHUvKjwM+IiMBw
	o9js8HWP2pjJB7ZQt2tDD8oT09UuUfiJ/zKjPmpKj6tdc+xHD9bqLJpQlhPQCbdBebUtLXrdFqeG7
	ZOJioaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvNh5-00000001ETi-1R5g;
	Fri, 12 Apr 2024 20:40:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvNh0-00000001EQb-0VJ6;
	Fri, 12 Apr 2024 20:40:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7BFFCCE3AD1;
	Fri, 12 Apr 2024 20:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F638C113CC;
	Fri, 12 Apr 2024 20:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712954410;
	bh=Wgrizvi5A+bU/saW/WglETWFAcMfROK+Fq7L/emRDFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DLrZrrOErntm7dx7brDVgtbc8YFE2ZWlhntzOKdzavzwbiPxdU4SxE5N0s99Lv7nF
	 8v8rtZVaBDWLs2oX+WlaoolC6mQtDz3xrrt+8xqMRhypWjiJkT1lwLEYj7FzFUR57Z
	 IBmXiSjqFroWZ8UpPhH0TOiv485z8A6gHEzoxvpwyLb5qHAP6frHZmj3Rm4YznYeQq
	 TU+oWLs44WYtvFqwjIXj6y7khsPUAazL+HE/zPLZo9mqLjCvhjzzhXMpNemVImfRlq
	 /0BApQnILlJ+SoD9dCK7n5cP3xfmyXobojk7lVgDwwuLKCZdOPB4oeheH2wz5vnDqo
	 mOuxra2m04tsg==
Date: Fri, 12 Apr 2024 21:40:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 08/19] riscv: Introduce vendor variants of extension
 helpers
Message-ID: <20240412-drab-french-55d8ff2c8cfa@spud>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-8-4af9815ec746@rivosinc.com>
 <20240412-dwarf-shower-5a7300fcd283@wendy>
 <ZhlypvTdsFPZBr08@ghost>
MIME-Version: 1.0
In-Reply-To: <ZhlypvTdsFPZBr08@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_134014_541910_11A2B3DD 
X-CRM114-Status: GOOD (  25.36  )
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
Content-Type: multipart/mixed; boundary="===============3055803537072904739=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3055803537072904739==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aP1C8yQRrFgLdfM0"
Content-Disposition: inline


--aP1C8yQRrFgLdfM0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 10:43:02AM -0700, Charlie Jenkins wrote:
> On Fri, Apr 12, 2024 at 12:49:57PM +0100, Conor Dooley wrote:
> > On Thu, Apr 11, 2024 at 09:11:14PM -0700, Charlie Jenkins wrote:
> > > Create vendor variants of the existing extension helpers. If the
> > > existing functions were instead modified to support vendor extensions=
, a
> > > branch based on the ext value being greater than
> > > RISCV_ISA_VENDOR_EXT_BASE would have to be introduced. This additional
> > > branch would have an unnecessary performance impact.
> > >=20
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> >=20
> > I've not looked at the "main" patch in the series that adds all of the
> > probing and structures for representing this info yet beyond a cursory
> > glance, but it feels like we're duplicating a bunch of infrastructure
> > here before it is necessary. The IDs are all internal to Linux, so I'd
> > rather we kept everything in the same structure until we have more than
> > a handful of vendor extensions. With this patch (and the theadpmu stuff)
> > we will have three vendor extensions which feels like a drop in the
> > bucket compared to the standard ones.
>=20
> It is not duplicating infrastructure. If we merge this into the existing
> infrastructure, we would be littering if (ext > RISCV_ISA_VENDOR_EXT_BASE)
> in __riscv_isa_extension_available. This is particularily important
> exactly because we have so few vendor extensions currently so this check
> would be irrelevant in the vast majority of cases.

That's only because of your implementation. The existing vendor extension
works fine without this littering. That's another thing actually, you
forgot to convert over the user we already have :)

> It is also unecessary to push off the refactoring until we have some
> "sufficient" amount of vendor extensions to deem changing the
> infrastructure when I already have the patch available here. This does
> not introduce any extra overhead to existing functions and will be able
> to support vendors into the future.

Yeah, maybe that's true but this was my gut reaction before reading the
other patch in detail (which I've still yet to do).

--aP1C8yQRrFgLdfM0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhmcIwAKCRB4tDGHoIJi
0mfZAP4qEWVgp1JuIP38Uolxn+eUBjm/iYTlV1+a2fJsENNWWgD/eG4awqACrOj8
2zrdJWUXuGon9BtRXw8OxMYkhWD0JAU=
=y7fd
-----END PGP SIGNATURE-----

--aP1C8yQRrFgLdfM0--


--===============3055803537072904739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3055803537072904739==--

