Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505C2C54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 10:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGHN6VyIyhL4Jf2wIZMAId/SkB5ART9woP2YwqUu07Y=; b=SxUH/NboHHgtW9
	tBESiiF8vNqZrx8E3hkMyzXIf0tbgERK66uoHPz2OX+hCDalRR3oZNsEdjdrLdMER6sntt9R+Z2zi
	oOG81HzFAWFzhp3pVEy0rc9CO8bx+vDV4gKAxh+nLWeToOhKFA17V6xjIF11PTpMIeoIpkevnuaf8
	HOOfv+dKQuInUYU5j3LCL0XNUvp/IVz2/c2TfubKdlpgFL9YFQlxAeDVrgCsi2Hf9kssYj2N354eq
	65KaIN15T1ZNqK/3GGEbgcpoqtSOwpLzxzCS1WNbGgfggVJChQRiD8oekJOvy7SbUKBoy+hYRuiZz
	Yyi8xG6tpXOfJlPaHBVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpmj1-0000000DV4O-3Lcs;
	Thu, 28 Mar 2024 10:11:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpmiy-0000000DV2T-0Kz8
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 10:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711620667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hLHNuBUsHivnnoXg+gTbcgdr/MWic5w5iJ85B7qcDKo=;
	b=B4IV+xjAHVTI+PtdcejlBHZyN4E4N2pClcXYa+eGlkoeiUEBtei4qhCDRpeeT3t4fUwvKO
	jWcVE2SvgkdR2Q5jrsmzYWLVKGN5wF/aRntTYrOVEI2MxArivoD41YBAaSZt3FqRvyw0x0
	ZUr4Yoxcd3jwlK5gkTg8/ghTFGjEGQk=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-5L7LkWKbP7u-9TjS2P7PXg-1; Thu, 28 Mar 2024 06:11:03 -0400
X-MC-Unique: 5L7LkWKbP7u-9TjS2P7PXg-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-515c9eec197so212714e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 03:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711620662; x=1712225462;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLHNuBUsHivnnoXg+gTbcgdr/MWic5w5iJ85B7qcDKo=;
        b=Rlory1eCfZWQpTGx4duXIV128FnCXy6DjjdtKBUOj6WXR0J0vI/Jk/4a8GeQORVXlL
         dK4Do4IO04GzKx+oPbXqVkdXxCWu2YROzumBSZ5SlwM0kYbjnbxkEW8jVVTo8g4phI1Y
         bgA52I14+HnYg9iJ+tut9j1OVnwIdeXNThiirYWynfgBlV5NvgGyx4KZjHirria96PaJ
         V4CwIDQ9wpYqg6PWIlgjAbv6Sgzq83sBOOjSL6jbkkPrdjKMg5np8hu+3ZaHqhYk18f3
         NrdW3xu5zAzfaaA5f0ybNJJV1NlBceZDDa7Fmq18k1eQNMJHUV1lyl5qCpOYCTNW8KyL
         Hd1A==
X-Forwarded-Encrypted: i=1; AJvYcCVNA7Eh2UwR3J0nYXjf+8GIV3Ffl0sfLZvja7hc/eRDPv8ERX1WNor6PVyOoecM4M7eEpiuhWLO91y610ifeFo5ll8Bw+8ht4IAPwVkaQNs
X-Gm-Message-State: AOJu0YyqUnhoL75QUbh/dIBRZnE8tHj+lT9YRkMoYjn3Buz1MPmbSR5O
	vCWVLjXuiA86Xfb5EeptKTcPLqR+24j+76nSjc3sHvzbFUnMTu3bk6TU6dhUhu3+0pLJkPT/mC7
	utct0gLoYY+dkEUfyUdwDW2XeFUPxzXrXEHO3qB036fK8cfo3sZkx9664zwDAShS+NA==
X-Received: by 2002:ac2:44cb:0:b0:513:a8fc:95d7 with SMTP id d11-20020ac244cb000000b00513a8fc95d7mr1360049lfm.38.1711620661943;
        Thu, 28 Mar 2024 03:11:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHYQU8kxpYM4jVYSDvtGoR0p1IRQOO6x9SQkiA3Zc9ExgaYMDl44yGXybjHsfrkFhFyhcpwA==
X-Received: by 2002:ac2:44cb:0:b0:513:a8fc:95d7 with SMTP id d11-20020ac244cb000000b00513a8fc95d7mr1360023lfm.38.1711620661535;
        Thu, 28 Mar 2024 03:11:01 -0700 (PDT)
Received: from ?IPV6:2003:cb:c714:3600:8033:4189:6bd4:ea29? (p200300cbc7143600803341896bd4ea29.dip0.t-ipconnect.de. [2003:cb:c714:3600:8033:4189:6bd4:ea29])
        by smtp.gmail.com with ESMTPSA id i4-20020adfefc4000000b0033b6e26f0f9sm1344502wrp.42.2024.03.28.03.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 03:11:01 -0700 (PDT)
Message-ID: <372a9331-6d95-4083-9a8f-a4f714868bea@redhat.com>
Date: Thu, 28 Mar 2024 11:10:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/13] mm/gup: Drop folio_fast_pin_allowed() in hugepd
 processing
To: peterx@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Yang Shi <shy828301@gmail.com>, "Kirill A . Shutemov"
 <kirill@shutemov.name>, Mike Kravetz <mike.kravetz@oracle.com>,
 John Hubbard <jhubbard@nvidia.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Jones <andrew.jones@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@infradead.org>, Lorenzo Stoakes <lstoakes@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Rik van Riel <riel@surriel.com>,
 linux-arm-kernel@lists.infradead.org, Andrea Arcangeli
 <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, James Houghton <jthoughton@google.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Rapoport <rppt@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-7-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240327152332.950956-7-peterx@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_031108_827640_136EE7F5 
X-CRM114-Status: GOOD (  15.91  )
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

On 27.03.24 16:23, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> Hugepd format for GUP is only used in PowerPC with hugetlbfs.  There are
> some kernel usage of hugepd (can refer to hugepd_populate_kernel() for
> PPC_8XX), however those pages are not candidates for GUP.
> 
> Commit a6e79df92e4a ("mm/gup: disallow FOLL_LONGTERM GUP-fast writing to
> file-backed mappings") added a check to fail gup-fast if there's potential
> risk of violating GUP over writeback file systems.  That should never apply
> to hugepd.  Considering that hugepd is an old format (and even
> software-only), there's no plan to extend hugepd into other file typed
> memories that is prone to the same issue.
> 
> Drop that check, not only because it'll never be true for hugepd per any
> known plan, but also it paves way for reusing the function outside
> fast-gup.
> 
> To make sure we'll still remember this issue just in case hugepd will be
> extended to support non-hugetlbfs memories, add a rich comment above
> gup_huge_pd(), explaining the issue with proper references.
> 
> Cc: Christoph Hellwig <hch@infradead.org>
> Cc: Lorenzo Stoakes <lstoakes@gmail.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---

@Andrew, you properly adjusted the code to remove the 
gup_fast_folio_allowed() call instead of the folio_fast_pin_allowed() 
call, but

(1) the commit subject
(2) comment for gup_huge_pd()

Still mention folio_fast_pin_allowed().

The patch "mm/gup: handle hugepd for follow_page()" then moves that 
(outdated) comment.

-- 
Cheers,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
