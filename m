Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11E0105F7AC
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 13:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZngNNnIRxuQSf6+g2Yg0DiHNxHlrqGtbQXzgHcwmX0k=; b=R77z52dE6CbTYTB0Aaub8HkqlK
	uUYLNaQ7Q6/8HI2cjjiuVWtTWTA6tblLa0eG5F+wNbRLDFUM67/gkTN/bBTheKKN0RVGQsT/cqKso
	XAfIEL+/xGNtPHjv9gV0efqXyis4+TZk7w0aqtwgcbmzdvjp7qiIvPThRc+uE0e0fIF6U0lfbf7Zh
	J6oDkbmyqmKR3mtippTRqpY1ZqIza9pvnYiif5RRfhBL77iWaP15K8QKDAXTI4DDJLi4Ooe0FqLNN
	o/RGcjPa1Ik6Pzk2UkKOu7aa3DPh6FWZHqyz1lXqrdmPVeOrrfvlkcHSmKE2SxPkAspEbE0pbrt9m
	NZWQqEwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12ZE-00000000F5l-3Shd;
	Fri, 13 Mar 2026 13:28:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12ZD-00000000F5O-1sIu
	for linux-riscv@bombadil.infradead.org;
	Fri, 13 Mar 2026 13:28:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Vh28EVCNenDL3mJSjOK5QkSaW5JwUJEUNmjfNkPPFao=; b=H336+9iNnROISIWSmJQaTVCAug
	bDVS/mLEg4BVfACn++SNOXoAVVL5SV6KsqhVZgAJnDYAsuQF4Qxo7LwI2vpUPKJ++x1Pvck+RGyNR
	dYxUg+OtKQoaEVDJfMNXM3YzAHNvmv9sjM84kVN3G1khpETx1O7lEMGNCHLTG8CYE90XbljHkiJxk
	v79x7YDSQrfLiKJ7EZVPW71Cim2MmM5uzkdHehX2CtCJnjBOd37UJXk1dA4+am4cxh5HR3gt6liBs
	VkF5H6CYxSYDugNFo5UQMBaQ4G0JsDpk/RcGq5mmTfV++ZTvfXFV12FwV6yMaquHHzGpNJMDxl7aM
	9BAt36Iw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12ZA-00000003NmM-16xB
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 13:28:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E32C42A77;
	Fri, 13 Mar 2026 13:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA48C19421;
	Fri, 13 Mar 2026 13:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773408512;
	bh=sMfDxBwvCvKDhU5KH8fpepSswQSCPaCagRLD/otPebM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lVtB4JXoyAztSi8HxGcsceMemPpNjmgXORINdOX6Z5WNFf5A26Z8nhZN2JaZSjqmL
	 ke/dHynJWcfsBFEo6RNqb6s2YzbyYVObCr3p+t+N9ZqyZ3JdnUpVJzXTiCwC2Daw4l
	 jmYAh9NWHZ33sfN++ozgVruj5ju3mC+2vuWOhIarOUg0o0VTbmx6/npOGPF+hvd/tV
	 bEXWrX0tpCzYx1kiQ6TDPykBxIOQTgFbnAPvnJbAVX7xpf8/OT6ICCKR5rEaRmuqGE
	 4ovPoZIARp7Fd0uPWEKdrcz6jwGaT8d1PS0hb2ygO5TC8kDo4PK46w6Fz/dhKYk746
	 fS8XOhvjYAwOg==
Date: Fri, 13 Mar 2026 13:28:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Bo Gan <ganboing@gmail.com>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
	david@redhat.com, palmer@dabbelt.com, pjw@kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc, lizhi2@eswincomputing.com,
	hal.feng@starfivetech.com, marcel@ziswiler.com, kernel@esmil.dk,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 4/6] riscv: select RISCV_ISA_XPBMTUC in STARFIVE and
 ESWIN SoC
Message-ID: <20260313-backrest-shamrock-0c651c405686@spud>
References: <20260313084407.29669-1-ganboing@gmail.com>
 <20260313084407.29669-5-ganboing@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260313084407.29669-5-ganboing@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_132836_572675_365D4031 
X-CRM114-Status: GOOD (  13.87  )
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
Content-Type: multipart/mixed; boundary="===============7489358464818684671=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7489358464818684671==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bBH/OirW3AgtDsT2"
Content-Disposition: inline


--bBH/OirW3AgtDsT2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 01:44:05AM -0700, Bo Gan wrote:
> Enable the XPbmtUC feature for Starfive and ESWIN SoC
>=20
> Signed-off-by: Bo Gan <ganboing@gmail.com>
> ---
>  arch/riscv/Kconfig.socs | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index d621b85dd63bd..0584511707c7c 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -14,6 +14,7 @@ config ARCH_ANLOGIC
> =20
>  config ARCH_ESWIN
>  	bool "ESWIN SoCs"
> +	select RISCV_ISA_XPBMTUC

Nah, you can't do this. Either RISCV_ISA_XPBMTUC is user selectable or
it is mandatory for these platforms and selected. Don't mix and match
please.

>  	help
>  	  This enables support for ESWIN SoC platform hardware,
>  	  including the ESWIN EIC7700 SoC.
> @@ -56,6 +57,7 @@ config SOC_STARFIVE
>  	select PINCTRL
>  	select RESET_CONTROLLER
>  	select ARM_AMBA
> +	select RISCV_ISA_XPBMTUC
>  	help
>  	  This enables support for StarFive SoC platform hardware.
> =20
> --=20
> 2.34.1
>=20

--bBH/OirW3AgtDsT2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabQQ+wAKCRB4tDGHoIJi
0szwAPwJJgVs9DHLR3KW6ShbDYREKukSOhcSjLR49TaqKA9MDQEA/gPt6qmANjPI
cCM/rdDB9bNf70Tx6CtPkOB72LMkUQ8=
=LeKB
-----END PGP SIGNATURE-----

--bBH/OirW3AgtDsT2--


--===============7489358464818684671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7489358464818684671==--

