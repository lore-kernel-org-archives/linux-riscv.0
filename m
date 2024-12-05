Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C250E77170
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 10:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tGON1NteLGDVWP516gtVCgFhnyyC+09X4HTwA+SV1Ck=; b=yze6NxXr1vJ/ko
	CgA9EGx/uFZueEJgzwzg0knp/HjV1Im+swiodkojYh6IrrE4kEU38fvDjIjB+onapamzl+ZjhAPSq
	7Lo84r584JTVaaQRMMI0VFJCYXUTozcwiofyoydRRcrO0MbY4x+WVm8YGZR/eYcPZgsw7IcBBfGBT
	hyg4BOPI5nBrxeK9N43KY6gz3KRlvG5qIoPOnXPrdnn04eqnuxxQjiiVSRifrzez5P5Rhl23NtQGZ
	KPns/MIecNLRERECaCahjy2wfzDiUSerWwqX4zNhR9GibbmowjMIv5eBmifpDvfJM4JZbQSRIR4Jk
	+B2tMSAxdeTKQ9VvbPhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Ll-0000000FaMX-3mcx;
	Thu, 05 Dec 2024 10:44:49 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Ew-0000000FXx8-2LiG
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 10:37:47 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7253bc4d25eso622038b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 02:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733395063; x=1733999863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWkBqx6Qlg0tee9JR/yzxG5KwDs2r7O63kRKnpevvpY=;
        b=HAsGr5IoCMGD/VTpFNANpzIu8y41Y7EDWOr2dcDRtyuwImM9w8pSfgUkq+KYW46efD
         bgkZoQZ3XmMiYRpXNUOPoi2rePAPl/IEhflmOQgL5CXqUx/0k6qXHVEUjoFXvFjbbfNh
         KZ2tSeXppstidxG1lTHWqxQO8pHLptwVwDd3wQvTRb2NVyLP6qjQtbKmNvPnMr5NIMIx
         z6WBev0EjXDt+Sq+bIR7hu8dFMrDHaoNndtW8K+9yWPpkVZOrXB5q/4kGZ2lHGLQbSug
         iJpNlbYUznrBf91V+6dDMnMTPzYETDPPGSLtwNJoRU84JI2RYK3mZuJzD44hmq6Q5LhN
         5gaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395063; x=1733999863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWkBqx6Qlg0tee9JR/yzxG5KwDs2r7O63kRKnpevvpY=;
        b=MRjR1ohrybl/28QIyRJO+88yMaQayi/D6rpGofH+Tx/Lg5vyy3O0Dk3W8Q3imGkrki
         V4GPokGR97nQnBnu5bp/0llnU6OirE9YQG9M68l7jPhaRfHIVdH/FrQGNbf3D3cTmnam
         DsSiv7NwzvH8y3FaaK2PAbpSduy7/7W1KC5L5wWbZEfPo+j1rf3E63EnS4nHYLlxvNBW
         3xizoZcLw+jpO9XB0uOmRhey2exaFSlCsx+sntQjWqMLuyxog+uaqmlF4zJOSg64G1Hh
         lDUSnNuLarY/kWpjzddXyqFDxyzwqbQPJs8Xx1U8S/k977DI2T39OIhsaCMXnU7Gykxk
         YWwA==
X-Forwarded-Encrypted: i=1; AJvYcCUJiIHZPJGgzgwHupec33pVe1J+7n9ZsZ4G1t8ojN8JzicUJy2qkx3uEHZwjKiauMr8JkrGAAtCOPCIQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5YUvAseq7RB7lZiHfGAX0v75JLD8OXlexs/UBnEaRppMlQ3k7
	ob0AdE39ZdmVpzJc1AEkGq+7OSVBKOGD4d7asAfDUf8aGidc6hfNy5ELMhKKTRw=
X-Gm-Gg: ASbGncsoZglZ2vwLaLao7ZFiInCdPcLYpoF/AjCq1nmxCsh6BmwVJp1mCtxvJiinI/0
	LHqeFF2sn94rya0m/smrOKrz/ulOM8hsn1S9M9/1V5FjCATLUSTtI9G3z2Sccn0wdJrCACdPGFQ
	IUBqKXtRSpfPgMhNeiWjEAbE9Uj07wlxufJctvk7fPOG+0yQN6p6DNj4ndXgQkBuWyMgyrrB2Xt
	hcEg3fce9quW/hiexTYbLpGweciYFgvARXOhMlfzn7DxG2+/z+C4glRoI23DUFmcgUvsbSNjxTC
	KUvh+05ViLqQx1KFnRhs6j/6m7K+r0jj
X-Google-Smtp-Source: AGHT+IEvp+5QW/iv1/V1tpDVHfeo0s8LNYsKCxdjWx85NP0irBg++mJLHUVM5oudhxdOyXEvXSVVbg==
X-Received: by 2002:a17:902:e00c:b0:215:7136:f7e3 with SMTP id d9443c01a7336-215f3ce4f83mr33803375ad.19.1733395062764;
        Thu, 05 Dec 2024 02:37:42 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156f048csm886826a12.39.2024.12.05.02.37.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Dec 2024 02:37:42 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v2 01/21] riscv: mm: Distinguish hardware base page and software base page
Date: Thu,  5 Dec 2024 18:37:09 +0800
Message-Id: <20241205103729.14798-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241205103729.14798-1-luxu.kernel@bytedance.com>
References: <20241205103729.14798-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023746_595882_1E359ED0 
X-CRM114-Status: GOOD (  15.99  )
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

