Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAF9C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 20:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZVwL+qzypMYJpqy9Gk03XKgpVScKqWmJIHlDf5bVV18=; b=cGJbAzuLdsTjXPO+QEHHCXbDk0
	SHAvXDnf6rm0rN3iI+QxZN2NQ+VD63blEt9NtQt9+7L65MGWZ6Hyfw7dZO0mVcO7fm6qba3f9htiY
	IjiewQnrg/dsKC/bHJ6z9j9jVwdbGjdFdDW9dNFfQuPMXu1GGykGbYLlmbyMP5F8Ncp3NY0GAmwdD
	AToFDpS0mhHZVhVZnqPDI7r2fSyIoMJJzQpfbbT8WNyFlbSh7XYjwraqWVPA+acZ+akFGbEBIcEDS
	C8VseW/ULIAV3W5TbUX3O5WOg66eupvEFHRFEoQc6S9nmIgh5RijTNdrm6ZZOAHwmQWiGecIbe8cZ
	Kdii5nRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0SKG-0000000DyIX-2XS2;
	Fri, 26 Apr 2024 20:37:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0SKD-0000000DyHZ-0hbh;
	Fri, 26 Apr 2024 20:37:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 59415620CE;
	Fri, 26 Apr 2024 20:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE17C113CD;
	Fri, 26 Apr 2024 20:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714163860;
	bh=uPLxJVI4MBITKFrKzxGui7Nb96vhOwcYwnCPWnkGezo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jdP/+3JaWnyFfeXTcEwDCT/0UVK9xvUpyYRChjz/YP2ukIknpPm5gg8HZI0MciSAb
	 R3IlpxmFEjp7qVPox5VmAfGLxhU/PgnyWa+j9gpaQ8nhQ/75nh8tiSO6wsIJiwWZfT
	 OkOAYc5q0dDbk4lpagTHNbYhhkobHUcUPfJhKbJ6Vs8mmIXvvuRWpWDhDRCc18EoZK
	 WaPaRL/ccOPpewVsXYy2x7uXzPQIY3616TLEOxf3ApHEhH0ZSktfHLBVKADtreRcuJ
	 MJpw5R8RlpqNhmgxFJOW3kYyo+ATPJ5+TGQSAaAWvTZRbShOWRLntvaCIfnGobUjzt
	 YY64xdgrPDC0A==
Date: Fri, 26 Apr 2024 21:37:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 08/17] riscv: Introduce vendor variants of extension
 helpers
Message-ID: <20240426-suitable-unsheathe-0c5f5851c891@spud>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
 <20240420-dev-charlie-support_thead_vector_6_9-v3-8-67cff4271d1d@rivosinc.com>
 <20240426-myself-crowbar-99dc0a080cd9@spud>
 <ZiwIBmlaDbYdmv8f@ghost>
MIME-Version: 1.0
In-Reply-To: <ZiwIBmlaDbYdmv8f@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_133741_316133_5AA8EA21 
X-CRM114-Status: GOOD (  19.95  )
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
Content-Type: multipart/mixed; boundary="===============4608166825261396807=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4608166825261396807==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X64VCS2z8liAY+RZ"
Content-Disposition: inline


--X64VCS2z8liAY+RZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 01:01:10PM -0700, Charlie Jenkins wrote:
> On Fri, Apr 26, 2024 at 05:19:59PM +0100, Conor Dooley wrote:
> > On Sat, Apr 20, 2024 at 06:04:40PM -0700, Charlie Jenkins wrote:
> > > @@ -163,6 +164,8 @@ void thead_errata_patch_func(struct alt_entry *be=
gin, struct alt_entry *end,
> > >  	for (alt =3D begin; alt < end; alt++) {
> > >  		if (alt->vendor_id !=3D THEAD_VENDOR_ID)
> > >  			continue;
> > > +		if (alt->patch_id >=3D RISCV_VENDOR_EXT_ALTERNATIVES_BASE)
> > > +			continue;
> >=20
> > >  		if (alt->patch_id >=3D ERRATA_THEAD_NUMBER)
> >=20
> > This number is 2, how does the patching actually work for vendor stuff
> > when the base is always greater than 2?
> >=20
>=20
> Patching is handled through the patcher at the end of cpufeature.c. The
> vendor_id field is set in the alternatives for errata and now also for
> vendor extensions. The vendor extension patching is all handled
> generically.
>=20
> This is distinguished by the patch_id being greater than
> RISCV_VENDOR_EXT_ALTERNATIVES_BASE, which should leave way more than
> enough room for errata ids. Since the code already checks if the
> patch_id is greater than the errata number, I can drop the
> "if (alt->patch_id >=3D RISCV_VENDOR_EXT_ALTERNATIVES_BASE)" check.

Ah, ye, I was being dumb - I was somehow thinking that you were using
the errata patch function to patch this, which obviously wouldn't be a
good design. If that had been the case, you'd never patch anything, but
you patch the extensions using the cpufeature patch function so it all
works out.

If anything, I guess there could be an assert here somewhere that
enforces ERRATA_VENDOR_NUMBER < VENDOR_EXT_BASE.

--X64VCS2z8liAY+RZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiwQjQAKCRB4tDGHoIJi
0tMXAQC2Jy5XWBM1FWNAjh7ocF5y/z1Sjb/6AbsEoZ39m4Y8AAEA+Z85d2KbMCvL
2c+qY4x+XGFCBD5ZSMejeXfez3/DvAs=
=XikS
-----END PGP SIGNATURE-----

--X64VCS2z8liAY+RZ--


--===============4608166825261396807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4608166825261396807==--

