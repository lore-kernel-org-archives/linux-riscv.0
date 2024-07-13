Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720EDC3DA45
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Jul 2024 07:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0oew59AV1LHtqVGmjkObiwl3N5rrOF22/niy0uhC2A=; b=DfzFfgmLvsCgMM
	L3Iiv/n5MOOHtI+N681xqIXSN9MyehJCaQP5p1QdZQf+WhN9oKi5lFeJcB4XBgf83VwZagd/Cf40a
	JG/IdFjkEXUICoTQpUri9vdAadipPFJLCJmHKie72W4oWbSJA5HN5rkkk7yABtq5PDw1CswZ3I8ji
	4cVkzpSQDc8J2DKRXTQyKnMvfpFVMeEPW0GrPlS8c/BpX9zMhJmgCwe82hUw1NuDhN44DE9PGYwDU
	p1uMuJQI66lLBXB/pt/5RHHXyGeutE2IdV2wZnj8uvmzwnkFEuz5SLlI44eMPMOgcyPqqxI2Dt7j7
	6JYJaA0Uqykn9iIDz81Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSWtP-0000000252g-2FCW;
	Sat, 13 Jul 2024 07:10:03 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSWsg-000000024eo-3eCS;
	Sat, 13 Jul 2024 07:09:20 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WLfhX1pTzz9sSW;
	Sat, 13 Jul 2024 09:09:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QGR30cHzyt9i; Sat, 13 Jul 2024 09:09:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WLfhW68VNz9sSS;
	Sat, 13 Jul 2024 09:08:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C0DA28B76C;
	Sat, 13 Jul 2024 09:08:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Is4Ot-2G3sfo; Sat, 13 Jul 2024 09:08:59 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.195])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CA20E8B764;
	Sat, 13 Jul 2024 09:08:58 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org
Subject: [PATCH v3 3/5] LoongArch: Do not define pud_leaf() when there is no PMD
Date: Sat, 13 Jul 2024 09:08:25 +0200
Message-ID: <732f3bdff0eed9cadfd35c698fd625e6e6cd6a04.1720854135.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <c81566e5df160587de50f9095d0ec377114fdba8.1720854135.git.christophe.leroy@csgroup.eu>
References: <c81566e5df160587de50f9095d0ec377114fdba8.1720854135.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720854504; l=1137; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=RQbVBWOxUSgTrrtTd+PLaiyfFRNFBzohHDDwKNmlF88=; b=kyeTq4tTk01pp+vPiGqPZ3xAI/bTN/2nOUDzVVH38OHwoM7j5I4X1quNwT1FsruuJa0FOTAwZ rE5KJnkCyhRC1DTqMd1fiL38cWn3qM95rUdVmXFoo9KKFZEIFgqwdKA
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240713_000919_072354_72C3C1CF 
X-CRM114-Status: GOOD (  10.72  )
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

pud_leaf() is already provided by asm-generic/pgtable-nopmd.h

Do not add a macro that hides and overrides the static inline
definition in asm-generic/pgtable-nopmd.h.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/loongarch/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 161dd6e10479..da91b2d8bc6f 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -207,6 +207,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
 
 #define pud_phys(pud)		PHYSADDR(pud_val(pud))
 #define pud_page(pud)		(pfn_to_page(pud_phys(pud) >> PAGE_SHIFT))
+#define pud_leaf(pud)		((pud_val(pud) & _PAGE_HUGE) != 0)
 
 #endif
 
@@ -611,7 +612,6 @@ static inline long pmd_protnone(pmd_t pmd)
 #endif /* CONFIG_NUMA_BALANCING */
 
 #define pmd_leaf(pmd)		((pmd_val(pmd) & _PAGE_HUGE) != 0)
-#define pud_leaf(pud)		((pud_val(pud) & _PAGE_HUGE) != 0)
 
 /*
  * We provide our own get_unmapped area to cope with the virtual aliasing
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
