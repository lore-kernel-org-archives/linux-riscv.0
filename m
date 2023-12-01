Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8DCC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 07:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g/3odfsCg1Gkb+7FsKNOIiT/v80JOo12X0/NiSn5Dqc=; b=YoXhNV/hsXM4sK
	u5p+z/ExcHuBBYePlTrwGhjyTHeKAbuPVgEE5Gts5hpcThryH9qfHp7gqITjq35c8c6sQTQ6zSr4H
	JkJOG++V39sFZBpza6qiYMNeleq8DXj0GVtB7oR4rarsap2VwoqbgQO2KetxcNLMlEZU+Rci1RET5
	bUDlI3WmCceQx8+/dT8ml5xsRfFoLRtu5xx/0REB0qHOqWYXFgwPD7k9h44BWf/FqpoueJOyKnZht
	Y3XUGy+p9f4w4PZ5FfJo603shVoyJQKUjIfCJZi5ikB1pNGQQ8BEKfFpyKwUvYRkT0E8vigLOe6kO
	SVhdE2FgsaVE0co9I7VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8xqR-00CsRk-26;
	Fri, 01 Dec 2023 07:21:51 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8xqL-00CsNj-1n
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 07:21:47 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6d7fc4661faso133383a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 23:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701415304; x=1702020104; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lx4pJqeLQkX2l7a2Uj8+Wz4Hfj2Aqr7p88PvDjFel2Y=;
        b=S15vAz5hKZVzNHW4/2g7KZ1uYy43W6R2uP7MVngkdNSl7UJhYH3eF7cWL2MQBkbKJQ
         PqYC49wxd7OUrKR/RpwKBRtmc7R1hFfrLY5t6EAMsGe+AYStgX8uIDSJLAelYISfvbdi
         KRHyqj/wRXePwWb3cXuDgd3nQi5Uqr+fOicVbVDh1+BIuw+A3vkCXVIL1Whd05PGqBFp
         TK1ueom4qQNFFopOgmdzhl7HI6PPms+k1Mk5eu1t+yuu3jPRajjqwdN9Lm3qe621u7xG
         YekfyHJDxvDD1N9TBeDsKE5gVzeEjwoqZkNVMxzqIBco6T+Zx8o3myLY088hlonXii+9
         5E7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701415304; x=1702020104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lx4pJqeLQkX2l7a2Uj8+Wz4Hfj2Aqr7p88PvDjFel2Y=;
        b=YR6zeckY6i2DEaVbejctkSdzZcW3XKF0Iy/7JWXR0gIsgjOtQfsir61xlxS0SXdEtr
         It/+v3VfU08/tVLrlENMJL5oLlQtGgFJaxVSvM9osgKx1+REPesDkpIJq1vKH8SwYsvq
         +B2eTe1HGp53V99OQC3x6ylYOUsuy9dPZ7Ivm3M0pnIwL5EQD79Zs+R8rMNwPdMG8GD7
         SO7X73F+EDABI4gjIxR1hjMUePlwLbxMac3AyyMR2qN9qW2F1M2CcNwbltsQtZsWpZcc
         Wg89Z/pwvrWJubumBDXXM0PuWtiJFEuryxYQ7JNGyJI2v06SJ0dHBabVG88qTpbbjU5Q
         aFrA==
X-Gm-Message-State: AOJu0YyAFTlFteAlkXu26iMq0TYwSQxZhS6GFOhfTuki+NoD9EsCXXDP
	PpDsHg7Hrss1b2Y4oIsOCi/WhA==
X-Google-Smtp-Source: AGHT+IFUcUIHDgdwfCVYyL4o5c4BDgr02ibZtA9XEgfKC9fOQ43iDs6oEK1YpPurFoi/zLQbnMhzVw==
X-Received: by 2002:a05:6830:150c:b0:6d6:4c92:1ad with SMTP id k12-20020a056830150c00b006d64c9201admr1969626otp.32.1701415303914;
        Thu, 30 Nov 2023 23:21:43 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id v23-20020a0568301bd700b006d7f8da1b57sm412662ota.62.2023.11.30.23.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 23:21:43 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 30 Nov 2023 23:21:36 -0800
Subject: [PATCH v2 2/2] documentation: Document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
MIME-Version: 1.0
Message-Id: <20231130-fencei-v2-2-2cb623ab1b1f@rivosinc.com>
References: <20231130-fencei-v2-0-2cb623ab1b1f@rivosinc.com>
In-Reply-To: <20231130-fencei-v2-0-2cb623ab1b1f@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701415300; l=4185;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=hE84m76gkQJA/iXGNtGqIi6V8ZB1KoiveuBHwIO+MBE=;
 b=90cANh8VzeUQk9JDEqGGsPwauGfJ6Mm0G/dna22vaYJocuBEYP+Hg5WpcF+z54R62WrCk1Mfs
 SpgzhUMflqNB+n5Nj8uLozaWjA+tq/gtSV/pMwLAtm8+uDSZ7w4nVJA
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_232145_597200_D80CA024 
X-CRM114-Status: GOOD (  18.86  )
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
