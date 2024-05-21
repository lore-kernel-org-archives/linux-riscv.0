Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DD6C25B75
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 19:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g42loK8RapsxvZynZ8liYFlqMWYlBrWiu4OTnifxMaY=; b=4yf6JpmG1RA04+
	yGZC8tn4kncA1c+l8n1zMeb1dC/8ChRh/QbC+XuReiMK0o2kX3eZTCLDW9zSrEimcoWW2UwOSsE9M
	QLEzFO6hTiRDcYU/VNRNg+m1sT8xv9OMMQaabcwIX0qkQKxgbuKVeJA6C0rPSYA4aYK4WwpyTKbyJ
	KJDeZcJgu9DHc3PjAQZSQq2J8RXCufkY3lZVINufhvrCDY1AH7xzCn7yGV/Thb1w/5WmdN8K6VsOJ
	cTuWDiUXULrTMpJUqroETYhuJIxlD3T1YkcsBKmOBsftZ8wVq2Ipqp4vJmYSlLhu/BtUvEvk238Mj
	4A51uhOmCwTAhkssJKAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Uze-00000000sxV-2dkc;
	Tue, 21 May 2024 19:17:50 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Uzb-00000000swz-0pG3
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 19:17:49 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-7e1b936987fso269220139f.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 12:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716319058; x=1716923858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w/RCXgufMdDOcZSOZfYQF6MjnQ11qbUv6flAGmbTaK0=;
        b=ELJly7peFngnAIRzbmY5tDUgqEz3tiI4+4NZXtfKksJLKl5bbZgkGn4iVpqmzMWLFM
         uMh9yVysdbydMV6F6nZZ9zKvjjwOOdWMTEcUlIpdJxWfNRxMpeLLy5C1a8PXf6a56IB3
         udvTh7XH+AVspz0TVf77VFevPpIBiAqPGQEt7B8aWT9tFBdU2OorV2lxWykvuJWoSTSd
         n8zglWF6lovD/jLxGC/cWMLKTRlA1a+SWnhcrgpOWyUpkdTpEG+VViuCPn5XRaHHmMOL
         YqSO6fy2x47NQUdbLSpvoKg2VG9Djd6R/MffUWrD52CIdx/aumSz4YU15Rvj4YGch03d
         +Ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716319058; x=1716923858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w/RCXgufMdDOcZSOZfYQF6MjnQ11qbUv6flAGmbTaK0=;
        b=W0GX+eCGkDQgGWWme2p3WZCSpdidye4+WUlWCNzRPSbQ9y3Q68xJ6+WC/Wt3dVWDr9
         tpoK/SVwMFb2lHO8YgcGn7uUKixxVXbXgf/tHsoRUPKlOvFI7TOMR8DSXx1VdKpGuHOZ
         u2l2MgeEL9/kHkIg5yDdGktitXE6/kjXeaWTyCoc/fcRWS8dvaAYCuRUAPt/iJz12Z8Q
         15VBKtIXx69arcgKVjd5TPg4344vKTV9erkdmbV00x5xD+qs4uxXgXhW/RAdZikpaypu
         AMJpmY/3lj4acmAy+sW4z60w8IPyEW38Ma6RBAikENbiKaHecLsHItZQAcrKSteiRRDH
         3RbA==
X-Gm-Message-State: AOJu0Yxtk9YEwwgIOTfq5VSzBjtnF6276brBmbpmn8TE1x+m4abtEE3U
	10SCX3VC1gLWPF3LN5GeweippoTCS4Il/hjLdFj5weJkSmB/TT8Y
X-Google-Smtp-Source: AGHT+IEGitA6KuMvsLbj1oJLd4kwmUKw8KsKCN3tl6tptVZnx4hhmLBWUy6HSOsWNtJGPuW5LU/ENw==
X-Received: by 2002:a5d:9489:0:b0:7e1:c607:ec47 with SMTP id ca18e2360f4ac-7e1c607ed07mr3590013739f.17.1716319057714;
        Tue, 21 May 2024 12:17:37 -0700 (PDT)
Received: from localhost.localdomain (5cfc9148.dynamic.mv.ru. [92.252.145.72])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-7e20378a041sm403777039f.26.2024.05.21.12.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 12:17:37 -0700 (PDT)
From: Matthew Bystrin <dev.mbstr@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org
Subject: [PATCH v3] riscv: stacktrace: fixed walk_stackframe()
Date: Tue, 21 May 2024 22:13:13 +0300
Message-ID: <20240521191727.62012-1-dev.mbstr@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_121747_333644_02702B72 
X-CRM114-Status: GOOD (  16.17  )
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

