Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79D1C77B60
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Apr 2023 22:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=YIURd4ydt5dUXaNX6hmSw3EtXx2w1N14HTTyiT+9IZo=; b=PSB
	LPzwz9JCLUDL+ojYfLCQ/LPRRZr7wCvsspldFNtwzFarjwa6cdJKzAuRgI26GbWMq6KaGIqzxi+pv
	gh75qCufDjSPziecuV4t7D8rZehoeh0GbSrf6+gHwHlgIfPaPEA/w2FvPZyIte6JfOi57lfps5iMJ
	fPnNQLebe+aLRgYo7BrRrYGts+OWxNOFK1VCRoNYPAAiMEih22BYGGUj8DWFlWCI3f60XfZkElwx5
	b2fA8p5TK1eJKig8erVQBjcrISRg8eJSfbrBht6IEFlB2/EOMpvBjQ80EBTOf2jmvgyVQ6qAbkvob
	XQ2rVYGW7U5uFJb28gNjLNGwFO6cxrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqiFq-00EqS7-25;
	Sun, 23 Apr 2023 22:32:22 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqiFo-00EqRd-0C
	for linux-riscv@lists.infradead.org;
	Sun, 23 Apr 2023 22:32:21 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-63b62529864so4674584b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 23 Apr 2023 15:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682289138; x=1684881138;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JOxROQal6cA2b9nVh8lVusUL2vjzy13mIsW+Lwv9jHs=;
        b=ZI+CBW2XxeN2IpKi/yqKtcV5tOtRGnHPi3UzIKorT7JYnj/I+50lqJj6RJvBPhth77
         XP7iLxnGT3sh6X2DkB0DtRiBC5hbiGp0FeZBzXyGmU8vVMqk/8LvAGY/5o9cu9YNPTxz
         ajp5IK4mjalS57f0R6oNLx2D9jO0K9UWcbowcFTUleKSAugdsK8AX+WD1kA8H1ASJsJ2
         savb90VOmo0RFjTjImLZFmZ5D1ksMVzfCfPhGGYAldx9mvtgpGBZ+CWEmUOesfb7puTb
         +B5wc0kLNGJZnMOjXX4Hli6vECUujnqGrq4cuZ2PQFnvL2nb3/MnBR7Ygn3/IE3MYsU2
         RV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682289138; x=1684881138;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JOxROQal6cA2b9nVh8lVusUL2vjzy13mIsW+Lwv9jHs=;
        b=dJzoxiqaZtoWRG94jha/Z56tff0LH77/75YGLvU9wj4OuD3l8jKCnygLHUrF0Ci8Gl
         WjA9dyzR9K4nNHfUqaelWsYRR2T8L5N61lmfo0ycBPh/7iRqscoOP34RKiIhpaew5keX
         MMdHThlQPKCgIQE6Juw18ETaV9e5YBASCWDcNOT3GMfjQGwnoY0ucXIZGo+16kTMYGu3
         x5Z/USUH3n8Sl7labvSszVTEgOnpCHyHj47XVmUXmSxZiuIf3N6pMA/zRxPaPlAuE16l
         pdhq+x3ymRXFfNlbMWlDn7d/Yld0YTvNFVjG8ytS0MsDqsfoklxsdLF6EdxF5P2eda//
         JP7w==
X-Gm-Message-State: AAQBX9dn4meIYh2wWJZH4/RKMKLhwaHJznV6JOCJZF8Axg1dLMFQvX5A
	g3FtU6L9FYcWrfMiC/Y5lCDW1MkRsSx7
X-Google-Smtp-Source: AKy350bQrjBRDCACPQikFKADUWF2WW/fppn+Q+GDorzkU2RbyvCdQq8amt1ztzMepbCggXkGjlV4ll+h+03M
X-Received: from meowing-l.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3eba])
 (user=maskray job=sendgmr) by 2002:a05:6a00:1a53:b0:63d:46f0:2370 with SMTP
 id h19-20020a056a001a5300b0063d46f02370mr4945410pfv.6.1682289138662; Sun, 23
 Apr 2023 15:32:18 -0700 (PDT)
Date: Sun, 23 Apr 2023 22:32:10 +0000
Mime-Version: 1.0
Message-ID: <20230423223210.126948-1-maskray@google.com>
Subject: [PATCH] riscv: replace deprecated scall with ecall
From: Fangrui Song <maskray@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Fangrui Song <maskray@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_153220_122265_29F4A513 
X-CRM114-Status: UNSURE (   8.81  )
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

scall is a deprecated alias for ecall. ecall is used in several places,
so there is no assembler compatibility concern.

Signed-off-by: Fangrui Song <maskray@google.com>
---
 arch/riscv/kernel/entry.S             | 4 ++--
 arch/riscv/kernel/vdso/rt_sigreturn.S | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 99d38fdf8b18..2f51935612d1 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -191,7 +191,7 @@ handle_syscall:
 	REG_S a0, PT_ORIG_A0(sp)
 	/*
 	 * Advance SEPC to avoid executing the original
-	 * scall instruction on sret
+	 * ecall instruction on sret
 	 */
 	addi s2, s2, 0x4
 	REG_S s2, PT_EPC(sp)
@@ -603,6 +603,6 @@ END(excp_vect_table)
 #ifndef CONFIG_MMU
 ENTRY(__user_rt_sigreturn)
 	li a7, __NR_rt_sigreturn
-	scall
+	ecall
 END(__user_rt_sigreturn)
 #endif
diff --git a/arch/riscv/kernel/vdso/rt_sigreturn.S b/arch/riscv/kernel/vdso/rt_sigreturn.S
index 0573705eac76..10438c7c626a 100644
--- a/arch/riscv/kernel/vdso/rt_sigreturn.S
+++ b/arch/riscv/kernel/vdso/rt_sigreturn.S
@@ -11,6 +11,6 @@ ENTRY(__vdso_rt_sigreturn)
 	.cfi_startproc
 	.cfi_signal_frame
 	li a7, __NR_rt_sigreturn
-	scall
+	ecall
 	.cfi_endproc
 ENDPROC(__vdso_rt_sigreturn)
-- 
2.40.0.634.g4ca3ef3211-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
