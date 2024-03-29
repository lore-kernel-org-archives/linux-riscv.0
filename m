Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F78BC6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 08:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X62HD2IsDqEhtaayq2vN663+Jjm/qIO7E9oa/l9zRgs=; b=xjhjujcIFBvMLC
	4YeOEVTEYbh11Axsc0XvrJpc11sri5OeVa5vwJXn9jxiI0fvNVBJcOFYAnK0Wpx3yysFOPgMw7Wb0
	o8N6g9v3r9gW5qleGAfeOJui3ZpVMx8u8tXUoeAj1zUQs1aHp2DEz8hg+tvqOrEUVsuYkwKuDXi1g
	he5Yjw3vF7Pi3Q2FJoMLTeDe1XMAX58F3pmldq/zuVfKQZZJmW3k8jXWm6ZHSGG7qdDpYfasFtIo3
	wCF7jRZXtWCRjwYnZGnkPQ3K+njShQO+jraW4o7ZTGMFFzTGMDmhwYqVsG4DRO/YBkJ6LwvSAKngo
	ncUOqBQ9ZNcjJ3qnmykA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq7ge-0000000HKbb-01li;
	Fri, 29 Mar 2024 08:34:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6bh-0000000H8dc-1ge3
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 07:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XqbtCYy6rKAgoCWJo/IDkaQi4Zmy7pvo/Tw1FadjoIk=; b=DHteTzr/cpo4FraJvto4HkwTni
	dmA12eZYwSimBivP9W/Ddk01pGJEAjoapwES0chNUg8b6D9+VVplvi7RKyQWXCr+Ksd1lLFZB1N2O
	CZ52ExDeFjP3DqA8jbYiT/U+7f5ezmk5U718m6E4bzLnOgta8/LgPUhq6agf1YRv35ERUJZ3vViit
	Xkwo4GxquvNv4lMMvyfMvsw4mvotzXUh7Qx2NJXKbpflEX9RhFyTyojY8Lpc4ov+j2EXTLqa9sZtk
	i9jxY9UNgishN6++aPDiluO0f/S9yu+Xa718jtZqOzDsRFqX5DBcQD7fVsHcUqFda8+Xx4PVJh4Zg
	s4qtGSHA==;
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6bd-00000001QqK-3Jrx
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 07:24:55 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5cf2d73a183so1983425a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 00:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697091; x=1712301891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqbtCYy6rKAgoCWJo/IDkaQi4Zmy7pvo/Tw1FadjoIk=;
        b=Y2cRgk3iJTomtqVF1uFgqfsQ0epoTyaftYxyUOb5GKjp0rHXxTyd5jy2Hh7nAjH4ti
         ENpWLUtJ92sINnNRvoMVhBNK5+VJG1XfsHkOhLb2gW29+AnBsaClllhXYYM2zA6zuCuh
         upXgP9d362eNPNnyUUHZKRCjTIIg6dAOICq0fQO77l4kOq6E55WcytXRUGVVYRIJ1hwi
         2wMse3/QaL2CQq4eiefqOh4+sfzfKefUWevgFmk66TcEMOGjxGUMUvTK9DzyoxAggO/P
         iAjoZqxrJjd2MZnWWgDz9xCz47mHCfLOc4xe6AQ6MsaibMUALeRWmc8JlykwF0NbRX3J
         JwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697091; x=1712301891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XqbtCYy6rKAgoCWJo/IDkaQi4Zmy7pvo/Tw1FadjoIk=;
        b=J5a2ivh1dcgNMRfEcBCFdlBDxgLNRDr1eUVJSEXOyFpr4pH4bxf8vncwUCR/OMegbZ
         XNuniQ3e54+NkNRsd1P9NbIYDdNX1CK0Ljw6MQZP/1aGJUz9UY1fr7EEs+3zq9Fm/MY2
         1tqn9Xi6wJ6mfwp8DtrYHHonOTA5B6r+F7C94jX777z5B1Maf82QFvJORdKot6V+OZdq
         oBZlaNICh7ys2OM7rnfbPOUvQaEYsk6f8g7nH33DtxMFLmTkXbO+MMMJ/fHUkUvwA+pf
         upqkZ+YEC+lXxwKivHaECnBswDv02AiggPzjcoxRLeVP8WzHU4zLa4jc19u1LUCGZppB
         +Vrg==
