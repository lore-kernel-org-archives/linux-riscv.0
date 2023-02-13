Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C71C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 06:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+lT0KHUrvYU/sCDU0DAsDoBm3meKPSgnTAAtDWXSiU=; b=GrbtGp2vqtFwrl
	g7Pav4H+SdjFtIa3AOM9qTDs2tCoC2E4nZ2IF1aNgKz3/7PBKdcj/ZdhQjt1+1OQvcHcR+Uid33hv
	waBiZnhX9arVlKg+Lks4IEYlRjGv+wWrVgmxm5T3/efd3/mZd66QLgjEnPNLNziZFvPW8QSV1SH1A
	U79zZa+g6h1HKTD0MHHP4dz6022NRqnMt2BF/QGPdsSWNJBZDeTFzhKFxB6Ns03zghb5PbcPrI1vP
	/KptTI+RRmMOGVKVXyNAoWMhlTUNPgfnH34ORMTeKVK/3IipIavgZ5BiJdoU7IiIkcjOGG1EZ1/MD
	Hp7hpVxVAzABoXwDZJLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRRvP-00DHyy-8a; Mon, 13 Feb 2023 06:02:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRRvN-00DHy7-GK
	for linux-riscv@bombadil.infradead.org; Mon, 13 Feb 2023 06:02:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Zsprz/VkYP6JnZQvaX4OtVPneKai8SEDj1BTi+BhY/U=; b=L288A+gHpkeUWAMrh7om4kX6R6
	kEyjNsJkw/FvyUT9MIX4/JaneXW3y8OqcYgm535w3NSHZMe9fJABSCmypuU4M0QqGVoG7svDLSUrS
	sQSsklTXjaLAUN4Gi8enhcBZN3mvStLvv475sp/onlIWF6gMN74uyVFtcmJF1LXy8k8GZtHvXz1oD
	JtzF2T5cXX1XG4Ij5jzumy6o+LCcaQNN+pObOmmUMBMvsO19pmMcZKykEIKoIAst+lDk48bn32Nj7
	qgY5cD3By/PfhAl+bEEsobRqZhqepylfsBWjAnscMXlXki2BcaumVqybLHVEevcAd7uziMnXvvC5Z
	Ipyenl5g==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pRQqb-009BSY-2Z
	for linux-riscv@lists.infradead.org;
	Mon, 13 Feb 2023 04:53:53 +0000
Received: by mail-pl1-x633.google.com with SMTP id be8so12299695plb.7
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 20:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zsprz/VkYP6JnZQvaX4OtVPneKai8SEDj1BTi+BhY/U=;
        b=7eSn2qdyORPNxiUoyovTXFhpXsZHqi8gnCLRE8GgSFK5tj4/mM+NE2BEscg9ShWtpB
         PzxBxeovnUU8KeQiZs+IWnuGNyAcMW1KXbhp2VQESntSd2LWuz+pzNCUJWIPxB0JU5Ab
         EesW3hY9NeyIHHfTNOmY/6BwGaMaUJiMo3GIx05W9NZJ0qvDJ0bluOBnu//KNpG2uyou
         4SOQKrmR4F5ng8nIZLAVUY7neQXbZCIE2lfTveTDHH94wb4oRM14reOmS/4svizRqEPL
         rwqB8M6hauOSNhA0VumODFAY0bMXd/4v8bTFTh5K1IeqLZXyl0c6K01GuPfSNRRgUsul
         zsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zsprz/VkYP6JnZQvaX4OtVPneKai8SEDj1BTi+BhY/U=;
        b=gvx208lm3wM0tMrJmoXc5N+Xka42bbFevrGmJTAhHqYjwz6EUFeECzcoc/y1OLuFph
         5eGY8r73NK2VxVS/ux31tCV8WGsb/FwRKsNSIyD15qASNpedQ2ITCgitmUMLdnn/wVtK
         RnlP6/jXyv0xYvgVF4230LdAdZop//rPAgSdamEV84l7b4jvH+4FR5H2K5njisrZmvO4
         meJWRqWWEn7vwfCDaRos8IWv0hw08KqbowBcpdMLS9IkPF7udzeqSuZq2qkSTz2+Nn91
         zE4isdD+ilPO4dqbu2plMZ/xE9erYryNVhKNT8rxuv/BHfNGPZdkEa34Kdc5lSHqD8Y/
         iU1g==
X-Gm-Message-State: AO0yUKVB54fPNgD6RO10UZBy6FL/TJAdGQGB49OVjnBH8RYt7GbI7se9
	Zi1SryCxwl/28TH2kKzxqlBp9A==
