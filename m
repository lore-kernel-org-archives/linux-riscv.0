Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D9CC001DE
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 00:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/Y5kkAXQJfJtC3XeDfyz1ZOcvbsIfuDQw9qyIWxe/rY=; b=eCqot6edEmKKc1VzHyS/ZYNriu
	lIibGqHRPVZpckp7HfxqKvJqILfH/qTcL3fxJC0vmFoXWT3FDxy2dUudq3P+Jbs4O+6rmazpDyQMm
	2+0iN5xlj75uiaOnp6nJUqZ3yzSTy2uWSJsSZlMMxidD+iC0D2rCwsjAfwAn0lwxxMafGAjbVA1T8
	mcSSdD3EYvtOo4MFjr2cn7IVWAY5yj5NvncowosHRqXz6Ld1vPmX0ljJKVeQxKek5ZViTrNolvPkF
	cjNI88usGsx675+ldjSXD9DoLcEPayLVJUF5Ed/Dojrsz0xK4Lq/5BWSv4K0qhSd2/dJtaUQdMPkJ
	LqJIoHpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKTYP-007aQ0-0D;
	Sat, 15 Jul 2023 00:54:33 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKTY9-007aBE-0q
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 00:54:21 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-6b86fa9adc9so3888810a34.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 17:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689382456; x=1689987256;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3JwopgRpIMp0X2glfVxGtAHu1MpQVveVbpsM0JdVJZQ=;
        b=WzuwSrgUcQNReWT/D/pSdl6UdHpKLb7UWimjp08dHNmKHuBIOKxgMS6JBBZc39QJNk
         eacA7f7nF2F6YWMDYDnPPQvEpz3NlFofChUilfoTLlEYkk0DkhCZgLEynkawoE+RpTUX
         Ns4tBoa5xtQc+9jQWG0frC1oChGMy8jf+AuG/sc6qu/CzdXVdWhW5hphT+444Z7wyXI1
         BLI2JkvNKoV1cv5zYFt2wIvBAI14k4hN+8Tbsy3tnISF81SvhE7X+mz/35ntRFv3hhr4
         TqaflOLXmJSXILRf6JGluQkxdFIkW50nBjB6DNmc1BPVJQa5wqAG7QvgmBMK+IThkKHH
         yaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689382456; x=1689987256;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3JwopgRpIMp0X2glfVxGtAHu1MpQVveVbpsM0JdVJZQ=;
        b=PsLf57XPO0lGe+aqiPgxF7klLP2HbAUggSfGRzVCB8YkadtgILrp/aMVbdGN7FR576
         nNRwda+IJrGUYCSe8vsjgiQC6X08jcf0JPwBUEnFIlBGpNRIp9gItLTJHYCYlkWAx4f3
         M5x+FuqiSoTu4EmN/J0qtdEigi7GgWqwC0M7NkpbLivtTJi7iHlwUJt+R+TI/06r9CHl
         ReB7BJ55i1oQJ9To+fFM9W8KYh6gLt1yFZqqGmPvylZ6xurYthz0dzy6th3xGlrLSwHF
         2sPtDxB68Lo5o62PJUChgREqW++twG/Dw6dHgg5fxEunbfVOsfNryQBcnppElhb5owtO
         OSQw==
X-Gm-Message-State: ABy/qLbwVu24bXDLHjjqIvhbAY3Npwr6qhFWB4tvqlgLlATEg71zd+oo
	pQu7FOw42zjC2gv9t7W9gpdLdD17OpSZ
X-Google-Smtp-Source: APBJJlE+23Zlyi1NCHMzx496SqRzQzk0piEvAkVf0LldPKrAVErByool5AO571hFmEWHsnBTx1b/9eA4mVow
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a05:6870:d883:b0:1b3:7919:e9dd with SMTP
 id dv3-20020a056870d88300b001b37919e9ddmr6035172oab.5.1689382455968; Fri, 14
 Jul 2023 17:54:15 -0700 (PDT)
Date: Sat, 15 Jul 2023 00:53:59 +0000
In-Reply-To: <20230715005405.3689586-1-rananta@google.com>
Mime-Version: 1.0
References: <20230715005405.3689586-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.455.g037347b96a-goog
Message-ID: <20230715005405.3689586-6-rananta@google.com>
Subject: [PATCH v6 05/11] arm64: tlb: Refactor the core flush algorithm of __flush_tlb_range
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Raghavendra Rao Anata <rananta@google.com>, David Matlack <dmatlack@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Gavin Shan <gshan@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_175417_326270_C67EE598 
X-CRM114-Status: GOOD (  16.63  )
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
2.41.0.455.g037347b96a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
