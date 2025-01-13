Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DD2E7719F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 13:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bXGi/lHjp+Pkk016RNc2QWmhFYVret2588lM16Zkc3U=; b=sLl6A/yAiHZ6pi
	iEeRYfzz/vvj1eKAziVeynlcyK1kXSyqFm28wCY+iz3H17OSpZL4z0qz6iKcf1jl9PNqYHmnFIWd7
	lNHqlCrrEE21ErfuOnHdC95Mx1ak7wVZpCN7I31M0h5XhbWXqV0QWy8/k/aIaKTWgb+kZ79jvs/th
	sJYJ3krKQOp4rVe37hgOtIdv9UBaG9PdW+hOGL/Vymcigr6VsL1auFoaBop7xbkBPG5el6PRlkh14
	6omn8TiX9N2CgoyGWYF9rr0kW4ur4a4+H5zJ62urHjmHCN0Ywyo/Ch+39qbXy4JVNDV4wLMOx7dbI
	ZYt2oIYstEBka89UdHkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKLu-00000005Duo-0iOW;
	Mon, 13 Jan 2025 13:19:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKLs-00000005Dtn-0S3G
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 13:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736774371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PttcTbV6q4JSNPDitRHrXVO5rJhcJB2dabUIlHPBpi0=;
	b=elwoZM0F/y8X9OZbKnXU2PQ3jIsMRIrtkgsB+K18LHqvcbZ4NORklLBbU5UtZUAfF5XzFo
	LGBh9vQ1Z4vYm3S1t7+ginloTr2ktaprOAEOfCk7oY4/YHQyPLBbq8xLFz0Jk3css1GlE1
	jrscc+fL5Hxtg/Uv71vAQRvgwQyqn0o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-pl3FE2zrP5iazNyQ5nBHxg-1; Mon, 13 Jan 2025 08:19:30 -0500
X-MC-Unique: pl3FE2zrP5iazNyQ5nBHxg-1
X-Mimecast-MFC-AGG-ID: pl3FE2zrP5iazNyQ5nBHxg
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3862b364578so2442618f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 05:19:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736774369; x=1737379169;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PttcTbV6q4JSNPDitRHrXVO5rJhcJB2dabUIlHPBpi0=;
        b=r5zWShA4ZJ2pUvFUFcV3wgFU/LxyOtFEXupkcci1cL3rpRC3aVKx3Y24vHEaULsBua
         lLvC6Su1wWVno7GBBLPa+dOt6nQyFU19JeKOWQ50G7NvpLQ09yLhwmiSZKOihIozEuih
         Hzmv2xsY81S+hxWF1OKc+PPyuIyFuqhaC+h7arm6aL4YbWVuVqi1Jc7Y54/SxTzqpGkS
         GcXLaUfzslAwD9G7ma5AOZweeOFnYzf2ggRA1m/vBHwvflcvdDH9xX+USc4WNLYUenTK
         EjyNNN5XWnUjaAmX0rZ6o3X82H2HfO2jZ+SbQIfPTKuz7BED9X3UORGcArKkzmp1SRPS
         iH1A==
X-Forwarded-Encrypted: i=1; AJvYcCXja24npn+rV+zyfPQlKRZ58S3BSAu5rcWhxOoLp+7kqVYz6ks9sxMFWG4Jg1SCig/UKwEg2xld5yftfA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy2tvDvJMNq+RMOzs4e91kO/pgGa0wVwLOIviXPF62p75b4Owg
	xnoM9PIqjoCEyLVYukp0C2VsZu4azReYXD7eXtlzxPFOy/Zoe6lySS7Om5Mp3M+QhlOvY8IG8Ya
	rZIR73fjS5CZXsvk2R9C8IP9kH2xldnHys47llYIhz1am8ydNX1f/6cXjK/rq7ertEw==
X-Gm-Gg: ASbGncsLiH9bz/CEYAefEPddIMMCBqDJ4PFOijGVjqu764fH4ItSsNyd8Bb+RhJ0AMV
	rzbpP5+Xz5jZf/NUVKX4s0hnRMIzzxz77v0m0rcm40CL/aELaQd51DONH8riSEyf4r2RBwwWE0d
	0Y08DjQLTQ98D0dzCVoECCwVugiqGzMNLDNS56xdFtH1uxlkb7zk+Tux39nKYHPUGUr2K21ZENH
	YKqMySuDfW9yOyiZFwDPezwB9hbMwWvQ6eB6ob/T0VT3ULQAzYvJJnf3XJlKqwwYMCXzeLtZMSS
	Z9VQuVr1r/g8U2w=
X-Received: by 2002:a05:6000:1aca:b0:386:3bde:9849 with SMTP id ffacd0b85a97d-38a8b0caa82mr14308085f8f.12.1736774368928;
        Mon, 13 Jan 2025 05:19:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmrfLkoC0dheFen0KOd3QX1GBKHjDo/69IXQ3IByuhquzkA2mL2+9hUXz910tsz5nN/hQhSg==
X-Received: by 2002:a05:6000:1aca:b0:386:3bde:9849 with SMTP id ffacd0b85a97d-38a8b0caa82mr14308054f8f.12.1736774368577;
        Mon, 13 Jan 2025 05:19:28 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f9bc6b9bsm53356035e9.22.2025.01.13.05.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 05:19:27 -0800 (PST)
Message-ID: <296b04db-9524-48f1-9fa1-0b028bc939a6@redhat.com>
Date: Mon, 13 Jan 2025 14:19:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] mm: Set folio swapbacked iff folios are dirty in
 try_to_unmap_one
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: baolin.wang@linux.alibaba.com, chrisl@kernel.org, ioworker0@gmail.com,
 kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, linux-riscv@lists.infradead.org, ying.huang@intel.com,
 zhengtangquan@oppo.com, lorenzo.stoakes@oracle.com
References: <20250113033901.68951-1-21cnbao@gmail.com>
 <20250113033901.68951-2-21cnbao@gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250113033901.68951-2-21cnbao@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zl3V-NBgn2umpIlPp1ufR0dP--FZvtc4y3dmP1caA64_1736774369
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_051932_228947_1C4A609D 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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

On 13.01.25 04:38, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> The refcount may be temporarily or long-term increased, but this does
> not change the fundamental nature of the folio already being lazy-
> freed. Therefore, we only reset 'swapbacked' when we are certain the
> folio is dirty and not droppable.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
