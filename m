Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C36CC47DA9
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 16:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GYPASAH6CUtoadrUUgs/vifzxzP1e3APVGu0P/dz/EY=; b=VzQL/3BNFtk6F8
	SV6zOhAtmmfWzLwTLN40h/FjJpdg/osG3kmP6Ft6eNrAeLuMmJZf+fgZaf0srzIswhnQmyADIH7fB
	gJVkPXlx5POTgEKnxH1R+k7noOB0p2HKTvw+hfWllmEjN8HViIAZPCcXSlq3NIQZQ3PdiIL/SORZf
	mrb/+YGpKopwTsjt1jo+XeydLURwMeHLAtENuktl2ahadTM8BiC/TupT4iWOOZtbix6lOD0v51HHO
	7jVN7WHcacp/ZoJS9gJeKvAHgxY5QnBYZAmLhlWSMbtsLntTkZiUfx5iRgTXUbw58le+8vaGiSUm5
	KVo+6kAMzOEiw5u0XKPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlRU-00000007mQy-2nZA;
	Sat, 27 Jan 2024 16:22:04 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlPD-00000007ktE-3rsP
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 16:19:46 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5d4a1e66750so1018227a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jan 2024 08:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706372383; x=1706977183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RNpF/CWjVyq2jAidq9g4JrMuQdRaRtl2xGmvH6ydPA=;
        b=Jnvc3G3nZcLsFDB+zmL/Hh4lf8lJtkr4aU0mddxTY8awp1IvgEDhd9u48rh3+4vlo9
         sPTx9XLat8GtpetKqM0Oh38eCtM+wR2PMEtnV88/gJnDY/bH1E1I+hIgWc36qpFmjOU6
         f0RYAz9XYBNa9EuoWjkE2a4QQ8d1LIJkzmVs5uD5y/DGva0EXxHGh9sIiBR9MAMLH1oB
         bjMUEtVMccKoDrr7QbI3Engir3V/tE+/56Kkpcz9W7Sevjg/p0nV372THMixEkix51yg
         AUwIh9T//FK39zPH3vwxrq8EzEMEla/fiZRaLKPZ5gKo5zaqOVlvYWN3iOOLFWQko21Z
         RlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706372383; x=1706977183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RNpF/CWjVyq2jAidq9g4JrMuQdRaRtl2xGmvH6ydPA=;
        b=p6ch1fpNPh7/TxOpVFIa17zzFjYQVv/doBamAZUIgRZojw5rospw/meKYWUD7SFaTn
         2I8NSN8fNQWnowzBl8Ot/XGHrNPmOtQSJFV/yaQcuZp84pTQROnkZqXj21tCqs3EZVY7
         o+oBxN6k1KwN7/LEnok+ZeAMyFTnhCkHO+HhHEKXLSHP+wbXx7eRfWmaQ3GDlz46hKqs
         F4cajvEHX4X4VQUmtqvmuwG8bAdD5WXmhsoTmJ3yC7iy+EoybeDrlf33pPr+beBsakQ+
         U4WSLKb+k27U9LebV84TsP1Qs9ZGEwvUeYy8qYQvDd430vWlgqhA0HV6xlHS30HHZGf2
         OnnQ==
X-Gm-Message-State: AOJu0YzyqIDYEKnMa5jPHVLWaPYVW5faLMMC5sdTY7C3oTdtlmwysi+O
	OGiYO16vEJVf+moTZP1nSglG5fuFZKRwRLCuUIwXLmuqX10SHM5cQBm+iexJndo=
X-Google-Smtp-Source: AGHT+IGTKXIA5A/F3TIh/2K3JI3cv2cr3UOEKzMWDcSO7KNGHDfWEcFiCVK572zchauO7w9gUHQZbQ==
X-Received: by 2002:a17:90a:9205:b0:295:488:5ad7 with SMTP id m5-20020a17090a920500b0029504885ad7mr654558pjo.5.1706372382559;
        Sat, 27 Jan 2024 08:19:42 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.17])
        by smtp.gmail.com with ESMTPSA id d11-20020a17090ac24b00b00290f8c708d0sm5091620pjx.57.2024.01.27.08.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 08:19:42 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v12 15/25] irqchip/riscv-intc: Add support for RISC-V AIA
Date: Sat, 27 Jan 2024 21:47:43 +0530
Message-Id: <20240127161753.114685-16-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240127161753.114685-1-apatel@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_081944_278873_A92D2772 
X-CRM114-Status: GOOD (  13.91  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
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
