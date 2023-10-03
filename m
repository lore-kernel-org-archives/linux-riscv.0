Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925A5E75423
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 04:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GYPASAH6CUtoadrUUgs/vifzxzP1e3APVGu0P/dz/EY=; b=cTKKndB1Gf2zlE
	3QHTzv1t55WXWCGLyhesTxBbD+ezTP3UHee1UgNeCzhfTG2FJk6rC8vLdcIr6vykWFf1tqPHUIR2T
	aNs+ZYaElPltRKWrzH8vYMysVqhG6ULhZxgWsS8DOzF428gT3sZ8AO+v6TmbxUAqjdf6qC9Unnf2l
	5ITx5DT4eWt8dg05HogVvbvUn8pP7eZT+UU4SR8WKFCxVhtwqdRx11TkvNvYhMgBb1XOsHMN2QnPF
	M03XnasioFwKjnmVpTnDPgrcoVpw4YjVoyaW37dkxze2dmQLj2Sb8xsCnJ+VPt3l23G0SQGojAea9
	D+N30J40fthyDP1fjYBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXHQ-00Do4W-0s;
	Tue, 03 Oct 2023 04:45:08 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXHN-00Do1h-1v
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 04:45:07 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-690d2441b95so339524b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 21:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696308303; x=1696913103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RNpF/CWjVyq2jAidq9g4JrMuQdRaRtl2xGmvH6ydPA=;
        b=llIjsmbibYwYVCvMEwvVHOs3W7yuhJY5rHgdbbjnMYU5hKfHO0oPt83w2/RZN7kc/P
         WoKVZHXO/8QrZ6QIAVXBOL5Zx2ahXD8+MnDVyRMFznc0m8Tsovs/Fj2tMAHRrbxIetKX
         HeJArwM96sncQIKNnUPRq2MTJK0rKTujCtv6PhF6d9dZDIZ1Q78luPyGQxZfb265dJCl
         hD/xa6ju5vLh6SygwmInfaFEz4DoDd+5qgUWWd14M4iagzKshPxSF81fCMsMOfSlUKJ+
         poQxAigX3QsWVntNL2UQwjmUIg2vER7p3mMNcSva8Ywcv8euRvpJVl+dpskuNiCEaBBO
         wymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696308303; x=1696913103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RNpF/CWjVyq2jAidq9g4JrMuQdRaRtl2xGmvH6ydPA=;
        b=N6ZpRvEHJn+rs9a85qGEFP0EnTRrewIG6MwEXkUazZuPrStrRE8H2z1ENsUuOYq1KS
         7oEAUe6l+oGuJ3G/cVkg7mr8HIILYfvOfAlVk/obF950v+lY6o3rEdnCj/cv+QDZElOx
         vjaw/Meyx6n5CVgcOjmdYoKt/L8lD2MUL3dxlpmtbz+qImqhGRfiFogJAkJsc70+vsNi
         MK/oju7IkzKjURuLUzWjge+jXBRacNjloAcZYhSNGKfyqabIR6q6dlDnq1kE+jfNG9Dk
         5IYJ9ose1dPUyhF6l8Hkj3ihsmfF1/7tAOabbbA+jsn4ZRwtTYywup5kKriVw/9lJOdC
         zrGQ==
X-Gm-Message-State: AOJu0YwaOJMX6w0gq02FTRQHewEoD9/mcB2kPs7zHVlCAS1vjW/oopHT
	jIqDqy/MYGLSbyYaZSb+7zpZaA==
X-Google-Smtp-Source: AGHT+IG/Wp0pe3mxTS0qRgMZuqi2/oc2AwsUXkS16/9T8AJqBsR6vFzMhpHcjJWRci/pF5CllP/yVg==
X-Received: by 2002:a05:6a00:b55:b0:68f:cb69:8e66 with SMTP id p21-20020a056a000b5500b0068fcb698e66mr2518288pfo.15.1696308303308;
        Mon, 02 Oct 2023 21:45:03 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.132])
        by smtp.gmail.com with ESMTPSA id h9-20020aa786c9000000b0068e49cb1692sm346421pfo.1.2023.10.02.21.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 21:45:02 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v10 06/15] irqchip/riscv-intc: Add support for RISC-V AIA
