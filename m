Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694BD606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 14:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wdnGvOOr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ojjM4wVX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KcayJ4rCH/DKadLy+qaemUA/jtjfKXwaBhLGoNGUKUk=; b=wdnGvOOrTwyabicxJivK28WxKi
	qCvpenLmW64c/qXVcGgDtCXTWwM9eLMSq4I0q32nIv9qj0pPxT0tgKF8kqbIHVT0jk6mPvCmiXGPE
	IIj1FqejiDZ4rzsYOQW+K/ICfH4Vhua09T27sHBZyXi9SWcISg1IUSWizo8S8L2pQbur6RPWX21rp
	yjXck8Ls0oNn0u5bLqqrgwg2h4WlcgKTBO8YvfbP+7yR6UFHUfxeZDlHVy6QrSn/TsmZBOlgxS7XK
	INJvEvBToCw1oObgxc4vpQSK/IDiidWeXphiBk4xyr2WD1RRNB1CuWJcPylRpaW/xFjIaLlOs2oML
	GxLVIiog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJjb-00000006272-3f5L;
	Tue, 17 Nov 2026 14:00:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJjZ-0000000625r-46XS
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 14:00:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F6A263525;
	Tue, 17 Nov 2026 14:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F8E1F000CD;
	Tue, 17 Nov 2026 14:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924029;
	bh=PaSpzfjLcp7igfDIyJz+8MA/pcT4rZXruabsNht94zM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ojjM4wVXpAlMLrEN7Hu87eessuJ/x7zF7MBF4cu2bozT3SheD/Rcr+UENuMH11SSk
	 P7A8vQl/1JpQNWBekxNO/BH+wQLZxN2Y8kzw4hJe9fSnkrvNW3BiKngwy/VRsqzzSY
	 w/Le2ftac9dSucqEQKUP3XhQMwGSImueD9cTdk1/PTMqBgN4/nU4nbpmi6guQtNLpU
	 DqM/f7V28REpMPFCXw6kF3m8IDCZHQj+u5DtgErNCSVb/j7h2cvXDXWodErBolL5k/
	 RLVrmIuFoQbw8xRW0t4Dm/5P7yTWIXoXPnh2NY09fy2VBsIeQCyuy0D1NesLebjGjm
	 uk/a12o6fe9Hw==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 17 Nov 2026 16:00:21 +0200
Subject: [PATCH v2 2/2] riscv: mm: check the valid bit in
 kernel_page_present()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-fixes-riscv-v2-2-5edc9bdc54fd@kernel.org>
References: <20261117-fixes-riscv-v2-0-5edc9bdc54fd@kernel.org>
In-Reply-To: <20261117-fixes-riscv-v2-0-5edc9bdc54fd@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.16.1-dev
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

set_direct_map_invalid_noflush() clears _PAGE_PRESENT, but the kernel
mappings keep _PAGE_PROT_NONE set: it used to be _PAGE_READ and now it is
the same bit as _PAGE_GLOBAL. pte_present() and pmd_present() still
return true for the invalidated entry. kernel_page_present() then reports
that an unmapped page is mapped, and hibernation copies it without
remapping it first.

Test _PAGE_PRESENT directly for PMD and PTE leaves.

Fixes: 32a0de886eb3 ("arch, mm: make kernel_page_present() always available")
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/riscv/mm/pageattr.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index b13811375535..5a1a3b4473c9 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -428,7 +428,7 @@ bool kernel_page_present(struct page *page)
 	pgd_t *pgd;
 	pud_t *pud;
 	p4d_t *p4d;
-	pmd_t *pmd;
+	pmd_t *pmd, pmdval;
 	pte_t *pte;
 
 	pgd = pgd_offset_k(addr);
@@ -450,11 +450,13 @@ bool kernel_page_present(struct page *page)
 		return true;
 
 	pmd = pmd_offset(pud, addr);
-	if (!pmd_present(pmdp_get(pmd)))
+	pmdval = pmdp_get(pmd);
+	if (!pmd_present(pmdval))
 		return false;
-	if (pmd_leaf(pmdp_get(pmd)))
-		return true;
+	if (pmd_leaf(pmdval))
+		return pmd_val(pmdval) & _PAGE_PRESENT;
 
+	/* pte_present() is true for PAGE_KERNEL with _PAGE_PRESENT cleared */
 	pte = pte_offset_kernel(pmd, addr);
-	return pte_present(ptep_get(pte));
+	return pte_val(ptep_get(pte)) & _PAGE_PRESENT;
 }

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
