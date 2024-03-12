Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA398C54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 21:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L6rzV4VBIAl40L/IKLgV/8ShWxD+1+kingTURpWr0f4=; b=noF0NhFX2LRVY5
	k49j1y/h9BsFN+O1sMrXfRwaHIZoHbCy95tzVL1Pr++nX9Nr/blDjpl4WHr+NaLGMxmIw+jNydzxc
	M4SAK7DARwpAFoL2c9sdw3Lkq31KzNKQhvV1NbN/XE7l0Jq9jAEQDZLYO1zRoWRq4YLvxfBs7RadQ
	RIz6XG5a8NouVnhFi/+rHCE2L3YQB590pAtggBiIUekrUEqjCtomHUI9j88OMa2jGdr8BeQnYGSlc
	JJpMDm0MzPGfND3DhwuqLU0uD0ZfHNo/itp++E3PKiprd0AY+TMfEmjzXvRV/b6Kr1RG8oPZVpeja
	aQH7hVGO5eE9OodcHGYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk9fY-00000007bMM-1CJJ;
	Tue, 12 Mar 2024 21:28:20 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk9fV-00000007bKH-1iEe
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 21:28:18 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1dd97fd66cdso22108045ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 14:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710278894; x=1710883694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J07qi3Pm6IWKJCmXkuIy6slfTmc3cDOIJrvkEFADZ84=;
        b=QXG0nvIF29wJQMXuO9xXin/bJb7ABzcnp1fk/vDmQ8USPcsFWJhpxunC6wnJZDui66
         ZIlxxb3tOKM3yUAdpq04JEJPuwK34gGnSKjCreT2/f9StDXIXIEErZddnLZf3PhOg2Qr
         6JJc+rSrvgwOG8pnl6klvTwc9ySKSZSwefSLF+6TIQi/zPntQ8/E3feYxfEB7PJI93bh
         DxN1b9rNlFON1lw5s4AW1vk0vm8VyiUHNenkqILT6CVQWmkR0PhYHKo+4tVlvCJ2takC
         MVs5rdWsHFWxkLDjf83uHvJV1H2DFXG81VXrEoVbU9ZF0sYKd0L+sAC4ApleZ/vSLh4h
         bBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710278894; x=1710883694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J07qi3Pm6IWKJCmXkuIy6slfTmc3cDOIJrvkEFADZ84=;
        b=Rila6kNc5DWcVftIGzN3ydKdeMxmVlxC4Rx+PTl+d8IyG/UmtjsYdxGCcUip97wjYJ
         FlrPBV+gzDO0xRQgDtYuAugVOomj3kixpQD/2Jn1cndYyBqRf4iA5vyDfqJbkrejzg03
         fHZI2pEi7qQN7PsYY2yxy4sCA5BvLpBja2zHWMqacmBjr1/WxjjO8tyLIGwCBBuJBDlI
         SjYXU7+NW7u6kvg6MMj3fHRwRuPoFkpznewjey7WQvGRCWWSfywGsrdbHfOcn7ZVQQMb
         4qwT8ybr/Wfsj11jWlcqB+De2mrF6ZL90Ghw3irR1a3AdobjosFKUjbJJWelxaAjGBJm
         qnFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeG1mYpXYi+HCzar6L9MziEldObMlHPzwxqCbJ679NZBedtEC2zSUAPzKlWZKvi5u9wP3dlyyk0OLdQDbdn3SZ0FlgPLigti3cLUwKFca1
X-Gm-Message-State: AOJu0YwF/+MQTy0AttbMAoLFlmvvDO7xMms4eal/yV+9ImEH9WPbSLn9
	eE35l11/bwN96Z2ISr52uryL3w/6tukAs1jN3dnVxvur2s25L9L11Ly4g+oSs2n0aH6FTQ5EqfY
	+
X-Google-Smtp-Source: AGHT+IHUbA2fkuidigz0aEHwAs7BBlFBOtglNgjvKDQ2scnMN4VpbFIoE44l+8Y0xPIP9t2+5WWAFA==
X-Received: by 2002:a17:902:b58b:b0:1db:edfa:7713 with SMTP id a11-20020a170902b58b00b001dbedfa7713mr11533807pls.18.1710278894337;
        Tue, 12 Mar 2024 14:28:14 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u17-20020a170903125100b001db5fc51d71sm7222248plh.160.2024.03.12.14.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 14:28:13 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] irqchip/riscv-intc: Fix use of AIA IRQs 32-63 on riscv32
Date: Tue, 12 Mar 2024 14:28:08 -0700
Message-ID: <20240312212813.2323841-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_142817_472751_3D7098F7 
X-CRM114-Status: GOOD (  14.52  )
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

riscv_intc_custom_base is initialized to BITS_PER_LONG, so the second
check passes even though AIA provides 64 IRQs. Adjust the condition to
only check the custom IRQ range for IRQs outside the standard range, and
adjust the standard range when AIA is available.

Fixes: bb7921cdea12 ("irqchip/riscv-intc: Add support for RISC-V AIA")
Fixes: e6bd9b966dc8 ("irqchip/riscv-intc: Fix low-level interrupt handler setup for AIA")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/irqchip/irq-riscv-intc.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index f87aeab460eb..9e71c4428814 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -149,8 +149,9 @@ static int riscv_intc_domain_alloc(struct irq_domain *domain,
 	 * Only allow hwirq for which we have corresponding standard or
 	 * custom interrupt enable register.
 	 */
-	if ((hwirq >= riscv_intc_nr_irqs && hwirq < riscv_intc_custom_base) ||
-	    (hwirq >= riscv_intc_custom_base + riscv_intc_custom_nr_irqs))
+	if (hwirq >= riscv_intc_nr_irqs &&
+	    (hwirq < riscv_intc_custom_base ||
+	     hwirq >= riscv_intc_custom_base + riscv_intc_custom_nr_irqs))
 		return -EINVAL;
 
 	for (i = 0; i < nr_irqs; i++) {
@@ -183,10 +184,12 @@ static int __init riscv_intc_init_common(struct fwnode_handle *fn, struct irq_ch
 		return -ENXIO;
 	}
 
-	if (riscv_isa_extension_available(NULL, SxAIA))
+	if (riscv_isa_extension_available(NULL, SxAIA)) {
+		riscv_intc_nr_irqs = 64;
 		rc = set_handle_irq(&riscv_intc_aia_irq);
-	else
+	} else {
 		rc = set_handle_irq(&riscv_intc_irq);
+	}
 	if (rc) {
 		pr_err("failed to set irq handler\n");
 		return rc;
@@ -195,7 +198,7 @@ static int __init riscv_intc_init_common(struct fwnode_handle *fn, struct irq_ch
 	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
 
 	pr_info("%d local interrupts mapped%s\n",
-		riscv_isa_extension_available(NULL, SxAIA) ? 64 : riscv_intc_nr_irqs,
+		riscv_intc_nr_irqs,
 		riscv_isa_extension_available(NULL, SxAIA) ? " using AIA" : "");
 	if (riscv_intc_custom_nr_irqs)
 		pr_info("%d custom local interrupts mapped\n", riscv_intc_custom_nr_irqs);
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
