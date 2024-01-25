Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E89FC47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 04:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hnSzY8MMs4nPBBDbSrw5BQ0uJcwEtGg2NDEJHgStWLo=; b=djxnT0D28Q6z25
	Bm3wLIJyfjls1OBiIshRWENIl6y0snpc4sK/nnaCdsao9dbSupZPYEd86C9AncqqXlEWL5sPQCFr8
	ppSyd6TZy9BeKLQ94M/4lJD/u9Z8Uw5sob3IchEGDXdtcDkBxNQi1VedFwaXl9RTq39K07C7S48pW
	6L2kJ3EGwIE9tKVGld3psdbazkkV4Kps+rkRwTuT0Mj1j695zmwQI0qtMsj9UeitgBQk5wxn/StTi
	DcCvz6SX6VkFf9LSw1iMoZzMIML3qiDDJf2seU4KqmGIjRL240NjgPVHVgyFX3hkgt2lE1fOgu5Kg
	PV2lqmTUwyCD5YlbUrKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSrGw-006FUt-2e;
	Thu, 25 Jan 2024 04:23:26 +0000
Received: from mail-pf1-f171.google.com ([209.85.210.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSrGu-006FPx-00
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 04:23:26 +0000
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6ddc1fad6ddso899784b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 20:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706156593; x=1706761393; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CK8ubEYcDvykwCMVvaVm7hDmlbmdtschWrNEGYNue+E=;
        b=U/ktDWdSA8NdlMDOV38X9udfQZyhksM2uKREYPQfrFBSEr6w5ymej29kIxGNBoHqg4
         yh7usC35WTJqXxFmHbCLz3gRaVc34r16ZNX51MpPSSRpUKe++dskDCI9kvrQ3IJm+1P3
         YIh8z8NTCmHZ4jSJgrhxkWZZlSqxFp+JcSxe3oD/WSqAg4rctiAE9am+HbHRQKXLt/f/
         F3FBdzg8MSyBt9h9hnXX+yMKMwncVyzZRbvl3KSYJUraqJV0MFzKJVWLlU1kG6mGhg+S
         3P5Y5bdQvpdkVVxjQlyDO/7QyDMH1NsA2+6WHgdO/2Aev+Etct60RiRigi3uiGBsepUV
         7zmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706156593; x=1706761393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CK8ubEYcDvykwCMVvaVm7hDmlbmdtschWrNEGYNue+E=;
        b=fOGjWT3apj72SbuqNxvlIeDmybWK8at42r/T8Df2YhbXkXwnsccaH5i3yFEocjh/DU
         2wBGGHRyi0KySlMb0bKR+7u6T+0I3wluIfO3byujGwJAZSfEScyoCKAn+Wzt8R9FRVkj
         JAOCJy2o5j2ZlY6UgtKALSX84h7oJfsPBGNx7cKJGaas4RBx8Q3kNUNuNscTNKqxeeWK
         LDV9mTTVxGjJ8U0/79ETRPS6TR6HA/TitSc9oHx+R3fmkNsh0XC3KQOAy4/ItXVAiqx+
         x4GdkmNm1lAF1WWVNQun28CxDqKpwb98M7ovC99lPIvTk7XLaauP107ARkOGvG5/N9Ae
         mxhA==
X-Gm-Message-State: AOJu0YzETNq6+AONeP3La1ccgJIvGrt48kRT+oWBMiPlQEPx3C9YGajA
	GpkmaWQ3JoFa2+Q+h1SESkDv6bO0ufeQKNZrYhytPlnw3MCZu1CwR3J/iHGz3EQ=
X-Google-Smtp-Source: AGHT+IEl9KllwvoXTMIWVk+ArtZ7zyceTl8372dHYcA/tM8YUg/OWolL1Pt0csL+DiWBK4p74V5Vyg==
X-Received: by 2002:a62:5e46:0:b0:6d9:ac49:4e36 with SMTP id s67-20020a625e46000000b006d9ac494e36mr240715pfb.68.1706156592719;
        Wed, 24 Jan 2024 20:23:12 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ko9-20020a056a00460900b006dab36287bfsm14549743pfb.207.2024.01.24.20.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 20:23:12 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jan 2024 20:23:09 -0800
Subject: [PATCH v10 2/2] documentation: Document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
MIME-Version: 1.0
Message-Id: <20240124-fencei-v10-2-a25971f4301d@rivosinc.com>
References: <20240124-fencei-v10-0-a25971f4301d@rivosinc.com>
In-Reply-To: <20240124-fencei-v10-0-a25971f4301d@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706156588; l=4389;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=/bIGEHzKWZAAbhSw9Bpm0/wGOXPFjFzSm8DGgPpgj+8=;
 b=8nd39leSJgLs2+elKTrJ95kIaaY5aY3jfw+V51ahKwhAF0kjRhP+syJrfXGka8Ue4mqYnRD8T
 /tR3VNLNInECWRfmUrpbWrqv21ojl5MkNzkfjR0C0nh/CuHH4cG3+3t
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_202324_074631_32144893 
X-CRM114-Status: GOOD (  20.04  )
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
 Documentation/arch/riscv/cmodx.rst | 96 ++++++++++++++++++++++++++++++++++++++
 Documentation/arch/riscv/index.rst |  1 +
 2 files changed, 97 insertions(+)

diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/riscv/cmodx.rst
new file mode 100644
index 000000000000..24aafa23a72b
--- /dev/null
+++ b/Documentation/arch/riscv/cmodx.rst
@@ -0,0 +1,96 @@
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
