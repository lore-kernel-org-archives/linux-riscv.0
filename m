Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCF5C0015E
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 02:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9PAyT9quG+GLkN0bp+5hA7rTNe3ZijNccimkqpHQvQ8=; b=QKkzVCHz+Ui0+GoexSROsOjWRH
	h4yLDx03pqndFkm8C775P8sJOKoKczkVHbgDgmhsgjMUhVHCVxGBJ3WHVPKG9BK9VjPLxc6LeInpP
	Ds7EBuzrQT0nf1HDxVCBMALAQFXBkr0qi2AE9WwEhNdokQR+812MymPzSafFvkRC6Td2AhGiEtf0D
	Zc3wzm3vQta3HtXEewJWHdQjee3BRaLwTVXMYjmfw8l+ykZUPz+FiZgRXepsUuNcuzWS5jUbXHWni
	LIOdvVROW3dbCduD0jjM0BKVtu9UtRdzIpZMaT1N2Cer8jEy2zgupxE1JKS255kHLDUSRbYKlhH5s
	ECDVkFig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN2Hx-00Fcgd-2X;
	Sat, 22 Jul 2023 02:24:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN2H2-00Fc1l-0g
	for linux-riscv@bombadil.infradead.org;
	Sat, 22 Jul 2023 02:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=u5SrmirujRq2aVi5eRkGolQnKZo6RnaaEh8Qz6+FUHE=; b=GTumNLKvyodEhoB4pCD9ArNJZv
	Wx/7fM5akCxQZZhepx3YB3JdRd7zGMOubwJe6egmbzGYzgtdYF5EO6JQ15UBYFrpT/MloiSulvuzW
	12lGmd76LEU/CF4Ef3trEJfxB2XRPeW9zhf24mxv8ECXjzeatBEE0AVP1gCT+hDTVXDrHny/5sakZ
	nym1KTQUb1g1AlhbE59pv9apIxLPjuWsYu1r0Y4AXhFWmFPltTqihsfuP63j8OsgWrSEUgXPBdUvk
	xD0RvP6gH4kR7KjMEM3/SLHoSvbv9z0zl2ZNdalwoQuxllWE1eY+fqL9C3BncLKZvrsw2Ch5CSGaY
	aruqA6XQ==;
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN2Gw-000IQH-0n
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 02:23:10 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-6b74e9192a1so5229740a34.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 19:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689992581; x=1690597381;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u5SrmirujRq2aVi5eRkGolQnKZo6RnaaEh8Qz6+FUHE=;
        b=7ZFS9BaZBG0RYDeC/ERK3+7YiShgv/UEmWzHvO9qqL9Hlxk8ixlhYgIE8NRMcNhhAP
         vtG/wHFWoGNhl8wH/LXHrljSmYt3gwIYTlvK/iu29zMOEbg0ITUAe4CFFNkYImrywuqs
         ue61xv2i4k9iT9Aa8FYlAsGIAJ/JRzKnOwY9Lr0orO3yyhWuoxlLf5VcujAqBIbjMFuI
         vw2FnGPqQIQmSE0FMXI41SIjbCw5PKZycYRU+Q5LIycSsI5Em7lK6KIxnwSgR2ETNHKN
         MrhtQh2n7+HOwZpv937uYlU6ca7CmbeVU0kk56qCttpMEK8t9gL1abtNhWm8R73AkBDw
         q8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689992581; x=1690597381;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u5SrmirujRq2aVi5eRkGolQnKZo6RnaaEh8Qz6+FUHE=;
        b=Hxzqtr56slccVlmU4W/hoWuszg0nwMsDMZmN4zj1x42c1617n790qHNGRO/Rk/a/7C
         7OfsMkLx0iXye1Xfu17JHKsIw4/UCGfGuwXoj3mXYwzbYiWfF1Bl7Y0IwLDUEkl3BwHL
         ZXPx1qMsdDa/7gzJMFcpskQkxsE/4EbnCojGUn7MDpM+nl1VIb0QIWBH1YRWF0msDhg2
         EnMUv7nANGxBjfv3LhV5BbRFNgg7pMC5a3sg63x/3KenWmGzu0UA6Lsi7oLqNAzrOPJK
         DJUMj6Xl9gWNnIZrwFbaG0rHtGt67jLEh4wGB7yk3Lf+p5VwSbGhNGs3zcsut9oN/hcw
         3bkw==
X-Gm-Message-State: ABy/qLZRI8ybtIIAahxOIkz6w0RAMXOPhO1zrDLYqkDLsFMYlu1BWVmC
	JoZPlHvnyrKZ51Tz2TbYO9wbChmJkExL
X-Google-Smtp-Source: APBJJlEQYne23Sz25xQ1kiG6us50NePwGkqsU6zcSA+ndBULXYai11Oj54GZr9pgCK5BRyLX7XqfxY15yfUD
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a05:6830:118:b0:6b7:5382:4802 with SMTP id
 i24-20020a056830011800b006b753824802mr2179019otp.4.1689992581010; Fri, 21 Jul
 2023 19:23:01 -0700 (PDT)
Date: Sat, 22 Jul 2023 02:22:45 +0000
In-Reply-To: <20230722022251.3446223-1-rananta@google.com>
Mime-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230722022251.3446223-7-rananta@google.com>
Subject: [PATCH v7 06/12] arm64: tlb: Refactor the core flush algorithm of __flush_tlb_range
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Reiji Watanabe <reijiw@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Raghavendra Rao Anata <rananta@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Gavin Shan <gshan@redhat.com>, 
	Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_032306_627940_01484854 
X-CRM114-Status: GOOD (  16.21  )
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

