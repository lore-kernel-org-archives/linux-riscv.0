Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E195C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 20:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6jveSZWwD7rC4F+k53uJ0JpqGn/f2gTXmeaEJLfC6sA=; b=zJBplogQMt6UOS
	PoEE4LB5bFEKB2qGJcNTwF5ad26xCckGqrApO0BO94yGEwL58d2cXYPP06fyQj7go3HSPYuF0KUJq
	29CkIBpfI0FcL/ZW1Aao6CAw79VMhXd+CaHUVgP6wsFjUz4w2kSUWRDkIY6v5WVUUSbci92fKz78z
	GAYAZzc/XGX6CtP+ADABMyeFwW9tkK6JG9Dc3+DnyaLARCljQL4I8MP8CaOdU8T2ksyESfl90i1kh
	LCCheMv+XozibCHrCrDLqb5lRkaiFPu3/hTTYKFX0KQJ8ucpe7XQVUv6bqIDQfSpqp03VV142RNnM
	IM/OWprUz73fMXX7pbig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZUp-0000000Av07-0Aby;
	Wed, 27 Mar 2024 20:03:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTV-0000000Au8A-3KhL
	for linux-riscv@bombadil.infradead.org;
	Wed, 27 Mar 2024 20:02:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=s9egB7QSoDAHRW6tgRYqVd+NUTiSQfL/JcKX7OjtD5w=; b=KnCIwVmJNh4MzLjXUKDjLgp/FV
	ixJQkTbUH386bYXx2n8j4UUkIA9krt3mpEo4/9iAJWtw250nlTco8DQBJ/RkG4vstknP4PlnYMEHO
	kRzFVsKBxL1BFLKypmrd0wT77K8oNfVwnvqAdBUXuoOe+/umL7i2/JhQGbJQ9jB+xIdhcd8mio88p
	CykhWwgaZr8F0FOhIfTQQ2SFzayJEYWKjGfbUkbSbtclaSERBrLk24eEOasPbuJJOBbCQ0MytxWxw
	sEuPxTzPGtl+O/V4yPErKAVrlW1h/1ujXG4Or6t8/2ZcBsZzpwJrjVSlfwn0auPBK4I6SNzLbJx2B
	dAIEGXhQ==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTL-00000000WpP-2wwi
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 20:02:16 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1e0bec01232so2083145ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 13:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569726; x=1712174526; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9egB7QSoDAHRW6tgRYqVd+NUTiSQfL/JcKX7OjtD5w=;
        b=LfzU3ozRbFRP4ITlpFuPz2PDvUynGm+eXPd+Ue7DJiQGrLnyyR7i7Gyv1wrO37+/hI
         3xyxbD88NNz+IJFeyrTtwyGXew+R9em3rvVM4TP7s+4c4yitns1P5VjPd1QmTNrPAC40
         HjkYarEOnxh95qyjBQig7FdpIIgNKBg9C4q5xZ7pJ5inGNM+mUsu4Jx9EwttkEc+ekca
         VVySnIGYrKnyX969p3OfsKUE+hWo1CzMbaUElOMDKLyHEa1HVx+fXvVJSmygS7ErrfQS
         OaQKpsZH3GLzjz99HdQswXMTx2Pb0mEJ8+qFg0+0usebcF7B4uU/rzbA59mJzn16cyHX
         sk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569726; x=1712174526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9egB7QSoDAHRW6tgRYqVd+NUTiSQfL/JcKX7OjtD5w=;
        b=vh9S0fnZP35k2vig4rjGjpyxVI4qnAhEtYx6gcALlUU4ROTk63zWfTuAsd9ez5vwDl
         n4sHaVgr2MwFZNwCxfA1db1XcH9sprpzAQh472SyBp1QJlIyFpaO+dp+2gXKr6A2Bmhy
         BC7KIrwX7xyKKVBcb6+ng/l+nTtL6h1SlNzJ8wJCVXCqGpPyT5JJY5+c5ajBG2iwRRz2
         qKrJP4oz9LR2HbOJOPyQ5l81W62PhTWkAVe2h3JmrYj7qfu4QbZp0cUsHJzfDN7ZDDOd
         KExaYKUG4wIr+A9W9gXHafgZQvqkNF02X9nC9BSyMsiKR7AQExf9BXjw4A6zTQVcWtao
         WndA==
X-Forwarded-Encrypted: i=1; AJvYcCUXSF2es27Gx6hn3NwpL99bemQYZ8fmky8+Hv+rMSSiaXLhLE2v3TWa4am9tifA3Ay1ENI4LUzDYg5gC2gXViR5Ha3hUGV6FbzUVACSfpg3
X-Gm-Message-State: AOJu0YxcmfJgstROlkmyJY12/D+9G+2aVZ6AEkdppmIjrkE2QID6DPq9
	KsxwmVufx7bfsQoAZ90/gTVkrJdeYj2jcH3k8+nZusRCkdPUaoIVPoL7L9vBFzI=
X-Google-Smtp-Source: AGHT+IFGHdi74bAZSMUCS5nBpcP7LI5Cfqz6VZFaIDx36rlYRojmLVaB4TIyZga5IdN5tuwaxR1nKA==
X-Received: by 2002:a17:903:2b05:b0:1dc:a605:5435 with SMTP id mc5-20020a1709032b0500b001dca6055435mr854470plb.31.1711569725718;
        Wed, 27 Mar 2024 13:02:05 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:05 -0700 (PDT)
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
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 05/14] arm64: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Wed, 27 Mar 2024 13:00:36 -0700
Message-ID: <20240327200157.1097089-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327200157.1097089-1-samuel.holland@sifive.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_200207_931039_C7F9A9E0 
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

(no changes since v2)

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
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
