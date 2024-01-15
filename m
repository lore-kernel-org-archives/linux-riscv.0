Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A3FC47DA6
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 07:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Vs9LroMK+DKRWFwJgakEJ6k5WFx7T8j+5ZANt3hQ5A=; b=akWW5opX5nQ59M
	V1erqzFJiTWl1VFY8pQRyjm2iGHWTM4CyGwmZyEDB+KHfggMbDEPCEfXNUdZtY/W9scKtRA/eQSGk
	0KUibyQrMMwfvKrBudjgVn9Kwj5qEsyJLlPEny1W3xlH6lLwoQe/8K7heBdzZhShQOyk1ROyDCRWT
	m6ysdVxhZamcjJxhQZUknAa2WtnAn7zNgkoULf9CQ+cCoBF2VdIsP8rv99YCSezb6lqiHO2YMPLak
	fo2AtkdpnWsNFLLPpmW3edUBLUmVt3gk5pxSFWquuNxIfXmgn/HjMeHkNyLoEABWvemL7lfQ/JLP0
	/ifnK1B7iME66vBHrYuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPHBn-0083Dj-1q;
	Mon, 15 Jan 2024 07:15:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPG1x-007qZT-0E
	for linux-riscv@bombadil.infradead.org;
	Mon, 15 Jan 2024 06:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8MWrqoU0Ka6AL1F0Cvls3jUzvKOCNug5V0O39ZvxzlU=; b=Npa3FI3cLg/X3oCC+9OjSP0wWg
	pLrufgN6pSZk1TNmvRfI4r0ru5CEv2Jf3LPzfTSQKzuDeF9n8FuiICpjadcx4d0+r1AoLMv1rsvo7
	Gw5l0znnLBrfcELZTnubBVM3xgREY1esExxkeegcDdpwVjYFfdFCQf9I6bdFBSQ45kTBjaxxCmgjz
	aT9lCaYaZRZZn7SRKycL2yJnOhf45ZQ4PvcV3LZ8oDUrWXoUgya4reR1eu0KYUWTuTZsJkzObI8nE
	W+1pcsKhyDRjeUUoAdrK76j57c0KQ2JfgAGnZwjaIyhCQmIYxLaK+So6p/9qrafbpX+7ZhzpB+f20
	5KY6ep3Q==;
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPG1s-00D1gj-2O
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 06:01:03 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3606e2120bdso62166915ab.0
        for <linux-riscv@lists.infradead.org>; Sun, 14 Jan 2024 22:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705298458; x=1705903258; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8MWrqoU0Ka6AL1F0Cvls3jUzvKOCNug5V0O39ZvxzlU=;
        b=fBRf5d13F2Mr6RhEDLji1DOFCx5qzpNDZXPPlPiR1TgSjLzLJAQHSc3KOkKhCsDuLh
         I9anUBuJO8/CPqfEesbgYWs7rcSup+QNpeCOokQQkNV/3nxFobOKkeI/IXeBIS+6+UkN
         ziSHQdngdhMcvO/QqYEJB1DI0ubDGJ/H+0WGsPfsxK5fTiDzBfQ2NQHwzaiqeMUyxavM
         uvAMm7wJXStEFIgnHjYYsJogHWwuT+PKNyITFq4pRzmu0StcHBK61z9m6DZhm5nO+Ulu
         iJlr66yD40U1uuvBnmq0efqiIV4fQgERuAWnmUea5vATEHHhYG6ftaGMCvxD+RuODS/l
         Lc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705298458; x=1705903258;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8MWrqoU0Ka6AL1F0Cvls3jUzvKOCNug5V0O39ZvxzlU=;
        b=UdSB9NwNm4t9nm6VIk6/H70FMWMI+Ny6YOm2zuLX53ue+4L1vkR2n6yB6yXMbMqc2M
         90rLUAoZURNsuBWL76ttkNzh460+4FjY7EfBpd+2RVoEbD6Y0IjOqL7hJw4S9Y55+VQM
         JAr34TsyNcMBw3tInJVwn9BNrU9ZWLUoYEpTScFTebXh9wqcfLp4PFnoCb+82pbFLilE
         BTe5Gm/JD0HFeGw+L9JAjMm1sbX71Q4VlqeQ1lLLiDTTW5wOOSLq+P0rW58Svqp/xxnA
         Dj+JDFC+ZAzjLYIXCLCZZAlNoA3UU0Ez1m78E9JFcyeqbhAEOzLFUDvPG9kJUlWvIaCM
         EsQA==
X-Gm-Message-State: AOJu0YxX2wqMREebKi0rA6oZ18nD1hSRYOS217GUnRWa7G5mxL2pvG79
	qEERWjrkAXnkAQByoaqO+3cl3VzIQroGau7MeuBiftsrybKQcUd1CgygotZOJKCPPmjFcKv3yiO
	Sh2jh0rXujDDpCmnWIcibUQCLoo2z2wbLtj3GjG63JXY8nEFzfZCSWx78iBIWJEXpfeU+PrK/kW
	nSblxyJXJrtNyovTJM043c
