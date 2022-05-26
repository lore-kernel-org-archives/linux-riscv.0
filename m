Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42583C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 10:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxt2P4r5dcUjBZGCvoeWRq2NZ2DRMOchw/vM9RqphTM=; b=ditlG1nj5LXcmt
	GbR9+X+8uAkwdy470YoUP+DBfwNgdDO/UsP6m+QWnwbzo6WqbQYANIwFY4gvra/4DYw3mVpTVBkOL
	03sj+Pya5ngUJD3T3A4xdzGeozX2KtrLzGgktXqHO/SwjDQDVbgGTy2pht1F3xgXQ3Ctbt+ZjAUBM
	bznQ/SvTMZf971AwgJ06RcCjl1ERC0YBX5poSYzg2Jzy5mEVfsDBE+ewmmEMpZG0CxeziAQmmR/0/
	nBtUU35e9+BoD9HIF2LEL8jblYW+uIc6QPM9jFOszF4h1TDiBvUrPgW5ZYOZzjNdomYNq1cfLwKVa
	VEudPJOr4XaoyK1MQnMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuATK-00ELa7-Av; Thu, 26 May 2022 10:12:02 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuATH-00ELWM-1a
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 10:12:00 +0000
Received: by mail-pj1-x1030.google.com with SMTP id u12-20020a17090a1d4c00b001df78c7c209so4022315pju.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 03:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K4/jbxyTjaVENdJUeS7U2YJP8/xoYroH7rqKl9F4SxI=;
        b=ROt7I3Nyr9Q+gowE5eM3uNJ8euXDR5tzpkgOGfYUOtOAcGLm231qu9f9ZfmSSvXSHw
         NTb1HFQZQ+eqfw3XPO7CZ2/yFfi5qGqik5i3Nxfblr1QjDVw9GQzc5Iud5pT/R9UuzZk
         ilsjgiimc3WQ3Wst8Ki+8/n26mtVA9dQxWcuUz2c4yygXmsIOIbQbaDoCl10JaO0GBmj
         WXkDeUd/UJ5U+/fqHWKDbEWX2mylX8PtCoo4Cg9MV/Rh0oa8p/Yo4pKdZfE//mZYDLyo
         zOFdV/vO+e8FzIklplLayB7HFvPXbg7Z0y+AWZDnYWpaq9WI6mo2fM/EHdcRnW2skZeA
         pplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K4/jbxyTjaVENdJUeS7U2YJP8/xoYroH7rqKl9F4SxI=;
        b=ryRLYEufiyfXKPzHufVqYLBXuHKCdOPxqoeCeqEhbpouC3AAgL0c4XCoZ/9NbtLFrz
         Kk7EZS60cgZwJrnOoCks2yJzIFZKGuO+a/xohFqTpk3i5kfWWpVe7rmgufLihppw66i+
         7cfm4QIdD+8fd2n9v3GoHEzFW71qLUdy7jw6GbkH1E2B1Q4L19Nbm2vLtEEpWfDJ3LQi
         0WiToc0WMeBzVxgy2QIgSJ2Jq6R6tZWseJnSSQxOVeKHCAjVP30SvVSv1FZiPM9jjUXc
         sdKJAnqDjmG/GWaU+LtPtuGVR4+MlOcs0CDXSsDrN6j24ExQ+/jlmbcV/iC0EgFSms8/
         L43w==
X-Gm-Message-State: AOAM530FdWAWfA5BVN+WHXR1c4R69WqPrCWVbgKDp8lWMhLKBUblH99b
	pAfgfAwbLobWq2iX59oIQ2Uyjg==
X-Google-Smtp-Source: ABdhPJyhNh+f2oWMXxABwW+fRsFqwZH+cOKOcVHtaehlPykQPu0fAjtvz9npvu9D57G/VIMaJVpokg==
X-Received: by 2002:a17:902:7606:b0:161:df31:68f2 with SMTP id k6-20020a170902760600b00161df3168f2mr34397649pll.151.1653559915347;
        Thu, 26 May 2022 03:11:55 -0700 (PDT)
Received: from kerodipc.Dlink ([49.206.9.238])
        by smtp.gmail.com with ESMTPSA id z17-20020a170902d55100b0015f309f14d0sm1114861plf.56.2022.05.26.03.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 03:11:54 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Sunil V L <sunil.vl@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V2 4/5] riscv: cpu: Support for 64bit hartid
