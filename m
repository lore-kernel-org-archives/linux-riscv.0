Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185CFC4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 12:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+aCNclwiAlgzqtbWTbp23cSnI8J5r7FekZnEFfhzsu8=; b=PIxiLKMnzTZBECjgS+dNYueXNq
	cQsgP9jsdc42m3dR7SYrrWYXQnRbllXj+UsZ8x/KnDWpb0BAukSwH/QQu3vxyij44KaU+htx9XQhu
	tn8IgC/3nPo7FkBPSuxLbjWbgXHa35KRETUazaDhuuq0oTwvs7fINSruUdgziEgVM5fpqB14zIEey
	/+0M5d6p6aKt9o5iOMNRvFd/Pju0UWJ9QthQEF0Om4NJv8GpxxSEULAYeO/xk7lRsF9hMS7L3HHqi
	8BHYQgpJXIcE1+BvNj/h9vmIgvcWAm52n3ZFJXvw5RzUffayLb8hLWSGwe2YV1/iBJl26aeCfarjl
	SG16gp6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA85b-0041YU-0L;
	Mon, 04 Dec 2023 12:30:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA85Y-0041V9-0w
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 12:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1701693016; x=1733229016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JFvFrM/2A13LJ6Sjt4y/IibF6D15sLv/V9WPTSqIr6c=;
  b=sMZwVmoG9hrKtojb1M2aVi3bcy9l3anq1hrMYsVhAkgNaNX5YiFyzNuS
   E9WXiHGT4fufsHBxuzEkTRxQdCD9AU+pSJ638j7D2LcexVxQGereGckNX
   P4BbJ42tsM+vcTeKDvAs6IGNC5HnoPcn7J6OD4dv7ldj30ep6GkQRU807
   tsnsvvzN9ohc13ZJFmCOc2HFE3wpBHTkvwfgSD9dQ4f0Z1GTY+PtEaGmp
   9KLhzysWa9FnzdIYf8JQfQXYGeEcweWM2WAjinhvs4q3Q5V1GYhyslvw7
   zeqv/FgWeOi8wyq5Qj+PSOWY7Armqg2itt9sy1OcBLoMAo7or88bUBB6M
   g==;
X-CSE-ConnectionGUID: bdNYgeAtRsCB0lrqas5uxA==
X-CSE-MsgGUID: cA4Qd3KuTBKpc0oUMZrcAQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="asc'?scan'208";a="13018019"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Dec 2023 05:30:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 05:29:24 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 4 Dec 2023 05:29:21 -0700
Date: Mon, 4 Dec 2023 12:28:51 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Wang <unicorn_wang@outlook.com>
CC: Inochi Amaoto <inochiama@outlook.com>, Conor Dooley <conor@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>, Thomas Gleixner <tglx@linutronix.de>, Marc
 Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Anup Patel <anup@brainfault.org>, Jisheng Zhang
	<jszhang@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 0/7] Add Huashan Pi board support
Message-ID: <20231204-endorse-doubling-047ddbc30a5f@wendy>
References: <MA0P287MB033290A6C8B15202E31E43CCFE80A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
 <IA1PR20MB49537B177B6F3614D8D1E3E6BB87A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <MA0P287MB0332AE2378D633B8A2DCFB77FE86A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
 <20231204-crane-wolf-95f32865db62@wendy>
 <MA0P287MB0332862DC235652C83B4EC2EFE86A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <MA0P287MB0332862DC235652C83B4EC2EFE86A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_043016_392161_DF9F0EE9 
X-CRM114-Status: GOOD (  14.28  )
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
Content-Type: multipart/mixed; boundary="===============7409230095134848805=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7409230095134848805==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ieMNs6tqdBFy84yx"
Content-Disposition: inline

--ieMNs6tqdBFy84yx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > Thanks Inochi for your info, let's just preserve these code for huash=
an pi
> > > now and keep watching on what's going on then.
> > Could you explain on what you mean by "preserve"? I'm a little unsure.
>=20
> I meant keeping your changes on riscv-dt-for-next and continue submitting
> this patch ([PATCH v4 0/7] Add Huashan Pi board support) to upstream.
>=20
> Sorry for my poor english, hope I have explained it well. :$

I thought that was what you meant, but I just wanted to make sure :)

Thanks for explaining it again,
Conor.

--ieMNs6tqdBFy84yx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZW3GAwAKCRB4tDGHoIJi
0szPAP9jd6HZ7ng/8w/0mQtbW7XsAwJk9w8YcViarCkgJY4lxQEA0p6fedN+czzD
v+W6puVfKfSJp3aSTqEZe/9iGUZ+lgw=
=TRAF
-----END PGP SIGNATURE-----

--ieMNs6tqdBFy84yx--


--===============7409230095134848805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7409230095134848805==--

