Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6EFCD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 16:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=babZcoZO7tyZusYt957VoR4+Ik1DTEZbckWSrjs0xMQ=; b=kO6jGAINoFKflH
	5POS5Au0cxtQ7nhmVNRhEhGXf9RST9+EaFnlydwws1Hl+hMEB2nVmN/EPp5aXk3m4/T9AclqKUJAB
	DbDeMYaFoIvFDjs/CIgBl47o3eCQshncGUxCcxHaiwe+YUtsDnMKebfiD8o9GO/5+1LlHKGw7HuQ7
	dxNb6OEJkm4P0oh5VzReW3yMewCni25SzP5dee5IxwVcpFHCndwjhESUfOSnUR1JxeYD+buNzvybZ
	1KlQ4w/cH13G/sAx9MTCGAglSZUx/1jtS5zL67rw+MwKMqylXWOseKKJ7WOELpPaNZ94KdgGYk2er
	GSm2igITm7cBsZX/iTKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrhBE-0000000C4YC-2djJ;
	Tue, 02 Apr 2024 16:40:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrhBC-0000000C4X1-1ICT
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 16:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712076009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iEb1HUNjpnqEgLGmlXxstqgOUp3S0IqEbnWahtuTkPk=;
	b=hpmd0MXjgJHQCXMsNPgRbG+wPn+eoMVy/l4jpXkTlTjbsFYX+K490jU4eHjFuYWlcEYZlh
	Oc1zg/jW/2j9wTcoqIvo+Aaneu6oEtcVXGbxnuP2Mg6JypOCIhHOq2JHaAS6WKicjENK6n
	Xt0uzKWk6GuEcA4hv3VociXqZcXO0M8=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-VORysunsMqa81BL9uFbPKQ-1; Tue, 02 Apr 2024 12:40:08 -0400
X-MC-Unique: VORysunsMqa81BL9uFbPKQ-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2d48d13b3c9so41334681fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 09:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712076006; x=1712680806;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iEb1HUNjpnqEgLGmlXxstqgOUp3S0IqEbnWahtuTkPk=;
        b=B6oTmbdkXUGZaTh+2bmfigj72TCHDl4eK6wfKXnRfmyfBntqx3rLaPp9KiXR4vENt3
         8mCrySy2bkw36PnI9MrRp99MmJW3Ly8wusKwEgvaY0NJLHy8HpPjergzwVCcR57V92PM
         y6lI27K2F+q0U3/aSdlMOJRrv5/PSFJNvMXQDzBLE4Xa9RwdcwjDUVOssOEbYxU3d3Tf
         ZFnooZAtZqznaBekCf5smcauNT0Z25bhD7lJ8JagyPiinqMs7cAafcOATdyHRzIjPvY5
         6OjRNgOOH49OnEEX/hh5IEnjl6XR4PUpDg7VFvPU3LSBx61BttS+T1RbWUKByDLxoSYl
         zM3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXz5QY1wBBYwOswpo/T8TPdRXkTnlyVIs03YXOY4nrDfiy8O5L0I444Q0WtED2vK25hiF8tOFmgUcude79zlsLL1rHNB6Kpz3b0nSD/2W3B
X-Gm-Message-State: AOJu0Ywevp8/kg59Y3wQNqV+Ph8pghrVg4UrPhsISMbsk8RL4afXKut7
	OytMbVbW5xuf7fSJtxB7M7Dsxr25b8QaBLgGAOUFWKZnoGTEowSuoGsIEyDrrkMJ/3msGJ/fWK2
	zLuWir9zslJxt0qDhJIKylxI0k0ZQwCWcI5q5jw1WZEVcvyTXp4IcavsYgSwZZ9Q62A==
X-Received: by 2002:a2e:a1c6:0:b0:2d6:f56a:2c93 with SMTP id c6-20020a2ea1c6000000b002d6f56a2c93mr100951ljm.49.1712076006580;
        Tue, 02 Apr 2024 09:40:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuQTtY35SlGNEgobFjthAxTwDvUNM6x0Hlf/gyIfohvOtboRJqBmL5hKdTw7+tWAipqSJUXw==