The key idea to implement larger base page based on MMU that only
supports 4K page is to decouple the MMU page from the software page in
view of kernel mm. In contrary to software page, we denote the MMU page
as hardware page.

To decouple these two kinds of pages, we should manage, allocate and map
memory at a granularity of software page, which is exactly what existing
mm code does. The page table operations, however, should configure page
table entries at a granularity of hardware page, which is the
responsibility of arch code.

This commit introduces the concept of hardware base page for RISCV.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/Kconfig                    | 10 ++++++++++
 arch/riscv/include/asm/page.h         |  7 +++++++
 arch/riscv/include/asm/pgtable-32.h   |  5 +++--
 arch/riscv/include/asm/pgtable-64.h   |  5 +++--
 arch/riscv/include/asm/pgtable-bits.h |  3 ++-
 arch/riscv/include/asm/pgtable.h      |  1 +
 6 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index fa8f2da87a0a..2c0cb175a92a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -289,6 +289,16 @@ config PAGE_OFFSET
 	default 0xc0000000 if 32BIT
 	default 0xff60000000000000 if 64BIT
 
+config RISCV_HW_PAGE_SHIFT
+	int
+	default 12
+
+config RISCV_USE_SW_PAGE
+	bool
+	depends on 64BIT
+	depends on RISCV_HW_PAGE_SHIFT != PAGE_SHIFT
+	default n
+
 config KASAN_SHADOW_OFFSET
 	hex
 	depends on KASAN_GENERIC
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 32d308a3355f..7c581a3e057b 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -12,6 +12,10 @@
 #include <linux/pfn.h>
 #include <linux/const.h>
 
+#define HW_PAGE_SHIFT	CONFIG_RISCV_HW_PAGE_SHIFT
+#define HW_PAGE_SIZE	(_AC(1, UL) << HW_PAGE_SHIFT)
+#define HW_PAGE_MASK	(~(HW_PAGE_SIZE - 1))
+
 #define PAGE_SHIFT	CONFIG_PAGE_SHIFT
 #define PAGE_SIZE	(_AC(1, UL) << PAGE_SHIFT)
 #define PAGE_MASK	(~(PAGE_SIZE - 1))
@@ -185,6 +189,9 @@ extern phys_addr_t __phys_addr_symbol(unsigned long x);
 #define __pa(x)		__virt_to_phys((unsigned long)(x))
 #define __va(x)		((void *)__pa_to_va_nodebug((phys_addr_t)(x)))
 
+#define pfn_to_hwpfn(pfn)	(pfn << (PAGE_SHIFT - HW_PAGE_SHIFT))
+#define hwpfn_to_pfn(hwpfn)	(hwpfn >> (PAGE_SHIFT - HW_PAGE_SHIFT))
+
 #define phys_to_pfn(phys)	(PFN_DOWN(phys))
 #define pfn_to_phys(pfn)	(PFN_PHYS(pfn))
 
diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
index 00f3369570a8..159a668c3dd8 100644
--- a/arch/riscv/include/asm/pgtable-32.h
+++ b/arch/riscv/include/asm/pgtable-32.h
@@ -20,9 +20,10 @@
 /*
  * rv32 PTE format:
  * | XLEN-1  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
- *       PFN      reserved for SW   D   A   G   U   X   W   R   V
+ *     HW_PFN     reserved for SW   D   A   G   U   X   W   R   V
  */
-#define _PAGE_PFN_MASK  GENMASK(31, 10)
+#define _PAGE_HW_PFN_MASK	GENMASK(31, 10)
+#define _PAGE_PFN_MASK		GENMASK(31, (10 + PAGE_SHIFT - HW_PAGE_SHIFT))
 
 #define _PAGE_NOCACHE		0
 #define _PAGE_IO		0
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 0897dd99ab8d..963aa4be9eed 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -72,9 +72,10 @@ typedef struct {
 /*
  * rv64 PTE format:
  * | 63 | 62 61 | 60 54 | 53  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
- *   N      MT     RSV    PFN      reserved for SW   D   A   G   U   X   W   R   V
+ *   N      MT     RSV    HW_PFN   reserved for SW   D   A   G   U   X   W   R   V
  */
-#define _PAGE_PFN_MASK  GENMASK(53, 10)
+#define _PAGE_HW_PFN_MASK	GENMASK(53, 10)
+#define _PAGE_PFN_MASK		GENMASK(53, (10 + PAGE_SHIFT - HW_PAGE_SHIFT))
 
 /*
  * [63] Svnapot definitions:
diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
index a8f5205cea54..e5bb6a805505 100644
--- a/arch/riscv/include/asm/pgtable-bits.h
+++ b/arch/riscv/include/asm/pgtable-bits.h
@@ -31,7 +31,8 @@
 /* Used for swap PTEs only. */
 #define _PAGE_SWP_EXCLUSIVE _PAGE_ACCESSED
 
-#define _PAGE_PFN_SHIFT 10
+#define _PAGE_HWPFN_SHIFT	10
+#define _PAGE_PFN_SHIFT		(_PAGE_HWPFN_SHIFT + (PAGE_SHIFT - HW_PAGE_SHIFT))
 
 /*
  * when all of R/W/X are zero, the PTE is a pointer to the next level
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index e79f15293492..9d6d0ff86c76 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -114,6 +114,7 @@
 #include <linux/mm_types.h>
 #include <asm/compat.h>
 
+#define __page_val_to_hwpfn(_val)  (((_val) & _PAGE_HW_PFN_MASK) >> _PAGE_HWPFN_SHIFT)
 #define __page_val_to_pfn(_val)  (((_val) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT)
 
 #ifdef CONFIG_64BIT
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
