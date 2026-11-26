Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85C2606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 11:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t8ZVrmzK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FhZQrkbz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=t23osjtrKJf/RJ5UPXaNHe7soh9Xkow8E8SUggPfu+U=; b=t8ZVrmzKebvD4UfkSMFzMbUu1R
	+RVfyt+z5sh2DlQCo80l6plIAWy02mlHCOSxDNCxxKFS9iOqZYOcwZLTihSbZxIZxxcUJMGnkf7SF
	I+xPXBTe7uxPiRvIzVE9ihm1E6wG7DMjhVgM7KHKibDjOSiaQsltbLOMhGxPdb7c+/xFH3lwxZJos
	kKnD4g0ANveZ7keFexaSnXIFvtxwcJf42bVD93/Km2LsOWQKinuxGejCcMwErzrhT1hToU9lX0l7A
	UwuIvthSMISvSMsDgQPT8CC2govs+qVExoIu8hR4nH7yPVjDwMMvCXC5hUneM6iwQXweJvd5kLEpt
	hJYzxBuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXSf-0000000Cqxm-0LEr;
	Thu, 26 Nov 2026 11:16:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXSB-0000000CqW7-35jy;
	Thu, 26 Nov 2026 11:15:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 27EDB6287A;
	Thu, 26 Nov 2026 11:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D505E1F000EC;
	Thu, 26 Nov 2026 11:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795691750;
	bh=h6atE1eiwuCb7s2iVfEQ/DOpR2uoMH4CREq7+ID+nSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FhZQrkbz9fLLnez5g+K/QukESaIZIWw4BT9B08hF5j5QN2u6tKoJzJ/Yb/7cnqB06
	 xmLy3Wcd/+Voi2G+cmzi7XjISmA4zNa9ThOqO0aFQw+C5bMuBQj1Lk6itrFCWHRYPP
	 Jka7N3AyNFtHwsawLaetbg6iFvshEsmLB1RYhXPtDlqBqvtLqZEYicW5T9i7jVez//
	 Ax6uVcl6ftm7I1WlpQ0rhuZRHvzUYiXOnWeMhJuREHnMcCgscaqFCcPFebtk3I2of/
	 JYgnQXacJLJciJaZNGT+pTjMR4p1+op/86rB8u49OUkdSz7jnoVEY2tWzEh+RXgIaH
	 6eNcuB/DKwnaA==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 26 Nov 2026 13:14:21 +0200
Subject: [PATCH RFC v2 08/54] x86/mm/pat: fail a split at an unexpected
 level with -EINVAL
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-generic-set-memory-v0-1-v2-8-723f1e33c3d8@kernel.org>
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

__split_large_page() returns 1 when it encounters an unexpected level, or
when another CPU split the large page first.

split_large_page() frees the page table and returns 0 in both cases, and
__change_page_attr() looks the address up and tries again. For an
unexpected level it tries forever.

Getting there would be a bug, because no mappings ever use P4D leaves.
Still, a level CPA cannot split should fail the request rather than loop.

Return -EINVAL for an unexpected level and pass it up to the caller.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/pat/set_memory.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index db41f94f2355..217c739371ee 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -1178,7 +1178,7 @@ __split_large_page(struct cpa_data *cpa, pte_t *kpte, unsigned long address,
 		break;
 
 	default:
-		return 1;
+		return -EINVAL;
 	}
 
 	ref_prot = pgprot_clear_protnone_bits(ref_prot);
@@ -1230,6 +1230,7 @@ static int split_large_page(struct cpa_data *cpa, pte_t *kpte,
 			    unsigned long address)
 {
 	pte_t *pte;
+	int ret;
 
 	spin_unlock(&cpa_lock);
 	if (cpa->init_mm_read_locked)
@@ -1241,8 +1242,11 @@ static int split_large_page(struct cpa_data *cpa, pte_t *kpte,
 	if (!pte)
 		return -ENOMEM;
 
-	if (__split_large_page(cpa, kpte, address, pte))
+	ret = __split_large_page(cpa, kpte, address, pte);
+	if (ret)
 		pte_free_kernel(&init_mm, pte);
+	if (ret < 0)
+		return ret;
 
 	return 0;
 }

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
