Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26D6C5B552
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 10:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3yjQ98X+k0h1NYMQX/BwcxrAWuzdVAh90ggbTBAES2w=; b=kkC5K9y+ZxWE0O
	+i0EeLQVbqyN6r2pVI3KSYDPsqVw2KPAAftEH9T6A/5Imqw3vykLhNd1Y37OQB6MKrxR8MeOJOHG6
	6+LyS4UPQUWUIkTsQDMlbPig4S3p4J+tQc5chYISqQyp+DxCCoO/gBhEoLPTYmoWifcBdujHJvq00
	LG0a+loAwa094IuUrwFe/RgAiYR7/ELbQR0WKi/ezArG2YdWXFUul6oUPeZQsJizAb7IBBKYf4wmp
	gZB2TKcuJFzENHrNXqAsZH0dS18afC93u7ET5CxBgJU0L+gKb5d/o3HHDkOCjz+mpCb+dug5TschQ
	GJXxHyKsSM9cYIl1720A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwfZ-00000006Z1V-10gR;
	Tue, 10 Jun 2025 10:57:29 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvsR-00000006S4s-3HEA
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 10:06:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749550003; x=1781086003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lPz7wkEBE69zrXNtMCgnkyFvmJop4UtCSyWeiYqIwfA=;
  b=Vu0L/UolrYA6eOec9RDaWoh/ZqH1x+gDJLm4lW79x5f42WrtcMS3ClbT
   MNzPPaBNZffOz+7wyBRETA+gfUGT6rR++5leB6b4lQmI+yR5AA1HvBPDA
   kqT7SP3XHNdyqKgqAghRHcsgLuCnvdozKgv9j7xsHMBVYGojzOoG6BknT
   0cGCDnzCgSFmiMdpNfidJHT0Z6iQZ1khEj02hf/2PwwMgpyH76POeyVvl
   CbQ9GGlquBGjyS+DggcgGaPgSbdv8SanWGXvF/Jfm/wDScyyyL0G7AMa+
   8dXTYTQLU6T4JuYZFS/NFCBnWWRzEoBBFIMIuJSU42Lb4feovFJ3r5J0Y
   w==;
X-CSE-ConnectionGUID: 3emX4oBjR8yFNJI3/XKeFA==
X-CSE-MsgGUID: keewxWnFSIeRGZtTMiw68g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:06:43 +0300
X-CSE-ConnectionGUID: ax2a7oOURvuO1SiclmLw5w==
X-CSE-MsgGUID: VpswVmopSHSN8kdMQv7iGg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces03_data.me-corp.lan with SMTP; 10 Jun 2025 13:06:41 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 10 Jun 2025 13:06:41 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v2 7/7] irqchip: aclint-sswi: remove extra includes
Date: Tue, 10 Jun 2025 13:05:40 +0300
Message-ID: <20250610100540.2834044-8-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_030644_116646_3E4532AC 
X-CRM114-Status: UNSURE (   9.17  )
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

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/irq-aclint-sswi.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
index 3aa074004dca..dc437a4f82db 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -6,15 +6,9 @@
 #define pr_fmt(fmt) "aclint-sswi: " fmt
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
-#include <linux/io.h>
-#include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
-#include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/pci.h>
 #include <linux/spinlock.h>
 #include <linux/smp.h>
 #include <linux/string_choices.h>
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
