Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE89EC61D9C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 01:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p1qYiN8/cvjA9QAVbI3VShbOJ4pDpWU9swofFbGAZT8=; b=ylh8BGE/WXiuu4
	cYCMdeC6GxTzgf2Ny3figDi15o80AuH04M9JNvm4L0vaw/nQZQaCgt4d0XVmEXpfzt/tKOVMxA1HB
	zQS/FebFcROPsaGPps1jhWZ6hThnfg/3R8dd22b9EcCweGjW4k/j0fD6cIYZIacCTnrqofUX/aegI
	TkIe9SHKUnrU4IDYJ4xuug7dvLYqjS7Acm4M12VupjHNW+/c5YEEAN688IaY58n9zL4AdT0+o52bN
	/eeZ6SSfKUasnu+VdXcNuvAs6g4mdeP6CKKffAEdDEQl27fWWvGyLmmbMWZgc7gCweAbPVw/UnvwL
	Jt3M9Wz5m0T4CA85S8Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5y7v-003SmB-2O;
	Thu, 23 Nov 2023 01:03:31 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5y7r-003Sl4-0J
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 01:03:28 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-1efabc436e4so268699fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 17:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700701406; x=1701306206; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRpHyXch1ds04YbL7CZ2Ig0iTMSbi0Lx8xBxrq50UvE=;
        b=dBbHKtmKWWPSXY0bs8g78eRMY3hky++tQtc8etXGdi6By1RzFNo9D1HCRlAEL5MVnJ
         T+zdQUZ+TalfW5GsusMsdidh1S4/Ci6diQLTbVLALzA3/2Y6P56nwVSB6DRsYo8hq1nu
         aCpTJUsX42f3RzgbOeMQt9Ar2MUUNOBo61lNhtoKNLILvpAD4F1HTsCpAjbv+5R7qNjM
         2PWVax+0YCSZI8mr4phemcb4IlSPltY23fLRqTa6RO2eEEWg8DaDHC5QzWmL2dYFoIIm
         rtJO6pU30K0ItdSDjq5wGszL8QJ9I+Zp+QT1Y4gx1YuZsQBOYDSY6zvLw5r+kFgV2G/0
         muhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700701406; x=1701306206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRpHyXch1ds04YbL7CZ2Ig0iTMSbi0Lx8xBxrq50UvE=;
        b=L5mfaAuCC+g+h+MqT41KzFCsbiHR7tXh+ANDaXch3WnDW7RTU0hFIRbo4eQTVibxdM
         k75vAcridfSl1fpeiIlje2IhBrrdxRwVbOcRuegnFj4JZP+0WlIRCej2O6A65+k3aV8D
         QEvXX6fXSy5g0E6lxN8EgrrjBPfL5PF5eX5oYUngRepT4PBa1OyTuJaugLEKmcPRDJEW
         YYooVRHhflMlUXZF6zZwc1vu2eabM7/3iskcoT+UdNl3zc75bHbs+MZLdI2EFJZ8DkYf
         c5rHFYNzkssPce1BukFXHNhMly5remmABvdvxhUVvRLsnd2hwNcfteZFOlHHzBsLMGqD
         5UYQ==
X-Gm-Message-State: AOJu0YzqQ8Klt6SMOuTgR7jo6xiqOtNUaQmmt6JF1mkoBtSJmeMS0xR9
	jG+fVlfC3Q1vDkxIQ0jToNFOpQ==
X-Google-Smtp-Source: AGHT+IG/XANLuHhNMbyQI/+iMPS/2BcEpeebTXYFvGzaxHzLqTfuC+EYQtgGPk0ne/nd3MEaxF3m8A==
X-Received: by 2002:a05:6871:e712:b0:1f9:5cba:10f with SMTP id qa18-20020a056871e71200b001f95cba010fmr5497463oac.38.1700701405717;
        Wed, 22 Nov 2023 17:03:25 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id oq12-20020a0568707d8c00b001dcfaba6d22sm65834oab.46.2023.11.22.17.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 17:03:25 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 22 Nov 2023 17:03:21 -0800
Subject: [PATCH 2/2] documentation: Document PR_RISCV_SET_ICACHE_FLUSH_CTX
 prctl
MIME-Version: 1.0
Message-Id: <20231122-fencei-v1-2-bec0811cb212@rivosinc.com>
References: <20231122-fencei-v1-0-bec0811cb212@rivosinc.com>
In-Reply-To: <20231122-fencei-v1-0-bec0811cb212@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700701402; l=4185;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=F832qgYu+P4UC1wEyL5OBUM++FIUPLUyooQDvSDBU3I=;
 b=/ejB/nGO+n9Z+OwncZfeezfO5rxKwLReqPaxBO6PJUO73xRriSsewPuRVrfnOHqcsPpeCAPhp
 4G2AJ2iToI0BoKeRwOjWiYIGh2mXR9CiOFIiNGPhqdaEzyhT3a1toPw
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_170327_133763_6EC66A72 
X-CRM114-Status: GOOD (  18.52  )
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
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
