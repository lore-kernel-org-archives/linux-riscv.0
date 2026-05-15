Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A683CD4851
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 10:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7EQlJysOlRnENOqYp3gfIAklX8vI3zIDPXYo6fYZOs=; b=DBiRNOx6OVmnnDuEsyGUPk71KG
	isnNenU/opSvDAtZZ6VDXD3vrKpyr2sfnumqn9gIw0G2Qw72g61cO8Kak5pAUQga/gA/WW3lFewA0
	+Cbh8sbaN8ioeKFuylvMDzu6XfOxUXFe+mhHuv6W/4Ge1j2uCBRgbSsJ2cRtxLSvI8GnslovZmaNa
	eJU4rUaqCKNn+/FtiXEwmNz4F+KpR1w0zxGN9tZrug0Ej9fVneh3oJYqmcE/GqLabuAh2wIUPrXMQ
	tFMTbZuV2DzumGMWv3A4lrNMw9MXdmKv7OjqpqRTzvY6/eUP2SFmmtq5sDlXir5zUusA9nyGPR2IV
	xDWtb1iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpRx-00000007zZw-3ejG;
	Fri, 15 May 2026 10:07:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpRv-00000007zZF-0j6X
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 10:07:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778839640; x=1810375640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p16Samuzcb7UeG8Qdbq/J3WL7f5r6uCXgJkREuEk3FE=;
  b=0MQpcXCdPYEcfEZJYgUopfbWfuuJ2A6t2bhi3xuBmHe4VXLhU7gnE4BV
   RLUBVg5C6AhIz4WsXjhSBd8y+6Bp4/RQLhcQM1HVLl+zdLhrWHjSGmw3c
   qqHL+i72/cnZHdkZpgFpJcyNJZen0PqjgUqTbNMf6MdRc/zIP6PJ5F1O+
   P2oY8LKtOsSESzTvZl++xIMII2bp7ARBpmNXfsSfnQJTl6WJwCJ/NgQN5
   +6lsL5TUBUywE5YDT/HaGeAamYxk3LUJJb9Ur7/K1G7+l4ck1gW55WEK8
   7pbyu3yrXkP0056F0CFXSc2NTfi965Dve5TqvEUO2C4gnJuhEcRlyqxC1
   Q==;
X-CSE-ConnectionGUID: 3YPa1uukQxehnbSvoJmU4A==
X-CSE-MsgGUID: LTVlmf/nT4aZ2CNGcybFHQ==
X-IronPort-AV: E=Sophos;i="6.23,236,1770620400"; 
   d="asc'?scan'208";a="56789185"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 May 2026 03:07:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 15 May 2026 03:07:17 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 15 May 2026 03:07:14 -0700
Date: Fri, 15 May 2026 11:06:36 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jia Wang <wangjia@ultrarisc.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski
	<brgl@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, Conor Dooley
	<conor@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 2/9] dt-bindings: riscv: cpus: Add UltraRISC CP100
 compatible
Message-ID: <20260515-possibly-showgirl-a38423881f96@wendy>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-2-bf559589ea8a@ultrarisc.com>
MIME-Version: 1.0
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-2-bf559589ea8a@ultrarisc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_030719_276266_6AC50B5D 
X-CRM114-Status: UNSURE (   4.74  )
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
Content-Type: multipart/mixed; boundary="===============1211121569218019704=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1211121569218019704==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qa3Omcx9s0HAw1jP"
Content-Disposition: inline

--Qa3Omcx9s0HAw1jP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Qa3Omcx9s0HAw1jP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagbwLAAKCRB4tDGHoIJi
0r/OAQDRlYqfkdPpp90m6Qrq0ztSJvu2u34C9qGWQNkz4kamQQD+Pj1GthASpIRQ
hFGwBclBGjHAlwcUVTh78KCnFIt2PAk=
=VDHT
-----END PGP SIGNATURE-----

--Qa3Omcx9s0HAw1jP--


--===============1211121569218019704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1211121569218019704==--

