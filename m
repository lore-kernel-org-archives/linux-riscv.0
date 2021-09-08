Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA76C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:47:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCFCD61158
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DCFCD61158
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c7RRj0B7ozfT6STk/pLIQYCIi60bkljyof7SnL/lsrw=; b=ZEBoU+7x/Bheb3
	4kXLQXkcUFQcXqR/wfnpa31IMno2y5Yezl1cz/hov88DdC8/UrNfHNYlVB87AJ2RTknf8iwSNv08X
	GmRIzmax1WzWy4ODofzFr6YjfuY6fsd65zlhQJ7kspDIhilMer7svxEJLy3JU2t30QZzdxiA0C2eB
	IVdIhECan2dIVr06gTRorRdWA2JBRKV5kS9fpNRHJylPN3m8LkfyYu4bsRKgZO7VNg4591oq/UV+m
	qpKVjWpARtsp3TGt0uHaR06eGeEW/c2luCwdokBfoJgbU7sA2bDfMA3wJt99DgRUI15b0NYAiLO5Q
	8ynayoxrUPF9LGbL986A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO1fE-007JYr-IE; Wed, 08 Sep 2021 17:47:12 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO1eD-007Ija-VG
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 17:46:11 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 8so3407315pga.7
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 10:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=maGY6THRp1T65p0hgMojOL1EiKy9jGkK4UEsKBY1Ryw=;
 b=c8zWOcw6kVX4vOv8/1rp4/9fSdZBgQiJdf4qtqOwd+3sCAijC/eJmsx6k0GO8VPrwv
 5dQpLrvWlyGrx4YuMm5xwr9wmuwgXZb871YRIyZLYfmbVi3/NYoeUUmHwbZYFqLrjLwH
 aZ8iJTXXsuIS1/1fF2ZOLcWk2N71a8fC2cmhGPAqYjszycLG0lZCwp3J9sL4HADJtXr3
 f49YRXZkdN2tvsOxysdnKINjBKSwmSZTXs3VRhPCRsIJjoTmRWxRLMalOuYpFwyfXxQG
 0wKr8xV/eAJoO00sfqLPU9mCxzan5a08VxuNWDnDfEVF8AQfYoYakCt8ZEqKeijkz4CZ
 pJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=maGY6THRp1T65p0hgMojOL1EiKy9jGkK4UEsKBY1Ryw=;
 b=nywCKmUZpGIE+agbBZM9g43pHiuYrrNoj5tPrfiaSNPFAvc9cE/JJetbuuG4dNOjg/
 Fn6E60+NFbzU4O/htyoxRIjKtY44H5k5ItFQ19NG1y8mtN2F1od7FibVsNCb5DQt+YBr
 X56Y+makV1fNnG2FYywtwItw9madFjGnoYpzTaGR59OHrWDLDMLfub+v72Doo8Yi8CXS
 XGAwCkzAmK7r0J8YuWxAT3c8qKs+55LLA+tmjTc5LR2quzoe98r6LYfb0DB9dXZS5v9g
 df6hQCAfv0f1DobnEWrniF8+eyVPxKhMLpTv15Nh5liQxryAzQ0H8nFyzXJ+WmwsMFJX
 Wzkg==
X-Gm-Message-State: AOAM532GyLTQlzetDa8EQMKeMw8bKUQpfSoyXYRjhwY6PMLUVtZVJHd1
 RjINpYXLYis3hiFNQbiuxVJYwPJiQ9+rLw==
X-Google-Smtp-Source: ABdhPJx39mwALbCWBwg4LOgrBWcFxVIgln0X2S9qnl1d/SXuIT4BnnFvMuO5riwDoLVVFbmz8kFakA==
X-Received: by 2002:aa7:86cb:0:b0:412:448c:89c8 with SMTP id
 h11-20020aa786cb000000b00412448c89c8mr4883991pfo.84.1631123168723; 
 Wed, 08 Sep 2021 10:46:08 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b5sm3108466pfr.26.2021.09.08.10.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 10:46:08 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: [RFC PATCH v8 21/21] riscv: Turn has_vector into a static key if
 VECTOR=y
Date: Thu,  9 Sep 2021 01:45:33 +0800
Message-Id: <56e2328d133045c79b420ecbcaf37cf9d0b2248c.1631121222.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631121222.git.greentime.hu@sifive.com>
References: <cover.1631121222.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_104610_048443_19DC6F89 
X-CRM114-Status: GOOD (  15.86  )
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

Just like fpu, we can use static key for has_vector.
The has_vector check sits at hot code path: switch_to(). Currently,
has_vector is a bool variable if VECTOR=y, switch_to() checks it each time,
we can optimize out this check by turning the has_vector into a static key.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/switch_to.h     | 10 +++++++---
 arch/riscv/kernel/cpufeature.c         |  4 ++--
 arch/riscv/kernel/kernel_mode_vector.c |  4 ++--
 arch/riscv/kernel/process.c            |  8 ++++----
 arch/riscv/kernel/signal.c             |  6 +++---
 5 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index b48c9c974564..576204217e0f 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -71,7 +71,11 @@ static __always_inline bool has_fpu(void) { return false; }
 #endif
 
 #ifdef CONFIG_VECTOR
