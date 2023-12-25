Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD6BC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Dec 2023 04:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DfxlcjkT9BOp7Jrp8j4FiMYhcwWhjUMRVy6/8uBxbYs=; b=kaRSwSM1+tR/+E
	8tygqLd9dzbhYh+o/B2Kr9PRbnV7NdsUeYGyEBY0RKtQNM2Kbe+rsmhKBwJ+FL6MiECtJfJ4UgI4/
	fHNfO9haVsH/Bd1I51EgFUJ7lZ7ZPLcQYWRb144mshPKPLGkAnGeKW4JolK9rYRWayeT8+BiUnkMp
	Rmln14Y8HtK53I4z06hkWd7vffGMSRyfmbL9bM7WJfZbga+rq2GcBjCoGwjPmVOOiHWlNW6O3mgu+
	cRQWjU1j7TVWbvkPavuUgPLjJMVLyYrSU23C0IOX2rBRpSvQ/rpRbcwgNGJr9HtTjcWxLvhe5GPpK
	R6O5E7YF7UHImaxy3qYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHcAs-00AB52-1A;
	Mon, 25 Dec 2023 04:02:42 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHcAp-00AB4h-04
	for linux-riscv@lists.infradead.org;
	Mon, 25 Dec 2023 04:02:40 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-67ff241c2bcso6065496d6.1
        for <linux-riscv@lists.infradead.org>; Sun, 24 Dec 2023 20:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1703476957; x=1704081757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vgkto8kByXW7VWkGHNSr7+7oLApL/4XLRHDEPzxTHb4=;
        b=NuRThhSUx/Rty/0Nk6Yu/sHohFT1XZdBV6QRs3n0f2Dyzsrc32HnKJRTgkE9D7GOZp
         knTPhMvtHAwVWgA3NjeLjSD56oCnTlJTPY/4V4cqwsA+4nuKLZO4L6QTa1iMJstojbnU
         XrCAeesbNDIu/2/pasGQ2uS/xTpV1u6TfsuzuYlybwJ9WIj9IMmmtUhoCOVnrjDz20aH
         fdmX8mwocvsS0HjGs7DUelwhKnB2Rb1NMboZUR7ou1jNpv7VxivAHeub2JAOOYffN9cI
         X5vlpSUxOrr4KllVxRYUAECxAbHuFISwB7cnx4/S/15SV0aPNfVe8zzG+SIMsp6mZ4yv
         nWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703476957; x=1704081757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vgkto8kByXW7VWkGHNSr7+7oLApL/4XLRHDEPzxTHb4=;
        b=W4ltitRxf+2E+NTdbfFkWF8puPm/cHudFiMoaPlTVdahW69/dxje3lHh8iNFuhiRMh
         pjrIMAlYL78s4mhrrpCJW8UevwFAOQmEbq+GJNGgGU2/FvIcbxNsjJjX2pCTTvV63hdk
         bNOMzb/BLpcPoyWuPe8fm6oDg4qm/kglGXkz2s1OkQdot/In2n+g4THW/ACecOZFtCJN
         ejBuBCjq/Ja9wEfiv4Vyo2cK7Px/ytWaKi4ej7gUb29xyx27LUvl8dvZodE5/NFGqYYA
         MRjjym9pAGv1sw4MPuG+bkD9PPdu8M5pRzuv44XOjfcfAfFWgyOE3h04dzhzZfe68Nmq
         HqpA==
X-Gm-Message-State: AOJu0YyV6GT/AoR3GzQyoWDsEgHDR5ayzY5JOYRSTY9AJGtQ+zkwA4jB
	D51Cmdt4CoopAKrUZTe3vktyoKPYn73/4w==
X-Google-Smtp-Source: AGHT+IGUoqgi8xxLb4ll1iCLSlEbo9ksVFmClgkdbzXzaaRMMvSDubNHYo1fu4YTtah1F6rc1ZwH+Q==
X-Received: by 2002:ad4:574f:0:b0:67f:2f25:ae77 with SMTP id q15-20020ad4574f000000b0067f2f25ae77mr8848581qvx.14.1703476956942;
        Sun, 24 Dec 2023 20:02:36 -0800 (PST)
