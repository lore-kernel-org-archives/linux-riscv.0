Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD3AC77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 14:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A4HP0irXrhbOLJIPLfpKeFnGNjJErmEYSnpR0ldFHeY=; b=nYUQZSbiCsMTNH
	0fcEoQQN2KdMEmcYtgjszDh3StDl/WXVmTVhoIVUG5mGX9yUGNn8KkJVJfI3/kTd39sKNgGlpTCLP
	Bj/DqREbVYNdBz/cVi5nkiOZnz7XFa2J+UNhxE0LI8MgPKnfaqwPZ+RmEhxmt/AxaddngkYesRKSH
	sXGyM4l0mQTid61z9c8t60FdLL0fB3lAOlmkltya9mwMVgrByRnhDw9FyB8JPgx/fY0n3kSNhxhtt
	vaJU6dhsMj7nA2pjBAFZnOOpxJupws1yr10JT0E6jbKSKhsHtxOih7ItNbVP+3CO/gBDMcqym7USy
	R1Dg/2TUGJoaQJYXs8yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6BIv-00FoKZ-0i;
	Mon, 05 Jun 2023 14:35:29 +0000
Received: from mail-pj1-f49.google.com ([209.85.216.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6BIs-00FoIN-2E
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 14:35:27 +0000
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-256931ec244so4165189a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 07:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685975725; x=1688567725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WhshXKr1H1IgI6UHBSQIBmTcD1tz7rfuPsSZ0ruzz8=;
        b=H7ntuHScdWoPUzoKwZRiZvqfG0awHlrUSSK1pAs+lyeqFTCIxUqklYXFE6dAzkkCBZ
         uCgLf76q03S709XNLv5k7Aow/J45iEBVaUcEhIKIkrhFaZkQaarHrSejsZFr8ZzJLbfD
         YSD1qJIncAISnp2zKZsfw7oNLb2W867w3mU3+2RBoJkzxD6PadpJqptPo4tMnaYlBD55
         6DZiEZ80LPwMv88d+hydYcCdPZKMzpbuaqK7MfRVO4nuu3nv9V+dEfqx9Or2N2mU/rYt
         DA0f6kwF8yS4K5wJWWbFpm67k5WE+l/oAKu3FnPizmpf4ENTAi1b28sbxMsVTCdhpNmE
         bl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685975725; x=1688567725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WhshXKr1H1IgI6UHBSQIBmTcD1tz7rfuPsSZ0ruzz8=;
        b=WdRgnhwVAsfckQg5tqpOaYaGMcU7YWBuBeUK+W2yagZgXmdcFKhaMubSzrANFUxUlu
         27NheUFnGOu0FqcB7AWrhzA1f7DRCsrUPnaZIVUy81DGTOmIMu8meZaO2nL2JhNx7NX/
         tyTxE16krOfI9RbDePylBWa80OedO9p7RJatvG12MA4Va+QaDECd//fQgBZoswoApnyV
         mzFpwyK4oJfc2Q4se+EYc5hOtCioCaztRKUoI4YsNYKUYBP4Z94ejcsttuABvb0+/SSi
         f/Yznb5TCIW2GYirtAdVpXlufDPRkVKjK4GxoBP9wh0Q152vsVep51BlK+gBydb/0WCs
         VkyQ==
X-Gm-Message-State: AC+VfDwOPQ6ng/sf+lTnFxXRRB+/vYoeUEBZNA4bhrmJiSs/Lyzpx0lB
	0csDMk9sXllbz+4MkPGaGDd01HEOxIf5Er1i8+E=
X-Google-Smtp-Source: ACHHUZ4Ov2HL9q+WOUyTJWRvS+NleXOMHYl+52PubaZZyMSGeiU54ocyAhUOLpl4Mv27fCWN3q8bdw==
X-Received: by 2002:a17:90a:9201:b0:255:cddf:a0c8 with SMTP id m1-20020a17090a920100b00255cddfa0c8mr7068618pjo.41.1685975725413;
        Mon, 05 Jun 2023 07:35:25 -0700 (PDT)
Received: from kerodi.Dlink ([106.51.186.3])
        by smtp.gmail.com with ESMTPSA id z14-20020a17090a1fce00b00250334d97dasm8297069pjz.31.2023.06.05.07.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 07:35:25 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 -next 2/2] RISC-V/perf: Use standard interface to get INTC domain
Date: Mon,  5 Jun 2023 20:05:12 +0530
Message-Id: <20230605143512.707533-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230605143512.707533-1-sunilvl@ventanamicro.com>
References: <20230605143512.707533-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_073526_730960_F5562D69 
X-CRM114-Status: GOOD (  12.40  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>
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
