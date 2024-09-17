Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9E2CAC583
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 15:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iaVx/bA2D81o1hBolahiIZqhmhWFBlWVlbXr/ROatuY=; b=dJFkm7oPaZSa8/
	/FK7e28hC731lK4dhLp0/ZAkVCMwfxCwj6fBY62jA85w4UGcnRQ4AwFEJDFNlzIUGhsXYxrY0YLr9
	Gdhdjt+QjD4gIuaj3M8cRkRU/Qwbwl1Dn7vCKBuGBCi6Liv0bzA17rc7oTgnRZSswXTjkIEYpWh31
	OxpkntukLWmPBzrmq2N98eQicidSJmcJbmvxqosYV5iBcsXci7OBJ2KiPaHr45cODyexhQV+xV6/U
	+7SzgPyD1q/3El+ELKbwpXFFJmJo0ddoYqLl/pN5UsqEBSxHysPAbrIFviKbuV3ABNNrUhptpMcnM
	9Egqq3B9uWxWRCB0o+Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZjt-00000006M97-1JlW;
	Tue, 17 Sep 2024 15:03:37 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZjp-00000006M8I-1YyH
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 15:03:35 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42cb9a0c300so49686745e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Sep 2024 08:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726585411; x=1727190211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ND6eYc2e5z5r+zC7yHLZpkb+5DC0X9uw7m7bHoeXpy8=;
        b=eBoA8ueL+07sc44Kt8g1n6OJGR9nK9JD9R5LhBUKn7aT4kCikoyIFDOOF57FyTiCh+
         PLMiW9MEpuFEc09qgHP/FfTW93EdVO073jnduX4pWmeW2ulVakOFi0Z4MPyQpTWesj9j
         qM/fVydxOHv6TbAJON2C321nbGOIEywtMMywJeFf8CsMOrqkjUMictsyluAMSFNdwbgF
         2qj+3RIay20wNh3+PKhO8la5VGM0xf02Fmz/49c6WQwhSJ0d93iP2wqT5htD1sNZEy8Q
         j2pPvg7XCSD+ZArW+wfJ4llDwTvmRCj+J2MwN+mwDKiS4i8r9pXcTEIEJs+3efllIUIL
         sQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726585411; x=1727190211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ND6eYc2e5z5r+zC7yHLZpkb+5DC0X9uw7m7bHoeXpy8=;
        b=J33rV4dUK/e6QdUfE0zQSEMoOwPhHXR4gxltWrJGrSJQIzLgclf8c/EJld/Eo0KMMV
         kyo3fKXN9wcab4+aQwL6fsulPmFB4V5W2K0m7mMrfEAIq15/zCRpCbqa10UNxYijhhvm
         Xs1k823g6T9Hxhz+LFX/Cgz4Lw7xVYjZjdRTo5FR6BetRU5JVodjQ6OJ/o2pzMz1F68i
         IxUVLSCwA86UyKp7LO+rQyio4dNnKdAzS3b9sDhkPxEWeX+QQteWZJz9lN12Rc1rOPk8
         Cmg1dTQOs41mj99Gf+7/eB8tkl0bTMToIW8XBmo4shK+3UbzuD+Z4BjR5eiyZP6vXz+p
         WdNw==
X-Forwarded-Encrypted: i=1; AJvYcCXESm3KS/QFVOhOuVi5E1lCZM8TG5idvZ0GxBRiCJ5LawnGG0Qs+6W5s+pOeNBP/x3ZKza6WfrYBjMNbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBaxjzTTJcvy0VHm44NVHcS2eNu5+tSyoQtAAiw1oVmF8wQ/bc
	LroAMj8g8Pu1ozVjmC7wnMvWL2afQR1SIQ132wnyCsl7aJtilKocj9QXgpOvNuE=
X-Google-Smtp-Source: AGHT+IFcVadBxh+qAbSCLQDPMzD1mmtwUDKphd/cCXTI/LhLVwku41hzZL7m/dPisydjMBeLLD04ig==
X-Received: by 2002:a05:600c:1e10:b0:42c:bd27:4c12 with SMTP id 5b1f17b1804b1-42cdb522cf7mr148867315e9.10.1726585410790;
        Tue, 17 Sep 2024 08:03:30 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (83-65-76-156.static.upcbusiness.at. [83.65.76.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e73e81a5sm9812770f8f.34.2024.09.17.08.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 08:03:30 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	syzbot+ba9eac24453387a9d502@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH -fixes] riscv: Fix kernel stack size when KASAN is enabled
Date: Tue, 17 Sep 2024 17:03:28 +0200
Message-Id: <20240917150328.59831-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_080333_713908_ED0A4816 
X-CRM114-Status: GOOD (  11.89  )
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

We use Kconfig to select the kernel stack size, doubling the default
size if KASAN is enabled.

But that actually only works if KASAN is selected from the beginning,
meaning that if KASAN config is added later (for example using
menuconfig), CONFIG_THREAD_SIZE_ORDER won't be updated, keeping the
default size, which is not enough for KASAN as reported in [1].

So fix this by moving the logic to compute the right kernel stack into a
header.

Fixes: a7555f6b62e7 ("riscv: stack: Add config of thread stack size")
Reported-by: syzbot+ba9eac24453387a9d502@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/000000000000eb301906222aadc2@google.com/ [1]
Cc: stable@vger.kernel.org
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig                   | 3 +--
 arch/riscv/include/asm/thread_info.h | 7 ++++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ccbfd28f4982..b65846d02622 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -759,8 +759,7 @@ config IRQ_STACKS
 config THREAD_SIZE_ORDER
 	int "Kernel stack size (in power-of-two numbers of page size)" if VMAP_STACK && EXPERT
 	range 0 4
-	default 1 if 32BIT && !KASAN
-	default 3 if 64BIT && KASAN
+	default 1 if 32BIT
 	default 2
 	help
 	  Specify the Pages of thread stack size (from 4KB to 64KB), which also
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index fca5c6be2b81..385b43211a71 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -13,7 +13,12 @@
 #include <linux/sizes.h>
 
 /* thread information allocation */
-#define THREAD_SIZE_ORDER	CONFIG_THREAD_SIZE_ORDER
+#ifdef CONFIG_KASAN
+#define KASAN_STACK_ORDER	1
+#else
+#define KASAN_STACK_ORDER	0
+#endif
+#define THREAD_SIZE_ORDER	(CONFIG_THREAD_SIZE_ORDER + KASAN_STACK_ORDER)
 #define THREAD_SIZE		(PAGE_SIZE << THREAD_SIZE_ORDER)
 
 /*
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
