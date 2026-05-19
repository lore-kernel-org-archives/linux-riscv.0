Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D56CD4851
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 03:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MJFfaQVamA0nDQ8ZvXv10PQgqRdJF4K3Z1Fia89KuNs=; b=nzDvFfOXVwO8Le
	uZSjQeHpPuacNI5LxDjAW5cHGGBvZY2U7Z9x4yCnLTZ7KDZ/16zEhLa++AqXFTNiI4CxuWEOohxPI
	61Ujk7yhVx3xqWVrBGI2EnD1VWUoC3EYI4YkVPNB15Tacoc7mtvAyiZDucmJ33bw+6ozUIcriU0Oj
	sMgs7/O2mNnF5ywDduasqc9i9vjSraUwIhweT8hCtfgO8BEjZLNOquemik8e3f2J4043xRvSm55jW
	VSx57uerFrQBBlI4pOkBtFV5euhJh81466Kf+xVMFscAQzvYIG55CZ7nHGL9g8SAoYZHZidK6cIze
	1854zbGqmCWOjTUEAOtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPB15-0000000HYfI-0WpM;
	Tue, 19 May 2026 03:21:11 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPB12-0000000HYdr-1DNr
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 03:21:10 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ba1e9d3687so19862275ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 20:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1779160864; x=1779765664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J1bF7JdljLqpZ7jkZS5IiurwuADOcgSP9j0f/htqLIM=;
        b=euWTte/ACTJL0xjLBeXY694P/sAXT75hX3a6BrJxyAdJxcbIpy3SahGzEi9n0Zb9RE
         lVt4CNQjrA6G1qJbDAHhUFPzSrgLh0BfMSK0Er1Icr+ftjUc0tIwLlbj5txaScSLYF0k
         lno7m26HfjN/GtF++iP6TC+9o9R9H8eit752bD1HyjhHEarb24aMmUKV2tDoqLZTl4SA
         5nFRtuhQ9FlN7W9EA74H6jCZMdhmo9ulsLVMnAx7qrL3MXbwke3q7RcZTsqauFtk0Ce8
         Xtr34uKp1MItHEricjFGWdEoEU8TJjVGzrymP+/xIrLil/h6APR06pZd70eyqIIheNiM
         rIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779160864; x=1779765664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1bF7JdljLqpZ7jkZS5IiurwuADOcgSP9j0f/htqLIM=;
        b=e2UJknYtj1NKILVVu+FqKzChYmr03BlyTSFobcJ6ukgfDPpgoCxZsaFzQTWkmMsdA2
         7xbE5A7vaKCaVsqJB7hC5uuNiXtDFGCH8ZUCUViXglAf4USb43AC+Py4iHLoIiXEkXwm
         khHvNPqbiGE7OqdPimLQjS2/Pqd/laCc5HrlVDqLFTTLc8zdwOWy9rcBmgJFZF9g5JNi
         PP8jB2VzOQKBn8thhV1sopcSvqBCxVpj5ijzk8SUxw/H0cxBhI4Sw0NfHkrmAXIh8TXe
         uNDf9nTDjamNWtgVr7WuDwY4Zi/QLyGVrtmizLfeIl6J7NkHnSynVdfyoGjziPHD7rIq
         wd/A==
X-Forwarded-Encrypted: i=1; AFNElJ+5fEQE0oiHM97Tw86gOj/WFlRuOIq3SmnA6hS1k/ANO0QjON7uXeLHyE+n6Kv19JBVoZ724oA8bkQscg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOsn6TrqzbkPhZ0Tzz1sRTHLhj3cuGXRHE/gGbUdgUEkM1rYIr
	HYCwkmJ2iHWeG9nQ2A6UyGLe4sHOpXZEywj/BRwqXy37UT1TISP31PsNFic2agAwUR8=
X-Gm-Gg: Acq92OGvFneQDzVNHRJchTHi1+Yqx2TZOTnZwYLq3D2E1vl3BW8weFPIMFn4mNFOrr6
	2iqQTIwWqXdfmYvPymZb/BDKGRbHTUCLHhkOaXuC+tKstYpFzL/AewIkL9kHodII69PqFx7cjz8
	lj6GMkdiU8qt5nS0tHnjz+3WLzfH69LL5RLqMzo/jJQbhxkSVSW4BdumgBst90tZPwEjPlhNq0y
	fvwzI73WP9FW8ZbBritCSFTwjISVJQ5J2BRnCzGol75jiScQSQlZYzbx9NfyLtAlYFhXaun5w+w
	/4mweNkV7LWvCZJpZhOfo6sftaHkaPmC1WkoPuFgS/oz3V1tYQQlTIN+s1YwRx6OmPVWcLsJd36
	cEwOCZwaTQzWKcpNWTg1QWNG6jKSQvnJPym97TkpExOH4v41BDOzqk9j34/eaMsqEMtOmAp/Oz9
	R33m6tMgxvjgNcUjM/utCrHUN0SvbbRpsm8d0z+gflqfBoWVCu
