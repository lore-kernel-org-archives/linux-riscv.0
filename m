Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CEFCDB474
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 08:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DvhMJRAkdtLX/lu8MU60bYPRPfBD9b7wzFvQG7buroQ=; b=Atr1IU8xN3nUJ2
	ZSgp6bLH+AbfEHi716UFKGzcptvyR24Cy3j/hJ3RVRyoV/AD0SWOtNfC65IBmKZ6y7P5Ggsob2/Dm
	8sonWodTJR/1zIx5cPI0MnhXodmvN+glgHpkPAe6YSlhoL2yIwI2z0aNE/JwJkxkKx7WcwLzpvWHg
	mnEoIsXGBOYrMZbbnQrUMm5OFNDiaZ6EsaRkSuohDDKBxAtaAIc55xBEw3bzpWCaxKCJZSFxgtHsz
	7J6UyT8Fh2jNMYSL3Tra+DhyfCAwu8QwVn1LV6CjMOMaGD5K2OhuyHK+VtgO9/FjuIW4Z7fKcICCu
	i+6MUmBADK31I2VNXHZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqKI-006lGW-2k;
	Mon, 23 Oct 2023 08:30:18 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqKF-006lDy-2V
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 08:30:17 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6ba54c3ed97so2910293b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 01:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698049812; x=1698654612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJ95gw/OAzQTy7Pqa/IxTLGW5cdMj2QHsOf1G6j+k+o=;
        b=VqN51kCiEKhqVD3ruj0WFW8AhO35SlNSGprhK7YGvMvIA+fxbnifYJws41AYU+poKp
         GAm5tccyOSdHqusRyKE1tjqmE4nNiOEG1cuOvEJDVtJBkyztFNRE0AGcWA9SMrM/ZqTD
         iof8H1PASd6GHhy0c+Z+NmYqqkVy+gVO1QBL8ONSQ0VwJidR0qxwtK1wRFgFc6F9E1VY
         xbvhUbpG/w22JGmTMI1ATdbHfjWSFWqsF5LqYxUSP6HlDZWgrHc4nKwGJmCZptbOEkJW
         +gwkze6IY2df7xH+dlzBT9W7jNkjB+QstsUkhQEzMnNcRb823iUrM8ZmmfE5KzCgcdZt
         BOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698049812; x=1698654612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJ95gw/OAzQTy7Pqa/IxTLGW5cdMj2QHsOf1G6j+k+o=;
        b=t2uUZVLDVg/3cpNDIFMGriGa7WBX91ASVgC5wRw2TBKAJu3M2JTZ85lf9SAaBQhDIr
         d6QtTT0l0QY+giFT71LuZ9G/5tjFYdNHYZaa0850BF22If+oeqGdWo62Fb/1alzXp3+C
         7zdNehbg6vQbIndbuLMIaOXzuWazEqSlD6LmJboJbjOpMA0JgNyEWg+ryahMjQuiQDQC
         0nFlIViuajXha5//Qz76DET/YRR8gR2cs8+nNmq0i2PIeCoWCPvdt2x6WKyohS64pGYK
         rB0bM+ijlLkVKuIA3H3wIfOgmDaW0cWnKRsVzXg+ok8D6mrV7lwbUHzVWisk94AN19xn
         nYgA==
X-Gm-Message-State: AOJu0YwsFUjhRyOr5ZMkuHmYR+GLwOVTrZiBrUHTYo0dpfzwh2El2acs
	Hb0LUfhKdHQEEUuBSNt0ypezmw==
X-Google-Smtp-Source: AGHT+IGiT6MKYuJi2ZVpq5CAD0Z+TUVQ/Ug4skMI+tZ5HzA4krihsDz81Ez71goYp3lfV7OVtvYOHA==
X-Received: by 2002:a05:6a20:1611:b0:17b:8016:6f79 with SMTP id l17-20020a056a20161100b0017b80166f79mr10196547pzj.3.1698049812218;
        Mon, 23 Oct 2023 01:30:12 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d15-20020a170903230f00b001b8b07bc600sm5415805plh.186.2023.10.23.01.30.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Oct 2023 01:30:11 -0700 (PDT)
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
Subject: [RFC 09/12] riscv: Enable NMIs during exceptions
Date: Mon, 23 Oct 2023 16:29:08 +0800
Message-Id: <20231023082911.23242-10-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231023082911.23242-1-luxu.kernel@bytedance.com>
References: <20231023082911.23242-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_013015_817159_750DA83C 
X-CRM114-Status: UNSURE (   9.20  )
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

