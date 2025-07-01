Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F259C83038
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 16:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=26Mt7XWy3Z/cs9CgNxjTWzL+M+/4pivWDU96yzhumQ0=; b=GapE0yQAn8OoHs
	Vl3bXbqIXVoWgqyv+zc3cFaaQwMdFUPFskOV62Hm/+p8UkAySSz3OFW9wuQQt5JI8GfYN7MLS02iC
	yMIG/RAO8LnIe4xvi/oMtIyyOpXJpBctiv9qM0SAP/9BC7ShHFmZJ6OtRIigzfnsQrisZYKjQ4p3R
	dyPtVrDGZHRRM8p9jroi0uoKSJuRyC6LzyekRhRug6LNWpf1pSWVji5OPSoGL+rHUtU4iyt+w1ATU
	cqPl69SQ9KWcbqEP185K3NErTkJm8+5KorEUl4ZhWJBamn2C7tj/Rw0P0u5aNKyjRD2qv9ewXRDG6
	Z1jAhMPxSSLd3i0SaQkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdPR-00000005xZl-33le;
	Tue, 01 Jul 2025 16:00:37 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbm9-00000005fAR-2ILh
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 14:15:58 +0000
Message-ID: <0a96ce38-163e-4566-b666-b074bd82c75a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751379345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CbwuurgTDZ+BaZBkyMf18Zq8IPSFXnHhnJxSaiCg6gM=;
	b=rwerCEIAJb39fesv0EF8pOU/ob/YjbEMZ4v0sWNU2xHq0OxhcXljvBD2n5VH+/cKs1v5qS
	GEq/jLdRP4QJopKUgt18uPvXuzdrO+Gw3KUgU3FysEGlvfuCeVyGbBJd7yShJDeT+1GSXC
	8ObslLOB3iUPbBIQR6Kfi8w4SylwS7k=
Date: Tue, 1 Jul 2025 22:15:27 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 21cnbao@gmail.com
Cc: baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, huang.ying.caritas@gmail.com, zhengtangquan@oppo.com,
 riel@surriel.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 harry.yoo@oracle.com, mingzhe.yang@ly.com, stable@vger.kernel.org,
 Barry Song <baohua@kernel.org>, Lance Yang <ioworker0@gmail.com>
References: <20250630011305.23754-1-lance.yang@linux.dev>
 <330f29ee-ba55-4ae6-a695-ddaba58d5cb8@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <330f29ee-ba55-4ae6-a695-ddaba58d5cb8@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_071557_729947_3F2D5734 
X-CRM114-Status: GOOD (  11.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 2025/7/1 22:03, David Hildenbrand wrote:
> On 30.06.25 03:13, Lance Yang wrote:
>> From: Lance Yang <lance.yang@linux.dev>
>>
>> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
>> may read past the end of a PTE table when a large folio's PTE mappings
>> are not fully contained within a single page table.
>>
>> While this scenario might be rare, an issue triggerable from userspace 
>> must
>> be fixed regardless of its likelihood. This patch fixes the out-of-bounds
>> access by refactoring the logic into a new helper, 
>> folio_unmap_pte_batch().
>>
>> The new helper correctly calculates the safe batch size by capping the 
>> scan
>> at both the VMA and PMD boundaries. To simplify the code, it also 
>> supports
>> partial batching (i.e., any number of pages from 1 up to the calculated
>> safe maximum), as there is no strong reason to special-case for fully
>> mapped folios.
>>
>> [1] https://lore.kernel.org/linux-mm/ 
>> a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com
>>
>> Fixes: 354dffd29575 ("mm: support batched unmap for lazyfree large 
>> folios during reclamation")
>> Cc: <stable@vger.kernel.org>
>> Acked-by: Barry Song <baohua@kernel.org>
>> Suggested-by: David Hildenbrand <david@redhat.com>
> 
> Realized this now: This should probably be a "Reported-by:" with the 
> "Closes:" and and a link to my mail.

Got it. Both tags (Reported-by/Closes) will be in the next commit ;)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
