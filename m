Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7BEC3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 08:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMfMV1B6/RR6U6/hGcS5frTwbOqlepHyIaPW2pdZWRM=; b=aEIKtDqgZEyfAU
	L6BnpFlghjbzcrZTtz2eAD+zB+FtvuS/slrhr9/jLqGGiB5ZunpYf8Z/VrL9guyYoVn4t3bIrTcmQ
	sGGzRfs3tftWR5gAK29R8/1FSb0AFZN72v4mR6PgJVnJNT0CgvyBK1wnWzLK0/uFvV9KgBDwXvA1b
	5cBo+UypKlnTtcoeRjnlaDE+Tv+3LUkprORW2SQDhq8O4725ssGSubj7s08QHiqZk1To6X2kbN+Ev
	5/mM8IpmFxbK8a2JWa3pSpFf455XGm+W+ieZ5mK6TkQPIJzFvYfz6bLUExsoAg163dmDpJKnWShmS
	fa/ASelYKK4T8URXZtLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9pz-00000006J2d-1vgW;
	Wed, 14 Aug 2024 08:58:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9o2-00000006IDL-3Z4W
	for linux-riscv@bombadil.infradead.org;
	Wed, 14 Aug 2024 08:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=q+LcB4MC6Qgfr9kzwjEWl/9KLwOZpaXC6CA7cxVGJTI=; b=KN5LzflrBaJ9GYiwhUZxej494k
	2302nnNLkdTOPr5+lPaF278IFyyaH/y3/7EOdBpgts5Lxw03DQUZYzX9LfD1gGr/zzPwGsjm+pxte
	4JgYz1XehqMhsRDD7qs/2UtRLyoifkpp3Plm1F5r23sPoq8xk9R26SaUULGUg/k3yGio8WY00tqUI
	QKO0x5BPJyWsKVF8h2Y5NywckB+hTILjXbZsJAy3HJ4IJmC+ET3hPw7LfgyWNFaJ190vBGdFnb+IC
	lvrBoYVsw6Jp/d2LefKwzR4u5/NU4aBeTSJo1yrcoxKykVLjWyqUCtA3oTOLtQ7RNgySsFAq/MgJb
	PszFHwuQ==;
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9ny-00000007zD2-3i7d
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 08:56:33 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7a103ac7be3so3953772a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 01:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723625787; x=1724230587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+LcB4MC6Qgfr9kzwjEWl/9KLwOZpaXC6CA7cxVGJTI=;
        b=YhSDj7gRNo1/FoN5CSeSwviOQxYfDKhu40XOpvup/HlXAz2IO8+8jrYrDbIN7tKX6H
         rZy0pG9o2SgpxDugw/bUeoEK/N+eLHdX4LAmlbrm3HFMcMbztaeZnPk4tWbTBNBUzhCg
         Ewa06QrC3e1XpEtmX2O45DPpPuEvizmqkvAAfk3pM5UtdNNquObl8MpKFYfsFv2EGbKJ
         s3rdSri5A7jGW+1FO/9kqIO5xEIr8MfiRNttwZscPAtJdJiIAhqnj+c/JjbRcj6Jw/jZ
         vvl3tDEsXj/vJUebG8U/IB//rzxqQ6SAxNy2ZWaHJV7IDiP+2/rYVlV4K5MCYMXERwvo
         qh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723625787; x=1724230587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+LcB4MC6Qgfr9kzwjEWl/9KLwOZpaXC6CA7cxVGJTI=;
        b=lFDKeepswcOIPnIVCHJ3Rt1rbvNr4Cv5+V72M+D0OVyRQgP2G+2z4UgH8UveqikzuJ
         esShS4sZs47PsNmD9PU2YHzxsiXATEKcB3MR1NkdTHP7AT7AcDBMWzv1nIF3EokVCShT
         LUn7uufNM+YgFZVYJQIRDs476vy7Uh8/WPP7/S/RQ0T52CRhLoAPPXStOL7SX/1d9aBV
         uTA9msncjy4T3T/8v65nFxYkHnCp4QDELMN7WJqMdvdKegHmFMetguuis9Ic2s7zl1VK
         83B29D+N/Qa0G55JbVb9xenddRPxbrWwxv+ysWtzsqmEvmQu7BajmImFqAVnx5BtifeC
         vSsw==
X-Forwarded-Encrypted: i=1; AJvYcCWw0ZFPbPkw3Rl5mq7vgtSPAPqXHmlM5p54m8zVD5FLBnxOVVfj9IoyEYk2niwSfJtC5kTN61mRhafLs0deYUE9bzb69XeoBoodsYquyYFo
X-Gm-Message-State: AOJu0Yz8fQh0P0HZxbuTYu3zgFKmXRc2S5EjC7T4EpuRTW0mhTAXSUpk
	S8Xhv7KRzUI00eOoYMe5g1iXckZKn+1rxUQauaJtKOh8r4J1sPY8MO/xJw4bx/0=
X-Google-Smtp-Source: AGHT+IHeop/4tDtqPSIvDLepGfrszpRVvQ8NysDbzpZjr3VmMUvS3QBFyPVJf7l/syUiJf9jHvayiw==
X-Received: by 2002:a05:6a20:c88b:b0:1c4:c879:b770 with SMTP id adf61e73a8af0-1c8eae8dd79mr2680167637.23.1723625787615;
        Wed, 14 Aug 2024 01:56:27 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd14a7b8sm25439615ad.100.2024.08.14.01.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:56:27 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Evgenii Stepanov <eugenis@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH 4/7] riscv: Do not rely on KASAN to define the memory layout
Date: Wed, 14 Aug 2024 01:55:32 -0700
Message-ID: <20240814085618.968833-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240814085618.968833-1-samuel.holland@sifive.com>
References: <20240814085618.968833-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_095631_193189_41E2EAB0 
X-CRM114-Status: GOOD (  16.32  )
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
index 8b698d9609e7..1667f1b05f5a 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1492,7 +1492,7 @@ static void __init preallocate_pgd_pages_range(unsigned long start, unsigned lon
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
