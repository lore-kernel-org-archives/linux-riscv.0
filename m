Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36453E68974
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 11:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ldyzP5OceztCMQo5PZtgC45A4U5H3TDTalfwpNeT/80=; b=cZ+Nac5NjRVjsc
	dOTmMBW0dwZ3bi+CFHLbNwAIXb0L2BWSKk/IozOLOolWcTHmjOQVKOkoZ8CxOZCPtzbnroDhpdn6i
	I5bn5OS4adz0UPek3125lQVLM6dg658sX/4+XuoG3lOaGbn1cQSk+6+fOvDMJ7XDHzee/wdoUrUzX
	MFDT/cStmQjmNhdcrrYw+ZFIAJwrYltZ/zgZiIP9IZRE4pDYLiPjLgF/cjtYUnj3OhNEhCCwczvnh
	3b3m01ZMwBat/MGenUyhM/z1J6sxvxTs4Qot30H8PzpXCqhZj8px9dfS+29qNKk0n8w/ndMBEnVwW
	rf/BJL3svSuJauKTe8Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6TGL-00000003Npm-1FXM;
	Thu, 31 Oct 2024 11:22:49 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6TEe-00000003NbE-16zM
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 11:21:08 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20b5affde14so6649305ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 31 Oct 2024 04:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1730373663; x=1730978463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SgD3pKPtdFzcz4t1a0u04lcW4uB7d9j6oqT5niate0A=;
        b=lbtkfcIzhckBs6Q6Yl7C/Y6z+14gxxy73vQIk2xUqSblvbvNNxTcpxJPyycYClFtq5
         efPTuNeKtzWIF7iuAX4DOsbJRM1VBN3Mi41xnDdR1akMxQx8SrzRRzViTVhc26jUJkcN
         isQ+Z0tmoWuwUPipYayQsUnLknA/GKv9yzeG7ymZaWocDVdYX3DDrQAhryoZWNsv+7+S
         i1WXgZ3zHRHCIb2knUq5G1chwxE7bq94k64KX6wX8ac3uRNQkUWH0/617vckg+CL/yDP
         okmFaUMFr83pxEGWbuEBPtSsmc8JVXmzl8J8vYVWzODXEXYNrS0mmGSYyJbEPxZukP4+
         hozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730373663; x=1730978463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SgD3pKPtdFzcz4t1a0u04lcW4uB7d9j6oqT5niate0A=;
        b=V1NW6aXXU5KQ9UQ+IU6OW/JdqLBEuDw8vD2PbAApPM+uT4Z6eNYQodO98bT9WMU2in
         ECh3/83/A5x9DzIqcu0zR6OCLHdDC70YgrRKPEDO7Fg7CTgpmPpFSR5H/JKTEwuiWx0J
         Lk4D/gVdGUJI8XeTk/rX8AjeTS0JmnXF6aGT8KI7qi5qV2RY9iK9NXe06QEDV9IEp9xK
         Ex4V0bWOq215PNYmvYapEDlEwXKW4KQUFo4h8gVZt/Pt/KAYcL6/luZntvWwiEYKfuxv
         zqSkZw9OvuvRIwoLWCnwgZ00U4awF5aV8fQ55YHFuS2uWCiIZJwIpC3ndhJWmam1DeLS
         9imQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJQOsWtXbC98ZUX3ZyKZ6ZfqWvU+zIZE2dD2ADC8nIYz1YrlGE29F43DorWnXlQmNsVqhKzx8GH4RHCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwB6zRM84RhvM0yWxdCXS2CUMigdoCkFvSV2+1bStEx/tMFwKMJ
	7JN2QJekoGlNopeBUcUwQd/5gfbIyiGUhI57mT09+zBv0kiF30b6NevrzLaHfQ4=
X-Google-Smtp-Source: AGHT+IF6rCp8uA7CIfzXSTYHLrzQK+lu+COWzmT52riKYUQh7Yt9+TYvl4AYGhI2GgQcWukgSatRcQ==
X-Received: by 2002:a17:902:da82:b0:20c:cccd:17a3 with SMTP id d9443c01a7336-210c6c346a9mr224734955ad.46.1730373662606;
        Thu, 31 Oct 2024 04:21:02 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056efd01sm7513455ad.52.2024.10.31.04.20.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 31 Oct 2024 04:21:02 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: punit.agrawal@bytedance.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	rafael@kernel.org,
	lenb@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	sudeep.holla@arm.com,
	guohanjun@huawei.com,
	prarit@redhat.com,
	gshan@redhat.com,
	cuiyunhui@bytedance.com,
	dwmw@amazon.co.uk,
	Jonathan.Cameron@huawei.com,
	liuwei09@cestc.cn,
	maobibo@loongson.cn,
	sunilvl@ventanamicro.com,
	alexghiti@rivosinc.com,
	haibo1.xu@intel.com,
	jeeheng.sia@starfivetech.com,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH] ACPI: fix the warning reported by the sparse
