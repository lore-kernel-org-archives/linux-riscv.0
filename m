Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EB4CD5BB4
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 14:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IGlIjxCF/VPbuE9N1+nM7rONJNyv/UEnw1FxGz0IfW4=; b=NU0y6qge/lS77e
	2tir27WPOaESxEBSFz5hTEY62d9BX7AEinCQF5kbFJ+AUtGZXAHv382ouLgBueew3Tl5O3Rtr1oOu
	lG8h0NAbXB93m3bIUueeQsxgLyPq0aS9RSft+6umP0EbHg11DaahGVbc34INlC0rcdQMU7PC2Uqzb
	4H0cYMLAocceIIeQtQ9lhNewFEBoQevttiK59HateQeaVUbx3dve2jodwJ7xvJ7vTbtOiz3R8IbIi
	kReC3cDLuuuotP3xd8RI7gnj7UUrlEeFJC9oSZc5+wBdwoN/OExbW2HoW5ll9tHzhCpL+Prdxrx5F
	DSG4Wq/EzxUSHxrzxTiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQoB-0000000B7mU-0apx;
	Fri, 22 May 2026 14:25:03 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQo8-0000000B7lx-3ylg
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 14:25:02 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8383fb7143aso3326828b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 07:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1779459900; x=1780064700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WZ6zwTerYGPZHS1QOMh9b4ixVtr3kgrRb+p6u7zo5y4=;
        b=AQudQvtBe+sQawLc9CoUhn7LKAjDpezikApRIY4h0QjBiprX2sjSft6HU2vV5DUe+G
         fxT7KKHkzhy3Hv50q4WEhoaHPfeMPqYMHrWDjnxS7jSAa8tFV16JHuRVGLiXip/3Z4U8
         iyGZknM9xsR6Dd1wpXvNGaBEHKmWFKCdOnBIyxK0I7X+hBcH25a8pJCim4+nO0bLS5JR
         l7NfIj+E63SMvhTJsyVrF26HNG3sJlFVqa7126NZ+BNxOHYfe7vKdtos0XkUW8IT7V3y
         9B0W5/PQUIP3P6/pgGvV82sviIg42S14xelIju9zqqdiDcLFYTgYmW3Bp/hwNw5VvMSv
         MNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779459900; x=1780064700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZ6zwTerYGPZHS1QOMh9b4ixVtr3kgrRb+p6u7zo5y4=;
        b=pKD9N6sFAmdqJfpae18bt8uaeITCWrS+QKYPDI2XFyZ6WzQ8vSM2JJRmdUbs26wuXT
         5Zm3+8oWOoUrK72UK3qyjLlDZ0dO50Nac/zvVaudImvL8q+KUfcXdL4+YuxKCx0ZwSRN
         4kZtkjKzEkPzK8gBmMsieYDXAYHlGvYDMDvU3uWZpXWseevqUPc6nQEpy8U364wbM995
         dsXe/AdiwwhvaEEIk3qac1BklrHO7dwvR9gVeNhz9E+SCaj28CmJXj096uqZR65l5Iq3
         SKhpGTYdiD7cnd2g1SKC1bVbQgBh+j8sMV9d6kTqWGfGKHuhoT56XWp5WCLOlKiAv6AY
         kvpA==
X-Forwarded-Encrypted: i=1; AFNElJ+kJBNYGGZKKhoXzGkPOy8mvXGXrwg3i2hv3qyEhclfKynP6JJghCOBO0nSbyGcS9EaWcOkyCtwG1aIOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIlunB5TQL6uajRtY219n2DQ4I8QAtMh3dYegFwEiSTZ4t/zdy
	v6mvyOFngcQYrWsJpR5Nr7QkePUibymgc37PeJ1Lyq4lauvDyppRsG5nTyCzenMpnIw=
