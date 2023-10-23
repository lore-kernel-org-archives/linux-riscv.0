Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D23C001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 08:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/YNTRnHw0yOQaL0ss/iiCJGRfZCwUYRWDFd0ewvW7g=; b=Rf13uCR1i//nk7
	Zijj/lG2Dd52fW97dmBj9Gu9Q/EP8r6zb3tFMcvPasMGSiVg3cEfoCPAdzh9xV2ObDKBKDCWPcaUo
	L4n9TjxUW/7ywHG4Ot5VDydmlRo8b5svyLQA7qwbCNGSp1bpqTIsWgOLPdDcGNXOiD+8yvweuK8hR
	aTrbFGTHthh3W2guVv0o+hglYBVhgRcgisVov85IrGDGEbD85xU3HTx8I3/BvCHgRMJfp3iGXqzlu
	duVrTYRpF8Nk9MG38XLKAzkoa3Nu2qJf9H03Sy7RmAJqDtyI/RpzG34jAnxVeRqVgH1y3mVwm56H0
	TrtZHr1dPL1IDpzTsQtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqJy-006l6O-1E;
	Mon, 23 Oct 2023 08:29:58 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqJv-006l4e-20
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 08:29:57 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-68fb85afef4so2396866b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 01:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698049795; x=1698654595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUO1/BVdvM4H5C6LBNItdP0IIJipRGNxmDV7eD7nopg=;
        b=YOEkYWaJX4J6nQH/j/ix0gyM0HNFxdvdxB3PPUu483b2ogm/0WrxAWTpoLuY0mY6ui
         yyXAz1xLRTNuALQfkeQDpj51w2dtws8vQOT5S4Tx+xSYqoOhnjGpiBWUh/Cwic7QIbyr
         HS07uV2uJZsMW6r8TfD204CKZRsHjkbCxVN34Gr2fEasxw7I7QSDKklXjq0ixfaXRsO6
         HnT2N6CYAeQsjDWeZM9tNdMTrrVMpXQHdE0YY+U9GKKsTDsoq1XlWlb7LfrriTLoQhLg
         ow8WuC4PGQDtwgTkWf3iEeQwVqtEMBBh2cVEcQ+CGr/svbCWMg53saZIiJqIlyodW21C
         XIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698049795; x=1698654595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUO1/BVdvM4H5C6LBNItdP0IIJipRGNxmDV7eD7nopg=;
        b=X9Pq3tG8tICGhFOKBkKEnvMnzMIFZ5VsNDNyu/duvrsAzigzp/+JM2G7wlcEzCoDRn
         ZvyHU8uBuJNebN6sV06CA+r1cUVT4yQGsEULCkFYcrLbvQ7QFSslwDAIqg6WDlrGi2qo
         +MMFAvrmqNAzUwJteZF/tJjCNg3RLPGGQKNnH9T4FzfmCPwQOKk/aoBJSyPnnovq5s7z
         092YRCRp9+q/IeY16rW4kbjHPAtzCM4CfvyzGfwevNkslZaSQYTxdDtd4oZZVqq8X6iC
         /M4pvvm0i3Ywq/lcCMKX9a08p7xOMZh0aSis2N90WC/nhk6Cnkiecr/9bYZzCRWtEQWF
         if9Q==
X-Gm-Message-State: AOJu0YxaPapKIR5YIPWemdQk1oUNjWGOxYoUt6iVgme+AMxBl8/3O8WR
	cgJnAU0UPYRJFIlUfTB7KFSywA==
X-Google-Smtp-Source: AGHT+IEuewyI9+tw5QJUm2oN6guHecDPjWsmm8bO+1FZNslxYqHTr+PcfG3+59e4kYZAI8n0lGmkLw==
X-Received: by 2002:a05:6a20:2615:b0:151:7d4c:899c with SMTP id i21-20020a056a20261500b001517d4c899cmr4935811pze.25.1698049795184;
        Mon, 23 Oct 2023 01:29:55 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d15-20020a170903230f00b001b8b07bc600sm5415805plh.186.2023.10.23.01.29.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Oct 2023 01:29:54 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@linutronix.de,
	maz@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: dengliang.1214@bytedance.com,
	liyu.yukiteru@bytedance.com,
	sunjiadong.lff@bytedance.com,
	xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	chaiwen.cc@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC 06/12] riscv: Allow requesting irq as pseudo NMI