Date: Thu, 31 Oct 2024 19:20:30 +0800
Message-Id: <20241031112030.72647-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_042104_335352_BE6257E9 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

All architectures use early_memremap() instead of early_ioremap().
Therefore, to solve the warning detected by sparse:
../arch/riscv/kernel/acpi.c:213:30: warning: incorrect type in return expression (different address spaces)
../arch/riscv/kernel/acpi.c:213:30:    expected void [noderef] __iomem *
../arch/riscv/kernel/acpi.c:213:30:    got void *
../arch/riscv/kernel/acpi.c:221:24: warning: incorrect type in argument 1 (different address spaces)
../arch/riscv/kernel/acpi.c:221:24:    expected void *addr
../arch/riscv/kernel/acpi.c:221:24:    got void [noderef] __iomem *map
The __iomem attribute of __acpi_map_table() is removed.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/arm64/kernel/acpi.c     | 6 +++---
 arch/loongarch/kernel/acpi.c | 2 +-
 arch/riscv/kernel/acpi.c     | 6 +++---
 arch/x86/kernel/acpi/boot.c  | 2 +-
 drivers/acpi/osl.c           | 2 +-
 include/linux/acpi.h         | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index e6f66491fbe9..69017dadb82d 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -88,10 +88,10 @@ static bool __init dt_is_stub(void)
 }
 
 /*
- * __acpi_map_table() will be called before page_init(), so early_ioremap()
- * or early_memremap() should be called here to for ACPI table mapping.
+ * __acpi_map_table() will be called before page_init(), so early_memremap()
+ * should be called here to for ACPI table mapping.
  */
-void __init __iomem *__acpi_map_table(unsigned long phys, unsigned long size)
+void __init *__acpi_map_table(unsigned long phys, unsigned long size)
 {
 	if (!size)
 		return NULL;
diff --git a/arch/loongarch/kernel/acpi.c b/arch/loongarch/kernel/acpi.c
index f1a74b80f22c..a29c1d86e274 100644
--- a/arch/loongarch/kernel/acpi.c
+++ b/arch/loongarch/kernel/acpi.c
@@ -34,7 +34,7 @@ u64 acpi_saved_sp;
 
 struct acpi_madt_core_pic acpi_core_pic[MAX_CORE_PIC];
 
-void __init __iomem * __acpi_map_table(unsigned long phys, unsigned long size)
+void __init *__acpi_map_table(unsigned long phys, unsigned long size)
 {
 
 	if (!phys || !size)
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 2fd29695a788..861ab56962a2 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -202,10 +202,10 @@ struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
 }
 
 /*
- * __acpi_map_table() will be called before paging_init(), so early_ioremap()
- * or early_memremap() should be called here to for ACPI table mapping.
+ * __acpi_map_table() will be called before paging_init(), so early_memremap()
+ * should be called here to for ACPI table mapping.
  */
-void __init __iomem *__acpi_map_table(unsigned long phys, unsigned long size)
+void __init *__acpi_map_table(unsigned long phys, unsigned long size)
 {
 	if (!size)
 		return NULL;
diff --git a/arch/x86/kernel/acpi/boot.c b/arch/x86/kernel/acpi/boot.c
index 3a44a9dc3fb7..e1ed297552e7 100644
--- a/arch/x86/kernel/acpi/boot.c
+++ b/arch/x86/kernel/acpi/boot.c
@@ -105,7 +105,7 @@ static u32 isa_irq_to_gsi[NR_IRQS_LEGACY] __read_mostly = {
  * This is just a simple wrapper around early_memremap(),
  * with sanity checks for phys == 0 and size == 0.
  */
-void __init __iomem *__acpi_map_table(unsigned long phys, unsigned long size)
+void __init *__acpi_map_table(unsigned long phys, unsigned long size)
 {
 
 	if (!phys || !size)
diff --git a/drivers/acpi/osl.c b/drivers/acpi/osl.c
index 70af3fbbebe5..a36486b59bca 100644
--- a/drivers/acpi/osl.c
+++ b/drivers/acpi/osl.c
@@ -334,7 +334,7 @@ void __iomem __ref
 	}
 
 	if (!acpi_permanent_mmap)
-		return __acpi_map_table((unsigned long)phys, size);
+		return (void __iomem __force *)__acpi_map_table((unsigned long)phys, size);
 
 	mutex_lock(&acpi_ioremap_lock);
 	/* Check if there's a suitable mapping already. */
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 4d5ee84c468b..d4627d96c13b 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -207,7 +207,7 @@ static inline int acpi_debugger_notify_command_complete(void)
 		(!entry) || (unsigned long)entry + sizeof(*entry) > end ||  \
 		((struct acpi_subtable_header *)entry)->length < sizeof(*entry))
 
-void __iomem *__acpi_map_table(unsigned long phys, unsigned long size);
+void *__acpi_map_table(unsigned long phys, unsigned long size);
 void __acpi_unmap_table(void __iomem *map, unsigned long size);
 int early_acpi_boot_init(void);
 int acpi_boot_init (void);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