X-Gm-Gg: Acq92OHvEBrPqk8FEMh7a7eqxAxf6r8u9ehIZvYV01pMRyv+ajja0rgaY47Kc3NnEnk
	6g6ocrc4pV+c2Vy5soQBjQ8XrPzmS26ZfgGTIOXwRB9locLQJPc/F0BLyNqzwrSJYnobowKx3pz
	+iTDtlCv2NpvUqZRg1VxvJ1BPHqzjKs8+n6FW4rGbAcjPxZrRxCm7ePj0X0ZuF4U4uWVoCLSnXX
	dwbA/OA/43zFVG6vQuQCmh/J3D+W5hMwUVORqTwG+Cx/7q/iOVbteKvB8VjucKQsQyn5QQNUfqQ
	c195LJfQGJFCSdT+e2Uf0meB+XPknwyKfRFFNHQkbbsvbxEJsEZjEGitPjf7uIj+MBDMeO9kPmS
	mbe/JC1tfUwBvvkTRD4Gds8m0YvxeTDij30eJhktXQA2R8UQ4VzunhwmHQ0CUOfHK8ycKUo29F5
	X3fVbKxeha7zDc4C+EExw3U3O0Iag0u0QmW+1+ZZy2Ghnzat/jybtiqDXr9wducX7iTYfI1lN9
X-Received: by 2002:a05:6a00:3d0d:b0:83f:250d:5ab with SMTP id d2e1a72fcca58-8415f3a79f7mr3891077b3a.7.1779459899903;
        Fri, 22 May 2026 07:24:59 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ea14d0sm1963997b3a.37.2026.05.22.07.24.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 22 May 2026 07:24:59 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	andrew+kernel@donnellan.id.au,
	rmclure@linux.ibm.com,
	debug@rivosinc.com,
	baolin.wang@linux.alibaba.com,
	zhangchunyan@iscas.ac.cn,
	cuiyunhui@bytedance.com,
	apopple@nvidia.com,
	namcao@linutronix.de,
	wangruikang@iscas.ac.cn,
	apatel@ventanamicro.com,
	liu.xuemei1@zte.com.cn,
	ajones@ventanamicro.com,
	cleger@rivosinc.com,
	charlie@rivosinc.com,
	hui.wang@canonical.com,
	guodong@riscstar.com,
	pincheng.plct@isrc.iscas.ac.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Qingwei Hu <qingwei.hu@bytedance.com>
Subject: [PATCH v2 1/2] riscv: track effective hardware PTE A/D updates
Date: Fri, 22 May 2026 22:23:57 +0800
Message-Id: <20260522142358.87589-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_072501_131891_88A54BF7 
X-CRM114-Status: GOOD (  16.61  )
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

Track the effective hardware PTE A/D update mode separately from
Svadu capability discovery. When both Svade and Svadu are present,
enable SBI FWFT PTE A/D hardware updating on each online CPU via
CPUHP and use the resulting runtime state for arch_has_hw_pte_young().
Fall back to software-managed A/D updates if enabling hardware updates
fails.

When Svadu is present without Svade, assume hardware PTE A/D updating
is enabled from boot, and document that boot-time behavior in the DT
binding.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 .../devicetree/bindings/riscv/extensions.yaml |  6 +-
 arch/riscv/include/asm/cpufeature.h           |  6 ++
 arch/riscv/include/asm/pgtable.h              |  8 +--
 arch/riscv/kernel/cpufeature.c                | 58 +++++++++++++++++--
 4 files changed, 65 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2b0a8a93bb214..b09888e9988de 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -294,10 +294,10 @@ properties:
                of the PTE A/D bits or page faults when they need updated.
             2) Only Svade present in DT => Supervisor must assume Svade to be
                always enabled.
-            3) Only Svadu present in DT => Supervisor must assume Svadu to be
-               always enabled.
+            3) Only Svadu present in DT => Supervisor must assume Svadu is
+               enabled at boot.
             4) Both Svade and Svadu present in DT => Supervisor must assume
