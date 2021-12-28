Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF17BC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 22:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UD5aVOLtn0k73gHdf7v0nBoILe92QtcT9Ap/1srCG9I=; b=BE+IPXLQIUPNTf
	ys5zajQT0XZHgxPki2L+gMEtS4gkblLI4ritbGrUT2o1NsaFsI4msg9maBUAPkE1AhQh0l51pSJvF
	+pZy5xOUYS1uKvU00hDYkB7HLfG6XT9eR7PiqZMNkunMJbqODNicdzOoquB4sk3t1yKi5Sej5nOAq
	Pp+kcfGTQRkwnh1SDyf5zEpA/Q5S+LQvcVXH01dHqrxnIlE7kdUhBMfkCEmpYJCoGGw9l4I0aVmN1
	qzlZzk9lFzUZsV5ySFmrhwUo/YtTHJdGuRDsSuFs6izyQMvhKP0UZZfb2vA2KvT54jgFpoOhUOTSi
	Rx73mgCwoJlRCSARAjbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2L00-001vEh-A9; Tue, 28 Dec 2021 22:31:16 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Kzt-001vBO-Jc
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 22:31:10 +0000
Received: by mail-qt1-x82c.google.com with SMTP id j17so17411234qtx.2
 for <linux-riscv@lists.infradead.org>; Tue, 28 Dec 2021 14:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=idNLShUsD6dgb49w+b51oNxulzkea7QYVXGQuCs6fSs=;
 b=jGfirkUu5hGiXTfUDi6/ExxCJBLM++s+EpiJ8KmY65IodaVi9Eh5I6JNzL7RKO4gEJ
 gcmvWrTyYH5xqu7M3JGahHnp+2ZacX1J95Cq5Y8UNaxD0WVbPydOV0FhWkSI19ZwDvfL
 Cp5zHgKqOZEwFRt9l+SrkHajg4H4mosLUglbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=idNLShUsD6dgb49w+b51oNxulzkea7QYVXGQuCs6fSs=;
 b=t+BFsqK+FYaP+BPAiG9oA1D0NPXgH1N3whESV3rhK1+d0D/HT2GGMGxnf5yPJWU0JP
 tghqD9OVqNo9rGUmTYcWE5naeRlxFlhBHGj4/bmQLd0RfaPAGSGB4bOGPYtN7EVjOl9g
 7peEXIY0Z73j+IcesOPpczyxVYyqm2aLtomO51Z4Jl7k5O8Qb7EJnGNB9cWvMveQpq7z
 97cZUAn9w5a0+7tLOAh0A75pfVxHtBLOniUMaf05PyiZlbl/TcV/i8Y/4i2HCkzPTfD8
 SEOfhyvs+3PEjbLu/9Jhl41/0bxGSVOY8oQRyTPFU/hVcZzUzYt4Zi569Kh3XjD/msg+
 YX7Q==
X-Gm-Message-State: AOAM531JHeDy3vyibBjSDBHPcU60DMyf4dLaYvt6tiAQGkkNoimz7C++
 S6LFVfIomGj7yUWsCsKzMWWO
X-Google-Smtp-Source: ABdhPJwE4T7Ld3jX82lCGZygYuVQUkSt9d5BjPV22exhB7fPxs8bNTnjaJyzJLL1M0of00rmkHkNng==
X-Received: by 2002:a05:622a:144f:: with SMTP id
 v15mr20022324qtx.554.1640730668532; 
 Tue, 28 Dec 2021 14:31:08 -0800 (PST)
Received: from fedora.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id i5sm2738407qti.27.2021.12.28.14.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 14:31:08 -0800 (PST)
From: Atish Patra <atishp@atishpatra.org>
X-Google-Original-From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 4/6] RISC-V: Move the entire hart selection via lottery to
 SMP
Date: Tue, 28 Dec 2021 14:30:55 -0800
Message-Id: <20211228223057.2772727-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228223057.2772727-1-atishp@rivosinc.com>
References: <20211228223057.2772727-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_143109_673038_C9D626F1 
X-CRM114-Status: UNSURE (   9.76  )
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

The booting hart selection via lottery is only useful for SMP systems.
Moreover, the lottery selection is only necessary for systems using
spinwait booting method. It is better to keep the entire lottery
selection together so that it can be disabled in future.

Move the lottery selection code to under CONFIG_SMP.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/head.S | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 6f8e99eac6a1..9f16bfe9307e 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -264,8 +264,8 @@ pmp_done:
 	blt a0, t0, .Lgood_cores
 	tail .Lsecondary_park
 .Lgood_cores:
-#endif
 
+	/* The lottery system is only required for spinwait booting method */
 #ifndef CONFIG_XIP_KERNEL
 	/* Pick one hart to run the main boot sequence */
 	la a3, hart_lottery
@@ -284,6 +284,10 @@ pmp_done:
 	/* first time here if hart_lottery in RAM is not set */
 	beq t0, t1, .Lsecondary_start
 
+#endif /* CONFIG_XIP */
+#endif /* CONFIG_SMP */
+
+#ifdef CONFIG_XIP_KERNEL
 	la sp, _end + THREAD_SIZE
 	XIP_FIXUP_OFFSET sp
 	mv s0, a0
@@ -340,8 +344,8 @@ clear_bss_done:
 	call soc_early_init
 	tail start_kernel
 
-.Lsecondary_start:
 #ifdef CONFIG_SMP
+.Lsecondary_start:
 	/* Set trap vector to spin forever to help debug */
 	la a3, .Lsecondary_park
 	csrw CSR_TVEC, a3
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
