Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D942C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 12:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oy0Wzb1F0y4LWFGnaqZCmS0CdkeHXbgQ3+ARZaDdZY4=; b=pxBl+kJ8Ds4M3w
	FjnjmXZUYpaDOalH3HTKvktIQ79YRwB9zjE8UIi0ejph62Q+lR2eWVeZVdUw9IXafP9EIW+uWQIB3
	6XHGIZJegM6Ix9rvtk4Lp0sp0/UKzqQ3VtwCxzRLO0Zd4IY5LhJIdjQdxuRbYqrRnB3NazE0f4RA/
	sdZHX5dbgMKWzM99/hxvWWuFDA8ZfJwKZf/U0DMuSTjnlYfwkc+2vOo46NToHw/LljjD9Quqq695j
	z3P3Kowu9yqYGsicBk7S3BqfzOWHhUk8lDiKTMxb14PjjGQPm2usr9vJT1MFVml0kp9ieqI9Z97xZ
	1xFLGcw1gAMhFiq6+b3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8L0H-008fFK-1K; Mon, 04 Jul 2022 12:16:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8L0D-008fDF-14
	for linux-riscv@lists.infradead.org; Mon, 04 Jul 2022 12:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656936992; x=1688472992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ko9vKOsJ7sZrLYlGKuINmPgddn22iKvDujCMEuBPRPQ=;
  b=Gzt40sQO23Y6B18/elxlsFMJw585IDjv0FrOYLWJrzC2SnmWieo9gjwV
   qAiKl2v3Jh7CdaF406V0w4Bh0IoFWZTAWFPOYFjA4nB06g+gGXMhTaRSk
   4JBLYfMk+zm0u8B5H6OBIQIw10XHULbhLiHDdHQXjNm44UAGmL5wZ7IFb
   KjzS/SfLFwsMVpFDwBwiQjsKiXzTWIloIKb5yBE+KjT/nzejefACOn7W1
   KDVg/WprUmL7OqsYFiLliJVOTV1FOPmz4A9L+w2P6EaOg0+L54MZ5YPak
   ZXkDReZCuGKp118yGH+4x+j9UVmx2VkgINm3zQOsMz8kmqX5nXxflwFXj
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="170953274"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Jul 2022 05:16:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 4 Jul 2022 05:16:32 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 4 Jul 2022 05:16:29 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Daire McNamara <daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v2 04/12] MAINTAINERS: add polarfire soc reset controller
Date: Mon, 4 Jul 2022 13:15:51 +0100
Message-ID: <20220704121558.2088698-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220704121558.2088698-1-conor.dooley@microchip.com>
References: <20220704121558.2088698-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_051633_092746_BA713E3A 
X-CRM114-Status: UNSURE (   8.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add the newly added reset controller for the PolarFire SoC (MPFS) to
the existing MAINTAINERS entry.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1fc9ead83d2a..7b82ffce6c22 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17159,6 +17159,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Supported
 F:	arch/riscv/boot/dts/microchip/
 F:	drivers/mailbox/mailbox-mpfs.c
+F:	drivers/reset/reset-mpfs.c
 F:	drivers/soc/microchip/
 F:	include/soc/microchip/mpfs.h
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
