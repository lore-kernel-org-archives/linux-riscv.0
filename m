Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5EAC7EE30
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 23:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RqcLQMmsAf1Iv37z1EABScilyFIRzhrfo+4Zl0C4Lb4=; b=FgsEIdByIb1CCx
	N6i7E/pxIRf8DgInkTzzy+rxp8zezaLYfbAxeJcUb9Aj5qtqPIA+2WDQHLiGlQsxRnHG/E18hi4v7
	J6DiNw3yLiLADF72ivaj2Riit1NOav8ubJPmAXxfgkfOTjMOljS6kanKUgSJLX3lZ2cVfhm4PmmN5
	kD/N9MkUUgKB99T+Y9g7D0gELJpeuEvIWoBR1oetzP3WwmXxPrOmx+MhZDnmZn2lCKXM2iyLDhsb9
	grmYhhnDzK+w03oxXPDb4NtwXKAzkNdIwSD/JxsNV6WtwEHMnclEzVIbGj+JffC1N/tYeUe4uPLZx
	EmQTp21Ar5TXkiB3ZlIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwJj-0000000D5yX-2DbW;
	Thu, 26 Jun 2025 23:47:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUuWn-0000000CsPa-2rCz
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 21:53:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750974784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Sds+EnePYO1cZCHbAHOJn503ulI/pwm3RK5XFeMRA7A=;
	b=ibFPaFA9ewYKPqsI+P2wNJw1P16rCaZz1kZC9TjKxpTuuBc8UeMPoJREXvE5aNOiFbxngX
	bFqOn3OrsqS3NHMnl40VOVpF0/3fY3dEySa0AWs2ezOfp4F1vuJW5OXiUJqmioiiWtd/EF
	TtFDdD+aygnDB+WbJxFmhDC+jwzThTg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-v_nGq0fkNVWyACWLjmSNgg-1; Thu, 26 Jun 2025 17:52:55 -0400
X-MC-Unique: v_nGq0fkNVWyACWLjmSNgg-1
X-Mimecast-MFC-AGG-ID: v_nGq0fkNVWyACWLjmSNgg_1750974774
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f8fd1847so558612f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jun 2025 14:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750974774; x=1751579574;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Sds+EnePYO1cZCHbAHOJn503ulI/pwm3RK5XFeMRA7A=;
        b=X9B3YadEiUyz1C3FAh13HdUk3RXDUJqSh9XBDofozyKSfvkIir99jwZ9I9FKSlut28
         TDlXNcdKg8Tta5xSxi2tXQQ5XOm0n+qDKEbCJP87CEK+fPkLmZlze+cLDlp4+l5PDFCV
         s5VUOIkuW7fkj2fH/a4NmqHM1Cdb46LYb/p3QPzQvh3HYwFEaLLZHNjbJW/S0rxmJ9fq
         lrzkQKIx+9KB8/wtiEFr0slhcQuNKfCcGwJzrjLH6+mIJ4gf3YbNoHUSipJMHw3Jx4Bv
         LXljKxbMpSMssHV/cT5zGBJ+WxSIvFOfxR1h5qRYquOhNG3Gz/qWMw6VzaR6b/s9BHPL
         sqqA==
X-Forwarded-Encrypted: i=1; AJvYcCVy4UzAvvmcPo0mrqBnqpEdih03h00R6bgeY4lk+paNCvadqjrp1kNnMMTumOLSB9KE55ianiETqGHMIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+b8T69t3BhGtCdtQ4yjj0ZjftTiPEUCMeuQBQ1t6vRnQAG+m7
	aRadxmoip50zZ1WhnizRVrDrVXbJcZhnhJuu+yOPEhocDnaxCjogwx7w66Hl7C8GQLOU20B2WLF
	mouEokwh6QInvFZlNXW7KlzR+5LTLpC+ifyMfMKY4Fo05jfMOENCe+406w3d6+OibvIJvcw==
X-Gm-Gg: ASbGncsxp0LD8Wu4JAuFlb9PPPgQ7TWDVrg377GyQyV47MNuFmdCNnZk4SqxiiANN1p
	2F1IqiTTyKyai2BzqagzEjs/OKMHuOpmq4jsSNxKIes+kIu0bmL4c+yIWpSRDoq0f77qMfo2wYT
	IB4cmRTeYNOK0LcgWrNTHhxjT3Nj0eLORwkj1R5ojnRLmCV7BfTOqkRHAKgAEuB1FICuH11Uu7n
	sHrqTAovEvQ8/xZeaWiErCCoMY8QJhj93fnHSqPBvZFq2OD5/SLO2IPk5CjdGgY+48ms1v8eVdr
	ekKwAkY2d7tV7rtpupT71JY531iL0GD1vodYpSrPyVjGtxDzDhr42Nut0WC2aLq7gdQtJD48Um0
	tSRaGuJDZXHovLTB/zk26s00oLGuEPofd88kWjXn/iB4PQSnHaA==
