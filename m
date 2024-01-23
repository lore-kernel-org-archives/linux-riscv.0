Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3BFC47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 20:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9obKJmqQH0Uk38BG++BKtSkLVTVd80LhIRz8l/iJIFg=; b=QipREYpF8akBs4
	CD+FZfSq7YX/03AiRDFsN8lL64hddxJhxm1FI4sFmawe2bEw4ugSH9OCFtqLv38yipug2A/kw4+YT
	ky1h0rU0E4DH3I42QXMn+blQWBO26MmLltuwhRj6XZ0TrKvQFYd+LYArYtpQf3hwbBHazjUYsoEcB
	bRWV0oA2XZfAq0FrUghYOUZj2BgFIvMwuGH3tLZarzg/qkyoWFfqtIo3QNaGPA/fhRxTOyyZPnB6f
	iRbDNF2ofGAJVXSSfKDEZ3NV4zVVLKpNhTULK3XwgLHuppTVaJnfEq67rcvsT8Y4vbzTT5bIWGwl3
	VGqKvtba1i1G7zDrUjOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSNAj-000MIb-39;
	Tue, 23 Jan 2024 20:15:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSNAf-000MGN-1h
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 20:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706040896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=x8q0QE4RXreMrUY0KqZ16GPCZvSP52kIQEUXy5f60Hg=;
	b=AAjRDWIhmorx4gBT77//wqlwkZ4IWViXqelgnzr62RoCdgK7d0DhKon5m1dkx5iDJp+FFb
	aGEBcLwxnJeRfB+phpHy/jJS5HNdzOewktWxdGv+KCD0L90+XGgrrFmbKesF6xB4AL2s2A
	6w8BxdhxaKeElM56t7Zq+v808cLvKe4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-vglxSjvuNUWgF2H278cQow-1; Tue, 23 Jan 2024 15:14:54 -0500
X-MC-Unique: vglxSjvuNUWgF2H278cQow-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3392c5e6dcdso1336023f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jan 2024 12:14:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706040893; x=1706645693;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8q0QE4RXreMrUY0KqZ16GPCZvSP52kIQEUXy5f60Hg=;
        b=sPH/hAv3J982SzDgmsRT2+gaF4/rd2uHm1F1JB/p2g/Blfy26xz+v7YrGmGWyo2ZRy
         hKQ98igQyJbMyWwOzMerxypuBGE63KCb5uNMGmyCneY7BVPb/++L2VOugDd/BGsZ/rTA
         mku3OrIs0KKvMtjeYWrrdZ6zfG1F8oY4leT+hHiHRkjdkqpKhRS4ZdabOvuX+AhNH7b4
         qacdEquBbIBrZ2cPRVjvwO+HBRH59YXgjOOp155zs8hYFfmP8mGSswimD/i9N4S7Mlq6
         6Yn7VLqArWOzLZPobSChMYwBNPvmU/nc0OPbzmhiCDTtBx7MtNx2Wo8zvDRSYCcsJ5J1
         c6NA==
X-Gm-Message-State: AOJu0YyLwaklS2hJfyOcbVHPEKFPs1TdX+p9+m0r9c7DjmYMN8xKZIgv
	5oa+Y8HqBfm7EW9eVnlerGrve4qrcvKzuFGiLg7Gq0uZhPeGZbo23IWqsRsOIuto0PAYJW6WxEU
	xD8CiTR7EjiNvZekyE1Jk/vjfj2u8+XSOaIlmYV34jmSdXICvG6F1i1PrwxUEybebmQ==
X-Received: by 2002:a7b:c319:0:b0:40d:1d1c:ffaa with SMTP id k25-20020a7bc319000000b0040d1d1cffaamr67645wmj.169.1706040893521;
        Tue, 23 Jan 2024 12:14:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG00aujylvnt2mbsUYznhzKly9WyPA4ZPsKsYSYKdizveJ1XQAgPUyPuBCfXE+JyFJNAq4BfQ==
X-Received: by 2002:a7b:c319:0:b0:40d:1d1c:ffaa with SMTP id k25-20020a7bc319000000b0040d1d1cffaamr67637wmj.169.1706040893112;
        Tue, 23 Jan 2024 12:14:53 -0800 (PST)
