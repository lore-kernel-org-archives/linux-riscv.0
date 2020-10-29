Return-Path: <SRS0=H9LG=EE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C533AC55179
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2020 16:21:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECC042076E
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2020 16:21:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pJkhm1FZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="U+BDJtwp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECC042076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YSiiSrAc0TetOTFIIODWQk4Kplc5/SH9TauW0Ns3sv0=; b=pJkhm1FZv8dumwLIafFliR4lRg
	2zdL7vAKrd5+cRKgrZ6PTtD4RPmo5qw/ntvJwZko09jhlHpRzJfCWIxn+pY2+bonOKDcQEKU1iMfj
	0q1UNt5Ks3djgLG94/f7fmxbNA8VX0xeKRdk3lqh5qkeWo5qTpl/K+GLiGj2lgY9JJriYsdpUdxT4
	v6m9+LKr2vyJUVMq21XmY+7+ylNoirdQbg0kcubkWNXrPE667YhKT33BUCrf4qINcn1FWPBZ1yIAa
	J2hZFawVREcwKHADpktJmw2uFBc4FGoWzkbV2moqQgsszaHpaOgwZl/vp+9VE4e4Hq0jCCEb2/vsz
	gW72mlIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYAfk-0002vN-QA; Thu, 29 Oct 2020 16:21:08 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYAf9-0002fi-Ou
 for linux-riscv@lists.infradead.org; Thu, 29 Oct 2020 16:20:35 +0000
Received: by mail-il1-x141.google.com with SMTP id k6so3647772ilq.2
 for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2020 09:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=JCMOTd+/9KlQN9DVLV1GOKkYV8ed2sYLLhUAQceIgbs=;
 b=U+BDJtwpvDM/yYIwOrgVNv7kq6V/fWLgqyd6kZ6OvMNNSLcKulACWX2RdwCPftwmqs
 u+a5JTyymeRehSq8MyRT2xkbSKN8zLEl8nxlzH2Mda6Z+P5ZIjxGxRgoE8L/r/xb9cwk
 uzxtAeE8NmzhVp6XKLf4F3cPW3i7Sp5xm0roUL4M7iJ2C7D5m0DSdgCHp1BWWQTDMaLC
 8zVF9ibXcYD/HCi2Rv+O/kWg5PWX0qSyiXQ0AenxlkCkqP7KEysQ2pTokH1klswb0BsA
 JtrnvonVUc2QHPRXOw3YSHob+Nu+fZjPJuEbc8EFdp/1ptl8AvXWmhjnbzY74JeUSNj9
 F+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=JCMOTd+/9KlQN9DVLV1GOKkYV8ed2sYLLhUAQceIgbs=;
 b=uQ6Din/ghRxHh9lKen/AoH0v12dy28TbSmwAkWJ1FtbC7M0js/M9Ay3cMqmTPu4CSG
 ZYsm6757kjp8Mqthb+KNs70lznUQ7JwPVQq0S1uyRdqz6lkQuqmqLh4QT3guf9Nbozde
 2rvCZiYjiyG3xv99ai5EcjYNhGD9JbfTYlFpz4TXTYlCNZwRQyrS5rhvQUWBJ/IPS4oX
 zGwYBeIm2mIxpfWMFEil3NgNd//JKK3w+duUs1HnaXNnf4BmBIWOhKY5M098Y0OyYekq
 8YXhqR+2ZtqmumOlnAI/xDxE1LDOslD4UWfEsiMxv/tSAqcj1SX9gYe3Vuy6QEcXjvI5
 /5PQ==
X-Gm-Message-State: AOAM531Y0qeYkpkqnWGvENz3AwsNMcadbCZSvWb9tqPaTHXrDujEtHaG
 l2DYxABKZf0HW0SCSvibwfInadUXX9Jbsw==
X-Google-Smtp-Source: ABdhPJz2naQVOIKrGaQjZtSJYZ9pw2eI1sfepzJW5Kf4GbzMizXY7KtpcnJbT/CWdSn+IzBYlBRixA==
X-Received: by 2002:a92:8545:: with SMTP id f66mr3814488ilh.206.1603988429362; 
 Thu, 29 Oct 2020 09:20:29 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
 by smtp.gmail.com with ESMTPSA id l65sm3139209ill.18.2020.10.29.09.20.28
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 09:20:28 -0700 (PDT)
To: linux-riscv@lists.infradead.org
From: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] riscv: add support for TIF_NOTIFY_SIGNAL
Message-ID: <71abc829-29df-06fb-a6d4-6e32b7042af8@kernel.dk>
Date: Thu, 29 Oct 2020 10:20:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_122032_035797_F9CECAC9 
X-CRM114-Status: GOOD (  17.16  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Wire up TIF_NOTIFY_SIGNAL handling for riscv.

Cc: linux-riscv@lists.infradead.org
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---

5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
for details:

https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/

As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
as that will enable a set of cleanups once all of them support it. I'm
happy carrying this patch if need be, or it can be funelled through the
arch tree. Let me know.

 arch/riscv/include/asm/thread_info.h | 5 ++++-
 arch/riscv/kernel/signal.c           | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index a390711129de..97bf5a1575d2 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -74,6 +74,7 @@ struct thread_info {
 #define TIF_SYSCALL_TRACEPOINT  6       /* syscall tracepoint instrumentation */
 #define TIF_SYSCALL_AUDIT	7	/* syscall auditing */
 #define TIF_SECCOMP		8	/* syscall secure computing */
+#define TIF_NOTIFY_SIGNAL	9	/* signal notifications exist */
 
 #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
@@ -82,9 +83,11 @@ struct thread_info {
 #define _TIF_SYSCALL_TRACEPOINT	(1 << TIF_SYSCALL_TRACEPOINT)
 #define _TIF_SYSCALL_AUDIT	(1 << TIF_SYSCALL_AUDIT)
 #define _TIF_SECCOMP		(1 << TIF_SECCOMP)
+#define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
 
 #define _TIF_WORK_MASK \
-	(_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NEED_RESCHED)
+	(_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NEED_RESCHED | \
+	 _TIF_NOTIFY_SIGNAL)
 
 #define _TIF_SYSCALL_WORK \
 	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_TRACEPOINT | _TIF_SYSCALL_AUDIT | \
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index bc6841867b51..469aef8ed922 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -310,7 +310,7 @@ asmlinkage __visible void do_notify_resume(struct pt_regs *regs,
 					   unsigned long thread_info_flags)
 {
 	/* Handle pending signal delivery */
-	if (thread_info_flags & _TIF_SIGPENDING)
+	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
 		do_signal(regs);
 
 	if (thread_info_flags & _TIF_NOTIFY_RESUME)
-- 
2.29.0

-- 
Jens Axboe


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