We have switched the way of disabling irqs to CSR_IE masking. But
hardware still automatically clearing SIE field of CSR_STATUS whenever
thread traps into kernel, which disabling all irqs including NMIs.

This commit re-enables NMIs and normal irqs during exceptions by setting
the SIE field in CSR_STATUS and restoring NMI and irq bits in CSR_IE.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/irqflags.h  | 13 +++++++++++++
 arch/riscv/include/asm/switch_to.h |  7 +++++++
 arch/riscv/kernel/traps.c          | 10 ++++++++++
 3 files changed, 30 insertions(+)

diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/irqflags.h
index 42f7803582df..6a709e9c69ca 100644
--- a/arch/riscv/include/asm/irqflags.h
+++ b/arch/riscv/include/asm/irqflags.h
@@ -29,6 +29,16 @@ static inline void set_nmi(int irq) {}
 
 static inline void unset_nmi(int irq) {}
 
+static inline void enable_nmis(void)
+{
+	csr_set(CSR_IE, ALLOWED_NMI_MASK);
+}
+
+static inline void disable_nmis(void)
+{
+	csr_clear(CSR_IE, ALLOWED_NMI_MASK);
+}
+
 static inline void local_irq_switch_on(void)
 {
 	csr_set(CSR_STATUS, SR_IE);
@@ -128,6 +138,9 @@ static inline void arch_local_irq_restore(unsigned long flags)
 	csr_set(CSR_STATUS, flags & SR_IE);
 }
 
+static inline void enable_nmis(void) {}
+static inline void disable_nmis(void) {}
+
 #endif /* !CONFIG_RISCV_PSEUDO_NMI */
 
 #endif /* _ASM_RISCV_IRQFLAGS_H */
diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index a727be723c56..116cffeaa6bf 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -84,4 +84,11 @@ do {							\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
+#ifdef CONFIG_RISCV_PSEUDO_NMI
+
+#define prepare_arch_switch(next)			disable_nmis()
+#define finish_arch_post_lock_switch()			enable_nmis()
+
+#endif /* CONFIG_RISCV_PSEUDO_NMI */
+
 #endif /* _ASM_RISCV_SWITCH_TO_H */
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index fae8f610d867..63d3c1417563 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -135,7 +135,9 @@ asmlinkage __visible __trap_section void name(struct pt_regs *regs)		\
 {										\
 	if (user_mode(regs)) {							\
 		irqentry_enter_from_user_mode(regs);				\
+		enable_nmis();							\
 		do_trap_error(regs, signo, code, regs->epc, "Oops - " str);	\
+		disable_nmis();							\
 		irqentry_exit_to_user_mode(regs);				\
 	} else {								\
 		irqentry_state_t state = irqentry_nmi_enter(regs);		\
@@ -292,8 +294,12 @@ asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
 	if (user_mode(regs)) {
 		irqentry_enter_from_user_mode(regs);
 
+		enable_nmis();
+
 		handle_break(regs);
 
+		disable_nmis();
+
 		irqentry_exit_to_user_mode(regs);
 	} else {
 		irqentry_state_t state = irqentry_nmi_enter(regs);
@@ -338,10 +344,14 @@ asmlinkage __visible noinstr void do_page_fault(struct pt_regs *regs)
 {
 	irqentry_state_t state = irqentry_enter(regs);
 
+	enable_nmis();
+
 	handle_page_fault(regs);
 
 	local_irq_disable();
 
+	disable_nmis();
+
 	irqentry_exit(regs, state);
 }
 #endif
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
