Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD92DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 30 May 2022 09:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wDApcbDX23RcvOGIFq13VS9zkdPfn3M1bVaiwui/QRo=; b=QikuADGgjv4FIX
	z3dzNVs1VCmL40HjieHRu3NZaE60MKjMKgObgwTp2BUN1ReMgJ9B+JRzoHtTpp+iY9Fj+6EAswknf
	RPF2TxgbSxEYiqTAGNBu/Q9KKG59jyPTpb1SMtXx6QBixAaktlr3zuyfkflcf4/1SHvd7MW9Nurvb
	/zX1WO5gs+IgCNOccJveBX4dp6icGwxHU5HuA9/xBdL77XJgiIBg1YCtT390YzSHdg3JcSkPJ0kGw
	mfR5+RHhQ1N4RqIUWDpejJfr57MxjRQ/Fj+DVZu2QmtaMFFbI4InTd16zzgAW1NZ4cvIv17tK4FGd
	gZH4Kau0PZI4/bHOAA3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvbzf-006AqE-2t; Mon, 30 May 2022 09:47:23 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvbzY-006Am5-OI
	for linux-riscv@lists.infradead.org; Mon, 30 May 2022 09:47:19 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AC6B13FBF4
	for <linux-riscv@lists.infradead.org>; Mon, 30 May 2022 09:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1653904027;
	bh=0UZymv9RVAChspHI58gTmQkqQr5ViPWxsQqyFUaGwGI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=BQynBlSIrLEmYQRf+w2HXFMDTvf97rwyOncqlhH1ugNqF9+QZk+anHNnipANfsbA2
	 R7F2tEkTgJyT7wKz50y8fDXRGcSyFZY7dP8zZjkelZcDXGLIofQmHAoT7aznr0J/N7
	 +1Y3oHVlC/zyrNd+M8Tsgl2ULJD5c9LUyg3RpcQwrNQw8NeCxvnEQZFBCIxQNqXgMk
	 ct8in+v1Ip8YVeldJ5xd72J+30fn/NOS9NBObnaLznL9b7HXPjTM5VWqSqAKimsTzz
	 jquSd7jb2oVBcQVkLYrnKCuVwZDsSRQTG7avBXvXEM1si/tOJ4ZSUSZYiHWb9rjZrJ
	 GLNWya8RFamww==
Received: by mail-wr1-f70.google.com with SMTP id bt14-20020a056000080e00b002100d89c219so1500909wrb.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 May 2022 02:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0UZymv9RVAChspHI58gTmQkqQr5ViPWxsQqyFUaGwGI=;
        b=Pl4GlEt0/Qlo90cbXLIpeE7zTn/lF5asJOJAYLuiX2A56im3u6zUCEeVwvq3dV9SBB
         U2NAgSBHqKiwvb6F5tzxXACQWI4lZSkuIJO9op54zBY0FrFBSkD+VlYQvFlyCeROc1BG
         2+V7AqP9Zy7HMBV4K98xcvJXGGTgG0R7kZJhh67F4K3Ep8iY1B88c7smipy6ISLJbE9l
         gT0xfX9Wf136nEiShVChGEP5LL0m1USM3m90K+Qp+MmouTBWKfeTrJIyOrs0G/wou4AI
         ycJdLhJPrwrDHlkiUya6wYjSlhkO5NXGu8d6SWmtI8eReRxLWsnrJeej8qRWBUHVt4qD
         on8Q==
X-Gm-Message-State: AOAM532KbCCa4e7D7VRp+6HJJB3uYGBwVn7qYprSeANka9g3XNeMzQkF
	jslJrNE0xzDjGsv+0D4RJ3PAdy3VRD9k32U6zFtR1fvet5PIa+VwVbNpX4tLDGA0JSc/2e3qKGr
	Z8JyyNrEO4Bxwr0z+t3Rq7FoDWO5AD+Whpsr/EmNrTOKceg==
X-Received: by 2002:a05:600c:501f:b0:397:74e2:caa1 with SMTP id n31-20020a05600c501f00b0039774e2caa1mr18326897wmr.89.1653904023960;
        Mon, 30 May 2022 02:47:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcIRFrZmFoHMctcwJfjIoXZM+fuLzFmiVCBZ3hBYIMDRUovPi+iGVmBjDvXX5Wh2a1poEgFA==
