Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B148CD98ED
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 06:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRx/2Q04fqu1fFTeUzQbFNgD1RR5MMQeEKUufpgHGqA=; b=F1hiLj1Yzu0zKn
	G2fEpRM9hwT7BEGovKP8l0yhhavkm2JSwfG4mNb7zKT6yCb/6iEkr6UKDSRHc6awhT9B257RZcUfS
	lQ9eCdqR32KeUOwAvBkMD8hsd/pTCJEzhted9I6OhP05EWj2U3utBTm6qRXRrAczKCC5/RM4UwPI5
	FY6a/I225xbxkkMHcjXSdP2z4Fh+mMbTfB96YeF2soJmhIPKOful7+VzlPa1qvx16a11MJ9tJ1GE1
	UTHRn25N7fc4DKK30aW4R22Wjid8DcZm/xS1XB6CB1QdAsBpsjSDuE9cF9RbIvYUrA7+30JVRT+Mq
	vASMQ7P/3dhUxTGqgTnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6Ur-00000000i04-3QeK;
	Thu, 18 Jun 2026 06:45:05 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6Up-00000000hzL-1Q6u
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 06:45:04 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-36d98c9b596so268567a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jun 2026 23:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1781765103; x=1782369903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzlsDUhDCE2mtUY94SqShY/BDngOyXGE2SVh1DG2jr8=;
        b=bvumBnDF/oYtcf+zJL8gDw//r5JMv9NcBGZbU5HA0iRyUfAT/KRkP9RxDgqodW76Km
         DzkNMMXMU1JHyt5ZqjWFSk3c1ogzApar2D1SbKz2ypZYymqt2iM3cLK8Dk/bWo9upoJ4
         nAFJHFbUYK6cnPvA6DamZ2QhCcsIG84kqPce63DD8iJARzL5wAKQzZFHRpOWIF445hK4
         W0/t7PkRUz1JB6hwyJpiOfl96UajCnyZn4zgsUiroMxYee7BIafFXF5BJbClCoPFHbOg
         G0yirWtj0RYcVzkxmvEFgekxxDgo01+FVHrGEx4kgbqXkoVnlTRDSxKVKOYA4ng4rnXb
         FZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781765103; x=1782369903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SzlsDUhDCE2mtUY94SqShY/BDngOyXGE2SVh1DG2jr8=;
        b=izMO1T4WFZ8M7m1NgQ11Rz/x22xtwlwEJoTamRASJ7LMKhck5LkQOzCquixsru6l82
         SOp/LLtuw6xAvYaNKlje6JadRn5/dqgQUXE5SBbALXYrh2c8zbiRAyeTZVjOcr51UlHO
         pXgetMhr9K2F2t6bT6q8k8xk2/Njthqyhm66E06ofcGkiCucFedfJBZKCOPnHWZ0eydz
         GTF5kIUiFIFjlKRQs3qtFzeUL9EOL5WB0vdheVW3yFm015fqK931vrQ4kOjgpggf2WZo
         Y6ksNjRG8iuv0QN7PKK5bKzmmNC+6+pyJDjjmGNvWq8chMpTW7YEXVweCuLTr9NX7rzX
         MCow==
X-Forwarded-Encrypted: i=1; AFNElJ8o7cuWKq0/AqN/pmxF9neUBAAEi0gDwAMMGA/oPWAd8eotKu0kkROwhR6ZtHAHvfROuTC7sKsComLWLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxE14/toYJPFFvRQyslwv9oEJywj7wAeFGsDHrS5OlzQTUHZnK0
	exqHxSz2yya5dbihG6uuXGsFkGONrL8rsFXocw5cCEUrkME2vKo0RHtV6Q0Yi5oj4IU=
X-Gm-Gg: AfdE7cnOuPYRi89hPEF5MB16ZJ/3oMhs6JIQMUaokGP17Y7CGAXNHIZz+p9dIukx1o/
	d/Yt4cyEdePjBCmQuQVB12sDjCQa46Rb72wa/ej07vpEAYXGgTPfY0Xsfog+SCb/pu5ucQRv997
	mK0jzRdqEarMEKBRKfDfv9lyzWsd5VuTfmjaDJSiDmyU/rxeIbOIwEStTNkDEcQArDdflaQbbnE
	qD2YYxaG/Xf5T3WM6s5LvepcnF1kQKt8d5cxfUphnC78nkcuqV5QKzQTolXKNafeDcRDZyLhhru
	znPa0Iqw+ieMZVj7fn3e4/UA0LxRfzjK6DCgGsUbTenC54VwO+1Bmjsz5WQ4LOPQBjiPit8Gmai
	I1+XT+gQ+ckhahJxK8zmk4MaUCjtJPDPmcFcUp3YCqix3+7vyzKszbuQaGWhNDCNpz+ypnPyygy
	QWafJCaIxTSMfKv40HqDTX3Q2BjCHblTw4mhuXIbvsXL/MJQ==
