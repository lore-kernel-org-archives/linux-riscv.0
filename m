Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDABB606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 15:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JpQEnLm9;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=C35Jq0pf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J3ISNpilEmcpJT+W/0NZGxPfjOWpwQq+U2nVq7sx5oA=; b=JpQEnLm9Wf/S4wnKpfSTZUCQKo
	lvzvfyqicgWFBswp6WyNVAFTq9SJKjBwbi5vHRxW9kWMUdYR7jdpWGy604CJ522EviVGkcSyEeP54
	AvuO6a/GMafpfml0ajgyBJaPuCRajd1atUPJPPyASEny01WdHKfPWADbRc9tnUBpUUbD0KRGgojdD
	jlH0BdFaBKfzCGR1g9vBz4PZK312q6CBL7f+a2GrfiLXbhYYJPYPo0TySou/3sdb9DRgeasGSvwXh
	tZpjrUCK2nkFe2xf1CIXvNkvqqEwYMc5mxP1D1iSXumdC+8zGmga9OvhDS6/ZZDaaF+ahNz+73yDp
	YENvBUrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLMcE-00000002lKa-3xMx;
	Mon, 26 Oct 2026 15:28:02 +0000
Received: from out-148.mta0.migadu.com ([2001:41d0:1004:224b::94] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLMcC-00000002lJH-3M28
	for linux-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 15:28:02 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=BD5GR4twj1Y0cxe10dqIpaa4/qJ/AH8RfmV9ehRX730=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793028476; v=1; x=1793633276;
 b=C35Jq0pfAi43X24zs7+pws0mYLmITR+OUzEveCg0XkZvazu8n4wJD73zrHK7x5S+fEpLQuLX
 P49c8d0YGrGpUtVW23hk8Og+UipwHF8cebaDl0rHVHYY/y46DZkmAf4UXIXMFQh48UVakZafxcK
 AZ370RiZGW/kNAJoqjyubAWo=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b2b5afc969dd0a08;
	Mon, 26 Oct 2026 15:27:56 +0000
X-Mizu-Trace-ID: b2b5afc969dd0a08
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: alex@ghiti.fr,
	palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu
Cc: akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn,
	rppt@kernel.org,
	kas@kernel.org,
	david@kernel.org,
	andrew+kernel@donnellan.id.au,
	rmclure@linux.ibm.com,
	debug@rivosinc.com,
	baolin.wang@linux.alibaba.com,
	usama.arif@linux.dev,
	wangruikang@iscas.ac.cn,
	namcao@linutronix.de,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alexghiti@rivosinc.com,
	viro@zeniv.linux.org.uk,
	ajones@ventanamicro.com,
	arnd@arndb.de,
	axelrasmussen@google.com,
	brauner@kernel.org,
	conor.dooley@microchip.com,
	conor@kernel.org,
	jack@suse.cz,
	liam@infradead.org,
	ljs@kernel.org,
	mhocko@suse.com,
	paul.walmsley@sifive.com,
	peterx@redhat.com,
	robh@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	yuanchu@google.com,
	stable@vger.kernel.org,
	pasha.tatashin@soleen.com,
	linux-mm@kvack.org,
	me@ziyao.cc
Subject: Re: [PATCH 1/1] riscv/mm: fix soft-dirty migration PMDs being treated as present
Date: Mon, 26 Oct 2026 23:27:45 +0800
Message-ID: <20261026152745.11239-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261004030312.90163-1-lance.yang@linux.dev>
References: <20261004030312.90163-1-lance.yang@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_082800_985705_DDAABCF8 
X-CRM114-Status: GOOD (  10.78  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Gently ping ... Hi RISC-V folks, any thoughts on the proposed fix?

On Sun, Oct 04, 2026 at 11:03:12AM +0800, Lance Yang wrote:
>RISC-V uses _PAGE_EXEC for swap soft-dirty tracking when
>CONFIG_MEM_SOFT_DIRTY is enabled and Svrsw60t59b is available. That's
>a problem for PMD migration entries, since pmd_present() also checks
>_PAGE_LEAF (R/W/X) to recognize THPs with _PAGE_PRESENT temporarily
>cleared during splitting.
>
>When a soft-dirty THP is migrated, set_pmd_migration_entry() preserves
>soft-dirty with pmd_swp_mksoft_dirty(), setting the X bit in the
>migration PMD. Even with _PAGE_PRESENT clear, we end up treating a
>migration PMD as a present THP! The fault handler skips
>pmd_migration_entry_wait(), and a write fault can end up in
>do_huge_pmd_wp_page(), where pmd_page() decodes the migration entry
>as a mapped PFN.
>
>Move the swap soft-dirty bit to bit 12 and start the swap offset at
>bit 13 when CONFIG_MEM_SOFT_DIRTY is enabled. This keeps R/W/X clear
>in migration PMDs and lets us keep the existing pmd_present() check
>for invalidated THPs. Leave the offset at bit 12 when soft-dirty
>tracking is disabled.
>
>Fixes: 2a3ebad4db63 ("riscv: mm: add soft-dirty page tracking support")
>Cc: stable@vger.kernel.org
>Signed-off-by: Lance Yang <lance.yang@linux.dev>
>---
>I found this while reviewing Usama's PMD-level swap entries series [1]
>and comparing the swap flag bits with the PMD presence checks across
>architectures.
>
>[1] https://lore.kernel.org/all/20261002095503.3585565-1-usama.arif@linux.dev/
>
> arch/riscv/include/asm/pgtable-bits.h |  6 +++---
> arch/riscv/include/asm/pgtable.h      | 10 ++++++----
> 2 files changed, 9 insertions(+), 7 deletions(-)
>
>diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
>index d5a86b4df3ce6..d84b459e010c1 100644
>--- a/arch/riscv/include/asm/pgtable-bits.h
>+++ b/arch/riscv/include/asm/pgtable-bits.h
>@@ -27,12 +27,12 @@
> 	((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?	\
> 	 (1UL << 59) : 0)
> /*
>- * Bit 3 is always zero for swap entry computation, so we
>- * can borrow it for swap page soft-dirty tracking.
>+ * Bit 12 is reserved for swap soft-dirty tracking. The swap offset
>+ * starts at bit 13 when CONFIG_MEM_SOFT_DIRTY is enabled.
>  */
> #define _PAGE_SWP_SOFT_DIRTY						\
> 	((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?	\
>-	 _PAGE_EXEC : 0)
>+	 (1UL << 12) : 0)
> #else
> #define _PAGE_SOFT_DIRTY	0
> #define _PAGE_SWP_SOFT_DIRTY	0
>diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>index b644db16bda94..acaf6d3b54d04 100644
>--- a/arch/riscv/include/asm/pgtable.h
>+++ b/arch/riscv/include/asm/pgtable.h
>@@ -1178,18 +1178,20 @@ static inline pud_t pud_modify(pud_t pud, pgprot_t newprot)
>  *
>  * Format of swap PTE:
>  *	bit            0:	_PAGE_PRESENT (zero)
>- *	bit       1 to 2:	(zero)
>- *	bit            3:	_PAGE_SWP_SOFT_DIRTY
>+ *	bit       1 to 3:	_PAGE_LEAF (zero)
>  *	bit            4:	_PAGE_SWP_UFFD
>  *	bit            5:	_PAGE_PROT_NONE (zero)
>  *	bit            6:	exclusive marker
>  *	bits      7 to 11:	swap type
>- *	bits 12 to XLEN-1:	swap offset
>+ *	bit           12:	_PAGE_SWP_SOFT_DIRTY (CONFIG_MEM_SOFT_DIRTY)
>+ *	bits 12/13 to XLEN-1:	swap offset (without/with CONFIG_MEM_SOFT_DIRTY)
>  */
> #define __SWP_TYPE_SHIFT	7
> #define __SWP_TYPE_BITS		5
> #define __SWP_TYPE_MASK		((1UL << __SWP_TYPE_BITS) - 1)
>-#define __SWP_OFFSET_SHIFT	(__SWP_TYPE_BITS + __SWP_TYPE_SHIFT)
>+#define __SWP_OFFSET_SHIFT \
>+	(__SWP_TYPE_BITS + __SWP_TYPE_SHIFT + \
>+	 IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
> 
> #define MAX_SWAPFILES_CHECK()	\
> 	BUILD_BUG_ON(MAX_SWAPFILES_SHIFT > __SWP_TYPE_BITS)
>-- 
>2.49.0
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
