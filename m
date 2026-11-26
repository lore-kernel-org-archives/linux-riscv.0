Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3B4606A32D
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 11:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WYA5mOyM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kJyTKMIe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5X0dPAh8MSWXYS0E/kziKuPsnfTeo3Z83ipYPa7bEgI=; b=WYA5mOyMDb/6FB/uAXCDkopJtb
	/+0gI2brDGy5E6VGIKnkX90HsXVP9oC/5UNKBWXrXs3huTTCWWbO9vgsvwRYzn06kT/B4dVlBERRq
	osyB+GrlzT/iGsvrbbfUaLmtqotewczBAB0V0z8HxwbOWobDEV/C0g2e/cpzwlIymOrrIfCs8yubX
	44dXenQ4Mv3SO3Q143JSyk76zzB5mHEdQbGQRLY2Wi7qXr+ZSupEXm2CWd2Aj6E2bNjnwTv9f8y6k
	lmsTSKs8XFnhreuzYbaywFzYvQbeYmTo+Ckz/HAmULtUIrlbfeHQMu6n+w5hartTaBiYDVrzhdlj3
	UNQohKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXRI-0000000Cpj8-0RTW;
	Thu, 26 Nov 2026 11:14:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXR7-0000000CpeK-1saM;
	Thu, 26 Nov 2026 11:14:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FFB943B27;
	Thu, 26 Nov 2026 11:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488AA1F000C4;
	Thu, 26 Nov 2026 11:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795691684;
	bh=+zAN299vizOOPECPls5C9ly2hX7A6i/wCUYEhdWTrYE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kJyTKMIef9KUJ7TrzxTw1NFRlFaRrs8sShSVVpag23heJBC0+PbBRsR1oW1Wkkfe3
	 /BEDq5VE3iJDg9scZN+INRUCab6B1pQg4aSTRrJ64C0kKSQyJj5olaROHEH5iUjs+j
	 8wKpdu+jFo2YDtHGgaZw4V+6poffdw5Oag7Yqa5qdXG3V3GPOwPnZgPhV6dXf9v76W
	 Sb0W8VbJ3BmR3nLdG+OyaPztr9yMUdYv/loapVRW0yE+e+WYmM44YbzJciMR6VYcE8
	 wGiDHGR3bmNJb9AN7Zbx5mEvbwquRTkTxaAYZtEGd9VyUgt5DRG8mbCQoHnOAjKSOb
	 +bMedTT8QILgA==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 26 Nov 2026 13:14:14 +0200
Subject: [PATCH RFC v2 01/54] riscv: do not use P4D entries for the linear
 mapping
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-generic-set-memory-v0-1-v2-1-723f1e33c3d8@kernel.org>
References: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
In-Reply-To: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
To: linux-mm@kvack.org
Cc: =?utf-8?q?Adrian_Barna=C5=9B?= <abarnas@google.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Borislav Petkov <bp@alien8.de>, Brendan Jackman <brendan.jackman@linux.dev>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vasily Gorbik <gor@linux.ibm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, x86@kernel.org
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

The linear map uses P4D sized leaves with Sv57 since commit 3335068f8721
("riscv: Use PUD/P4D/PGD pages for the linear mapping"), but riscv has no
p4d_leaf() and the generic stub returns false.

As a result, kernel page table walks treat P4D leaves as tables and wrongly
descend to lower levels. This affects the split in set_memory_*(),
kernel_page_present(), ptdump and the hibernation page table copy.

Stop creating P4D leaves rather than teaching every walker about them, as
commit 629db01c64ff ("riscv: Don't use PGD entries for the linear mapping")
did for PGD leaves.

Fixes: 3335068f8721 ("riscv: Use PUD/P4D/PGD pages for the linear mapping")
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/riscv/mm/init.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 070ee69eabb3..e1bcc3a16129 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -717,10 +717,6 @@ static uintptr_t __meminit best_map_size(phys_addr_t pa, uintptr_t va, phys_addr
 	if (debug_pagealloc_enabled())
 		return PAGE_SIZE;
 
-	if (pgtable_l5_enabled() &&
-	    !(pa & (P4D_SIZE - 1)) && !(va & (P4D_SIZE - 1)) && size >= P4D_SIZE)
-		return P4D_SIZE;
-
 	if (pgtable_l4_enabled() &&
 	    !(pa & (PUD_SIZE - 1)) && !(va & (PUD_SIZE - 1)) && size >= PUD_SIZE)
 		return PUD_SIZE;

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
