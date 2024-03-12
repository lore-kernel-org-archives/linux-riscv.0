Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F4EC54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 19:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uf5vGFewerRkEn+HlnRzjz9L0U8pmW6KaNusukDnms8=; b=3u4kQRXwUwSfk1
	Tl/pGF+pkgbQ8WluDgGToreFy7w801cHxa/x63irhdO9zxHDsci0v2gSNxsypnKBIZU9A71fSXg2I
	QH1Y+KWHZbYZBJDsV3dsGGZEsMYrpq8DXGftGheXL9tcmJL/NHUjaxudq94/q2oPBw4RV8zE0cHJA
	CkG9M7aevOquNtP12CSHugdRVHlgLdU4nBiV1x+WF0n4vDoXkvu7pBHEp7JUbQLeGKEx3X4Eboa1r
	34ZagTh7mx1eWBg44hWjAsOCTjb8rT/dgqYYtbZgQJP1ZWDB7GJOAEvBy54Phdebj6sPiLbLFgpLV
	g07dBcQ5yQyG12bIBRhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk86j-00000007Ldj-3i4d;
	Tue, 12 Mar 2024 19:48:17 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk86Q-00000007LVp-3j9Z
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 19:48:16 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5a1bd83d55dso2446700eaf.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 12:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710272877; x=1710877677; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xy5TOqSKX3DblYxEOD5MVVtHMk7JBMIm4GkKJlZsbS8=;
        b=paVV9oE5G8a+KUZN9W3CS793ajwIrnkQy+tOlaCxxwBnXtedp9kWF5UGFWKx2JzwYF
         T1IEud8u+8RezNI/sn3ax3QgV7Ko0p9XVxqafyBjXE+xqlFjEWYdy2yC6bHzdI9tSshu
         5+Tgtk9eeAjVmgVJd5UdXAy2p3r5Zo+PQjMMjc4my78JhlsIosnS2AkILfDSey47hc41
         FHC70Ur3dz42coslsAhThdLTbc3rXXHt9q5MCrE/ZGvROwTy9/744yDiKM47N0fmJMCN
         fWkI3C3FtaioGH6vwvLFj4UIH0XZS5OrEhGSjTN5lKfc7stPu4HmWxb0DXaUI8/rnUNR
         UNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710272877; x=1710877677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xy5TOqSKX3DblYxEOD5MVVtHMk7JBMIm4GkKJlZsbS8=;
        b=uDxbTfJ5AVKzIWgL6bdTG7QSX2gIModS3361ZQdImUYExiNO/sKrPGFe+dfZVB/QTJ
         3vKrmYQ57jTk+DxcbssRKxAD6JTcnNWc0kGuY9iQNdRV745mEaBWPis0XZQq806ozPlQ
         FekP0TADmhBWAlHImWviDSwk2wI7AK0qm74VwmxRWqbEh6Dv9BEnLQhEhKV2GZ3xZDfB
         hC2KIulxd3tFt8WCjR3cC+fxpGb46anXrctRU6vxp/lrXmgQvK1iUFQJmfMgFUTs05M9
         MOxGLqlnQbNxadaZMKfOwcUgaCrIueA9FeNuHLSyrEokPGpYEnTpF4/GenClwSeCXo83
         ednQ==
X-Gm-Message-State: AOJu0YxTXYMhxdE2uZnALLYBFsSsbywgKJC9o9o7ffwUI9yWoJsCyUIU
	DqkXxy3ZJ5Ekf89jqGNuO9qq5jpUeIcphJgBEdVMFUJ7yaCRRkYeOVLdvvitUbQ=
X-Google-Smtp-Source: AGHT+IFd0bZPr6/Tvi+JuSoOyuixgtJ6WAYK/olTHFvdOw4qN2FQVd8SGzL4/UjSf4c9J6b7yNldzw==
X-Received: by 2002:a05:6358:890:b0:17e:8b57:df56 with SMTP id m16-20020a056358089000b0017e8b57df56mr2915905rwj.5.1710272877364;
        Tue, 12 Mar 2024 12:47:57 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z69-20020a633348000000b005dc884e9f5bsm6433495pgz.38.2024.03.12.12.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 12:47:56 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 12 Mar 2024 12:47:53 -0700
Subject: [PATCH v12 3/4] documentation: Document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
MIME-Version: 1.0
Message-Id: <20240312-fencei-v12-3-0f340f004ce7@rivosinc.com>
References: <20240312-fencei-v12-0-0f340f004ce7@rivosinc.com>
In-Reply-To: <20240312-fencei-v12-0-0f340f004ce7@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710272871; l=4601;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=VhbTJ9D/d65WnO+JrY1SIvIOPQdT9MHfEzWOw+OIGSo=;
 b=S4Q4g0OL9AJrAQOCaFiNRjCCUHmDz6cnpcZDAWNuFSLRFGJkYKZODksUzU2K0QWVnOLzgR8qC
 ctajQdPe12QC2H9MPFlltFUNQPxIkrJ/gFbKGLR5Dp9mRPYZJLteExZ
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_124801_440418_14AC3397 
X-CRM114-Status: GOOD (  20.16  )
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