X-Received: by 2002:adf:b60f:0:b0:3a6:d296:feaf with SMTP id ffacd0b85a97d-3a8fe985feamr656661f8f.24.1750974773621;
        Thu, 26 Jun 2025 14:52:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF91pFzkN010jPQk8nO4iHG/+bQ0g3gbQdu1CsS5nqxXRrx9a1rGPo2RPO9VipXGBPN3oatgg==
X-Received: by 2002:adf:b60f:0:b0:3a6:d296:feaf with SMTP id ffacd0b85a97d-3a8fe985feamr656645f8f.24.1750974773213;
        Thu, 26 Jun 2025 14:52:53 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3c:2f00:8afc:23fe:3813:776c? (p200300d82f3c2f008afc23fe3813776c.dip0.t-ipconnect.de. [2003:d8:2f3c:2f00:8afc:23fe:3813:776c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fadf3sm958775f8f.34.2025.06.26.14.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 14:52:52 -0700 (PDT)
Message-ID: <4856517e-fb68-436f-8130-b7eb5749b7c0@redhat.com>
Date: Thu, 26 Jun 2025 23:52:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Barry Song <21cnbao@gmail.com>, Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, lance.yang@linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
References: <a5b5b0aa-21c4-4abf-b323-63af96aabcd5@redhat.com>
 <20250626092905.31305-1-ioworker0@gmail.com>
 <CAGsJ_4w5Obx9=P0wkrbLaDzKpG0e-7xs7jgHRa91KO7e92MO8g@mail.gmail.com>
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
In-Reply-To: <CAGsJ_4w5Obx9=P0wkrbLaDzKpG0e-7xs7jgHRa91KO7e92MO8g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nwYAHlXitkckbGcviuB_m-9NVZ1Xst4w7gM2nLU2V44_1750974774
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_145305_784845_CD6B197C 
X-CRM114-Status: GOOD (  10.46  )
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

T24gMjYuMDYuMjUgMjM6NDYsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gT24gVGh1LCBKdW4gMjYsIDIw
MjUgYXQgOToyOeKAr1BNIExhbmNlIFlhbmcgPGlvd29ya2VyMEBnbWFpbC5jb20+IHdyb3RlOgo+
Pgo+IFsuLi5dCj4+ICsKPj4gKyAgICAgICAgICAgICAgIC8qCj4+ICsgICAgICAgICAgICAgICAg
KiBJZiB3ZSBhcmUgc3VyZSB0aGF0IHdlIGJhdGNoZWQgdGhlIGVudGlyZSBmb2xpbyBhbmQgY2xl
YXJlZAo+PiArICAgICAgICAgICAgICAgICogYWxsIFBURXMsIHdlIGNhbiBqdXN0IG9wdGltaXpl
IGFuZCBzdG9wIHJpZ2h0IGhlcmUuCj4+ICsgICAgICAgICAgICAgICAgKi8KPj4gKyAgICAgICAg
ICAgICAgIGlmIChucl9wYWdlcyA9PSBmb2xpb19ucl9wYWdlcyhmb2xpbykpCj4gCj4gRGF2aWQg
YWxzbyBtZW50aW9uZWQgaWYgKG5yX3BhZ2VzID4gMSAmJiBucl9wYWdlcyA9PSBmb2xpb19ucl9w
YWdlcyhmb2xpbykpLgo+IEkgYXNzdW1lIGl04oCZcyBzdGlsbCBmaW5lIHdoZW4gbnJfcGFnZXMg
PT0gMSBmb3Igc21hbGwgZm9saW9zPyBObz8KClllYWgsIGFzIHJhaXNlZCBJIHRoaW5rIGl0IGlz
IGZpbmUuIFdlIHNob3VsZCBuZXZlciBoYXZlIGFueSBmb2xpbyBwYWdlIAptYXBwZWQgbXVsdGlw
bGUgdGltZXMgaW50byB0aGUgc2FtZSBWTUEgaW4gYW55IGNhc2UuIChleGNsdWRpbmcgS1NNIApw
YWdlcywgYnV0IHRoZXkgYXJlIGhhbmRsZWQgZGlmZmVyZW50eSwgdXNpbmcgYSBzcGVjaWFsaXpl
ZCBybWFwIHdhbGspCgotLSAKQ2hlZXJzLAoKRGF2aWQgLyBkaGlsZGVuYgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
