Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA50D17159
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 02:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KgRRVPaEwTbMYsRqJN7RUywLAbzv9QsnD6xeGuhf+1M=; b=UKoWN/Qo+vkpJl
	32xMOkSkdCB8bHAhFDYCjHROysfokkWSnJbbYKESEGgiivJQmDbv8PP7MNQEzxBGqeaBn+Rh9rt/H
	r6jh1N+UFoaTJRde/aTi5NaPdqMORV/NV5ZnfhgWUxhdJYO1Koxs6h0OOdzvFXiEmiU6a4vJ8UjkS
	MVv5VKfq2LWEjqHnFnsQJpD8N4W8BtI2tScSk2aj8gSdffo+WcbIcj7rwQApW82INSyn3Hc3tTpcV
	BHpZqgmHGAvvsLPCkCgi0NYyriaiEdfBrP6i5ab5dOKN0/q0TPTok4EnaKLEjzT8wg4eUpMwGqd+m
	cCwPDxr6p2pQwSRVnBVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t34Hj-00000009HXm-0BqR;
	Tue, 22 Oct 2024 02:06:11 +0000
Received: from mail-oo1-f47.google.com ([209.85.161.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t34BE-00000009FrF-2B9m
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 01:59:31 +0000
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5ebc22e6362so832261eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 18:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729562367; x=1730167167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOWNg37CI6wBNjlK3WTwIizp4MumcxiO1pDVtn3VcZ8=;
        b=ekj/O/m+TegZFBB9wzrogI7SheMvGKivaDHcESFVBLmbPcbNJV91/6CQqYseETVWJq
         aU0PwRV8+ATkJSkhadXaY89uQEYqTYs+TT7sV8kDIF9wyu7w9hYOzTcMEeizbnGbuQh/
         5CGsMOcaAPo/NAC+AWKnyAwJQtmL9RFwpT+M05qd6ifVe8qcwURWCDoHyEVfKewBBSVo
         o5fF4wh7QnO2QQS7qKGdFawxR5W8xFUDp2HquE+sBUQ0k+gyzB5JhyM9Z4hwYs0fohAp
         RhpiHlZZ8T1B19X2Hd3Eo2Fp3h1xM5+V4/N4SlLNzAbpOhlI5iTn2eRwtPoZZoJeGBEE
         WA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729562367; x=1730167167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOWNg37CI6wBNjlK3WTwIizp4MumcxiO1pDVtn3VcZ8=;
        b=Gqmkp6g95pGfhMHudLQ2D9atDHD6caZmRTc6O6OI8JrgUJFb2NiDSWZUWqEVsPomHu
         YRtcWKrsMgjZvooexBg4FwGDEn8dFVly1gEfMh2yz1j+rDtO3OQyC459V0TR79rOISQw
         /WWFoiltybqMOP120BWkhP11yBdXWxBJAeoooggm9/cvYFPh92LU0wbGtc+SdeLg7bKZ
         RJLHKAYzFnOJtpgR83LvOEGt1IcUdmm6L1p8dn58+vOd6+3EkQxtdniANp3074cFFoTW
         MZiuuuJLLkYHLElFr7DL02CGT55bjus9xn/QiGynv9DhiP7XZkAxFSplnwt0ZujRf5lR
         hUQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRa6yUjhhk7xXg+KdymnXkmS8dMW0fpb5A5iELuuuhYjQSU9+jVUsRXD6mEDL0jy1wJiJBOd/tvJE+bg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyA4umBa4oBZYUQRhtqSrI8Maym1lFpS+NGnUdI44Wi8RnOeR21
	Ku7XQ9c1kUAIW119ub+n1fjT0oaBgo9S/22Coa+S6n2VffmBxxJGktm9zbRBjXs=
X-Google-Smtp-Source: AGHT+IHErzREUGw6ROMLMvLXYHp4zadEF+Dwq950EYc2048lR/Pu3YsD3Bs92QVrt5aBEWQnl13Wpw==
X-Received: by 2002:a05:6871:109:b0:288:b220:a57e with SMTP id 586e51a60fabf-28cb0184ff2mr946194fac.40.1729562366823;
        Mon, 21 Oct 2024 18:59:26 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec132ffdcsm3600710b3a.46.2024.10.21.18.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 18:59:26 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com
Cc: llvm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 6/9] riscv: Do not rely on KASAN to define the memory layout
Date: Mon, 21 Oct 2024 18:57:14 -0700
Message-ID: <20241022015913.3524425-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241022015913.3524425-1-samuel.holland@sifive.com>
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_185928_683658_544BDD69 
X-CRM114-Status: GOOD (  16.58  )
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

Commit 66673099f734 ("riscv: mm: Pre-allocate vmemmap/direct map/kasan
PGD entries") used the start of the KASAN shadow memory region to
represent the end of the linear map, since the two memory regions were
immediately adjacent. This is no longer the case for Sv39; commit
5c8405d763dc ("riscv: Extend sv39 linear mapping max size to 128G")
introduced a 4 GiB hole between the regions. Introducing KASAN_SW_TAGS
will cut the size of the shadow memory region in half, creating an even
larger hole.

Avoid wasting PGD entries on this hole by using the size of the linear
map (KERN_VIRT_SIZE) to compute PAGE_END.

Since KASAN_SHADOW_START/KASAN_SHADOW_END are used inside an IS_ENABLED
block, it's not possible to completely hide the constants when KASAN is
disabled, so provide dummy definitions for that case.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/include/asm/kasan.h | 11 +++++++++--
 arch/riscv/mm/init.c           |  2 +-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
index e6a0071bdb56..a4e92ce9fa31 100644
--- a/arch/riscv/include/asm/kasan.h
+++ b/arch/riscv/include/asm/kasan.h
@@ -6,6 +6,8 @@
 
 #ifndef __ASSEMBLY__
 
+#ifdef CONFIG_KASAN
+
 /*
  * The following comment was copied from arm64:
  * KASAN_SHADOW_START: beginning of the kernel virtual addresses.
@@ -33,13 +35,18 @@
 #define KASAN_SHADOW_START	((KASAN_SHADOW_END - KASAN_SHADOW_SIZE) & PGDIR_MASK)
 #define KASAN_SHADOW_END	MODULES_LOWEST_VADDR
 
-#ifdef CONFIG_KASAN
 #define KASAN_SHADOW_OFFSET	_AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
 
 void kasan_init(void);
 asmlinkage void kasan_early_init(void);
 void kasan_swapper_init(void);
 
-#endif
+#else /* CONFIG_KASAN */
+
+#define KASAN_SHADOW_START	MODULES_LOWEST_VADDR
+#define KASAN_SHADOW_END	MODULES_LOWEST_VADDR
+
+#endif /* CONFIG_KASAN */
+
 #endif
 #endif /* __ASM_KASAN_H */
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0e8c20adcd98..1f9bb95c2169 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1494,7 +1494,7 @@ static void __init preallocate_pgd_pages_range(unsigned long start, unsigned lon
 	panic("Failed to pre-allocate %s pages for %s area\n", lvl, area);
 }
 
-#define PAGE_END KASAN_SHADOW_START
+#define PAGE_END (PAGE_OFFSET + KERN_VIRT_SIZE)
 
 void __init pgtable_cache_init(void)
 {
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
