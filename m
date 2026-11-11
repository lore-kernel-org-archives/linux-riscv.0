Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA23606A324
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 19:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F4Sr+p9R;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=gq2p2Eyy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DlYJnnrsKyk2ZvYIyT9DKQMqfd1W0sBc2hGZtccXSgk=; b=F4Sr+p9RS3RpNtJ7kb6cnzIQeI
	QNKEcbLMqqxvMuhQkstLYt1Lq6IysEkpunoAcnZzSP+S+IM+S2Ri/9oCiXA7eDYR9fuqXFarqs+mI
	5C3pQZuYp+MLsZvHc3fTqa5aOe+f3hQi7RyrV8LFkfWu+P98XG2laTZWGFVic6vG84Ruke73DzAEQ
	r/D6pdY6k8u/838YNXFEE3yDcsjeulnOCWpqVmBS3wgk0DkhVnd/b8P8e8HROMBzcYLx/ULHVdRty
	qHZH8n2jiOcb4X68RGAU5dsV9pgznSfVSwLMVM0hTHuJwYHLIMo0QwrH5Li/rFVSvW7RC3SZWZQPG
	RPq8rzPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDZB-00000007SjI-2b0W;
	Wed, 11 Nov 2026 19:01:05 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDZ8-00000007SiG-42Iw
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 19:01:04 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-8b32b2e691aso1726797b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 11:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1794423661; x=1795028461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WYFHQWZ/MsfvHC59O3vSeTxBC3BwdGpolCicla4nLjk=;
        b=gq2p2EyySPrEsa7/7E7qP4kkwcCX1oUViZfMdO2RlreAur1uRf3UuaU5SnPzUMibXC
         R0HpsE73EraHX6Gw0Yulqc26xhJ12jM8MtPy71AHAX/UOAPA3hpoU4WiV8gUPEpPuwGr
         QbRZm4h8OiraEz6A9xiZG8o5tsg36jOpNz26xtMOqeNUsYdcH7ADMpitm8wjXvgiKuBC
         sgRxeaQv7gLU1h4D7pyR6aZNigE1lM+FxDbneSsYZO0K/NarsYR9srOuaLXH+zHQlOf7
         EhmuEJGjfrjyTmbXMvI29tiTR2+bW0MIFgz59QTGnGrmxtGOIAmWInae6jajDiQzYt33
         qyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423661; x=1795028461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WYFHQWZ/MsfvHC59O3vSeTxBC3BwdGpolCicla4nLjk=;
        b=Su0G+ULIRB2XT4mjC3olnY2cX6ntluOTDt0KyrtMENjVeooDpAgtQoR3zxUg2sk6E/
         QQ7xZCNs2R6TFjRqVkW64QP7zCKgGL6wYsjThT2Lpt2YPbyvTbVelv/iDBnUM7YG8VoU
         vn9zvLXKhGMCp/UXwTgM77g4de+H0/HLrXmBLh8rtuMkWRRJAF31s2MNJpJL1/e0SUd6
         ylpZd29AVZbsXv9MXmFa1eFZXQGR4D6j/NbbPRoDGD56aHsIQSs5Jz9adw6V9uK5gMlz
         s2FotpnQLJzqHb0ttDgK25ytopUdwABEbBQpdR/wxCniTHiC01RedMqpXqpAsApV4EYk
         8/wA==
X-Forwarded-Encrypted: i=1; AL+hErG3rnvtFMjQsqY8WV/IrFbcTTUvrgDbvav790GR4Kqx0QyztzagTrVLfmy5eEVVvkQghmqMhEjqjj/5CA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/EvjSQ2JWyER8GxqkvwsI1gN+9Z4aiu0X91jIcvEASmUE17kRl
	Z05cNTQkcgFFIWjTUWB1F3H6fFqciZpBMW3nj/8X959puTjgmEk1pezUwTxUkD7dqgs=
X-Gm-Gg: AYBFou0LrDzsHx9e17Dn29wZvCoo55wUkAJD5d2O8RNANSx4FnS8Q6W+S2qwjMZzzOG
	Kwgg+UDrwiypNGtsfX2T2sGb+CJRWJgz5BG814+TD1IKOxFsILniiPhYjHs5tCm3Uuf3/Ai6Bku
	ctSuUmdUruyrz333QI6uXbCpngncQDk9nMelfTjhTlBd2stHtOyR9Y/i9mJs1UF5RC3V6iIHtyf
	PJ6GEPNPJjtkSkor/5gChRmqFc34PGg1z+frMZoDbh7Y0cpTY5fgSIjGsqtP5lOItv1PIudXx+W
	H1UAk1nohVc2guLq9N6uzbM4DFuzW7/BPPSCYLuR7mOIy/YWWKNHHfHc5ufcJ8LYdMEJtOHMHis
	5oS+duMyeFfNk7mTrFh3vfIIXnNdNIyVe67rr1UG9/TRL/qNeI8T8Mn9KySRk9BvUPqEfof1hx2
	I97ffs+O7+PStGq0VJ82OuVuRjbFHM4p4RH1pE1TrvjpyYQfKKvp/ETTOs1vMpa1LBRqmHxXUwB
	XJiAbETx8onEYwh+4kF+kmBOnZaXhWp+q7NDPZJjXwgkEV/VW8NkRN6OSPWWO0NROIF6/pbcKLw
	zGpliEwiJm+4mL6S1QTx4QNvn+I5VRkaaIONGwFpvltr01g7+a6FKZAeruvvZhftrrEsloyGrQP
	I7VHM1gwxkeJxdNyNYaoWBh+c6SGYAdtoWJjgPBnrODxTmoo=
