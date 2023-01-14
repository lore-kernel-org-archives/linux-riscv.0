Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6160C3DA78
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Jan 2023 16:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TluLAux/rLQa4/5kcrXrhdCq4+OnDTrvx0xcI29qACA=; b=b/VO0ko/eoi/hT
	D1catqt0jAvKb8XMh9G45rkgw6V+NfaRZBHfZQWFTSf0YM9F+FXeWXERdwN+seI7fISKQJJlzoaoh
	b+v1rhQa1MuqPaqr/ZFNp20B5OWGfay32xwkRI54DcBWtOTd87y5dETCYlw/WXZTddEfuLixhaOXj
	BNgtDdX6m/v1hxXXVNF9zAsMMg/Y+cUEu1i+lgUKfEoKzarfG3Mefm+LAMMWp7VmzQWwTQFprvE6p
	qzhSLMATzkl+cQ4HAkat2RYrFCZJoIp5w1ZLzMoL/u7EKyMcxl6Iqgpkpgsp2WpIslT/aEnbPe9AN
	WGCCNNC33lOjcTaO4PdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGj6V-006Aw3-6r; Sat, 14 Jan 2023 16:09:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGj6S-006AuX-Dk
	for linux-riscv@lists.infradead.org; Sat, 14 Jan 2023 16:09:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673712595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3R4pvBr6dG+A0u3o+nBNguX6qX9S+oXSEacD+sP77s=;
	b=RYgsdZXkGI1f/95E0Bt12LQTW7+y1Cp31FI+IKA8rNsaxR8YRiQ1lb33rMgOBQxZ6p2mxB
	4X/dkZu6t8wOJjuCifo3GAe71EM2/IgwbdYp04hwcxbFC9VzFRloVa1HqcimOqKg06VhSt
	3fJcvqNlHqPTxQG4qtjQt2YImiggJbQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-70-6zY0bkvGMK6TqBHio7JiAg-1; Sat, 14 Jan 2023 11:09:39 -0500
X-MC-Unique: 6zY0bkvGMK6TqBHio7JiAg-1
Received: by mail-wm1-f71.google.com with SMTP id bg25-20020a05600c3c9900b003da1f6a7b2dso3222991wmb.1
        for <linux-riscv@lists.infradead.org>; Sat, 14 Jan 2023 08:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3R4pvBr6dG+A0u3o+nBNguX6qX9S+oXSEacD+sP77s=;
        b=imPY6Qt7JaQMRjjN+JQ5Fdz8MHA9SwpXzqn6Q2bbIULc6B9EbyMRvn+8q9knGInsSB
         VHPCwH/tXbkvSp2xpzyuAj1xq6fPm0xSHk0AYJ+tA0+pi/YhLJSNSLW+uX1IaLthTbeT
         5gDX/B5YN4sMzKTko/zQzsEkLxWyKdSR0RjCU6M4lgzwcip0HzEKuvKl+BUZej4gzi8w
         vA2Djd/8r9GhzwEhareRT+o4ipIqMo+shSeHEboGYYomKh1B6jYYsd8ff8hjoSgSgpqg
         BpmRx03Ty38GGyZ1WBTHbKXtHfpLgATYjgG09W0q7MErEFQ8RhLsGylyLttsVsEaZXZo
         ZpIg==
X-Gm-Message-State: AFqh2krUJnjHVc0JFSHXx9ynZvFosYbRXgdbNgk1jvznxmyHLLADGoXh
	nFxIfahgqdQPfpTxZNYYcSm3TP2pWYh2z70k9wDziA8YaTS+VrZCXY6zu/7/2ulDP3xEf/SaZ4m
	hDwXQZIp4mmmz8wnR50oOBxeVcytT
X-Received: by 2002:a05:600c:348b:b0:3d1:f16b:30e6 with SMTP id a11-20020a05600c348b00b003d1f16b30e6mr62422472wmq.28.1673712578337;
        Sat, 14 Jan 2023 08:09:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtvXECQ77f+OwG9Mdcw6TdAWlLhcG76s2TeMh5Hr9A1VofwYXs3lPZWG9daADyc7xNo4jh7zQ==
