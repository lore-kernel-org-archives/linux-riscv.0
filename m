Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B5EC25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 00:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1y1gH1GR0dIAIsZuTwyoZuYwDRcSHuanKcF7jJRmx8A=; b=NytOGWSJGyeGHG
	bYqUpDWTu4Wwk0S1DPctoKW6vvOUyCqH7LccsE6yuWcpy+JJsEkquZmY7RJk+HFTsj9HbrlzOoHjk
	WCnJm6gsauKO2U02juTBIV3XsG98SU9+tOCfb61H/hExUK1i2k7otyFkuiXsA9jMrt3Q+eFTrIDYQ
	HGi5kaL4+Cp4dMYkVJNmVbmzc+q9smRmBmo0j8iZFe15ELWH4B/vXcCu95IIBZYPYwbQSZlnqIYdp
	9blS0Pf7yLOOXjH2KqkGc/7WoPSWWaIFz9b2RoxehP74ZqVqnJwJsP3yWZb17yHKr4Q5MwLg+brFm
	n6jKmzNBLk5PbTbRdU5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCTUC-00000005s1F-1QvB;
	Thu, 30 May 2024 00:17:40 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCTU9-00000005rzy-2rnj
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 00:17:38 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7022e0cd0aeso397271b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 17:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1717028256; x=1717633056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGEn7Dcpmrkm/qCwkDxBmXXDS+7v8jGlOPv5lWfc4rI=;
        b=CBpPaJAKDQeuGnFLu61pdGY0RUHZQJTSRaiPoVFTRGbFavwOuQl8HuFvyYv0PGpdsK
         p94ZmHqZbaFRbGPwxgfWn9xHEl6c0k8QbuWp+GI33FZ3nFJLIaHlNFq210WObMSikMri
         n+S43KXceDmVGII3BOQhy3F8kXL97e+Oe5qWsaMwVeJ4AWS4UumP9nJgPLS9SBDSPBvF
         y+4qHC7J8xmHtakJPMUtglEP8OCNOOTPCrvrdV8xXYQC48FjyyFxEFfYU9r1qwwXNiqS
         7FOMyJ8gfaOpKG940L7kppVcRX6quMhA4UIP8Z3sEql4TVW/w8BnKCQhJaRYcXvq6awL
         HVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717028256; x=1717633056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGEn7Dcpmrkm/qCwkDxBmXXDS+7v8jGlOPv5lWfc4rI=;
        b=bJFR7G2u7keXa6irKb6BPZYoNV9iJh+e234Rd93uxaOtFgD3/Ab/+9Q1lnxQjMP16U
         QVJtqKc5/r06nzyDRLi9GKtI6o6O30cEd6/KIBOMJI7PSYsrIBzJVgozWZNwBYGTC+dp
         s3bJBC57MKWDc2aTuXAp+L8gaea4/2aHRZZaAM+EG16LJPVkY0DD0mUtqd1IAr7bcOOh
         iLMkebe8dXJ2xrQpbOGIG+ehUgvop0tpA3xVR0e8IjTnoa9VR6Rq3hDkA4uvZN6p7JXs
         1y05sDhlf6XVeLU35hdQfiYKMwH6hhLr090hb9qzTpMC4OENV+WBcx7cATgz0PzFC3my
         sMng==
X-Forwarded-Encrypted: i=1; AJvYcCXkRlIed4P8tNtBu7LSeZyLfWjhlmJ4fZNFB/uqdVKGIeXq2cAQVuNmVzs91HE69C+56I9cmMj9HAP4THMrF5NCf5gHX0YpSYM+IN7jQNEO
X-Gm-Message-State: AOJu0YzLHH6A53ibwQ/w7bgH0DpruA+/sPZygx8hWp1w9ddyobDFOA/M
	JmeJlajRDjIyQeUpripbMeKyE044DP5OKBUpM8J3HI0BTjbNqGdl0Kq7mV3F+RNn8ZT+7fXiI43
	Z
