Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625F2C4450A
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwMXzQnGGUMQiM1Hu3Tzv7M/hsr7SeMKKfQK1TpgxjE=; b=BNp+5T1JexQA5i
	+KE9XVi50vT8ZYXwh7So4jupznhGcG9gL0IgpsJQPDckz53hariabvGUrDMgh2MBErSutC4ht+OYM
	y7Wn6Pb6th3K9Ju5klQxjJw+YQdES2kzUUCV7cKyJh65X4HdCMXWrq/uJqOeuYIRfM8ruy9cul7Pp
	Yaiw55HENQgMIy4O52T2CSG/28Qql1faYJjURccrhVwhjxhWsDdFR3umilEP2R8Zh0e9TX7M4zGoz
	x+Vqi6XI82+BmvMt9P7ulFjkP4BZt9iYEhVp/StTWXfA5fIQx3zBWzwyYUb4R2AOmvgRC0oME9O/4
	Hydxb2NmotHaMNJKwV/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLSH-0000000HK0f-1bV7;
	Thu, 16 Jul 2026 12:44:45 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLSD-0000000HJux-1VJB
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 12:44:44 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cab973140bso79475745ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2026 05:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205881; x=1784810681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xl9SXJgNY1wsw8DmDdohBTpB25DAPwcBNYqh5j7w6mI=;
        b=j9H9ZcZiXjQ76RHRS/Mgai3gMuMPIhDYV9YJOwW1GYLOFuqlI/XSfUqQVC+YZBt+j1
         Fu1u10kwQUhCBXJV9yH9+DKk6KmWDC/296NziedVsIYJ2pvmoyF4MN7CUjje+bjDU/lR
         oAeJDqdniw+YFTzEa8cxYfA1YUX03/TAulJfWtqbcL6DaKHvdkAZvCi9jIrMXjuT+4rs
         Dqf1OicKWaJSX+Om3fVdYdYScVpfbYlp8kZoSQrul7nvKtWByTXJMRESKitAnL3rA40w
         aMYDi+edKd5UM0kxGlEA+g0IlVkOzksyAwiutFLKZ7wIsjF3hyLLO+z0vse0cOEio4Fb
         jsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205881; x=1784810681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xl9SXJgNY1wsw8DmDdohBTpB25DAPwcBNYqh5j7w6mI=;
        b=ZmoPgoSICp6Zaz+cJiqUBXMI0SPTAhB40EJO0TX9+c+73/f03jCfBGBLHxvXGGR6+B
         /Oj5pWv/serXYMX57JQZQU4MZ8ZQ+AaHtV5w+4Uw8bGCfWjWfPc1c+sfOsXeWbDp6cYf
         x6RC1tnDhv3GnkxMfzYnvj8Dm7LO47sK9C2kKWF8djoJ3t32GQV//1oGHmwdtwSmWuBv
         jNyS4AF0++HKli1trnGiTBpS9hk/UjXTVrhQUeQGXpI8X2DWS2P6R5+c7QHAD0hdmjIt
         cDTUD90EDVec81LYzFv99mqjD185HNVff9QA1WX0iQiDXdQMopnca3atnZg7bANbAfOY
         M0hg==
X-Gm-Message-State: AOJu0YwtxZgdWItj5cbSvehaGhHMZuGCo7asdo/3j485xXf3xZdhZ5bF
	SUSXN9SLAGDeC1Bcol0fSDjf3xwBBAbpwUY4cTZtYoFZ7YNXu+V83o0bH5nWHnCR8uWDOfm+L71
	6asDdfxE=
X-Gm-Gg: AfdE7cm4ZZPwmojRlDDFRIY20M8TG9ozjWSwgejPYgiziIr46DuqFQdlbtMomZRENrW
	hGyCImNTfV2td/iWgMr3w982wdlENcBseEr4dMEeeOThyyUlOdW991MzKXxZSugWHUvkNdOtFrP
	paXfJKdjK6iCf2P5JjdeUdB3z+LWRKBG0gWygtUC59rqlPZ3zVOTBicX71pTAa/tKHIht/sQ2jt
	ootLvCb3+UNJICl80U4CzW4/Diw3Q2Yz+MYaXysD62qVepybQRIR9PGDghYzVzoGPEoBkFkKxqZ
	iswRofb8wSfYxyhm9cw8/mxUU6Com2jN7HrXDnDaVB6JWed2JA37CO5GGxV5MK9qzCuxS3J6F4y
	aYu/HPT4MfjdV1PJt/dRqfmTvfYmRRlGwz9CwVra3a8yGddzT1Qg+JeNrhJCY898hhfshi8bqQx
	ghdhunMoWEaPnoYEgHa6Bd4Ss=
