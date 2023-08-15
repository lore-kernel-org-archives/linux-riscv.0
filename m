Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF9FC04E69
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 20:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PLiT581K0+Zch4mu877+m9RcyMYr+DKkEZljE+CZUJ0=; b=2W4Ga4tF0KuxL/z77/uvxAmJ6d
	ehlaRLLrw6UOevN1ijZavOY6M/agfWv4bHmbU0F94dG6waHR5rJ2MA9Dx0520WpuQS5T4oc/KlDqZ
	tf2yX5KXtA4EpnxwDK5BuLZkPtusF3WstJl7hfc5b7D4Uz7ihxYKWnX84uJRCoMevErprXCDlvrPF
	Bx7dL+S64+0a5a1crljEyGwZxgOxK0CRksxxtwOt4nuCtLK+cmghHvv7/f1BwMXxk8yo90pqaCpX8
	WQ3yWv9DH2WXWaj/BAkktbY6UWzbT+KFTfy4pftRA9qn+SmsXTnIOndTeBgDMr0JnfjzeVH+2AVbZ
	GrlkSHag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW0kp-002QSn-1p;
	Tue, 15 Aug 2023 20:35:03 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qW0kl-002QQM-2i
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 20:35:01 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-68843280241so1975723b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Aug 2023 13:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692131697; x=1692736497;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ykk2Dcm0sp1r3wFF3O+L+QDwz/a2RXVAzUE310xTCE=;
        b=c51n2/tJShODyeeUWChM6SNmOtBH4TwAB27gHlz0U2MW1KhJAFsJAI7HodLDVzEs2L
         h5EacJeK3yQ7xI1bDM7pS/8+NTTnu/pBkkf0mHnOLxusk130BgOMc3UgF/ILE4pTCv3b
         FoK/mdVbDTdzIm+PesccCvkjIraV3wLcVysrd2PMSHMHQsQbcViexWNnSAbHE6yrDtgT
         Mp+VyMCTaEctp9R1ryTin05vgD7DzxczuWzmHabxbBnipkxhOH1Z8NXKF+B+bk3ZWN2C
         pzEoTOjVu6w2TWjI1tCV+5ZHtdXlLljOrV5rvKK0dr/ZGKr7YBnabTma9ayXOLsdZ9cs
         ecvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692131697; x=1692736497;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ykk2Dcm0sp1r3wFF3O+L+QDwz/a2RXVAzUE310xTCE=;
        b=Z2B2I+bHR3mfpvjrNW38rPwgsr+zhl00aUCTfonVGFiEtfDPqxfItxv83qqNV+ylCa
         wUg8asrNAq5W9opOrB6JnTRkdg7QNf3WmP3slKYPsRrJNfk4lISeETQ52uuvqv/N9OzB
         CfcivkU16Mg+/+Xbs/qs+dF8idjGQU356C4ioUW706CEvHlcWgHQBbB3BRhHRY6I/pda
         6oQtd2p6qvdQy1ZTrHOJ02ekZlTPI13n97LFMe5JOmhMZQ4G2iCnZEbxbbsjnvKgspE4
         Bk0uw3rHUgICTkWTCSEgF45NbfppdXIL2Tu7/G/oP5YnMtX5lhijdpKy7kJ0gUOmfd5P
         YBZw==
X-Gm-Message-State: AOJu0Ywdx3cHBnuFsQFiYtH4AbPmZOsI9j7aahoFoOhV2yIhmLoqEDWq
	sOHq6ESa3YrfBbqk5YSqjLQpbFhOpAEFtB7oty0=
X-Google-Smtp-Source: AGHT+IFSPEKlQSmP4El45E8vBc0Epq9faMbNSeZpAP4jMdZu51DXHIvs320ofYVLaVzWyPCFTx03x5OLJ9JW1V1TgBQ=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:6a00:1a87:b0:674:1663:1270 with
 SMTP id e7-20020a056a001a8700b0067416631270mr6012423pfv.4.1692131697326; Tue,
 15 Aug 2023 13:34:57 -0700 (PDT)
