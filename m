Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21C2606A323
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 03:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dXfBj0Kp;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=K3RTbP3D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:To:From:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DP9qfjeL+o3RPhONoOes2XE4o0w65IJqevyUO638xw=; b=dXfBj0KpbCLmTg/47URBu2IRAR
	NLSuLNyi5FCOrI98BcS5Dg0U01pMNh9vuOk7Az4TxKli+a8NvUsFAHurGNhmiIXJXCKw6iw1q82w8
	p60PpohpRGs3FnDgNi4pIZJ4dd9cn57BEQMBgA4nqa/vR8TvxoL+5nM24w4e1JYN9JKAuBeZWiyY5
	lgZCy+E0Sw+AwkWM3HHw+SIECrAEc663dp5Az+q3XKL6+LXQvYwNT4KUZsJYD5+NA8e3NU4UEtzuJ
	wjIa4nmm8b8gaigbL/WDCwFm5qeNrI53YULUz0SyaXAnKYJpbu5A94lV7AdOJguQ9eyDIKb/sVfjM
	0hGgjUBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJjLB-0000000DGiK-0qU9;
	Thu, 22 Oct 2026 03:19:41 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJjL7-0000000DGhY-3K94
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 03:19:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792639125;
	bh=/JUTPTDl3DvoEWfToW36E2HDw8Rwl5aay5g6qHBleZg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=K3RTbP3Dm/Q3Rza4/lthR/aT2EctP713zqvnPliF61BdUkqDZ41G5jvFU8XGPNFOE
	 celuf1OoYn4AdldWov5SzOtb2PpKE9qb85yyP6biAqZGstMPtLiC9Ycsi8yemFP6xk
	 uC4/i5CftAO4pG6LW8jds7wZ3GlhuuT1pguIU6cA=
X-QQ-mid: esmtpgz16t1792639123tafb198f4
X-QQ-Originating-IP: ICPxySEftKnBISmNiBeiOIrTueBfjfFOrGVxa1s5a28=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 22 Oct 2026 11:18:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6102986534664089495
EX-QQ-RecipientCnt: 14
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Thu, 22 Oct 2026 11:18:38 +0800
Message-Id: <DMB1J6C0UYAM.SN46HDB4HISY@linux.spacemit.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261020081633.3673704-1-sandie.cao@deepcomputing.io>
 <20261020082015.3673761-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20261020082015.3673761-1-sandie.cao@deepcomputing.io>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MesT5uKpDagV05sbWBvphgIIaUqm9aAcHXKrfqA+ewpXGHniyYVPU/Jj
	DVSj2DkPBFVbUBbo7bi1CAaREaMHOVe+WaPgrIU5Uj5NkyAnQ18jFd7tRU+/M1MQ3kN6zPl
	+nHfbp9Sr7YwvG6vYWQGtKZ9OQzhG8l6OnySOPk319To75+wTVGhKHSgYTJDzy7Ur3TxpvO
	qXXmAaZOIqVFu3NtdG7Bg/9vb0zkbGRsEUf7mA1KTUYYqFw3VjjxsiMi4mjKNYw7h3tK6mA
	k/hnsXbyHrsoV8C3EQu7JF9JwQ3Qm0j4L2WfDfJViPZZC9I7NztQ7hElfRQM1T9VCcJwqwi
	7erHQNHrQM2soOzq5YDF054IANw0/APucgMcZBuqeYKEz9rUnsn2wLbjBzCVizeU3GLscny
	7oLy2CcoXw43kKLGDcVXBm3TqT0L3Ij8X6/RLYVHYOCGqmACmlqGb9AWG5e9EWmfOcwC5st
	BKE9/+MLkBCsLBHM7iHl7f4AtsKHBSSwd1p/d4YTbNBsgIMLCYZcsiR2cPuvQh5aGHrqLGY
	jbAvLahLhOrVEaNtNrfvCq1UF62aFy/F2/pGj6XWZrmAFp0mYOvYQU3JMVSW5axM4CevU9U
	0DEWxwB8iagYD/Edd5d65PKLEHGTL2UgPoTGLDrun4sBzPPBG0DwXF2ogqKKqURWH1FCc22
	0rmUjnONgreGHAqV5uRgmNH0YnUmG5iGfZoWy3TiLkOMOZw/5ZHrdF45DmYxNJTlXcJ2Vte
	0kPR9nqJZh5iGWBMTqYFK4C2jomtKqkvJ4PcPeedztAbW3fLKgNRjw6t8ew0g2cGLEAFY94
	pt9DKEPPVZp83tBD1oZG5Kj79NabqMfE7fL+kBhPHFzSPFGLSHEXOtqgMQrrsbhWt3cZblk
	6sCoza4rjr6yVS6rIZ2koAdNIm8kz+Il6qcv23wW7fDz/mNKxCVIcTr9EkvL0dMaf2nPP2R
	kxvKTB2vu9xFymHW/hOkaQzQZmoE/f0ENr+EWJJw4z/j9duIj/b2O0zpq6Gr/lfz1/3BfP3
	nonQx1yXZdbqSqStx5UEkgfPs/pzxievFDzWMRc/i67WWDntChTCcdnsLVNURDur2WLtDVP
	aiGtaKLO8lU5zrPITueprjZxsW/ajcVmOHrLrjG+ciS
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_201938_642283_FFB6B24E 
X-CRM114-Status: GOOD (  12.52  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2898030738291487236=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2898030738291487236==
Content-Type: multipart/signed;
 boundary=31cfa6b4a87c9db47b94322de7283a792c5e939a3d8a2a05e0f0c1fefef7;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--31cfa6b4a87c9db47b94322de7283a792c5e939a3d8a2a05e0f0c1fefef7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Oct 20, 2026 at 4:20 PM +08, Sandie Cao wrote:
> Add the device tree node SDHCI-0 controller for Micro SD card slot.
>
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> ---
>  .../dts/spacemit/k3-deepcomputing-fml13v05.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b=
/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> index 84f66dd8f962..09e3d46a2ea3 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (C) 2026 DeepComputing (HK) Limited
>   */
> +#include <dt-bindings/gpio/gpio.h>

This header is no longer needed now that cd-gpios has been removed.

> =20
>  #include "k3.dtsi"
>  #include "k3-pinctrl.dtsi"
> @@ -184,6 +185,23 @@ &combophy {
>  	status =3D "okay";
>  };
> =20
> +&sdhci0 {
> +	pinctrl-names =3D "default","uhs";
> +	pinctrl-0 =3D <&mmc1_cfg>;
> +	pinctrl-1 =3D <&mmc1_uhs_cfg>;
> +	bus-width =3D <4>;
> +	non-removable;

Could we add a comment explaining why the SD card is marked as
non-removable?


--=20
Troy Mitchell


--31cfa6b4a87c9db47b94322de7283a792c5e939a3d8a2a05e0f0c1fefef7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCatmAjwAKCRCYCe+A+TM0
L8C8AP9Irgawm5YpoIAUfeaOEmpkeMyleK+xG8EFI61rJSKlOAEA6/HVKU2fHd7+
uPDtKcTGGCeydx5BiDR2GfdRfcLrGAk=
=qRux
-----END PGP SIGNATURE-----

--31cfa6b4a87c9db47b94322de7283a792c5e939a3d8a2a05e0f0c1fefef7--


--===============2898030738291487236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2898030738291487236==--