X-Received: by 2002:a05:6a21:114c:b0:3b4:b275:c5b1 with SMTP id adf61e73a8af0-3c36c1cf118mr8945730637.26.1784205880687;
        Thu, 16 Jul 2026 05:44:40 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.44.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:44:39 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	kasan-dev@googlegroups.com,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 13/15] riscv/mm: remove redundant TLB flush in napotpte_convert
Date: Thu, 16 Jul 2026 20:41:48 +0800
Message-Id: <e55fb906990083b05272648f5299514a68cf8456.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054441_421656_4AF403F6 
X-CRM114-Status: GOOD (  12.06  )
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

napotpte_convert() switches a NAPOT block between the Svnapot encoding
and the equivalent set of base PTEs. The conversion itself preserves the
effective translations: PFNs and permissions are kept the same while the
page-table representation changes.

Do not issue an SFENCE.VMA in the middle of this representation change.
For partial updates, such as unfolding a writable NAPOT block before
write-protecting one subrange, a flush at conversion time would not be the
operation that enforces the final permission downgrade. Writable base-PTE
translations could still be refilled after the conversion and before the
subrange is write-protected. The required TLB maintenance belongs to the
operation that actually changes the effective mapping.

The RISC-V privileged architecture discussion clarifies that Svnapot is
an encoding of a naturally aligned range. When napotpte_convert() only
switches between the NAPOT encoding and the corresponding set of base PTEs
for the same effective translations, the conversion itself does not
require an extra TLB invalidation beyond the usual page-table update
rules.

Link: https://lists.riscv.org/g/tech-privileged/message/2950
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/mm/contpte.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/contpte.c b/arch/riscv/mm/contpte.c
index b0b8ff0aade3a..8289f39d6e188 100644
--- a/arch/riscv/mm/contpte.c
+++ b/arch/riscv/mm/contpte.c
@@ -129,7 +129,7 @@ static pte_t __get_and_clear_full_ptes(struct mm_struct *mm,
 static void napotpte_convert(struct mm_struct *mm, unsigned long addr,
 			     pte_t *ptep, pte_t target)
 {
-	unsigned long start_addr, end, ptent_addr;
+	unsigned long start_addr, ptent_addr;
 	pte_t *start_ptep;
 	pte_t ptent, pte;
 	unsigned int i, nr;
@@ -137,7 +137,6 @@ static void napotpte_convert(struct mm_struct *mm, unsigned long addr,
 	start_addr = napot_align_addr(addr);
 	start_ptep = napot_align_ptep(ptep);
 	nr = napotpte_pte_num();
-	end = start_addr + napotpte_size();
 
 	for (i = 0; i < nr; i++) {
 		ptent_addr = start_addr + i * PAGE_SIZE;
@@ -150,8 +149,15 @@ static void napotpte_convert(struct mm_struct *mm, unsigned long addr,
 			target = pte_mkyoung(target);
 	}
 
-	flush_tlb_mm_range(mm, start_addr, end, PAGE_SIZE);
-
+	/*
+	 * This conversion only changes the representation of the same
+	 * effective translations: NAPOT encoding <-> equivalent base PTEs.
+	 * A flush here would not replace the TLB maintenance required by a
+	 * later permission downgrade, because writable base-PTE translations
+	 * could be refilled after this conversion and before that downgrade.
+	 * Leave TLB invalidation to the operation that changes the effective
+	 * mapping.
+	 */
 	page_table_check_ptes_set(mm, start_addr, start_ptep, target, nr);
 	if (pte_napot(target)) {
 		for (i = 0; i < nr; i++)
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
