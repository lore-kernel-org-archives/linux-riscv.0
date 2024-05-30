Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE69DC27C44
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 00:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tLXSsJWuktqYgPa12cNBNiNBHik0fD0bEB1WY4sxOlE=; b=n57djEgM29hyg6
	OQrGJpBnuy9/IW3+9P7aDG0rTqxJJ//q4AByZ+EUEcHNdmIDzqsz5PxLqVCgPuSjeechtyIgRYrPn
	2Dkxf6Z7A5wdbhdsLQGDLIzWNblCZ4CXxxzJ6lce91tK7UvAiKoYOGvPpagqZ6rL/ZzZbHHmrAJD2
	TsZju2ReOrNwG/3b0JIbEYtvYVc7w6SG1Z8HcSF/yZbg90BAsHsml2eioxgoawQD5nt7FX0zT6zfc
	mc7YsJuxxwrZ6MpkQ/s5pfKyjou2uQ3cLn7NBJDBqu5jL6a3JBUhN5/1jd2cRwZZr4xPJacRPbhqI
	4ay9Dx8INDPx9e72i9YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCTUG-00000005s2L-1RV8;
	Thu, 30 May 2024 00:17:44 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCTUA-00000005s0P-2olZ
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 00:17:39 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2c1a5913777so268471a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 17:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1717028257; x=1717633057; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQ03pSwu03IPlBKbH+1bfFOAbPC/t45t8cr4rrzecao=;
        b=nm8eA5rmYr1V9qS4GOZ49IsD795Gs8H/lbc+2zx8yih9oW6Pzi01JhzHkwCJ1uu3Z/
         OCNTf5f/ls/jfan2R2jdI3nKdGqgYNWdtYP5wZWuc138UVWZh/jYAdWG9xUrdvHik/8O
         edNSEcjYo107aRyKUUFuJqDWGW62ZLYM+lC9aWnjuOUv/U+BIM8phW3pRXhQnn1I0lTv
         YOAK1KxaN+QJL04iYoYPihfLP7poGGO8OnpnSTLfgfBHOTcZXxIQFgBznibNHkE5uXG7
         0KxyB9nZLMPFBemlczcU5eaRy+a8ZDVVhNrfeWThV7lwxc3+XWFO4mpFqNH3jMvQiTp4
         KBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717028257; x=1717633057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQ03pSwu03IPlBKbH+1bfFOAbPC/t45t8cr4rrzecao=;
        b=TCd0FNxEZ7ByngGl+wj6KYIH2a7Ab14D+7MU993rgEv87g6Hq/MT4+WECvMtQ83Hvi
         4hMKTS9Ta0faCsJXM3FZOj27pd1wPVGoEuBe+tncBo2qgUFU1J+ShRRfYiGwODXTQwk7
         tCuO6qGaTJOqH5outwJPNC4D6kevZf/23rwfFslTFq/mlLPyD2WbzQvR2PqmI7rNzYxO
         Dc0gBBKn4FAzQXq0g3wYgBIc3UwgUGSGzLBeFmDiJ4tWjJOJIykX326jeYgPlwK+z1Ax
         ogygvKfBH6QtF+g5XnqSulbUtXJX7D3KI/jmTZIx8WZjjEiq6j8E+XylOuDyntUpbIts
         5ReA==
X-Forwarded-Encrypted: i=1; AJvYcCVcYee9r1RYv98mJRKYKM/gFtLcgZqRwyMnNQHYMmzNxeZ5KuYHFQ08aQJd8+/ZDkhhjCTNMqTZhDsbfCGHom2R9zg3Z6T9Xmp3nxzPhECJ
X-Gm-Message-State: AOJu0YyhvqeaZsgR7MwzBx5VcnCCHXuuTePJgUvQBYV8sLppbE3r3CIu
	j0bDWALw/iyd8NMKxh/v0qXucUaHhkFnkck0XIO7bzwZUVGjB1UThsKYXYXXk1E=
X-Google-Smtp-Source: AGHT+IFV4do0wB/tiDJFQA9Xx1T77rhYSpTqSbv/IzD31/94h2G5nVcdYUOmAGTE5Nch160EFNVFmA==
X-Received: by 2002:a17:90b:3905:b0:2bd:f968:da46 with SMTP id 98e67ed59e1d1-2c1abb02cf4mr633039a91.27.1717028257563;
        Wed, 29 May 2024 17:17:37 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a776e206sm432171a91.20.2024.05.29.17.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 17:17:37 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel@vger.kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	linux-riscv@lists.infradead.org,
	Matthew Bystrin <dev.mbstr@gmail.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 2/4] riscv: entry: Balance vector context nesting
Date: Wed, 29 May 2024 17:15:57 -0700
Message-ID: <20240530001733.1407654-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240530001733.1407654-1-samuel.holland@sifive.com>
References: <20240530001733.1407654-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_171738_730478_22D4DDDB 
X-CRM114-Status: GOOD (  10.85  )
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

Vector context management is the last thing done before jumping to C
code, so it should be the first thing done after returning from C code.
This also improves efficiency: riscv_v_context_nesting_end() clobbers
the saved value of the status CSR, so currently ret_from_exception()
must reload it. This is not necessary if riscv_v_context_nesting_end()
is called first.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/entry.S | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 4c5b22cb7381..d13d1aad7649 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -120,6 +120,11 @@ ASM_NOKPROBE(handle_exception)
  *  - ret_from_fork
  */
 SYM_CODE_START_NOALIGN(ret_from_exception)
+#ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
+	move a0, sp
+	call riscv_v_context_nesting_end
+#endif
+
 	REG_L s0, PT_STATUS(sp)
 #ifdef CONFIG_RISCV_M_MODE
 	/* the MPP value is too large to be used as an immediate arg for addi */
@@ -143,10 +148,6 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	 */
 	csrw CSR_SCRATCH, tp
 1:
-#ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
-	move a0, sp
-	call riscv_v_context_nesting_end
-#endif
 	REG_L a0, PT_STATUS(sp)
 	/*
 	 * The current load reservation is effectively part of the processor's
-- 
2.44.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
