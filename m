Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF966C54E66
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 23:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uf5vGFewerRkEn+HlnRzjz9L0U8pmW6KaNusukDnms8=; b=QNmr/bP5nM5m+k
	9LM46yQS6lYczT3yp4J9opHnxAQRzoNaxCn2lNvGOJDAxhXC9pXZ86oGL3QJiJT1+IX5LgAMStCET
	bi2lsLZU1swNYsENf6N6XCxtffyY2ya6kwaMR96v17Typxb4UsSfV0KSwNmygwvfnJN/TGJAaKY+H
	u3uX33El/HVMxjY+hNU925VksxlAMw1wvubOBfmWYK6JrPlOAH1MlZG8M2ypovTcBf5v0VtvPstV5
	ixCSQFB5Bb1NjzxSNyX2f8k3VSWgJt9OVt2ybp2F6Z+uUpqXVW0ECzZ7neBncPH8yGXvX4fttdvgk
	KfPzcTfe3uCSP4NzzQew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkBwP-000000081iP-3qrX;
	Tue, 12 Mar 2024 23:53:53 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkBwJ-000000081f4-4Btb
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 23:53:49 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1dd955753edso26279575ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 16:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710287627; x=1710892427; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xy5TOqSKX3DblYxEOD5MVVtHMk7JBMIm4GkKJlZsbS8=;
        b=FdXlF30+kbWABoC1t3xiX9z68Gq57IwQV5unTBWhalpJ33JVff5hFDodmtXWTGpH/6
         2IEvQ/DAgz32AhZ72ZYlfzcNGnqbR1xRDrU9lYcVRxj2Pk2NGGG07PSKbSWggH+PB35m
         NhXzOIE9inMIXA8VM+hDOvSy8WlSAjPDwoqJcK/eYfe2N/vir6UJrK8frJkIODRZzgqs
         aUKkwbu92GyQYvHUugUIBNE1VJiD5W7aEKOEQ2MxAy3pVQmwW03MJD9HItmasWoOGxCi
         D2Bft1cJxDPxc4h3rybKoC0l9uk/KEmnIdKZBDG8u/SOG031R0c/DFXSDCbRLF2Y9FTt
         Q3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710287627; x=1710892427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xy5TOqSKX3DblYxEOD5MVVtHMk7JBMIm4GkKJlZsbS8=;
        b=MQ3vZDlRQQ1WPC9DFy+MznILd5Tn7hTH/h3PofI5E95TXtZvrkp8RobMlXL4sK+r8y
         1lPtSRddpD49kiybeiNImZNuCjHiWnMGChWWGQdXkCWlHQqHnxCn83GwYwktj0Ub9W3g
         IeILeYXw5mQ6qoVUAxLx97SDdUk9YR3WiX0DSSf8btJi2Lr1Tn95WDnA8UiIhkN7U7xc
         kHImnNM9NZQM2nK4HeraXv79e/HUWHX4vWMJgAZjwXeitojObjcgtKX45e5ujwQZObmw
         Fo0gPHJeixYwNsxqpa3vExpgKKJ95xrZkGvEQLqL6NUW9sQHcHI3Hvgb45u7AwwyG1rm
         nglw==
X-Gm-Message-State: AOJu0YwRUjNzbG/peA6bNm7jWqSB8h75SsVQ2jj+4l8h5W6LC85QIkiF
	9yCnqHeNSUKPzLQJilKf7cdG9HYICpKJEAVDscNFjRMENRB6BXj5LrQC1mNFuj4=
X-Google-Smtp-Source: AGHT+IGOuq44oY+SA4/K6Jk2+JXY0tCiJaFcX1Kd9JQD8qXjj735tLLLMG623VHrrnU0hXZIrtQRgA==
X-Received: by 2002:a17:902:ecc4:b0:1dc:df18:c5c0 with SMTP id a4-20020a170902ecc400b001dcdf18c5c0mr11755148plh.0.1710287626915;
        Tue, 12 Mar 2024 16:53:46 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902f7c900b001dcad9cbf8bsm7282844plw.239.2024.03.12.16.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 16:53:46 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 12 Mar 2024 16:53:42 -0700
Subject: [PATCH v13 3/4] documentation: Document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
MIME-Version: 1.0
Message-Id: <20240312-fencei-v13-3-4b6bdc2bbf32@rivosinc.com>
References: <20240312-fencei-v13-0-4b6bdc2bbf32@rivosinc.com>
In-Reply-To: <20240312-fencei-v13-0-4b6bdc2bbf32@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Atish Patra <atishp@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710287621; l=4601;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=VhbTJ9D/d65WnO+JrY1SIvIOPQdT9MHfEzWOw+OIGSo=;
 b=cZs4wpLQVtK7aTyxMXY6Q9lLyWJ4tLsVLAH4e9c1IqQElmGi36HzjYpFtCMt0IsozfaaDWWOb
 QEJZI4fNKu1AxAOBDJtLa+UZHCwjpFVve7bojE9mGLUn6bjOh1cblBo
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_165348_202635_F67E65F1 
X-CRM114-Status: GOOD (  20.26  )
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
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/arch/riscv/cmodx.rst | 98 ++++++++++++++++++++++++++++++++++++++
 Documentation/arch/riscv/index.rst |  1 +
 2 files changed, 99 insertions(+)

diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/riscv/cmodx.rst
new file mode 100644
index 000000000000..1c0ca06b6c97
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
+(icache) are not guaranteed to be synchronized on RISC-V hardware. Therefore, the
+program must enforce its own synchronization with the unprivileged fence.i
+instruction.
+
+However, the default Linux ABI prohibits the use of fence.i in userspace
+applications. At any point the scheduler may migrate a task onto a new hart. If
+migration occurs after the userspace synchronized the icache and instruction
+storage with fence.i, the icache on the new hart will no longer be clean. This
+is due to the behavior of fence.i only affecting the hart that it is called on.
+Thus, the hart that the task has been migrated to may not have synchronized
+instruction storage and icache.
+
+There are two ways to solve this problem: use the riscv_flush_icache() syscall,
+or use the ``PR_RISCV_SET_ICACHE_FLUSH_CTX`` prctl() and emit fence.i in
+userspace. The syscall performs a one-off icache flushing operation. The prctl
+changes the Linux ABI to allow userspace to emit icache flushing operations.
+
+As an aside, "deferred" icache flushes can sometimes be triggered in the kernel.
+At the time of writing, this only occurs during the riscv_flush_icache() syscall
+and when the kernel uses copy_to_user_page(). These deferred flushes happen only
+when the memory map being used by a hart changes. If the prctl() context caused
+an icache flush, this deferred icache flush will be skipped as it is redundant.
+Therefore, there will be no additional flush when using the riscv_flush_icache()
+syscall inside of the prctl() context.
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
+		// Call prctl after final fence.i is called in process
+		prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX_OFF, PR_RISCV_CTX_SW_FENCEI, PR_RISCV_SCOPE_PER_PROCESS);
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
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
