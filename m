Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473C9CD98F0
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Jun 2026 14:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yJdKahENvwXeLcSGReOTs4V7FyEB/t6f+YF2l2r4Uvk=; b=jUEdolDzPdkEbE
	eOB8t0JaYQ8yfZViCTdpi9aPSICvEuPvtsu4c/bJ+N/aijATcjbSKNq5mx6qAHletbkrpziaXZQV5
	BAv5oww3S1btnDqIesJ7GWxY9Oc0oUpLSyUicDJB281BG/xYy82fy+CnQAQalNTpMmPKRcmAwPmMF
	wtCo3MX5/gvs1VKLtzj8khiOH6AAzJT+14iS7GXtjRGM2jDogrM663r5EY7m4B1erlyUTIpEq57Zl
	6E+C9y+wR0H4sEJEH69hv1xRFZg1ATf6Nj62fatmX/lx8022818O3EP2xOt7Jiw14mIP601gju9LL
	JGQ9UQQ+EVZgbQHlS1Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbJOP-00000003zt4-16yS;
	Sun, 21 Jun 2026 14:43:25 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbJOM-00000003zsj-39sh
	for linux-riscv@lists.infradead.org;
	Sun, 21 Jun 2026 14:43:23 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84538597e1fso2040812b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jun 2026 07:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782053002; x=1782657802; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNsH4BL2x48/RDSlyC16c618fm7E62DwUpEzysGk8xY=;
        b=fZ5rfNXDKyY60kxZr3GPr7xyEh9jeKO/BfS0IZc06CbzruD8hrsxpZ5rJRLwVHCldi
         +4GETZRdhT6a020Gtj1VLzsIo1fhyij1ouKVFdPRxc8sH4/+dK/fN7kNQmKo+nzC37iU
         UHAy7kk6S3WhZ9GqF/uGmm3/JsUW8oS0II47XQhoA2AWrsiZqEAD36LCuNYORSfVzgoA
         MTXtMtyTHhqTO38mlZCUfOqJpdLQCdRPN6p3+vAd4sMIxwtRrsDPHBTUYSYK6sMNspA0
         tOd9uYWPJctcRWMZGns46Ne8WN0Op9e9u5DF3MNPn2DmNhtbAIARPn2BWSup1YOltDw/
         14IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782053002; x=1782657802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GNsH4BL2x48/RDSlyC16c618fm7E62DwUpEzysGk8xY=;
        b=So9WoN7uHN6Pa7oVEkNjj4QWf/FjaLvCMP0n91NLRf8V1S7+yMhMowM5UvTjEzTTdl
         YycLm7kpvEYLaTrPxJEpzDwOgwsMYzeKasMrqHeF0STJVJFI6AGq4/XS11uAhI8qcvdN
         4as6yXcCEaW1nzrM5fCiTRpNajTmc4RTDXvYIKuZd2Z8kK9PXFqT9cjXO5ipJKmP9PhM
         fiR+ep7ovEllzt2ZDem5DcbJd3g2mCmp8JnRS2mTM+p3oOY7Q3S1DNyLfL9F2RkG1VLa
         +qcX1rWFV2dsOew8K7ktmOOe1tCK3YJ1e42r4RYimwiHYp8TzJCD9Zn9/gs6we80m9h/
         Ed8Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Z+l/QsyFJrzLW6Q3aZ5E9u1/RGNjJiJPKlwZweyCICq4yAVHVxAT2j0Fhf98jnHbk7F/iX4iOyY8HKw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+leMEIk+D1gD8xRsZN770Ma1gWnT6g2KunSGR6mVzj4Nn7sFM
	hpHg5JcZ7filhUHxbhmr7joVI+evSx4hGCpyG8oivxiU+w05KV8Mmxnv
X-Gm-Gg: AfdE7ckBSYrqqqyNwrY8OhduXMy1A171nD+xZC7UCO62hGHBX++8/++qiHPm8C5El6t
	bnLqJvoTlvL8wWG7NPjgzV3ZQkNRpGAsSWOHZpdMVLXqS9Gf7K06lnUnrEcFKOGOhu09B2G282F
	awFo13xStlTeA0qNbDqGwy8io/uPhtORiao0ku00tLsNZx/4Sn0m5X/60Z09rds92HxGQq+L3eh
	1d1hHU9ZnHQ7gN4SBa8u2D3EDvPIYW4Aw4p0ZM5nXN0UIYbBGYFUHB+GTMRL2CKUji4Gy1oNbn3
	YzQfD0Vg6Zn6zmk02ac7colupDAXS38aUlf9viIqriWhXoDqSVF/K8dGQGRwFf7Yd6XOfQ1fwJb
	OIqV3BnyCa+S+uK34psFE0Fn26S4OZUmYgBdwjFNnob7WstKVX2iF0lsFo12fd7wgD65fxl9dgk
	VysM3PCbsyX6ZBbX1aNkrQmqRqidQb
X-Received: by 2002:a05:6a00:993:b0:845:44c7:5e1a with SMTP id d2e1a72fcca58-845561140c0mr10722477b3a.25.1782053002122;
        Sun, 21 Jun 2026 07:43:22 -0700 (PDT)
Received: from computer ([2a09:bac5:3b4a:8aa::dd:17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e7687csm4963254b3a.35.2026.06.21.07.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 07:43:20 -0700 (PDT)
From: Varun R Mallya <varunrmallya@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	bjorn@kernel.org
Cc: alex@ghiti.fr,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	pulehui@huawei.com,
	puranjay@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next 1/3] riscv: stacktrace: Implement arch_bpf_stack_walk() for BPF
Date: Sun, 21 Jun 2026 20:12:57 +0530
Message-ID: <20260621144259.288135-2-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260621144259.288135-1-varunrmallya@gmail.com>
References: <20260621144259.288135-1-varunrmallya@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_074322_793701_E5CA62AC 
X-CRM114-Status: GOOD (  12.76  )
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

This will be used by bpf_throw() to unwind till the program marked as
exception boundary and run the callback with the stack of the main
program.
This is required for supporting BPF exceptions on RISC-V.
This depends on the frame pointer unwinder, so it is only built under
CONFIG_FRAME_POINTER, else falls back to the weak no-op.

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
---
 arch/riscv/kernel/stacktrace.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index b41b6255751c..a4c2411f4038 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/filter.h>
 #include <linux/kallsyms.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
@@ -102,6 +103,33 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 	}
 }
 
+void notrace arch_bpf_stack_walk(bool (*consume_fn)(void *cookie, u64 ip, u64 sp, u64 bp),
+				 void *cookie)
+{
+	unsigned long fp, sp, pc;
+
+	fp = (unsigned long)__builtin_frame_address(0);
+	sp = current_stack_pointer;
+	pc = (unsigned long)arch_bpf_stack_walk;
+
+	for (;;) {
+		struct stackframe *frame;
+
+		if (unlikely(!__kernel_text_address(pc)))
+			break;
+		/* pc belongs to the function whose frame pointer is fp */
+		if (!consume_fn(cookie, pc, sp, fp))
+			break;
+		if (unlikely(!fp_is_valid(fp, sp)))
+			break;
+
+		frame = (struct stackframe *)fp - 1;
+		sp = fp;
+		fp = READ_ONCE_TASK_STACK(current, frame->fp);
+		pc = READ_ONCE_TASK_STACK(current, frame->ra);
+	}
+}
+
 #else /* !CONFIG_FRAME_POINTER */
 
 void notrace walk_stackframe(struct task_struct *task,
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
