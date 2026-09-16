Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7163C88E5C
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 06:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eokJyY5zlhm4Nvz3wfMg1OpZYCqRpFj9sg2n+EoZjeo=; b=0IzECLex5Y3x+f
	ixK84gBcQNFw8A0qkwIh5aXR17v3avR0lOZ/SlUHAVF+vPQDmoX/yOH2Yejs1PW4FheVb2VF/FRwH
	iVrtWBC2PqZD+Y2Y+b0SOmffm/msUyusda6Ghs8DRnUuG60cHJ3kjtJjTvYQGXlsh3SxeP/Wapy6d
	FtwTPk25DV/FBSLkQyF7zuHeBXentuXrqs5CDubTL4BCELG/6d0QpdqoUQOa1TkLCsYbK9lE864Q7
	ggej7sKM/1e/A26PRtLo1BLKOPSDUIPMCAzzG5KwmVEIcn31bk7XUesnd6fHaqNsfpH0u+N5GU5X2
	65FNwvqZ1RDmAPjguqrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jCj-00000008UHt-3CPz;
	Wed, 16 Sep 2026 06:33:13 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jCe-00000008UGi-09rA
	for linux-riscv@lists.infradead.org;
	Wed, 16 Sep 2026 06:33:13 +0000
Received: from [127.0.1.1] (unknown [223.166.93.127])
	by APP-03 (Coremail) with SMTP id rQCowAAnKjgUOKpq44zeBw--.39416S2;
	Wed, 16 Sep 2026 14:32:58 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Wed, 16 Sep 2026 14:32:44 +0800
Subject: [PATCH] riscv: mm: Apply T-Head PMA memory-type errata to PUD and
 P4D entries
MIME-Version: 1.0
Message-Id: <20260916-fix-mm-v1-1-297034b4457f@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAAs4qmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0Mz3bTMCt3cXF3DtCTLlGQD82RDwxQloOKColSgDNig6NjaWgB86+6
 MWAAAAA==
X-Change-ID: 20260916-fix-mm-1fb9dc07c11d
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Han Gao <rabenda.cn@gmail.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID: rQCowAAnKjgUOKpq44zeBw--.39416S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFy3XF1UJF43GFWxKr4DJwb_yoW8tw47pF
	WkJFyF9a95KryIkFW2kF1F9r15A395G39rGwsIk34kC3WYqFs7XFWqkw1UXF1rJFyI93W2
	yrZrtrs8Cr4ftwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-Originating-IP: [223.166.93.127]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiCRUMDGqqBo7dBwAAsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_233308_460474_7260F97B 
X-CRM114-Status: GOOD (  10.68  )
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

The T-Head memory-type errata injects the PMA type bits via
ALT_THEAD_PMA() when building a page table entry. It is applied in
pfn_pte(), pfn_pmd(), pfn_pgd() and pte_modify(), but not in pfn_pud()
or pfn_p4d().

As a result, PUD-level (1GB) and, on sv57, P4D-level (512GB) huge page
mappings never carry the T-Head PMA memory-type encoding. On cores that
require the errata, such mappings fall back to the implied/default PMA
instead of the explicit cacheable type the errata mandates, so their
memory attributes can differ from every other mapping size. These leaf
entries are reachable from the linear mapping (create_pud_mapping() with
PUD_SIZE) and from huge vmap.

Mirror pfn_pmd() and run ALT_THEAD_PMA() on the protection value in
pfn_pud() and pfn_p4d() as well.

Cc: stable@vger.kernel.org
Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/include/asm/pgtable-64.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 6e789fa58514c7dd11ef9c87050a3fa10fd4908d..1329a1ddee072dfb9a97f52bf1aad9f515aa96fe 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -212,7 +212,11 @@ static inline void pud_clear(pud_t *pudp)
 
 static inline pud_t pfn_pud(unsigned long pfn, pgprot_t prot)
 {
-	return __pud((pfn << _PAGE_PFN_SHIFT) | pgprot_val(prot));
+	unsigned long prot_val = pgprot_val(prot);
+
+	ALT_THEAD_PMA(prot_val);
+
+	return __pud((pfn << _PAGE_PFN_SHIFT) | prot_val);
 }
 
 static inline unsigned long _pud_pfn(pud_t pud)
@@ -313,7 +317,11 @@ static inline void p4d_clear(p4d_t *p4d)
 
 static inline p4d_t pfn_p4d(unsigned long pfn, pgprot_t prot)
 {
-	return __p4d((pfn << _PAGE_PFN_SHIFT) | pgprot_val(prot));
+	unsigned long prot_val = pgprot_val(prot);
+
+	ALT_THEAD_PMA(prot_val);
+
+	return __p4d((pfn << _PAGE_PFN_SHIFT) | prot_val);
 }
 
 static inline unsigned long _p4d_pfn(p4d_t p4d)

---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260916-fix-mm-1fb9dc07c11d

Best regards,
-- 
Han Gao <gaohan@iscas.ac.cn>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