Date: Thu, 26 May 2022 15:41:30 +0530
Message-Id: <20220526101131.2340729-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220526101131.2340729-1-sunilvl@ventanamicro.com>
References: <20220526101131.2340729-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_031159_114646_08CAD5CA 
X-CRM114-Status: GOOD (  22.80  )
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

Adds support for 64bit hartid in riscv_of_processor_hartid()
  - Separate return value and status code.
  - Make hartid variable type as unsigned long.
  - Update the callers.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/processor.h |  4 ++--
 arch/riscv/kernel/cpu.c            | 26 +++++++++++++++-----------
 arch/riscv/kernel/cpufeature.c     |  6 ++++--
 arch/riscv/kernel/smpboot.c        |  9 +++++----
 drivers/clocksource/timer-riscv.c  | 15 ++++++++-------
 drivers/irqchip/irq-riscv-intc.c   |  7 ++++---
 drivers/irqchip/irq-sifive-plic.c  |  7 ++++---
 7 files changed, 42 insertions(+), 32 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 0749924d9e55..99fae9398506 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -75,8 +75,8 @@ static inline void wait_for_interrupt(void)
 }
 
 struct device_node;
-int riscv_of_processor_hartid(struct device_node *node);
-int riscv_of_parent_hartid(struct device_node *node);
+int riscv_of_processor_hartid(struct device_node *node, unsigned long *hartid);
+int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid);
 
 extern void riscv_fill_hwcap(void);
 extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index ccb617791e56..477a33b34c95 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -14,37 +14,36 @@
  * Returns the hart ID of the given device tree node, or -ENODEV if the node
  * isn't an enabled and valid RISC-V hart node.
  */
