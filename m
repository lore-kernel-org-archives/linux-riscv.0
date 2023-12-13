Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F46C4167D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 22:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vDrU4BRFKwpNPZr6BO9twPyOFxpjcVD3qlMaLg7HfzE=; b=nZvuawva2HC7UR
	v14h66jnVmcAuuLyrKX8MIU3Psg/l/QABbAsUtdO5Z2fxp9orJ6DvPJ7JnCfP73x1OpChFfLNRwKV
	E1jlSQGHA/9Ye6EW8rzhCWSodaPQBCF8xtbUsosnL4wgxdVVKr5+fluXYKNBsC/2XngNQXexq+anz
	DykNXEstTwZbP9RdknYKQrzr3n773Wcmjpc1FzDdBwANNCogMsEoEfXsa7fk6De9q7ZV9S5V/zNhG
	6Sg4GB20lbfOgrM8yQPK8yyCE+bbnC0uwoZj1TuPv2NIOkTR/UcAqrpqOF3Op2YaCJp22AMepiVeM
	ouZZk/olYBMApVz+Q4jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDY1I-00GB4y-04;
	Wed, 13 Dec 2023 22:48:00 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDY1D-00GB3U-25
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 22:47:57 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6d9e756cf32so4964684a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 14:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702507675; x=1703112475; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3S3MR9WYTuBImuNJhXJPIP3GzfMK1QacwIWQCdBwVhY=;
        b=BMo2YgA49IyUpY2qpMSc6Xp1RYCjh4I5kPS4Apaxseg25xWFtmCAtpsdzSs/uNM7Qv
         T8E0AV4gTFLxOOVbNnXbvAprWJMtVRcecIKDQ0fnrn6Fk1OXdzO87BSEmI7+kgcO2r0A
         RiJ1FTyzHXMgBKpV6R26uBYIyv3nqoZYPNstyLp8po2cwXh4lgP4HTqGjqgXyRR0WbSp
         UUCcBPy85o5qVGsjN6texAy9tIkMBJHtUZjKYuFrzvyePVF4iI5mD1bP9VLGbfU4rF8H
         ALcNX8dD9Mq59tr1gitQTQaUyyhH5gWTmI0Ej+I+FybUc/66mgQGX/3Cy0kLhCBvbGjY
         ONQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702507675; x=1703112475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3S3MR9WYTuBImuNJhXJPIP3GzfMK1QacwIWQCdBwVhY=;
        b=TBCjoZaW1bcLMizxTr3wiv/LzGQ3ItlDB4AJIqX4C3kBUpfBpuowJOPcjuqeXMolNs
         qwQQppPPi+Yxr1JgIKkzf6QbmrnCR2IsJmwDvT8wyg95dj7Jlm4NMp8Ed/m0Q6+plLDb
         qGCSUJ38fsfxKzr7tkYJorZKuRcIhNvWCdHISAkOApgd4/HKdLayKp1NSzDixkappGCc
         JT6cbSSpMLc7b9OzALVMnoFGzzta0QcbC6zJ4MLPpBp5Q53Y2+ilQSWEF+eMd3GWQtdS
         u+5PoQCT7mFbCSkcrEke2Xc5iPpzIqY9Gr/FdiPkBEWM0IGuSNQJsJtXbvI/QGbVn6LT
         kcMQ==
X-Gm-Message-State: AOJu0YzUm5YDI9TI+Kitod2x/aTY61IXJLhJZu8/h4toKdIzwASiUyg7
	miuCAasNXaoWEM+Jio/hVVn2eg==
X-Google-Smtp-Source: AGHT+IFsn7UhU0Ie5QCtN/RuNeDeBGWw7ehUM+N3a+e7KmmkwDZidr+e3/soiq9sgtalKfq7R2rm0w==
X-Received: by 2002:a05:6830:10cb:b0:6d9:e37f:5c54 with SMTP id z11-20020a05683010cb00b006d9e37f5c54mr8981554oto.9.1702507674986;
        Wed, 13 Dec 2023 14:47:54 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id bk21-20020a056830369500b006d855e2c56csm2375157otb.31.2023.12.13.14.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 14:47:54 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 13 Dec 2023 14:47:48 -0800
