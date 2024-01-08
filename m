Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB36C3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 06:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZZk5G7GQTkrnIODGbhMP9d2S+QU57YayqJ9FOUmIwg=; b=t6QQjHArYHq8Sp
	GQ6uSj2ZW7QIB3AvUfB4vBhWHMydreUgLh1uLuaSgGDwu642OPcO66eW99y7wk8ucxkT3EfnT6rV/
	McezNR8DwMfO8uf+3wgXCwAWQ4BdYQwSWA81Kk6SmemigNTD4rkOSfmHaFmXSn86uM4LXgsm1rDau
	fj/XingjVzcTzf89fkG7xkWZXpf9l+aVHVCO1UQIIwb1JjXVElG3cuXZn988gQybvyNr80On3fRf9
	oyuY2YaBaQWCGsNG63xWPUuo71cGpks69P3SLoiZEAqxwzpurBFi5afAFxYX05qEo9CDQfReTvxoe
	/E0RQtpLwAewDPAez9TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMj1I-0043aZ-1M;
	Mon, 08 Jan 2024 06:21:56 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMj1F-0043Yi-0X
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 06:21:55 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6dbcc5d78eeso1155087a34.3
        for <linux-riscv@lists.infradead.org>; Sun, 07 Jan 2024 22:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704694912; x=1705299712; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7zIxoN+SgU88Z6qGdoK7DlJzsgAjm+cXBEiUMLpGQcU=;
        b=0qBGrbaDIWGqLHRm1UmAjOmvUIN8FXvyrMD+nlP+QSFRWtYsn9D8wTaTEUwz0UmmeL
         Y2sRhgvD+9khuG56bKOfCSXqkJTP7uqq1WBm/jnbszlnHxyD9b0NhJJeB8s5/FLv2zGe
         gM6MihUOY44nw7ndsh2yzTF+oFkgBZqzQRMfX1x0kk4gXfYX+feRlx+Dokv8rsifggtu
         eGdLo8pnhLFU9znTDQxapkan9eIv54reVILp3sAtJ1NKYMLK4XN63/0hbeZviuB53Wgh
         5XMWrfHyzS+CbAaIofrjGLlcjf2UiV+zt5mAJncKVRkb10vCxtOnqjVCURmlVCbMjFKG
         XavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704694912; x=1705299712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zIxoN+SgU88Z6qGdoK7DlJzsgAjm+cXBEiUMLpGQcU=;
        b=rx8ylaC0ZU913d+AY3Va50RusAo7ib74rkuR+tncaRE5YDQtAliSpleW9ohNF90RJT
         BlFbOgvEyyv2CE/hprVGVvR4clzt2ZX9dXsMfBEYH4CMot032U5dmugB+7ASxkO39u1T
         5yScwAKfeGXJFmjHePvOLNElW4d9mrcSrhia9AFcN3TKsxIUsydAwDZYvKR3WbeUPJDs
         qKGapQ7LQ/8qjvtrOjYHim2BET+YEhTkHQmXr1JqsAW2a4+kQn2x+qp35Fh6GU7WJCev
         /ZfL6285rnkWEzHmbD1KlUIrFXmN3ekIGJkywv0Uxg/Evre8nUuuIwl+H3BXmPUsap2/
         3wMQ==
X-Gm-Message-State: AOJu0YyDdzLGA6fkiAMx0yYIXRKK4weR4iadlKbwmiwt8QlC+bUfwI2j
	BTxisqDLJZkdM8N/XSjfmjiKHRtApBXteQ==
X-Google-Smtp-Source: AGHT+IE2RD77UZkWItFT81fkRj5KkrLB/kBjCp/AJOn60PTjV5k/LNvDjNw8kS6q6TlbpgWCWHHmgw==
X-Received: by 2002:a9d:7a85:0:b0:6db:95ba:c422 with SMTP id l5-20020a9d7a85000000b006db95bac422mr2004194otn.41.1704694912539;
        Sun, 07 Jan 2024 22:21:52 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i12-20020a9d53cc000000b006dba99e1835sm1274322oth.4.2024.01.07.22.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 22:21:52 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sun, 07 Jan 2024 22:21:46 -0800
Subject: [PATCH v4 2/2] documentation: Document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
MIME-Version: 1.0
Message-Id: <20240107-fencei-v4-2-d4cf2fb905d3@rivosinc.com>
References: <20240107-fencei-v4-0-d4cf2fb905d3@rivosinc.com>
In-Reply-To: <20240107-fencei-v4-0-d4cf2fb905d3@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704694908; l=3764;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=somI31K4e1DNhLYi544ikiKSJVE5TPTc178CdwxSACE=;
 b=wOjyNp3Bafs5E4EAXPZDcY5CMZv7eGYP53YeKRTCExbTq0Ej9zlAWZ2834TSECygPHMj+NHYv
 9lX1K2SdI/4Dy5Tn8rFusqYzrPJcIbPyqyeQcXJdQVXSC5NuhF6Mkt6
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_222153_364392_B2976056 
X-CRM114-Status: GOOD (  17.37  )
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
 Documentation/arch/riscv/cmodx.rst | 88 ++++++++++++++++++++++++++++++++++++++
 Documentation/arch/riscv/index.rst |  1 +
 2 files changed, 89 insertions(+)

diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/riscv/cmodx.rst
new file mode 100644
index 000000000000..71598850e131
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
+(icache) is not guaranteed to be synchronized on RISC-V hardware. Therefore, the
+program must enforce its own synchronization with the unprivileged fence.i
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
+or use the ``PR_RISCV_SET_ICACHE_FLUSH_CTX`` prctl() and emit fence.i in
+userspace. The syscall performs a one-off icache flushing operation. The prctl
+changes the Linux ABI to allow userspace to emit icache flushing operations.
+
+1.  prctl() Interface
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
+		prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX_ON, PR_RISCV_CTX_SW_FENCEI, 0);
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
