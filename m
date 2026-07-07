Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B030C44500
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 09:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=laXnyBF1GZ7ToIjteMrN1xfu84O2CGVpJjra8/xTqrw=; b=M1N8IFRyuYBHGU
	7UF6V/AuC3PC337DFZdLbmEAtdO7XQWisuAXepJeO7RkBEJU129GsDaDPHRLrcZKnokXY9iOgPPl/
	qR7lmaR8rgyAwmXIf3Ba8J11Hr1iTfFyn9IDxNt6KV3TwHjPersUrPiMeSMSi7zOs7QNHHqEyrQle
	wjcHsznnooyq1H8C9P3p+yADNeoBA9C5oCOw81Y5mGBPHV96/sXcr9Nm8X+3bw9O86GkMHkwiOSqP
	s458etRWRoQq259HvDOAU1800QuKfFZ320GUH5SgRyYmjSXZSmme7av9dL8a/mZXcASDuJ4t4wRZe
	LVD+xSbxhT1GYrF8IrnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1mY-0000000EZkn-0J9P;
	Tue, 07 Jul 2026 09:07:58 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1mT-0000000EZiq-1HWH
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 09:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783415257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xr6g3bVCDzcHhHO6pC/xBWOeuWudquosOcZYH5S6bcw=;
	b=xQXJCbKAWMmYOnxQ+DB6kohB54dGQKI+UC+Zllio7pzZV4FSW94xuJt3hYJTpHXgVaRur/
	BGvqlZk/gjTX5rAcHSBfmQ2+RxaeRAouBb9E5+a5un9CxUL1x00wcLXjDcUQT+nMhL46YA
	YHD71ej/Jbe34Gdc2tJsgdDOvRYpkCA=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v5] mm/sparse-vmemmap: flush_cache_vmap() after
 hotplugging vmemmap
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <99eac2ba-a4e5-4885-aa81-b0c43f6fc4b2@iscas.ac.cn>
Date: Tue, 7 Jul 2026 17:07:00 +0800
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
Message-Id: <77B0BBBA-0CDF-49F4-9B07-D35D0D864612@linux.dev>
References: <20260707-mark-after-vmemmap-populate-v5-1-77d1ded3cae3@iscas.ac.cn>
 <99eac2ba-a4e5-4885-aa81-b0c43f6fc4b2@iscas.ac.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_020753_501571_CC3E765C 
X-CRM114-Status: GOOD (  13.36  )
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



> On Jul 7, 2026, at 13:03, Vivian Wang <wangruikang@iscas.ac.cn> wrote:
> 
> Please disregard. I made a mistake while submitting this patch.
> 
> I'll send a fixed v6 later. Sorry.

Please fix issues reported by Sashiko excluding pre-existing ones.

Thanks.

> 
> On 7/7/26 12:10, Vivian Wang wrote:
>> section_activate() does not flush TLB after populating new vmemmap
>> pages. On most architectures, this is okay. However it is a problem on
>> RISC-V since there the TLB caching non-present entries is permitted,
>> which causes spurious faults on some hardwares.
>> 
>> This seems to be most easily reproduced with DEBUG_VM=y and
>> PAGE_POISONING=y, which causes these newly mapped struct pages to be
>> poisoned i.e. written to immediately after mapping.
>> 
>> Extend the RISC-V flush_cache_vmap() to also handle the vmemmap range,
>> and call it after hotplugging vmemmap, which gets the possible spurious
>> fault handled in the exception handler.
>> 
>> At least for now, the only other architecture with both
>> SPARSEMEM_VMEMMAP and flush_cache_vmap() is PowerPC, which has a similar
>> problem with newly valid PTEs. But there flush_cache_vmap() is just a
>> ptesync. So it should be safe to do this for generic code while having
>> minimal performance impact.
>> 
>> Suggested-by: Muchun Song <muchun.song@linux.dev>
>> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
>> ---
> [...]



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
