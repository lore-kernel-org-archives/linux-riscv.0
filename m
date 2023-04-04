Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA21C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 18:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQn9lJYiQ528vlWwPLVT9SPR2wOfUkpXQnL+ZRw7OkM=; b=z2Rd7bEk5D3kuZ
	JF1WaqcNxd52ITTEECqj+eB9ueWdqHpGYz8GFhcJQJPYCMm7s5rybRl8WuLkKIbgyBeHW8zq3QK+A
	rpLQCSAGfknGskccMnCSzvKctdJGhyzZuo0rvhTfQRg3bcK9ZToywJjztZkUFMdXZ71O9amM1mVek
	lD1pIS5eHvWOKxtiorduD9eeIsVMqDC6TD1ObVg0/YSxtg5/DkQpqX0flHsx9gpBcSZuwqJhkBybs
	iCct1C4brs/2+Nk7dFo33UtlMQRfrE7vqrpyEr0IypZvbSiZZWaB5/CUQa0lRiOhaGhG4facDjU8P
	RGDuz0/25vfc6cKEfB2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlIc-002UKv-1O;
	Tue, 04 Apr 2023 18:22:30 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlIa-002UI4-08
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 18:22:29 +0000
Received: by mail-pj1-x1035.google.com with SMTP id ml21so9534106pjb.4
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 11:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xu/Iz4Gys9b28icQ+yc3gYklUvfwHJ9XRG8B+aoThpM=;
        b=JAHpEivL9I/hqCw5D7j0mXEZAxKh4ujny1mEGmpBbRIxybrn39V0gQUlAcsalhKo0j
         DmCiPnahoqflsNeHLjt954DEvkZLVEOyUaETUrUGy7Apz4Pmy5mnBKd5Q2Td+oduXEUW
         gm5C1C7yfD7vKtL5v7JIUvvBYBF1Y9x5eucLKrwtXh+kjVtvr3NG7LSkgfJ1JBT4OQyZ
         82Ua9PZK4uDHx6vGaE++tMWrsovOH9XjleEqS/+sTt4DY+KzbPfySBA4hMLzhMvwoRm8
         0qE/qIk54OKw04ln/sEiBsJsENPa0WtwYQcYi5x8G0lAtBo6gQQt67n8mmeK7/W+hA6b
         C2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xu/Iz4Gys9b28icQ+yc3gYklUvfwHJ9XRG8B+aoThpM=;
        b=TxOtT5Nv2sMDLOymd9tGKNjydMuyvjtz3nB1AxRVg2bfaKSXOdnWaK/xRUIPYWE4Lr
         yePdp0Us/BpEjM/CWdrEtnjJdX/KordU1lW9TO8UnBH5Ed0CZBHAXT4VnVB0HMxcWwBp
         R7cp8YDIJCHLWek584OME9XSQEiJidIQzKf/1qAbQZNf/v0aFPEJa8iJ+zxx4sEKGT0j
         xDj3XtBg0POj2JHRud4M1RvceY8CptkQJ4kooWi4UXqyX2rwTiCL5ejFJxrFR6E3Jy7g
         2QWm4TlcW4NBKPCx+LMp0Jvrc2ck5q5XIxkImkBywlZsS/CrRpvjADSI1TsZigJDpuAt
         9/bQ==
X-Gm-Message-State: AAQBX9cyQL7ct30kZfSabFSUGQypaQ3YQfDvHp5YMF7Ci8XuMX8+Vqar
	sc4e8CcVIwTR0tEooXOzftF5PA==
X-Google-Smtp-Source: AKy350ai86QCaCGu2BbzypKJEBx56cY68XZbz28SLHOgdOP1xWWX1b7FVutDsrQKF4LV/W9w+3Grqw==
X-Received: by 2002:a05:6a20:6d2f:b0:da:db55:4a35 with SMTP id fv47-20020a056a206d2f00b000dadb554a35mr148628pzb.4.1680632544910;
        Tue, 04 Apr 2023 11:22:24 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:22:24 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V4 14/23] RISC-V: cpu: Enable cpuinfo for ACPI systems
Date: Tue,  4 Apr 2023 23:50:28 +0530
Message-Id: <20230404182037.863533-15-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404182037.863533-1-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_112228_080695_FDA698A5 
X-CRM114-Status: GOOD (  14.06  )
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

On ACPI based platforms, few details like ISA need to be read
from the ACPI table. Enable cpuinfo on ACPI based systems.

ACPI has nothing similar to DT compatible property for each CPU.
SBI calls must be used to get vendor/arch/imp ID for any errata.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/cpu.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 8400f0cc9704..ace4752516d8 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -3,10 +3,12 @@
  * Copyright (C) 2012 Regents of the University of California
  */
 
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/init.h>
 #include <linux/seq_file.h>
 #include <linux/of.h>
+#include <asm/acpi.h>
 #include <asm/csr.h>
 #include <asm/hwcap.h>
 #include <asm/sbi.h>
@@ -283,23 +285,35 @@ static void c_stop(struct seq_file *m, void *v)
 static int c_show(struct seq_file *m, void *v)
 {
 	unsigned long cpu_id = (unsigned long)v - 1;
-	struct device_node *node = of_get_cpu_node(cpu_id, NULL);
 	struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo, cpu_id);
+	struct device_node *node;
 	const char *compat, *isa;
 
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
-	if (!of_property_read_string(node, "riscv,isa", &isa))
-		print_isa(m, isa);
-	print_mmu(m);
-	if (!of_property_read_string(node, "compatible", &compat)
-	    && strcmp(compat, "riscv"))
-		seq_printf(m, "uarch\t\t: %s\n", compat);
+
+	if (acpi_disabled) {
+		node = of_get_cpu_node(cpu_id, NULL);
+		if (!of_property_read_string(node, "riscv,isa", &isa))
+			print_isa(m, isa);
+
+		print_mmu(m);
+		if (!of_property_read_string(node, "compatible", &compat) &&
+		    strcmp(compat, "riscv"))
+			seq_printf(m, "uarch\t\t: %s\n", compat);
+
+		of_node_put(node);
+	} else {
+		if (!acpi_get_riscv_isa(NULL, cpu_id, &isa))
+			print_isa(m, isa);
+
+		print_mmu(m);
+	}
+
 	seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
 	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
 	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
 	seq_puts(m, "\n");
-	of_node_put(node);
 
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
