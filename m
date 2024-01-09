Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576D6C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 18:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJZJ3ynHkMaY25YRpkNfsom6a+SXBaG8GbRw3bMUJao=; b=CCO4HavinXRJCw
	LOxNzECxs9D96KfJBYKdIaTu8S/57c7e5RplPaxJelXrluSMcMZlBRtuL7XXLRyzQPXgpa7EegbA8
	zKWMUAtAqTkoP83SPiot95Ag/+3BbRnCkcMTTRyih2TM3WpBcCPcgm++oSmsnbnT7DGCy4R6Vk3Ml
	j5ayX6/ZzNocmHK5bf+qi9cD7QEkywMmZLkshEI0E2arWCZrb+PxGtW6EdSq6sAKXSXbbc+/6pUWi
	qnnAqd2QLHOz62CKpCeG/91N7u+aTjhS19CxnjJ4lXv6XLRW1A1lkaaNkDx2Q7xPXQrSRwyx3wJWB
	8zn5g78XLJRm8iSi88Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNH4b-009CGS-0O;
	Tue, 09 Jan 2024 18:43:37 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNH4V-009CE0-1U
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jan 2024 18:43:34 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-2041c292da8so1769987fac.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jan 2024 10:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704825810; x=1705430610; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1NNXG/cc6Ss9zFsC2xjmXCCDBeblJidGJDKM2XVVV0=;
        b=GiOhGIiLWs0axDrwd18tQMG2ygh4mAFOx2lnFyM6o8cYM+RBDYD5Q3/U4vY7sTCz8c
         iMmrzcumn1DA/KouCe/IeQpwMdchgEvFrEWe8+s01X8zFtS7oU51Mr8TWK9cKQY8pQOH
         TvNawRN42xZZCZnk1ZLRmaDaYhVwut7iVgTh0Gj0jbq0tD1IRM/y1w59UwHekByOhiKy
         TpXSG65m2MYIclKeXZxtKyI6DwvxxXqPcNYz5C7MZ1hg2BYsVQrMYJpdukTsqOI0hyyX
         pOsREvqsysGGb1tSmTaV0+TthQCwivUfUQiAkJ1gM0y9SuR4um5KZH/ZB/CJzs/2+3m3
         0SJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704825810; x=1705430610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1NNXG/cc6Ss9zFsC2xjmXCCDBeblJidGJDKM2XVVV0=;
        b=nKgwGJMuNQp/P9W/+WYweI5ZaY4Blca2BHnsU/CQhhr9AHbmmk4W5bxNutA24dQlab
         X22ict0rCmPZGF8R+aZJY5xbbmSA6WSMhL7RzO9iGGxU7dP/Tr0b2bZR3Mo0FtLKqtC/
         uH3nW+pWYE8+euLoYSreiaz3UBMVxWtZ1Kb4JMyRnTwlwl78MB5okuFdJrh8VLJMNVxr
         8xqRT1zCcfOCX5I9v0fITDiTFJuNXLfDOiaK/WvcpdNMNjFHae+ByVEadp0sZLinqTrp
         GC/e6vmn2Aj8lE92VrXTL8UwF3qirwGOhfw5v6OVMJ6UISpKmDc2FkxUGdj65I0S4jxL
         9U8A==
X-Gm-Message-State: AOJu0Ywu9dywFo8o1DtHkg2LK8SbcUPboNJXyz2kxwHyUczQsGLEjyBG
	9RSOvFtoXhOSVu8+AQoS8e54wWY9Q1qHmQ==
X-Google-Smtp-Source: AGHT+IGQlBFgMVz5mTuTuO8bTSRghm89zYg7Wg6yrGXtc9FJWyLD8udHcY6dup6zfxmsWGuwNK74iQ==
X-Received: by 2002:a05:6870:7884:b0:203:18e9:804a with SMTP id hc4-20020a056870788400b0020318e9804amr6057763oab.86.1704825810491;
        Tue, 09 Jan 2024 10:43:30 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id j2-20020a9d7682000000b006ce2c31dd9bsm450423otl.20.2024.01.09.10.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 10:43:30 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 09 Jan 2024 10:43:26 -0800
Subject: [PATCH v6 2/2] documentation: Document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
MIME-Version: 1.0
Message-Id: <20240109-fencei-v6-2-04116e51445c@rivosinc.com>
References: <20240109-fencei-v6-0-04116e51445c@rivosinc.com>
In-Reply-To: <20240109-fencei-v6-0-04116e51445c@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704825806; l=3808;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=ABgVzoDksDxj5OqFX0a7CWpy1eY9QNcsIJ1Zy7mwIys=;
 b=j5GVuprP0qn0h0qUpUY2k2ew7NlFi46kdG1k0oqIUc112oHNCCD9SA9tXCDEIg4X1qkZqh5ZH
 tINoTxCG7+yAyv173/RET8VuEsm9gqic+JA7gneMpiQeImMmqHv0Dot
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_104331_526970_DC667261 
X-CRM114-Status: GOOD (  17.69  )
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
index 000000000000..afd7086c222c
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
