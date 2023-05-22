Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B435C7EE26
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 13:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSUJMThYxX+u0gUxLsZNc6a/Vn02xZVUhED6162Ph5o=; b=lhX/syu7DBzdiiUCAmsA2qN+2Y
	UDU2JNCzU1zozpuw1Sc1RkESr392o9RX1W0Uj77C7RB/2mzLcCp8z9wcq/NUUaUO37q1fpjvTFjLT
	4+/evQ7vNVs6yVU2VsGU+TQDhNKguE8OT8uDmvWyHCm9tmGB8IKYvQMzllRmkeGj3+tBRry50KKh9
	km+OcyiRFzSt0wm0KzER3vAEquUWM3nwRtBYlc5tN8O8GnKvCyUbEineJFBZRSLPGtTY+yJsHXjUd
	gbTLEYqNiSYSJAU3DKebpv4iYw/98sUSaH9e4blS8xqdCt1qtv+j27Z6QYkiCRCaSRBhcPQs9i3Hm
	VKWV+hBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q15KC-006cT2-0W;
	Mon, 22 May 2023 13:11:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q15K9-006cRt-0N;
	Mon, 22 May 2023 13:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684761101; x=1716297101;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xpyLIb2+OMD3ly4N+A5YZqQ6cY7XOV1lf25zcvDcWtE=;
  b=fXhfEnyv6kNzwl4ZHRWWPUb/OPzcAkqbp/S8prAJ1phZQ+8vqIHlHelf
   KH14Yd/PbpRDmnA2hr4o52S12ANPMcWWulYIIhRshmYE2l1HS2dHwebGm
   WP3mWSqlLIu8+sNuP+x8kB2arJFHbifdpUl8dcJWG8V5B8767Y4VtqJ/S
   AkQdaIjeor4KV2C1/5/Mh4cb7+5FSuCrb3zuwGf4A+QX5K6l+v2pvPS11
   eC6wFlNSYgr6u/3iShhSc78Y8EUrWrOYCZNpSPmnhD4lKHC6uRGuOn8MH
   OPiFq6BXwGauPHL4aOzYxVFI09Rc70exe8Jf+vKsh2xNjMJMHlxPZZE/c
   w==;
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="asc'?scan'208";a="153308173"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 May 2023 06:11:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 22 May 2023 06:11:36 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 22 May 2023 06:11:34 -0700
Date: Mon, 22 May 2023 14:11:12 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jack Zhu <jack.zhu@starfivetech.com>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 0/3] Add JH7110 MIPI DPHY RX support
Message-ID: <20230522-extradite-nastily-c2a88cfd2f02@wendy>
References: <20230412084540.295411-1-changhuang.liang@starfivetech.com>
 <93d39956-25c9-971b-e73b-09c69e803341@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <93d39956-25c9-971b-e73b-09c69e803341@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_061141_206525_BF455417 
X-CRM114-Status: GOOD (  12.32  )
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
Content-Type: multipart/mixed; boundary="===============8868822502308086710=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8868822502308086710==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ueSz+7+usqbjXZtt"
Content-Disposition: inline

--ueSz+7+usqbjXZtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 22, 2023 at 09:00:04PM +0800, Changhuang Liang wrote:
> On 2023/4/12 16:45, Changhuang Liang wrote:
> > This patchset adds mipi dphy rx driver for the StarFive JH7110 SoC.
> > It is used to transfer CSI camera data. The series has been tested on
> > the VisionFive 2 board.
> >=20

> Can you help to find the Vinod reviewed this patchset?

I am sorry, but I have no idea what you mean.
Are you asking if I can get Vinod to review the series?

Cheers,
Conor.

--ueSz+7+usqbjXZtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGtp8AAKCRB4tDGHoIJi
0oseAQC5Ema0k8zP3rAXvlOOucLhHBUucJkcO7G84GGXZOyIgwD/Z9jdZdiFz5Yf
XgHWF5jAmdOU/G75KFDw9g6CW4IHZQo=
=1M3+
-----END PGP SIGNATURE-----

--ueSz+7+usqbjXZtt--


--===============8868822502308086710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8868822502308086710==--