X-Received: by 2002:a05:690c:1d:b0:8b0:9e7c:7b11 with SMTP id 00721157ae682-8b3bb274adbmr2738117b3.32.1794423661002;
        Wed, 11 Nov 2026 11:01:01 -0800 (PST)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a2354sm5209197d50.6.2026.11.11.11.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:01:00 -0800 (PST)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	Aurelien Jarno <aurelien@aurel32.net>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	daichengrong <daichengrong@iscas.ac.cn>,
	Guobin Zhang <guobin.zhang@intel.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Deepak Gupta <debug@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v7 2/6] riscv: introduce riscv_v_ucontext_save() for signal and ptrace
Date: Wed, 11 Nov 2026 12:43:24 -0600
Message-ID: <20261111184359.1239821-3-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111184359.1239821-1-tchiu@tenstorrent.com>
References: <20261111184359.1239821-1-tchiu@tenstorrent.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_110103_024677_CDE2407C 
X-CRM114-Status: GOOD (  14.22  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a centralized user context saving function for the next patch. As we
are preparing for the optimization that skip saving on VS==INITIAL, user
context saving in ptrace and signal both need to account for such case,
and they are handled in a similar way.

This is a preparatory patch, the next patch folds in the actual handling
for exporting the user context when VS is at INITIAL state.

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v7:
 - new patch since v7 (splited out from v6 to maintain git bisectability)
---
 arch/riscv/include/asm/vector.h |  2 ++
 arch/riscv/kernel/ptrace.c      |  6 +-----
 arch/riscv/kernel/signal.c      |  4 +---
 arch/riscv/kernel/vector.c      | 12 ++++++++++++
 4 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 8c88a2258e61..7cd20f661596 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -52,6 +52,7 @@ void riscv_v_thread_free(struct task_struct *tsk);
 void __init riscv_v_setup_ctx_cache(void);
 void riscv_v_thread_alloc(struct task_struct *tsk);
 void __init update_regset_vector_info(unsigned long size);
+void riscv_v_ucontext_save(struct task_struct *tsk);
 
 static inline u32 riscv_v_flags(void)
 {
@@ -434,6 +435,7 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define riscv_v_thread_alloc(tsk)		do {} while (0)
 #define get_cpu_vector_context()		do {} while (0)
 #define put_cpu_vector_context()		do {} while (0)
+#define riscv_v_ucontext_save(tsk)		do {} while (0)
 #define riscv_v_vstate_set_restore(task, regs)	do {} while (0)
 
 #endif /* CONFIG_RISCV_ISA_V */
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index a0055743d3ba..88442ac4f6ae 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -109,11 +109,7 @@ static int riscv_vr_get(struct task_struct *target,
 	 * Ensure the vector registers have been saved to the memory before
 	 * copying them to membuf.
 	 */
-	if (target == current) {
-		get_cpu_vector_context();
-		riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
-		put_cpu_vector_context();
-	}
+	riscv_v_ucontext_save(target);
 
 	ptrace_vstate.vstart = vstate->vstart;
 	ptrace_vstate.vl = vstate->vl;
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 6f6f3315bc09..50c77bcf2b09 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -89,9 +89,7 @@ static long save_v_state(struct pt_regs *regs, void __user *sc_vec)
 	/* datap is designed to be 16 byte aligned for better performance */
 	WARN_ON(!IS_ALIGNED((unsigned long)datap, 16));
 
-	get_cpu_vector_context();
-	riscv_v_vstate_save(&current->thread.vstate, regs);
-	put_cpu_vector_context();
+	riscv_v_ucontext_save(current);
 
 	/* Copy everything of vstate but datap. */
 	err = __copy_to_user(&state->v_state, &current->thread.vstate,
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index b112166d51e9..924baa71af7e 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -29,6 +29,18 @@ static struct kmem_cache *riscv_v_kernel_cachep;
 unsigned long riscv_v_vsize __read_mostly;
 EXPORT_SYMBOL_GPL(riscv_v_vsize);
 
+void riscv_v_ucontext_save(struct task_struct *tsk)
+{
+	struct __riscv_v_ext_state *vstate = &tsk->thread.vstate;
+	struct pt_regs *regs = task_pt_regs(tsk);
+
+	if (tsk == current) {
+		get_cpu_vector_context();
+		riscv_v_vstate_save(vstate, regs);
+		put_cpu_vector_context();
+	}
+}
+
 int riscv_v_setup_vsize(void)
 {
 	unsigned long this_vsize;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
