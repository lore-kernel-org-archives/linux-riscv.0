Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8ACECD8CA8
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WBTa+RuNSMDwNbD2IzMz8E+FOH0UeOZnc0fNm56Ws6k=; b=K+UxyRa2jbbMli
	IsNm/+pJ7y2+UwYylsA07jXOvF7r9Ha++bGQBOj/8ukwlgTi8gonqck3xJSWaRl8S0dPTCDZi4FYv
	eonuUGaAJOCWl/gl7lHwO9+59EI95yvnJmBOx9QTrGNEfiF+Ek3jGcxH4U6ElAQHjNM5ODKGLlogy
	+bZj0Ahe5QFu+Xp0Kgi3xi+wX15KyHHev5V7dAzE5UE4ZLIaJRCiJ+IHYQQ05WoSCPnjLbAHgQlFY
	/olEnuUquJttQo3u+dp91Mzv/5pPlrbOmJKQ8btmmR0lqY77dL62nHaLqE7LC9Ae/9IFx5XaaU2YY
	+sCVztacpuNKbLMWhTZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWw5A-00000005cDX-4A5K;
	Tue, 09 Jun 2026 13:01:29 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWw56-00000005cCV-3xZ0
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 13:01:26 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-36da151a152so3804903a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 06:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1781010084; x=1781614884; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86XkT1cxgaey4AFcMQTikCmsyViA+jzXCGN6oaKJu6o=;
        b=X9NjrzaHoTfvavM8Xl7+jGDpKp7xtn+DXnDVIOccXdcvREIIdrEu7sY2XYF7I42NAZ
         aYX3/iPrbn/ZEWCTJ3aWC3DqvjRhA4j2x92v4oqS5X0okFh38nYx9uvut3cBxCHduNu4
         F8k7eX/WPzBIGGa1i1FaLPxJ+52fbGgatE/Oqgro3vb+zwvjmBUiCogAVhzr+DIwJDib
         ooHdQ5ZNCD3mlnRw8moDxw8CbXnI5MetPe8Rrdy7hLkwatH44xItt28fnc1LLhG7bZzd
         eK+tKZcum12azNerR1N87K4DZiB4VxDIDOl7UdbHZH1ddQJqG31edIu8QEnzEHUkk//C
         byMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010084; x=1781614884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=86XkT1cxgaey4AFcMQTikCmsyViA+jzXCGN6oaKJu6o=;
        b=AcRAMQPhk5nQ5B2X5nXM5Ij+G6C9ObrL5phXhfxGV0RK5W9BajpvMt554mwssSlyl8
         PqX2YpRSVqbFc1+c/IOrBxM1OeWH3iTyBGS1+wOZP6u20T2O1E88sXVHRHrhXOorJJGz
         nMGKeYhNzZK5bSzkUnHQPmm379zVJHwyMWhSLD8kOTvnsgEnrBrYJS6Y1sOxxVOngQyM
         01qmJzWopgUGaMBnTGyOJQ5EaRMYwfhrLaNpozYEOXT9tnMk5qwSiIdVoybqjITGsUBe
         NwiOu9vTdtaMW7U5+MmOWwf7I0WVnY49G3wQWnbya0GpCNFLgndFINDiybgPWxsyHRsN
         kDQw==
X-Forwarded-Encrypted: i=1; AFNElJ/7K4qE0zG2DPtGmehKzEkGE9rVjgNGe48iY7MXX2OcDCGd7mNjtYqnefhfQb2IXiXoJFOY5ptb/+EN7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNyM1jMX1/O2XUdHqeJaEIpQq3WBzhP5ghxKaL3uW5CgHz+aD9
	o71JJABRJTPjwu8irvH3GptPwIaLKQbpXG5wKKBzoHfjr0zOXulNP8E4bFNXhvcJKHg=
