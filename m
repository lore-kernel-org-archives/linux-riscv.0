Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88489C7EE2E
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 08:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wUr8mEIdSv1TaqHsyUYYr7NbSQKX+pjowTpD3kSdC6w=; b=b+8AScJoFBBVUK
	UVBBV2Nxy/iBpjTICzl0YuZAlnWVjoqSMpN+cQ4Ulmjw4cVO7sNtkwoR1aKTocMOqJBRGPglTBeRQ
	5Gnpl9e4cALMlOo22XgkvHjP38TbOuGbJhLvWKUbjSIjx+r+EboIAbcck1YnarBu0DWni7pLtunUH
	jvPzzdCLDk3Ed+i7138lXymsjETSEJjLWVBjtFO4pss4IIXHOBdIvjs6spM7SJfHqfic2fA+n9zWN
	8QdI9s6P/R+yKagmiCU+Djlh/nbkNMx5YnVUtJEPDKS179GIiebczyIIi/fWd3I4fx52AwwaYgGWk
	kDcLFqJBIgdisvsg160A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uMO-00CrDG-26;
	Tue, 30 May 2023 08:05:40 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uML-00CrCo-2k
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 08:05:39 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f3ba703b67so4454148e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 01:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685433935; x=1688025935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EE2V4w60Dr4KmhFU+zZAwNVp1NcYAQGXzbYjl1GCUek=;
        b=keNryjCZTZ+P0D96maQFGaRLcSCRBFFxPHnEhjqLpCh7+4kizGYxuGYQZnwqlfazRo
         rRBh2+OrKdMSdqiBCBElVDaVyE4lw5GHC3/zCDICzkuAGTbkIf+saAuVY0bQIJXuQUgv
         9mehGHJKI/7Igd4ZY8dPdKvObfGKnGtLCUItGKjrfJ0oml17bbTGhl3PxCbEQ4I0MYe+
         2s/4BCmvmvwKtZ7y7BspsViyniky0xWxTXy278AOjU0ncyJLd7e3lKoWAKekHWGwrPOD
         1/xjIlyPK8KBVBrs1+keBLKqdKb2gHXeambE9hZ/jRvIAStc6A2pzQlyBaqSJeDpIiwZ
         s6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685433935; x=1688025935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EE2V4w60Dr4KmhFU+zZAwNVp1NcYAQGXzbYjl1GCUek=;
        b=f0iCXshFafbEp/PEOUi7zryJLsapGifJs9v+MmBHj7oMDg9G42x8EUWSN4un5qU949
         ZQy8oh3AFZdCBk/MN2WwVcTBJjCmIIS98FFqmf9WwP+17BAKDSeJNethxhG1V0Cc517C
         gBBblqJchDINT9Jd+vYxfiwoUofvEyQZe1WHYqpHB9CStBAz+xYKNYpMfJdVWJS3+ba9
         vkI7gKP+CDx5xaIgdL6eFJgcveg9+SapXL0m3lN08jtkMQP6lu2hEw5AwccMn5KiGadm
         DPp1JTfiI1CeaU88MvsAboSf1Eh/HO1BZCY5CAFKcpL9LxmTGkqqsUx9k1KeiQpCtZz9
         5yMg==
X-Gm-Message-State: AC+VfDy39Fa6W5dddbR53ZrR7/Y9kAtvY3nBXc2nk36v7hBKqdmX+bc/
	0BGZB8CL9Q7REOG9fbZJWTH6RQ==
X-Google-Smtp-Source: ACHHUZ6FZUGXMLScHcwke2B9uBZnDkB6vzPJlFOBVa3kFIacWRhIPLdZVZkw0IyBdZ03ROfGk7u0IA==
X-Received: by 2002:a19:f502:0:b0:4f4:db63:239f with SMTP id j2-20020a19f502000000b004f4db63239fmr388689lfb.24.1685433934690;
        Tue, 30 May 2023 01:05:34 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id n4-20020a05600c294400b003f3157988f8sm16296889wmd.26.2023.05.30.01.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 01:05:34 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Pavel Machek <pavel@ucw.cz>,
	linux-pm@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [RFC PATCH 1/1] fdt: Mark "/reserved-memory" nodes as nosave if !reusable
Date: Tue, 30 May 2023 10:04:25 +0200
Message-Id: <20230530080425.18612-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230530080425.18612-1-alexghiti@rivosinc.com>
References: <20230530080425.18612-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_010537_890295_EE4D3D1F 
X-CRM114-Status: GOOD (  19.99  )
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

The hibernation process will access those reserved memory regions if
they are part of the linear mapping, but as described in
devicetree/bindings/reserved-memory/reserved-memory.yaml,
"/reserved-memory" nodes should not be used as normal memory, unless they
are marked as reusable which means the kernel can access it at some point.

