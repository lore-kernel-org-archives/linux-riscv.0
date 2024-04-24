Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F3AC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 15:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fo04CkovIXD72fR58F5xSb316MvKLTon/MIxl+1KGdI=; b=rwzde5q/r6DD+WOQt2uYWtlqTI
	a40nZfO2dRgF86DOMiRX1O1YU3UnrXOIG+1EDtacsJyz0Yb/1eJiNOXk2cPFe//Ax/OqDtAY5rMPa
	opXCyTnJly48SLCDROGU2sFHR9HsShRklY+3Sx3a0d6BIMjnvabb1wFOqU+k91EiEfdgeVXknfOzX
	I/s+38alhMNjYzz2h8NB3gOz8NNE4/1VGuEjNi/+QcxDJDMyoqT4niT/ksfOl64iWeMb6sJI8uwhR
	asUQpHXGi4b68tEC883SqZnzVsVKfSR7mO3Az43ZrQ79r0yUElMZ4Rzx4ovpcYZdyQZk9cuyNXjxo
	eG1JGJHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzeR4-00000004gwo-25C6;
	Wed, 24 Apr 2024 15:21:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzeQr-00000004gpl-0Lps;
	Wed, 24 Apr 2024 15:21:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4D7E661BB9;
	Wed, 24 Apr 2024 15:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47571C113CD;
	Wed, 24 Apr 2024 15:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713972071;
	bh=/l+aim4eVg3tD558UYuMgrS+4aCm5cbypDJqLdx1Ryo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R2AJakrRhQHhabOh9W1Vw+yqbESBngO0TMYtLJnyWOv19ax40paV12wwc6oj5/+BO
	 qlRJZXShH3g+SFh6RW0ypVY3Odj0hOV7KMOAsbC8Xeo2N63RyCfez+DYIpcKI60MxD
	 P2IqNhRaeyZq5E+AShy9ScmlGUfsFSagCh1u8gc28uOs7ftBm90e+R9aWF3QJiCrSh
	 m9cIHGmBp5UXh5d/nR6O2mhRdWn28PdwL3MSVlF3QBImuHxRPxfNUZDb9K1q8TNDPf
	 zuGg6RP0A+91LHr4NDr+Bk1b/QTHOQTfzJUSYb45m94KLqIlgDi1OfLYcYLSUMubFE
	 rMeaZRK3J2Pgw==
Date: Wed, 24 Apr 2024 16:21:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v3 06/17] riscv: Fix extension subset checking
Message-ID: <20240424-gondola-cosmic-b7a02b2a8619@spud>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
 <20240420-dev-charlie-support_thead_vector_6_9-v3-6-67cff4271d1d@rivosinc.com>
 <6c624361-a968-498b-a9fb-ea2aaec70ce8@ghiti.fr>
 <20240424-wildly-goofy-c81aac6f8cd7@spud>
 <ZikhpEgEoMX/rObu@ghost>
MIME-Version: 1.0
In-Reply-To: <ZikhpEgEoMX/rObu@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_082113_237684_702D2647 
X-CRM114-Status: GOOD (  32.13  )
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
Content-Type: multipart/mixed; boundary="===============0611552150617253216=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0611552150617253216==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nD+3DKOIzzyPJcNe"
Content-Disposition: inline


--nD+3DKOIzzyPJcNe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 11:13:40AM -0400, Charlie Jenkins wrote:
> On Wed, Apr 24, 2024 at 03:51:54PM +0100, Conor Dooley wrote:
> > On Wed, Apr 24, 2024 at 04:22:02PM +0200, Alexandre Ghiti wrote:
> > > Hi Charlie,
> > >=20
> > > On 21/04/2024 03:04, Charlie Jenkins wrote:
> > > > This loop is supposed to check if ext->subset_ext_ids[j] is valid, =
rather
> > > > than if ext->subset_ext_ids[i] is valid, before setting the extensi=
on
> > > > id ext->subset_ext_ids[j] in isainfo->isa.
> > > >=20
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > Fixes: 0d8295ed975b ("riscv: add ISA extension parsing for scalar c=
rypto")
> > > > ---
> > > >   arch/riscv/kernel/cpufeature.c | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpu=
feature.c
> > > > index 48874aac4871..b537731cadef 100644
> > > > --- a/arch/riscv/kernel/cpufeature.c
> > > > +++ b/arch/riscv/kernel/cpufeature.c
> > > > @@ -609,7 +609,7 @@ static int __init riscv_fill_hwcap_from_ext_lis=
t(unsigned long *isa2hwcap)
> > > >   			if (ext->subset_ext_size) {
> > > >   				for (int j =3D 0; j < ext->subset_ext_size; j++) {
> > > > -					if (riscv_isa_extension_check(ext->subset_ext_ids[i]))
> > > > +					if (riscv_isa_extension_check(ext->subset_ext_ids[j]))
> > > >   						set_bit(ext->subset_ext_ids[j], isainfo->isa);
> > > >   				}
> > > >   			}
> > > >=20
> > >=20
> > > I think this should go into -fixes, let's check with Palmer if he wan=
ts to
> > > take this patch only or if you should send the patch on its own.
> >=20
> > I think splitting out this and patch 1 into a new series targeting fixes
> > would probably make things clearer?
>=20
> Okay I can do that. I will give it a bit more time before I send this
> series split into two to allow time for the rest of the patches to
> gather comments so I avoid sending too many duplicate patches.

Ye, I do hope to get back to this series later in the week when I have
time to actually read through all of the patches in detail.

However, you wouldn't have to resend both parts of the series - you can
just split out the fixes portion and send that, leaving the rest of the
series sitting on the list to gather comments.

--nD+3DKOIzzyPJcNe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZikjYQAKCRB4tDGHoIJi
0vMQAP9maA50ULDUWJSbR/H0kPheLWbahRSLOt4mOCRfE2UuSwD/bKM2SV4XWfF6
LnzrLv6vAQLZ4EwZ5d4MDmnjwTGjMwU=
=ENki
-----END PGP SIGNATURE-----

--nD+3DKOIzzyPJcNe--


--===============0611552150617253216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0611552150617253216==--

