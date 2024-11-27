Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363AFD6ACF9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 17:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKAr+qfLEKd7pDLeyY5HKm4InZv655DnEZsuCwfFNIs=; b=Oln3Znz3dtFQk9
	HjTF1DVFiVT5phLUlR99uQZTMYsfsG24Om6JYE3DEfHC+X4uoAM/SlFCB9zR2S6UYN7SapmLQstyy
	bYJv0cDC1hl/vMUWehwMsqm58qh0ATEc+xs+E9S9hd5K+cPP0DoHly+dyUb3MMtID0uRWCfl/4dK5
	teygVR9zrZuqyrFnB3LODOHnDvXWn180rl29nxyR+o3cPQQePCMQlKcF6QeLvN3zWCMc7BAGgvOgf
	GNAmBQsuPWWX7o1S8+n0Yi6qjDaSoTuEfucJqtGXEMgQ8mVymFLffQ9IMGN9jfi/w0LgfN0lsuMrX
	iq0heKfM6RRehM8Ium9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLrl-0000000DkaF-1nRW;
	Wed, 27 Nov 2024 17:30:17 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLrh-0000000DkXF-0ccb
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 17:30:15 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7fbbe0fb0b8so5465226a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 09:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732728612; x=1733333412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hlixj4dxi1hv7t1eaE352YtuPYrxmNR32TDpbYYyUtI=;
        b=MJDsib9WBTdRvwrCNKHy99DUyuFr27l2kM8/Rop0rdJGH4fLiTDTALS0GSrQ55peu8
         JjXZe7iCjw50x1eicKd0N+wC2ZEL8qYmvVrjBwGERoj1nbtBgvtpUbHW5ALiABVsgCN0
         QnLpF0LoMtLozy2ytWnsmV/+dfdCajvh8zzd264TUzMzUg4tMorq5zQJ8toHFl4Rsli9
         nFEZDs5Gm0yYsigMps48VXJ2/2gXKbEq3ri+19ZI8GS1dKkkBGUJ8U86acH1Zxnr1XYd
         EzxwsiUz7sK8ogHl4LW542bJt+L3Nb9VEQS3ny0yZmmpT3nPl4A+4Nci6eVm+H8pGmZv
         g0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732728612; x=1733333412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hlixj4dxi1hv7t1eaE352YtuPYrxmNR32TDpbYYyUtI=;
        b=KQop1Ns1YwUOly8TlPEeVb/8sKQjA+XvLrEI14kmjpeKZSnRKz8HqSZ4xUZjkIJk+h
         tQmGw8FR66+BQ/LymoyO3cJyVl5XXuw2xLItpspH9qW6SPSqYX2Im08h+3HKu6WZPeeb
         tlCjwXr3tRA1b7x2xxZP06nhW24wrxtf6lLOKKq09MrSuAxUZMDsCCj4iy2YYAYuE2Fh
         LbFulFcJRFQpvWozUszocvdAUS9jSo49xS0VZajPL4Lk5MJ1JE3qAg3upF9F97WgA+ET
         tPs0vAnLq+BaZ5QiwOoeJfjOlvE7ybAZArtZC69LcPxLmMu4tBWWId/6MFCC7JqvBUnU
         borA==
X-Gm-Message-State: AOJu0Ywf5Yivzh7+OhY6aFCRaMw4gSxCayGbitIzmMYRswxyarBKAdIZ
	B8FT9z8Y2Xe0qiesEC/5hfg0vkKCIZolDNFjh0HgjpZdX2HhUliVq1OeZrFJ
X-Gm-Gg: ASbGncuTmnaTDNdrY2X2DKyLQO07136gdIidsbfrFpfZXdOr34yF0GRhGgaEiuI6DDD
	yo34c99GQVpP8CysQ+5Tcd7Qip3nZRwcgrtmU2hZDGe2vmOnvOenOd5QJoejstsU4YuApmxDRKY
	1+qhBYXy7oMGDxf5LISuJCuLPYIx+RWMCAPbCde4EET6NLIMYxMvXZmgbYnPGZx7clHSYWIoAbp
	5oDiISJnJMsHrniBA5JnHHmtm7Zlth7voGwnm++g4Rx5tYlXlZWNV619zb6HubZ+PagxZeUV5M6
	6K/HISV+MwizYHth+NX6D4bpx6vs
X-Google-Smtp-Source: AGHT+IG4NurKvJEqxA2cpsneqQG887+tFx88JjKBx3q3M02mZmw0BTNFpg0m60820Xm5RX2iTEn9oA==
X-Received: by 2002:a05:6a21:e8c:b0:1e0:c56f:7da8 with SMTP id adf61e73a8af0-1e0e0aa83camr5657700637.4.1732728611949;
        Wed, 27 Nov 2024 09:30:11 -0800 (PST)
