Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE3E606A321
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 04:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oI1l8yZa;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=J+aTWeug
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=j8/p28gILRmd5YTB4EHLtj14AQc4tWm97eyhH5UHLZ4=; b=oI1l8yZayeGXFVQQ+fFn5YVMlL
	/uePGCdDwHhquC754LUYx6Kuo8HU2kNj/XPyAG7/CLCy9o0vVVB/4QMlJzs1hVAW2pf+At5JzRbLC
	UhVekODM6NWiaVjBwoWTbQ3SIN4R4krKEcwrVyuAtmf0H+4bFFBKKXrkmmSVh9+VyoRFY+w5rj/Sa
	2OowyW+S4A7q5RRvPPmbZ5osi18Mqnsx63geCRd8OSJeIbWI3OaMZja5ZPG3ahrfxi83fMhpfZRS4
	xXZct0izi8CcFr8n5l+0xDiy86mp9Vn+5JO9iKnIX2+YFjzeBAi6nHAFAqnSa/NMkRCPJCSkYSG3l
	JXqMQwkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQH50-0000000HJfN-0tPr;
	Mon, 09 Nov 2026 04:34:02 +0000
Received: from out-151.mta1.migadu.com ([95.215.58.151] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQH4v-0000000HJeQ-3lcs
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 04:33:59 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Uhs7BWZm2N+gFKXL/TmYjVQYKnl8VlxGISFVM5NLm40=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794198836; v=1; x=1794803636;
 b=J+aTWeugil4lbZaw86bysXlj72KJ1YDD/oBtNnrnxpwFt1Zv3v92oWKWjh4hCRQhawyW6UvD
 SrnwHPTpMGnc32HdDCtbC3titUBPWUSWN+J0XGBgJevyXUJILOhMtgkDhR1TxBlSmyoG0ILcNWb
 71MK+oj5lMtq7adOxfFCoBjg=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b7fb94620bed6bfe;
	Mon, 09 Nov 2026 04:33:56 +0000
X-Mizu-Trace-ID: b7fb94620bed6bfe
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: david@kernel.org,
	maddy@linux.ibm.com,
	rppt@kernel.org,
	akpm@linux-foundation.org,
	lance.yang@linux.dev,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	osalvador@suse.de,
	qi.zheng@linux.dev,
	muchun.song@linux.dev,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 3/5] loongarch/mm: disable device DAX vmemmap optimization
Date: Mon,  9 Nov 2026 12:33:46 +0800
Message-ID: <20261109043346.38778-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261107043122.25650-4-songmuchun@bytedance.com>
References: <20261107043122.25650-4-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_203358_081648_EBB7BE2C 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sat, Nov 07, 2026 at 12:31:20PM +0800, Muchun Song wrote:
>LoongArch selects ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP but not
>ARCH_WANT_OPTIMIZE_DAX_VMEMMAP. Its vmemmap_free() implementation is also
>empty, so it cannot tear down optimized Device DAX mappings.
>
>A later change removes the generic Device DAX architecture gate and lets
>vmemmap_populate() decide whether a section can use optimization. Clear the
>section compound order in the LoongArch path so Device DAX keeps using
>unoptimized mappings.
>
>This does not affect HugeTLB HVO: LoongArch does not support gigantic
>pages, so HugeTLB does not use section-based vmemmap optimization there.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---
>v2:
>- New patch using section_vmemmap_optimization_disable() to keep Device
>  DAX vmemmap optimization disabled on LoongArch (reported by Sashiko)
>---
> arch/loongarch/mm/init.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
>index f801f7097f03..ea769e479241 100644
>--- a/arch/loongarch/mm/init.c
>+++ b/arch/loongarch/mm/init.c
>@@ -15,6 +15,7 @@
> #include <linux/memblock.h>
> #include <linux/memremap.h>
> #include <linux/mm.h>
>+#include <linux/vmemmap-optimization.h>
> #include <linux/mman.h>
> #include <linux/highmem.h>
> #include <linux/swap.h>
>@@ -143,6 +144,7 @@ void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
> int __meminit vmemmap_populate(unsigned long start, unsigned long end,
> 			       int node, struct vmem_altmap *altmap)
> {
>+	section_vmemmap_optimization_disable(start, end);

Yeah, clearing the order here keeps Device DAX optimization disabled once
the generic gate goes away ;)

Nothing jumped out at me, feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
