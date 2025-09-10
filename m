Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B85CA101F
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 09:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E5jC2TDN90ab6U+4hdIXxwHnHZ8nYjCXXq+gDb1pR4s=; b=t8XqxwX2iqHrAf
	48LAX6C+BcDvebYxMhU5mG3QRTPhTIsnnrZFovZhKs1tLZPhlVDDZJbONyj1QzYb6uNuCWvWLYLGs
	lY2+ElLmlVjkqasHq/52skluXfrGZ7b+FDHu08Gs3S0YSPg9kASYterJ8COR8YhIQOtQ1GlNrTRV9
	Pf6VKYwlxqHgHJ3N9zZSi5rzNH1XIzKiojmUUPMru+ro0/fYzHWfnBZGxknGWGdN8KCvcBmNXmY3t
	ZyNdt2nLuHmLvL9XweSP7an+xFGJoQNvwtL2rY2T8m7zbneYvW+1MzI8NuTjKxHqd+gdm68nDylRj
	Lo007DmMzjyAmDVd1wRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHDM-0000000DF0O-2Zfc;
	Wed, 10 Sep 2025 09:34:08 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHDI-0000000DEyq-3efF
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 09:34:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1757496842; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=H6tZbk8xd14arH4x+y5nLcp4ATXMokGEomrYYieeMvA=;
	b=gELJHgkci93cnWuBCIn2/Ojyd44punoVHsouC2auzIK68AuQhIf0DTg7U3u70a1svsjoA2ZMSHzBUCQ7KqynwPBxxMXaSOXtVRyPQBuuCvLAg6qi2x+48vcnurQZPGablakRoF8J6JN1Lkm6dbKvGvkKKhf5NS3LvTNaFyNoMOo=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WnhhBon_1757496838 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 10 Sep 2025 17:34:00 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: xueshuai@linux.alibaba.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: james.morse@arm.com,
	tony.luck@intel.com,
	cleger@rivosinc.com,
	hchauhan@ventanamicro.com,
	tianruidong@linux.alibaba.com
Subject: [RFC PATCH 2/5] riscv: Define arch_apei_get_mem_attribute for RISC-V
Date: Wed, 10 Sep 2025 17:33:44 +0800
Message-Id: <20250910093347.75822-3-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20250910093347.75822-1-tianruidong@linux.alibaba.com>
References: <20250910093347.75822-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_023405_064780_F883C2D0 
X-CRM114-Status: UNSURE (   8.32  )
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

From: Himanshu Chauhan <hchauhan@ventanamicro.com>

ghes_map function uses arch_apei_get_mem_attribute to get the
protection bits for a given physical address. These protection
bits are then used to map the physical address.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 arch/riscv/include/asm/acpi.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 6e13695120bc..0c599452ef48 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -27,6 +27,26 @@ extern int acpi_disabled;
 extern int acpi_noirq;
 extern int acpi_pci_disabled;
 
+#ifdef	CONFIG_ACPI_APEI
+/*
+ * acpi_disable_cmcff is used in drivers/acpi/apei/hest.c for disabling
+ * IA-32 Architecture Corrected Machine Check (CMC) Firmware-First mode
+ * with a kernel command line parameter "acpi=nocmcoff". But we don't
+ * have this IA-32 specific feature on ARM64, this definition is only
+ * for compatibility.
+ */
+#define acpi_disable_cmcff 1
+static inline pgprot_t arch_apei_get_mem_attribute(phys_addr_t addr)
+{
+	/*
+	 * Until we have a way to look for EFI memory attributes.
+	 */
+	return PAGE_KERNEL;
+}
+#else /* CONFIG_ACPI_APEI */
+#define acpi_disable_cmcff 0
+#endif /* !CONFIG_ACPI_APEI */
+
 static inline void disable_acpi(void)
 {
 	acpi_disabled = 1;
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