Received: from localhost.localdomain (1-171-29-17.dynamic-ip.hinet.net. [1.171.29.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc1e3fdbsm9359582a12.30.2024.11.27.09.30.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 27 Nov 2024 09:30:11 -0800 (PST)
From: Andy Chiu <andybnac@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bjorn@rivosinc.com,
	puranjay12@gmail.com,
	alexghiti@rivosinc.com,
	yongxuan.wang@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	tommy.wu@sifive.com,
	eric.lin@sifive.com,
	viccent.chen@sifive.com,
	zong.li@sifive.com,
	samuel.holland@sifive.com
Subject: [PATCH v3 5/7] riscv: vector: Support calling schedule() for preemptible Vector
Date: Thu, 28 Nov 2024 01:29:06 +0800
Message-Id: <20241127172908.17149-6-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241127172908.17149-1-andybnac@gmail.com>
References: <20241127172908.17149-1-andybnac@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_093013_184760_6E3B02D5 
X-CRM114-Status: GOOD (  15.16  )
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

From: Andy Chiu <andy.chiu@sifive.com>

Each function entry implies a call to ftrace infrastructure. And it may
call into schedule in some cases. So, it is possible for preemptible
kernel-mode Vector to implicitly call into schedule. Since all V-regs
are caller-saved, it is possible to drop all V context when a thread
voluntarily call schedule(). Besides, we currently don't pass argument
through vector register, so we don't have to save/restore V-regs in
ftrace trampoline.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/processor.h |  5 +++++
 arch/riscv/include/asm/vector.h    | 22 +++++++++++++++++++---
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 5f56eb9d114a..9c1cc716b891 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -79,6 +79,10 @@ struct pt_regs;
  *       Thus, the task does not own preempt_v. Any use of Vector will have to
  *       save preempt_v, if dirty, and fallback to non-preemptible kernel-mode
  *       Vector.
+ *  - bit 29: The thread voluntarily calls schedule() while holding an active
+ *    preempt_v. All preempt_v context should be dropped in such case because
+ *    V-regs are caller-saved. Only sstatus.VS=ON is persisted across a
+ *    schedule() call.
  *  - bit 30: The in-kernel preempt_v context is saved, and requries to be
  *    restored when returning to the context that owns the preempt_v.
  *  - bit 31: The in-kernel preempt_v context is dirty, as signaled by the
@@ -93,6 +97,7 @@ struct pt_regs;
 #define RISCV_PREEMPT_V			0x00000100
 #define RISCV_PREEMPT_V_DIRTY		0x80000000
 #define RISCV_PREEMPT_V_NEED_RESTORE	0x40000000
+#define RISCV_PREEMPT_V_IN_SCHEDULE	0x20000000
 
 /* CPU-specific state of a task */
 struct thread_struct {
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index c7c023afbacd..c5b6070db99f 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -76,6 +76,11 @@ static __always_inline void riscv_v_disable(void)
 	csr_clear(CSR_SSTATUS, SR_VS);
 }
 
+static __always_inline bool riscv_v_is_on(void)
+{
+	return !!(csr_read(CSR_SSTATUS) & SR_VS);
+}
+
 static __always_inline void __vstate_csr_save(struct __riscv_v_ext_state *dest)
 {
 	asm volatile (
@@ -244,6 +249,11 @@ static inline void __switch_to_vector(struct task_struct *prev,
 	struct pt_regs *regs;
 
 	if (riscv_preempt_v_started(prev)) {
+		if (riscv_v_is_on()) {
+			WARN_ON(prev->thread.riscv_v_flags & RISCV_V_CTX_DEPTH_MASK);
+			riscv_v_disable();
+			prev->thread.riscv_v_flags |= RISCV_PREEMPT_V_IN_SCHEDULE;
+		}
 		if (riscv_preempt_v_dirty(prev)) {
 			__riscv_v_vstate_save(&prev->thread.kernel_vstate,
 					      prev->thread.kernel_vstate.datap);
@@ -254,10 +264,16 @@ static inline void __switch_to_vector(struct task_struct *prev,
 		riscv_v_vstate_save(&prev->thread.vstate, regs);
 	}
 
-	if (riscv_preempt_v_started(next))
-		riscv_preempt_v_set_restore(next);
-	else
+	if (riscv_preempt_v_started(next)) {
+		if (next->thread.riscv_v_flags & RISCV_PREEMPT_V_IN_SCHEDULE) {
+			next->thread.riscv_v_flags &= ~RISCV_PREEMPT_V_IN_SCHEDULE;
+			riscv_v_enable();
+		} else {
+			riscv_preempt_v_set_restore(next);
+		}
+	} else {
 		riscv_v_vstate_set_restore(next, task_pt_regs(next));
+	}
 }
 
 void riscv_v_vstate_ctrl_init(struct task_struct *tsk);
-- 
2.39.3 (Apple Git-145)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
