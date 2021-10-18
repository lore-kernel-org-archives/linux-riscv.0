Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0E7C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 02:23:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7B2561076
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 02:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7B2561076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SvZwRqf7gExqc5K2DhG9hN7i9gdHMm+bv55M2pLs01c=; b=V6UO7fe6brdxa+
	60apR4ixqOFH7XaKiYQFruKrLJBqxQQVFLLaccHNwTBvAhjG+WjAV4thN2e0FfvY26mxo3gtJSvCR
	78RwalAKkE/xOZdn4tCHQAVoutQS0alOH5CQxf6Sgvu4YDc9eGVcYvN662qo5iYjmd7rMoKK54p/9
	lbiNwmAaaQzp/3Y3FhwtDQmaGS9HV4aJAlRGhRtrd8RWIt9+EbwWzwQrxrOu2htQ4EMv6tgp/ySmM
	5LHlGKwmCIbazoi2gRI1punS8yBVLp17jiDvl9Rd1Lopnm2Xy0ZeluroZHuWRT7+52LDRhFk0cd0b
	j23DoPSpFGVqDXf9aQYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcIIz-00DpNb-KV; Mon, 18 Oct 2021 02:23:13 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcIIw-00DpMZ-Am
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 02:23:11 +0000
Received: by mail-pg1-x534.google.com with SMTP id t7so31195pgl.9
 for <linux-riscv@lists.infradead.org>; Sun, 17 Oct 2021 19:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MfGTIV1+9CdUVlBc1WjTZb6+ouybOgZMGoCpwkOkAGg=;
 b=V+IdFHb62FvxJSV9Z3R5zgiyD8uUu9pJpcSAvp6vRA3K70HZ5JNKlvOfQopqKx/Ck4
 tSCUWjVrR8z2yG0I93Se98yrcdetVn5RIs5xNpfPHmmtXeS7VTJcmsgTWX/IZDLb5ye3
 1AJJoh9H11hgFQnrkaDUS6RIO9h7ubD4eiDLwOB4sk/fFwl8aY+NMdpvwtLr36iMXFFh
 W95lSGaDmg+jwx4uKlKU0/uJVHhT5QG6cPDSdkDiO67W1VpDc2q6UlGK8Z34bAS9EYr9
 LSqPYAOsVW65PUc+qh+HZmnsWQCnfCh72gjwBnEPCwGycDDtOI6LtyQEcDs9JcPnRhn7
 o5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MfGTIV1+9CdUVlBc1WjTZb6+ouybOgZMGoCpwkOkAGg=;
 b=6FMAwpy3s+pb2Syi9BvKqMl8k1EQNKyjtvdPm/eXsMVkSU4EG9DWIgSUzEDBiIIMpL
 IPqWj2PmHg4t/HMrNJ75d/TtwcgW/uEJ2yEJZYDG8QhKi+tUJ+OGC0SacLsa1bZZNEFN
 iValKJWWYCtyOItcwoQsE+52INzyr7uGNUcOmgRrjCVdBzxGwFs5ZSJGJDt8kJdjbzoH
 uE+kgH4HCzbIhm4SwqV4qjizNawtWgjFQgz77EunMUhWiukuLvbG3Ly3onnjc+bTu1W2
 c/YXolJGx5eNFp5Mqu5zxdTUAhcmBTFn1NtFY4XMd0AvaGiE4zwDrDTf6kmE3VKiccVh
 zWxQ==
X-Gm-Message-State: AOAM530UakndICr5hqLTqeT8pr3OD0S0h9pPKR26owO/c7vXbijnB4qH
 si2KJKxlquQYHvY6K+OKwVg=
X-Google-Smtp-Source: ABdhPJxnZIrzghTiOAMraXRAvWpmlylek/ZEbLjZbNlKvGfBjIDUQmDq+aoG1pT5XQdeoqzQZmALWw==
X-Received: by 2002:a63:fe41:: with SMTP id x1mr21169499pgj.272.1634523789600; 
 Sun, 17 Oct 2021 19:23:09 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac0:23::815:bc7])
 by smtp.gmail.com with ESMTPSA id t32sm4965971pfg.29.2021.10.17.19.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 19:23:09 -0700 (PDT)
From: Qinglin Pan <panqinglin00@gmail.com>
X-Google-Original-From: Qinglin Pan <panqinglin00@163.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [RFC PATCH 1/4] mm: modify pte format for Svnapot
Date: Mon, 18 Oct 2021 10:22:35 +0800
Message-Id: <20211018022238.1314220-1-panqinglin00@163.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211017_192310_399011_09D869F9 
X-CRM114-Status: GOOD (  13.98  )
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

From: Qinglin Pan <panqinglin2020@iscas.ac.cn>

Svnapot is a RISC-V extension for marking contiguous 4K pages as a non-4K
page. Its concept proof will complete soon and this patch set is for using
Svnapot in Linux Kernel's boot process and hugetlb fs.

The draft spec about Svnapot can be found here:
https://github.com/riscv/virtual-memory/blob/main/specs/

