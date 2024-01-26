Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA45CC47DDB
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 19:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FmpjrG39A8oKM32uBe59e65MYNmleb6Vn8W668NGex4=; b=UqApaVl1viDvVl
	vdStoG9VvaGm67GgPWeP20Vy5CPY3YR3BXeh28g4GgyK0YF0NjUKRnaqBQCsEVAJGyvwvZHhoFMIr
	KJQa5zWd1Vj5wfcmcIWY1/GQmkl9abPk1LOnU3acwjs8iHmJ9aQE2cL1AbGtFIEFC6GtkYxK1jkTX
	eMEXmBuYUDpDv1julkXHqyNtt5c/Jf3w5UGAIRgJ3PecWpoBGacWSnbEc6YQdBa6H7rXJ0s60Pza9
	1f00RP3oUQTNa5j/mG0s0BNrOpjhUIv3uU/DFe+cE/0KxvbWrc5NB9ChAK939EdHBvDf61Y/w6HUv
	tyxPDH+XYCH5KohceVjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTRbv-00000005AbP-2jfI;
	Fri, 26 Jan 2024 19:11:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTRbt-00000005AZY-2TdY
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jan 2024 19:11:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706296284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4g8K7l28tbM/mldWkR+pvjoSC5Y71b2XjVOt+98pFVU=;
	b=hkRALx7DRadyyFtZYHWweWw1ou80cjuK7z+H0EZFpEo40h7umGQK78zV2fgCv/D5n1XYFf
	AKHNbc2BMlg4I5marHix7kpmhdwpMlhFSCc4B5LWVBIJ13LM/oiQzUlyxokNzmRqtx65aI
	hN/1yxDmTWQcjt/FfTXqVKUVY0K4jE0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-WQBrxztBNW2zwASVqbqp-Q-1; Fri, 26 Jan 2024 14:11:22 -0500
X-MC-Unique: WQBrxztBNW2zwASVqbqp-Q-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3392d419c7dso546112f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jan 2024 11:11:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706296282; x=1706901082;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4g8K7l28tbM/mldWkR+pvjoSC5Y71b2XjVOt+98pFVU=;
        b=BtrRpp7qLBmJv4OvEySG/jnzaqD0L2X8YIPWJ9fCppI5Ry7+ETV5wV5paYArprYisX
         hhSRsz7heTSmSYPxM2a2y2xINoTwdeu5ED8fnx+jnT4LncL/w6HNMwqWCyH6KanIz1Da
         tSkvsqic96xbs2PFXAxlF9ytjQqSnjc83OT1iOTpQoU6UKgmTLbnsZgg9AMSy6HVIhOD
         xOhPeBZNMCd/ghY0fKpEfMHsshUpFpiiS999auYe7DH1zfmRo1g4way3p1i3C+m1LBrK
         w0LNFIu/E3E/o8uUn3ZfZtDiVbqBC8gmk0X1IA08489MeeAOVXUiKTI/NP13/5NSAPmk
         0GAg==
X-Gm-Message-State: AOJu0Yy0a2Pw8r890jZVbOXwtJDOq6URjs2BArfpn+A2PedkfrvlKMKD
	mVbcO86epV1n3z058JRPTIT47J8OV3yQX4zSCVYUElf+VF6JkorN3eUYG7yDR8EZUV2yrQYF3WF
	rDpSeOs4iO9CzbWl9yW6EVy3Akljarwfb2XPoRi1qU5o96n6qz3Bnydn+hmVRfNLpSg==
X-Received: by 2002:adf:e34e:0:b0:337:a81a:a92 with SMTP id n14-20020adfe34e000000b00337a81a0a92mr93406wrj.16.1706296281741;
        Fri, 26 Jan 2024 11:11:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2W4KZitVtEWtyaZogLu/njgh6vBkydyWO+lquJ8xT0VP90E3HBBntnlOQm8GtijC18P28qA==
X-Received: by 2002:adf:e34e:0:b0:337:a81a:a92 with SMTP id n14-20020adfe34e000000b00337a81a0a92mr93386wrj.16.1706296281267;
        Fri, 26 Jan 2024 11:11:21 -0800 (PST)