X-Forwarded-Encrypted: i=1; AJvYcCV/rPbvflXPWMtKMpT8ErN4ZrmCHh7xO3qNC2eRVQWJrk3c5pHMkGFDOVCYo1ziNzbL/5lAnUAyuufgb0HGop3T5HACF7E+I3PIAQwku+09
X-Gm-Message-State: AOJu0YzLQ3SsE25zScrObR3471e9IiCJj2694tKS8JgszymPHsOxBkVp
	GhSRF+7clD1sa4gjYGmDfvvxrnKxnRu7WwCNjmEODLCioEbXwPZotGlPQWaa6Xs=
X-Google-Smtp-Source: AGHT+IFpgVY+di4cvDttsjDdGENlsS7ZbuG0wU7DGKwYbCO2yCZHbkcZgR0Ijs83aSucHtPBLyzxXQ==
X-Received: by 2002:a17:90a:d588:b0:2a0:3b1d:7c5 with SMTP id v8-20020a17090ad58800b002a03b1d07c5mr6633406pju.3.1711697091135;
        Fri, 29 Mar 2024 00:24:51 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:50 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>,
	loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 06/15] lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Fri, 29 Mar 2024 00:18:21 -0700
Message-ID: <20240329072441.591471-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329072441.591471-1-samuel.holland@sifive.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_072454_057656_5F584E45 
X-CRM114-Status: GOOD (  10.48  )
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

Now that CC_FLAGS_FPU is exported and can be used anywhere in the source
tree, use it instead of duplicating the flags here.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v4:
 - Add missed CFLAGS changes for recov_neon_inner.c
   (fixes arm build failures)

 lib/raid6/Makefile | 33 ++++++++++-----------------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
index 385a94aa0b99..0e88bfe6445b 100644
--- a/lib/raid6/Makefile
+++ b/lib/raid6/Makefile
@@ -33,25 +33,6 @@ CFLAGS_REMOVE_vpermxor8.o += -msoft-float
 endif
 endif
 
-# The GCC option -ffreestanding is required in order to compile code containing
-# ARM/NEON intrinsics in a non C99-compliant environment (such as the kernel)
-ifeq ($(CONFIG_KERNEL_MODE_NEON),y)
-NEON_FLAGS := -ffreestanding
-# Enable <arm_neon.h>
-NEON_FLAGS += -isystem $(shell $(CC) -print-file-name=include)
-ifeq ($(ARCH),arm)
-NEON_FLAGS += -march=armv7-a -mfloat-abi=softfp -mfpu=neon
-endif
-CFLAGS_recov_neon_inner.o += $(NEON_FLAGS)
-ifeq ($(ARCH),arm64)
-CFLAGS_REMOVE_recov_neon_inner.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon1.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon2.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon4.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon8.o += -mgeneral-regs-only
-endif
-endif
-
 quiet_cmd_unroll = UNROLL  $@
       cmd_unroll = $(AWK) -v N=$* -f $(srctree)/$(src)/unroll.awk < $< > $@
 
@@ -75,10 +56,16 @@ targets += vpermxor1.c vpermxor2.c vpermxor4.c vpermxor8.c
 $(obj)/vpermxor%.c: $(src)/vpermxor.uc $(src)/unroll.awk FORCE
 	$(call if_changed,unroll)
 
-CFLAGS_neon1.o += $(NEON_FLAGS)
-CFLAGS_neon2.o += $(NEON_FLAGS)
-CFLAGS_neon4.o += $(NEON_FLAGS)
-CFLAGS_neon8.o += $(NEON_FLAGS)
+CFLAGS_neon1.o += $(CC_FLAGS_FPU)
+CFLAGS_neon2.o += $(CC_FLAGS_FPU)
+CFLAGS_neon4.o += $(CC_FLAGS_FPU)
+CFLAGS_neon8.o += $(CC_FLAGS_FPU)
+CFLAGS_recov_neon_inner.o += $(CC_FLAGS_FPU)
+CFLAGS_REMOVE_neon1.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_neon2.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_neon4.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_neon8.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_recov_neon_inner.o += $(CC_FLAGS_NO_FPU)
 targets += neon1.c neon2.c neon4.c neon8.c
 $(obj)/neon%.c: $(src)/neon.uc $(src)/unroll.awk FORCE
 	$(call if_changed,unroll)
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
