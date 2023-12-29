Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2CCC46CD4
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 06:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HwJMxstYSEZKFQQ7T7nz9hA+yksugMT1UoSHy54f6MY=; b=Aku7w13jWLjaLh
	A067bhjO9pzyPrAawn57bVOK2deolhH6PhRW2ycNXZ4+RiLjmciaS2uL/M2gZgLZRU3HYAw6CTy6Y
	k0SpZ443IYmugYhlIVMhNqi04fAGT3ABXiSf0gPmala+hLuysCqY+x4g+u4WcNaepgKSrYdLbWZps
	6skR1kCzK9Yx9z+SiORb11ysV8PF5fwTLIf1/p84UJclnBs8nijtaak+Bf+nbB8HZH/RBCCAsgmgx
	BWfunRjOoxZLyFcjronh1rSZmtGx12+ILnFQiWwqvYGZeXzt8VTCtK8EUJSWsIlSvbvUAcvuiKEOq
	QbNKLftPC0A+CWU+oKCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ6lf-000Kfg-0d;
	Fri, 29 Dec 2023 06:54:51 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ6lb-000Kc5-36
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 06:54:49 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id BE36824E03E;
	Fri, 29 Dec 2023 14:54:21 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 29 Dec
 2023 14:54:21 +0800
Received: from jsia-virtual-machine.localdomain (175.136.135.142) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 29 Dec 2023 14:54:17 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [RFC v1 1/1] RISC-V: ACPI: Enable SPCR table for console output on RISC-V
Date: Fri, 29 Dec 2023 14:54:05 +0800
Message-ID: <20231229065405.235625-2-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229065405.235625-1-jeeheng.sia@starfivetech.com>
References: <20231229065405.235625-1-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [175.136.135.142]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_225448_164505_3C18845F 
X-CRM114-Status: GOOD (  12.06  )
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
Cc: aou@eecs.berkeley.edu, jeeheng.sia@starfivetech.com, rafael.j.wysocki@intel.com, conor.dooley@microchip.com, palmer@dabbelt.com, paul.walmsley@sifive.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The ACPI SPCR code has been used to enable console output for ARM64 and
X86. The same code can be reused for RISC-V.

Vendor will enable/disable the SPCR table in the firmware based on the
platform design. However, in cases where the SPCR table is not usable,
a kernel parameter could be used to specify the preferred console.

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
---
 arch/riscv/kernel/acpi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index e619edc8b0cc..5ec2fdf9e09f 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -18,6 +18,7 @@
 #include <linux/io.h>
 #include <linux/memblock.h>
 #include <linux/pci.h>
+#include <linux/serial_core.h>
 
 int acpi_noirq = 1;		/* skip ACPI IRQ initialization */
 int acpi_disabled = 1;
@@ -151,6 +152,9 @@ void __init acpi_boot_table_init(void)
 		if (!param_acpi_force)
 			disable_acpi();
 	}
+
+	if (!acpi_disabled)
+		acpi_parse_spcr(earlycon_acpi_spcr_enable, true);
 }
 
 static int acpi_parse_madt_rintc(union acpi_subtable_headers *header, const unsigned long end)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
