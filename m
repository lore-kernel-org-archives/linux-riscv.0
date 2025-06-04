Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26045C5B543
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 07:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ltlAo0lJyy//nbQ86+mVEPH84U7S7ZTesHsjusj9W2s=; b=Qrnzv3+hLfR1pO
	AfpwrHUUmqeM8ieTDbuLm4bCnMM0gkIYBXM42K+kJh4Men67/POXk9bj5MMU+YXgaU8UutzhbGEhF
	TeXX7U4y1Q+KCQtTbCnGrWkS2OipL3/eEKhJyGNCZCsXbMtegbtRvTuZIpjPLuGzPLTqY0nGbaDhg
	sNjUxWja5cocAjVyk19MTnm8qCt3KwGm0/ajHvbWSYkIuF5nzTB9VRieoYiEOOOpmPJIEs0T9yXvm
	Hg/1Ho0w69jbYZQGRSiTEXIhgCrZpJ+lUNAOIrG/lzInDs/+E6lrqbXw4zQJPPP7kT8L53mxF5K2i
	s+DLTdcv652JCZJZbT8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMijI-0000000Cmfa-1p22;
	Wed, 04 Jun 2025 07:40:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMiiq-0000000CmZh-0nzO
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 07:39:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749022778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vEeoKlp6F3sCfv0THwxJPcjcYZSfLkHHDxNn+gbXPaA=;
	b=imTfFeUi5PSdHs0pJKEA2Cy7HHmggCn00UqtcG7eaipUpBukbdVBvOvALY11l2qLYYLoyh
	zVqJ3ttOw4ezzOUMyvr3R65tzdNaZjfPD5/aoYgQNkR81JBJj7qDOJplFNVciE6QhSh133
	B96PUYXJWnPkjvzk4RvRuJSi1/X8VW8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-JnNtQNi_MKyHzoLzJ2fp5A-1; Wed, 04 Jun 2025 03:39:34 -0400
X-MC-Unique: JnNtQNi_MKyHzoLzJ2fp5A-1
X-Mimecast-MFC-AGG-ID: JnNtQNi_MKyHzoLzJ2fp5A_1749022774
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4eec544c6so2906293f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 00:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749022773; x=1749627573;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vEeoKlp6F3sCfv0THwxJPcjcYZSfLkHHDxNn+gbXPaA=;
        b=WpA25MsmQktnD5HtwokvgJmPMXA7yZK+fLKQFeBuGLnGRQE0I9hkATOCTZSsmur7eR
         FA5tjvQT8p79/tGjC8fyeYCzeFSYFKeNASDhhopxaWRzT8tRg1vGKSBMJUyLwaKw9EVr
         Dul+yMwCNjo8Vq6QQAGuKAgCn9H9PqDa+VJIfFaupbLbx/hvfqJAAHRX4WWetrBs/tcB
         f6BSv90WKTeD7Eqf2PYgC+02vlCnnC3WlQ1aWrWGahKoYWi0FcI0C8/fTQ06c04PD4YC
         zbXPa7KmjQpNU5iIB/ycZIF3JIDhbtdruyqhQn/wE0DLLCLyYukrt1glHt4lGWL1N9D3
         jzaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA7AN2xuWZKPJePJ1L3GwekpnB4JTiFpOQFefprmh9UalLXKDwwU7j5fxLXTtZmt4tRzn1HYUcW80mnA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnH7gd1tZDizRCR4Dc1WSdlTCjYXELemGRn9UqeZc0S28zdmi7
	X90yr/1h+wPdAhFVlCev6+2sIChIVpmTTdZC4fwi7I+6tOWj+cRD9QR0iB2ocbccVQQ+t6zo5No
	SyW0hQKEyi2QnabYEK0FSREIFbQvQRy++f0g+jnwtpbn7SQQFd1Nz05VMx0DJxmEr56vdtg==
X-Gm-Gg: ASbGnct3QhaUNtVUJhaO9MIksv6sZvTrnpEdLLRR+3jcN6Bml2bqJDIClqLxFVTSES5
	7bOAlYfQZRhsi7KXvmpIuR4+aGAxh7sy6T43KvSDBY8D+cJSYfRMTKDWWzDtd7JRcWxslaBXvr4
	kNKtaBANXkxQIxNjGANIoclj2rtqbI4kp0kd/OIpcQi0RUSxSFzPcQNGw+WGrDhZHF0nOYF9mEa
	6V/pXeY37Wq1sP2pdYV25uvmia4IIF/iscZJ4ifBWnbPpyBM+weMcSGM6et2LAENZkYz2vI9XiK
	s0K4lJSiCByo8h84jtH1bkHRr5dsfcJU7drWfe4f8g==
