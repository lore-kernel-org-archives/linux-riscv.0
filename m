Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC3BC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 05:05:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 188516135B
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 05:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 188516135B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kaKeaoM60JAziq8uKCH0+Javz0CCUh1OkSCqMJEcYaA=; b=IOxP9wHImfqeWMjBecyMXpYyov
	GR7SIlU20NT8kCeGE4vrrLfiG9d6iveSqj400q/mOJL5tQ3vO1UUlexzrEiVvSxRBp4ry1akkCzBI
	PmCqtl/JMbblF8NgCkNr7EzRt20vX05jz+E15/vQysv7GsQ0soHbnEzKTfx9R60vsRXvyEQMm8ze2
	Pqb6XeU1xF24TawhXqWoMcfcR1BexCPUNS6S4V1LNPJXxHMnBT4ndqS1FMufPVFWWexHSX4EZPOlN
	ipAJano6rjHR+mJ1SMFwcFhRhAXr/ZAQFmj3E1YqYoH2VOhiZ/98Zcvkp5Qc3V4ELW0GTiXON47EI
	EoUtXAdQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljEOj-002o5J-Dn; Wed, 19 May 2021 05:05:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljEOg-002o4A-Qm
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 05:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=lHs06fqmuQ5mBNnljnhvA2ss3HnpHOY/L1Ee4ospZoA=; b=rb7SU6HEGhAub2Z7bsf0cFiKkH
 GxoOqmS8d5QPl0789LxXorme2FCVztZQbdc3DIF07Pmo42ZXkp2Ucb6dyVGmcUFuDShZQudryB4Ld
 +hSoqYXRYoR6FVx1hYcsEcNn1TLKUSRNIAVZdUSmc2GCqpQnS2XPL2fvPp5iO72ubA74RsMSuxjJp
 exuQdyjTFssP7EYE/Qd0O5VEL3exxwa7YcGmK9gYzcLlN/Ujxbc5xZoiT+yGPUEtoddc4qQRuhFNC
 o0dxryetvS7etGtI+wzIs5jqNJPveCCqfyExHuqwfjpriMDTVFzqnfJEuaU4QdEcydyJXvyA6z1+n
 TX7Tijyg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljEOe-00F8ZS-5Y
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 05:05:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4401E61364;
 Wed, 19 May 2021 05:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621400727;
 bh=Mc4hZG1Zr7Tnoyw/Uvexi2F7Qpbq/iGh58EZtVvBeAI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I4jJGnA5e17WivC5h1/FZT2i6/Or1dFr3+vaoIvac6qtpJQT36d+n/Pn5b0ez3kos
 9gg1htVsfY+qbUxZD9z75CfsUdfK1zzz+PSU1IpXxHsFlRQO5ITwpdEAcI4lBEHten
 XuAFJXgDK/eUPKZXYPQbrHsaS3mS349sOheRzMDObKnwyIO4ZtFba96Rd6Vad01lx2
 hKzvhmTCaQhq8iQuwpgimSRWMRYFGXKla9gJ+d6JtOahOEB7y9eNCk9UtyzFM+F+Zm
 AYoeLfBEz+Lgz2mgpGCNhpUNwAE+lUJwFWHbKlloQVNi+vId5mK4+JsFZy1bH0Enil
 0SINvKMDVdhEg==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 drew@beagleboard.org, hch@lst.de, wefu@redhat.com, lazyparser@gmail.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH RFC 1/3] riscv: pgtable.h: Fixup _PAGE_CHG_MASK usage
Date: Wed, 19 May 2021 05:04:14 +0000
Message-Id: <1621400656-25678-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621400656-25678-1-git-send-email-guoren@kernel.org>
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_220528_265252_EA79BA49 
X-CRM114-Status: GOOD (  11.12  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

'& _PAGE_CHG_MASK' should masks all attributes BITS then
'>> _PAGE_PFN_SHIFT' get the final correct PFN value.

'& _PAGE_CHG_MASK' makes the code semantics more accurate.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Drew Fustini <drew@beagleboard.org>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Wei Fu <wefu@redhat.com>
Cc: Wei Wu <lazyparser@gmail.com>
---
 arch/riscv/include/asm/pgtable-64.h | 8 +++++---
 arch/riscv/include/asm/pgtable.h    | 6 +++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index f3b0da6..cbf9acf 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -62,12 +62,14 @@ static inline void pud_clear(pud_t *pudp)
 
 static inline unsigned long pud_page_vaddr(pud_t pud)
 {
-	return (unsigned long)pfn_to_virt(pud_val(pud) >> _PAGE_PFN_SHIFT);
+	return (unsigned long)pfn_to_virt(
+		(pud_val(pud) & _PAGE_CHG_MASK) >> _PAGE_PFN_SHIFT);
 }
 
 static inline struct page *pud_page(pud_t pud)
 {
-	return pfn_to_page(pud_val(pud) >> _PAGE_PFN_SHIFT);
+	return pfn_to_page(
+		(pud_val(pud) & _PAGE_CHG_MASK) >> _PAGE_PFN_SHIFT);
 }
 
 static inline pmd_t pfn_pmd(unsigned long pfn, pgprot_t prot)
@@ -77,7 +79,7 @@ static inline pmd_t pfn_pmd(unsigned long pfn, pgprot_t prot)
 
 static inline unsigned long _pmd_pfn(pmd_t pmd)
 {
-	return pmd_val(pmd) >> _PAGE_PFN_SHIFT;
+	return (pmd_val(pmd) & _PAGE_CHG_MASK) >> _PAGE_PFN_SHIFT;
 }
 
 #define pmd_ERROR(e) \
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 9469f46..869d6bf 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -216,12 +216,12 @@ static inline unsigned long _pgd_pfn(pgd_t pgd)
 
 static inline struct page *pmd_page(pmd_t pmd)
 {
-	return pfn_to_page(pmd_val(pmd) >> _PAGE_PFN_SHIFT);
+	return pfn_to_page((pmd_val(pmd) & _PAGE_CHG_MASK) >> _PAGE_PFN_SHIFT);
 }
 
 static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 {
-	return (unsigned long)pfn_to_virt(pmd_val(pmd) >> _PAGE_PFN_SHIFT);
+	return (unsigned long)pfn_to_virt((pmd_val(pmd) & _PAGE_CHG_MASK) >> _PAGE_PFN_SHIFT);
 }
 
 static inline pte_t pmd_pte(pmd_t pmd)
@@ -232,7 +232,7 @@ static inline pte_t pmd_pte(pmd_t pmd)
 /* Yields the page frame number (PFN) of a page table entry */
 static inline unsigned long pte_pfn(pte_t pte)
 {
-	return (pte_val(pte) >> _PAGE_PFN_SHIFT);
+	return ((pte_val(pte) & _PAGE_CHG_MASK) >> _PAGE_PFN_SHIFT);
 }
 
 #define pte_page(x)     pfn_to_page(pte_pfn(x))
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
