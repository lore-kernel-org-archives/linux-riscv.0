Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE88E7718B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 09:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HLtCsCM+J7vEXuSG+zOKc2i81pNQkcn/iYTgoK8rWu4=; b=wRGUdEidbNkwvl
	SOAR4iQVZxFuhO80eh7vjhzQBYRhW9+TicgcUPOrI4H5fphkgCxII8F3dNd1tfVO/v2gstzSj51vr
	YyonZiv6XnpRNxGVyxtfBV6q1ETILrdCL/gWLvkrwqdUBc0eldtsmOqa5FbLm1+QbqQ4EYWMujl8P
	9vbRVBbrWMlX3YYvkzaWnJ7LMF9HGjMisS9hQLDlnJHgX5X8RVxVcaItHkWoEWivmQbmEUriMiJPO
	5+/RgBVnyi515V+D3dn6r1pbdpzPeCds/EGoQJ7bNKBwesYnjirN4UN2tNsW63jQZMJUgR7vPjrmy
	rZZBqD0q15Xabr2dSMPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPf0O-00000009hJ1-2nbx;
	Mon, 23 Dec 2024 09:45:40 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPeyH-00000009g9m-2wLI
	for linux-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 09:43:31 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-728f28744c5so3822100b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Dec 2024 01:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947009; x=1735551809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/tJ15+vmer/NbqXoUznjybhQp/MgC6GOdT/GuQUXpM=;
        b=VY3XOzHwLvx6Xf7W1z+BGyRQXEuw2kIxzA6nwdtUvWhxV1/4eJWcv9c200FLpgIiRr
         yX587j8rvDds4waM/KQr8jLfs6Ywk1kwf6TVdec6zB+7hnK3DKDeDYSL0IQs5zJQXPBc
         ywWxVCi+uX+xpoLhp7kVlsqvJBeSkDRjMmfFm9QD52hKRiyQsj7buF8QCwBg5d7Q19pL
         15vGfuIVB9S63saaxU2AKg5KLZMyhNi/rWOdYvZRpMAlSZ7fQn5RKQKgjaikC3Yvssd5
         Y9CoePAOVXr78Wp3JDD7PtgdvigEU6i6f/fJij/S/66ogzdeNWg0KEsSFdZQHIjwA7wm
         8cJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947009; x=1735551809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/tJ15+vmer/NbqXoUznjybhQp/MgC6GOdT/GuQUXpM=;
        b=NpAL7XvzSWzOwjO24+4WYVpfNiTxgNvlzTzTJI6alvVU5bQVIi0EDKjSxqE3KlxD6L
         QA0DaS90bBMiIvFdPBuMTHT4Ba8RlUU/bbFzjAPZMiToZ/Ej5m+sNL0ZJ66kxfWojlbh
         8tmUVDeGg3gJ4Alp8GAaQtmEjiC4olB0VHUQZ/1PE+PTbyxBUZUo178q6vOmtsauR6rc
         tvX3QJOuNm2IMQRDuYjqRr0ZdGx0Rc6AedhK2IaSRG64xNGatl781iRrZ2yYLyh8z26P
         0q+L22XZnT1VPhBNRUvRgWKAbQBWHkgn47SK51fh65N9TJ6bFZTfS0MVSdT4EJnUaC81
         H+Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXHOLr2k4UPZf3pkYCHOVYjnjuzsvwAI2k3V9vy9yTpIjZklt5M7Jr9lQxsdEKpwOTSpqBQeKCIV0rryA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXAhpVNQqno8cOxMerKzQAzVTyE94WsT3RpDblI/8tNaSyAd45
	1E1xs8XGBrYZ/blvDI/8+0IW35ufyrm2TMUT2OFKtFg+Zb3Xf82A7GfPs+bsOxY=
X-Gm-Gg: ASbGncsFwsNDsRzPTDzuAu82TgV2YsPAjANno2Ap8FBHIlEfSZzgEG6SXEe357WDnIy
	l5Ep/yY1T3enC/Leerd/xSHvq+Vi/9d39kQ7da5sjvvejwQTPNkMXUNByMwoU+sNO947DA2K1+r
	ntL39js8eYu9AL4tYb/2DKZEv5Gxp+TBcIrlIBK3WQSH3AvU3s93VERBl2s87lovdcPm1modRiz
	d8j9EsbgNbelMCAEFQi1gPpdD/6/MSnrh5yv3bhculoYlYBYYTwWx1V/tKHs/rv2l0XN4+mZemE
	Jfy1IiYQrlKSkN067RUfYg==
X-Google-Smtp-Source: AGHT+IGn0WgNlH4n6jFU+xV15Lu8l6dnMV2FFWuW4zvXTMVJTCCaTT+ZxewqFKpQcJgKvmYU0RJrVw==
X-Received: by 2002:a05:6a00:35ca:b0:724:f86e:e3d9 with SMTP id d2e1a72fcca58-72abdecbdb4mr16058641b3a.14.1734947008718;
        Mon, 23 Dec 2024 01:43:28 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:43:28 -0800 (PST)
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
Subject: [PATCH v3 02/17] riscv: mm: Skip pgtable level check in {pud,p4d}_alloc_one
Date: Mon, 23 Dec 2024 17:40:48 +0800
Message-Id: <84ddf857508b98a195a790bc6ff6ab8849b44633.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_014329_751795_09A77CBC 
X-CRM114-Status: GOOD (  10.67  )
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

From: Kevin Brodsky <kevin.brodsky@arm.com>

{pmd,pud,p4d}_alloc_one() is never called if the corresponding page
table level is folded, as {pmd,pud,p4d}_alloc() already does the
required check. We can therefore remove the runtime page table level
checks in {pud,p4d}_alloc_one. The PUD helper becomes equivalent to
the generic version, so we remove it altogether.

This is consistent with the way arm64 and x86 handle this situation
(runtime check in p4d_free() only).

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/riscv/include/asm/pgalloc.h | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index f52264304f772..8ad0bbe838a24 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -12,7 +12,6 @@
 #include <asm/tlb.h>
 
 #ifdef CONFIG_MMU
-#define __HAVE_ARCH_PUD_ALLOC_ONE
 #define __HAVE_ARCH_PUD_FREE
 #include <asm-generic/pgalloc.h>
 
@@ -88,15 +87,6 @@ static inline void pgd_populate_safe(struct mm_struct *mm, pgd_t *pgd,
 	}
 }
 
-#define pud_alloc_one pud_alloc_one
-static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
-{
-	if (pgtable_l4_enabled)
-		return __pud_alloc_one(mm, addr);
-
-	return NULL;
-}
-
 #define pud_free pud_free
 static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 {
@@ -118,15 +108,11 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 #define p4d_alloc_one p4d_alloc_one
 static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
 {
-	if (pgtable_l5_enabled) {
-		gfp_t gfp = GFP_PGTABLE_USER;
-
-		if (mm == &init_mm)
-			gfp = GFP_PGTABLE_KERNEL;
-		return (p4d_t *)get_zeroed_page(gfp);
-	}
+	gfp_t gfp = GFP_PGTABLE_USER;
 
-	return NULL;
+	if (mm == &init_mm)
+		gfp = GFP_PGTABLE_KERNEL;
+	return (p4d_t *)get_zeroed_page(gfp);
 }
 
 static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