X-Received: by 2002:a17:903:2b0f:b0:2c6:6424:c79f with SMTP id d9443c01a7336-2c6bbf98e47mr79277795ad.8.1781765102639;
        Wed, 17 Jun 2026 23:45:02 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328a4c1fsm185275985ad.53.2026.06.17.23.44.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Jun 2026 23:45:02 -0700 (PDT)
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
Subject: [PATCH v4 2/3] riscv: track effective hardware PTE A/D updating
Date: Thu, 18 Jun 2026 14:44:05 +0800
Message-Id: <20260618064406.14508-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260618064406.14508-1-cuiyunhui@bytedance.com>
References: <20260618064406.14508-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_234503_389055_5646822C 
X-CRM114-Status: GOOD (  18.03  )
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

Svadu being present in the ISA does not always mean that hardware PTE A/D
updating is active. When Svade and Svadu are both advertised, Svadu starts
disabled and must be enabled through SBI FWFT before the kernel can rely on
hardware A/D updates.

Track that effective runtime state with a static key. During init, enable
FWFT for all online harts before setting the key; if that fails, leave the
system in software-managed A/D mode. Secondary harts must match the global
A/D update mode before they are marked online.

The full state flow is:

                boot init
                    |
                    v
          do all CPUs have Svadu?
                    |
             +------+------+
             |             |
            no            yes
             |             |
             v             v
      hw_ad key = false   does any CPU have Svade?
      requires_fwft = false       |
             |              +-----+-----+
             |              |           |
             |             no          yes
             |              |           |
             |              v           v
             |       hw_ad key = true   requires_fwft = true
             |       requires_fwft = false       |
             |                                v
             |                         FWFT on online CPUs
             |                                |
             |                         +------+------+
             |                         |             |
             |                      success       failure
             |                         |             |
             |                         v             v
             |                hw_ad key = true   requires_fwft = false
             |                requires_fwft = true hw_ad key = false
             |                                  fallback to software A/D
             |
             +--------------+-----------+
                            |
                            v
                       hotplug CPU
                            |
                            v
          if (!hw_ad_key || !requires_fwft)
                    |
             +------+------+
             |             |
           true          false
             |             |
             v             v
          return 0    enable local FWFT
             |             |
             |       +-----+-----+
             |       |           |
             |    success     failure
             |       |           |
             v       v           v
          continue  continue  return error
             |       |           |
             v       v           v
       set_cpu_online()     do not set CPU online
             |                   |
             v                   v
          CPU online        CPU bringup fails

Thus, an online CPU never runs with an A/D update mode different from the
global kernel state.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/include/asm/cpufeature.h |   8 +++
 arch/riscv/kernel/cpufeature.c      | 101 ++++++++++++++++++++++++++--
 arch/riscv/kernel/smpboot.c         |   4 ++
 3 files changed, 107 insertions(+), 6 deletions(-)

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
index f46aa5602d74d..c0ac7ab39d4e0 100644
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
 
@@ -287,15 +291,100 @@ static int riscv_ext_zvfbfwma_validate(const struct riscv_isa_ext_data *data,
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
 {
-	/* SVADE has already been detected, use SVADE only */
-	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SVADE))
-		return -EOPNOTSUPP;
+	return sbi_fwft_set(SBI_FWFT_PTE_AD_HW_UPDATING, 1, 0);
+}
+
+static int riscv_set_online_hw_pte_ad_updating(bool enable)
+{
+	return sbi_fwft_set_online_cpus(SBI_FWFT_PTE_AD_HW_UPDATING,
+					   enable, 0);
+}
+
+static bool __init riscv_any_cpu_has_svade(void)
+{
+	unsigned int cpu;
 
+	for_each_possible_cpu(cpu) {
+		if (riscv_cpu_has_extension_unlikely(cpu, RISCV_ISA_EXT_SVADE))
+			return true;
+	}
+
+	return false;
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
+static void __init riscv_disable_hw_pte_ad_updating(int error)
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
+{
+	bool requires_fwft, has_svadu;
+	int ret;
+
+	has_svadu = riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
+	requires_fwft = riscv_any_cpu_has_svade();
+
+	if (!has_svadu)
+		return 0;
+
+	if (requires_fwft) {
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
@@ -584,7 +673,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
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
