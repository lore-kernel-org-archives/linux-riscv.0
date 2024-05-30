Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C02C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 21:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hx8RrxUwxnUyrhj5SbNyDXGXS2/B65IdrMsbOtWGgyY=; b=4F/10dnrQoB1grzSMg4dJNSFtB
	sncbRgzt5opH/HBY51vhwYJn4x26elQT5S/4GYGHoyZ3Vq7HZzTnGeMJFLTzAPkktfSGbAQBORo18
	Gwyvqa4WVcx4eC9zz8kcEa4pWVsHyco7Y01oSF2mdUJiQPvgSH95Qe4/0Pb5vDAaZGDdZD4E1BDg6
	sM89N7YuqIuPr120E6n6qKU1jcZxrRydiUvwBVfS4w8IHTVe6MAtRirsv0/+H719ZVNypArsArKlI
	XDu1Teo6+aaO7qpq5D3ux6cLEyeqtMLHClGT6ZF7HBis3bdih7Fg7eJWkJ4hw4QJocdustI8EAjDy
	cofo2JvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCnjv-00000008WSw-3eBA;
	Thu, 30 May 2024 21:55:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCnjs-00000008WSG-3S70
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 21:55:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3962DCE1B7E;
	Thu, 30 May 2024 21:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9753CC2BBFC;
	Thu, 30 May 2024 21:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717106109;
	bh=/VfaV/85ip1/Lj37F3db092taXFOC4P5Olaax8eSKGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kZQ4mxtPBvXvCeNYWUR960jdhWfNHrKSc6bPcA7sMKru1eZHTHDJKG3aKjH6LKfRq
	 BZDEpq8uhdWWPRDT1eD7klYULUHB4lKNmmn32sNNNF00rPzBYMPrCo9UO0EZKwqVNR
	 C7YrmeptnX5uuJD1i6wlO7W5l6P08k8ii8xOwC8Q/SfjdnSrxqt2fJjgtmtzmHcjO4
	 gmHytnkZ3BygZJQM+iLZdI3X19qMira65xrhpnNU1o+1bQRaPII/3npFey5IGcZWg5
	 fTcHGst5oHyNEcR897cFnzW+SF8JIF/wCALlcQB3qQMIusaYlEao9vDCA81l6iQzpG
	 8MbaiarDzZidg==
Date: Thu, 30 May 2024 22:55:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: andy.chiu@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>, guoren@kernel.org,
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net,
	Evan Green <evan@rivosinc.com>, cleger@rivosinc.com,
	shuah@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, vincent.chen@sifive.com,
	greentime.hu@sifive.com, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 6/8] riscv: hwprobe: add zve Vector subextensions into
 hwprobe interface
Message-ID: <20240530-daylong-pelican-74ccadb9811f@spud>
References: <20240510-zve-detection-v5-6-0711bdd26c12@sifive.com>
 <mhng-0679629d-d115-44ae-a33a-bf42980c7686@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-0679629d-d115-44ae-a33a-bf42980c7686@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_145513_254210_3202B8C5 
X-CRM114-Status: GOOD (  24.75  )
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
Content-Type: multipart/mixed; boundary="===============5830769062369202807=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5830769062369202807==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="54amDOCv5zaovVhC"
Content-Disposition: inline


--54amDOCv5zaovVhC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 02:35:51PM -0700, Palmer Dabbelt wrote:
> On Thu, 09 May 2024 09:26:56 PDT (-0700), andy.chiu@sifive.com wrote:
> > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hw=
probe.c
> > index 969ef3d59dbe..35390b4a5a17 100644
> > --- a/arch/riscv/kernel/sys_hwprobe.c
> > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > @@ -114,6 +114,11 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe =
*pair,
> >  		EXT_KEY(ZIHINTPAUSE);
> >=20
> >  		if (has_vector()) {
> > +			EXT_KEY(ZVE32X);
> > +			EXT_KEY(ZVE32F);
> > +			EXT_KEY(ZVE64X);
> > +			EXT_KEY(ZVE64F);
> > +			EXT_KEY(ZVE64D);
> >  			EXT_KEY(ZVBB);
> >  			EXT_KEY(ZVBC);
> >  			EXT_KEY(ZVKB);
>=20
> Conor left a comment over here <https://lore.kernel.org/all/20240510-zve-=
detection-v5-6-0711bdd26c12@sifive.com/>.

This link is to the patch you're replying to, not anything from me.
I commented on a bunch of stuff in v4, but not this patch - generally I
ignore hwprobe to be honest...

> I think the best bet is to just merge this v5 on for-next now, though --
> there's a bunch of patch sets touching ISA string parsing and IIUC that
> sub-extension parsing stuff is a pre-existing issue, and Clement's patch =
set
> still has some outstanding feedback to address.
>=20
> So I think if we just go with this we're not regressing anything, we just
> have a bit more to clean up.  Maybe it's a little uglier now that userspa=
ce
> can see the sub-extensions, but I'd bet wacky ISA strings will be able to
> confuse us for a while.

I wanna do some cleanup stuff w/ Clements series applied, if that's what
you were talking about, but I don't see much point starting that until
the cpufeature stuff has calmed down - Charlie's and Clement's series
really need to be in for-next for it to be worth doing.

> I staged this so I can throw it at the tester, LMK if anyone has issues
> otherwise it'll show up on for-next.

--54amDOCv5zaovVhC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlj1twAKCRB4tDGHoIJi
0m7+AQCuLCvXdrPloK2ge546WprTaktc5AJayKqwle2CbRg+qAEAimwmspM+d7gX
w2SCZjy28pKq6A7bDCxZ9Jlu+kWWdwM=
=N8Bg
-----END PGP SIGNATURE-----

--54amDOCv5zaovVhC--


--===============5830769062369202807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5830769062369202807==--