Date: Mon, 23 Oct 2023 16:29:05 +0800
Message-Id: <20231023082911.23242-7-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231023082911.23242-1-luxu.kernel@bytedance.com>
References: <20231023082911.23242-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_012955_666345_2A554591 
X-CRM114-Status: GOOD (  10.81  )
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

This commit implements pseudo NMI callbacks for riscv_intc_irq chip. We
use an immediate macro to denote NMIs of each cpu. Each bit of it
represents an irq. Bit 1 means corresponding irq is registered as NMI
while bit 0 means not.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
Signed-off-by: Hangjing Li <lihangjing@bytedance.com>
Reviewed-by: Liang Deng <dengliang.1214@bytedance.com>
Reviewed-by: Yu Li <liyu.yukiteru@bytedance.com>
---
 arch/riscv/include/asm/irqflags.h | 17 ++++++++++++++
 drivers/irqchip/irq-riscv-intc.c  | 38 +++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/irqflags.h
index 60c19f8b57f0..9700a17a003a 100644
--- a/arch/riscv/include/asm/irqflags.h
+++ b/arch/riscv/include/asm/irqflags.h
@@ -12,6 +12,23 @@
 
 #ifdef CONFIG_RISCV_PSEUDO_NMI
 
+#define __ALLOWED_NMI_MASK			0
+#define ALLOWED_NMI_MASK			(__ALLOWED_NMI_MASK & irqs_enabled_ie)
+
+static inline bool nmi_allowed(int irq)
+{
+	return (BIT(irq) & ALLOWED_NMI_MASK);
+}
+
+static inline bool is_nmi(int irq)
+{
+	return (BIT(irq) & ALLOWED_NMI_MASK);
+}
+
+static inline void set_nmi(int irq) {}
+
+static inline void unset_nmi(int irq) {}
+
 static inline void local_irq_switch_on(void)
 {
 	csr_set(CSR_STATUS, SR_IE);
diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 7fad1ba37e5c..83a0a744fce6 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -67,11 +67,49 @@ static void riscv_intc_irq_eoi(struct irq_data *d)
 	 */
 }
 
+#ifdef CONFIG_RISCV_PSEUDO_NMI
+
+static int riscv_intc_irq_nmi_setup(struct irq_data *d)
+{
+	unsigned int hwirq = d->hwirq;
+	struct irq_desc *desc = irq_to_desc(d->irq);
+
+	if (WARN_ON((hwirq >= BITS_PER_LONG) || !nmi_allowed(hwirq)))
+		return -EINVAL;
+
+	desc->handle_irq = handle_percpu_devid_fasteoi_nmi;
+	set_nmi(hwirq);
+
+	return 0;
+}
+
+static void riscv_intc_irq_nmi_teardown(struct irq_data *d)
+{
+	unsigned int hwirq = d->hwirq;
+	struct irq_desc *desc = irq_to_desc(d->irq);
+
+	if (WARN_ON(hwirq >= BITS_PER_LONG))
+		return;
+
+	if (WARN_ON(!is_nmi(hwirq)))
+		return;
+
+	desc->handle_irq = handle_percpu_devid_irq;
+	unset_nmi(hwirq);
+}
+
+#endif /* CONFIG_RISCV_PSEUDO_NMI */
+
 static struct irq_chip riscv_intc_chip = {
 	.name = "RISC-V INTC",
 	.irq_mask = riscv_intc_irq_mask,
 	.irq_unmask = riscv_intc_irq_unmask,
 	.irq_eoi = riscv_intc_irq_eoi,
+#ifdef CONFIG_RISCV_PSEUDO_NMI
+	.irq_nmi_setup = riscv_intc_irq_nmi_setup,
+	.irq_nmi_teardown = riscv_intc_irq_nmi_teardown,
+	.flags = IRQCHIP_SUPPORTS_NMI,
+#endif
 };
 
 static int riscv_intc_domain_map(struct irq_domain *d, unsigned int irq,
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
