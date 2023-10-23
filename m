Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA3CCDB474
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 08:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cIJRQBmNoxCV2YIzBXNsEv7v+S9Tt/J0qgdb1Orwl54=; b=ocZXJVy/VnPZAO
	632JI0JZLIYj29mEnmuOpqQ3/aal+IhzmBKq4FrdmzKgePkw7dYDgus0QBQc0cWyorcIzwccymi94
	4+C4lXCBqbIxhPBjhXigXagA4wWaAFWhw2FJqarI+GuLeEtPDYQuffBKflXh18yWoYV/9MD3UQGyb
	QXv2v8SuFzVqWtwGRRYzOhHH5e896znn18bjW2tvSnd6sc4GT7f1gUaVopgUHKnXKcXQFNlfKGedK
	UEiFjt6VnF2+AurOBKzNPo5JqFFQinSVjN+7NP/K6gsnjvNNBUWOoje2ZiFbJIpqiRE+2LJuNk0yV
	vPLDnPpOqTQWBMA3J1Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqJj-006kz0-0M;
	Mon, 23 Oct 2023 08:29:43 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqJg-006kwu-0o
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 08:29:41 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6b89ab5ddb7so3022093b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 01:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698049778; x=1698654578; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=at7wi3me+Z61wYFd7J2d3j74V70AFyRlLZ+mJARIjAE=;
        b=Yf+qwgTeC86msv+fzS41+u6C/NPzqYa1vGzBRdQBAEZVolHDLZuQjGQrR+WnooCMwi
         5tfmulygWXlwOu+Wue/AuN+0wA8EaTBZXkBiEinM9TBTAVAyrfTfDO/qEH9/GxYOe4+K
         5Q8lzzEtuPpy2Yg37qyuxYbWzkccIyOqRvmVXsXLKSH+jzpBqnqEfqCRmS7EAwKy9wiM
         nvjrKKfzPWDm/cx88QG3I7vS/y89cLMdB9CJFY3gQPYDp7VsQEmuywe0FBtmg65qr7nR
         YTNW0/nNuxww/nkLJAk6TlwoLPsmSPntQZYmU9EE2/OK9iDqSodQbc9u7jAdoGmFy9O7
         5dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698049778; x=1698654578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=at7wi3me+Z61wYFd7J2d3j74V70AFyRlLZ+mJARIjAE=;
        b=p9sosB1fkfmYxD/d63BahYoSLxUMLE5DpXeezFPJQHWxMMPPX0Ap0jsmyuXGk3ZEWZ
         34vwl+Qsiz1xYLGTHI3ZD/hV+LJz9JyjkktVXfCIEJnk1NVVQxfhIYYBZD82Z2qvEaDj
         y79H12ZYpupxgfCv0MvNCD0749nJ4nItvdB6/YpCWmhQNm7TfPfyPW9QL7AY4laeuXmT
         ES+eeSheoDtFXalIjHRQ0W4si62ryA1LX4hzFPykkULk8506nmqSDC5PLvpSnvAFS4uz
         ZYDcqrTUOKgLwPz2UucLKxlC9iWP+Nn1SlYwS8Qc6NkHfzaPaF25tIohh9lpV5gEFu2b
         Mv7A==
X-Gm-Message-State: AOJu0Yw22qjcIjZUfhuWJ7I4/UjZxbsczUpKauVJ4gYZXLSd/fTDsars
	B2kFN43Px2dHo/ukTIYyYfMQXA==
X-Google-Smtp-Source: AGHT+IHAxAXPREhEH68MgYTJlOqTtsbSB0gFuNM7voWNCv0htKF7/ukJX/oxNlGp1Ca/X+qqi24MCg==
X-Received: by 2002:a05:6a20:7489:b0:16b:afc2:3b68 with SMTP id p9-20020a056a20748900b0016bafc23b68mr10853205pzd.25.1698049778199;
        Mon, 23 Oct 2023 01:29:38 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d15-20020a170903230f00b001b8b07bc600sm5415805plh.186.2023.10.23.01.29.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Oct 2023 01:29:37 -0700 (PDT)
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
Subject: [RFC 03/12] riscv: Switch to CSR_IE masking when disabling irqs
Date: Mon, 23 Oct 2023 16:29:02 +0800
Message-Id: <20231023082911.23242-4-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231023082911.23242-1-luxu.kernel@bytedance.com>
References: <20231023082911.23242-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_012940_291184_BC89ABE5 
X-CRM114-Status: GOOD (  10.40  )
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

This commit switch the way of disabling irqs to CSR_IE masking.

