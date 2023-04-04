Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D897EC77B60
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 18:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGHGuTq5WZRHc2SWl1lT551YMVftpPCmgC4jHQNAjXI=; b=gFW3MujCqH454E
	JnEMy0SeXjapjPasVQgBhnkoL+jhQxzMjETNLYuSXMouVohEGca9EljSchsnfKygwFW3hbct2EhMn
	5aNpGqpt7F0NxHM41FmR12DbBVPBM6H02YQ+EgvWjWu8N16RlsGIifl76s3mjfi4SDDlaEapyUUlF
	cOXIEu3ukOCUIClgZeJbaaNevKsbaJHkSgGe/oGgsYpHDSI3JRZllroXixQ0Vc0GCITBUGSpNhVDl
	eUf3UuE5esig0xQDXbBTSIrE4hGxpN4FFd7FcvzVefb0QJC501B7Hjotz3M3tD/XZIJmZTV1MW0Ch
	iKyf8v6MbH2QictTPlVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlIV-002UH9-2K;
	Tue, 04 Apr 2023 18:22:23 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlIT-002UF9-0R
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 18:22:22 +0000
Received: by mail-pj1-x1032.google.com with SMTP id mp3-20020a17090b190300b0023fcc8ce113so37031746pjb.4
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 11:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0yVz+rx5mJyuV/igvCpVezJBLvGHPHOHFjhwqh4528=;
        b=oEps0B7/DRSDt7bmDQYZ0dBfuyVUjzaipEBZoaExzXEqzsQMPLL9DUjQK+NxXQ88Mo
         QavpjuheqcQal2txIqOI+efI25mzgX9Y1IQpUhYVttp1lL8+k4iMq7i2pJYM/LgqMneU
         Z7UvFh5byuD3lCl4oLc3SK/KteJ9lYrD7EDFx0qTyCaIhqdsfDF/sijS3MXtxWfwmF4N
         Uvb8cIJ0PAWn+i6td6w6ysH+tC9NHniNj1dh3hInHEdibXbvcArsFlWDKSpSp2CL27Ak
         reOjjWWbC+6tAboZU7ZWaxcW3QuhWhrM5A/2C/j7zflSdn4AI4RmgnvrI4DoaoLF+R46
         Px/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0yVz+rx5mJyuV/igvCpVezJBLvGHPHOHFjhwqh4528=;
        b=GrgzAt2iTcRa0M3uR+CBt44UTCaVT8FdgOazscY9DnRb/xC8VOM5a5mx+l5fU7rGil
         EiPUwazVR3TTK6Pxd/ppF2oMDffZO8v4qbZEXlwREMFFOaxhqebUxQTcEbO0veLef3Go
         q60Fpnh8J2QdrJL1XIJA6E+2xk1N+gfWkJX27IeRpV+2M1fCVItu9RrzmsyETqVy+KMy
         ftEwVXW2EyXfpPiFTAv7egNZEQ6l4UOaxmt1a0+nRH9iRM3dbb6H5Yfxxd/d5J2FdMhf
         4ZMIIMzF8+XSkn5lxJF/te5FJ+uhCpkD3XmJPlG5AaJW9JBZRGJk1auvt+1RHqnYZ34v
         h7Xg==
X-Gm-Message-State: AAQBX9fC8TzpNKOir6rWy7LfGiwaONY13TwsFEt3K2taXWmCvD1BLL8G
	Ga6wL8LliQ2U5rw9VPWPOne9kQ==
X-Google-Smtp-Source: AKy350aDIqed68Tg6fTeWtMp8izSaSZsVOimTSd1vrtt0fPi1Ga8SebKpp0Erae9ssuYrl2S+uCy0A==
X-Received: by 2002:a05:6a20:4d97:b0:bc:80bd:462d with SMTP id gj23-20020a056a204d9700b000bc80bd462dmr2867307pzb.46.1680632538022;
        Tue, 04 Apr 2023 11:22:18 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:22:17 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V4 13/23] RISC-V: cpufeature: Add ACPI support in riscv_fill_hwcap()
Date: Tue,  4 Apr 2023 23:50:27 +0530
Message-Id: <20230404182037.863533-14-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404182037.863533-1-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_112221_183662_BABD53DE 
X-CRM114-Status: GOOD (  15.53  )
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>, Weili Qian <qianweili@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Len Brown <lenb@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On ACPI based systems, the information about the hart
like ISA is provided by the RISC-V Hart Capabilities Table (RHCT).
Enable filling up hwcap structure based on the information in RHCT.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/cpufeature.c | 39 ++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 63e56ce04162..5d2065b937e5 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/acpi.h>
 #include <linux/bitmap.h>
 #include <linux/ctype.h>
 #include <linux/libfdt.h>
@@ -13,6 +14,8 @@
 #include <linux/memory.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
+#include <asm/acpi.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
 #include <asm/errata_list.h>
@@ -91,6 +94,9 @@ void __init riscv_fill_hwcap(void)
 	char print_str[NUM_ALPHA_EXTS + 1];
 	int i, j, rc;
 	unsigned long isa2hwcap[26] = {0};
+	struct acpi_table_header *rhct;
+	acpi_status status;
+	unsigned int cpu;
 
 	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
 	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
@@ -103,14 +109,36 @@ void __init riscv_fill_hwcap(void)
 
 	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
 
-	for_each_of_cpu_node(node) {
+	if (!acpi_disabled) {
+		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
+		if (ACPI_FAILURE(status))
+			return;
+	}
+
+	for_each_possible_cpu(cpu) {
 		unsigned long this_hwcap = 0;
 		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
 		const char *temp;
 
-		if (of_property_read_string(node, "riscv,isa", &isa)) {
-			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
-			continue;
+		if (acpi_disabled) {
+			node = of_cpu_device_node_get(cpu);
+			if (node) {
+				rc = of_property_read_string(node, "riscv,isa", &isa);
+				of_node_put(node);
+				if (rc) {
+					pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
+					continue;
+				}
+			} else {
+				pr_warn("Unable to find cpu node\n");
+				continue;
+			}
+		} else {
+			rc = acpi_get_riscv_isa(rhct, cpu, &isa);
+			if (rc < 0) {
+				pr_warn("Unable to get ISA for the hart - %d\n", cpu);
+				continue;
+			}
 		}
 
 		temp = isa;
@@ -243,6 +271,9 @@ void __init riscv_fill_hwcap(void)
 			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
 	}
 
+	if (!acpi_disabled && rhct)
+		acpi_put_table((struct acpi_table_header *)rhct);
+
 	/* We don't support systems with F but without D, so mask those out
 	 * here. */
 	if ((elf_hwcap & COMPAT_HWCAP_ISA_F) && !(elf_hwcap & COMPAT_HWCAP_ISA_D)) {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