X-Received: by 2002:a05:600c:501f:b0:397:74e2:caa1 with SMTP id n31-20020a05600c501f00b0039774e2caa1mr18326883wmr.89.1653904023811;
        Mon, 30 May 2022 02:47:03 -0700 (PDT)
Received: from alex.home (lfbn-gre-1-146-29.w90-112.abo.wanadoo.fr. [90.112.113.29])
        by smtp.gmail.com with ESMTPSA id f12-20020a05600c154c00b003942a244f30sm13897640wmg.9.2022.05.30.02.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 02:47:03 -0700 (PDT)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH -for-next] riscv: Fix missing PAGE_PFN_MASK
Date: Mon, 30 May 2022 11:47:01 +0200
Message-Id: <20220530094701.2891404-1-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_024716_991578_9120A5D4 
X-CRM114-Status: GOOD (  13.53  )
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

There are a bunch of functions that use the PFN from a page table entry
that end up with the svpbmt upper-bits because they are missing the newly
introduced PAGE_PFN_MASK which leads to wrong addresses conversions and
then crash: fix this by adding this mask.

Fixes: 100631b48ded ("riscv: Fix accessing pfn bits in PTEs for non-32bit variants")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/include/asm/pgtable-64.h | 4 ++--
 arch/riscv/include/asm/pgtable.h    | 4 ++--
 arch/riscv/kvm/mmu.c                | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 6d59e4695200..0e57bf1e25e9 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -153,7 +153,7 @@ static inline pud_t pfn_pud(unsigned long pfn, pgprot_t prot)
 
 static inline unsigned long _pud_pfn(pud_t pud)
 {
-	return pud_val(pud) >> _PAGE_PFN_SHIFT;
+	return (pud_val(pud) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT;
 }
 
 static inline pmd_t *pud_pgtable(pud_t pud)
@@ -240,7 +240,7 @@ static inline void p4d_clear(p4d_t *p4d)
 static inline pud_t *p4d_pgtable(p4d_t p4d)
 {
 	if (pgtable_l4_enabled)
-		return (pud_t *)pfn_to_virt(p4d_val(p4d) >> _PAGE_PFN_SHIFT);
+		return (pud_t *)pfn_to_virt((p4d_val(p4d) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT);
 
 	return (pud_t *)pud_pgtable((pud_t) { p4d_val(p4d) });
 }
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index e2658a25f06d..43064025f4b0 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -255,7 +255,7 @@ static inline pgd_t pfn_pgd(unsigned long pfn, pgprot_t prot)
 
 static inline unsigned long _pgd_pfn(pgd_t pgd)
 {
-	return pgd_val(pgd) >> _PAGE_PFN_SHIFT;
+	return (pgd_val(pgd) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT;
 }
 
 static inline struct page *pmd_page(pmd_t pmd)
@@ -568,7 +568,7 @@ static inline pmd_t pmd_mkinvalid(pmd_t pmd)
 	return __pmd(pmd_val(pmd) & ~(_PAGE_PRESENT|_PAGE_PROT_NONE));
 }
 
-#define __pmd_to_phys(pmd)  (pmd_val(pmd) >> _PAGE_PFN_SHIFT << PAGE_SHIFT)
+#define __pmd_to_phys(pmd)  ((pmd_val(pmd) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT << PAGE_SHIFT)
 
 static inline unsigned long pmd_pfn(pmd_t pmd)
 {
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index f80a34fbf102..db03c5a29d4c 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -55,7 +55,7 @@ static inline unsigned long stage2_pte_index(gpa_t addr, u32 level)
 
 static inline unsigned long stage2_pte_page_vaddr(pte_t pte)
 {
-	return (unsigned long)pfn_to_virt(pte_val(pte) >> _PAGE_PFN_SHIFT);
+	return (unsigned long)pfn_to_virt((pte_val(pte) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT);
 }
 
 static int stage2_page_size_to_level(unsigned long page_size, u32 *out_level)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