Received: from ?IPV6:2003:cb:c741:de00:bf0f:cd46:dc1c:2de9? (p200300cbc741de00bf0fcd46dc1c2de9.dip0.t-ipconnect.de. [2003:cb:c741:de00:bf0f:cd46:dc1c:2de9])
        by smtp.gmail.com with ESMTPSA id bi13-20020a05600c3d8d00b0040e8800fcf3sm23416639wmb.5.2024.01.23.12.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 12:14:52 -0800 (PST)
Message-ID: <33cf54a9-b855-4d2d-9926-a4936fc9068b@redhat.com>
Date: Tue, 23 Jan 2024 21:14:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/11] mm/memory: optimize fork() with PTE-mapped THP
To: Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Russell King <linux@armlinux.org.uk>,
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
References: <20240122194200.381241-1-david@redhat.com>
 <56bee384-461e-4167-b7e9-4dd60666dd66@arm.com>
 <fa9425e8-f489-48d0-9bf5-98d1b46b6d1a@redhat.com>
 <7d92d27a-44f6-47d0-8eab-3f80bd7bd75d@arm.com>
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
In-Reply-To: <7d92d27a-44f6-47d0-8eab-3f80bd7bd75d@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_121457_822748_0984592F 
X-CRM114-Status: GOOD (  26.47  )
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

