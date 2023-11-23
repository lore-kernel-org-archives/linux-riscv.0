Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29344C5AD4C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 14:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTdyqntCtjkvGF+47G2tijNL35ldX4A+xCNkP6xOGD8=; b=ZG01JrB1Z/pAXPxDt2cnfXU03h
	zw3so9GgGSAGg9scMrW7PDFwkUThncOdXw2NMiXroGJkqX/kR0nUTtmPfS2AQ2izgdHOF5ihfbv8X
	KMfVTMWXHxfzXAUQhR6vcFApO+r+VXBe0QlXB1uFtcBBlUvbHmZtm/wGezC5YXr8hRIZy2QdaU3Dn
	KmAGG9oboq8xixvZerQ6BOGd4RwbSCnQfVS0sbejoMyeK1UwDljUM4VpkW/37W7cs7rpPzOA+ehFg
	8IAgdfHoJo45+MBIeLQVKIEJQayQ2A7EPO4aOxh5L7E0XCfaEQ7Zi20ej51VwtkHjGs9Jtw+PmKiu
	4AaT0OoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Alj-0051pT-1W;
	Thu, 23 Nov 2023 14:33:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Alg-0051nv-23;
	Thu, 23 Nov 2023 14:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1700750004; x=1732286004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/isVcwGC/oBWwnXkex9wo2ndvurQu56usHeNj6PgxsI=;
  b=YXp/HAOGDkgZ+Ht7K647YZpVq7MVKofQHYpLG7zbCQrzRLoeIIdZCAZA
   uThlAuVin9dq/GodA6y9dpkdQmW5C3VlG91YD1b20fE7jucCwSMEEQUhj
   dXGxRaZAYUpSofz2InlEM2ffEOOoKtJTnZbYknsMSwJwLEeEbkeauqnhR
   SHh73W204Q67EU/yUpRh35seHn3kFZPU7b1HkWhx5X5snWFKtSHzOd+Vc
   CrGGA+BMDuS2VQbFLB74X5st8WKGN9cSgDiK6maFCmGECHvBMnojaOuJD
   wX1jf4RvfM9PpipYUAslvkvqXDTOjdn781KH+0j17LRiDFLSmCqWePumn
   A==;
X-CSE-ConnectionGUID: arLnt+AGQiSlEZrXvp7v7A==
X-CSE-MsgGUID: uGTi7ZUeTMiO3IPjpg/iQA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="asc'?scan'208";a="12937175"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2023 07:33:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Nov 2023 07:33:17 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Nov 2023 07:33:12 -0700
Date: Thu, 23 Nov 2023 14:32:44 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel@sholland.org>
CC: Conor Dooley <conor@kernel.org>, Yu-Chien Peter Lin
	<peterlin@andestech.com>, <mark.rutland@arm.com>, <heiko@sntech.de>,
	<atishp@atishpatra.org>, <guoren@kernel.org>, <jszhang@kernel.org>,
	<linux-riscv@lists.infradead.org>, <will@kernel.org>, <anup@brainfault.org>,
	<dminus@andestech.com>, <dylan@andestech.com>, <ajones@ventanamicro.com>,
	<aou@eecs.berkeley.edu>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<locus84@andestech.com>, <tim609@andestech.com>, <paul.walmsley@sifive.com>,
	<linux-arm-kernel@lists.infradead.org>, <rdunlap@infradead.org>,
	<linux-kernel@vger.kernel.org>, <evan@rivosinc.com>, <palmer@dabbelt.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [RFC PATCH v2 07/10] perf: RISC-V: Move T-Head PMU to CPU
 feature alternative framework
Message-ID: <20231123-edge-skinless-3ec70c2958c9@wendy>
References: <20231019140119.3659651-1-peterlin@andestech.com>
 <20231019-predator-quartet-e56f43d5aa8d@spud>
 <ZTJAYqk_DnrR9-Sc@APC323>
 <20231020-snippet-diffusive-1a6052d52aae@spud>
 <ZTTmtVnZrioRWpJx@APC323>
 <20231023-impulse-quickness-4c7076e6eb58@spud>
 <a0a95390-ac9e-4d82-9727-d4880e5e48ae@sholland.org>
MIME-Version: 1.0
In-Reply-To: <a0a95390-ac9e-4d82-9727-d4880e5e48ae@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_063324_684332_237DD1AB 
X-CRM114-Status: UNSURE (   8.56  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============8628296018201255896=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8628296018201255896==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EPTcSEsndYxsXW5r"
Content-Disposition: inline

--EPTcSEsndYxsXW5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 07:43:09PM -0600, Samuel Holland wrote:

> PMU support is not required to boot, and it didn't really work correctly =
anyway
> until OpenSBI commit c9a296d0edc9 ("platform: generic: allwinner: fix OF =
process
> for T-HEAD c9xx pmu"), which is still not in any released OpenSBI version.
>=20
> So I am fine with requiring a devicetree update for continued PMU support.

Okay, would be nice to get an ack on the relevant parts of the most recent
iteration of the series confirming this :)

--EPTcSEsndYxsXW5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV9ijAAKCRB4tDGHoIJi
0jzqAP99wSNOFoSEnhErwZWcLiwLSjE+zabiRoiFl3LNjc8IoAEAxwsezaMF/4hx
55Y2gIY06+bjvIcZKyXPokGQMOmbcAU=
=dCRP
-----END PGP SIGNATURE-----

--EPTcSEsndYxsXW5r--


--===============8628296018201255896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8628296018201255896==--

