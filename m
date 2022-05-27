Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3307C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 27 May 2022 05:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9uwhUFh4I8TRTGI5Cqx9vo3P8GYxuy1Km6Xj3Ftqfk=; b=isffktxCp+DVsm
	BA1v+3fNZH9FYY2Neo2tqwo4BIVoPKtqZWrI/VvX2EPW/GU5Y6lE9gVSc5AgYhWdThCckXyZQi70N
	PpSL6Ln/+1LCAcj1ISDD4dUhbMwkE8oeB7T1y5TkezxrGcmyGdJVBCsvosUzq7s9GobCAaAwzqysA
	aBTe3GidTtLGVPI9jZHRupqL/zfzF/veXdtbbmLhXGloLSDsqlIN9i7J5Vi1dzFR5UIDJJgK6sA2n
	MOyXYS6fG57VvmFdPR+IfOFABJCmfVGMu0P4erlU3DQqAO1q3B2lMBvKlg0lL3qoEoOItUXpebuHg
	dfDLJ7mjoxOD0C188xEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuSMX-00Gf8K-MY; Fri, 27 May 2022 05:18:13 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuSMU-00Gf5d-Hh
	for linux-riscv@lists.infradead.org; Fri, 27 May 2022 05:18:12 +0000
Received: by mail-pj1-x102e.google.com with SMTP id v5-20020a17090a7c0500b001df84fa82f8so3417790pjf.5
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 22:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dZk6iLvH9nC+e2omTs6hemHDYfpuRjTWmNKeGWnNTYo=;
        b=gjtw0gWsPEEJ73wHbdutz1wDPLyRjBgeLuL+JfA5UyBbFD8IW2gvu7cKdEmwCyPJxE
         vHPrn8ovQWliBzZfdRusQWixpoDKKa9OGyBbMv2eRC8Z8QAutezjvquTF1ABbqhV9wem
         LzTp2bEYwPjbvi1L7UTF8icoI65HBx0VyftGz+lrmI1gABcPPk0leVKUA+7U9oBe3MAP
         OPGtv29aFTW+U+3y9YDVsx9KK3A/arIsluost8Tqs9rg2nOMyfvbMqjkblHx57317/2Q
         1pQLqyk8Ns8ecU/xf3YiOx6BPxnpCuootD7WwUtgYedGGi0wjFhmcOFL6c6yDQxXy421
         LI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dZk6iLvH9nC+e2omTs6hemHDYfpuRjTWmNKeGWnNTYo=;
        b=UXxhGf5uTU0n97q3jbVnCZNVmiZEwlNJaw1nGvLD5gLJ6c/9aekXT8Vq/r3wVNdf96
         71QXzq931fTNcdlhnlBjn4igrg5Ki58UGInSwlNeuTpJJkNG3dCQEuto4YICq+wnl/18
         e4qL8tJhvqebEYXQ264OzVcFUXNyrqCl3aSYt/eP9nKpVAhnGXi95+eEd9J7bBe0moe7
         h5vB1+ddJ8HuNA7SnF5hzj7ym/5QUtyi6UTy5rg27g2WJqdwRtBysP9Pft81wIUMm9Js
         OTP7E30g/6i9/GJ+yaVB81xDqupxdG59wyKoiwhcxWXJIvhHstVboDW7g03ilId0iqgn
         RQiw==
X-Gm-Message-State: AOAM5319SNRqp3hIR6ixWdSx3JAp2luEeg6O5qF89u9VHlcyHzb3uplS
	76Nd3UkNPcFEPHko4hJlGIpu+4oEl+vOFYQZ
X-Google-Smtp-Source: ABdhPJxMTVUWOghVZWnOfnauBJUiriTAmC2S3aHSt3cHp8OEZf/HzZPT/4aXyYeUu0pJXW+GbOUxHg==
X-Received: by 2002:a17:90b:124e:b0:1e0:99b0:afc7 with SMTP id gx14-20020a17090b124e00b001e099b0afc7mr6324231pjb.125.1653628687476;
        Thu, 26 May 2022 22:18:07 -0700 (PDT)
Received: from kerodipc.Dlink ([49.206.9.238])
        by smtp.gmail.com with ESMTPSA id j34-20020a634a62000000b003c14af5063fsm2459003pgl.87.2022.05.26.22.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 22:18:07 -0700 (PDT)
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
Subject: [PATCH V3 4/5] riscv: cpu: Add 64bit hartid support on RV64
Date: Fri, 27 May 2022 10:47:42 +0530
Message-Id: <20220527051743.2829940-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220527051743.2829940-1-sunilvl@ventanamicro.com>
References: <20220527051743.2829940-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_221810_628504_9F0482A8 
X-CRM114-Status: GOOD (  22.41  )
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

The hartid can be a 64bit value on RV64 platforms.

Add support for 64bit hartid in riscv_of_processor_hartid() and
update its callers.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
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
