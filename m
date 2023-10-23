Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AA3C001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 08:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F9DfPsIlwDCxOl76QqHN+lA/yhsMlVPrKXbIldSb5Ws=; b=Sjj7Pza3C8CX5F
	puL2SzJD9BHtfGk+Jch296giA50GXdbCkev0dpSnHhsbK/an6f4ZU6ATMmzv4I1ISTtzpyU02nEVJ
	ESYmY85ZTjKm7183BLTbbL2wbHUZjHwzsgPVP5h3EP2eglTiYTCX3ZQWaeeSxbBRdz9gPfZJZ8CfK
	xGvWFydMK7tC1ths1TKT7sGstJyGQqRfEAD7hKn1s8B8yXz0s/ofAr2Lxk+rshSEfZGzarM6nDoKx
	A3QnzRMj8U0IdslS43ezTrv8k0VEKYI6fKV3BLkpvn8d/g5cn+oytYHZHeiAVDYMYtE5FnW1QDTTO
	le0ZGGi6NlITq8hHLNRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqK7-006lAq-0f;
	Mon, 23 Oct 2023 08:30:07 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqK4-006l89-1P
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 08:30:05 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c87a85332bso25201535ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 01:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698049801; x=1698654601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDj8p8VlOUWmt6ePZtJj52Ju7p2Y1636xaXynBRmH4M=;
        b=ODJdGxmReoD7hWYIRmt0lJdTnjfOkyC2a32HqyIcehNhtpHKnaDr+dt0r9YiHTvAiA
         JBVu7ujaycbLs28tmD0edu72bODe26eefvVViQXdw9LIJkJgLp/G8hDUmA1EZaUrt6Hi
         8uHFq42WiUBCIQWIY2n+iiduun7FHBG5LCcd3F1nEU33nqtiARnmiFVg7KFBhjW5rasJ
         7Cp/jJtTWSncGo2rrSB1i0JlZJ4Vzw6V3DgtSNejGQz6sIwN5mlb8MSIRJsEJopFtuKv
         77I8TWxmLZk9Gq3wnivb+8fWwjYoVSczp+pdA2KNJ+7Yh9MFR8ybBulLKIVv2l7d4H7E
         R8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698049801; x=1698654601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDj8p8VlOUWmt6ePZtJj52Ju7p2Y1636xaXynBRmH4M=;
        b=RPcomi1STB2mgBDC/16zAcF8CKc6GU3T6m1tjQqo26m8kPoNAzFLJdZ5/7TPSa3iVa
         epGvsoGa0nXQva4yO2WEtrU9gU1WW/mN2ehVNw4u3aRayFCcSPOsq5tTz8Mka0XBVf9q
         PrgVeb9TCXWZgUUpYsyMdLa38i5s2L3v9/QyuctVDRmKvG7v3FmYE6DQEDyi6d/HbrrT
         b8wak+OfkYBAkV69fdFTOSeim+4u2nyIosIlB6hUuy4JYvTn4fQRKyBTKGEug1U1EsQY
         VsuizDx5tQAeVVAFPKqo3PutKMInygtAhFxqj4c/VWEjoDoQQITif9LuvqwNmdkij6QR
         IGFQ==
X-Gm-Message-State: AOJu0Yx7e78eqrGtGvZAE3K3i47+pzNtrQLa7rdta4vpGhdVLr9baZ6j
	aQpHgJWi0OfLCCbnFifyGcIy5g==
X-Google-Smtp-Source: AGHT+IHcCdTfYDcXkZ0Qt5csB3IUm6TeiHVMhTQKrBuA3FQKpUEaJPQvyodQ8j5twuKfm3ICNLk/lg==
X-Received: by 2002:a17:902:c602:b0:1c8:7822:e5c3 with SMTP id r2-20020a170902c60200b001c87822e5c3mr7531739plr.47.1698049800869;
        Mon, 23 Oct 2023 01:30:00 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d15-20020a170903230f00b001b8b07bc600sm5415805plh.186.2023.10.23.01.29.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Oct 2023 01:30:00 -0700 (PDT)
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
Subject: [RFC 07/12] riscv: Handle pseudo NMI in arch irq handler
Date: Mon, 23 Oct 2023 16:29:06 +0800
Message-Id: <20231023082911.23242-8-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231023082911.23242-1-luxu.kernel@bytedance.com>
References: <20231023082911.23242-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_013004_480208_3FE01922 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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

This commit handles pseudo NMI in arch irq handler. We enter NMI context
before handling NMI and keeps all interrupts disabled during NMI handling
to avoid interrupt nesting.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
Signed-off-by: Hangjing Li <lihangjing@bytedance.com>
---
 drivers/irqchip/irq-riscv-intc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 83a0a744fce6..c672c0c64d5d 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -20,6 +20,26 @@
 
 static struct irq_domain *intc_domain;
 
+#ifdef CONFIG_RISCV_PSEUDO_NMI
+
+static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
+{
+	unsigned long cause = regs->cause & ~CAUSE_IRQ_FLAG;
+
+	if (unlikely(cause >= BITS_PER_LONG))
+		panic("unexpected interrupt cause");
+
+	if (is_nmi(cause)) {
+		nmi_enter();
+		generic_handle_domain_nmi(intc_domain, cause);
+		nmi_exit();
+	} else {
+		generic_handle_domain_irq(intc_domain, cause);
+	}
+}
+
+#else /* CONFIG_RISCV_PSEUDO_NMI */
+
 static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
 {
 	unsigned long cause = regs->cause & ~CAUSE_IRQ_FLAG;
@@ -30,6 +50,8 @@ static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
 	generic_handle_domain_irq(intc_domain, cause);
 }
 
+#endif /* CONFIG_RISCV_PSEUDO_NMI */
+
 /*
  * On RISC-V systems local interrupts are masked or unmasked by writing
  * the SIE (Supervisor Interrupt Enable) CSR.  As CSRs can only be written
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
