Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F9B606A33C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 11:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2x4LcDkh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=diFmkQfo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=A12sEuO97vmFHF350DccR7+Eb1CZDK+4YzDd6e4tKWA=; b=2x4LcDkhvUBzS5ilQ8gh66uGZ1
	GoTSggnHqVR9bAWFmcbL3cCHca0Q6VbipaBTAUjsFM0K24+Gp8CgSBVBYS6E5Z+nCbLf5ptRNYSQP
	XJ+zlSqn+YTMOpSbQZOq3V+v1YEPvGVNGUQLMjLpDAl2MNhAXpYsIOTCK5/cfKHPnl51TXZRYp9rp
	z4x44z2emgRPIyoncN12hGsjgOe5I5QdMJWZTseFEwO1AzXI6sEW7/oOahYmfRvSkZAEeZf53hKzB
	X5S4WdPuqVG8xZqrbEjldbC/FYwOqH38ZCX5Jz3IYZlUMUS6MaTx3AB+RvrzS92sowubLzB2bvNv2
	w03/xiBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXZe-0000000Cyo7-1yZl;
	Thu, 26 Nov 2026 11:23:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXYI-0000000CxOh-2pAY;
	Thu, 26 Nov 2026 11:22:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CA7743893;
	Thu, 26 Nov 2026 11:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A771F000C4;
	Thu, 26 Nov 2026 11:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795692130;
	bh=tUxcS45TVWAOQ3yj2MwWjXfOGvQz0MBdACY4dT2j47w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=diFmkQfoDg5QaKnzRhtb3dPuIfKNl0W3v2/HyhJ+bw2yp93GAHaSlIeWYzBHb/40m
	 i+ZtghuGSVyt695isWPEeoMaLeOsXG64CGjkz77ZObAMLql1JWy71PfnFBv6cXcAHP
	 fcz/yI6LnN1dX94cmS3ldnZicBUliyZTcZsAD/Zok4kH/2m9VTprVyh7kqa6YI5Cln
	 PPMegtrQjn23MEnKUCRDUCYTkntmVWGv1yGe7pI3s4ZvZXXqyimuS2nSji10j7XMoU
	 +EWnVm/T+sx6/6USLVlth9OiWz8f51m5+sw91RrDH7rROK0utXDuRj+7vNwFmAY6Bz
	 E9E2soRiU6+9A==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 26 Nov 2026 13:15:01 +0200
Subject: [PATCH RFC v2 48/54] mm/pageattr: let an architecture bracket the
 set_memory() entry points
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-generic-set-memory-v0-1-v2-48-723f1e33c3d8@kernel.org>
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

arm64 changes its kernel page tables in lazy MMU mode, so that a request
pays for one set of barriers for a range rather than one for every entry it
writes.

The core cannot enter lazy MMU mode by itself. On powerpc with the hash MMU
that disables preemption, and a CPA request may sleep.

Call arch_cpa_enter() and arch_cpa_leave() around the request of the
generic set_memory_*() and set_direct_map_*_noflush(). They do nothing by
default.

arm64 will use them to enable lazy MMU mode when it switches to the core.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/pageattr.h | 12 ++++++++++++
 mm/pageattr.c            | 12 ++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/include/linux/pageattr.h b/include/linux/pageattr.h
index 1a4e7c5dca98..a2a7235a633e 100644
--- a/include/linux/pageattr.h
+++ b/include/linux/pageattr.h
@@ -171,4 +171,16 @@ static inline void cpa_init_op(struct cpa_data *cpa,
 
 int arch_cpa_prepare(struct cpa_data *cpa, enum cpa_op op);
 
+#ifndef arch_cpa_enter
+static inline void arch_cpa_enter(void)
+{
+}
+#endif
+
+#ifndef arch_cpa_leave
+static inline void arch_cpa_leave(void)
+{
+}
+#endif
+
 #endif /* _LINUX_PAGEATTR_H */
diff --git a/mm/pageattr.c b/mm/pageattr.c
index 555e55e7ecea..d8ca8fb9bdd1 100644
--- a/mm/pageattr.c
+++ b/mm/pageattr.c
@@ -615,7 +615,11 @@ static int set_memory_op(unsigned long addr, int numpages, enum cpa_op op)
 	    !(cpa.flags & CPA_REQ_SPLIT))
 		return 0;
 
-	return change_page_attr(&cpa);
+	arch_cpa_enter();
+	ret = change_page_attr(&cpa);
+	arch_cpa_leave();
+
+	return ret;
 }
 
 int set_memory_x(unsigned long addr, int numpages)
@@ -661,7 +665,11 @@ static int set_direct_map(struct page *page, unsigned int nr, enum cpa_op op)
 	 * set_direct_map_*_noflush() change only the direct map, not its
 	 * aliases.
 	 */
-	return change_page_attr_noflush(&cpa);
+	arch_cpa_enter();
+	ret = change_page_attr_noflush(&cpa);
+	arch_cpa_leave();
+
+	return ret;
 }
 
 int set_direct_map_invalid_noflush(struct page *page, unsigned int nr)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
