Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DDE606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 13:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h3lgsbis;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h8uPEVg5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UuUZ2EPlUIC2BaAQfDRKJGrSe9xXIJ5cDQCqQ5ZtQDs=; b=h3lgsbisYje9QmBByoB3VCsaHZ
	vt2KrJlejRTeO84ve9l0oahYftk4Csk3XKySQpvuhglhcZkmLBpeNsQgsn+wjPYq4F//UQ43js0fR
	MhfZwmo85neA39oYbMSVMgCoos/mCv0gRDRRwX55Zn8dhqFbR10l7eEHUN9Ag7pQ1OIgWrOeadq1Z
	tRjoi/87/o8w+ambmeop33twefSYt9+GHD71giyagw7HmfAQcOtvKZcuZhZZTxC++VvyO55naW2cO
	G30JD+nzDagzMMOgsrPcJ14xR4AJXksNw69ikha8M0xVDwbMokl9KlXuUKSQhttzwAjRGS+GHl56U
	FK3bzosw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRV4S-0000000A7pB-0blM;
	Thu, 12 Nov 2026 13:42:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRV4P-0000000A7o2-1TTf
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 13:42:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 936AD61407;
	Thu, 12 Nov 2026 13:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B721F00A08;
	Thu, 12 Nov 2026 13:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794490948;
	bh=dqbquVni/DMcAyJArGqCAVcIns69uQDK2R6VFLb3mps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=h8uPEVg5/1VEkawZC7BHaxlQMaekT/tQlfN9hKtYXU1g+YP0qKcGKdVof/sA5bx4A
	 QWkJw8J7z6Wtc6krH+2hJGBzWRFbY2zxuAo+SEDHx9zBKBZ1HkoU0XDW+x0z2iyHj5
	 wvRwRR1kpvnWPGr1j5NFRUm7MBTrZwCCHQ+ABgouxA6N1yc93pOKJgQLueP1KYRYo+
	 jG7VAEhdpw1aWvuIKELc6eD21Nao+tU/RCKTuqsq7522eqSNgHFqrhoJjOxrmH3lUV
	 J2xS+yqX7LZTiGn8IjCUK5nWATF3jm2d6amqHG1O3bZIEWkqoGbg9KBEAhcYtbX2qK
	 cVKXnMPNe4m/g==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 12 Nov 2026 15:42:19 +0200
Subject: [PATCH 2/2] riscv: mm: check the valid bit in
 kernel_page_present()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261112-fixes-riscv-v1-2-1caac19897b5@kernel.org>
References: <20261112-fixes-riscv-v1-0-1caac19897b5@kernel.org>
In-Reply-To: <20261112-fixes-riscv-v1-0-1caac19897b5@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Mike Rapoport <rppt@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
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
 arch/riscv/mm/pageattr.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index b138113755359..62fbcf7cf36b6 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -453,8 +453,9 @@ bool kernel_page_present(struct page *page)
 	if (!pmd_present(pmdp_get(pmd)))
 		return false;
 	if (pmd_leaf(pmdp_get(pmd)))
-		return true;
+		return pmd_val(pmdp_get(pmd)) & _PAGE_PRESENT;
 
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
