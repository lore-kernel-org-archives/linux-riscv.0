Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF07C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 06:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KpzUYJLmw4pdDBxfJVipe+mrcqv2T8BclqGNavJ+tHI=; b=WKLxZcauopQ1F2
	2WDSZ9aZyqRy587oBnkS8qu3b+P3nBpqzZ8qek22sQBd6zTlyJh1m0/kUD3Q3D5mhIEUuHE9j+0TP
	Rivq2DL2CFr0Xa9w6RuIlbUUU2W31g49ofnAHMHfRF1fSzzHao5KXH8OPcto80PVGzXJCbD/mPkXL
	Mb764p8x8TVvd+16nO1BmfoTFz6ty4hjJzmttON6aVwWaiJyTMfgtT3suVGjs1Q7fCe3Q+Bgudl8m
	ZB0V41+unYUbvva4EZ6GLJFBDNGUItjXcMZRmnEdDLIVb+iQ9JY5ig0b+XApU8VFenzvLl055ka87
	VoUhIlFZ3j0FvoUkC4sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAbL-00000008JYC-1aY6;
	Mon, 13 Jul 2026 06:57:15 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAbI-00000008JWv-0QpI
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 06:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783925817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rQAHpQDnzihtw7jcUMgYCPB2YUVD98f2lEQKq6RVkg0=;
	b=vMUGp8iBd1hqNeUPKxjP4p0bJFLxsPJZdFXYfyNfrZEFB8SOrt0nsGk1PmHgAdCt7na0d3
	WAOdaqiOJcYxuaKTkqzor0ti+U7UHlHUBarAj40wN3K7o83Iv5finEphcMq7v8m7SFNY+C
	t1J0uv9KOP7rJQiciUwn73tu3PMzjKA=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v6 2/2] mm/sparse-vmemmap: flush_cache_vmap() after
 hotplugging vmemmap
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260713-mark-after-vmemmap-populate-v6-2-b945ceba29d4@iscas.ac.cn>
Date: Mon, 13 Jul 2026 14:56:20 +0800
Cc: Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Vlastimil Babka <vbabka@kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 linux-riscv@lists.infradead.org
Message-Id: <E058B2BD-768A-4949-B5F3-7CBAC1347410@linux.dev>
References: <20260713-mark-after-vmemmap-populate-v6-0-b945ceba29d4@iscas.ac.cn>
 <20260713-mark-after-vmemmap-populate-v6-2-b945ceba29d4@iscas.ac.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_235712_355202_CD0B2597 
X-CRM114-Status: GOOD (  15.88  )
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



> On Jul 13, 2026, at 14:15, Vivian Wang <wangruikang@iscas.ac.cn> wrote:
> 
> section_activate() does not flush TLB after populating new vmemmap
> pages. On most architectures, this is okay. However it is a problem on
> RISC-V since there the TLB caching non-present entries is permitted,
> which causes spurious faults on some hardwares.
> 
> This seems to be most easily reproduced with DEBUG_VM=y and
> PAGE_POISONING=y, which causes these newly mapped struct pages to be
> poisoned i.e. written to immediately after mapping.
> 
> Extend the RISC-V flush_cache_vmap() to also handle the vmemmap range,
> and call it after hotplugging vmemmap, which gets the possible spurious
> fault handled in the exception handler.
> 
> At least for now, the only other architecture with both
> SPARSEMEM_VMEMMAP and flush_cache_vmap() is PowerPC, which has a similar
> problem with newly valid PTEs. But there flush_cache_vmap() is just a

PowerPC is actually unaffected here since it achieves the desired effect
via vmemmap_set_pmd. However, your patch will pave the way for a great
cleanup to remove PowerPC's architectural vmemmap_set_pmd, given that it
already relies on flush_cache_vmap() for the required barrier operations.

> ptesync. So it should be safe to do this for generic code while having
> minimal performance impact.

After the cleanup for the PowerPC, it will emit only once ptesync operation,
so it will be a minor performance improvement.

> 
> Suggested-by: Muchun Song <muchun.song@linux.dev>
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