X-Gm-Gg: Acq92OHoAqetM+/oBiCMB9WdXoxlTbFzJyVYdiyAAdQtMu5GzeJku7+PL3DgLSgK5ew
	hmdFwgyLRkuyPk7pEnB/+sMAChPo5saHcLvewSQ8xAnoPHiSfk2J83HukkFeIxX/Ie0bYLeIUav
	HLgD546NSqx4i0naFxNvSihmAP0B8zduxmyME/pYcyT/wlBWuVXxeBGgL53NNHGVLXEjdRwr4Kk
	mdolgND2iOWKmPln++Ex+kvzqtx+Yh9I3W9SEUUSbshPFBgx5fUzFT8yorXb9Hl19Mq4WBk9Lt7
	OJ5uORV8RotV8YphKSAkul5qomr6+tIvTQhn+U29CcY4+8J9iVtjLCkIy0GKOTgkPj7IEdxG1eb
	O5jbPjm8/o8sf68XzK3GEQehNHT4rCc3qAXXp3Gd5riX7JjXHIUTjsOzwcZLiqvrCjdE0VzCpwF
	MOJXSiM4ylYJiq4R48GmUn9YhN2V8JLithKPdZ+e9yyAh3qMr9i1wWYtPS4Wy1t37EmTU=
X-Received: by 2002:a17:90b:4cc9:b0:36d:8e49:d8 with SMTP id 98e67ed59e1d1-370f04818e9mr22100060a91.15.1781010083655;
        Tue, 09 Jun 2026 06:01:23 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf8284dsm23267889a91.4.2026.06.09.06.01.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Jun 2026 06:01:23 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	andrew+kernel@donnellan.id.au,
	aou@eecs.berkeley.edu,
	apatel@ventanamicro.com,
	apopple@nvidia.com,
	atishp@rivosinc.com,
	baolin.wang@linux.alibaba.com,
	cleger@rivosinc.com,
	conor+dt@kernel.org,
	cuiyunhui@bytedance.com,
	debug@rivosinc.com,
	devicetree@vger.kernel.org,
	guodong@riscstar.com,
	hui.wang@canonical.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liu.xuemei1@zte.com.cn,
	namcao@linutronix.de,
	nick.hu@sifive.com,
	palmer@dabbelt.com,
	pincheng.plct@isrc.iscas.ac.cn,
	pjw@kernel.org,
	qingwei.hu@bytedance.com,
	ritesh.list@gmail.com,
	rmclure@linux.ibm.com,
	robh@kernel.org,
	wangruikang@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn,
	zong.li@sifive.com
Subject: [PATCH v3 2/3] riscv: track effective hardware PTE A/D updating
Date: Tue,  9 Jun 2026 21:00:19 +0800
Message-Id: <20260609130021.99899-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260609130021.99899-1-cuiyunhui@bytedance.com>
References: <20260609130021.99899-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_060125_733723_2ABEEF41 
X-CRM114-Status: GOOD (  15.74  )
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