Subject: [PATCH v3 2/2] documentation: Document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
MIME-Version: 1.0
Message-Id: <20231213-fencei-v3-2-b75158238eb7@rivosinc.com>
References: <20231213-fencei-v3-0-b75158238eb7@rivosinc.com>
In-Reply-To: <20231213-fencei-v3-0-b75158238eb7@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702507670; l=4185;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=zPaRO2ks3l/75pkgWBpZ4nSSEIYV6K0VRBbOkUO2jEY=;
 b=FhysUS+fsKXjyq0qV4ESXY/r9f9YHqD57UdPggn5+823NiPGLggILNdzlx/BcMFogfJIEdvRy
 M8mdMMi6/hrBe52bmDrZrvSpfL+Om8qXAVgapW/bkUDvXMgqvt+LFBA
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_144755_695060_61DD2399 
X-CRM114-Status: GOOD (  18.58  )
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

Provide documentation that explains how to properly do CMODX in riscv.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/arch/riscv/cmodx.rst | 98 ++++++++++++++++++++++++++++++++++++++
 Documentation/arch/riscv/index.rst |  1 +
 2 files changed, 99 insertions(+)

diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/riscv/cmodx.rst
new file mode 100644
index 000000000000..20f327d85116
--- /dev/null
+++ b/Documentation/arch/riscv/cmodx.rst
@@ -0,0 +1,98 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================================================================
+Concurrent Modification and Execution of Instructions (CMODX) for RISC-V Linux
+==============================================================================
+
+CMODX is a programming technique where a program executes instructions that were
+modified by the program itself. Instruction storage and the instruction cache
+(icache) is not guaranteed to be synchronized on RISC-V hardware. Therefore, the
+program must enforce its own synchonization with the unprivileged fence.i
+instruction.
+
+However, the default Linux ABI prohibits the use of fence.i in userspace
+applications. At any point the scheduler may migrate a task onto a new hart. If
+migration occurs after the userspace synchronized the icache and instruction
+storage with fence.i, the icache will no longer be clean. This is due to the
+behavior of fence.i only affecting the hart that it is called on. Thus, the hart
+that the task has been migrated to, may not have synchronized instruction
+storage and icache.
+
+There are two ways to solve this problem: use the riscv_flush_icache() syscall,
+or use the ``PR_RISCV_SET_ICACHE_FLUSH_CTX`` prctl(). The syscall should be used
+when the application very rarely needs to flush the icache. If the icache will
+need to be flushed many times in the lifetime of the application, the prctl
+should be used.
+
+The prctl informs the kernel that it must emit synchronizing instructions upon
+task migration. The program itself must emit synchonizing instructions when
+necessary as well.
+
+1.  prctl() Interface
+---------------------
+
+Before the program emits their first icache flushing instruction, the program
+must call this prctl().
+
+* prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX, unsigned long ctx, unsigned long per_thread)
+
+	Sets the icache flushing context. If per_thread is 0, context will be
+	applied per process, otherwise if per_thread is 1 context will be
+	per-thread. Any other number will have undefined behavior.
+
+	* :c:macro:`PR_RISCV_CTX_SW_FENCEI`: Allow fence.i to be called in
+	  userspace.
+
+Example usage:
+
+The following files are meant to be compiled and linked with each other. The
+modify_instruction() function replaces an add with 0 with an add with one,
+causing the instruction sequence in get_value() to change from returning a zero
+to returning a one.
+
+cmodx.c::
+
+	#include <stdio.h>
+	#include <sys/prctl.h>
+
+	extern int get_value();
+	extern void modify_instruction();
+
+	int main()
+	{
+		int value = get_value();
+		printf("Value before cmodx: %d\n", value);
+
+		// Call prctl before first fence.i is called inside modify_instruction
+		prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX, PR_RISCV_CTX_SW_FENCEI, 0);
+		modify_instruction();
+
+		value = get_value();
+		printf("Value after cmodx: %d\n", value);
+		return 0;
+	}
+
+cmodx.S::
+
+	.option norvc
+
+	.text
+	.global modify_instruction
+	modify_instruction:
+	lw a0, new_insn
+	lui a5,%hi(old_insn)
+	sw  a0,%lo(old_insn)(a5)
+	fence.i
+	ret
+
+	.section modifiable, "awx"
+	.global get_value
+	get_value:
+	li a0, 0
+	old_insn:
+	addi a0, a0, 0
+	ret
+
+	.data
+	new_insn:
+	addi a0, a0, 1
diff --git a/Documentation/arch/riscv/index.rst b/Documentation/arch/riscv/index.rst
index 4dab0cb4b900..eecf347ce849 100644
--- a/Documentation/arch/riscv/index.rst
+++ b/Documentation/arch/riscv/index.rst
@@ -13,6 +13,7 @@ RISC-V architecture
     patch-acceptance
     uabi
     vector
+    cmodx
 
     features
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
