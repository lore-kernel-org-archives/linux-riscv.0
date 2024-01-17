Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A3CC47077
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 02:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1rr+xfKan5UwzQC2STyx9pwjFp4K6oOjReTICg0fnHs=; b=dcCCKTbxbNtg5x
	FAq46igp0w8kUy2S2+UAM2+GLZ/4v0mEC1f3GCUo3yMvr1jdK9y5VfzdyejeXvkdhiDxNDGnZiVkD
	rSrBIsprlDfajjpslH04yxi8XJwj5Lgh8XTCH8xd6tJ94PC3kIoeFTZ+IaeJS1JH4as3un0EHfM39
	l/Jvac7RuFRWKv/CPecoCBTmyX+49sdDWU8ie6u2M94dAVEhaqD3e9IzK15nZpjmaY/zHd5CsmqG4
	i8nRk2waa2FfrhRSPNh2zjEHrxPbZH6Jnv14RHbJwF1ZrO3JpY2CmRLtJMClzYNU2VLlBSpKCi769
	FyUeAmtlVsRMD9MAvkbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPw5d-00EGYK-1Y;
	Wed, 17 Jan 2024 02:55:41 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPw5a-00EGXG-1l
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 02:55:40 +0000
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-598ee012192so1323737eaf.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jan 2024 18:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705460076; x=1706064876; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPwaFGwJVXA165SJk4N6+fNaFaLuOX6/L3PIB61yMHc=;
        b=gYRxusqFPXiuyrBxe55ImWtPMiwkHFJZPRi57GTfnBILCji4IcVcweePUOXeAkJ6+T
         AxYnYvEsYBHKrLhLDkrpwCvANbczeWhtdOsgXxJHjK3xed9+6O24CulEVdfYwkwHDL9o
         L31Pdu+caGB0/4B4wCQ0NiMimpU+KSMyR8/ZRqOgbEwC2qhNw1amXuIXYlI1/ugKLIs7
         OQlOyuIsxwphfOJsawL3XQ0yTeVchhM8UCMUxT+kSwOrcyAz5CP+gQT5Qtx8n0K3FDtu
         lFwpAnbPMxYNY3G4h+KqRN0TeKd1etQNd23Zh9WO36zCus/IMnG6W8oxH7B5tTSlw21L
         WPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705460076; x=1706064876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPwaFGwJVXA165SJk4N6+fNaFaLuOX6/L3PIB61yMHc=;
        b=BANZEmuFyAbeTyb+uqz99IOXxVcW/htx3NPCN52fdokjfVAPbu8HEdoPPQChE8cSxO
         VhqkXbBYz7CjvTXfTbUmG1hIXciy/UwwVaGQpDAkBWuvO/scsesxlx3hEV3uXy4kVkNx
         BI7jmEFIep3NpHqBEqn3o6MrIHyzk+CHsQKvBHyFyOG40h4KOa001p4QU+dpC0rCd+ej
         CfptiP01G2HscGXisd5JmSgjj0JyVlZZ5Le/2SZG7BLjIDA71cItvZ24wUWDG8RCWRpz
         /u2b+9Oaz9RXjLsddLJrq25nbSBVqpdYZtJ/Z2QEitH/bg/ANATJFm3CsXttFhuhkudo
         l3vA==
X-Gm-Message-State: AOJu0YzMYLjEOE3HHyPH3TQ5pAIqdonmoHa84ztCqR42r/3GYpRZy8yI
	Hrmbf77nNHNp4CA2iEiglki0DWGKuCg9OA==
X-Google-Smtp-Source: AGHT+IG2W5nPmvH97IYcBVmrar6/f8At+4QvMr2HN81HHi6oDtpjNgquXeD30yYSxkgGR4doQp09Mg==
X-Received: by 2002:a05:6358:6f97:b0:175:c1b8:1e93 with SMTP id s23-20020a0563586f9700b00175c1b81e93mr5383301rwn.65.1705460075911;
        Tue, 16 Jan 2024 18:54:35 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id rs3-20020a17090b2b8300b0028ceafb9124sm12553531pjb.51.2024.01.16.18.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 18:54:35 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 16 Jan 2024 18:54:29 -0800
Subject: [PATCH v8 2/2] documentation: Document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
MIME-Version: 1.0
Message-Id: <20240116-fencei-v8-2-43a42134f021@rivosinc.com>
References: <20240116-fencei-v8-0-43a42134f021@rivosinc.com>
In-Reply-To: <20240116-fencei-v8-0-43a42134f021@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705460071; l=4373;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=W93XdAKoPAXGIl+AWcM9T4XvazvSTl8o1IPN58ULAuE=;
 b=mbioW8hvb+fc9oAM1jsn3rFvzBIpUD5yFkmi25h07vFpa3+q1T19t+fxT6l+efMBjrYBI1ITp
 tzlAD9RklowD4E8uQqqmi0BM0GIZPSycHn6ejOQ4/T4iiEDD5FG76Ug
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_185538_588389_FB9153DF 
X-CRM114-Status: GOOD (  20.13  )
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