X-Google-Smtp-Source: AK7set/p0rkBQR17h7qM1KcTLnHTByuWpmwwvmpl6P367bUJpgMQejcCNRaERuAYYCD3D7dwaqjSJg==
X-Received: by 2002:a17:902:e545:b0:199:60:b9c8 with SMTP id n5-20020a170902e54500b001990060b9c8mr29757848plf.45.1676264068264;
        Sun, 12 Feb 2023 20:54:28 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902784500b00189e7cb8b89sm7078303pln.127.2023.02.12.20.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 20:54:27 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v1 RFC Zisslpcfi 18/20] riscv signal: Save and restore of shadow stack for signal
Date: Sun, 12 Feb 2023 20:53:47 -0800
Message-Id: <20230213045351.3945824-19-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213045351.3945824-1-debug@rivosinc.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_045350_965526_D3498D12 
X-CRM114-Status: GOOD (  12.28  )
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

Save shadow stack pointer in ucontext structure while delivering signal.
Restore shadow stack pointer from ucontext on sigreturn.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/signal.c | 45 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index bfb2afa4135f..b963bbce5879 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -103,6 +103,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	struct pt_regs *regs = current_pt_regs();
 	struct rt_sigframe __user *frame;
 	struct task_struct *task;
+	struct thread_info *info = NULL;
 	sigset_t set;
 
 	/* Always make any pending restarted system calls return -EINTR */
@@ -124,6 +125,27 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	if (restore_altstack(&frame->uc.uc_stack))
 		goto badframe;
 
+#if defined(CONFIG_USER_SHADOW_STACK)
+	/*
+	 * TODO: Restore shadow stack as a form of token stored on shadow stack itself as a safe
+	 * way to restore.
+	 * A token on shadow gives following properties
+	 *	- Safe save and restore for shadow stack switching. Any save of shadow stack
+	 *	  must have had saved a token on shadow stack. Similarly any restore of shadow
+	 *	  stack must check the token before restore. Since writing to shadow stack with
+	 *	  address of shadow stack itself is not easily allowed. A restore without a save
+	 *	  is quite difficult for an attacker to perform.
+	 *	- A natural break. A token in shadow stack provides a natural break in shadow stack
+	 *	  So a single linear range can be bucketed into different shadow stack segments.
+	 *	  Any sspop; sscheckra will detect the condition and fault to kernel.
+	 */
+	info = current_thread_info();
+	if (info->user_cfi_state.ubcfi_en &&
+	    __copy_from_user(&info->user_cfi_state.user_shdw_stk, &frame->uc.uc_ss_ptr,
+				sizeof(unsigned long)))
+		goto badframe;
+#endif
+
 	regs->cause = -1UL;
 
 	return regs->a0;
@@ -180,6 +202,7 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 	struct pt_regs *regs)
 {
 	struct rt_sigframe __user *frame;
+	struct thread_info *info = NULL;
 	long err = 0;
 
 	frame = get_sigframe(ksig, regs, sizeof(*frame));
@@ -191,6 +214,23 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 	/* Create the ucontext. */
 	err |= __put_user(0, &frame->uc.uc_flags);
 	err |= __put_user(NULL, &frame->uc.uc_link);
+#if defined(CONFIG_USER_SHADOW_STACK)
+	/*
+	 * TODO: Save a pointer to shadow stack itself on shadow stack as a form of token.
+	 * A token on shadow gives following properties
+	 *	- Safe save and restore for shadow stack switching. Any save of shadow stack
+	 *	  must have had saved a token on shadow stack. Similarly any restore of shadow
+	 *	  stack must check the token before restore. Since writing to shadow stack with
+	 *	  address of shadow stack itself is not easily allowed. A restore without a save
+	 *	  is quite difficult for an attacker to perform.
+	 *	- A natural break. A token in shadow stack provides a natural break in shadow stack
+	 *	  So a single linear range can be bucketed into different shadow stack segments. Any
+	 *	  sspop; sscheckra will detect the condition and fault to kernel.
+	 */
+	info = current_thread_info();
+	if (info->user_cfi_state.ubcfi_en)
+		err |= __put_user(info->user_cfi_state.user_shdw_stk, &frame->uc.uc_ss_ptr);
+#endif
 	err |= __save_altstack(&frame->uc.uc_stack, regs->sp);
 	err |= setup_sigcontext(frame, regs);
 	err |= __copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set));
@@ -201,6 +241,11 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 #ifdef CONFIG_MMU
 	regs->ra = (unsigned long)VDSO_SYMBOL(
 		current->mm->context.vdso, rt_sigreturn);
+#if defined(CONFIG_USER_SHADOW_STACK)
+	/* if bcfi is enabled x1 (ra) and x5 (t0) must match */
+	if (info->user_cfi_state.ubcfi_en)
+		regs->t0 = regs->ra;
+#endif
 #else
 	/*
 	 * For the nommu case we don't have a VDSO.  Instead we push two
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