Received: from sjc-lab-t7002.local.tenstorrent.com ([38.142.247.251])
        by smtp.gmail.com with ESMTPSA id dr4-20020a05621408e400b0067f8953f78fsm3075883qvb.41.2023.12.24.20.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 20:02:36 -0800 (PST)
From: Anton Blanchard <antonb@tenstorrent.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anton Blanchard <antonb@tenstorrent.com>
Subject: [PATCH] riscv: Improve exception and system call latency
Date: Sun, 24 Dec 2023 20:00:18 -0800
Message-Id: <20231225040018.1660554-1-antonb@tenstorrent.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231224_200239_087779_2F5E507F 
X-CRM114-Status: GOOD (  14.04  )
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

Many CPUs implement return address branch prediction as a stack. The
RISCV architecture refers to this as a return address stack (RAS). If
this gets corrupted then the CPU will mispredict at least one but
potentally many function returns.

There are two issues with the current RISCV exception code:

- We are using the alternate link stack (x5/t0) for the indirect branch
  which makes the hardware think this is a function return. This will
  corrupt the RAS.

- We modify the return address of handle_exception to point to
  ret_from_exception. This will also corrupt the RAS.

Testing the null system call latency before and after the patch:

Visionfive2 (StarFive JH7110 / U74)
baseline: 189.87 ns
patched:  176.76 ns

Lichee pi 4a (T-Head TH1520 / C910)
baseline: 666.58 ns
patched:  636.90 ns

Just over 7% on the U74 and just over 4% on the C910.

Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
---

This introduces some complexity in the stackframe walk code. PowerPC
resolves the multiple exception exit paths issue by placing a value into
the exception stack frame (basically the word "REGS") that the stack frame
code can look for. Perhaps something to look at.

 arch/riscv/kernel/entry.S      | 21 ++++++++++++++-------
 arch/riscv/kernel/stacktrace.c | 14 +++++++++++++-
 2 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 54ca4564a926..89af35edbf6c 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -84,7 +84,6 @@ SYM_CODE_START(handle_exception)
 	scs_load_current_if_task_changed s5
 
 	move a0, sp /* pt_regs */
-	la ra, ret_from_exception
 
 	/*
 	 * MSB of cause differentiates between
@@ -93,7 +92,10 @@ SYM_CODE_START(handle_exception)
 	bge s4, zero, 1f
 
 	/* Handle interrupts */
-	tail do_irq
+	call do_irq
+.globl ret_from_irq_exception
+ret_from_irq_exception:
+	j ret_from_exception
 1:
 	/* Handle other exceptions */
 	slli t0, s4, RISCV_LGPTR
@@ -101,11 +103,16 @@ SYM_CODE_START(handle_exception)
 	la t2, excp_vect_table_end
 	add t0, t1, t0
 	/* Check if exception code lies within bounds */
-	bgeu t0, t2, 1f
-	REG_L t0, 0(t0)
-	jr t0
-1:
-	tail do_trap_unknown
+	bgeu t0, t2, 3f
+	REG_L t1, 0(t0)
+2:	jalr ra,t1
+.globl ret_from_other_exception
+ret_from_other_exception:
+	j ret_from_exception
+3:
+
+	la t1, do_trap_unknown
+	j 2b
 SYM_CODE_END(handle_exception)
 
 /*
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 64a9c093aef9..b9cd131bbc4c 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -17,6 +17,18 @@
 #ifdef CONFIG_FRAME_POINTER
 
 extern asmlinkage void ret_from_exception(void);
+extern asmlinkage void ret_from_irq_exception(void);
+extern asmlinkage void ret_from_other_exception(void);
+
+static inline bool is_exception_frame(unsigned long pc)
+{
+	if ((pc == (unsigned long)ret_from_exception) ||
+	    (pc == (unsigned long)ret_from_irq_exception) ||
+	    (pc == (unsigned long)ret_from_other_exception))
+		return true;
+
+	return false;
+}
 
 void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 			     bool (*fn)(void *, unsigned long), void *arg)
@@ -62,7 +74,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 			fp = frame->fp;
 			pc = ftrace_graph_ret_addr(current, NULL, frame->ra,
 						   &frame->ra);
-			if (pc == (unsigned long)ret_from_exception) {
+			if (is_exception_frame(pc)) {
 				if (unlikely(!__kernel_text_address(pc) || !fn(arg, pc)))
 					break;
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