Received: from ?IPV6:2003:cb:c70a:5100:7e95:22ff:3f9b:1e92? (p200300cbc70a51007e9522ff3f9b1e92.dip0.t-ipconnect.de. [2003:cb:c70a:5100:7e95:22ff:3f9b:1e92])
        by smtp.gmail.com with ESMTPSA id h5-20020adfe985000000b00337d67a85c1sm1811358wrm.62.2024.01.26.11.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 11:11:20 -0800 (PST)
Message-ID: <5b5b2ceb-9099-4acc-a995-d979ad414c6a@redhat.com>
Date: Fri, 26 Jan 2024 20:11:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] mm/memory: optimize fork() with PTE-mapped THP
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S. Miller"
 <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org
References: <20240125193227.444072-1-david@redhat.com>
 <20240125193227.444072-14-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240125193227.444072-14-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_111129_722383_270B85CC 
X-CRM114-Status: GOOD (  24.82  )
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

On 25.01.24 20:32, David Hildenbrand wrote:
> Let's implement PTE batching when consecutive (present) PTEs map
> consecutive pages of the same large folio, and all other PTE bits besides
> the PFNs are equal.
> 
> We will optimize folio_pte_batch() separately, to ignore selected
> PTE bits. This patch is based on work by Ryan Roberts.
> 
> Use __always_inline for __copy_present_ptes() and keep the handling for
> single PTEs completely separate from the multi-PTE case: we really want
> the compiler to optimize for the single-PTE case with small folios, to
> not degrade performance.
> 
> Note that PTE batching will never exceed a single page table and will
> always stay within VMA boundaries.
> 
> Further, processing PTE-mapped THP that maybe pinned and have
> PageAnonExclusive set on at least one subpage should work as expected,
> but there is room for improvement: We will repeatedly (1) detect a PTE
> batch (2) detect that we have to copy a page (3) fall back and allocate a
> single page to copy a single page. For now we won't care as pinned pages
> are a corner case, and we should rather look into maintaining only a
> single PageAnonExclusive bit for large folios.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   include/linux/pgtable.h |  31 +++++++++++
>   mm/memory.c             | 112 +++++++++++++++++++++++++++++++++-------
>   2 files changed, 124 insertions(+), 19 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 351cd9dc7194f..891ed246978a4 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -650,6 +650,37 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addres
>   }
>   #endif
>   
> +#ifndef wrprotect_ptes
> +/**
> + * wrprotect_ptes - Write-protect consecutive pages that are mapped to a
> + *		    contiguous range of addresses.
> + * @mm: Address space to map the pages into.
> + * @addr: Address the first page is mapped at.
> + * @ptep: Page table pointer for the first entry.
> + * @nr: Number of pages to write-protect.
> + *
> + * May be overridden by the architecture; otherwise, implemented as a simple
> + * loop over ptep_set_wrprotect().
> + *
> + * Note that PTE bits in the PTE range besides the PFN can differ. For example,
> + * some PTEs might already be write-protected.
> + *
> + * Context: The caller holds the page table lock.  The pages all belong
> + * to the same folio.  The PTEs are all in the same PMD.
> + */

After writing documentation for another two such functions, I'll change this to:

/**
  * wrprotect_ptes - Write-protect PTEs that map consecutive pages of the same
  *		    folio.
  * @mm: Address space the pages are mapped into.
  * @addr: Address the first page is mapped at.
  * @ptep: Page table pointer for the first entry.
  * @nr: Number of entries to write-protect.
  *
  * May be overridden by the architecture; otherwise, implemented as a simple
  * loop over ptep_set_wrprotect().
  *
  * Note that PTE bits in the PTE range besides the PFN can differ. For example,
  * some PTEs might be write-protected.
  *
  * Context: The caller holds the page table lock.  The PTEs map consecutive
  * pages that belong to the same folio.  The PTEs are all in the same PMD.
  */

-- 
Cheers,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
