Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16747C76196
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 03:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmuBFqg5hsJRbIps70tmJ8XCz+RRTvWbYbxCBo6c1ec=; b=y2ifpFp+spc4Oe
	e/jHYh27aMY8uWgXGF6bH0QYC+JyVt+wUKHH9mfHHgb8doyvEATzPPJDfUv2PvqPV07dMjN4rdccy
	RfRMbj6ea9ydhecqXoMCjgRjc+A7hZrki0j7MD9abbBuqUG2w8u4ijWhssshSbrPWPbOJkweQBy/O
	B9uVLEzn4iSzJuqjxMbwN8hOlaKP6WAaEXpkTGpovD5aT3oifqYVEGR6m5AX8MbLAFvPTMcCWhs75
	5J85nIyuZwQNeUwhi4ajHtBoMCGKX/R/bHFL88aMkk8BhyVXzWvlXMOg2fGZn1dP+JXRNvUcqnWFE
	MZLMHP/LL+4hJcUS83/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph0OZ-00D3t1-2t;
	Tue, 28 Mar 2023 03:53:15 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph0OX-00D3r2-1y
	for linux-riscv@lists.infradead.org;
	Tue, 28 Mar 2023 03:53:14 +0000
Received: by mail-pj1-x102e.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so13888669pjp.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 20:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679975592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7s+91AtfNZFr11BBB79AwltySbIUEsIHQ1Gjnv2r90=;
        b=GEjjNtl9m0uaQ14T5Cp1Xzcub+kVAmI1XQP1g3dY3m8lo5LAKKLNNVYVlxv7+bKlMA
         aRe3MlgyoNB6TZOAM3CmHphWZB7MwQpq0xEz1SPLpc9j43+L+WzMCZhR2jJHCsZrxxBg
         oauGLWdq3+weB5U+6utGq3PfFDXlHAfL36MmLcIh4IxAF9oCkYpIUhILDb6O1c2kMBCC
         GkI1ZvIh6E/Zh4Qbn3Jz8fcQj3inLGLdNzP3RyHR3tiTE9dzWt6EdvPV+wzYExHZX7ZE
         ZMoysS6lt4jlK4loF2zpDXRDDPEoWJaT5LhD8kuYoUoxU0iK7elxFMScvp0V6EnJi2lE
         yPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679975592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7s+91AtfNZFr11BBB79AwltySbIUEsIHQ1Gjnv2r90=;
        b=WQkzzMD/1DAfNftqDfQc4NeXc70Yn4ag50039npMN+6hHA6s13FhpX/HyyJjDk+6Hc
         AZg8gtbIFMXNSCDal+RA7nw/z1McIyR8jF6ujWs0qFeK3XGcRQdOYTdk3+t3AVbg4F2G
         lD9NRF1wR+gyCsZ4i9XTwXKXOEWeWTpiMQUSWVj2i0zM6Stdx3LG+owPaRttyvmGzqWf
         0LBRgEzXHNWgQXUJ8qpUKgqOu5y0CrOAjR8klB4ag2zwuxZjIQxWCV6EjP+NzAOwYbdl
         ZjS31iAQ3u7ldLsIc6Pz3rLOkNWpxMSZTImxU31y1kJaSF9LuxWsXxBviqmPNgOVwoH8
         D1Og==
X-Gm-Message-State: AAQBX9feimjBi4hb6Ex8DT2CQAWGbsSRI3Tk5t22fr/MlM24yDmV6oYM
	1bZd68CZI+ObsfE6QDbS+u1Syg==
X-Google-Smtp-Source: AKy350blb+cJVDOCRTgjKfm7KJqOhQzjeIhTlA8ZV+SWnKT1CdLB9KsiVTmjKDZxHKrOPWQ3G5xUKw==
X-Received: by 2002:a17:90b:3b90:b0:23f:a674:dc0b with SMTP id pc16-20020a17090b3b9000b0023fa674dc0bmr16062620pjb.15.1679975591902;
        Mon, 27 Mar 2023 20:53:11 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.82.104])
        by smtp.gmail.com with ESMTPSA id g6-20020a170902740600b0019cb534a824sm19880278pll.172.2023.03.27.20.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 20:53:11 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v18 7/7] irqchip/riscv-intc: Add empty irq_eoi() for chained irq handlers
Date: Tue, 28 Mar 2023 09:22:23 +0530
Message-Id: <20230328035223.1480939-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328035223.1480939-1-apatel@ventanamicro.com>
References: <20230328035223.1480939-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_205313_647137_F336D015 
X-CRM114-Status: GOOD (  11.07  )
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

We add empty irq_eoi() in RISC-V INTC driver for child irqchip
drivers (such as PLIC, SBI IPI, CLINT, APLIC, IMSIC, etc) which
implement chained handlers for parent per-HART local interrupts.
This hels us avoid unnecessary mask/unmask of per-HART local
interrupts at the time of handling interrupts.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 drivers/irqchip/irq-riscv-intc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 784d25645704..f229e3e66387 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -46,10 +46,27 @@ static void riscv_intc_irq_unmask(struct irq_data *d)
 	csr_set(CSR_IE, BIT(d->hwirq));
 }
 
+static void riscv_intc_irq_eoi(struct irq_data *d)
+{
+	/*
+	 * The RISC-V INTC driver uses handle_percpu_devid_irq() flow
+	 * for the per-HART local interrupts and child irqchip drivers
+	 * (such as PLIC, SBI IPI, CLINT, APLIC, IMSIC, etc) implement
+	 * chained handlers for the per-HART local interrupts.
+	 *
+	 * In the absence of irq_eoi(), the chained_irq_enter() and
+	 * chained_irq_exit() functions (used by child irqchip drivers)
+	 * will do unnecessary mask/unmask of per-HART local interrupts
+	 * at the time of handling interrupts. To avoid this, we provide
+	 * an empty irq_eoi() callback for RISC-V INTC irqchip.
+	 */
+}
+
 static struct irq_chip riscv_intc_chip = {
 	.name = "RISC-V INTC",
 	.irq_mask = riscv_intc_irq_mask,
 	.irq_unmask = riscv_intc_irq_unmask,
+	.irq_eoi = riscv_intc_irq_eoi,
 };
 
 static int riscv_intc_domain_map(struct irq_domain *d, unsigned int irq,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
