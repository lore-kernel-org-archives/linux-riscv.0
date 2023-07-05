Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BFDC001B0
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 16:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CH8JtKu/k+DI5c9ZXSBlKbloxngwPXLukG47roItRjw=; b=PeucYrwmsw2TZf
	9TfvYmoegbLc9LbSOFo4/hNlintN7LHiSj1Ca16S4fL2en16vDGc3wbzPMv5H8TUmfaR0lm1R6+ke
	YPPIH5kpZTt4jITgVrBxqJ//GzGVVs4f9AjtEiZHa9GkbeZtJlaqWZLeDLzqJ+m9xyXK03BQuFgLC
	1wBx1VAr3V/Awfr/ajJVrsF+hwYl+nNVNyZtbPnwyF74fDu2LMmBT9SLkz94Xg2ZEk+89xizh/f4X
	yUkgZToBrZb8o7GLoLKAJGL5m3ELJ//lGkKEXw5YI15mKhMKrNGFav5lIm+jLW/mESrMxygpopVpO
	4cR4OdmqfThPy3UxADxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH5gT-00GXGW-35;
	Wed, 05 Jul 2023 16:48:53 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH5gQ-00GXEU-2T
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 16:48:52 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-263121cd04eso3170240a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 09:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688575730; x=1691167730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDbRxqeQX7M4hcwE0tEW6t4p3GcfRTOd9CeEJa4kMJw=;
        b=L6DgCcfwQAvkkZgZKpzmOOFy0RVzvBNnitf9FI5/KEiTh9tNZCFMVolsJSeV1k34aA
         knTQmUZj4irEsi5LGcRe0F8J+DxLsGSXNplIHFESpN3kr4UBUWvCpn5PvnEaYw5Pf3sZ
         pFNyVVkNHQJPXKYFqU5lAJartCkEtJU2NnFuaWYdLHbfMl9uoBEVqpfK6oIIZCDMHcA1
         gABNtLjOo2UIMoaaydH/oiNCfuwGeNRIV2G+HKuwvGqD+tB0m9X2WC964V/hq19ANoIY
         ErGwjlI/IzV5/qmtQ0OKW7OkLGt1f1D/7eLb9clB35GYpZvdVCMSSm7qvlCNCAsKvUAl
         Sbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688575730; x=1691167730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDbRxqeQX7M4hcwE0tEW6t4p3GcfRTOd9CeEJa4kMJw=;
        b=b5FOkStmb0xYYhDIcMqhzrvTFUyCmCSvRNZKi+8qDJXC92yUrGOiMW1bDoAZH64/ee
         W7stsORapRBShwiE1iEAdQl9yiBbfye0R2yovAEYMnxc4ELwCUPEJAWLQSq63f/rkiHX
         Y0rpN+1djMAn1LAsBFVfyrVZdw9axjxN7O/E8ocIeJM1PYjIt6HyMkCq7VyuzHosoas+
         M56N5NkDArfU++zbjAvxcGDLLMzSv0msR+xlC/K+cBjoUOeVg9zvUtLrP3EJIzKU5DWz
         EHMxTR9ziBwYvC19JqChvcqWDM+5/6m0f2Muo3Vb4EB2/1L17D8umttTSaA5djDV/Y3E
         8UeQ==
X-Gm-Message-State: ABy/qLaJKtzleEzIdy6bqV+lsP4b/urDlSKiDPza8FAKgB6tUWirtjun
	b7sSrXjc8uSL4WFFFx0C8kkAUA==
X-Google-Smtp-Source: APBJJlEbUWu1lzrlQ5dMWgKU0jr3co0VYbIbzZAZH4vu2DGQ7No+zTZ5lVfdFEPhDg/rskNAAnWBnw==
X-Received: by 2002:a17:90a:4cc6:b0:262:b6aa:8ab5 with SMTP id k64-20020a17090a4cc600b00262b6aa8ab5mr12235802pjh.41.1688575729732;
        Wed, 05 Jul 2023 09:48:49 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id f21-20020a17090ace1500b00263f85b6a35sm1311431pju.29.2023.07.05.09.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 09:48:49 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v2 2/2] RISC-V: alternative: Remove feature_probe_func
Date: Wed,  5 Jul 2023 09:48:33 -0700
Message-Id: <20230705164833.995516-3-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705164833.995516-1-evan@rivosinc.com>
References: <20230705164833.995516-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_094850_805058_5DF258F0 
X-CRM114-Status: GOOD (  16.44  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Samuel Holland <samuel@sholland.org>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Marc Zyngier <maz@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, Simon Hosie <shosie@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Now that we're testing unaligned memory copy and making that
determination generically, there are no more users of the vendor
feature_probe_func(). While I think it's probably going to need to come
back, there are no users right now, so let's remove it until it's
needed.

Signed-off-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

---

(no changes since v1)

 arch/riscv/errata/thead/errata.c     |  8 --------
 arch/riscv/include/asm/alternative.h |  5 -----
 arch/riscv/kernel/alternative.c      | 19 -------------------
 arch/riscv/kernel/smpboot.c          |  1 -
 4 files changed, 33 deletions(-)

diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index c259dc925ec1..bf42857c977f 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -117,11 +117,3 @@ void thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		local_flush_icache_all();
 }