T24gMjMuMDEuMjQgMjA6NDMsIFJ5YW4gUm9iZXJ0cyB3cm90ZToKPiBPbiAyMy8wMS8yMDI0IDE5
OjMzLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4gT24gMjMuMDEuMjQgMjA6MTUsIFJ5YW4g
Um9iZXJ0cyB3cm90ZToKPj4+IE9uIDIyLzAxLzIwMjQgMTk6NDEsIERhdmlkIEhpbGRlbmJyYW5k
IHdyb3RlOgo+Pj4+IE5vdyB0aGF0IHRoZSBybWFwIG92ZXJoYXVsWzFdIGlzIHVwc3RyZWFtIHRo
YXQgcHJvdmlkZXMgYSBjbGVhbiBpbnRlcmZhY2UKPj4+PiBmb3Igcm1hcCBiYXRjaGluZywgbGV0
J3MgaW1wbGVtZW50IFBURSBiYXRjaGluZyBkdXJpbmcgZm9yayB3aGVuIHByb2Nlc3NpbmcKPj4+
PiBQVEUtbWFwcGVkIFRIUHMuCj4+Pj4KPj4+PiBUaGlzIHNlcmllcyBpcyBwYXJ0aWFsbHkgYmFz
ZWQgb24gUnlhbidzIHByZXZpb3VzIHdvcmtbMl0gdG8gaW1wbGVtZW50Cj4+Pj4gY29udC1wdGUg
c3VwcG9ydCBvbiBhcm02NCwgYnV0IGl0cyBhIGNvbXBsZXRlIHJld3JpdGUgYmFzZWQgb24gWzFd
IHRvCj4+Pj4gb3B0aW1pemUgYWxsIGFyY2hpdGVjdHVyZXMgaW5kZXBlbmRlbnQgb2YgYW55IHN1
Y2ggUFRFIGJpdHMsIGFuZCB0bwo+Pj4+IHVzZSB0aGUgbmV3IHJtYXAgYmF0Y2hpbmcgZnVuY3Rp
b25zIHRoYXQgc2ltcGxpZnkgdGhlIGNvZGUgYW5kIHByZXBhcmUKPj4+PiBmb3IgZnVydGhlciBy
bWFwIGFjY291bnRpbmcgY2hhbmdlcy4KPj4+Pgo+Pj4+IFdlIGNvbGxlY3QgY29uc2VjdXRpdmUg
UFRFcyB0aGF0IG1hcCBjb25zZWN1dGl2ZSBwYWdlcyBvZiB0aGUgc2FtZSBsYXJnZQo+Pj4+IGZv
bGlvLCBtYWtpbmcgc3VyZSB0aGF0IHRoZSBvdGhlciBQVEUgYml0cyBhcmUgY29tcGF0aWJsZSwg
YW5kIChhKSBhZGp1c3QKPj4+PiB0aGUgcmVmY291bnQgb25seSBvbmNlIHBlciBiYXRjaCwgKGIp
IGNhbGwgcm1hcCBoYW5kbGluZyBmdW5jdGlvbnMgb25seQo+Pj4+IG9uY2UgcGVyIGJhdGNoIGFu
ZCAoYykgcGVyZm9ybSBiYXRjaCBQVEUgc2V0dGluZy91cGRhdGVzLgo+Pj4+Cj4+Pj4gV2hpbGUg
dGhpcyBzZXJpZXMgc2hvdWxkIGJlIGJlbmVmaWNpYWwgZm9yIGFkZGluZyBjb250LXB0ZSBzdXBw
b3J0IG9uCj4+Pj4gQVJNNjRbMl0sIGl0J3Mgb25lIG9mIHRoZSByZXF1aXJlbWVudHMgZm9yIG1h
aW50YWluaW5nIGEgdG90YWwgbWFwY291bnRbM10KPj4+PiBmb3IgbGFyZ2UgZm9saW9zIHdpdGgg
bWluaW1hbCBhZGRlZCBvdmVyaGVhZCBhbmQgZnVydGhlciBjaGFuZ2VzWzRdIHRoYXQKPj4+PiBi
dWlsZCB1cCBvbiB0b3Agb2YgdGhlIHRvdGFsIG1hcGNvdW50Lgo+Pj4KPj4+IEknbSBjdXJyZW50
bHkgcmViYXNpbmcgbXkgY29udHB0ZSB3b3JrIG9udG8gdGhpcyBzZXJpZXMsIGFuZCBoYXZlIGhp
dCBhIHByb2JsZW0uCj4+PiBJIG5lZWQgdG8gZXhwb3NlIHRoZSAic2l6ZSIgb2YgYSBwdGUgKHB0
ZV9zaXplKCkpIGFuZCBza2lwIGZvcndhcmQgdG8gdGhlIHN0YXJ0Cj4+PiBvZiB0aGUgbmV4dCAo
Y29udClwdGUgZXZlcnkgdGltZSB0aHJvdWdoIHRoZSBmb2xpb19wdGVfYmF0Y2goKSBsb29wLiBC
dXQKPj4+IHB0ZV9uZXh0X3BmbigpIG9ubHkgYWxsb3dzIGFkdmFuY2luZyBieSAxIHBmbjsgSSBu
ZWVkIHRvIGFkdmFuY2UgYnkgbnIgcGZuczoKPj4+Cj4+Pgo+Pj4gc3RhdGljIGlubGluZSBpbnQg
Zm9saW9fcHRlX2JhdGNoKHN0cnVjdCBmb2xpbyAqZm9saW8sIHVuc2lnbmVkIGxvbmcgYWRkciwK
Pj4+ICDCoMKgwqDCoMKgwqDCoCBwdGVfdCAqc3RhcnRfcHRlcCwgcHRlX3QgcHRlLCBpbnQgbWF4
X25yLCBib29sICphbnlfd3JpdGFibGUpCj4+PiB7Cj4+PiAgwqDCoMKgwqB1bnNpZ25lZCBsb25n
IGZvbGlvX2VuZF9wZm4gPSBmb2xpb19wZm4oZm9saW8pICsgZm9saW9fbnJfcGFnZXMoZm9saW8p
Owo+Pj4gIMKgwqDCoMKgY29uc3QgcHRlX3QgKmVuZF9wdGVwID0gc3RhcnRfcHRlcCArIG1heF9u
cjsKPj4+ICDCoMKgwqDCoHB0ZV90IGV4cGVjdGVkX3B0ZSA9IF9fcHRlX2JhdGNoX2NsZWFyX2ln
bm9yZWQocHRlX25leHRfcGZuKHB0ZSkpOwo+Pj4gLcKgwqDCoCBwdGVfdCAqcHRlcCA9IHN0YXJ0
X3B0ZXAgKyAxOwo+Pj4gK8KgwqDCoCBwdGVfdCAqcHRlcCA9IHN0YXJ0X3B0ZXA7Cj4+PiArwqDC
oMKgIGludCB2Zm4sIG5yLCBpOwo+Pj4gIMKgwqDCoMKgYm9vbCB3cml0YWJsZTsKPj4+Cj4+PiAg
wqDCoMKgwqBpZiAoYW55X3dyaXRhYmxlKQo+Pj4gIMKgwqDCoMKgwqDCoMKgICphbnlfd3JpdGFi
bGUgPSBmYWxzZTsKPj4+Cj4+PiAgwqDCoMKgwqBWTV9XQVJOX09OX0ZPTElPKCFwdGVfcHJlc2Vu
dChwdGUpLCBmb2xpbyk7Cj4+Pgo+Pj4gK8KgwqDCoCB2Zm4gPSBhZGRyID4+IFBBR0VfU0laRTsK
Pj4+ICvCoMKgwqAgbnIgPSBwdGVfc2l6ZShwdGUpOwo+Pj4gK8KgwqDCoCBuciA9IEFMSUdOX0RP
V04odmZuICsgbnIsIG5yKSAtIHZmbjsKPj4+ICvCoMKgwqAgcHRlcCArPSBucjsKPj4+ICsKPj4+
ICDCoMKgwqDCoHdoaWxlIChwdGVwICE9IGVuZF9wdGVwKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAg
cHRlID0gcHRlcF9nZXQocHRlcCk7Cj4+PiAgwqDCoMKgwqDCoMKgwqAgbnIgPSBwdGVfc2l6ZShw
dGUpOwo+Pj4gIMKgwqDCoMKgwqDCoMKgIGlmIChhbnlfd3JpdGFibGUpCj4+PiAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB3cml0YWJsZSA9ICEhcHRlX3dyaXRlKHB0ZSk7Cj4+PiAgwqDCoMKgwqDC
oMKgwqAgcHRlID0gX19wdGVfYmF0Y2hfY2xlYXJfaWdub3JlZChwdGUpOwo+Pj4KPj4+ICDCoMKg
wqDCoMKgwqDCoCBpZiAoIXB0ZV9zYW1lKHB0ZSwgZXhwZWN0ZWRfcHRlKSkKPj4+ICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4KPj4+ICDCoMKgwqDCoMKgwqDCoCAvKgo+Pj4gIMKg
wqDCoMKgwqDCoMKgwqAgKiBTdG9wIGltbWVkaWF0ZWx5IG9uY2Ugd2UgcmVhY2hlZCB0aGUgZW5k
IG9mIHRoZSBmb2xpby4gSW4KPj4+ICDCoMKgwqDCoMKgwqDCoMKgICogY29ybmVyIGNhc2VzIHRo
ZSBuZXh0IFBGTiBtaWdodCBmYWxsIGludG8gYSBkaWZmZXJlbnQKPj4+ICDCoMKgwqDCoMKgwqDC
oMKgICogZm9saW8uCj4+PiAgwqDCoMKgwqDCoMKgwqDCoCAqLwo+Pj4gLcKgwqDCoMKgwqDCoMKg
IGlmIChwdGVfcGZuKHB0ZSkgPT0gZm9saW9fZW5kX3BmbikKPj4+ICvCoMKgwqDCoMKgwqDCoCBp
ZiAocHRlX3BmbihwdGUpID49IGZvbGlvX2VuZF9wZm4pCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBicmVhazsKPj4+Cj4+PiAgwqDCoMKgwqDCoMKgwqAgaWYgKGFueV93cml0YWJsZSkKPj4+
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICphbnlfd3JpdGFibGUgfD0gd3JpdGFibGU7Cj4+Pgo+
Pj4gLcKgwqDCoMKgwqDCoMKgIGV4cGVjdGVkX3B0ZSA9IHB0ZV9uZXh0X3BmbihleHBlY3RlZF9w
dGUpOwo+Pj4gLcKgwqDCoMKgwqDCoMKgIHB0ZXArKzsKPj4+ICvCoMKgwqDCoMKgwqDCoCBmb3Ig
KGkgPSAwOyBpIDwgbnI7IGkrKykKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGV4cGVjdGVk
X3B0ZSA9IHB0ZV9uZXh0X3BmbihleHBlY3RlZF9wdGUpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHB0
ZXAgKz0gbnI7Cj4+PiAgwqDCoMKgwqB9Cj4+Pgo+Pj4gIMKgwqDCoMKgcmV0dXJuIHB0ZXAgLSBz
dGFydF9wdGVwOwo+Pj4gfQo+Pj4KPj4+Cj4+PiBTbyBJJ20gd29uZGVyaW5nIGlmIGluc3RlYWQg
b2YgZW5hYmxpbmcgcHRlX25leHRfcGZuKCkgZm9yIGFsbCB0aGUgYXJjaGVzLAo+Pj4gcGVyaGFw
cyBpdHMgYWN0dWFsbHkgYmV0dGVyIHRvIGV4cG9zZSBwdGVfcGdwcm90KCkgZm9yIGFsbCB0aGUg
YXJjaGVzLiBUaGVuIHdlCj4+PiBjYW4gYmUgbXVjaCBtb3JlIGZsZXhpYmxlIGFib3V0IGdlbmVy
YXRpbmcgcHRlcyB3aXRoIHBmbl9wdGUocGZuLCBwZ3Byb3QpLgo+Pj4KPj4+IFdoYXQgZG8geW91
IHRoaW5rPwo+Pgo+PiBUaGUgcHRlX3BncHJvdCgpIHN0dWZmIGlzIGp1c3QgbmFzdHkgSU1ITy4K
PiAKPiBJIGR1bm5vOyB3ZSBoYXZlIHBmbl9wdGUoKSB3aGljaCB0YWtlcyBhIHBmbiBhbmQgYSBw
Z3Byb3QuIEl0IHNlZW1zIHJlYXNvbmFibGUKPiB0aGF0IHdlIHNob3VsZCBiZSBhYmxlIHRvIGRv
IHRoZSByZXZlcnNlLgoKQnV0IHB0ZV9wZ3Byb3QoKSBpcyBvbmx5IGF2YWlsYWJsZSBvbiBhIGhh
bmRmdWwgb2YgYXJjaGl0ZWN0dXJlcywgbm8/IEl0IAp3b3VsZCBiZSBuaWNlIHRvIGhhdmUgYSBj
b21wbGV0ZWx5IGdlbmVyaWMgcHRlX25leHRfcGZuKCkgLyAKcHRlX2FkdmFuY2VfcGZucygpLCB0
aG91Z2guCgpBbnlob3csIHRoaXMgaXMgYWxsICJlYXN5IiB0byByZXdvcmsgbGF0ZXIuIFVubGVz
cyBJIGFtIG1pc3NpbmcgCnNvbWV0aGluZywgdGhlIGxvdyBoYW5naW5nIGZydWl0IGlzIHNpbXBs
eSB1c2luZyBQRk5fUFRFX1NISUZUIGZvciBub3cgCnRoYXQgZXhpc3RzIG9uIG1vc3QgYXJjaHMg
YWxyZWFkeS4KCj4gCj4+Cj4+IExpa2VseSBpdCdzIGJlc3QgdG8gc2ltcGx5IGNvbnZlcnQgcHRl
X25leHRfcGZuKCkgdG8gc29tZXRoaW5nIGxpa2UKPj4gcHRlX2FkdmFuY2VfcGZucygpLiBUaGUg
d2UgY291bGQganVzdCBoYXZlCj4+Cj4+ICNkZWZpbmUgcHRlX25leHRfcGZuKHB0ZSkgcHRlX2Fk
dmFuY2VfcGZucyhwdGUsIDEpCj4+Cj4+IFRoYXQgc2hvdWxkIGJlIGZhaXJseSBlYXN5IHRvIGRv
IG9uIHRvcCAoYmFzZWQgb24gUEZOX1BURV9TSElGVCkuIEFuZCBvbmx5IDMKPj4gYXJjaHMgKHg4
Ni02NCwgYXJtNjQsIGFuZCBwb3dlcnBjKSBuZWVkIHNsaWdodCBjYXJlIHRvIHJlcGxhY2UgYSBo
YXJkY29kZWQgIjEiCj4+IGJ5IGFuIGludGVnZXIgd2UgcGFzcyBpbi4KPiAKPiBJIHRob3VnaHQg
d2UgYWdyZWVkIHBvd2VycGMgd2FzIHNhZmUgdG8ganVzdCBkZWZpbmUgUEZOX1BURV9TSElGVD8g
QnV0LCB5ZWFoLAo+IHRoZSBwcmluY2lwbGUgd29ya3MgSSBndWVzcy4gSSBndWVzcyBJIGNhbiBk
byB0aGlzIGNoYW5nZSBhbG9uZyB3aXRoIG15IHNlcmllcy4KCkl0IGlzLCBpZiBub2JvZHkgaW5z
aXN0cyBvbiB0aGF0IG1pY3JvLW9wdGltaXphdGlvbiBvbiBwb3dlcnBjLgoKSWYgdGhlcmUgaXMg
Z29vZCByZWFzb24gdG8gaW52ZXN0IG1vcmUgdGltZSBhbmQgZWZmb3J0IHJpZ2h0IG5vdyBvbiB0
aGUgCnB0ZV9wZ3Byb3QgYXBwcm9hY2gsIHRoZW4gcGxlYXNlIGxldCBtZSBrbm93IDopCgotLSAK
Q2hlZXJzLAoKRGF2aWQgLyBkaGlsZGVuYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
