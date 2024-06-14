Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B802C27C6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 10:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0zl5vrZWYEDgbAmHDSHuf5edt+JevCyOfv6vbeCtA0=; b=EbdOcFwt6qGT59BWpiw62hDhof
	mB/4HNRlF+UG7zsLiEs2itIXrq7VmhnOoGNdMeIRiEiwwledWToO0ZwrDldptxgbWkbBq35AyrN2y
	x2Bf3fNRVKT10U3SXZBHiUgM46HywjtCp0WTdSAJfFU+46YaVHti7xKCecCL7mPIpgbkj16thrYut
	sDwWE1GnnEXOaLn5BgGJnQRmsYdlGGyKebsgqnRjTkjCxS4LMUylNycKigSMF97ou5jzGHWh5Fv4z
	hiK8mgAjT/Ao7s3ZH8Ozjqn+pQ8GwZzdwXLf8+1Qt5BtZ+/V1gfCFTufmDD2r+p5kYHsZZfRELvGS
	lEFWze4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI4EQ-00000002S1P-13Qc;
	Fri, 14 Jun 2024 10:32:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI4EE-00000002Ry5-3Iko
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jun 2024 10:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718361139; x=1749897139;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CfpSNYRxPzF3eP5B/0FeJ6z/uAilyYbezSPoYSHcqWI=;
  b=a1D3eZ6XRytd7y+a1Gf/k49h3xNY71SpOicXuV2EqKiiWPHpHlO9RiOJ
   fEqZjU1LPhaFISqOEifCrp88q7ZGGGJnbQpwacosrOfY8+ogA6x6S51Bj
   VHFqkKByzR1r2ZFsGOMjDqj/EunLo1ucU9bvSdK/zGkaYu+YfdOfdEJFv
   B3Z2tJKHCCI1FWUOGhtKlNz1CBXleeObdTxETUsk2YXXmZXHoiCB/JSEz
   5TbRkQG1rvYj7eSJSCIV2EZFrQkTt0aqq1Y4gSlu5KZH2xs+94D0EhsD8
   QRgRyPt2RdViqYtvszdD00cklw/hM45u2A2kzsKHBdK705/B46WGKlPkT
   g==;
X-CSE-ConnectionGUID: nFBF+wvcSOK6O7fDHKZSVQ==
X-CSE-MsgGUID: F2wRbsnVRvqFmTnNJb1XtA==
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="asc'?scan'208";a="27543976"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Jun 2024 03:32:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 14 Jun 2024 03:31:46 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 14 Jun 2024 03:31:44 -0700
Date: Fri, 14 Jun 2024 11:31:27 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor@kernel.org>,
	<linux-kernel@vger.kernel.org>, Deepak Gupta <debug@rivosinc.com>
Subject: Re: [PATCH v2 1/3] riscv: Enable cbo.zero only when all harts
 support Zicboz
Message-ID: <20240614-parasail-lived-b771878e869b@wendy>
References: <20240613171447.3176616-1-samuel.holland@sifive.com>
 <20240613171447.3176616-2-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240613171447.3176616-2-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_033219_387807_AEA116A3 
X-CRM114-Status: GOOD (  23.91  )
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
Content-Type: multipart/mixed; boundary="===============0807743630500540735=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0807743630500540735==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z5ZL1EgnfI55oztK"
Content-Disposition: inline

--z5ZL1EgnfI55oztK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 10:14:39AM -0700, Samuel Holland wrote:
> Currently, we enable cbo.zero for usermode on each hart that supports
> the Zicboz extension. This means that the [ms]envcfg CSR value may
> differ between harts. Other features, such as pointer masking and CFI,
> require setting [ms]envcfg bits on a per-thread basis. The combination
> of these two adds quite some complexity and overhead to context
> switching, as we would need to maintain two separate masks for the
> per-hart and per-thread bits. Andrew Jones, who originally added Zicboz
> support, writes[1][2]:
>=20
>   I've approached Zicboz the same way I would approach all
>   extensions, which is to be per-hart. I'm not currently aware of
>   a platform that is / will be composed of harts where some have
>   Zicboz and others don't, but there's nothing stopping a platform
>   like that from being built.
>=20
>   So, how about we add code that confirms Zicboz is on all harts.
>   If any hart does not have it, then we complain loudly and disable
>   it on all the other harts. If it was just a hardware description
>   bug, then it'll get fixed. If there's actually a platform which
>   doesn't have Zicboz on all harts, then, when the issue is reported,
>   we can decide to not support it, support it with defconfig, or
>   support it under a Kconfig guard which must be enabled by the user.
>=20
> Let's follow his suggested solution and require the extension to be
> available on all harts, so the envcfg CSR value does not need to change
> when a thread migrates between harts. Since we are doing this for all
> extensions with fields in envcfg, the CSR itself only needs to be saved/
> restored when it is present on all harts.
>=20
> This should not be a regression as no known hardware has asymmetric
> Zicboz support, but if anyone reports seeing the warning, we will
> re-evaluate our solution.
>=20
> Link: https://lore.kernel.org/linux-riscv/20240322-168f191eeb8479b2ea169a=
5e@orel/ [1]
> Link: https://lore.kernel.org/linux-riscv/20240323-28943722feb57a41fb0ff4=
88@orel/ [2]
> Reviewed-by: Deepak Gupta <debug@rivosinc.com>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--z5ZL1EgnfI55oztK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmwb/wAKCRB4tDGHoIJi
0ldKAQDTQ/APmkNX8IRH/02s56jNsFUXa0qY9IeWFnaEdYB/GgD/Z0+wxcrVz8Xs
/vyJ79gnZtJJN6bFUsf3dif12uOlPgk=
=oFvk
-----END PGP SIGNATURE-----

--z5ZL1EgnfI55oztK--


--===============0807743630500540735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0807743630500540735==--

