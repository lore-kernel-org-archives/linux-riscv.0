Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CA4C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 08:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vcb4SN+7++MMqMGBZlcTHqISE6M07WDeqc0RSMwInz4=; b=z/1c6XO2eU2LKc
	P/hCkcHNHnfsvOidY/BRXpUGMt+yIZRJErzk9qFLEsmBQB04dwjp++XlpomC1Vom4vxNbcwgeUMwm
	2Xv07bVWWs6vU3yvyG26NazzNa6uX/KihD1eL40wnStPwqzX6WLFYJIalmUUOwAFTkGUnx+YVJ5ff
	VkvsvIgsFFPIyHBruXaFnGr/YSic4FooIfxvcfjzB8Ehf/Y2okDQTxyaFOY6hSwSNUlHPBaPb3Jtb
	SXGyABo6h8yYb3Pu3gC+oHFM0O3KImUk3OC8b66KYzQnfVbg5ulFwNvHPrJ7ApvzKP36zBMEgbm2z
	UQPG6Erpx4CDQdlN7wYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhSeY-00CYbH-GS; Thu, 21 Apr 2022 08:59:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSeU-00CYZ3-Sj
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 08:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650531543; x=1682067543;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RLw1mhSx4JnJWY7T9B+yYOnuF2rUPtAaGFAVz/XWDdQ=;
 b=Yz9QegByZsFAv3KQxThCVZUauaJcMKa9Rob39zF5Utvf11/OYCKvtuEb
 hlEqat1q71/j0zQKdtr86akmm6WE/O7TiEakX/SXcKIADNsXmR83wf6AB
 IkbaV14iZpN9g9NO4Dw6TszgZAPzs+EHyJcJDuqep14OuIbQRHBxsltop
 bxZSOhErsP6lMMMIO9IUtnl8TalJ4SOd/MXyGvTv/iBmxpWZ/5DfVCDP0
 pYPppCgtcc0hivDi4IT9bBMk8lJYAOetBeDK3ACsD/fjB9Spk4VprC5jO
 OcGkx2cAIJmYYhl2v5h6Hip2vQRH55NaUvQxdqCHyy2RNIteHnSyb8HPb Q==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="153338848"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 01:59:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 01:59:01 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Thu, 21 Apr 2022 01:58:59 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <daire.mcnamara@microchip.com>,
 <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>, Conor Dooley
 <conor.dooley@microchip.com>
Subject: [PATCH v2 3/4] riscv: select vitesse phy driver for polarfire soc
Date: Thu, 21 Apr 2022 09:58:05 +0100
Message-ID: <20220421085805.1220195-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220421085805.1220195-1-conor.dooley@microchip.com>
References: <20220421085805.1220195-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_015903_016711_6D84048B 
X-CRM114-Status: GOOD (  10.48  )
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

There is a Vitesse VSC8662 on the Icicle Kit, until a better option
exists, select it in Kconfig.socs for SOC_MICROCHIP_POLARFIRE.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

---
Palmer: You said to put in a comment, but I have no idea how Kconfig
expects a mid line comment to look. kbuild didn't seem to complain about
what I did, but lmk if that's not what you meant.
---
 arch/riscv/Kconfig.socs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 7f93c729d51c..ff2b8b90db19 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -8,6 +8,7 @@ config SOC_MICROCHIP_POLARFIRE
 	select HW_RANDOM_POLARFIRE_SOC if POLARFIRE_SOC_SYS_CTRL
 	select PCIE_MICROCHIP_HOST if PCI_MSI && OF
 	select SIFIVE_PLIC
+	select VITESSE_PHY # present on icicle kit
 	help
 	  This enables support for Microchip PolarFire SoC platforms.
 
-- 
2.35.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