X-Google-Smtp-Source: AGHT+IHQ8FPxlMY544qtu8IIfM32jd7dTIw0cjVoBM9ni+Q8yDW6sKzRDMemN7xi/5OAql9srQy77w==
X-Received: by 2002:a05:6e02:1a47:b0:35f:eec4:ed55 with SMTP id u7-20020a056e021a4700b0035feec4ed55mr7754210ilv.62.1705298457894;
        Sun, 14 Jan 2024 22:00:57 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o18-20020a637e52000000b005b9083b81f0sm7392988pgn.36.2024.01.14.22.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 22:00:57 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	charlie@rivosinc.com,
	ardb@kernel.org,
	arnd@arndb.de,
	peterz@infradead.org,
	tglx@linutronix.de,
	ebiggers@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Joel Granados <j.granados@samsung.com>
Subject: [v11, 09/10] riscv: vector: use kmem_cache to manage vector context
Date: Mon, 15 Jan 2024 05:59:28 +0000
Message-Id: <20240115055929.4736-10-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240115055929.4736-1-andy.chiu@sifive.com>
References: <20240115055929.4736-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_060101_228780_0F3FB829 
X-CRM114-Status: GOOD (  12.30  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The allocation size of thread.vstate.datap is always riscv_v_vsize. So
it is possbile to use kmem_cache_* to manage the allocation. This gives
users more information regarding allocation of vector context via
/proc/slabinfo. And it potentially reduces the latency of the first-use
trap because of the allocation caches.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v11:
 - proceed allocation only if has_vector() returns true.
Changelog v6:
 - new patch since v6
---
 arch/riscv/include/asm/vector.h |  4 ++++
 arch/riscv/kernel/process.c     |  7 ++++++-
 arch/riscv/kernel/vector.c      | 19 ++++++++++++++++++-
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index d75079520629..7b316050f24f 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -26,6 +26,8 @@ void kernel_vector_begin(void);
 void kernel_vector_end(void);
 void get_cpu_vector_context(void);
 void put_cpu_vector_context(void);
+void riscv_v_thread_free(struct task_struct *tsk);
+void __init riscv_v_setup_ctx_cache(void);
 
 static inline u32 riscv_v_flags(void)
 {
@@ -227,6 +229,8 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define __switch_to_vector(__prev, __next)	do {} while (0)
 #define riscv_v_vstate_off(regs)		do {} while (0)
 #define riscv_v_vstate_on(regs)			do {} while (0)
+#define riscv_v_thread_free(tsk)		do {} while (0)
+#define  riscv_v_setup_ctx_cache()		do {} while (0)
 
 #endif /* CONFIG_RISCV_ISA_V */
 
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 36993f408de4..862d59c3872e 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -179,7 +179,7 @@ void arch_release_task_struct(struct task_struct *tsk)
 {
 	/* Free the vector context of datap. */
 	if (has_vector())
-		kfree(tsk->thread.vstate.datap);
+		riscv_v_thread_free(tsk);
 }
 
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
@@ -228,3 +228,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
 	return 0;
 }
+
+void __init arch_task_cache_init(void)
+{
+	riscv_v_setup_ctx_cache();
+}
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index c1f28bc89ec6..f7b4aeb9e457 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -21,6 +21,7 @@
 #include <asm/bug.h>
 
 static bool riscv_v_implicit_uacc = IS_ENABLED(CONFIG_RISCV_ISA_V_DEFAULT_ENABLE);
+static struct kmem_cache *riscv_v_user_cachep;
 
 unsigned long riscv_v_vsize __read_mostly;
 EXPORT_SYMBOL_GPL(riscv_v_vsize);
@@ -47,6 +48,16 @@ int riscv_v_setup_vsize(void)
 	return 0;
 }
 
+void __init riscv_v_setup_ctx_cache(void)
+{
+	if (!has_vector())
+		return;
+
+	riscv_v_user_cachep = kmem_cache_create_usercopy("riscv_vector_ctx",
+							 riscv_v_vsize, 16, SLAB_PANIC,
+							 0, riscv_v_vsize, NULL);
+}
+
 static bool insn_is_vector(u32 insn_buf)
 {
 	u32 opcode = insn_buf & __INSN_OPCODE_MASK;
@@ -84,7 +95,7 @@ static int riscv_v_thread_zalloc(void)
 {
 	void *datap;
 
-	datap = kzalloc(riscv_v_vsize, GFP_KERNEL);
+	datap = kmem_cache_zalloc(riscv_v_user_cachep, GFP_KERNEL);
 	if (!datap)
 		return -ENOMEM;
 
@@ -94,6 +105,12 @@ static int riscv_v_thread_zalloc(void)
 	return 0;
 }
 
+void riscv_v_thread_free(struct task_struct *tsk)
+{
+	if (tsk->thread.vstate.datap)
+		kmem_cache_free(riscv_v_user_cachep, tsk->thread.vstate.datap);
+}
+
 #define VSTATE_CTRL_GET_CUR(x) ((x) & PR_RISCV_V_VSTATE_CTRL_CUR_MASK)
 #define VSTATE_CTRL_GET_NEXT(x) (((x) & PR_RISCV_V_VSTATE_CTRL_NEXT_MASK) >> 2)
 #define VSTATE_CTRL_MAKE_NEXT(x) (((x) << 2) & PR_RISCV_V_VSTATE_CTRL_NEXT_MASK)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
