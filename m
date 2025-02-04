Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7B0C02194
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 11:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wy4vzNbhLHIELSM4Dh6Tno4NPfw+f9qqn01nK7UiCz0=; b=NhOW51MQMKgckI
	7Ii07ZbuNiEFwZfnrUGYr20+mu8dzrFJqieORDgynXi40eWaJkf7MhJvVplDGnniBX6oRhuBrBnxd
	RLhWfGKnEqDp77//VsIlU9F678wO7LYkziHPsfJK7EKACWGHxsIsUDjcWOs3QTMvgak8ypwSgbuZt
	SpHNrHmMcKCwQfgAdiVpHxqYNP1LIMWgGL11Hqn+gAP+QuF8iwXSxpljRiv7CY11/wdu5YvrMZ4Tk
	5jYPIUAng5BZp2JBnZiLjcZj9tgS1J9P1zW1HgejuOa3kP7PrU3qsOGhoTQ76lZZLg2Ynz1mS3wGy
	gPS5TvCDAXxYH9bXK/jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHHg-00000000IXp-1gw5;
	Tue, 04 Feb 2025 11:40:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHGL-00000000IJi-17Qv
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 11:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738669119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dAf6I6x8Ixyhwl4g5QnQwYXZIRw06z5WdjsdkIZQ9pE=;
	b=i8NLlX6XAXjnHo+zw+WVCIy+UEGgo5qokVCcEp+emY6O27NYmtom8Gw0dEL4L4GNwYMceY
	w9IblKLYIseG1H21HDQgtG3/A4jmmBKEdO+QmqPl6/Lf+RK61KsfrmmPEhFcc7Yi0lN6E2
	ukipgLLgWzLBptu2i+umxD6Xc0JSv3Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-l0grxxLEMgqYiFr9_DSygA-1; Tue, 04 Feb 2025 06:38:36 -0500
X-MC-Unique: l0grxxLEMgqYiFr9_DSygA-1
X-Mimecast-MFC-AGG-ID: l0grxxLEMgqYiFr9_DSygA
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38dac77e561so132213f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 03:38:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738669115; x=1739273915;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dAf6I6x8Ixyhwl4g5QnQwYXZIRw06z5WdjsdkIZQ9pE=;
        b=G/ljccuSeMzQYQvStpNvEwt6HBL5L83M2F6LxFY62hR6r3a30qMaMl6FaSrlrG8vtt
         kVss5ToC7/i/+hg0f42EEn4OubSzdyVYWRj8HAaLCrA/v3dJYO61C9kxKxOK0yQiOVVP
         PcJnY2kzQbPn8nrkRZ6SQE1D64oxTVv/cajXcWuQjHJlGQGNRafjQTSpD3TK5zN892VL
         Ei8op2O1s5qwpA/xQAPB7cGwXk2RN/DPI0A/4DTdrz7azgj5SrXOTwl/d/RhRsztPlJB
         /TdIxyPfLLDrsOvkO5j5jUKKKZWzZgUowXBieleET48MWAWmftuvF75H14mx0BVo5qlm
         Ge9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYMXSWDQ9lh7O/Ot25JL4sHVQcpUVnXFTGLoJUhDNPV5gdEG/yjid1sjZPOAZTWpiQNyTR6mXP3N7IBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhyRyCyEhTo30oJ19SmEaGb/izQbdnPYICCACtUHNreIc+7p4p
	tjj6/WssM+lysy77xIguezWVZDZdrAMdsI1VjVO3J3tCEcQv/kfIdFN6vS85X3CBaC91aen5/8i
	RP0EVwrE9CoXFyFxvid/hCAXsUFWGBUJHIpc76FoPoLNbcid5ixGH9Ku3aA1BuG0iXw==
X-Gm-Gg: ASbGncs/U+YsnF3MPq1We3KVBC5QWCpZks8AZieR8sns7J2Cr6IIGV1mH77m5JH3/TV
	kDr7H59GQDksYbJLQOHibblcgSBiKRR6qMoKMrWHhQg8jpnv6BteAuAFwsRqaqT6RejmjgY3TAE
	xJBukj84qzFMxxIL8t23DNlwiIdc72rERPa0e0/x4pfXulLRH3ksEZRd9C/M/tqpoFMZ4l1EDnP
	q4cRAkmKX2EMVtLPXWKJQqMMOKd1p5k/DGyyOJGL/VJo1XgSBwtTLBtehQY90dchdrl4kBAu/ag
	UiJycrilz6xtBNfkPLRxZr6aacIObXnxDSq6icS/vcOHurcMlXG6ny7Cbvdk4MrwkQp50sIEfIm
	grz1fCiq2WWgy/NZ39i08a84NWNE=
X-Received: by 2002:a5d:64e6:0:b0:38d:ae2b:8374 with SMTP id ffacd0b85a97d-38dae2b8a1amr977189f8f.52.1738669115331;
        Tue, 04 Feb 2025 03:38:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVHbCkqlzOrzhIL5tsJnUc5CY0X5I+EABZF7WUoOmHjZ083H4rwma8rlO41Xl3jBripWoeMA==
X-Received: by 2002:a5d:64e6:0:b0:38d:ae2b:8374 with SMTP id ffacd0b85a97d-38dae2b8a1amr977163f8f.52.1738669114978;
        Tue, 04 Feb 2025 03:38:34 -0800 (PST)
Received: from ?IPV6:2003:cb:c70a:300:3ae1:c3c0:cef:8413? (p200300cbc70a03003ae1c3c00cef8413.dip0.t-ipconnect.de. [2003:cb:c70a:300:3ae1:c3c0:cef:8413])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cfa2fsm15861718f8f.91.2025.02.04.03.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 03:38:33 -0800 (PST)
Message-ID: <0785a15e-29fb-4801-9743-3d08e381d506@redhat.com>
Date: Tue, 4 Feb 2025 12:38:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: baolin.wang@linux.alibaba.com, chrisl@kernel.org, ioworker0@gmail.com,
 kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
References: <20250115033808.40641-1-21cnbao@gmail.com>
 <20250115033808.40641-4-21cnbao@gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250115033808.40641-4-21cnbao@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uESyouWu2glIl1ECg51QXcZ1HiIGa6SWneehEgJ4X74_1738669115
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_033841_383376_B0DEE89F 
X-CRM114-Status: GOOD (  10.64  )
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

Hi,

>   	unsigned long hsz = 0;
>   
> @@ -1780,6 +1800,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>   				hugetlb_vma_unlock_write(vma);
>   			}
>   			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
> +		} else if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
> +				can_batch_unmap_folio_ptes(address, folio, pvmw.pte)) {
> +			nr_pages = folio_nr_pages(folio);
> +			flush_cache_range(vma, range.start, range.end);
> +			pteval = get_and_clear_full_ptes(mm, address, pvmw.pte, nr_pages, 0);
> +			if (should_defer_flush(mm, flags))
> +				set_tlb_ubc_flush_pending(mm, pteval, address,
> +					address + folio_size(folio));
> +			else
> +				flush_tlb_range(vma, range.start, range.end);
>   		} else {

I have some fixes [1] that will collide with this series. I'm currently 
preparing a v2, and am not 100% sure when the fixes will get queued+merged.

I'll base them against mm-stable for now, and send them out based on 
that, to avoid the conflicts here (should all be fairly easy to resolve 
from a quick glimpse).

So we might have to refresh this series here if the fixes go in first.

[1] https://lkml.kernel.org/r/20250129115411.2077152-1-david@redhat.com

-- 
Cheers,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
