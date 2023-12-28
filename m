Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A95C46CD2
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 01:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OAODXOoTLJhg30C8tES2e743C+uR1XjAJGmru4h9vE=; b=dcY9002bPDFxkJ
	NnDMt3xxfihDbuSYxkniSb/Ks6TvWNF85Rfb8yoKu4oruHTGxTgWQdPTrEneNa+UDA/Fxe0Cb6QnA
	Tx7u03S4zGbI2o7EA8jjeWI4lOG5MV1oPbSXc8/Ia5A2i1wQXMbCXU1SLukhMYhtiGnt3ntL9QNgY
	VENs/1gC//HupqzpfTxXtfEPjXxlbyIqud0kXYNoodP3nzYKQ35D4W3DqURgeby8S8Pgo5okjbpig
	vaEokf0qhgs5l4kYtalACRPLTGhhK60CKvo71OISB2OYZLUFXIjmeDQm4e3K7vDSBTsZ98j+tYEv9
	WiZlhXgjox5/tUr/IF+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfQL-00FsEd-2T;
	Thu, 28 Dec 2023 01:43:01 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfPq-00Frl8-17
	for linux-riscv@lists.infradead.org;
	Thu, 28 Dec 2023 01:42:35 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6d099d316a8so5281250b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Dec 2023 17:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727749; x=1704332549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoxXzLgzl7b5Y0xu5pjyo/VkU/XWb+SGTLxU4jp8p0k=;
        b=GA/tc7IjAyFghIieVC+U49MfxLFh3eIKyL5paoLOzcgVoVQ5jm24RY7u1h6iMeyHfJ
         Eac4KXM7rS9B9iiiS5bRBQm0j97oL8iI+UUBAkjBWJUcx+hpMUcmudMMGipsEQUiOrDV
         WoZV0hX2hOP3DR4eqXr6s5U3OwopwT60WaG2sAJTQr1asgnU1hgEW1N6ve5h9+HTHV8s
         RL6YP+xmpX2B1qPPuSxzTQvuW/36Qn2B73oGVsFgYuGB6jNcwefvQPkAehcPDcnnfYoD
         5Ya+BL3EZ2EgpcREKARBdNRuNgZK+FlgxZuEogiU1wo6JJkK4VdchF5BZhO+n0lYLxmn
         QapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727749; x=1704332549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoxXzLgzl7b5Y0xu5pjyo/VkU/XWb+SGTLxU4jp8p0k=;
        b=A9Qv/zCtbwi05S/tX0R/NXMVVCrDZn42s9CK+xTeMsG/XE9/0X5QoFW6+MRRXn4W9D
         6+eTVO8PSMYsBKmjeYXXYIgj6EMKArKmr+CrIR/eZrFh5YxqKEwJPUZhxT76pUaQmrYn
         DCNf02653wcXoYQnWW29frSzkXzEqhOqRqIWOeFl51oN08/n+qM7m8tAi1fX7oeKqQ50
         sDkOZbYmijwczMONITJWaqKu5H7flqYq2/ytcmojjbITt5JjOLAQGhrLwNG8CWpEyE2K
         G/jqOdDJ3J5rV32J8qCn43RT9iiV3AA2cI9UL1mFOhRvZVetsi7iMF/c0d1+7gTbTybp
         7pdQ==
X-Gm-Message-State: AOJu0Yw+DaFuWtCdsjEeJ/1SVvDiyw0UZALV9jHML6YZSIB7VpPR6+bE
	0KneZacENrtjPXCOzQkK16PelwnsUAbOxw==
X-Google-Smtp-Source: AGHT+IFXwothAr5BJIcCMrRvq4/mKzewsdDIu4/j3geKR8xiDFkrXQfFhz/93Qk1mZI7uGYnkNSdng==
X-Received: by 2002:a05:6a00:4c81:b0:6d9:bc67:82a with SMTP id eb1-20020a056a004c8100b006d9bc67082amr5349494pfb.54.1703727748958;
        Wed, 27 Dec 2023 17:42:28 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:28 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-arch@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 05/14] arm64: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Wed, 27 Dec 2023 17:41:55 -0800
Message-ID: <20231228014220.3562640-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231228014220.3562640-1-samuel.holland@sifive.com>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_174230_420893_475B59CE 
X-CRM114-Status: UNSURE (   8.99  )
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

Now that CC_FLAGS_FPU is exported and can be used anywhere in the source
tree, use it instead of duplicating the flags here.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 arch/arm64/lib/Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 29490be2546b..13e6a2829116 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -7,10 +7,8 @@ lib-y		:= clear_user.o delay.o copy_from_user.o		\
 
 ifeq ($(CONFIG_KERNEL_MODE_NEON), y)
 obj-$(CONFIG_XOR_BLOCKS)	+= xor-neon.o
-CFLAGS_REMOVE_xor-neon.o	+= -mgeneral-regs-only
-CFLAGS_xor-neon.o		+= -ffreestanding
-# Enable <arm_neon.h>
-CFLAGS_xor-neon.o		+= -isystem $(shell $(CC) -print-file-name=include)
+CFLAGS_xor-neon.o		+= $(CC_FLAGS_FPU)
+CFLAGS_REMOVE_xor-neon.o	+= $(CC_FLAGS_NO_FPU)
 endif
 
 lib-$(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) += uaccess_flushcache.o
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
