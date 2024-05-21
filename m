Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73414C25B74
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 13:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CwuvDWr0/oK3te9KG5aI0YrsIAEfMw6T3oyLdHGTlWs=; b=ICLfHjGeOD0cyN
	Fs5irQuMWFV0iWyriGmG4uTK1WU/dOxA5Q9zrQUX6Cg4KI9NoKQ2jdLZNaDsdk7j3DH7GMXH7hSM8
	xRum/bK3zLMocZeTVm1NG0R5tlwK9sk2uqYF2giF+9IYzeyztiXr/Z2hK1BML00hxryCrRBeuSl4e
	fdDTRhHGWqw3nZsnXg3FD4CvSAziT5SGVhzx6BR0bqnUKjgCpyRt/TksM1SXYhnUBZCZTGSaayFxV
	CM86r2NyEFp41mwv2Xcld6p2HfMbYQadF62xa1l9+btZYIgDIdxNxluLOIiB2pQHSXet9jBS75ku8
	JxKCF/wketWleMN9Ot4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9PIz-0000000HZ5T-0FAF;
	Tue, 21 May 2024 13:13:25 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9PIv-0000000HZ4t-102x
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 13:13:22 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-52389c1308dso5010589e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 06:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716297198; x=1716901998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FsRxHVQA25+oFORFBVg+Bgn7uZw3Q2fauVYem0Fnb5w=;
        b=ewqMb/tACMijqVUWouDjVwP/lQURLNLP68EVR8VV+Rrdgpuvvl9EHIWkOEmqc90mSC
         mxqljVoCXtVjHmLRB3UGPjpAgfA/csbfuJaxz0clZkEoVgf5/vVLSxXYCcbT+290KUou
         2RIx/jaY5epFW6u5DlQTuSE1b2h/GXRvatPBBq4kEfmcEqIgP1StmVha+zD0PE7KwOyj
         hYv31YfhZw1gm21Ho9UJpj3bmu3t76OXQUfU3lfV3aB0BW1yiXeacG60Hwdo9rwuffUr
         ZBDqxDZDXJqYca5QIw+8nOlTXR2jWMUQAk7UNDjfZh8q6c+wggBAWZVBcc6QthvTVUTi
         PsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716297198; x=1716901998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FsRxHVQA25+oFORFBVg+Bgn7uZw3Q2fauVYem0Fnb5w=;
        b=JPfb/MZhdzX+8oXLI03Tz50MzJ89OoGTl2T4kyjgLDYSE7HgC/6CChrTRFmFB3cNyR
         Pw6DDK5ceMEjQ19HOHeYbvqaKji4ICoFqL6Sc1YKAP+ztqd0jwBi0Kxhviten/tby0IW
         4Q+jU5gsnD08wBVwLM5a/RLmUXRRZBMdZyzkFM8usGiCF8UkHRuz4IhfzPJnOebqYCi0
         pYAX4V0L+IjpvIeFzvzFd2lXucsspzKuXNnbiJTL/Ck9gpaUhp0DsU/0dRNj8LibTVsj
         /sZdZk7sG/Lxed2+S9N+rZc0eotbxJPXI784YEs1scR6KYYIuSRR/6EeZpNQ0slNNrwl
         BdAA==
X-Gm-Message-State: AOJu0YzPEa3amoh2NW0IW/rKiSogaKDJehckor8Y5oKoWF+6TrW1KF1G
	ZFeo+xYWRF2NfuMOqeqeHyA6Yo31vkDtTSgmLhgwdf85vp4CD93w
X-Google-Smtp-Source: AGHT+IGobRTiy8ndpumSIj5Cfjr0Yuk4tp0mNJBadJqmXIYSnIDfIvVZgKv83WdeNcc18/xBxls+RQ==
X-Received: by 2002:a05:6512:1056:b0:523:aeaa:7df1 with SMTP id 2adb3069b0e04-523aeaa7f0cmr13289837e87.34.1716297197535;
        Tue, 21 May 2024 06:13:17 -0700 (PDT)
Received: from localhost.localdomain (5cfc9148.dynamic.mv.ru. [92.252.145.72])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d8c38sm4689013e87.211.2024.05.21.06.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 06:13:17 -0700 (PDT)
From: Matthew Bystrin <dev.mbstr@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org
Subject: [PATCH v2] riscv: stacktrace: fixed walk_stackframe()
Date: Tue, 21 May 2024 16:03:21 +0300
Message-ID: <20240521131314.48895-1-dev.mbstr@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_061321_556528_D5623EEF 
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

Fixes: f766f77a74f5 ("riscv/stacktrace: Fix stack output without ra on the stack top")
Signed-off-by: Matthew Bystrin <dev.mbstr@gmail.com>
---
As pointed by Samuel Holland it is incorrect to remove check of the stackframe
entirely.

Changes since v1 [1]:
 - Instead of just dropping frame->fp check, replace it with validation of
   frame->ra, which should be a stack address.
 - Move frame pointer validation into the separate function.

[1] https://lore.kernel.org/linux-riscv/20240426072701.6463-1-dev.mbstr@gmail.com/

 arch/riscv/kernel/stacktrace.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 64a9c093aef9..80f6559b6654 100644
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
+		if (regs && (regs->epc == pc) && fp_is_valid(frame->ra, sp))
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