Date: Tue, 15 Aug 2023 20:34:49 +0000
In-Reply-To: <20230815203442.1608773-8-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230815203442.1608773-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1987; i=samitolvanen@google.com;
 h=from:subject; bh=ki2ulz3S+Qkr8AIV7YWzX5sRx6qIOMgf7DcUTP9c/kA=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBk2+Fi+17Bq1AKxHm6SJ6quZHGmn+eubZLGDQWv
 bi76aScYZaJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZNvhYgAKCRBMtfaEi7xW
 7uDxC/4yeVJIZQGthB7VhCrB1mQ9aPlWa4zl/qPRC5GlncPWQV/MwLuo1ExhOVxQY1M+pu82F+m
 8PqQG33dyzALoBf1c1t0RJgk8hXrSg+on+5gsx856SahKsjV3+GpMyptJgjPEwnNHk+6wKMMK8A
 N/pPZs3mhzf+AhJROOGKLcZi1Ux1G5qizF4mL1TsJXLT2ky85P+u9iE+XnlUUOVj0o6+zdRc6E4
 T3hgbyVAvct21OxraGNq6gZ4hFfI1gD0Vzy9TsNhYvkKUv6h9A3mjyabLDgnWYIneyLL5Aw8hLM
 778p+uRcOJ4tKxAH+wveS7E7YVuTsPIR0MtZTeW4TlXWx284O7O/LdzF0u0artPihMYgdyyeXkT
 fbWExG0nGe0BC399mEX2b1gOK/3yeNpSy5DzlUGN+aTa7vNStcHxmPR4yr6Qlfw7uDrg4g305Ra AkJHJ/qsdN+6PCM8BiYrPK7icqJ3WmLfwFC54pjnKI93e+BJiBx3TlG5aczelxjKucC60=
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
Message-ID: <20230815203442.1608773-14-samitolvanen@google.com>
Subject: [PATCH v2 6/6] lkdtm: Fix CFI_BACKWARD on RISC-V
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Guo Ren <guoren@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_133459_915748_1F071491 
X-CRM114-Status: GOOD (  12.69  )
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

On RISC-V, the return address is before the current frame pointer,
unlike on most other architectures. Use the correct offset on RISC-V
to fix the CFI_BACKWARD test.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 drivers/misc/lkdtm/cfi.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/lkdtm/cfi.c b/drivers/misc/lkdtm/cfi.c
index fc28714ae3a6..6a33889d0902 100644
--- a/drivers/misc/lkdtm/cfi.c
+++ b/drivers/misc/lkdtm/cfi.c
@@ -68,12 +68,20 @@ static void lkdtm_CFI_FORWARD_PROTO(void)
 #define no_pac_addr(addr)      \
 	((__force __typeof__(addr))((uintptr_t)(addr) | PAGE_OFFSET))
 
+#ifdef CONFIG_RISCV
+/* https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-cc.adoc#frame-pointer-convention */
+#define FRAME_RA_OFFSET		(-1)
+#else
+#define FRAME_RA_OFFSET		1
+#endif
+
 /* The ultimate ROP gadget. */
 static noinline __no_ret_protection
 void set_return_addr_unchecked(unsigned long *expected, unsigned long *addr)
 {
 	/* Use of volatile is to make sure final write isn't seen as a dead store. */
-	unsigned long * volatile *ret_addr = (unsigned long **)__builtin_frame_address(0) + 1;
+	unsigned long * volatile *ret_addr =
+		(unsigned long **)__builtin_frame_address(0) + FRAME_RA_OFFSET;
 
 	/* Make sure we've found the right place on the stack before writing it. */
 	if (no_pac_addr(*ret_addr) == expected)
@@ -88,7 +96,8 @@ static noinline
 void set_return_addr(unsigned long *expected, unsigned long *addr)
 {
 	/* Use of volatile is to make sure final write isn't seen as a dead store. */
-	unsigned long * volatile *ret_addr = (unsigned long **)__builtin_frame_address(0) + 1;
+	unsigned long * volatile *ret_addr =
+		(unsigned long **)__builtin_frame_address(0) + FRAME_RA_OFFSET;
 
 	/* Make sure we've found the right place on the stack before writing it. */
 	if (no_pac_addr(*ret_addr) == expected)
-- 
2.41.0.694.ge786442a9b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
