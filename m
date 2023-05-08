Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C90EC77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 07:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YjDDJDBAquMImXNWBhdEBqHN3njZ6+s6WnsaM1l/8Y=; b=3aUK9t/M/+vk73G9jupSI0+mSP
	s0ty6oTl0A/+LNALiJjd/5UuZBbHJ4RZuLgYwBcD7/oGNso/nwv55Cv2KluJGJcIRvQlYTrTbxQB3
	xnTtCIReVvw3Rn1vvDwUDyGQdmIRDkjsTkyJc0t6sZ6kQq6gZX8o037lS3dlR2ANY8qizcVkKA6mE
	lFXi9dnGpJw8t0T8i7zEng8umb4K9IuOsjnQbI5YCaOS0Obs+fRteivqaeKbfZfKw16Qv/4HRQwBC
	L51tHyi0nUSEXzQWwIdqxRtrLpv7Z4Zhw3BXGet90VP1LFwcEpZkYJxVU8WCpVV1ZtFlcqiMkwsUz
	ZN6he25g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvusq-00HRre-0s;
	Mon, 08 May 2023 07:02:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvuso-00HRrN-0Y
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 07:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683529326; x=1715065326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hdj4TzgRhzV/x+XxHlljcCtlZHqEWc7KZNXoQ5/botI=;
  b=ES1ZOKtqMqCR3yPAGJCSWTKUW6HPWHofZtS6awFjrLIyHaOzclDIft39
   dldZCUMSnK3iev/I7NxH3/ETNjjoCTFD+ccch4x5/gi8PhF51lgz5XOCB
   FWqxrNJIxbYkJy2oQBI7lH3bFZtFLNdVmrfLMtl2MQDQhvqgVoeXoZ2cl
   YPKPkcFbSphs1bA9csa8kH0rqtAysCfRbXycFf/Ve6eiwRZrtT8KH0SLy
   QI/Ui5QOADh+l0gMHDS0oOVeP8+aQAh57iVwlYTKT2rlxdK4JJ/VEiL9Z
   ASPHN4sNDETolMJJ6WgJUWdUl2Eyh/y/Udtm1CeMkGEvfKUQ6W0I2hauY
   w==;
X-IronPort-AV: E=Sophos;i="5.99,258,1677567600"; 
   d="asc'?scan'208";a="212855997"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 May 2023 00:02:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 8 May 2023 00:02:03 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 8 May 2023 00:02:01 -0700
Date: Mon, 8 May 2023 08:01:41 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Icenowy Zheng <uwu@icenowy.me>
CC: Conor Dooley <conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Guo Ren <guoren@kernel.org>,
	<heiko@sntech.de>
Subject: Re: [PATCH 3/5] riscv: dts: add initial T-HEAD light SoC device tree
Message-ID: <20230508-deviator-departed-55af603e50c6@wendy>
References: <20230507182304.2934-1-jszhang@kernel.org>
 <20230507182304.2934-4-jszhang@kernel.org>
 <20230507-calamari-gentleman-bbe62af06f92@spud>
 <394696a52bf1d767044e3f990cebfbaf69dabe70.camel@icenowy.me>
MIME-Version: 1.0
In-Reply-To: <394696a52bf1d767044e3f990cebfbaf69dabe70.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_000206_235688_6CB35E7A 
X-CRM114-Status: UNSURE (   9.19  )
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
Content-Type: multipart/mixed; boundary="===============5220015175058609767=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5220015175058609767==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ALAuARajoO6A4R1+"
Content-Disposition: inline

--ALAuARajoO6A4R1+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 08, 2023 at 11:32:17AM +0800, Icenowy Zheng wrote:

> P.S. which one is preferred by DT binding maintainers, the marketing
> name or the codename?

I don't see the benefit of using internal product codenames (even if it
did appear on their gitee) over the name by which it'll appear in board
datasheets etc etc.

Cheers,
Conor.

--ALAuARajoO6A4R1+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFieVQAKCRB4tDGHoIJi
0gpSAP9HMdmnHVMuFAiBvTS7zPx1QXPED1lHmFJ801dZR6FXUwEA6B+p+yA5dAYb
WcAMknoDtM3tL5ZpSUEfOSlY9jB8wQQ=
=LqF2
-----END PGP SIGNATURE-----

--ALAuARajoO6A4R1+--


--===============5220015175058609767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5220015175058609767==--