X-Received: by 2002:a05:600c:348b:b0:3d1:f16b:30e6 with SMTP id a11-20020a05600c348b00b003d1f16b30e6mr62422426wmq.28.1673712578037;
        Sat, 14 Jan 2023 08:09:38 -0800 (PST)
Received: from ?IPV6:2003:cb:c71c:9800:fa4a:c1fc:a860:85af? (p200300cbc71c9800fa4ac1fca86085af.dip0.t-ipconnect.de. [2003:cb:c71c:9800:fa4a:c1fc:a860:85af])
        by smtp.gmail.com with ESMTPSA id q18-20020adfdfd2000000b002bdc129c8f6sm10260315wrn.43.2023.01.14.08.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jan 2023 08:09:37 -0800 (PST)
Message-ID: <6aaad548-cf48-77fa-9d6c-db83d724b2eb@redhat.com>
Date: Sat, 14 Jan 2023 17:09:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins
 <hughd@google.com>, John Hubbard <jhubbard@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Yang Shi <shy828301@gmail.com>, Vlastimil Babka <vbabka@suse.cz>,
 Nadav Amit <namit@vmware.com>, Andrea Arcangeli <aarcange@redhat.com>,
 Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, x86@kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org
References: <20230113171026.582290-1-david@redhat.com>
 <20230113171026.582290-2-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH mm-unstable v1 01/26] mm/debug_vm_pgtable: more
 pte_swp_exclusive() sanity checks
In-Reply-To: <20230113171026.582290-2-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230114_080956_547551_42F95CB2 
X-CRM114-Status: GOOD (  18.56  )
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

On 13.01.23 18:10, David Hildenbrand wrote:
> We want to implement __HAVE_ARCH_PTE_SWP_EXCLUSIVE on all architectures.
> Let's extend our sanity checks, especially testing that our PTE bit
> does not affect:
> * is_swap_pte() -> pte_present() and pte_none()
> * the swap entry + type
> * pte_swp_soft_dirty()
> 
> Especially, the pfn_pte() is dodgy when the swap PTE layout differs
> heavily from ordinary PTEs. Let's properly construct a swap PTE from
> swap type+offset.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---

The following fixup for !CONFIG_SWAP on top, which makes it compile for me and
passes when booting on x86_64 with CONFIG_DEBUG_VM_PGTABLE:

...
[    0.347112] Loaded X.509 cert 'Build time autogenerated kernel key: ee6afc0578f6475656fec8a4f9d02832'
[    0.350112] debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page table helpers
[    0.351217] page_owner is disabled
...


 From 6a6162e8af62a4b3f7b9d823fdfae86de3f34a9d Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Sat, 14 Jan 2023 16:47:12 +0100
Subject: [PATCH] fixup: mm/debug_vm_pgtable: more pte_swp_exclusive() sanity
  checks

generic_max_swapfile_size() is only available with CONFIG_SWAP -- which
makes sense, because without SWAP there are no swap files. Let's
simply probe manually which bits we can obtain after storing them in a
PTE, and properly call it "max swap offset", which is more generic for
a swap entry.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
  mm/debug_vm_pgtable.c | 8 +++++---
  1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 3da0cc380c35..af59cc7bd307 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -810,15 +810,17 @@ static void __init pmd_swap_soft_dirty_tests(struct pgtable_debug_args *args) {
  
  static void __init pte_swap_exclusive_tests(struct pgtable_debug_args *args)
  {
-	unsigned long max_swapfile_size = generic_max_swapfile_size();
+	unsigned long max_swap_offset;
  	swp_entry_t entry, entry2;
  	pte_t pte;
  
  	pr_debug("Validating PTE swap exclusive\n");
  
+	/* See generic_max_swapfile_size(): probe the maximum offset */
+	max_swap_offset = swp_offset(pte_to_swp_entry(swp_entry_to_pte(swp_entry(0, ~0UL))));
+
  	/* Create a swp entry with all possible bits set */
-	entry = swp_entry((1 << MAX_SWAPFILES_SHIFT) - 1,
-			  max_swapfile_size - 1);
+	entry = swp_entry((1 << MAX_SWAPFILES_SHIFT) - 1, max_swap_offset);
  
  	pte = swp_entry_to_pte(entry);
  	WARN_ON(pte_swp_exclusive(pte));
-- 
2.39.0



-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