-
-void thead_feature_probe_func(unsigned int cpu,
-			      unsigned long archid,
-			      unsigned long impid)
-{
-	if ((archid == 0) && (impid == 0))
-		per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_FAST;
-}
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 6a41537826a7..58ccd2f8cab7 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -30,7 +30,6 @@
 #define ALT_OLD_PTR(a)			__ALT_PTR(a, old_offset)
 #define ALT_ALT_PTR(a)			__ALT_PTR(a, alt_offset)
 
-void probe_vendor_features(unsigned int cpu);
 void __init apply_boot_alternatives(void);
 void __init apply_early_boot_alternatives(void);
 void apply_module_alternatives(void *start, size_t length);
@@ -53,15 +52,11 @@ void thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 			     unsigned long archid, unsigned long impid,
 			     unsigned int stage);
 
-void thead_feature_probe_func(unsigned int cpu, unsigned long archid,
-			      unsigned long impid);
-
 void riscv_cpufeature_patch_func(struct alt_entry *begin, struct alt_entry *end,
 				 unsigned int stage);
 
 #else /* CONFIG_RISCV_ALTERNATIVE */
 
-static inline void probe_vendor_features(unsigned int cpu) { }
 static inline void apply_boot_alternatives(void) { }
 static inline void apply_early_boot_alternatives(void) { }
 static inline void apply_module_alternatives(void *start, size_t length) { }
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 6b75788c18e6..85056153fa23 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -27,8 +27,6 @@ struct cpu_manufacturer_info_t {
 	void (*patch_func)(struct alt_entry *begin, struct alt_entry *end,
 				  unsigned long archid, unsigned long impid,
 				  unsigned int stage);
-	void (*feature_probe_func)(unsigned int cpu, unsigned long archid,
-				   unsigned long impid);
 };
 
 static void riscv_fill_cpu_mfr_info(struct cpu_manufacturer_info_t *cpu_mfr_info)
@@ -43,7 +41,6 @@ static void riscv_fill_cpu_mfr_info(struct cpu_manufacturer_info_t *cpu_mfr_info
 	cpu_mfr_info->imp_id = sbi_get_mimpid();
 #endif
 
-	cpu_mfr_info->feature_probe_func = NULL;
 	switch (cpu_mfr_info->vendor_id) {
 #ifdef CONFIG_ERRATA_SIFIVE
 	case SIFIVE_VENDOR_ID:
@@ -53,7 +50,6 @@ static void riscv_fill_cpu_mfr_info(struct cpu_manufacturer_info_t *cpu_mfr_info
 #ifdef CONFIG_ERRATA_THEAD
 	case THEAD_VENDOR_ID:
 		cpu_mfr_info->patch_func = thead_errata_patch_func;
-		cpu_mfr_info->feature_probe_func = thead_feature_probe_func;
 		break;
 #endif
 	default:
@@ -143,20 +139,6 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
 	}
 }
 
-/* Called on each CPU as it starts */
-void probe_vendor_features(unsigned int cpu)
-{
-	struct cpu_manufacturer_info_t cpu_mfr_info;
-
-	riscv_fill_cpu_mfr_info(&cpu_mfr_info);
-	if (!cpu_mfr_info.feature_probe_func)
-		return;
-
-	cpu_mfr_info.feature_probe_func(cpu,
-					cpu_mfr_info.arch_id,
-					cpu_mfr_info.imp_id);
-}
-
 /*
  * This is called very early in the boot process (directly after we run
  * a feature detect on the boot CPU). No need to worry about other CPUs
@@ -211,7 +193,6 @@ void __init apply_boot_alternatives(void)
 	/* If called on non-boot cpu things could go wrong */
 	WARN_ON(smp_processor_id() != 0);
 
-	probe_vendor_features(0);
 	_apply_alternatives((struct alt_entry *)__alt_start,
 			    (struct alt_entry *)__alt_end,
 			    RISCV_ALTERNATIVES_BOOT);
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 00ddbd2364dc..1b8da4e40a4d 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -247,7 +247,6 @@ asmlinkage __visible void smp_callin(void)
 	numa_add_cpu(curr_cpuid);
 	set_cpu_online(curr_cpuid, 1);
 	check_unaligned_access(curr_cpuid);
-	probe_vendor_features(curr_cpuid);
 
 	if (has_vector()) {
 		if (riscv_v_setup_vsize())
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