X-Received: by 2002:a17:902:7c13:b0:2bc:ac76:c1c9 with SMTP id d9443c01a7336-2bd7e835302mr131096625ad.16.1779160863513;
        Mon, 18 May 2026 20:21:03 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2001:218:2001:0:1000:0:1:7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c16ac4asm156453495ad.33.2026.05.18.20.20.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 20:21:03 -0700 (PDT)
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
Subject: [PATCH 1/2] riscv: track effective hardware PTE A/D updates
Date: Tue, 19 May 2026 11:19:26 +0800
Message-Id: <20260519031927.70683-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_202108_694670_43EB0A6C 
X-CRM114-Status: GOOD (  16.77  )
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

Separate Svadu capability discovery from the host's effective ADUE
state. Enable SBI FWFT PTE A/D hardware updating on each online CPU
through CPUHP when both Svade and Svadu are present, use the resulting
runtime state for arch_has_hw_pte_young(), and fall back to
software-managed A/D updates when enabling the feature fails.

Platforms with Svadu but without Svade are treated as always using
hardware PTE A/D updates. Expose the runtime state through an inline
getter so hot MM paths avoid an out-of-line function call.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/include/asm/cpufeature.h |  6 +++
 arch/riscv/include/asm/pgtable.h    |  8 ++--
 arch/riscv/kernel/cpufeature.c      | 73 ++++++++++++++++++++++++++---
 3 files changed, 77 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 739fcc84bf7b2..877d71a1ea755 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -128,6 +128,12 @@ struct riscv_isa_ext_data {
 extern const struct riscv_isa_ext_data riscv_isa_ext[];
 extern const size_t riscv_isa_ext_count;
 extern bool riscv_isa_fallback;
+extern bool riscv_hw_pte_ad_updating_enabled;
+
+static __always_inline bool riscv_has_hw_pte_ad_updating(void)
+{
+	return READ_ONCE(riscv_hw_pte_ad_updating_enabled);
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
index f46aa5602d74d..e46b2d2b49eed 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -35,6 +35,8 @@
 static bool any_cpu_has_zicboz;
 static bool any_cpu_has_zicbop;
 static bool any_cpu_has_zicbom;
+bool riscv_hw_pte_ad_updating_enabled __read_mostly;
+EXPORT_SYMBOL_GPL(riscv_hw_pte_ad_updating_enabled);
 
 unsigned long elf_hwcap __read_mostly;
 
@@ -287,15 +289,74 @@ static int riscv_ext_zvfbfwma_validate(const struct riscv_isa_ext_data *data,
 	return -EPROBE_DEFER;
 }
 
-static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
-				    const unsigned long *isa_bitmap)
+static void riscv_set_hw_pte_ad_updating(bool enabled)
+{
+	WRITE_ONCE(riscv_hw_pte_ad_updating_enabled, enabled);
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
+static int riscv_hw_pte_ad_updating_dying(unsigned int cpu)
 {
-	/* SVADE has already been detected, use SVADE only */
-	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SVADE))
-		return -EOPNOTSUPP;
+	int ret;
+
+	ret = sbi_fwft_set(SBI_FWFT_PTE_AD_HW_UPDATING, 0, 0);
+	if (ret)
+		pr_warn("CPU%u failed to disable hardware PTE A/D updating: %d\n",
+			cpu, ret);
+
+	return 0;
+}
 
+static int __init riscv_hw_pte_ad_updating_init(void)
+{
+	bool has_svade, has_svadu;
+	int state;
+
+	has_svade = riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADE);
+	has_svadu = riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
+
+	if (!has_svadu)
+		return 0;
+
+	if (!has_svade) {
+		riscv_set_hw_pte_ad_updating(true);
+		pr_info("riscv: hardware PTE A/D updating enabled\n");
+		return 0;
+	}
+
+	state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+				  "riscv/pte-ad:starting",
+				  riscv_hw_pte_ad_updating_starting,
+				  riscv_hw_pte_ad_updating_dying);
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
+	riscv_set_hw_pte_ad_updating(true);
+	pr_info("riscv: hardware PTE A/D updating enabled\n");
 	return 0;
 }
+arch_initcall(riscv_hw_pte_ad_updating_init);
 
 static int riscv_cfilp_validate(const struct riscv_isa_ext_data *data,
 				const unsigned long *isa_bitmap)
@@ -584,7 +645,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
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