Currently, the core TLB flush functionality of __flush_tlb_range()
hardcodes vae1is (and variants) for the flush operation. In the
upcoming patches, the KVM code reuses this core algorithm with
ipas2e1is for range based TLB invalidations based on the IPA.
Hence, extract the core flush functionality of __flush_tlb_range()
into its own macro that accepts an 'op' argument to pass any
TLBI operation, such that other callers (KVM) can benefit.

No functional changes intended.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
---
 arch/arm64/include/asm/tlbflush.h | 109 +++++++++++++++---------------
 1 file changed, 56 insertions(+), 53 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 412a3b9a3c25..f7fafba25add 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -278,14 +278,62 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
  */
 #define MAX_TLBI_OPS	PTRS_PER_PTE
 
+/* When the CPU does not support TLB range operations, flush the TLB
+ * entries one by one at the granularity of 'stride'. If the TLB
+ * range ops are supported, then:
+ *
+ * 1. If 'pages' is odd, flush the first page through non-range
+ *    operations;
+ *
+ * 2. For remaining pages: the minimum range granularity is decided
+ *    by 'scale', so multiple range TLBI operations may be required.
+ *    Start from scale = 0, flush the corresponding number of pages
+ *    ((num+1)*2^(5*scale+1) starting from 'addr'), then increase it
+ *    until no pages left.
+ *
+ * Note that certain ranges can be represented by either num = 31 and
+ * scale or num = 0 and scale + 1. The loop below favours the latter
+ * since num is limited to 30 by the __TLBI_RANGE_NUM() macro.
+ */
+#define __flush_tlb_range_op(op, start, pages, stride,			\
+				asid, tlb_level, tlbi_user)		\
+do {									\
+	int num = 0;							\
+	int scale = 0;							\
+	unsigned long addr;						\
+									\
+	while (pages > 0) {						\
+		if (!system_supports_tlb_range() ||			\
+		    pages % 2 == 1) {					\
+			addr = __TLBI_VADDR(start, asid);		\
+			__tlbi_level(op, addr, tlb_level);		\
+			if (tlbi_user)					\
+				__tlbi_user_level(op, addr, tlb_level);	\
+			start += stride;				\
+			pages -= stride >> PAGE_SHIFT;			\
+			continue;					\
+		}							\
+									\
+		num = __TLBI_RANGE_NUM(pages, scale);			\
+		if (num >= 0) {						\
+			addr = __TLBI_VADDR_RANGE(start, asid, scale,	\
+						  num, tlb_level);	\
+			__tlbi(r##op, addr);				\
+			if (tlbi_user)					\
+				__tlbi_user(r##op, addr);		\
+			start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT; \
+			pages -= __TLBI_RANGE_PAGES(num, scale);	\
+		}							\
+		scale++;						\
+	}								\
+} while (0)
+
 static inline void __flush_tlb_range(struct vm_area_struct *vma,
 				     unsigned long start, unsigned long end,
 				     unsigned long stride, bool last_level,
 				     int tlb_level)
 {
-	int num = 0;
-	int scale = 0;
-	unsigned long asid, addr, pages;
+	unsigned long asid, pages;
 
 	start = round_down(start, stride);
 	end = round_up(end, stride);
@@ -307,56 +355,11 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
 	dsb(ishst);
 	asid = ASID(vma->vm_mm);
 
-	/*
-	 * When the CPU does not support TLB range operations, flush the TLB
-	 * entries one by one at the granularity of 'stride'. If the TLB
-	 * range ops are supported, then:
-	 *
-	 * 1. If 'pages' is odd, flush the first page through non-range
-	 *    operations;
-	 *
-	 * 2. For remaining pages: the minimum range granularity is decided
-	 *    by 'scale', so multiple range TLBI operations may be required.
-	 *    Start from scale = 0, flush the corresponding number of pages
-	 *    ((num+1)*2^(5*scale+1) starting from 'addr'), then increase it
-	 *    until no pages left.
-	 *
-	 * Note that certain ranges can be represented by either num = 31 and
-	 * scale or num = 0 and scale + 1. The loop below favours the latter
-	 * since num is limited to 30 by the __TLBI_RANGE_NUM() macro.
-	 */
-	while (pages > 0) {
-		if (!system_supports_tlb_range() ||
-		    pages % 2 == 1) {
-			addr = __TLBI_VADDR(start, asid);
-			if (last_level) {
-				__tlbi_level(vale1is, addr, tlb_level);
-				__tlbi_user_level(vale1is, addr, tlb_level);
-			} else {
-				__tlbi_level(vae1is, addr, tlb_level);
-				__tlbi_user_level(vae1is, addr, tlb_level);
-			}
-			start += stride;
-			pages -= stride >> PAGE_SHIFT;
-			continue;
-		}
-
-		num = __TLBI_RANGE_NUM(pages, scale);
-		if (num >= 0) {
-			addr = __TLBI_VADDR_RANGE(start, asid, scale,
-						  num, tlb_level);
-			if (last_level) {
-				__tlbi(rvale1is, addr);
-				__tlbi_user(rvale1is, addr);
-			} else {
-				__tlbi(rvae1is, addr);
-				__tlbi_user(rvae1is, addr);
-			}
-			start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT;
-			pages -= __TLBI_RANGE_PAGES(num, scale);
-		}
-		scale++;
-	}
+	if (last_level)
+		__flush_tlb_range_op(vale1is, start, pages, stride, asid, tlb_level, true);
+	else
+		__flush_tlb_range_op(vae1is, start, pages, stride, asid, tlb_level, true);
+
 	dsb(ish);
 }
 
-- 
2.41.0.487.g6d72f3e995-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
