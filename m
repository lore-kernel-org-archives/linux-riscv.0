Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E1AC4829B
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 08:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEl6mq+85MwYT1UDHYLOYyP3h4IZMiKUh6TAqW1JOdU=; b=niWk8Uz8SqkIIxuP4e5onwj0zS
	Gci/zlOa4ckDkRxwEF8q/EMuaUf+4+dl0NSjMfUSWJdH20NQKZMPDGr8r7VtqijDfLp+DKMbubPvx
	A+r1NT86dnWX9yanyGOt08rp8QOdo57V/quellKw1ZXlpJabvMdUv70CrC2kW3ixHtj67ELbfB5/p
	2xFVTvBGjmXRCHfsAOeCX3BlxY/dtYphhkgKv3eRiqzxyfpnGUiTS7ub3yR/u1dTQTKb+vM/EYOj8
	9CqsC53z/IH6iTMUPSuMYH3RgkboYhsHg3PEUposYXE6SRgsUiwOfSFgO9v5IjZg3LV32WrXHGcU1
	JYvGYkFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZRRS-00000004bfD-2KHE;
	Mon, 12 Feb 2024 08:13:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZRRQ-00000004beo-2BL5
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 08:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1707725608; x=1739261608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UCSj1ZEGLD9eCgnsZic6xGWJaBob8bewMfF1q0KeXLU=;
  b=QVj9j8Y9KSbeLhmGN/Ffoxr939HKArEbSh88JZ14d1NO5B57BtOfaAiv
   fwvYMfX2Q0hUOINF8HRMZouEPedhU45q8J9bkzW4ye1zTFJqLFtr8U0Rb
   Zxs+27xxIS91f2DChj0lvu3qmz+1z5Ugq3MN6TdnDhVptCeNJltlrhiFk
   o0+P1C51r8k4KGmtMCzODpNT3fsJ6YT0L7zY1KoXFGkj5kcz/n5VKTBRw
   lcwsbLFJB2d8LDWr8L431D9uSsxHd4CP7aKx7GB60J/OF9em5pto2QoCX
   8lzrkUU5ZfsDiP5O/Q1adJnXU2rlcSDKF8x5G7O6/lhIuWdAX9u2aK2Xb
   w==;
X-CSE-ConnectionGUID: SPzSOg2CQl+AOMlhbWcqbA==
X-CSE-MsgGUID: oaTEeq14QP2PPao9cFSn5w==
X-IronPort-AV: E=Sophos;i="6.05,262,1701154800"; 
   d="asc'?scan'208";a="183365843"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Feb 2024 01:13:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 12 Feb 2024 01:13:16 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 12 Feb 2024 01:13:13 -0700
Date: Mon, 12 Feb 2024 08:12:33 +0000
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
Subject: Re: [PATCH v7 4/8] clk: sophgo: Add clock support for CV1800 SoC
Message-ID: <20240212-explicit-wrecking-f158f0c28f0d@wendy>
References: <IA1PR20MB49533B0C8B05FF5679E0C2F4BB442@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49538E900A21F373A1171B2BBB442@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49538E900A21F373A1171B2BBB442@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_001328_613442_6F340170 
X-CRM114-Status: UNSURE (   7.62  )
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
Content-Type: multipart/mixed; boundary="===============6708950273064719750=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6708950273064719750==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dvFkdGZI6Ityus2U"
Content-Disposition: inline

--dvFkdGZI6Ityus2U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 08, 2024 at 04:48:52PM +0800, Inochi Amaoto wrote:
> Add clock definition and init code for CV1800 SoC.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Link: https://github.com/milkv-duo/duo-files/blob/6f4e9b8ecb459e017cca1a8=
df248a19ca70837a3/duo/datasheet/CV180X-Clock-v1.xlsx

And on this one there's a gcc complaint too:
drivers/clk/sophgo/clk-cv1800.c:634:37: warning: 'clk_disp_vip_parents' def=
ined but not used [-Wunused-const-variable=3D]

Cheers,
Conor.

--dvFkdGZI6Ityus2U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcnS8QAKCRB4tDGHoIJi
0syHAQD+X8u58YILVwXnuv/2aD2GJ/8Q6x2gEhvtWKxRtepANAEAtV2v+waW9yzK
W7onJ9rSw1Jr6B4+gjOSjb49MiESgwE=
=leOw
-----END PGP SIGNATURE-----

--dvFkdGZI6Ityus2U--


--===============6708950273064719750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6708950273064719750==--

