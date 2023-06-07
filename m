Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3ADC7EE29
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 06:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tf+PzavgahdhWeHD7E5QS7NNdFlJQ+9gl8spilwz7wQ=; b=VKPjcmR1eK/tu4fXW+/EWBCgim
	yOVvlilEvTEhPEPUDVYM/H9zkNn22/b0QYHhzWazOyjb1hNI8kBe6MrZ06yIXXUT9TC5w46TdAZXw
	DLKsTgYq4rI+2dKm9yYKClxqsZBCxOxcACN4Tw9rqjMQEvVrYiQJ+GzvPAGtzADZR6HX4ktBiWXUU
	hNp/KB/9bDbhjliz3dUyZsptmdHsXVY34jvXctwZ7xdpoha77iXQlqG0lqiKlqTYUK2DJGAdt42Gq
	L3BiBcAeVSAh9mKKnSQ4NB+acZ5FJt+J5QLgcfsQWwNHiq0Zvi7WXlMA46zvXus7X/7ZpyEuzseOi
	zIfQL9kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6n1M-004coc-0G;
	Wed, 07 Jun 2023 06:51:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6n1I-004cmg-1K
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 06:51:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686120708; x=1717656708;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DhWndPpddaoxUPxyEmfRWSwqvWtGZRWshWcQJxBubLM=;
  b=yTJwgpI8qSx1f9s5ndTSdtjWbwuzgV9cgu0PlEN+E+M7yzqrYjcsTg+b
   VMBGz2j7j7E4YwXqoHQvdgqTneqLHTJ1jIHL3ILyeWZiM/lOtuf8onznk
   tQ56thLCI4Djg8Vdl2rGeObiuKoccVHl+zs7JJO5rGZb0mxd6D/6+KJbW
   ch9s54Z1EA/royKYoA5Omj2UZY4As1g5OZnSNtJJjVI5LduWWSjgik4vW
   xUMZRqVYjsbar6cpdRy27SxfZvqVpZZHPdGoYxTRNKaEzzYaf+spqEmIq
   KBWKV2oT9usUcIPY7GEIYIQ/Jd6m3/voZHexIBNXajwxi5Uj+zyDHXRjA
   A==;
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="asc'?scan'208";a="217189778"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jun 2023 23:51:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 6 Jun 2023 23:51:43 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 6 Jun 2023 23:51:40 -0700
Date: Wed, 7 Jun 2023 07:51:16 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Mason Huo <mason.huo@starfivetech.com>
CC: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Shengyu Qu <wiagn233@outlook.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 2/3] cpufreq: dt-platdev: Add JH7110 SOC to the
 allowlist
Message-ID: <20230607-process-spinal-321ccf04d7e6@wendy>
References: <20230606105656.124355-1-mason.huo@starfivetech.com>
 <20230606105656.124355-3-mason.huo@starfivetech.com>
 <20230606110804.qns4rolrrj2gku6w@vireshk-i7>
 <20230606-unsmooth-slip-c80fab59c9b4@wendy>
 <f29a14dad3d744bba54e561a050bdfaa@EXMBX067.cuchost.com>
MIME-Version: 1.0
In-Reply-To: <f29a14dad3d744bba54e561a050bdfaa@EXMBX067.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_235148_628153_FD17FC38 
X-CRM114-Status: GOOD (  10.89  )
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
Content-Type: multipart/mixed; boundary="===============2174528619454696267=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2174528619454696267==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PguniYfT8h3J0i0C"
Content-Disposition: inline

--PguniYfT8h3J0i0C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 07, 2023 at 02:04:37AM +0000, Mason Huo wrote:
> Hi Viresh & Conor,
>=20
> Sorry for the confusion.=20
> Should I re-send the patch series and remove this patch?
> Or you can just ignore it?

I applied the two dts patches yesterday, you shouldn't need to do
anything.

--PguniYfT8h3J0i0C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIAo5AAKCRB4tDGHoIJi
0pBVAP4k0GCPxUv/B+QjWRQshcDqTHSTrBRdE0zfT3GoMOfxDwD7B9gQAFoFQrw3
IP3CJDRJ4Wg/8jlq6a5qKq/d/BjOmQs=
=3vSO
-----END PGP SIGNATURE-----

--PguniYfT8h3J0i0C--


--===============2174528619454696267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2174528619454696267==--

