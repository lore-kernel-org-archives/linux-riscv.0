Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC82EE498E
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 19:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+UtkgrDn/VRohHY1cuTeTdIfyEu582TQqD7CZz4VwZg=; b=ZmgUslV5MgX661
	ZNI3Ci/gh3bsHqSeaE9n9yXTaW4924vkWjyuTPrqYbiSvufEnd7hT6iY8OjfEGzyfWguwEaOkj9ob
	IBBzV9WO42lHBGF1hzoHVm9rIhdiyjeYod53oMxC27MhEFDowZk7XIcpKo0Wj3dADBsqLaWphclgW
	AvJGbgoFtCcCo/AAC1i1ySPFjdphK8okb/bPwjdzfGImKwWIlTsKGcCiF5iI16vRsPCZeGNxcdd0N
	edE4kj/U8Tj3adzuhWEO0tPUMcefwbs8TAyF1qtKNnFpXGuPmL2yA5Xckj3OVibK3+IjY9O3GCmZU
	29vXWdsPFMCf2U0i45EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX5MA-009wWu-0B;
	Fri, 18 Aug 2023 19:42:02 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX5M7-009wVe-31
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 19:42:01 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bbc87ded50so10067415ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 18 Aug 2023 12:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1692387717; x=1692992517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7ci3vRgnbD84Ma3Cd7Iy4r3YW2QkAQDRD/x7G43pvo=;
        b=mLjEfWfHxV6EWgtjuOIdXGiCk0CxBcgLlxvHzccBkXv1GzhWZw1Q4ewVvEmU2l3OcG
         cD9n2thRWSFyKP5X0wkIlrrzaC/gv2tR1CTk5bkVva4fBeB+g+T8IpqAY4oh7NOOhG5n
         ZYtJQMqA++p4ETovq8zdGVbAbxtXZd4IvlNCGEt5lyR66oxPWBFhhXYPt2ntDNJ6zeWM
         XlsLH8c/kaoagbty1twx7B49JQ4C8wY7kZre/1wyT/9b7seaoim/O6UGltFtkQ8SOsYm
         tA6UHncCk2rll4CfcGsr89De9DLEE4fv9SPekm6e4W2UC+IT8kauHnrI22EmIAtWzKJO
         XOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692387717; x=1692992517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7ci3vRgnbD84Ma3Cd7Iy4r3YW2QkAQDRD/x7G43pvo=;
        b=R3kZneMee4GbCpbaIdKN96akcZnC5A3FzAKDA8ouyA+pb8eDcPgv/jL9vzISgiE3o4
         8ZUv+noyaffQTbYkHmjmoRWfaBssMZavF4sWgsTr2CkUBIFapCQ/nPMNDgvyAf7FJaoj
         fT/A2shpn/u4/xOq1ImPplwu7G1GEzDrnCnpxQHup3ew0Bgnay7HIxiNl2TUUP93oYF3
         W3DO17eNIBsFbJn3UpVUXt8HX0Ky/Luhyy1JPUFyPIGss7hjvdl+W1DcntzXFNI/iO1M
         zq71tEO2MDVh//abkt5ss7APc+DlrZQx6vCHWeZQ3EUNibKREyE/5zfcKEFj581gfzuc
         o+oQ==
X-Gm-Message-State: AOJu0YwRSTpbiZXE7sDxV4Q1WmKfhMiIU/mBJgaLRgxHAc7yrTNlAE9V
	tJ4RYYXMpqJSHWMeChcnTDj4Rw==
X-Google-Smtp-Source: AGHT+IEO9oSVM/2424l6Met4cdx+Cq/LzfIkxlp0PfobX+jsrm1D8PqmNz92EVefC1RybqCebE1VlA==
X-Received: by 2002:a17:902:ab0e:b0:1bc:382b:6897 with SMTP id ik14-20020a170902ab0e00b001bc382b6897mr183904plb.13.1692387717021;
        Fri, 18 Aug 2023 12:41:57 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id j10-20020a170902da8a00b001a5fccab02dsm2126614plx.177.2023.08.18.12.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 12:41:56 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 2/2] RISC-V: alternative: Remove feature_probe_func
Date: Fri, 18 Aug 2023 12:41:36 -0700
Message-Id: <20230818194136.4084400-3-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818194136.4084400-1-evan@rivosinc.com>
References: <20230818194136.4084400-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_124159_999292_3FA5A1C6 
X-CRM114-Status: GOOD (  16.19  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Samuel Holland <samuel@sholland.org>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Marc Zyngier <maz@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Evan Green <evan@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, Simon Hosie <shosie@rivosinc.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
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
index be84b14f0118..0554ed4bf087 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -120,11 +120,3 @@ void thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
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
