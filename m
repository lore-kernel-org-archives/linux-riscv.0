Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C888ACA0EFA
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 15:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W6geV9G6pEDBO4MEdNDw/UCnpJjA1rV4WZst9FHOZ84=; b=UJ04FdMGXNchX6
	UDBNcm8Nx2V8CbvgYEhjOdxuSc531R5t9AhI3m+mKEHU/ZCRpFcM4Y8fC4xAcIO2BrSoHB4pWQcqp
	2N34fiNc0vgbpGfse3IVozTrS1H10F+IVDZCbR1jtykHMGEY5unSLK71fLvFN/oXznhyPyLCB/d7g
	Ne9hhEOWmRsO3Rf3e7yV9WFOz0AT3tT+Ty9782AXVKfGgDna7JrTPwHclzLdnOd4bpvN/5VocLjW+
	0mTZYeSOd2PsFiHVbU5w/QjlyJRwSuLhCjSd/ffbGw50oG174g9FMlohIuKG4I8lA6EXmI4YHN5iE
	SbKm//uwJ8pihTvOfMfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYgE-00000008N0T-1lVY;
	Mon, 25 Aug 2025 15:00:18 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqXBa-000000084e1-1NGT
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 13:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=816; q=dns/txt;
  s=NAESA-Selector1; t=1756128274; x=1787664274;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aDkMQ9bOVnOaD9Ibw67F6Eq7uLk+0ksriwCUYK9VkSU=;
  b=uC57WgCamcnbXPF40gqlsQ5oue0wgrnpqnBL9SH5BpE2cMX9ppUrwHTt
   rF/fO1NGcOQ0huALqS35ahX9dyFJCpMOtMMm6WLrE6v4jcS7vJ/AC1pj4
   9JNboyvzVZXO7hUa6lOKFGT7f1um6aDSOCIlYOFOzk0iWjvafkwQT73aw
   4xoLA4h6V7/glvW1CiurQ20k4UWC5NQeDVzzEJgN82iFtws2rb96WP5Lo
   Y+idoQogTOhWG4lC3WyGPWNlFMvj9Mo1Vt5iJbsf8RE1ABm1OrTQt7B5h
   PRTY/2tu96DVJaYQnPGrVA5MREbH1m1nqiQQIuQrHqMZ/PABO95+f8Xxc
   g==;
X-CSE-ConnectionGUID: 40PHyqu8SwOUXMOdzzgeAw==
X-CSE-MsgGUID: 0CY1ihq6QEiBvR/qFGYBsA==
X-IronPort-AV: E=Sophos;i="6.18,213,1751263200"; 
   d="scan'208";a="31566531"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 25 Aug 2025 07:24:31 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Mon, 25 Aug 2025 18:54:27 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH v5 2/6] riscv: Add Kconfig option for ESWIN platforms
Date: Mon, 25 Aug 2025 18:54:23 +0530
Message-Id: <20250825132427.1618089-3-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250825132427.1618089-1-pinkesh.vaghela@einfochips.com>
References: <20250825132427.1618089-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 25 Aug 2025 13:24:27.0894 (UTC) FILETIME=[951F6160:01DC15C3]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_062434_423217_56732A85 
X-CRM114-Status: UNSURE (   7.05  )
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

Create a config option to build ESWIN SoC specific resources

Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.socs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 61ceae0aa27a..848e7149e443 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -7,6 +7,12 @@ config ARCH_ANDES
 	help
 	  This enables support for Andes SoC platform hardware.
 
+config ARCH_ESWIN
+	bool "ESWIN SoCs"
+	help
+	  This enables support for ESWIN SoC platform hardware,
+	  including the ESWIN EIC7700 SoC.
+
 config ARCH_MICROCHIP_POLARFIRE
 	def_bool ARCH_MICROCHIP
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
