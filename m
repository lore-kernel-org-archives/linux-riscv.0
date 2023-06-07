Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7118DC77B7A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 11:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gPvGhl5jR+WF8MKO9zuPWIbNFk0c5FquUoz3D3hNmlQ=; b=kN8vMH0fZhKqQA
	yOGMhT19RbTiTbq1eY5R5DfZUtDNj7tZv4UVNHQPSUngVvRIejaRm87axQxigBlIWJeAbpvomK1KX
	wi9qEkjjslK8BY1pYt7GD209mywEE5q0mpJrNa2qJQkCihqwG6wS/cuYYGJpKtGsW+lEFLV9YbhmS
	JOuW20D7lrMJmrGgKtZIs5g50b6N7hR4x7NX6vReph5tj9BbFUucO43gkINjSRo03mx3iZGQdt29I
	EinmdWrDE8G1FXNtvKd4s8L4U79Fzyf6rdfn3V/cKisJQZhy4Dl4LNJe8Cz5dMgqkSw7/lHGePDKE
	pUybJGczTJAvnacwg5og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rHI-005dZy-1p;
	Wed, 07 Jun 2023 11:24:36 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rHF-005dX9-0D
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 11:24:34 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b02085bf8dso31325735ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jun 2023 04:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686137071; x=1688729071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKUAIZ0nFHOgAYGnbeK6iIGxT+kuJpEiGpjsvdtXi+U=;
        b=PApebzMKCyqeqXPvbn9sAWGMu9YTfuYS1wTr4s7XojjK/1/8qH0LdaYZ3piwvnIIQr
         LGaZGt6kN5ptNt6YkYXgEfms51C0lWvb4hy/7KMpH6JJNfVF9tuXDP4KPF81cV4uc/2u
         tBH5nf8dSv3mWC38EwFDMdWkkCq/cAGDoDgHuQCDo2Mb8plFlvkLVRCDxKmzHVNBUWjY
         NwRsL6ac/88EiMnZOCnd2l/NbV+HhcHyHbB4RUXMPiP2GcsJ++76oDehR7ppMoluV37J
         fDqEOH0awHQvjzGk7DCl900Kbp7do5DuU9krb1YPvAcI8FaqAnmar4vdEN8ogPgFxEob
         Kryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686137071; x=1688729071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKUAIZ0nFHOgAYGnbeK6iIGxT+kuJpEiGpjsvdtXi+U=;
        b=NVARuuCXrhfmhVlyy1mgwN+L+Fweg8LrWw384GHZanEjmfyfBu3WvUKHFxD1a/w9Vi
         K926jwaDXhM/DHhIB3jddytIo2ovY/diNqYmWxBOqcITTuk4pp7W48r3lGQ6PlpSxWIm
         f4MKoC+IzPyI6Le1D/9ivu4O2bLdcFvl+Z3sd6AgkWZJIXvIKhR1GFmpHrkCoPmzfcEa
         2KsCGUPFG22C6qeWPL0+xMKoRD8/StT41xj9UbOk3Yp0j+3DPiBZpAazSBcqLGQaoES6
         OlBbryJ3Q0ase7xOey1sHBqbAsXK+4gikGLfdhax+WNow8Kb0d+Qdy1pkR03uDh5P8KA
         e+Cw==
X-Gm-Message-State: AC+VfDyLDxX4B2U3YnOPxvySZKNC/3quW4hDqP2JskOWF6gIUu4aA2KD
	am/rX+v07rd65Dp3mYWsSxx6E1kR5z/LKtqOxtQ=
X-Google-Smtp-Source: ACHHUZ4t9BGyHEKPtBUNtotOJXdVGN9mEB3zaIkJB+YNFGcAMkMgyLneHkxAZFJZFz3IbJdEsSVI1g==
X-Received: by 2002:a17:902:cec4:b0:1b1:dfbd:a192 with SMTP id d4-20020a170902cec400b001b1dfbda192mr2072940plg.57.1686137070768;
        Wed, 07 Jun 2023 04:24:30 -0700 (PDT)
Received: from kerodi.Dlink ([106.51.186.3])
        by smtp.gmail.com with ESMTPSA id o10-20020a1709026b0a00b001b2069072ccsm6228322plk.18.2023.06.07.04.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 04:24:30 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 -next 2/2] RISC-V/perf: Use standard interface to get INTC domain
Date: Wed,  7 Jun 2023 16:54:17 +0530
Message-Id: <20230607112417.782085-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230607112417.782085-1-sunilvl@ventanamicro.com>
References: <20230607112417.782085-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_042433_105799_B42E4CFA 
X-CRM114-Status: GOOD (  12.44  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently the PMU driver is using DT based lookup to
find the INTC node for sscofpmf extension. This will not work
for ACPI based systems causing the driver to fail to register
the PMU overflow interrupt handler.

Hence, change the code to use the standard interface to find
the INTC node which works irrespective of DT or ACPI.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/perf/riscv_pmu_sbi.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 4f3ac296b3e2..0bc491252a44 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -739,7 +739,6 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 {
 	int ret;
 	struct cpu_hw_events __percpu *hw_events = pmu->hw_events;
-	struct device_node *cpu, *child;
 	struct irq_domain *domain = NULL;
 
 	if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
@@ -756,20 +755,8 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 	if (!riscv_pmu_use_irq)
 		return -EOPNOTSUPP;
 
-	for_each_of_cpu_node(cpu) {
-		child = of_get_compatible_child(cpu, "riscv,cpu-intc");
-		if (!child) {
-			pr_err("Failed to find INTC node\n");
-			of_node_put(cpu);
-			return -ENODEV;
-		}
-		domain = irq_find_host(child);
-		of_node_put(child);
-		if (domain) {
-			of_node_put(cpu);
-			break;
-		}
-	}
+	domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(),
+					  DOMAIN_BUS_ANY);
 	if (!domain) {
 		pr_err("Failed to find INTC IRQ root domain\n");
 		return -ENODEV;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