X-Google-Smtp-Source: AGHT+IE028Zs3GXZwzDr0NEuUh/9Ff7JfEC5B6eJ6oSGemUdfJZybhS0OU9JqpK9c78Xe9tkO4uwlA==
X-Received: by 2002:a05:6a20:158f:b0:1af:cd4a:1e1d with SMTP id adf61e73a8af0-1b26470f21bmr645349637.40.1717028256348;
        Wed, 29 May 2024 17:17:36 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a776e206sm432171a91.20.2024.05.29.17.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 17:17:35 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel@vger.kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	linux-riscv@lists.infradead.org,
	Matthew Bystrin <dev.mbstr@gmail.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 1/4] riscv: Fix 32-bit call_on_irq_stack() frame pointer ABI
Date: Wed, 29 May 2024 17:15:56 -0700
Message-ID: <20240530001733.1407654-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240530001733.1407654-1-samuel.holland@sifive.com>
References: <20240530001733.1407654-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_171737_745085_E853F931 
X-CRM114-Status: GOOD (  12.59  )
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

call_on_irq_stack() uses struct member offsets to set up its link in the
frame record list. On riscv32, `struct stackframe` is the wrong size to
maintain stack pointer alignment, so STACKFRAME_SIZE_ON_STACK includes
padding. However, the ABI requires the frame record to be placed
immediately below the address stored in s0, so the padding must come
before the struct members.

Fix the layout by making STACKFRAME_FP and STACKFRAME_RA the negative
offsets from s0, instead of the positive offsets from sp.

Fixes: 82982fdd5133 ("riscv: Deduplicate IRQ stack switching")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/asm-offsets.c | 4 ++--
 arch/riscv/kernel/entry.S       | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index b09ca5f944f7..84c056f5ee09 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -487,8 +487,8 @@ void asm_offsets(void)
 	OFFSET(SBI_HART_BOOT_STACK_PTR_OFFSET, sbi_hart_boot_data, stack_ptr);
 
 	DEFINE(STACKFRAME_SIZE_ON_STACK, ALIGN(sizeof(struct stackframe), STACK_ALIGN));
-	OFFSET(STACKFRAME_FP, stackframe, fp);
-	OFFSET(STACKFRAME_RA, stackframe, ra);
+	DEFINE(STACKFRAME_FP, offsetof(struct stackframe, fp) - sizeof(struct stackframe));
+	DEFINE(STACKFRAME_RA, offsetof(struct stackframe, ra) - sizeof(struct stackframe));
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
 	DEFINE(FREGS_SIZE_ON_STACK, ALIGN(sizeof(struct ftrace_regs), STACK_ALIGN));
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 68a24cf9481a..4c5b22cb7381 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -246,8 +246,8 @@ SYM_CODE_END(ret_from_fork)
 SYM_FUNC_START(call_on_irq_stack)
 	/* Create a frame record to save ra and s0 (fp) */
 	addi	sp, sp, -STACKFRAME_SIZE_ON_STACK
-	REG_S	ra, STACKFRAME_RA(sp)
-	REG_S	s0, STACKFRAME_FP(sp)
+	REG_S	ra, (STACKFRAME_SIZE_ON_STACK + STACKFRAME_RA)(sp)
+	REG_S	s0, (STACKFRAME_SIZE_ON_STACK + STACKFRAME_FP)(sp)
 	addi	s0, sp, STACKFRAME_SIZE_ON_STACK
 
 	/* Switch to the per-CPU shadow call stack */
@@ -265,8 +265,8 @@ SYM_FUNC_START(call_on_irq_stack)
 
 	/* Switch back to the thread stack and restore ra and s0 */
 	addi	sp, s0, -STACKFRAME_SIZE_ON_STACK
-	REG_L	ra, STACKFRAME_RA(sp)
-	REG_L	s0, STACKFRAME_FP(sp)
+	REG_L	ra, (STACKFRAME_SIZE_ON_STACK + STACKFRAME_RA)(sp)
+	REG_L	s0, (STACKFRAME_SIZE_ON_STACK + STACKFRAME_FP)(sp)
 	addi	sp, sp, STACKFRAME_SIZE_ON_STACK
 
 	ret
-- 
2.44.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