X-Received: by 2002:a05:6000:430a:b0:3a3:652d:1638 with SMTP id ffacd0b85a97d-3a51d96673fmr1049747f8f.48.1749022773604;
        Wed, 04 Jun 2025 00:39:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtjE45p1dQbMhXKznJNQhD9gzd16Gald/ROfCnxrA2ljBjwOkDtYt1uC7/AKZ2m2XTHTCIeQ==
X-Received: by 2002:a05:6000:430a:b0:3a3:652d:1638 with SMTP id ffacd0b85a97d-3a51d96673fmr1049729f8f.48.1749022773213;
        Wed, 04 Jun 2025 00:39:33 -0700 (PDT)
Received: from [192.168.3.141] (p4fe0f831.dip0.t-ipconnect.de. [79.224.248.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972f3sm21121625f8f.69.2025.06.04.00.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 00:39:32 -0700 (PDT)
Message-ID: <51ec4269-b132-4163-9cb5-766042a3769d@redhat.com>
Date: Wed, 4 Jun 2025 09:39:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] mm/pagewalk: split walk_page_range_novma() into
 kernel/user parts
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Barry Song <baohua@kernel.org>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Jann Horn <jannh@google.com>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mm@kvack.org
References: <20250603192213.182931-1-lorenzo.stoakes@oracle.com>
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
In-Reply-To: <20250603192213.182931-1-lorenzo.stoakes@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AkpAPVO7cIIsQFIM3H_hyqs5vKziQxreEv1hr7YGlQE_1749022774
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_003940_306520_94F0B7E5 
X-CRM114-Status: GOOD (  21.04  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDMuMDYuMjUgMjE6MjIsIExvcmVuem8gU3RvYWtlcyB3cm90ZToKPiBUaGUgd2Fsa19wYWdl
X3JhbmdlX25vdm1hKCkgZnVuY3Rpb24gaXMgcmF0aGVyIGNvbmZ1c2luZyAtIGl0IHN1cHBvcnRz
IHR3bwo+IG1vZGVzLCBvbmUgdXNlZCBvZnRlbiwgdGhlIG90aGVyIHVzZWQgb25seSBmb3IgZGVi
dWdnaW5nLgo+IAo+IFRoZSBmaXJzdCBtb2RlIGlzIHRoZSBjb21tb24gY2FzZSBvZiB0cmF2ZXJz
YWwgb2Yga2VybmVsIHBhZ2UgdGFibGVzLCB3aGljaAo+IGlzIHdoYXQgbmVhcmx5IGFsbCBjYWxs
ZXJzIHVzZSB0aGlzIGZvci4KCi4uLiBhbmQgd2hhdCBwZW9wbGUgc2hvdWxkIGJlIHVzaW5nIGl0
IGZvciDwn5mCCgo+IAo+IFNlY29uZGx5IGl0IHByb3ZpZGVzIGFuIHVudXN1YWwgZGVidWdnaW5n
IGludGVyZmFjZSB0aGF0IGFsbG93cyBmb3IgdGhlCj4gdHJhdmVyc2FsIG9mIHBhZ2UgdGFibGVz
IGluIGEgdXNlcmxhbmQgcmFuZ2Ugb2YgbWVtb3J5IGV2ZW4gZm9yIHRoYXQgbWVtb3J5Cj4gd2hp
Y2ggaXMgbm90IGRlc2NyaWJlZCBieSBhIFZNQS4KPiAKPiBUaGlzIGlzIGhpZ2hseSB1bnVzdWFs
IGFuZCBpdCBpcyBmYXIgZnJvbSBjZXJ0YWluIHRoYXQgc3VjaCBwYWdlIHRhYmxlcwo+IHNob3Vs
ZCBldmVuIGV4aXN0LCBidXQgcGVyaGFwcyB0aGlzIGlzIHByZWNpc2VseSB3aHkgaXQgaXMgdXNl
ZnVsIGFzIGEKPiBkZWJ1Z2dpbmcgbWVjaGFuaXNtLgo+IAo+IEFzIGEgcmVzdWx0LCB0aGlzIGlz
IHV0aWxpc2VkIGJ5IHB0ZHVtcCBvbmx5LiBIaXN0b3JpY2FsbHksIHRoaW5ncyB3ZXJlCj4gcmV2
ZXJzZWQgLSBwdGR1bXAgd2FzIHRoZSBvbmx5IHVzZXIsIGFuZCBvdGhlciBwYXJ0cyBvZiB0aGUg
a2VybmVsIGV2b2x2ZWQKPiB0byB1c2UgdGhlIGtlcm5lbCBwYWdlIHRhYmxlIHdhbGtpbmcgaGVy
ZS4KPiAKPiBTaW5jZSB3ZSBoYXZlIHNvbWUgY29tcGxpY2F0ZWQgYW5kIGNvbmZ1c2luZyBsb2Nr
aW5nIHJ1bGVzIGZvciB0aGUgbm92bWEKPiBjYXNlLCBpdCBtYWtlcyBzZW5zZSB0byBzZXBhcmF0
ZSB0aGUgdHdvIHVzYWdlcyBpbnRvIHRoZWlyIG93biBmdW5jdGlvbnMuCj4gCj4gRG9pbmcgdGhp
cyBhbHNvIHByb3ZpZGUgc2VsZi1kb2N1bWVudGF0aW9uIGFzIHRvIHRoZSBpbnRlbnQgb2YgdGhl
IGNhbGxlciAtCj4gYXJlIHRoZXkgZG9pbmcgc29tZXRoaW5nIHJhdGhlciB1bnVzdWFsIG9yIGFy
ZSB0aGV5IHNpbXBseSBkb2luZyBhIHN0YW5kYXJkCj4ga2VybmVsIHBhZ2UgdGFibGUgd2Fsaz8K
PiAKPiBXZSB0aGVyZWZvcmUgbWFpbnRhaW4gd2Fsa19wYWdlX3JhbmdlX25vdm1hKCkgZm9yIHRo
aXMgc2luZ2xlIHVzYWdlLCBhbmQKPiBkb2N1bWVudCB0aGUgZnVuY3Rpb24gYXMgc3VjaC4KCklm
IHdlIGhhdmUgdG8ga2VlcCB0aGlzIGRhbmdlcm91cyBpbnRlcmZhY2UsIGl0IHNob3VsZCBwcm9i
YWJseSBiZQoKd2Fsa19wYWdlX3JhbmdlX2RlYnVnKCkgb3Igd2Fsa19wYWdlX3JhbmdlX2R1bXAo
KQoKPiAKPiBOb3RlIHRoYXQgcHRkdW1wIHVzZXMgdGhlIHByZWNpc2Ugc2FtZSBmdW5jdGlvbiBm
b3Iga2VybmVsIHdhbGtpbmcgYXMgYQo+IGNvbnZlbmllbmNlLCBzbyB3ZSBwZXJtaXQgdGhpcyBi
dXQgbWFrZSBpdCB2ZXJ5IGV4cGxpY2l0IGJ5IGhhdmluZwo+IHdhbGtfcGFnZV9yYW5nZV9ub3Zt
YSgpIGludm9rZSB3YWxrX3BhZ2VfcmFuZ2Vfa2VybmVsKCkgaW4gdGhpcyBjYXNlLgo+IAo+IFdl
IGludHJvZHVjZSB3YWxrX3BhZ2VfcmFuZ2Vfa2VybmVsKCkgZm9yIHRoZSBmYXIgbW9yZSBjb21t
b24gY2FzZSBvZgo+IGtlcm5lbCBwYWdlIHRhYmxlIHRyYXZlcnNhbC4KCkkgd29uZGVyIGlmIHdl
IHNob3VsZCBnaXZlIGl0IGEgY29tcGxldGVseSBkaWZmZXJlbnQgbmFtZSBzY2hlbWUgdG8KaGln
aGxpZ2h0IHRoYXQgdGhpcyBpcyBzb21ldGhpbmcgY29tcGxldGVseSBkaWZmZXJlbnQuCgp3YWxr
X2tlcm5lbF9wYWdlX3RhYmxlX3JhbmdlKCkKCmV0Yy4KCgotLSAKQ2hlZXJzLAoKRGF2aWQgLyBk
aGlsZGVuYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