X-Received: by 2002:a2e:a1c6:0:b0:2d6:f56a:2c93 with SMTP id c6-20020a2ea1c6000000b002d6f56a2c93mr100927ljm.49.1712076006141;
        Tue, 02 Apr 2024 09:40:06 -0700 (PDT)
Received: from ?IPV6:2003:cb:c732:e600:4982:2903:710f:f20a? (p200300cbc732e60049822903710ff20a.dip0.t-ipconnect.de. [2003:cb:c732:e600:4982:2903:710f:f20a])
        by smtp.gmail.com with ESMTPSA id t10-20020a05600c450a00b004161b59e230sm2538868wmo.41.2024.04.02.09.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 09:40:05 -0700 (PDT)
Message-ID: <98d4ef76-93e4-4e76-be60-9f0076389dc5@redhat.com>
Date: Tue, 2 Apr 2024 18:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] mm/gup: Handle hugetlb in the generic
 follow_page_mask code
To: Matthew Wilcox <willy@infradead.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, peterx@redhat.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Yang Shi <shy828301@gmail.com>, "Kirill A . Shutemov"
 <kirill@shutemov.name>, Mike Kravetz <mike.kravetz@oracle.com>,
 John Hubbard <jhubbard@nvidia.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Jones <andrew.jones@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@infradead.org>, Lorenzo Stoakes <lstoakes@gmail.com>,
 Rik van Riel <riel@surriel.com>, linux-arm-kernel@lists.infradead.org,
 Andrea Arcangeli <aarcange@redhat.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, James Houghton <jthoughton@google.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Rapoport <rppt@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-14-peterx@redhat.com>
 <adfdd89b-ee56-4758-836e-c66a0be7de25@arm.com>
 <5d9dd9a7-e544-4741-944c-469b79c2c649@redhat.com>
 <ZgwrhKuypBtSpKdI@casper.infradead.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ZgwrhKuypBtSpKdI@casper.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_094010_444758_CD558F9F 
X-CRM114-Status: GOOD (  20.20  )
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

On 02.04.24 18:00, Matthew Wilcox wrote:
> On Tue, Apr 02, 2024 at 05:26:28PM +0200, David Hildenbrand wrote:
>>> The oops trigger is at mm/gup.c:778:
>>> VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);
>>>
>>> So 2M passed ok, and its failing for 32M, which is cont-pmd. I'm guessing you're trying to iterate 2M into a cont-pmd folio and ending up with an unexpected tail page?
>>
>> I assume we find the expected tail page, it's just that the check
>>
>> VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);
>>
>> Doesn't make sense with hugetlb folios. We might have a tail page mapped in
>> a cont-pmd entry. As soon as we call follow_huge_pmd() on "not the first
>> cont-pmd entry", we trigger this check.
>>
>> Likely this sanity check must also allow for hugetlb folios. Or we should
>> just remove it completely.
>>
>> In the past, we wanted to make sure that we never get tail pages of THP from
>> PMD entries, because something would currently be broken (we don't support
>> THP > PMD).
> 
> That was a practical limitation on my part.  We have various parts of
> the MM which assume that pmd_page() returns a head page and until we
> get all of those fixed, adding support for folios larger than PMD_SIZE
> was only going to cause trouble for no significant wins.
> 
> I agree with you we should get rid of this assertion entirely.  We should
> fix all the places which assume that pmd_page() returns a head page,
> but that may take some time.
> 
> As an example, filemap_map_pmd() has:
> 
>         if (pmd_none(*vmf->pmd) && folio_test_pmd_mappable(folio)) {
>                  struct page *page = folio_file_page(folio, start);
>                  vm_fault_t ret = do_set_pmd(vmf, page);
> 
> and then do_set_pmd() has:
> 
>          if (page != &folio->page || folio_order(folio) != HPAGE_PMD_ORDER)
>                  return ret;
> 
> so we'd simply refuse to use a PMD to map a folio larger than PMD_SIZE.
> There's a lot of work to be done to make this work generally (not to
> mention figuring out how to handle mapcount for such folios ;-).

Yes :)

-- 
Cheers,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