If the load access fault occures in a leaf function (with
CONFIG_FRAME_POINTER=y), when wrong stack trace will be displayed:

[<ffffffff804853c2>] regmap_mmio_read32le+0xe/0x1c
---[ end trace 0000000000000000 ]---

Registers dump:
    ra     0xffffffff80485758 <regmap_mmio_read+36>
    sp     0xffffffc80200b9a0
    fp     0xffffffc80200b9b0
    pc     0xffffffff804853ba <regmap_mmio_read32le+6>

Stack dump:
    0xffffffc80200b9a0:  0xffffffc80200b9e0  0xffffffc80200b9e0
    0xffffffc80200b9b0:  0xffffffff8116d7e8  0x0000000000000100
    0xffffffc80200b9c0:  0xffffffd8055b9400  0xffffffd8055b9400
    0xffffffc80200b9d0:  0xffffffc80200b9f0  0xffffffff8047c526
    0xffffffc80200b9e0:  0xffffffc80200ba30  0xffffffff8047fe9a

The assembler dump of the function preambula:
    add     sp,sp,-16
    sd      s0,8(sp)
    add     s0,sp,16

In the fist stack frame, where ra is not stored on the stack we can
observe:

        0(sp)                  8(sp)
        .---------------------------------------------.
    sp->|       frame->fp      | frame->ra (saved fp) |
        |---------------------------------------------|
    fp->|         ....         |         ....         |
        |---------------------------------------------|
        |                      |                      |

and in the code check is performed:
	if (regs && (regs->epc == pc) && (frame->fp & 0x7))

I see no reason to check frame->fp value at all, because it is can be
uninitialized value on the stack. A better way is to check frame->ra to
be an address on the stack. After the stacktrace shows as expect:

[<ffffffff804853c2>] regmap_mmio_read32le+0xe/0x1c
[<ffffffff80485758>] regmap_mmio_read+0x24/0x52
[<ffffffff8047c526>] _regmap_bus_reg_read+0x1a/0x22
[<ffffffff8047fe9a>] _regmap_read+0x5c/0xea
[<ffffffff80480376>] _regmap_update_bits+0x76/0xc0
...
---[ end trace 0000000000000000 ]---
As pointed by Samuel Holland it is incorrect to remove check of the stackframe
entirely.

Changes since v2 [2]:
 - Add accidentally forgotten curly brace

Changes since v1 [1]:
 - Instead of just dropping frame->fp check, replace it with validation of
   frame->ra, which should be a stack address.
 - Move frame pointer validation into the separate function.

[1] https://lore.kernel.org/linux-riscv/20240426072701.6463-1-dev.mbstr@gmail.com/
[2] https://lore.kernel.org/linux-riscv/20240521131314.48895-1-dev.mbstr@gmail.com/

Fixes: f766f77a74f5 ("riscv/stacktrace: Fix stack output without ra on the stack top")
Signed-off-by: Matthew Bystrin <dev.mbstr@gmail.com>
---
 arch/riscv/kernel/stacktrace.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 64a9c093aef9..528ec7cc9a62 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -18,6 +18,16 @@
 
 extern asmlinkage void ret_from_exception(void);
 
+static inline int fp_is_valid(unsigned long fp, unsigned long sp)
+{
+	unsigned long low, high;
+
+	low = sp + sizeof(struct stackframe);
+	high = ALIGN(sp, THREAD_SIZE);
+
+	return !(fp < low || fp > high || fp & 0x07);
+}
+
 void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 			     bool (*fn)(void *, unsigned long), void *arg)
 {
@@ -41,21 +51,19 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 	}
 
 	for (;;) {
-		unsigned long low, high;
 		struct stackframe *frame;
 
 		if (unlikely(!__kernel_text_address(pc) || (level++ >= 0 && !fn(arg, pc))))
 			break;
 
-		/* Validate frame pointer */
-		low = sp + sizeof(struct stackframe);
-		high = ALIGN(sp, THREAD_SIZE);
-		if (unlikely(fp < low || fp > high || fp & 0x7))
+		if (unlikely(!fp_is_valid(fp, sp)))
 			break;
+
 		/* Unwind stack frame */
 		frame = (struct stackframe *)fp - 1;
 		sp = fp;
-		if (regs && (regs->epc == pc) && (frame->fp & 0x7)) {
+		if (regs && (regs->epc == pc) && fp_is_valid(frame->ra, sp)) {
+			/* We hit function where ra is not saved on the stack */
 			fp = frame->ra;
 			pc = regs->ra;
 		} else {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
