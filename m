Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE0EC5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 11:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDQuYaalg3NIPT1nFdHGzuYp/E2Cberu9mqW3uW4V4o=; b=MOTCNZYSsBh2NUGX18D7hs66ft
	7h0Z5aQoFAJkzAmdKhkuBeOHzrCrBVy8SBShof2xfKlNt0auEIrqke6OaeUcBwmuPPv7m0+v4k5xG
	1SXFptbZ5xoSclFd0uVUTR6SI5Jc9xENnxGx1tbf+qSXu1/tyB2n2w0I1XxHFkLwS8O+vGgs1es6z
	EVccW1nN4FiIpmGaLXRtOGZAHZhZ8jhMoq8JDNoEsvKtZHFIAG3t/0NwocM+joQR0PmFltQTnGgXs
	kdTIi7hHuv3C1H/vdbVAxSGbKGESD5hTvQSDhtflgLJCixbHGCkw8klNysTSdhemlSPHfzkE27W6J
	hA2mW/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rew1X-0000000511n-21wT;
	Tue, 27 Feb 2024 11:53:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rew1F-000000050ss-0ZB9
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 11:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709034789; x=1740570789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QpM2Gj+iE1842oLmR/JSz14T461jLNYwC4WotBRHz8w=;
  b=ZTsDYbfTO+AsrHOaIejSbOlZ+tDEZ2deusk0O/Ki7tO9jD9Rw0BD70E0
   t/bk1b5SLcdLbDIAnv9gYef5+ZIXyfU+9qVU+UkIMk0LJH5NhPFf8U5Jt
   FvbDZVokMfyy0Tqm1jKgbj437fWHhALRzGshyZItrJwy8ByUZr7g8Zena
   oRjT62sMwEfEl2P6tYIsGFNuRGnmCMydRN5ojRbAQFtWFcEJA9SSNgzfP
   ccTsu3RETNefv/NzRJ+7jV7+p7SjifDnlOsWACm8U3dQQA93CtdL/6Eot
   kvVHjsbdnlMwunlgjFWE+AJkOE8HEM8/wH4jz6ac5Tf8Tm9rspw9dOZ5a
   w==;
X-CSE-ConnectionGUID: OPUfXbZxS9CqWDIW5F1xSQ==
X-CSE-MsgGUID: RWzb322QQCeBS6neIPwO3w==
X-IronPort-AV: E=Sophos;i="6.06,187,1705388400"; 
   d="asc'?scan'208";a="16885482"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2024 04:53:08 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 04:52:42 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 27 Feb 2024 04:52:41 -0700
Date: Tue, 27 Feb 2024 11:51:58 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] riscv: Remove MMU dependency from Zbb and Zicboz
Message-ID: <20240227-bonehead-stonework-d56052265b35@wendy>
References: <20240227003630.3634533-1-samuel.holland@sifive.com>
 <20240227003630.3634533-4-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240227003630.3634533-4-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_035309_351899_D06ABC2C 
X-CRM114-Status: GOOD (  13.37  )
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
Content-Type: multipart/mixed; boundary="===============8572546791714958906=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8572546791714958906==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MVkIfoCLD1B37PLh"
Content-Disposition: inline

--MVkIfoCLD1B37PLh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 04:34:48PM -0800, Samuel Holland wrote:
> The Zbb and Zicboz ISA extensions have no dependency on an MMU and are
> equally useful on NOMMU kernels.
>=20
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>=20
>  arch/riscv/Kconfig | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index bffbd869a068..ef53c00470d6 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -581,7 +581,6 @@ config TOOLCHAIN_HAS_ZBB
>  config RISCV_ISA_ZBB
>  	bool "Zbb extension support for bit manipulation instructions"
>  	depends on TOOLCHAIN_HAS_ZBB
> -	depends on MMU
>  	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
> @@ -613,7 +612,6 @@ config RISCV_ISA_ZICBOM
> =20
>  config RISCV_ISA_ZICBOZ
>  	bool "Zicboz extension support for faster zeroing of memory"
> -	depends on MMU
>  	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
> --=20
> 2.43.0
>=20

--MVkIfoCLD1B37PLh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZd3M3gAKCRB4tDGHoIJi
0iVOAP4xnKemNhs85COxEne/mehKUX1aV+ACJN779DXpaUB2ywD+KRmu/SwerYwl
Ooozck02olX3pPxzIw9S73glhdreTA4=
=1ooj
-----END PGP SIGNATURE-----

--MVkIfoCLD1B37PLh--


--===============8572546791714958906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8572546791714958906==--

