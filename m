Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14CAD3941A
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 12:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7UbE7N+5zg8MpnIE59WAyjOaUkLBuygDQEAAdakGB4=; b=yCPi7etV1fsUP1
	Lxp4gq87lJBLeYgTx1a+abxf4Lzwo9slWmnPzajhGDJOhS+MRnonfToXgPmcQKi3737Zn+DeBzntw
	BFCEytdQ5QhbxeLAvhCD5i0LNnZMnzDcQSwib0p4D5BlVst6Uu3xISgxssae5OXbc1NvM1NTBzn8G
	JXJJaNV0ixwOIwiwJGqmEK1zohHEpWfBGfw1Sjpt8ZXG1VY17VW8NFtU3qwXiapeO2fodiXUz0KdQ
	z13UkC+HZgKWZevrcKYLpMm4c+pi/Ud0+YIjreIKoHW0ZlUeLor/LSbiO6eNghNlQaunNd6PXL3PW
	j5LlZCqEkBHNSVMRuUIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8H5q-0000000Ha7B-1Mrl;
	Thu, 02 Apr 2026 12:24:14 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8H5n-0000000Ha6j-2gji
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 12:24:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w8H5Z-0002fM-Ed; Thu, 02 Apr 2026 14:23:57 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w8H5Y-003N5G-2S;
	Thu, 02 Apr 2026 14:23:56 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w8H5Y-000000009Ot-2kEj;
	Thu, 02 Apr 2026 14:23:56 +0200
Message-ID: <9336e65273fb9a4c805c9703ad20ea803b74a860.camel@pengutronix.de>
Subject: Re: [PATCH v1 21/22] reset: starfive: Add StarFive JHB100 reset
 driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Michael Turquette	
 <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Stephen Boyd	 <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti	 <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>, Kees Cook	
 <kees@kernel.org>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, Richard
 Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-hardening@vger.kernel.org, netdev@vger.kernel.org, Sia Jee Heng
	 <jeeheng.sia@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>, Ley
 Foon Tan <leyfoon.tan@starfivetech.com>
Date: Thu, 02 Apr 2026 14:23:56 +0200
In-Reply-To: <20260402105523.447523-22-changhuang.liang@starfivetech.com>
References: <20260402105523.447523-1-changhuang.liang@starfivetech.com>
	 <20260402105523.447523-22-changhuang.liang@starfivetech.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_052411_683110_1A70B518 
X-CRM114-Status: GOOD (  13.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Do, 2026-04-02 at 03:55 -0700, Changhuang Liang wrote:
> Add auxiliary reset driver to support StarFive JHB100 SoC.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  MAINTAINERS                                   |   6 +
>  drivers/reset/starfive/Kconfig                |   9 ++
>  drivers/reset/starfive/Makefile               |   1 +
>  .../reset/starfive/reset-starfive-jhb100.c    | 121 ++++++++++++++++++
>  4 files changed, 137 insertions(+)
>  create mode 100644 drivers/reset/starfive/reset-starfive-jhb100.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3af9d79b7daf..4ddf8ba2e60d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25319,6 +25319,12 @@ L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  F:	arch/riscv/boot/dts/starfive/jhb100*
>  
> +STARFIVE JHB100 RESET CONTROLLER DRIVERS
> +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> +S:	Maintained
> +F:	drivers/reset/starfive/reset-starfive-jhb1*
> +F:	include/dt-bindings/reset/starfive,jhb1*.h
> +
>  STATIC BRANCH/CALL
>  M:	Peter Zijlstra <peterz@infradead.org>
>  M:	Josh Poimboeuf <jpoimboe@kernel.org>
> diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
> index 29fbcf1a7d83..6f9a0f24f9b9 100644
> --- a/drivers/reset/starfive/Kconfig
> +++ b/drivers/reset/starfive/Kconfig
> @@ -19,3 +19,12 @@ config RESET_STARFIVE_JH7110
>  	default ARCH_STARFIVE
>  	help
>  	  This enables the reset controller driver for the StarFive JH7110 SoC.
> +
> +config RESET_STARFIVE_JHB100
> +	bool "StarFive JHB100 Reset Driver"
> +	depends on CLK_STARFIVE_JHB100_SYS0

Please make this buildable under COMPILE_TEST as well.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