Date: Tue,  3 Oct 2023 10:13:54 +0530
Message-Id: <20231003044403.1974628-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003044403.1974628-1-apatel@ventanamicro.com>
References: <20231003044403.1974628-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_214505_633563_9319E0B5 
X-CRM114-Status: GOOD (  14.62  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The RISC-V advanced interrupt architecture (AIA) extends the per-HART
local interrupts in following ways:
1. Minimum 64 local interrupts for both RV32 and RV64
2. Ability to process multiple pending local interrupts in same
   interrupt handler
3. Priority configuration for each local interrupts
4. Special CSRs to configure/access the per-HART MSI controller

We add support for #1 and #2 described above in the RISC-V intc driver.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-intc.c | 34 ++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index e8d01b14ccdd..bab536bbaf2c 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/smp.h>
+#include <asm/hwcap.h>
 
 static struct irq_domain *intc_domain;
 
@@ -30,6 +31,15 @@ static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
 	generic_handle_domain_irq(intc_domain, cause);
 }
 
+static asmlinkage void riscv_intc_aia_irq(struct pt_regs *regs)
+{
+	unsigned long topi;
+
+	while ((topi = csr_read(CSR_TOPI)))
+		generic_handle_domain_irq(intc_domain,
+					  topi >> TOPI_IID_SHIFT);
+}
+
 /*
  * On RISC-V systems local interrupts are masked or unmasked by writing
  * the SIE (Supervisor Interrupt Enable) CSR.  As CSRs can only be written
@@ -39,12 +49,18 @@ static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
 
 static void riscv_intc_irq_mask(struct irq_data *d)
 {
-	csr_clear(CSR_IE, BIT(d->hwirq));
+	if (IS_ENABLED(CONFIG_32BIT) && d->hwirq >= BITS_PER_LONG)
+		csr_clear(CSR_IEH, BIT(d->hwirq - BITS_PER_LONG));
+	else
+		csr_clear(CSR_IE, BIT(d->hwirq));
 }
 
 static void riscv_intc_irq_unmask(struct irq_data *d)
 {
-	csr_set(CSR_IE, BIT(d->hwirq));
+	if (IS_ENABLED(CONFIG_32BIT) && d->hwirq >= BITS_PER_LONG)
+		csr_set(CSR_IEH, BIT(d->hwirq - BITS_PER_LONG));
+	else
+		csr_set(CSR_IE, BIT(d->hwirq));
 }
 
 static void riscv_intc_irq_eoi(struct irq_data *d)
@@ -115,16 +131,20 @@ static struct fwnode_handle *riscv_intc_hwnode(void)
 
 static int __init riscv_intc_init_common(struct fwnode_handle *fn)
 {
-	int rc;
+	int rc, nr_irqs = riscv_isa_extension_available(NULL, SxAIA) ?
+			  64 : BITS_PER_LONG;
 
-	intc_domain = irq_domain_create_linear(fn, BITS_PER_LONG,
+	intc_domain = irq_domain_create_linear(fn, nr_irqs,
 					       &riscv_intc_domain_ops, NULL);
 	if (!intc_domain) {
 		pr_err("unable to add IRQ domain\n");
 		return -ENXIO;
 	}
 
-	rc = set_handle_irq(&riscv_intc_irq);
+	if (riscv_isa_extension_available(NULL, SxAIA))
+		rc = set_handle_irq(&riscv_intc_aia_irq);
+	else
+		rc = set_handle_irq(&riscv_intc_irq);
 	if (rc) {
 		pr_err("failed to set irq handler\n");
 		return rc;
@@ -132,7 +152,9 @@ static int __init riscv_intc_init_common(struct fwnode_handle *fn)
 
 	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
 
-	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
+	pr_info("%d local interrupts mapped%s\n",
+		nr_irqs, riscv_isa_extension_available(NULL, SxAIA) ?
+			 " using AIA" : "");
 
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