Otherwise those regions are only used by drivers which should do what's
necessary when the hibernation process is started, or they can contain
the firmware reserved memory regions which should not be accessed at all.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/setup.c |  2 +
 drivers/of/fdt.c          | 77 +++++++++++++++++++++++++++++++++++++++
 include/linux/of_fdt.h    |  1 +
 3 files changed, 80 insertions(+)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 36b026057503..642f1035b5ce 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -299,6 +299,8 @@ void __init setup_arch(char **cmdline_p)
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
 	    riscv_isa_extension_available(NULL, ZICBOM))
 		riscv_noncoherent_supported();
+
+	early_init_fdt_nosave_reserved_mem();
 }
 
 static int __init topology_init(void)
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index bf502ba8da95..863de7e6b10c 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -26,6 +26,7 @@
 #include <linux/serial_core.h>
 #include <linux/sysfs.h>
 #include <linux/random.h>
+#include <linux/suspend.h>
 
 #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
 #include <asm/page.h>
@@ -494,6 +495,43 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
 	return memblock_reserve(base, size);
 }
 
+/*
+ * __reserved_mem_nosave_reg() - Make all memory described in 'reg' property as
+ * nosave, unless it is "reusable".
+ */
+static void __init __reserved_mem_nosave_reg(unsigned long node,
+					     const char *uname)
+{
+	int t_len = (dt_root_addr_cells + dt_root_size_cells) * sizeof(__be32);
+	phys_addr_t base, size;
+	int len;
+	const __be32 *prop;
+	bool reusable;
+
+	prop = of_get_flat_dt_prop(node, "reg", &len);
+	if (!prop)
+		return;
+
+	if (len && len % t_len != 0) {
+		pr_err("Reserved memory: invalid reg property in '%s', skipping node.\n",
+		       uname);
+		return;
+	}
+
+	reusable = of_get_flat_dt_prop(node, "reusable", NULL) != NULL;
+
+	while (len >= t_len) {
+		base = dt_mem_next_cell(dt_root_addr_cells, &prop);
+		size = dt_mem_next_cell(dt_root_size_cells, &prop);
+
+		if (size && !reusable)
+			register_nosave_region(phys_to_pfn(base),
+					       phys_to_pfn(base + size));
+
+		len -= t_len;
+	}
+}
+
 /*
  * __reserved_mem_reserve_reg() - reserve all memory described in 'reg' property
  */
@@ -596,6 +634,38 @@ static int __init fdt_scan_reserved_mem(void)
 	return 0;
 }
 
+/*
+ * fdt_nosave_reserved_mem() - scan a single FDT node to mark reserved memory
+ * as nosave.
+ */
+static int __init fdt_nosave_reserved_mem(void)
+{
+	int node, child;
+	const void *fdt = initial_boot_params;
+
+	node = fdt_path_offset(fdt, "/reserved-memory");
+	if (node < 0)
+		return -ENODEV;
+
+	if (__reserved_mem_check_root(node) != 0) {
+		pr_err("Reserved memory: unsupported node format, ignoring\n");
+		return -EINVAL;
+	}
+
+	fdt_for_each_subnode(child, fdt, node) {
+		const char *uname;
+
+		if (!of_fdt_device_is_available(fdt, child))
+			continue;
+
+		uname = fdt_get_name(fdt, child, NULL);
+
+		__reserved_mem_nosave_reg(child, uname);
+	}
+
+	return 0;
+}
+
 /*
  * fdt_reserve_elfcorehdr() - reserves memory for elf core header
  *
@@ -649,6 +719,13 @@ void __init early_init_fdt_scan_reserved_mem(void)
 	fdt_init_reserved_mem();
 }
 
+void __init early_init_fdt_nosave_reserved_mem(void)
+{
+#ifdef CONFIG_HIBERNATION
+	fdt_nosave_reserved_mem();
+#endif
+}
+
 /**
  * early_init_fdt_reserve_self() - reserve the memory used by the FDT blob
  */
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index d69ad5bb1eb1..55eb5a0f7305 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -63,6 +63,7 @@ extern int early_init_dt_scan_memory(void);
 extern void early_init_dt_check_for_usable_mem_range(void);
 extern int early_init_dt_scan_chosen_stdout(void);
 extern void early_init_fdt_scan_reserved_mem(void);
+extern void early_init_fdt_nosave_reserved_mem(void);
 extern void early_init_fdt_reserve_self(void);
 extern void early_init_dt_add_memory_arch(u64 base, u64 size);
 extern u64 dt_mem_next_cell(int s, const __be32 **cellp);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
