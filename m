Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153BFC05027
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 21:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUyus7O5+jdj8GBsTqmjQZz2qZPEl5fadtgO+9W2ZEE=; b=xR4jrBTWKD9waYf0Gfw1aVxsVp
	iD/FOGuGsmWk2jWSJssxGgks/QyhQjPpwCGm9L4mN3EqGZk2oAVP7UmAJT+W1+D0jBtva5NTPUmBG
	JQBKYWoeDgyicfA8Hc8wukeYXGOGugJBdvXDm2ugy6+Ocu5ShyvTxRI+CyOjzpe6PFjix/2NWWT/7
	EaNI/GxZpgbwYBAtEHFIlIKrKluLt/ZXOCv29/y31ngi9Y2KM3SKuYeN9Ra7ZB/i69zRtT32RPu32
	j5BShF0IP7PwsjY9t4P6xVchUgNZrxveez0xwwZZoCzASm+5G3OHIM47VoKpjWxB0YJ43fL6U/zVl
	DlDQ8ETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQaVS-007WyU-CA; Fri, 10 Feb 2023 21:00:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQa1N-007Ooc-9o; Fri, 10 Feb 2023 20:29:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A5675B825AF;
	Fri, 10 Feb 2023 20:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88680C433D2;
	Fri, 10 Feb 2023 20:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676060960;
	bh=awvndo+mybz2kVTD7nD6CvCPAo8Dbu9CN95oGBexSLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yfzs0irKw93PU4uYAGv0q1twSy1cKOM+IrcBYBoUhYBztneR8QwGMdlF5JEyykIo4
	 xN+Z2ISKx4AokaV7XTPOJ8iIQ9+eCaIYnEFCtP0rYEkoYQM7EgzCV+6glS5t0xtU7h
	 fAeYN+MS2liBp/SKFZnx/B8JLwhA3cbqlNxLyKjlNDk3365RPp3IEdMdhrMsQUDTqu
	 FfNC/V9G7VQ8p/TW5bTP7WkpeAfrBjwZIYeXYDkVYsG0AFcDL7WvKGWGcW3PCx0wQV
	 zI9/fgID6QrHWuUQZZcu0AWaeiMRp+zXYd0fhvM0hFrRW8oJ/kmw3/f9ZQwnsx3DWn
	 wGgmO3SWThSQg==
Date: Fri, 10 Feb 2023 20:29:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, 'Anup Patel ' <apatel@ventanamicro.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Rob Herring ' <robh@kernel.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Conor Dooley ' <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 5/8] RISC-V: cpufeature: Put vendor_id to work
Message-ID: <Y+apG/nVSLJY8nsN@spud>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
 <20230209152628.129914-6-ajones@ventanamicro.com>
 <Y+VD2/owMIvqzOx8@spud>
 <20230210075818.chh5myc2tmcvjplc@orel>
MIME-Version: 1.0
In-Reply-To: <20230210075818.chh5myc2tmcvjplc@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_122925_725204_789E3937 
X-CRM114-Status: GOOD (  28.07  )
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
Content-Type: multipart/mixed; boundary="===============2767952802158378879=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2767952802158378879==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7xsCUnNAv8LreRDc"
Content-Disposition: inline


--7xsCUnNAv8LreRDc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2023 at 08:58:18AM +0100, Andrew Jones wrote:
> On Thu, Feb 09, 2023 at 07:04:59PM +0000, Conor Dooley wrote:
> > On Thu, Feb 09, 2023 at 04:26:25PM +0100, Andrew Jones wrote:

> > > +static bool riscv_cpufeature_application_check(u32 feature, u16 data)
> > > +{
> > > +	return data =3D=3D 0;
> > > +}
> > > +
> > >  void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *=
begin,
> > >  						  struct alt_entry *end,
> > >  						  unsigned int stage)
> > > @@ -289,8 +294,6 @@ void __init_or_module riscv_cpufeature_patch_func=
(struct alt_entry *begin,
> > >  		return;
> > > =20
> > >  	for (alt =3D begin; alt < end; alt++) {
> > > -		if (alt->vendor_id !=3D 0)
> > > -			continue;
> >=20
> > Can you remind me what makes this "safe"?
> > My understanding was that a vendor_id of zero was safe, as zero is
> > reserved in JEDEC.
> > What is stopping someone stuffing this with a given value and
> > colliding with a real vendor's errata?
> >=20
> > 	for (alt =3D begin; alt < end; alt++) {
> > 		if (alt->vendor_id !=3D A_VENDOR_ID)
> > 			continue;
> > 		if (alt->errata_id >=3D ERRATA_A_NUMBER)
> > 			continue;
> >=20
> > 		tmp =3D (1U << alt->errata_id);
> > 		if (cpu_req_errata & tmp) {
> > 			oldptr =3D ALT_OLD_PTR(alt);
> > 			altptr =3D ALT_ALT_PTR(alt);
> >=20
> > 			/* On vm-alternatives, the mmu isn't running yet */
> > 			if (stage =3D=3D RISCV_ALTERNATIVES_EARLY_BOOT)
> > 				memcpy((void *)__pa_symbol(oldptr),
> > 				       (void *)__pa_symbol(altptr),
> > 				       alt->alt_len);
> > 			else
> > 				patch_text_nosync(oldptr, altptr, alt->alt_len);
> > 		}
> > 	}
> >=20
> > I've probably just missing something, my brain swapped out alternatives
> > the other week. Hopefully whatever I missed isn't embarrassingly obviou=
s!
>=20
> You're right. I was assuming the errata_id space for errata didn't overlap
> with the errata_id space for cpufeatures. It doesn't, atm, but by luck,
> not design. I could try to ensure that somehow, but probably the better
> approach would be to use the upper bits of errata_id for the application
> data and to leave vendor_id alone. Thanks for catching my oversight!

Sounds like a better idea at least.
I suppose the ideal would be to add another arg and not abuse things,
but maybe that's one for the future, idk.
Is this somewhere that an assertion should be used to make sure that
we don't grow the list of extensions such that the regions collide?


--7xsCUnNAv8LreRDc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+apGgAKCRB4tDGHoIJi
0vyLAQDpS9n7LVVJt8LlcNnOTLvjLUeaZrmjq28+8ehSZqXxqQEAwHeXU7iYR7dU
mYzMTnLj5cqwE5sI2nPAqz70mM6LJww=
=Xv4r
-----END PGP SIGNATURE-----

--7xsCUnNAv8LreRDc--


--===============2767952802158378879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2767952802158378879==--

