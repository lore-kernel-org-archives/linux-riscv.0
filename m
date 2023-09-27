Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6075DE80ABD
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 22:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4QCzbFiWSd02N/E8n4Y1U37X+zWhl1C4WTVMhM3vNLw=; b=GT+qFSAw/9f1zQ7o/xF3+gEOnM
	jjlOEWfboEI91qvzuCzbQyQCa5JMxLiv0WVxCv+VO3qSBXxOwfnB+w3FL5ixpRr250HpTOi4RHs9e
	BxjbhezAclDpgcsjbUtoCVi8/8Xsn8Rt/L+6tKRjX7yvX69V7eWdgQ6Z/nQAbCyQcmu91ioP0o22n
	ROn7hFlI96p6LgYtbDAEcYGQlINRohcXx4o3W+tJwTdJ7eTHskhEFVuAGkBLE6PZZpuo8P+uYjmPO
	Ut+7JsNt0jR2ldt1943Q6ySRwhFjv/yJbFcco3Ku/MfrP2oC6SMHt23NaeCJBSm6gE/hMHQL9D2Ra
	irelRsKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qldKR-001s6s-37;
	Wed, 27 Sep 2023 22:48:23 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qldKH-001s1G-1e
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 22:48:16 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1c456e605easo164299095ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 15:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695854892; x=1696459692; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6h9NlhRD8hF3JGpC0yj7VRjIJqQSgsUALXY/NiPb6h0=;
        b=PkVRADM4fpJaIpMTg3/B+XpkU2/sbqoWBJxjj9Bq8nmudwG8bn/RxviCp42XJQ0Ke9
         68Zdl8CrgrJTj97Zvy2gjXkNLCOroi4Fqi2NzpO5VbtxDOxvXCBNxeied2pqjEM7Qh2f
         BXqV4mB0LXL+/paozTvt5U9uBoo6PgzbbKSV+wqZZybVqn6YNS2yxwxY3ccMRgt/wcs3
         15+ebjMxw12rfZFvoCfb42OYo5M0uBGGjwvQucJBdsp08vvNITinuZA+rkchODHjSjI4
         hbHBMGbdUAfFsYroGJ4FfSNBqx1wB3E7i4LSxXPo6uLtx05VbYZSY3gdFIaVkXLsk4z4
         IvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695854892; x=1696459692;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6h9NlhRD8hF3JGpC0yj7VRjIJqQSgsUALXY/NiPb6h0=;
        b=VUxuO1QbZmnBcNbjHHUffzgJehj2ReiF7zzRC5dg9CmM6Q7GFUsJ5rRhnCi1iVn7zz
         t8hqceAL+CKH1/ZG/mDl9qTHhxWdYKUkb75kVYb48eSQF5SD/a79+kWLTP6JWUSXxIGq
         zx+YHqsIFc6Lazlb4tzDHUyqbdnQ/Dy8qWiMMzLFUUaO+yUIDoRYYqliYZQf/LSYCnGy
         EVqMPJG6dMVEFZlMNr8vsipi05WkPFS/tazCoOwTTLbLqIbBCa09dA+j4MbIB5R3TtBC
         Pt86mxe+Bl4/Nk5ouC9JqQS9Jsxcs3JUgu5b4qvwfArwPaArBOx81dj+UtbCmjNJss3U
         +36A==
X-Gm-Message-State: AOJu0Yz51TZl1zGlgZjzExpLW5WGvbGk1BZ5m3HenZ1BZDnoa/fzXzFW
	gPATcopEC7W1lSkLfLciffp3Nzjhv42vAAu/yeY=
X-Google-Smtp-Source: AGHT+IHK+0biBPVWxcHovzaXWOtINj3uMRtfg9f7R8EmqXuweOi238eHtIUJiD/eg0+vD4plv8qwETomHuFNs3pZDjQ=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:903:2350:b0:1c6:d25:8750 with
 SMTP id c16-20020a170903235000b001c60d258750mr47383plh.10.1695854892186; Wed,
 27 Sep 2023 15:48:12 -0700 (PDT)
Date: Wed, 27 Sep 2023 22:48:04 +0000
In-Reply-To: <20230927224757.1154247-8-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230927224757.1154247-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2082; i=samitolvanen@google.com;
 h=from:subject; bh=4N5TA1RYsqEG6l9M0xplln+cBa1Qt0iz0MCbO5csiTU=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBlFLEdbuqhUGRkvHlpnRFoLVngxWUbGDzCKHZjB
 gXmrezGpZuJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZRSxHQAKCRBMtfaEi7xW
 7uL3C/9V/COsf71wMsf8LAD8PbXFSUssu/Ulme80Bc+IvZbku+VH0yCAi+0as+ACJEpRsTnNbIQ
 pScn4vacTqNH+5w4IriZtrxed/+JlJlJ3oFsv2kgI5IxJP44McljBfgT1GRyGCHurDabqPsJYX5
 TaGUz9a7+gFF6iVgMLHb9uNWunfwjDU0mlECp6rp+occD5rm4k0XsmhUdYYDNB2N7vwL4ar7t7Y
 bRUrWcDXIDTzByGd1qZFeUPJ4XRuZmExIhm3XrLYrmbZvkYIH6oKzVv5knn9MHzzjsjfdiVDoME
 e2Bibk2Mj6F9ABYdpfXOcVNTMcGMZtsjvwmAv9Qx3j7PwTa5naJ0np9PriPDIM2jsshK4hOOa65
 Z+fMEcQII52/5PTX5HX9sXBqn/ly0o9tU3LTzbR4GGVs6W1Rzk4Yoden9lVz+2Ti9QdMMMmqjSM hvdcZcYO8OTXRXZtW4dNPx1A4wMY6pfJadi3BaYatIPrJyHzova74Yk95MQNhaBqyh0DU=
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Message-ID: <20230927224757.1154247-14-samitolvanen@google.com>
Subject: [PATCH v4 6/6] lkdtm: Fix CFI_BACKWARD on RISC-V
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Clement Leger <cleger@rivosinc.com>, Guo Ren <guoren@kernel.org>, 
	Deepak Gupta <debug@rivosinc.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_154813_548748_3EF220ED 
X-CRM114-Status: GOOD (  12.31  )
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
Acked-by: Kees Cook <keescook@chromium.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
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
2.42.0.515.g380fc7ccd1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
