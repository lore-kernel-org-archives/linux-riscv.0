Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3259EC48297
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 08:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOFHEDxcDSOaLhtuCSOlx8AVBtcxoHlhTgylLgstW7s=; b=ZBOi9gKuhnPHmMMQOmap/BFBnI
	5a5xoxvHCQOUu66rHhBeDTCkg8cWqWYcFtnCjI5kiyRtVLIfz7wN25MA3k5m5dF3fYtZG1WnF083g
	0k0P2lj/AWmwTMNjce6iCV5ZeiHzc2XDpcjTN9day1tCg7dQA5GrFiq7ebD9N56XrIZXOdMgmni+0
	HdndiQG7ye4cstJILJm4LHCkjn5hnQ4eEtBxSQDFaxYCd3QuJHd/w4cse1TVeBZQ+pMjvjlmy5iWf
	PeABG9tDa347s3OpOHKVescSj0kRGC9nd6JnsvWlYTjav08SKWTG6OuX0QubAa094NjmX5TYoHqE5
	39u3HHvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZRQI-00000004bUN-1IMs;
	Mon, 12 Feb 2024 08:12:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZRQF-00000004bU1-1wSD
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 08:12:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1707725535; x=1739261535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y4gOdXf2UvPIYFJOvfdCK9DIHHn8iBh20XjFWZcWNqI=;
  b=VMich8G4Pe2Z5Fxmdf7M0MvzRGXjUZE47UY4ujOKRl4wmPtdWLzK7XBU
   eRrWmIwsOJGItxqgbtVITiDFmOAen7L1/Dqt7Cgqvhte8tj5BQZ1iaRgU
   Syta1UHjMtacRez2My1iUtEBI6znWYNxF/whPEGayxeWp9hpJX5H8mVhM
   RXJROQNK8zfXKheUAdQC0xdYhMM7lp6mvRd9ezY05YYx2P/UyVEzL4wlw
   0K304zxY2HTh4W4shRHkjAqgQ0Cvcd99H2iWWk6c144fMLQdWE919cK0Z
   YYkcXNE1TwmcJ8B+x0tXs/kxSK3NfYUFMZ3Hybxf6lvXc3SjFn5TW0Hr7
   A==;
X-CSE-ConnectionGUID: kwS9suHxTnKkUfyu86XUvw==
X-CSE-MsgGUID: 9DzaZjwYSgO18GJ9Jxa/Ow==
X-IronPort-AV: E=Sophos;i="6.05,262,1701154800"; 
   d="asc'?scan'208";a="16618915"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Feb 2024 01:12:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 12 Feb 2024 01:11:53 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 12 Feb 2024 01:11:50 -0700
Date: Mon, 12 Feb 2024 08:11:10 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Inochi Amaoto <inochiama@outlook.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Chen
 Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Liu Gui <kenneth.liu@sophgo.com>, Jingbao
 Qiu <qiujingbao.dlmu@gmail.com>, <dlan@gentoo.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v7 3/8] clk: sophgo: implement clk_ops for CV1800 series
 clock controller driver
Message-ID: <20240212-list-grumble-819f7988aaad@wendy>
References: <IA1PR20MB49533B0C8B05FF5679E0C2F4BB442@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49534558A17C332722AF5BC2BB442@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49534558A17C332722AF5BC2BB442@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_001215_559583_D4C1D401 
X-CRM114-Status: UNSURE (   7.66  )
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
Content-Type: multipart/mixed; boundary="===============6129480924395027423=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6129480924395027423==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g/NQAsoQx7SfAKyW"
Content-Disposition: inline

--g/NQAsoQx7SfAKyW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 08, 2024 at 04:48:51PM +0800, Inochi Amaoto wrote:
> Add clk_ops implement of pll and ip clocks for the clock controller.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Link: https://github.com/milkv-duo/duo-files/blob/6f4e9b8ecb459e017cca1a8=
df248a19ca70837a3/duo/datasheet/CV1800B-CV1801B-Preliminary-Datasheet-full-=
en.pdf

On 64-bit with clang:
drivers/clk/sophgo/clk-cv18xx-ip.c:745:6: warning: variable 'flags' is used=
 uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
drivers/clk/sophgo/clk-cv18xx-ip.c:745:6: warning: variable 'flags' is used=
 uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
on 32-bit there's also:
drivers/clk/sophgo/clk-cv18xx-pll.c:28:2: warning: comparison of distinct p=
ointer types ('typeof ((rate)) *' (aka 'unsigned long *') and 'uint64_t *' =
(aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
drivers/clk/sophgo/clk-cv18xx-pll.c:28:2: error: incompatible pointer types=
 passing 'unsigned long *' to parameter of type 'uint64_t *' (aka 'unsigned=
 long long *') [-Werror,-Wincompatible-pointer-types]

Cheers,
Conor.

--g/NQAsoQx7SfAKyW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcnSngAKCRB4tDGHoIJi
0opHAQC3h+Tx3CIi4UWF2q9YXffVkxcQyWOu5A5XV45+p/LBvAD9Ft5wyfLaV0oR
K9Bd0hf1eg8NOcyQIXKmbekTDXSUhQs=
=SAO8
-----END PGP SIGNATURE-----

--g/NQAsoQx7SfAKyW--


--===============6129480924395027423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6129480924395027423==--

