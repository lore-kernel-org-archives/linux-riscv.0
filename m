Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70328C47DDB
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 23:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2Fmvn9mQCuqeCQOlHoS+io5UqjqhG+al6U7An50hwU=; b=2xYDUEHr1Nh9tH
	o7Khd5JQxp0QrrpKlKOA9My5AHYc2LL9H7fYtIV8wM/YXaB/4aIPEEHY3S4VQUd5dsSofOoTvk51n
	hiOwR+79scqv0RzLWqGwNP2UnPxQlFYUpm6fzLHlGjBDn9029XAHzKQZrkCvNJJY4gpsx+EjdUhMA
	dNqqhCzyi+E5tbUyTO4PYvOZOI8n1DmMPbcECUJ7wnckRwdFmlcd662tO0AlB0KGNCqYu6qJixpYD
	z8XKGKFvWTeb/R4AmEjVeEROwUg9RXthFoo6/UxwP6pgxVjeJv8oAlhyMxLa6nS5/sePNe4n6kV10
	hfFZyQ42DJMEXUhdVmQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSQEs-000pes-16;
	Tue, 23 Jan 2024 23:31:30 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSQEp-000pbx-08
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 23:31:29 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2906bd9f2ebso2391662a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jan 2024 15:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706052684; x=1706657484; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ypj/UfIhrHcfkXvw9Dauu4SlRhzY7WsoxY+bpEphFSM=;
        b=zajEK45d4BsEN9UABSJYeEIvPS5iePa63tQ0fW67P8s1ph6V3/aHAqdmgIsPVTSJZg
         75U3Haa0t8OpwmKzkbjkEFv4QjjX5jW07b4aO8q+rDyrZKuEQpZ0HyBH+1yPg3Ee9zgW
         9BoDfKKX4pgw1Skcd3UNfxCFst6OHaRWr1+HU1MO+nb+FfBj6AXW2UcDI+sbNYQaptMY
         aD3WHPgecD9nd0WIPg30jfE/puWUBQUN/viffQl+LFf+uG1McJLCx0Z+Qldp/vchoeOg
         kkFVfvwr7/7JoNxGVdQdR6xlVLMBlBrLJFWpVayx4z2KuTJRkZ2d6e73lR9aJfdjBXwG
         Roig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706052684; x=1706657484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ypj/UfIhrHcfkXvw9Dauu4SlRhzY7WsoxY+bpEphFSM=;
        b=N8lESZqUeVJg1IqG3H5N8KWYoBIDegt7g0gQccDytxnCDA4xfgKs57nrG8QF+48EUy
         8FjqF7MOXxkBi0MLxvR/XaPxbXpR3hINR2xGoM8WMs0o2oQZo2S0GlNNvGgGNLQlUkur
         IfQJGlsU4n1dKKnNoWWWPd7av/6K7Ypf9VqJpykEipEYYDnxsAHlFrfrYay1/lPDJXWC
         IwgkbjO84wQGINgt+nXfqPRvHJgjzjMIkGdIvChs8W6fYMFeUBX5b3bQ7YBjYSKHAPnb
         mIyWbHd/P6f88sNthvSJwkVz3pn7XYQmSNZwS4eoYQssdxuytfAz0bEDSmpwFNoC9nwf
         Hnsw==
X-Gm-Message-State: AOJu0YyJwgNd7EqfRV0r7oGV/MkzJ+pMQutwDhNFRh+nttN9zsCwZL34
	cy/enZJzqZ0nrkbZbtXazPYv5MTTCMN4m/KzczXVsk7hpnRWTmtALSPBk+6zdwc=
X-Google-Smtp-Source: AGHT+IHToLOk9K0v/hNzUDffZhy+RECx2WTKxjTAijS0JAdyRvVF5awESDE1uNYxsm2LWaQ36Vie/g==
X-Received: by 2002:a17:90a:4b4c:b0:28d:1581:29e6 with SMTP id o12-20020a17090a4b4c00b0028d158129e6mr432143pjl.13.1706052684090;
        Tue, 23 Jan 2024 15:31:24 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id eu15-20020a17090af94f00b0028d19ddb1afsm12150698pjb.33.2024.01.23.15.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 15:31:23 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 23 Jan 2024 15:29:52 -0800
Subject: [PATCH v9 2/2] documentation: Document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
MIME-Version: 1.0
Message-Id: <20240123-fencei-v9-2-71411bfe8d71@rivosinc.com>
References: <20240123-fencei-v9-0-71411bfe8d71@rivosinc.com>
In-Reply-To: <20240123-fencei-v9-0-71411bfe8d71@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706052680; l=4373;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=s1vPZ9pBqnCgTaBmMZz76e14UF6RK2nnhmaQL0fr1PM=;
 b=Ur9C/GYjVRc9cfGP6lbfdLcd5+hrocoQQ3dJe0KO4KsYN3HCUO6zjvu2mV8SSw3XAXQTLvrtX
 FAcuM9z45lnCp+iAcp2yvi2SBh+OuWVcEO/LKKTp8kBQdt/sOG6QIjp
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_153127_082135_9169EDB2 
X-CRM114-Status: GOOD (  19.84  )
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
index 000000000000..2ad46129d812
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
