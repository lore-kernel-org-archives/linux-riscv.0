Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F26CD6E5D
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 12:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sP5isdPeJU1jnHDI8HxS1d3AF/JiCtL1S23DvMBmD0k=; b=v9LHM3jbWWO3fL
	Ln39cs+63l9qhYd+K4qHZPB/R/awXqnn/laVr6Lz3zZqmPE/oEKDc5y4BDZXwDp8WMJfruj9sKwVo
	1BFd6xqexCBaGxjIZQdBB0/2rTsGPp2HZvx5uV8zoOMXtleJW00TbQyrly0duvvktgYtaXK1E8IKe
	f1GibqNaEdqETJE71+fI1LauKPTRKpeZZmHEp8qnVrFB/LhwzsNEvC4R9rEBO4DMABZnK+goR/c0q
	9TNRvT9ExMPznyoUV9bAmF5i2UCvfkryufTxIzCFJXWDRbx4uSwkHzkHM2UElcpTktZOmOhFJmVNN
	HdKKjXdgKI75qexHg5aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1ui-0000000B9SE-0Hxe;
	Mon, 01 Jun 2026 12:38:40 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1uf-0000000B9RE-1817
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 12:38:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780317513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y8Q9MsGaEY5Id3cDoyk/LMPpb+cY3ipFpIzkjqGDFMo=;
	b=t9X+k6PkHR5WsisChw0O5VpIHYqYLwjr9DFuC/tgFLuN5u0rKS+6y8bhT2MX1ghqTZTr+n
	DuMVk9niJvJLHdW7PBgKF1COtMWreGWe69fkyAbs03os4PWMGg/jK82UDtSe59liiNNRDy
	2uJ7I61UVj726QpKC4J0NufWJLLoJoQ=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v3 1/5] mm/sparse-vmemmap: provide generic
 vmemmap_set_pmd() and vmemmap_check_pmd()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <db8d440d-c8a1-4f77-b5d9-00bab8737f12@kernel.org>
Date: Mon, 1 Jun 2026 20:37:42 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Andreas Larsson <andreas@gaisler.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org,
 Alexandre Ghiti <alex@ghiti.fr>,
 Albert Ou <aou@eecs.berkeley.edu>,
 WANG Xuerui <kernel@xen0n.name>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>
Message-Id: <0D4AF42F-37C5-4A76-9703-44ACC6374C48@linux.dev>
References: <20260601084845.3792171-1-songmuchun@bytedance.com>
 <20260601084845.3792171-2-songmuchun@bytedance.com>
 <db8d440d-c8a1-4f77-b5d9-00bab8737f12@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_053837_517685_EABFFC64 
X-CRM114-Status: GOOD (  15.09  )
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



> On Jun 1, 2026, at 20:22, David Hildenbrand (Arm) <david@kernel.org> wrote:
> 
> On 6/1/26 10:48, Muchun Song wrote:
>> The two weak functions are currently no-ops on every architecture,
>> forcing each platform that needs them to duplicate the same handful
>> of lines.  Provide a generic implementation:
>> 
>> - vmemmap_set_pmd() simply sets a huge PMD with PAGE_KERNEL protection.
>> 
>> - vmemmap_check_pmd() verifies that the PMD is present and leaf,
>>  then calls the existing vmemmap_verify() helper.
>> 
>> Architectures that need special handling can continue to override the
>> weak symbols; everyone else gets the standard version for free.
>> 
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>> v2->v3:
>> - Replace BUG_ON() with WARN_ON_ONCE() in vmemmap_set_pmd()
>> ---
>> mm/sparse-vmemmap.c | 7 ++++++-
>> 1 file changed, 6 insertions(+), 1 deletion(-)
>> 
>> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
>> index 112ccf9c71ca..99e2be39671b 100644
>> --- a/mm/sparse-vmemmap.c
>> +++ b/mm/sparse-vmemmap.c
>> @@ -386,12 +386,17 @@ int __meminit vmemmap_populate_hvo(unsigned long addr, unsigned long end,
>> void __weak __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
>>       unsigned long addr, unsigned long next)
>> {
>> + 	WARN_ON_ONCE(!pmd_set_huge(pmd, virt_to_phys(p), PAGE_KERNEL));
> 
> 
> Not sure if a VM_WARN_ON_ONCE() would be appropriate. (then, we have to move the
> pmd_set_huge() out of the statement).

I think it might be better to keep WARN_ON_ONCE here. This way, we can still
monitor for warnings in production while keeping the code simple.

> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks.

> 
> 
> -- 
> Cheers,
> 
> David



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
