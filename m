Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617BBC77B75
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 11:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tAgCb943OvR4jRxG+SKEnl9Nu6TdqXEXGuys7eh03FU=; b=QEpycAOFH1dkDl
	cOB+39cogV92zCSB+AaxJfHM/OXZbZ01xwrEafyMvNGjOYEivKrcAPwpSP3eKAn3cAsqmadlPY5pQ
	rM+1xb946oU7kp5EqfOK4/phjVLDjejfOg4MEzhKAjDCUeoHhK6Iljx2xfOPZ2+W3pbp6uvUseeaZ
	qA+xo3roiD1y1lcFRs/2x/pprARY+wLmyPotrQUmt7WSpXkF3QY/juzENccOPuShs2UthDUeUAR/J
	V1d10aIo2FqzTLWm7ImvmuwGrRaied4lb/L8UjPwmEUFebxiq0IKJgFvFyyv9e7pCahQTbWSIp1r+
	ogyQxZHpBsdlibT68cqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzS2-000SQT-0c;
	Mon, 08 May 2023 11:54:46 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzRz-000SPO-23
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 11:54:45 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1ab1b79d3a7so29590565ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 04:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683546883; x=1686138883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWBNL8Yoxn6F5OA39mGQO+nKX7WWRbncPVBB9F2/Cag=;
        b=UTsXWuWmC1/7OSeoOkGn1KtYJ4R67wvdM1zq1WLN+1ByrSweQv67hbCW21chigqyUL
         RoLkjnU29qDA2eL1AmAYAKdZpKeOZFV2drbpvALpFYEos5q8DrWTc0KulaF49nmXAtxs
         T58TcPDImDQi7FarA7t1zpdQnq/s2chlB7/U1Ayte6Xky8oFb9z5l0IvWzkCp6PyAHpp
         XgNZKJkSZRvGaQCsPymV7tY68VEyhsqUsUTEJBSQF+t9coEokHQ2Ccp5AkD76Zz/V7Sq
         KoBHjvURG9QFm9hHkIcJ1XRk3wsGHhH2zQejXHjZKWxe/9ZDXgLZYHTgrRBDnFn+tXBS
         4Fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546883; x=1686138883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWBNL8Yoxn6F5OA39mGQO+nKX7WWRbncPVBB9F2/Cag=;
        b=eFG3ZZgoYhQJTE0RIMwbU/D1uTM+zJllpZioafzH77bpTn2l/QDzonYPmlSAWUYsAZ
         TC7gJgZUPp/S2WELWUjo2mbXf4Op3zNo7o5NKKk3FEPf51rka4GXx8Sa+1PdRI14W3H9
         H8rq9UyUAbu7b2EQgGIxLin4bjzTVOI8Qh5JHvgzsK/eHCsRk9Trj/d8vwXAHiBSD2/x
         1sPbHh9vnOf9rxeZ7zr6nygOH+wTAXVHRBPvJkt3I8Kt5a+80r1tFFURHfrgkpNrB6D/
         FSB9FF8OABd8hzxggdYfnpEp7UFKLR2xNpwqFTBL+NoGCe7tIEay156G715K9p/7mlrB
         vyAQ==
X-Gm-Message-State: AC+VfDxLkcW0l4jjPci4MTlxcFqrnZtInwwboezpHsvaSFSxpwhuzIV2
	sxaGUGekcpwd2PcZzIyNSydzwA==
X-Google-Smtp-Source: ACHHUZ5fapwQi2xeO87i4COCX6B1jL+21dW5efwIR1o/iBifUL/k3oeJ8FMjBSZShytx/bDfbkIfDQ==
X-Received: by 2002:a17:902:aa47:b0:1a9:9c5d:9fac with SMTP id c7-20020a170902aa4700b001a99c5d9facmr8993592plr.33.1683546883069;
        Mon, 08 May 2023 04:54:43 -0700 (PDT)
Received: from sunil-laptop.. ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001aaed524541sm7015149plz.227.2023.05.08.04.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:54:42 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V5 13/21] RISC-V: cpufeature: Add ACPI support in riscv_fill_hwcap()
Date: Mon,  8 May 2023 17:22:29 +0530
Message-Id: <20230508115237.216337-14-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508115237.216337-1-sunilvl@ventanamicro.com>
References: <20230508115237.216337-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_045443_677628_32CC299D 
X-CRM114-Status: GOOD (  14.78  )
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>, Conor Dooley <conor.dooley@microchip.com>, Weili Qian <qianweili@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Len Brown <lenb@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 41 +++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c607db2c842c..6ba8e20c5346 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/acpi.h>
 #include <linux/bitmap.h>
 #include <linux/ctype.h>
 #include <linux/log2.h>
@@ -13,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <asm/acpi.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
@@ -100,6 +102,8 @@ void __init riscv_fill_hwcap(void)
 	char print_str[NUM_ALPHA_EXTS + 1];
 	int i, j, rc;
 	unsigned long isa2hwcap[26] = {0};
+	struct acpi_table_header *rhct;
+	acpi_status status;
 	unsigned int cpu;
 
 	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
@@ -113,22 +117,36 @@ void __init riscv_fill_hwcap(void)
 
 	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
 
+	if (!acpi_disabled) {
+		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
+		if (ACPI_FAILURE(status))
+			return;
+	}
+
 	for_each_possible_cpu(cpu) {
 		unsigned long this_hwcap = 0;
 		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
 		const char *temp;
 
-		node = of_cpu_device_node_get(cpu);
-		if (!node) {
-			pr_warn("Unable to find cpu node\n");
-			continue;
-		}
+		if (acpi_disabled) {
+			node = of_cpu_device_node_get(cpu);
+			if (!node) {
+				pr_warn("Unable to find cpu node\n");
+				continue;
+			}
 
-		rc = of_property_read_string(node, "riscv,isa", &isa);
-		of_node_put(node);
-		if (rc) {
-			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
-			continue;
+			rc = of_property_read_string(node, "riscv,isa", &isa);
+			of_node_put(node);
+			if (rc) {
+				pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
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
@@ -265,6 +283,9 @@ void __init riscv_fill_hwcap(void)
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
