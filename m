Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7092DC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 12:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hEm1pbM594Z/YBlAlQ/ZgR7/RSDO27Vv4Voqg5nvhA8=; b=Fgmog9wWHDK7TQ
	zoCBREgzOJWLzNA5yAyRXBOIxP0tNdvRV+AEAJuPrrx+Dx0BUWw0CYkveze9vGzmhM84QAcPFYufL
	2kNWWtkiWlvYD5bdedauHayuyNDN64fM2fmWiHqy+WHgZNaKBCk3kceKzHckPSSSEOLfPp30ETi4f
	x/3Ova4End5q1BGujSxnAxskI1T+CQwrPlTY8qFlYyfn909jh8Y72JvlHYBf70AGJDxF2z3Gn69wc
	Nw1R0p6i88WHUCiKrrQWDhndzpAhMuOADj35ypCbHGtk2Q4pC7WqKj3TLRR52uT8mrV+MkYkqG0CG
	28sugHDxFWpeHOCAzS6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfLSh-00A9SZ-CZ; Fri, 15 Apr 2022 12:54:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfLSW-00A9Nc-7c
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 12:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650027236; x=1681563236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jpQn21lfBJqxHASJ0XDepMTCjpzWE4fmKlR+6b/wZig=;
 b=cPsPLYuOpEvq5PmUrxNPlo3fovgHE2A0sbuQYGdX2lz5ntbwAfkRRH9G
 z6wcNE4JcePtXmTJIYlL9TzNMF6qHPrkI6bmys12C/3VEI1WMDzAczcbM
 2cVW9MVZwNnB45QN0SozDThDguNYTUp+2hPm0yUz/eed/sJcbB6XDhKLM
 nOx68sMS+l1yaGLhrzjkyeJ1WjT6i1yaobJLtDb5l4sD7GmNzimqmk0bL
 /xdUb99FD6sXk4MwTtkPqBSGQYaoCrvbaiESj19428J3O+w8SIqaAHdae
 aW6uDqTeBjC4+HRwW0Gv6E6Dnkax5HJjeCL9j2puAlajCEfEMg6HL/5SS Q==;
X-IronPort-AV: E=Sophos;i="5.90,262,1643698800"; d="scan'208";a="160220612"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Apr 2022 05:53:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 15 Apr 2022 05:53:54 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 15 Apr 2022 05:53:53 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 1/4] riscv: select peripheral drivers for polarfire soc
Date: Fri, 15 Apr 2022 13:52:19 +0100
Message-ID: <20220415125221.2871991-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220415125221.2871991-1-conor.dooley@microchip.com>
References: <20220415125221.2871991-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_055356_409917_8A690859 
X-CRM114-Status: UNSURE (   7.30  )
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

Update the SOC_MICROCHIP_POLARFIRE kconfig entry to select, where
applicable, the supported drivers for the SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.socs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 34592d00dde8..7f93c729d51c 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -3,6 +3,10 @@ menu "SoC selection"
 config SOC_MICROCHIP_POLARFIRE
 	bool "Microchip PolarFire SoCs"
 	select MCHP_CLK_MPFS
+	select POLARFIRE_SOC_MAILBOX if MAILBOX
+	select POLARFIRE_SOC_SYS_CTRL if MAILBOX
+	select HW_RANDOM_POLARFIRE_SOC if POLARFIRE_SOC_SYS_CTRL
+	select PCIE_MICROCHIP_HOST if PCI_MSI && OF
 	select SIFIVE_PLIC
 	help
 	  This enables support for Microchip PolarFire SoC platforms.
-- 
2.35.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
