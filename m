Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B77E7718B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 11:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I8mCXOEhoAkkTwvTMZVSvC6sgQ/jZRVJcLn/S1+2b+0=; b=WBQ9BeCjtkWbfH
	v+T6s31qzE8TZHyh0N+6F0GpdGxe6SH7FFtrj+XYt/qA59tK2lPDqpAydkTReSQFyVIfiqcDTxENE
	KecRdS0aNCJOBn/zJjNOVIC8LF4rGL0JXPGZAJij6K5EuzqtEnhGTRyK/O2oapJkKMoALjPUdwaH6
	EtIoxSJeqBgjgftxHdbU6D3ilsH4yfXdA8bP5EiDr5eOhG8DSkfLMO65LLuvyjfguYQsBVQAPlKco
	3sGdqm8PTqHrCEVTTDsbJrEDdlHjhgr0cXFhsUUYkUwnvm7oS4C6bR6Zs54fxrb74vXPSkG1uQ5yy
	krho3LopV4ult3XDmPQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgGI-00000009qJI-0z7y;
	Mon, 23 Dec 2024 11:06:10 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPezW-00000009gq7-0HwA
	for linux-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 09:44:47 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-725abf74334so3354387b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Dec 2024 01:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947085; x=1735551885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
        b=FE452Oqusb0rgBr6YngBczaIZtEjQK09AFdFZIxckz6Xr+PLf+KBXxu4GjmlQdbcD5
         MnwMxLVk8A2O13eLCuT1rD6LzHnfa3icb5t2bHmQ7jaU6XeqImTR+arkQ6Gma9oZBIpZ
         PyBLtSj0xITvtIpAszE8FkLmnqBtcaLkygNZ6f3KU9X3tXXbdKxMfCmUvVAsBZ7JrcX9
         jSRBaoz8CWnotjj2fOpzzV9r+RTVSguntC/dC44O+E2ceeTEoex2Ds9n8bruAdbfo9hX
         ItgWksMMWSENZmlPmTGXxggqUFfLoOF895Sj+FSe1cHC8wR9Mv/6RhCTVy686hB/8mqg
         NV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947085; x=1735551885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
        b=S0ZPDmgvUP0WuBs6te8HrbMe4tlK9Bl9eXY9GlCj4nubBQipaf7GFN5tsRwdtjAKe5
         ykNaAs4Sb4jR9LfNoh3Bqcb3p3Q2WxoiG7EU1MaJoh0cSWhaw4613p12oqhExGIr5h39
         kx8JvpexZHQ7HuExggYbBo0tH0lqDuiCaZofgD91oL59lahnAeXFPV1r3cOM+A2RWcEj
         /m7NS3f0jmYM/+djpOFWENKi0ceHL6xzjcKmnMm50cYA02mEEldAkN/aLbGxmtDFYnlS
         GHRqTWilLgk+AGTt8+SWxMnPda0ZnaTkaMts3mPPvL1p6rU7oU1nJZefl7ullHya7H3U
         o4Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXMOFr+Fedor517gmsyEfmRZ/ym+P7DPstlzlFb/BSwtrksZYKIHU2CaTcu8hkQcjxUdfPsCAh1LG3d2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwS+uIwyCsL+CtpPRnEL2i9wc0VuUtTp0YpGffnV8sgpJnMJvd+
	BQ4iL+a1o+UPwQFD/f7QHOv8LZduz/Gqd8CGidf0KqHFD5iyb3j2QlFzTZzITOU=
X-Gm-Gg: ASbGncs0cvYEwn8cSe/+0qBjjClSFMYoFFlFcneGL/rr9qP8QNi9XKeiTvKLC0is4Tu
	NaUfqvJwlUGIo3/Sy6jk08Dyg4L3VXebXborfMSCp8O5AwJ6eLGJDnln51tGe/0oSVK+pd6cZY1
	OWszgrodoZIRvHquarQOrWgYDFAaPfleDgSxIoIcogr6x4tqCvAWbBl0rgtuc/gWaoXHBoWigs9
	Gy+LemmGAS9fmvwbpK5vJ2wzsoCOo7psYF3Sm+vPU7VXrA1+qlLP5B9PnXDvlpK+dPx/dzDkTuN
	Rs9h42YdCztjNvib4RpxlA==
X-Google-Smtp-Source: AGHT+IEwnxNRxjpY566VNLJW6lRIrSoOOApqv/9DKS3yUbVNE+/391+nOnqyFIwO+T3gR5XgQach6A==
X-Received: by 2002:a05:6a00:330b:b0:728:e382:5f14 with SMTP id d2e1a72fcca58-72abdd7bae3mr14443469b3a.9.1734947085429;
        Mon, 23 Dec 2024 01:44:45 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:44:45 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 08/17] arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Mon, 23 Dec 2024 17:40:54 +0800
Message-Id: <955162bfbbcd9fbb3b074e1fe2aef4f64b61d6f9.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_014446_165131_77DC2A7E 
X-CRM114-Status: GOOD (  10.11  )
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

Move pagetable_dtor() to __tlb_remove_table(), so that ptlock and page
table pages can be freed together (regardless of whether RCU is used).
This prevents the use-after-free problem where the ptlock is freed
immediately but the page table pages is freed later via RCU.

Page tables shouldn't have swap cache, so use pagetable_free() instead of
free_page_and_swap_cache() to free page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/include/asm/tlb.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index ef79bf1e8563f..264ab635e807a 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -26,12 +26,14 @@
 
 #else /* !CONFIG_MMU */
 
-#include <linux/swap.h>
 #include <asm/tlbflush.h>
 
 static inline void __tlb_remove_table(void *_table)
 {
-	free_page_and_swap_cache((struct page *)_table);
+	struct ptdesc *ptdesc = (struct ptdesc *)_table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 #include <asm-generic/tlb.h>
@@ -41,8 +43,6 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
-	pagetable_dtor(ptdesc);
-
 #ifndef CONFIG_ARM_LPAE
 	/*
 	 * With the classic ARM MMU, a pte page has two corresponding pmd
@@ -61,7 +61,6 @@ __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
 #ifdef CONFIG_ARM_LPAE
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 #endif
 }
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