-extern bool has_vector;
+extern struct static_key_false cpu_hwcap_vector;
+static __always_inline bool has_vector(void)
+{
+	return static_branch_likely(&cpu_hwcap_vector);
+}
 extern unsigned long riscv_vsize;
 extern void __vstate_save(struct __riscv_v_state *save_to, void *datap);
 extern void __vstate_restore(struct __riscv_v_state *restore_from, void *datap);
@@ -120,7 +124,7 @@ static inline void __switch_to_vector(struct task_struct *prev,
 }
 
 #else
-#define has_vector false
+static __always_inline bool has_vector(void) { return false; }
 #define riscv_vsize (0)
 #define vstate_save(task, regs) do { } while (0)
 #define vstate_restore(task, regs) do { } while (0)
@@ -136,7 +140,7 @@ do {							\
 	struct task_struct *__next = (next);		\
 	if (has_fpu())					\
 		__switch_to_fpu(__prev, __next);	\
-	if (has_vector)					\
+	if (has_vector())					\
 		__switch_to_vector(__prev, __next);	\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index af984f875f60..0139ec20adce 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -23,7 +23,7 @@ __ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_fpu);
 #endif
 #ifdef CONFIG_VECTOR
 #include <asm/vector.h>
-bool has_vector __read_mostly;
+__ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_vector);
 unsigned long riscv_vsize __read_mostly;
 #endif
 
@@ -157,7 +157,7 @@ void __init riscv_fill_hwcap(void)
 
 #ifdef CONFIG_VECTOR
 	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
-		has_vector = true;
+		static_branch_enable(&cpu_hwcap_vector);
 		/* There are 32 vector registers with vlenb length. */
 		rvv_enable();
 		riscv_vsize = csr_read(CSR_VLENB) * 32;
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 0d990bd8b8dd..0d08954c30af 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -110,7 +110,7 @@ static void vector_flush_cpu_state(void)
  */
 void kernel_rvv_begin(void)
 {
-	if (WARN_ON(!has_vector))
+	if (WARN_ON(!has_vector()))
 		return;
 
 	WARN_ON(!may_use_vector());
@@ -140,7 +140,7 @@ EXPORT_SYMBOL(kernel_rvv_begin);
  */
 void kernel_rvv_end(void)
 {
-	if (WARN_ON(!has_vector))
+	if (WARN_ON(!has_vector()))
 		return;
 
 	/* Invalidate vector regs */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 05ff5f934e7e..62540815ba1c 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -96,7 +96,7 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 		fstate_restore(current, regs);
 	}
 
-	if (has_vector) {
+	if (has_vector()) {
 		struct __riscv_v_state *vstate = &(current->thread.vstate);
 
 		/* Enable vector and allocate memory for vector registers. */
@@ -141,11 +141,11 @@ void flush_thread(void)
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 {
 	fstate_save(src, task_pt_regs(src));
-	if (has_vector)
+	if (has_vector())
 		/* To make sure every dirty vector context is saved. */
 		vstate_save(src, task_pt_regs(src));
 	*dst = *src;
-	if (has_vector) {
+	if (has_vector()) {
 		/* Copy vector context to the forked task from parent. */
 		if ((task_pt_regs(src)->status & SR_VS) != SR_VS_OFF) {
 			dst->thread.vstate.datap = kzalloc(riscv_vsize, GFP_KERNEL);
@@ -164,7 +164,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 void arch_release_task_struct(struct task_struct *tsk)
 {
 	/* Free the vector context of datap. */
-	if (has_vector)
+	if (has_vector())
 		kfree(tsk->thread.vstate.datap);
 }
 
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index d30a3b588156..6a19b4b7b206 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -192,7 +192,7 @@ static long restore_sigcontext(struct pt_regs *regs,
 				goto invalid;
 			goto done;
 		case RVV_MAGIC:
-			if (!has_vector)
+			if (!has_vector())
 				goto invalid;
 			if (size != rvv_sc_size)
 				goto invalid;
@@ -221,7 +221,7 @@ static size_t cal_rt_frame_size(void)
 
 	frame_size = sizeof(*frame);
 
-	if (has_vector)
+	if (has_vector())
 		total_context_size += rvv_sc_size;
 	/* Preserved a __riscv_ctx_hdr for END signal context header. */
 	total_context_size += sizeof(struct __riscv_ctx_hdr);
@@ -288,7 +288,7 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 	if (has_fpu())
 		err |= save_fp_state(regs, &sc->sc_fpregs);
 	/* Save the vector state. */
-	if (has_vector)
+	if (has_vector())
 		err |= save_v_state(regs, &sc_reserved_free_ptr);
 
 	/* Put END __riscv_ctx_hdr at the end. */
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