Track whether hardware PTE A/D updating is effectively active separately
from Svadu discovery. Enable FWFT on all online harts before advertising
hardware A/D updating globally, and require secondary harts to enable it
before they are marked online.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/include/asm/cpufeature.h |  8 +++
 arch/riscv/kernel/cpufeature.c      | 89 +++++++++++++++++++++++++++--
 arch/riscv/kernel/smpboot.c         |  4 ++
 3 files changed, 95 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 739fcc84bf7b2..ba3d74f6006a6 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -128,6 +128,14 @@ struct riscv_isa_ext_data {
 extern const struct riscv_isa_ext_data riscv_isa_ext[];
 extern const size_t riscv_isa_ext_count;
 extern bool riscv_isa_fallback;
+DECLARE_STATIC_KEY_FALSE(riscv_hw_pte_ad_updating);
+
+static __always_inline bool riscv_has_hw_pte_ad_updating(void)
+{
+	return static_branch_unlikely(&riscv_hw_pte_ad_updating);
+}
+
+int riscv_enable_hw_pte_ad_updating(void);
 
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
 static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f46aa5602d74d..f144797fa2dc8 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -15,6 +15,7 @@
 #include <linux/memory.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/smp.h>
 #include <asm/acpi.h>
 #include <asm/alternative.h>
 #include <asm/bugs.h>
@@ -35,6 +36,9 @@
 static bool any_cpu_has_zicboz;
 static bool any_cpu_has_zicbop;
 static bool any_cpu_has_zicbom;
+DEFINE_STATIC_KEY_FALSE(riscv_hw_pte_ad_updating);
+EXPORT_SYMBOL_GPL(riscv_hw_pte_ad_updating);
+static bool riscv_hw_pte_ad_updating_requires_fwft __read_mostly;
 
 unsigned long elf_hwcap __read_mostly;
 
@@ -287,15 +291,88 @@ static int riscv_ext_zvfbfwma_validate(const struct riscv_isa_ext_data *data,
 	return -EPROBE_DEFER;
 }
 
-static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
-				    const unsigned long *isa_bitmap)
+static void riscv_set_hw_pte_ad_updating(void)
+{
+	static_branch_enable(&riscv_hw_pte_ad_updating);
+}
+
+static int riscv_enable_local_hw_pte_ad_updating(void)
+{
+	return sbi_fwft_set(SBI_FWFT_PTE_AD_HW_UPDATING, 1, 0);
+}
+
+static int riscv_set_online_hw_pte_ad_updating(bool enable)
+{
+	return sbi_fwft_set_online_cpus(SBI_FWFT_PTE_AD_HW_UPDATING,
+					   enable, 0);
+}
+
+int riscv_enable_hw_pte_ad_updating(void)
+{
+	unsigned int cpu;
+	int ret;
+
+	if (!riscv_has_hw_pte_ad_updating() ||
+	    !riscv_hw_pte_ad_updating_requires_fwft)
+		return 0;
+
+	cpu = smp_processor_id();
+	ret = riscv_enable_local_hw_pte_ad_updating();
+	if (ret)
+		pr_err("CPU%u failed to enable hardware PTE A/D updating: %d\n",
+		       cpu, ret);
+
+	return ret;
+}
+
+static void riscv_disable_hw_pte_ad_updating(int error)
+{
+	int ret;
+
+	riscv_hw_pte_ad_updating_requires_fwft = false;
+	if (error != -EOPNOTSUPP)
+		pr_err("Failed to enable hardware PTE A/D updating: %d\n",
+		       error);
+
+	ret = riscv_set_online_hw_pte_ad_updating(false);
+	if (ret && ret != -EOPNOTSUPP)
+		pr_err("Failed to rollback hardware PTE A/D updating: %d\n",
+		       ret);
+
+	pr_info("riscv: leave PTE A/D updates software-managed (%d)\n",
+		error);
+}
+
+static int __init riscv_hw_pte_ad_updating_init(void)
 {
-	/* SVADE has already been detected, use SVADE only */
-	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SVADE))
-		return -EOPNOTSUPP;
+	bool has_svade, has_svadu;
+	int ret;
 
+	has_svade = riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADE);
+	has_svadu = riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
+
+	if (!has_svadu)
+		return 0;
+
+	if (has_svade) {
+		riscv_hw_pte_ad_updating_requires_fwft = true;
+		ret = riscv_set_online_hw_pte_ad_updating(true);
+		if (ret) {
+			riscv_disable_hw_pte_ad_updating(ret);
+			return 0;
+		}
+	}
+
+	/*
+	 * At this point hardware PTE A/D updating is active for all online
+	 * harts, either from boot or from the FWFT setup above. Later harts
+	 * must do the same in secondary startup before they are marked online.
+	 */
+	riscv_set_hw_pte_ad_updating();
+	pr_debug("riscv: hardware PTE A/D updating enabled\n");
 	return 0;
 }
+arch_initcall(riscv_hw_pte_ad_updating_init);
 
 static int riscv_cfilp_validate(const struct riscv_isa_ext_data *data,
 				const unsigned long *isa_bitmap)
@@ -584,7 +661,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
-	__RISCV_ISA_EXT_DATA_VALIDATE(svadu, RISCV_ISA_EXT_SVADU, riscv_ext_svadu_validate),
+	__RISCV_ISA_EXT_DATA(svadu, RISCV_ISA_EXT_SVADU),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 8b628580fe118..4fe62f96bcca2 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -27,6 +27,7 @@
 #include <linux/sched/mm.h>
 
 #include <asm/cacheflush.h>
+#include <asm/cpufeature.h>
 #include <asm/cpu_ops.h>
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
@@ -221,6 +222,9 @@ asmlinkage __visible void smp_callin(void)
 	struct mm_struct *mm = &init_mm;
 	unsigned int curr_cpuid = smp_processor_id();
 
+	if (riscv_enable_hw_pte_ad_updating())
+		return;
+
 	if (has_vector()) {
 		/*
 		 * Return as early as possible so the hart with a mismatching
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