-int riscv_of_processor_hartid(struct device_node *node)
+int riscv_of_processor_hartid(struct device_node *node, unsigned long *hart)
 {
 	const char *isa;
-	u32 hart;
 
 	if (!of_device_is_compatible(node, "riscv")) {
 		pr_warn("Found incompatible CPU\n");
 		return -ENODEV;
 	}
 
-	hart = of_get_cpu_hwid(node, 0);
-	if (hart == ~0U) {
+	*hart = (unsigned long) of_get_cpu_hwid(node, 0);
+	if (*hart == ~0UL) {
 		pr_warn("Found CPU without hart ID\n");
 		return -ENODEV;
 	}
 
 	if (!of_device_is_available(node)) {
-		pr_info("CPU with hartid=%d is not available\n", hart);
+		pr_info("CPU with hartid=%lu is not available\n", *hart);
 		return -ENODEV;
 	}
 
 	if (of_property_read_string(node, "riscv,isa", &isa)) {
-		pr_warn("CPU with hartid=%d has no \"riscv,isa\" property\n", hart);
+		pr_warn("CPU with hartid=%lu has no \"riscv,isa\" property\n", *hart);
 		return -ENODEV;
 	}
 	if (isa[0] != 'r' || isa[1] != 'v') {
-		pr_warn("CPU with hartid=%d has an invalid ISA of \"%s\"\n", hart, isa);
+		pr_warn("CPU with hartid=%lu has an invalid ISA of \"%s\"\n", *hart, isa);
 		return -ENODEV;
 	}
 
-	return hart;
+	return 0;
 }
 
 /*
@@ -53,11 +52,16 @@ int riscv_of_processor_hartid(struct device_node *node)
  * To achieve this, we walk up the DT tree until we find an active
  * RISC-V core (HART) node and extract the cpuid from it.
  */
-int riscv_of_parent_hartid(struct device_node *node)
+int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
 {
+	int rc;
+
 	for (; node; node = node->parent) {
-		if (of_device_is_compatible(node, "riscv"))
-			return riscv_of_processor_hartid(node);
+		if (of_device_is_compatible(node, "riscv")) {
+			rc = riscv_of_processor_hartid(node, hartid);
+			if (!rc)
+				return 0;
+		}
 	}
 
 	return -1;
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1b2d42d7f589..49c05bd9352d 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -67,8 +67,9 @@ void __init riscv_fill_hwcap(void)
 	struct device_node *node;
 	const char *isa;
 	char print_str[NUM_ALPHA_EXTS + 1];
-	int i, j;
+	int i, j, rc;
 	static unsigned long isa2hwcap[256] = {0};
+	unsigned long hartid;
 
 	isa2hwcap['i'] = isa2hwcap['I'] = COMPAT_HWCAP_ISA_I;
 	isa2hwcap['m'] = isa2hwcap['M'] = COMPAT_HWCAP_ISA_M;
@@ -86,7 +87,8 @@ void __init riscv_fill_hwcap(void)
 		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
 		const char *temp;
 
-		if (riscv_of_processor_hartid(node) < 0)
+		rc = riscv_of_processor_hartid(node, &hartid);
+		if (rc < 0)
 			continue;
 
 		if (of_property_read_string(node, "riscv,isa", &isa)) {
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 622f226454d5..4336610a19ee 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -76,15 +76,16 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 void __init setup_smp(void)
 {
 	struct device_node *dn;
-	int hart;
+	unsigned long hart;
 	bool found_boot_cpu = false;
 	int cpuid = 1;
+	int rc;
 
 	cpu_set_ops(0);
 
 	for_each_of_cpu_node(dn) {
-		hart = riscv_of_processor_hartid(dn);
-		if (hart < 0)
+		rc = riscv_of_processor_hartid(dn, &hart);
+		if (rc < 0)
 			continue;
 
 		if (hart == cpuid_to_hartid_map(0)) {
@@ -94,7 +95,7 @@ void __init setup_smp(void)
 			continue;
 		}
 		if (cpuid >= NR_CPUS) {
-			pr_warn("Invalid cpuid [%d] for hartid [%d]\n",
+			pr_warn("Invalid cpuid [%d] for hartid [%lu]\n",
 				cpuid, hart);
 			continue;
 		}
diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 1767f8bf2013..55142c27f0bc 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -101,20 +101,21 @@ static irqreturn_t riscv_timer_interrupt(int irq, void *dev_id)
 
 static int __init riscv_timer_init_dt(struct device_node *n)
 {
-	int cpuid, hartid, error;
+	int cpuid, error;
+	unsigned long hartid;
 	struct device_node *child;
 	struct irq_domain *domain;
 
-	hartid = riscv_of_processor_hartid(n);
-	if (hartid < 0) {
-		pr_warn("Not valid hartid for node [%pOF] error = [%d]\n",
+	error = riscv_of_processor_hartid(n, &hartid);
+	if (error < 0) {
+		pr_warn("Not valid hartid for node [%pOF] error = [%lu]\n",
 			n, hartid);
-		return hartid;
+		return error;
 	}
 
 	cpuid = riscv_hartid_to_cpuid(hartid);
 	if (cpuid < 0) {
-		pr_warn("Invalid cpuid for hartid [%d]\n", hartid);
+		pr_warn("Invalid cpuid for hartid [%lu]\n", hartid);
 		return cpuid;
 	}
 
@@ -140,7 +141,7 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 		return -ENODEV;
 	}
 
-	pr_info("%s: Registering clocksource cpuid [%d] hartid [%d]\n",
+	pr_info("%s: Registering clocksource cpuid [%d] hartid [%lu]\n",
 	       __func__, cpuid, hartid);
 	error = clocksource_register_hz(&riscv_clocksource, riscv_timebase);
 	if (error) {
diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index b65bd8878d4f..499e5f81b3fe 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -95,10 +95,11 @@ static const struct irq_domain_ops riscv_intc_domain_ops = {
 static int __init riscv_intc_init(struct device_node *node,
 				  struct device_node *parent)
 {
-	int rc, hartid;
+	int rc;
+	unsigned long hartid;
 
-	hartid = riscv_of_parent_hartid(node);
-	if (hartid < 0) {
+	rc = riscv_of_parent_hartid(node, &hartid);
+	if (rc < 0) {
 		pr_warn("unable to find hart id for %pOF\n", node);
 		return 0;
 	}
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index bb87e4c3b88e..4710d9741f36 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -317,7 +317,8 @@ static int __init plic_init(struct device_node *node,
 	for (i = 0; i < nr_contexts; i++) {
 		struct of_phandle_args parent;
 		irq_hw_number_t hwirq;
-		int cpu, hartid;
+		int cpu;
+		unsigned long hartid;
 
 		if (of_irq_parse_one(node, i, &parent)) {
 			pr_err("failed to parse parent for context %d.\n", i);
@@ -341,8 +342,8 @@ static int __init plic_init(struct device_node *node,
 			continue;
 		}
 
-		hartid = riscv_of_parent_hartid(parent.np);
-		if (hartid < 0) {
+		error = riscv_of_parent_hartid(parent.np, &hartid);
+		if (error < 0) {
 			pr_warn("failed to parse hart ID for context %d.\n", i);
 			continue;
 		}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
