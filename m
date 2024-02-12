Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33520C4829E
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 23:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftWtoCtHrTVxf6+EBlI9XbZUYlWiAtGkBtBflkTa4Xs=; b=lb1JR5BCTCmuDF
	c+PQwhpKqV1uiM4Y99JiZqz0BmepJJk/sN65ht281N8lotPesrOcw4M0YxGkFRc9a0ePTXNCTfDrs
	UwDoa/WdDaDpGgRAQOMziidPW35WGn0sCTmTaItS4RSK1+gpGRHlLfWHYfguCJ3uhQVmaj3El1zJj
	6w+znNiyAFgD5yrFzaMhHIk2b391vJQOPyrK9vQDu3OjnprDRAmWyVOy5O/cYcPlNCJrbYq7+lWM2
	QFnKjsiLNRmGQzfvmhtIkC+hnkD7SokJGhWADfvhPyGZ52uihwojVtLPXsSbG0f0xDhak0kc84pkw
	lb4rAP6FKoS8Evt2jE3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZfqr-00000007IbY-0Nyj;
	Mon, 12 Feb 2024 23:36:41 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZfqm-00000007IYK-1qpV
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 23:36:38 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-296a79e6295so2670432a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 15:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707780995; x=1708385795; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7cnan8PSAVXC3cUypQgKZqafgG+bekGNiKDSOb6OW5c=;
        b=ojb2KjTlmZHU90hXSMp3P2LIkiQfgcZOSl1ON/4WDdz2WGRLlNnWQjqcrdilukbuyg
         bRvbDFK4POMy4kgpKg9RQmHtZa4ENhxAhozdAgWk5czCMQtO76n3DBHnKRQWRAWmzYWg
         h+CKJti3ocbsa6+fqDswa7ELEM5zpkqZ7nbdQ/aBCLbdAk6EJUnJ9nEm92s3YPWNfRaD
         n+/S/B/6RPKoxKF46F+z+epoe0f/5lhMqvGmZxj5bobAcTGpqz23dHEMoOiU6KE2LAlT
         JZtJUsa+MxVfg5JMR0amwPpo+obzzzxbki/NQESOO3jbBHVmMTgIj2e0RrE+ubK39EXB
         UBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707780995; x=1708385795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cnan8PSAVXC3cUypQgKZqafgG+bekGNiKDSOb6OW5c=;
        b=XLFtn3tqFhyTgbnUrWI8iBdL9ogiLVOZrhbKKertbIK1gvR7RMU/JTODFg1TYD/Cs/
         TwyflvSNrtKchSQ1CF6CHKJQwJkfJIBB8HI2wIb1IKPflRy54K6SiKK6H5X5O92xSDOW
         w2zoU678GgVfVswUWUKx6agfOswRftZfvmoymanJZZVz4T9Zne035yrBu2JsWknuHagq
         ew20IP3qfoqTQPCY8nv6fJppRtgz5QcNexFflh/6RcmqtTYNTngsI54I0UXQGP6IBjGY
         paTJ970bvFa/ZpWzt1WQTcQoV//0Seby8fmPqn2BPzAs1vOyLM3EEMcJugVcamrd9BRP
         lEMw==
X-Gm-Message-State: AOJu0YzMZwd+WbuMpAoLa5SsUnUikLrk9tOxsW+C2Wnt+2qUyoKnlUnB
	8wXVLfKr/u0+5BTBtAMWGrZe5pQ5o6j9rV5RS5L/KUww8O9dyeiaM3T7n3WvezE=
X-Google-Smtp-Source: AGHT+IEy/UYemr39prYxAVOYTN6/oNrnyC8e1djNHt7JTfEtK270DmcLzYDcyfo+8s8sJcI5kCZL/w==
X-Received: by 2002:a17:90a:b395:b0:296:2f9b:8c2f with SMTP id e21-20020a17090ab39500b002962f9b8c2fmr5593744pjr.40.1707780995399;
        Mon, 12 Feb 2024 15:36:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmdXilEjO7FPIdqZaOyYuCeviPFS0SqLHZnCp/3gpSUAcvcq1RseNEO4AQ/xLKhhErZIkjWUUVEw5LUaDtfKBINEqVwe12bA0TS73NEdLCj0rsj6xYtj9GqmqLqCqspVc9Geyq4JxEFeQttHJs/GpyH2RJ64YcR66d5DidBGbD+P1Sch0aN2vyW5MoX0cYMAefu6Sy8YSXfxlVpECJIheAf2i3t89jVImJooAddlrWE0aRH/4eW2IIYaSDoNl7ag3Yqhg+MW5+vYxv+CdWiPLnOWRcKcGDj+JacCAKTOZR6O+fI38OmdnlEuSYvVkPBmFFgRpVBZAxwDuUhRNoW3gFK7cs7YYZsJGBF8XfBhnrvJpJvFtSRRVl/3ScCqdZozSE+tCpO8hsi07wpOMfzWAyq46aGvtGkQ6rfgLZhsCCIK8g9wgsDGoqAIfPXygy4RuRdRw=
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b5-20020a170902650500b001da153682c5sm888693plk.261.2024.02.12.15.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 15:36:34 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 12 Feb 2024 15:36:28 -0800
Subject: [PATCH v11 3/4] documentation: Document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
MIME-Version: 1.0
Message-Id: <20240212-fencei-v11-3-e1327f25fe10@rivosinc.com>
References: <20240212-fencei-v11-0-e1327f25fe10@rivosinc.com>
In-Reply-To: <20240212-fencei-v11-0-e1327f25fe10@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Atish Patra <atishp@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707780989; l=4601;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=h5IjKPzf39ifTQj2Z0xAqATqlmjtpC61zariLMJKI0A=;
 b=vJDezW43wOShNn6FckmWv22EMLkCD0nM7x+UHVRHI3N8+Z+FmM5YXkveip/sA8wovq7Ws6bKO
 BP+ZSS/Sc9LDs5LKYhUoWvOeHEH9nKsMNE7+MESOdiw9PK7Yb73MHqV
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_153636_574925_7326788E 
X-CRM114-Status: GOOD (  20.05  )
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