This patch modifies PTE definition for Svnapot, and creates some functions in
pgtable.h to mark a PTE as napot and check if it is a Svnapot PTE.
Until now, only 64KB napot size is supported in draft spec, so some macros
has only 64KB version.

The qemu which we use to test this patchset can be in this repo:
https://github.com/plctlab/plct-qemu/tree/plct-virtmem-dev

Yours,
Qinglin

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
---
 arch/riscv/include/asm/pgtable-bits.h | 29 +++++++++++++++++++++++++++
 arch/riscv/include/asm/pgtable.h      | 23 ++++++++++++++++++++-
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
index 2ee413912926..8369e4d45919 100644
--- a/arch/riscv/include/asm/pgtable-bits.h
+++ b/arch/riscv/include/asm/pgtable-bits.h
@@ -24,6 +24,26 @@
 #define _PAGE_DIRTY     (1 << 7)    /* Set by hardware on any write */
 #define _PAGE_SOFT      (1 << 8)    /* Reserved for software */
 
+#define _PAGE_RESERVE_0_SHIFT 54
+#define _PAGE_RESERVE_1_SHIFT 55
+#define _PAGE_RESERVE_2_SHIFT 56
+#define _PAGE_RESERVE_3_SHIFT 57
+#define _PAGE_RESERVE_4_SHIFT 58
+#define _PAGE_RESERVE_5_SHIFT 59
+#define _PAGE_RESERVE_6_SHIFT 60
+#define _PAGE_RESERVE_7_SHIFT 61
+#define _PAGE_RESERVE_8_SHIFT 62
+#define _PAGE_NAPOT_SHIFT 63
+#define _PAGE_RESERVE_0 (1UL << 54)
+#define _PAGE_RESERVE_1 (1UL << 55)
+#define _PAGE_RESERVE_2 (1UL << 56)
+#define _PAGE_RESERVE_3 (1UL << 57)
+#define _PAGE_RESERVE_4 (1UL << 58)
+#define _PAGE_RESERVE_5 (1UL << 59)
+#define _PAGE_RESERVE_6 (1UL << 60)
+#define _PAGE_RESERVE_7 (1UL << 61)
+#define _PAGE_RESERVE_8 (1UL << 62)
+
 #define _PAGE_SPECIAL   _PAGE_SOFT
 #define _PAGE_TABLE     _PAGE_PRESENT
 
@@ -34,6 +54,15 @@
 #define _PAGE_PROT_NONE _PAGE_READ
 
 #define _PAGE_PFN_SHIFT 10
+#define _PAGE_PFN_MASK (_PAGE_RESERVE_0 - (1UL << _PAGE_PFN_SHIFT))
+/* now Svnapot only supports 64KB*/
+#define NAPOT_CONT64KB_ORDER 4UL
+#define NAPOT_CONT64KB_SHIFT (NAPOT_CONT64KB_ORDER + PAGE_SHIFT)
+#define NAPOT_CONT64KB_SIZE (1UL << NAPOT_CONT64KB_SHIFT)
+#define NAPOT_CONT64KB_MASK (NAPOT_CONT64KB_SIZE - 1)
+#define NAPOT_64KB_PTE_NUM (1UL << NAPOT_CONT64KB_ORDER)
+#define _PAGE_NAPOT      (1UL << _PAGE_NAPOT_SHIFT)
+#define NAPOT_64KB_MASK (7UL << _PAGE_PFN_SHIFT)
 
 /* Set of bits to preserve across pte_modify() */
 #define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ |	\
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 39b550310ec6..adacb877433d 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -251,7 +251,11 @@ static inline pte_t pud_pte(pud_t pud)
 /* Yields the page frame number (PFN) of a page table entry */
 static inline unsigned long pte_pfn(pte_t pte)
 {
-	return (pte_val(pte) >> _PAGE_PFN_SHIFT);
+	unsigned long val  = pte_val(pte);
+	unsigned long is_napot = val >> _PAGE_NAPOT_SHIFT;
+	unsigned long pfn_field = (val & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT;
+	unsigned long res = (pfn_field - is_napot) & pfn_field;
+	return res;
 }
 
 #define pte_page(x)     pfn_to_page(pte_pfn(x))
@@ -304,6 +308,23 @@ static inline int pte_special(pte_t pte)
 	return pte_val(pte) & _PAGE_SPECIAL;
 }
 
+static inline unsigned long pte_napot(pte_t pte)
+{
+	return pte_val(pte) & _PAGE_NAPOT;
+}
+
+static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
+{
+	unsigned long napot_bits = (1UL << (order - 1)) << _PAGE_PFN_SHIFT;
+	unsigned long lower_prot =
+		pte_val(pte) & ((1UL << _PAGE_PFN_SHIFT) - 1UL);
+	unsigned long upper_prot = (pte_val(pte) >> _PAGE_PFN_SHIFT)
+				   << _PAGE_PFN_SHIFT;
+
+	return __pte(upper_prot | napot_bits | lower_prot | _PAGE_NAPOT);
+}
+
+
 /* static inline pte_t pte_rdprotect(pte_t pte) */
 
 static inline pte_t pte_wrprotect(pte_t pte)
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