After CSR_IE has been made a part of context, now we can safely
switch to CSR_IE masking when disabling irqs.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
Signed-off-by: Hangjing Li <lihangjing@bytedance.com>
Reviewed-by: Liang Deng <dengliang.1214@bytedance.com>
Reviewed-by: Yu Li <liyu.yukiteru@bytedance.com>
---
 arch/riscv/include/asm/irqflags.h | 58 +++++++++++++++++++++++++++++++
 arch/riscv/include/asm/ptrace.h   |  4 +++
 arch/riscv/kernel/entry.S         |  7 +++-
 arch/riscv/kernel/head.S          | 10 ++++++
 4 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/irqflags.h
index 08d4d6a5b7e9..e0ff37315178 100644
--- a/arch/riscv/include/asm/irqflags.h
+++ b/arch/riscv/include/asm/irqflags.h
@@ -10,6 +10,62 @@
 #include <asm/processor.h>
 #include <asm/csr.h>
 
+#ifdef CONFIG_RISCV_PSEUDO_NMI
+
+static inline void local_irq_switch_on(void)
+{
+	csr_set(CSR_STATUS, SR_IE);
+}
+
+static inline void local_irq_switch_off(void)
+{
+	csr_clear(CSR_STATUS, SR_IE);
+}
+
+/* read interrupt enabled status */
+static inline unsigned long arch_local_save_flags(void)
+{
+	return csr_read(CSR_IE);
+}
+
+/* unconditionally enable interrupts */
+static inline void arch_local_irq_enable(void)
+{
+	csr_set(CSR_IE, irqs_enabled_ie);
+}
+
+/* unconditionally disable interrupts */
+static inline void arch_local_irq_disable(void)
+{
+	csr_clear(CSR_IE, irqs_enabled_ie);
+}
+
+/* get status and disable interrupts */
+static inline unsigned long arch_local_irq_save(void)
+{
+	return csr_read_clear(CSR_IE, irqs_enabled_ie);
+}
+
+/* test flags */
+static inline int arch_irqs_disabled_flags(unsigned long flags)
+{
+	return (flags != irqs_enabled_ie);
+}
+
+/* test hardware interrupt enable bit */
+static inline int arch_irqs_disabled(void)
+{
+	return arch_irqs_disabled_flags(arch_local_save_flags());
+}
+
+/* set interrupt enabled status */
+static inline void arch_local_irq_restore(unsigned long flags)
+{
+	csr_write(CSR_IE, flags);
+}
+
+#else /* CONFIG_RISCV_PSEUDO_NMI */
+
 /* read interrupt enabled status */
 static inline unsigned long arch_local_save_flags(void)
 {
@@ -52,4 +108,6 @@ static inline void arch_local_irq_restore(unsigned long flags)
 	csr_set(CSR_STATUS, flags & SR_IE);
 }
 
+#endif /* !CONFIG_RISCV_PSEUDO_NMI */
+
 #endif /* _ASM_RISCV_IRQFLAGS_H */
diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
index b57d3a6b232f..e552e7fb46f3 100644
--- a/arch/riscv/include/asm/ptrace.h
+++ b/arch/riscv/include/asm/ptrace.h
@@ -178,7 +178,11 @@ static inline unsigned long regs_get_kernel_argument(struct pt_regs *regs,
 
 static inline int regs_irqs_disabled(struct pt_regs *regs)
 {
+#ifdef CONFIG_RISCV_PSEUDO_NMI
+	return (regs->ie != irqs_enabled_ie);
+#else
 	return !(regs->status & SR_PIE);
+#endif
 }
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 19ba7c4520b9..d1f28dab02f7 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -66,8 +66,13 @@ _save_context:
 	REG_S s4, PT_CAUSE(sp)
 	REG_S s5, PT_TP(sp)
 #ifdef CONFIG_RISCV_PSEUDO_NMI
-	csrr s0, CSR_IE
+	csrrw s0, CSR_IE, x0
 	REG_S s0, PT_IE(sp)
+	andi s1, s1, SR_PIE
+	beqz s1, 1f
+	li s1, SR_IE
+	csrs CSR_STATUS, s1
+1:
 #endif /* CONFIG_RISCV_PSEUDO_NMI */
 
 	/*
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 3710ea5d160f..4f9446defacd 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -169,6 +169,10 @@ secondary_start_sbi:
 	call relocate_enable_mmu
 #endif
 	call setup_trap_vector
+#ifdef CONFIG_RISCV_PSEUDO_NMI
+	li t0, SR_IE
+	csrs CSR_STATUS, t0
+#endif
 	tail smp_callin
 #endif /* CONFIG_SMP */
 
@@ -320,6 +324,12 @@ clear_bss_done:
 #ifdef CONFIG_KASAN
 	call kasan_early_init
 #endif
+
+#ifdef CONFIG_RISCV_PSEUDO_NMI
+	li t0, SR_IE
+	csrs CSR_STATUS, t0
+#endif
+
 	/* Start the kernel */
 	call soc_early_init
 	tail start_kernel
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