-               Svadu turned-off at boot time. To use Svadu, supervisor must
+               Svadu is disabled at boot time. To use Svadu, supervisor must
                explicitly enable it using the SBI FWFT extension.
 
         - const: svadu
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 739fcc84bf7b2..ad9fad6eee55d 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -128,6 +128,12 @@ struct riscv_isa_ext_data {
 extern const struct riscv_isa_ext_data riscv_isa_ext[];
 extern const size_t riscv_isa_ext_count;
 extern bool riscv_isa_fallback;
+DECLARE_STATIC_KEY_FALSE(riscv_hw_pte_ad_updating);
+
+static __always_inline bool riscv_has_hw_pte_ad_updating(void)
+{
+	return static_branch_unlikely(&riscv_hw_pte_ad_updating);
+}
 
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
 static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index a1a7c6520a095..20663a466cf6c 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -732,14 +732,14 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
 #define pgprot_dmacoherent pgprot_writecombine
 
 /*
- * Both Svade and Svadu control the hardware behavior when the PTE A/D bits need to be set. By
- * default the M-mode firmware enables the hardware updating scheme when only Svadu is present in
- * DT.
+ * Both Svade and Svadu control the hardware behavior when the PTE A/D bits
+ * need to be set. The core MM code only cares whether hardware updating of
+ * the accessed/dirty state is currently active.
  */
 #define arch_has_hw_pte_young arch_has_hw_pte_young
 static inline bool arch_has_hw_pte_young(void)
 {
-	return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
+	return riscv_has_hw_pte_ad_updating();
 }
 
 /*
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f46aa5602d74d..831dd6a7c1a06 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -35,6 +35,7 @@
 static bool any_cpu_has_zicboz;
 static bool any_cpu_has_zicbop;
 static bool any_cpu_has_zicbom;
+DEFINE_STATIC_KEY_FALSE(riscv_hw_pte_ad_updating);
 
 unsigned long elf_hwcap __read_mostly;
 
@@ -287,15 +288,60 @@ static int riscv_ext_zvfbfwma_validate(const struct riscv_isa_ext_data *data,
 	return -EPROBE_DEFER;
 }
 
-static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
-				    const unsigned long *isa_bitmap)
+static void riscv_set_hw_pte_ad_updating(void)
+{
+	static_branch_enable(&riscv_hw_pte_ad_updating);
+}
+
+static int riscv_hw_pte_ad_updating_starting(unsigned int cpu)
+{
+	int ret;
+
+	ret = sbi_fwft_set(SBI_FWFT_PTE_AD_HW_UPDATING, 1, 0);
+	if (ret) {
+		if (ret != -EOPNOTSUPP)
+			pr_err("CPU%u failed to enable hardware PTE A/D updating: %d\n",
+			       cpu, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int __init riscv_hw_pte_ad_updating_init(void)
 {
-	/* SVADE has already been detected, use SVADE only */
-	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SVADE))
-		return -EOPNOTSUPP;
+	bool has_svade, has_svadu;
+	int state;
 
+	has_svade = riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADE);
+	has_svadu = riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
+
+	if (!has_svadu)
+		return 0;
+
+	if (!has_svade)
+		goto enable;
+
+	state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+				  "riscv/pte-ad:starting",
+				  riscv_hw_pte_ad_updating_starting,
+				  NULL);
+	if (state < 0) {
+		pr_info("riscv: leave PTE A/D updates software-managed (%d)\n",
+			state);
+		return 0;
+	}
+
+	/*
+	 * A successful CPUHP_AP_ONLINE_DYN registration means the startup
+	 * callback has already succeeded on all online CPUs.
+	 */
+enable:
+	riscv_set_hw_pte_ad_updating();
+	pr_debug("riscv: hardware PTE A/D updating enabled\n");
 	return 0;
 }
+arch_initcall(riscv_hw_pte_ad_updating_init);
 
 static int riscv_cfilp_validate(const struct riscv_isa_ext_data *data,
 				const unsigned long *isa_bitmap)
@@ -584,7 +630,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
-	__RISCV_ISA_EXT_DATA_VALIDATE(svadu, RISCV_ISA_EXT_SVADU, riscv_ext_svadu_validate),
+	__RISCV_ISA_EXT_DATA(svadu, RISCV_ISA_EXT_SVADU),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
