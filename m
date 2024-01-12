Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551DEC4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 23:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gEGwCzogArIQsLl/esP0DqguW5YLD6CVjWu1ngAm2cw=; b=xxxDnUv8hMPtYY
	q5D1KsdKmZ/xCofXFb7w4XQwArzTt5cdNrMZ2lYbHobLnGee0Me9PlCxsnQHzdfScdncxViQ44WbM
	A3kFhJsQNJ+MVkzprv9nDiWogdaPi3eEOJcP9XyirE2YRmnyl1p6ekR9jcTvu4NvFQcGQXUku3Gs4
	BKfUG6cT1hevPo8dje0WhQLh8TVJg0hsxcToirvA4hHEvNjjoC7nT40Nb+ONEHUTL+XUG12tbgmKw
	KrGo0Rct3sGIHRCHX9MG5bhu79mSrel4ucx2/YyDh8n+9YXSr6csocl4Rns/e7q5+L1qG2y+yJaNw
	I0ZhHhbTdAiPuJBaax9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rORO6-004HzX-0p;
	Fri, 12 Jan 2024 23:56:34 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rORO1-004HwG-32
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 23:56:32 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1d420aaa2abso45682665ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 15:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705103785; x=1705708585; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEBcVc42XhLbclEOiOTeHrqKkg/yMaKrCrHZS6upbrE=;
        b=NY4BwTYS6d/WVGRQM1+5rbWODX0uTLLlbdAv7bX7kwt9fcAyNLNKJfV5ygW8SYL+jT
         9sk9vP/lQHhrqTHk3upmykj0/rVYL4oyNmpqZCu6mfiQ3o5kEEx1nWSIFQhjSDWDMxI8
         Yq3QlRtDGEevpPoF+4KNzQfOxYWA8mTRTpewYFlKMJ2j1CCkvjmOuEJEKLsA03dn3fcG
         gFb5be6Mh+dJZLUvHot9tErDGe0r5cG1zbcLpmz0BUrXZQFf5XO7x+4l8j5YWprHOScy
         Z2xs2fj/WZQ7xoFmpa+Fr7cx6EMwCzheFsgNYx3ypataKqlsMpls9G/yTIpFgn3qNen5
         Ag7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705103785; x=1705708585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEBcVc42XhLbclEOiOTeHrqKkg/yMaKrCrHZS6upbrE=;
        b=ZY7FAup9wCLlBEh/ZMMlbPqBF3X8DYAqUur2DLgYPu5OCTU/HyHlav1cmLjbCpMb/P
         /2w4WjAndR48AeVu8Ke7f9yT+cSCvPMrF5xsVNTicmqOyzwunEkJCZ4lY1TDfOrR9POf
         wEZZAkKl67lqdKMTEX9OSwJEOFjGCCTAigy6GsZiqROd+yYNFoFlLukhLwlq/EPoH5Ty
         sieuoRu7HfjHXKGSK2iNhY1I37hUGzLFQVZn/4A/t4qVIrg0u+LqJ1Nh5iWSnV70VCU9
         voLI7ongsi9CAvdSXb0d0ll+XcpCkXcMO7/5FBfD12r95+A+2bixj6Rage0IuFoieTx/
         ScSQ==
X-Gm-Message-State: AOJu0YyxGy9jdeScXSuync/UkIaK8K1pNuBkWUqqyEXzWvjC1oeYrNF0
	fwpp9fEbjLGKd69DGbD81FLw4r1AxhHeeA==
X-Google-Smtp-Source: AGHT+IFNdcduop6iNi3vxZZxI1uKfQ5Yqs5N4fZW2gQaUsy/gPP8ax5VZ32FIDZCspddllFQdOuY/A==
X-Received: by 2002:a17:90a:39ce:b0:28c:b190:7f85 with SMTP id k14-20020a17090a39ce00b0028cb1907f85mr1693150pjf.13.1705103785134;
        Fri, 12 Jan 2024 15:56:25 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id jc14-20020a17090325ce00b001d3b3ac2d7bsm3725537plb.245.2024.01.12.15.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 15:56:24 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 12 Jan 2024 15:56:21 -0800
Subject: [PATCH v7 2/2] documentation: Document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
MIME-Version: 1.0
Message-Id: <20240112-fencei-v7-2-78f0614e1db0@rivosinc.com>
References: <20240112-fencei-v7-0-78f0614e1db0@rivosinc.com>
In-Reply-To: <20240112-fencei-v7-0-78f0614e1db0@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705103781; l=3833;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=K6GU1jCnXJT3SY9+VUk3ZVtE1kDzv2SIhv7zwH/+BBM=;
 b=IIwtYnkypsYDf9+vi3bTkqQxfW18T9+8GE7LkRi/XsBDie8HMeanSj33rnURU6I++o2xxUcr+
 RMM+6s5z2kOCPBLVFCEEsc9wRzO3ABlP9+RAZmyIWBEBaj1qTOBw6p7
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_155630_023511_AA5D1D49 
X-CRM114-Status: GOOD (  17.45  )
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
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/arch/riscv/cmodx.rst | 88 ++++++++++++++++++++++++++++++++++++++
 Documentation/arch/riscv/index.rst |  1 +
 2 files changed, 89 insertions(+)

diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/riscv/cmodx.rst
new file mode 100644
index 000000000000..7ae8ababa039
--- /dev/null
+++ b/Documentation/arch/riscv/cmodx.rst
@@ -0,0 +1,88 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================================================================
+Concurrent Modification and Execution of Instructions (CMODX) for RISC-V Linux
+==============================================================================
+
+CMODX is a programming technique where a program executes instructions that were
+modified by the program itself. Instruction storage and the instruction cache
+(icache) are not guaranteed to be synchronized on RISC-V hardware. Therefore, the
+program must enforce its own synchronization with the unprivileged fence.i
+instruction.
+
+However, the default Linux ABI prohibits the use of fence.i in userspace
+applications. At any point the scheduler may migrate a task onto a new hart. If
+migration occurs after the userspace synchronized the icache and instruction
+storage with fence.i, the icache will no longer be clean. This is due to the
+behavior of fence.i only affecting the hart that it is called on. Thus, the hart
+that the task has been migrated to may not have synchronized instruction storage
+and icache.
+
+There are two ways to solve this problem: use the riscv_flush_icache() syscall,
+or use the ``PR_RISCV_SET_ICACHE_FLUSH_CTX`` prctl() and emit fence.i in
+userspace. The syscall performs a one-off icache flushing operation. The prctl
+changes the Linux ABI to allow userspace to emit icache flushing operations.
+
+prctl() Interface
+---------------------
+
+Call prctl() with ``PR_RISCV_SET_ICACHE_FLUSH_CTX`` as the first argument. The
+remaining arguments will be delegated to the riscv_set_icache_flush_ctx
+function detailed below.
+
+.. kernel-doc:: arch/riscv/mm/cacheflush.c
+	:identifiers: riscv_set_icache_flush_ctx
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
+		prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX_ON, PR_RISCV_CTX_SW_FENCEI, PR_RISCV_SCOPE_PER_PROCESS);
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
