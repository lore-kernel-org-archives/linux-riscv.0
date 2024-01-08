Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2360EC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 18:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBpZ8uDAqtKKfcAOedg4ZyABst1pbiyzF8NTxa1Zn8g=; b=B3zXrLuL373n+Y
	7adzSr/ebQwI1hP4Ee30J83hBsNvxeR6B3VI0RxX6jBe1ogoEs5ESHmAnC8RMfhnTKQMzHMoPqZf1
	R/eQ50D6sCj0HoyBI409M3uxqmdh5Is1Yw8zrRdW3RZmUIBF/tmY6ygMlvWwz3+64VHO5XAmqImIP
	pUpYsPkzKPGNAUElmoS1MLdBpLFgwT0EvayCa80ueMEucJYstbo6OhDLTpNygQuOCiVBP306qppnW
	2cnC8b5Zr+XuQJBdK4raxsEIYf0g9oE5TDNj9odwzaiQNvWLEkmaOku3pngLhjcQz5tX0lCXDLSWA
	kthUww3AlRCIOYGfPCjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMuaJ-005wDx-0E;
	Mon, 08 Jan 2024 18:42:51 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMuaF-005wA5-0R
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 18:42:48 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-205cdc4b2b8so1609673fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jan 2024 10:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704739361; x=1705344161; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lcesxSICs9qqjU3mn/6A1YTx2ZHWyVmXZ47Xf1Piv0E=;
        b=Vn+/BNBmsaXObAYWs2lGgaoRRqA4bGuuAzBMQTj9Aqm2kVWJLTdWy1SvqaMz/WZTVk
         xndmleD6Yix9HAt9cRMBrfA4IOyOfL+Yi426N1lFe+vpW7UHLSQuQ6dRKKdSFK4XkQ+c
         weAUv6tVy65kHTnYZb5E9bUyiQ80UKlCATGRqPhYEwRaWnrMMCBEPkW0lyRcQHEdP9y9
         ZTLJAkfz20/2rNIfDzLicRxyqH/EIBaTeXxTnrasIbUbgKmxTp15xGzYtiSc9sSXt0O9
         zqIEC9r+RlWez+wUHGzJqih9YfvM72cuzcF1FPmgWG6pUiLxTrTecwp/ZO4yIChAp3yp
         3yow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704739361; x=1705344161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcesxSICs9qqjU3mn/6A1YTx2ZHWyVmXZ47Xf1Piv0E=;
        b=DCzSdZqcJZAXCGEK9aRDj3d6WQm8Sxa4V6EffPkhZFvDu3t2WNqX3sRC9dRekXJn08
         FRGOVwm8sdCxLyGeV3OUUc3gYnyAmohnsdAGhSU5r2mmYRregfDPTXovpKvWrZSrk0+L
         b+46VBKoh58+1E39PxJDoX4iib9Yrcv+N59xOvn++iAaX09WKugIGAB04+6u0ivGQZol
         NiFolUZsK7d9u40kh5VCqrGMm/ZZf6RFseqw7CAObbfdJF8XmrThwuYLPhjEprEWpZAb
         Satjq4y3+yso758xpismBAU1KZU/st0YVLfS7CpYOZKrSXQAVEreDnH1b5F9d9MpTjTv
         GKEQ==
X-Gm-Message-State: AOJu0YxuYiBkKAJzAJm+ad5e8AZEaxpiGb+AiUwM70pSP25Y8TaRX2XT
	Oe+ggFzsKJu4KoyPM5x95qY6v0P+4H7+JA==
X-Google-Smtp-Source: AGHT+IHUfVeCnv4iKNZVjJjiJFF2rvptuznnQATx/D78AfBQ3DUmNpAnx4Mu8VUhkskBrWEn/uojFQ==
X-Received: by 2002:a05:6871:750f:b0:204:2c51:99a9 with SMTP id ny15-20020a056871750f00b002042c5199a9mr5736175oac.72.1704739361703;
        Mon, 08 Jan 2024 10:42:41 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id pp24-20020a0568709d1800b002044a0677adsm97860oab.8.2024.01.08.10.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 10:42:41 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 08 Jan 2024 10:42:30 -0800
Subject: [PATCH v5 2/2] documentation: Document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
MIME-Version: 1.0
Message-Id: <20240108-fencei-v5-2-aa1e51d7222f@rivosinc.com>
References: <20240108-fencei-v5-0-aa1e51d7222f@rivosinc.com>
In-Reply-To: <20240108-fencei-v5-0-aa1e51d7222f@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704739355; l=3760;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=OS05nIxwBZL4G2IIyGllNjNhS5yx7iCRPhXs7gfJa/I=;
 b=xGpIlJ7LWvsBwbp5/el5+9Vw7b/vKKgIwAwZ1naQ8EmRCK7fdaRW4B6EP2ncbP9SDglCunL43
 PdHrDoiKQJ7D1VgKO0b5I2TMy1Udfm+wfaDy5yuadv8GmlmMHhJARM7
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_104247_182535_8C97FE90 
X-CRM114-Status: GOOD (  17.64  )
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
