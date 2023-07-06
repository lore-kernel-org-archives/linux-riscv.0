Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0198DEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 21:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mIn8cJn9qKXO5J/2+bSNUzqZ1Zsmk4zf9uoljaImA9c=; b=dh5o7UGPJVUFNt
	l+ziDiJsotsqAdN4p9lgqza328VGPUj5imEc6prot5UPVDxvV6LmopHIRDI0f2c9qmT8QN2NgWnVq
	ZpDB+e61ChdJcwZJc7br70mXm5LT9FMiiHyBWWK0U8EhlwwIvF5BvhD0Ecm3Qv9YJYy2G/pbhL3LO
	DqX7su3Ra9QprRJLiSUupj0c0Ss0swGHW8SW52DilDzmtLu0p/fIkhtQ3MUtmoC0tQVw9jV4Sb1bf
	f9RrPnaU6neQohEWLy63SAf8o2sgHzPzD2p5M3NW1iuwbo/enciD+zCxISl7FgZ7d9MY8pY8Fw9ka
	1fj3t3b/GZ/vxUuSNH8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHWAx-002g0R-1Y;
	Thu, 06 Jul 2023 21:06:07 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHWAq-002fzJ-2w
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 21:06:05 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6b8decf09e1so1079745a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 14:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688677560; x=1691269560;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFW/hpxSjw80S4/40VMtY9pVO+BHS0huPcSoKXyN6Sg=;
        b=bJ9IAljWSDUmVerBHC4K6sBauN/zDrHTC4ndE35taO5K0TdEBgRd4ELNGGgbp0D2iT
         S3oHzPVCEkuMx5Yc7QIFPgBEAhf4ilkY9FJLBf0PEf0M3L3Wo3gH1P3jnBlomRnx6oIX
         +hpVX2yfs3ahtMxc+H81BtoUj2+pjkE12ospBrGSucOwRaNaiRmT2Jf/4dZ/f4hOenhO
         zhZDw13iBNdBCE8YgtKI9ayAw+mOgBSGadolPlriEV1tWljWNHWqTZqGd9Qqj5CYpLIB
         CEtc+bMz3YdzDU1RidBzLxDe5RU6zEMMClWguDs5y7WIjmmyMlE5gl1EcOqtFHV0jry7
         sdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688677560; x=1691269560;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFW/hpxSjw80S4/40VMtY9pVO+BHS0huPcSoKXyN6Sg=;
        b=ZaxIAmKOf/tKJWF80BL2nXFUJHHic9TobwHm2AJXdRVffwtWki90npRtIiUhNjsYjQ
         AL1qN+gLAS7CPwb1HNDDqRUkkyoIF2pOeRpWklROH58cD7Bl7vkjyY9KRKK1a1COic4e
         wU9j66dewJaDSuHVPPjy1tqwF/KauFKknXAlxxxfD9z9iJesaRGT+WlWVb8I3xnqyGQj
         M9nmkRsZz6idFHSNgIcbNm4hJrvxWSRJg4T84lf96iUwRY7ws1Q+frH85aAq/EhqwMdL
         l5O+nwueNO5TIvCKyeyD03POCzWZqth/CtUFcJQeEw5OqErjSRDLKhWzcAZHpdZSvWq1
         S+Ig==
X-Gm-Message-State: ABy/qLZbmICtgf4fxbFlSRNpQvTpodh91V2hmYqiLhrtEznGz4rA3atw
	xJ2gIUctpCsa22+NlDVL8Hwk8WuOO78AS4h53Nk=
X-Google-Smtp-Source: APBJJlE6h71AT2opmL7lNN7grV9TBSkjmTyWA+tiRzjx5CWr0wRpyfoG4FhEde6/jgC65ZjyG1N/eg==
X-Received: by 2002:a05:6808:1a29:b0:3a0:663d:fd18 with SMTP id bk41-20020a0568081a2900b003a0663dfd18mr2971060oib.57.1688677559783;
        Thu, 06 Jul 2023 14:05:59 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id f5-20020aa782c5000000b00666d7ef2310sm1715817pfn.94.2023.07.06.14.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 14:05:59 -0700 (PDT)
Subject: [PATCH] RISC-V: Re-alphabetize Kconfig
Date: Thu,  6 Jul 2023 14:04:57 -0700
Message-Id: <20230706210457.12618-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_140601_191503_4FC7FB15 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

Looks like I missed a few of these, I just stumbled on these again due
to a merge conflict.

Fixes: f32b4b467ebd ("RISC-V: enable dynamic ftrace for RV32I")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/Kconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index b49793cf34eb..6553cc6c0858 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -105,9 +105,15 @@ config RISCV
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS if MMU
+	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && (CLANG_SUPPORTS_DYNAMIC_FTRACE || GCC_SUPPORTS_DYNAMIC_FTRACE)
+	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_EBPF_JIT if MMU
+	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_FUNCTION_ERROR_INJECTION
+	select HAVE_FUNCTION_GRAPH_TRACER
+	select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
+	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
 	select HAVE_GCC_PLUGINS
 	select HAVE_GENERIC_VDSO if MMU && 64BIT
 	select HAVE_IRQ_TIME_ACCOUNTING
@@ -148,12 +154,6 @@ config RISCV
 	select TRACE_IRQFLAGS_SUPPORT
 	select UACCESS_MEMCPY if !MMU
 	select ZONE_DMA32 if 64BIT
-	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && (CLANG_SUPPORTS_DYNAMIC_FTRACE || GCC_SUPPORTS_DYNAMIC_FTRACE)
-	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
-	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
-	select HAVE_FUNCTION_GRAPH_TRACER
-	select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
-	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
 
 config CLANG_SUPPORTS_DYNAMIC_FTRACE
 	def_bool CC_IS_CLANG
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
