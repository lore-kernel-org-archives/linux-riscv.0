Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FE0C7EE2A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 17:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0EC8RsDy0AwZRzR1s66+eUBDJvzyQavlYRTC+VnEOk4=; b=rwDfkVO4ZA590g
	33ew0o7OsWfJ4tDOjDe++71/MCm4RW7zM/CFu4Gmr07xfPqPna59BHO7tzOdLvRVLCPzUp0ut6vdR
	+qY1VwxL7TqT9FAiha66KJ7sA2gYoYRLgMR1nmWDvV4ErYJfSJbtHAntT/2nBLFDCXDvJivUi+FEY
	aHNF2VDdMgmKd3MklXv8hF39TlErXN8Dbg1Pt9W1bwoaWLptPoyZ9Ye75yQsgDGqimdcV1HNMtmLU
	u3URpEInyZfOHf3G6rLcgVCYMen9iDb7qflVNqpBOivXgXRW+xi6oZTazwxky1dVp2HgqjqyHp+pY
	8lJdWru+PniaSGAIlZFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU3L-00000009TUc-07Ao;
	Wed, 25 Jun 2025 17:36:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPlX-00000008j2f-0ugj
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 13:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750856534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CWa9vLHjivGtX23R7pWprB8Tx5F1xP2O2QxWoGtKsMg=;
	b=AuuSiwiHjDpHvBFifUOowCJ7u+FS3Z5s9C2FKzXYN8ejQHqXMVwzojsn49QsGP6Q7LErA3
	AVB5dRc0xb1VtqszDSLy2QuOJLs/DOXFM9P19oRu/ozcZKw11GcfwC6+ouX+BSprsKOdy+
	pV/+arKH72bAfTUup3IMHlkfcbCaoFY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-br6ChroPOZO7SQtZwoS2OA-1; Wed, 25 Jun 2025 09:02:12 -0400
X-MC-Unique: br6ChroPOZO7SQtZwoS2OA-1
X-Mimecast-MFC-AGG-ID: br6ChroPOZO7SQtZwoS2OA_1750856530
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451d5600a54so12254235e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 06:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750856530; x=1751461330;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CWa9vLHjivGtX23R7pWprB8Tx5F1xP2O2QxWoGtKsMg=;
        b=WwaM4odNcSaJmM4VN9XC0wm224Iiu9BoC7OTLrnp/fEz4flOp0tHUuEUt2OfUtuh5y
         L7qE0dDwypgCXmf97JIJiWVzOIxCGz3bTKO3+7DuOmpQbeojNEn9ECDRHbpVc/HP8B5h
         mCnQKwP45D988tlfJq40XiO4HY0uyP0dTLo2k76QH4mWfdHJ30Gpdy16GKbITS5AbP6e
         N6o2FvmJax0j9ey3KxQBKQbGx5IbXkz7AON5vhkNg2taJAjSMeUnf7EsAHVPK/g39Mqt
         Z/WMemT+mtnPf1xNT1WYopkdtxk4VU2Z9lYa5YEmF+x+3FpTxywPQFp/esuy2QyHiWSc
         xm/A==
X-Forwarded-Encrypted: i=1; AJvYcCV7iHaZS+f1dMX+HzrUhFjohTGcOox8nOSGF0agJ6OHhoQfAEhrVvhd2PvDAM9WQLC0O9LJa6VIFXqPyg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yys0ZXHM4gyJYAXfGEbH7w52tQcWvwdzSfaPlFyVcdfT/f5BCCB
	QYWHIUOdClXqgVLTTWQKsVScnALDJ2/FHsDmY/y+LKAJWjhXChifsGKtN4edJaWA0RsAWXnfOmz
	A4MRxWuBx3f9umgnMjwBtviILCd01FtZTxtBkmI2pqXgxR9j4oC6cyqcK/mucoacWwrWxgg==
X-Gm-Gg: ASbGncss0jDkzeWxo2nx6vzec8+phhZbHGos6uiOhPhGCvt4ssf0LaA1fwljwfIOzTI
	RnJPgSAlQ43p4LqnyXVMHG2kIgtG5eLBgfZ99Jp8bJMw4iD4t3gfxQg9O9uNhFwFKYYdQ+iHsxL
	RaAhGcf6VuF1/hXPNRWnJxKTdGS/YgXpFxYpo7LFNe6Mobzsi8W80YBP2AmvNGM8wPVlQK+8enz
	ZoteNn0DgnaDCeOxXcUnyMfM7iw7nyVR9mainr6cwum1I29+7qRzHNgM+ftWbX/YCbZ8icXkJ2M
	W1Tqe8IZ+Oy79DiGmKgrEHuhzAL2FUJ0q3eKnOMYEOEL55umKayz8+JNMVRHpv9iVgHP+fipuNf
	6vOQSRiJ4Pi/9hGyGSQmqZSFir2+tJ/QusnXZum5Fx9tl
X-Received: by 2002:a05:600c:c111:b0:453:d3d:d9fd with SMTP id 5b1f17b1804b1-45381af1eb9mr24755055e9.12.1750856527989;
        Wed, 25 Jun 2025 06:02:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKiZA5X744huDWj+mGMDZbU1CSFk/eikCS0GwKNdrXtigtMtmCMaoW8coZuQI5rH2zraR2qQ==
X-Received: by 2002:a05:600c:c111:b0:453:d3d:d9fd with SMTP id 5b1f17b1804b1-45381af1eb9mr24753265e9.12.1750856525887;
        Wed, 25 Jun 2025 06:02:05 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c3c7csm19445455e9.36.2025.06.25.06.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 06:02:04 -0700 (PDT)
Message-ID: <6a754628-d9d8-43e1-a6d9-fa45a5f23971@redhat.com>
Date: Wed, 25 Jun 2025 15:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Lance Yang <lance.yang@linux.dev>, Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com>
 <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev>
 <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
 <5ba95609-302b-456a-a863-2bd5df51baf2@redhat.com>
 <CAGsJ_4zSGT05GjxM1H6JwSa5MhgtxaiYVa1Wtvm8+SmYkm=jmQ@mail.gmail.com>
 <6179dd30-5351-4a79-b0d6-f0e85650a926@redhat.com>
 <CAGsJ_4yTH5ngM++e=c+P7g0fXs-QQsOk2oxd1RWa3Qww97Knrw@mail.gmail.com>
 <5db6fb4c-079d-4237-80b3-637565457f39@redhat.com>
 <f1ee8679-88b4-4712-b2ed-c3eec179b430@linux.dev>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <f1ee8679-88b4-4712-b2ed-c3eec179b430@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lQY1FzWPINUqyJ03iEdASceITdo9GXIAijvsjH4YhB8_1750856530
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_060215_343338_38AAD824 
X-CRM114-Status: GOOD (  22.37  )
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

T24gMjUuMDYuMjUgMTQ6NTgsIExhbmNlIFlhbmcgd3JvdGU6Cj4gCj4gCj4gT24gMjAyNS82LzI1
IDIwOjA5LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4gT24gMjUuMDYuMjUgMTM6NDIsIEJh
cnJ5IFNvbmcgd3JvdGU6Cj4+PiBPbiBXZWQsIEp1biAyNSwgMjAyNSBhdCAxMToyN+KAr1BNIERh
dmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgo+Pj4gd3JvdGU6Cj4+Pj4KPj4+PiBP
biAyNS4wNi4yNSAxMzoxNSwgQmFycnkgU29uZyB3cm90ZToKPj4+Pj4gT24gV2VkLCBKdW4gMjUs
IDIwMjUgYXQgMTE6MDHigK9QTSBEYXZpZCBIaWxkZW5icmFuZAo+Pj4+PiA8ZGF2aWRAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4gT24gMjUuMDYuMjUgMTI6NTcsIEJhcnJ5IFNvbmcg
d3JvdGU6Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gTm90ZSB0aGF0IEkgZG9uJ3QgcXVpdGUgdW5kZXJz
dGFuZCB3aHkgd2UgaGF2ZSB0byBiYXRjaCB0aGUKPj4+Pj4+Pj4+IHdob2xlIHRoaW5nCj4+Pj4+
Pj4+PiBvciBmYWxsYmFjayB0bwo+Pj4+Pj4+Pj4gaW5kaXZpZHVhbCBwYWdlcy4gV2h5IGNhbid0
IHdlIHBlcmZvcm0gb3RoZXIgYmF0Y2hlcyB0aGF0IHNwYW4KPj4+Pj4+Pj4+IG9ubHkgc29tZQo+
Pj4+Pj4+Pj4gUFRFcz8gV2hhdCdzIHNwZWNpYWwKPj4+Pj4+Pj4+IGFib3V0IDEgUFRFIHZzLiAy
IFBURXMgdnMuIGFsbCBQVEVzPwo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGF0J3MgYSBnb29kIHBvaW50
IGFib3V0IHRoZSAiYWxsLW9yLW5vdGhpbmciIGJhdGNoaW5nIGxvZ2ljIDspCj4+Pj4+Pj4+Cj4+
Pj4+Pj4+IEl0IHNlZW1zIHRoZSAiYWxsLW9yLW5vdGhpbmciIGFwcHJvYWNoIGlzIHNwZWNpZmlj
IHRvIHRoZQo+Pj4+Pj4+PiBsYXp5ZnJlZSB1c2UKPj4+Pj4+Pj4gY2FzZSwgd2hpY2ggbmVlZHMg
dG8gdW5tYXAgdGhlIGVudGlyZSBmb2xpbyBmb3IgcmVjbGFtYXRpb24uIElmCj4+Pj4+Pj4+IHRo
YXQncwo+Pj4+Pj4+PiBub3QgcG9zc2libGUsIGl0IGZhbGxzIGJhY2sgdG8gdGhlIHNpbmdsZS1w
YWdlIHNsb3cgcGF0aC4KPj4+Pj4+Pgo+Pj4+Pj4+IE90aGVyIGNhc2VzIGFkdmFuY2UgdGhlIFBU
RSB0aGVtc2VsdmVzLCB3aGlsZSB0cnlfdG9fdW5tYXBfb25lKCkKPj4+Pj4+PiByZWxpZXMKPj4+
Pj4+PiBvbiBwYWdlX3ZtYV9tYXBwZWRfd2FsaygpIHRvIGFkdmFuY2UgdGhlIFBURS4gVW5sZXNz
IHdlIHdhbnQgdG8KPj4+Pj4+PiBtYW51YWxseQo+Pj4+Pj4+IG1vZGlmeSBwdm13LnB0ZSBhbmQg
cHZtdy5hZGRyZXNzIG91dHNpZGUgb2YKPj4+Pj4+PiBwYWdlX3ZtYV9tYXBwZWRfd2FsaygpLCB3
aGljaAo+Pj4+Pj4+IHRvIG1lIHNlZW1zIGxpa2UgYSB2aW9sYXRpb24gb2YgbGF5ZXJzLiA6LSkK
Pj4+Pj4+Cj4+Pj4+PiBQbGVhc2UgZXhwbGFpbiB0byBtZSB3aHkgdGhlIGZvbGxvd2luZyBpcyBu
b3QgY2xlYXJlciBhbmQgYmV0dGVyOgo+Pj4+Pgo+Pj4+PiBUaGlzIHBhcnQgaXMgbXVjaCBjbGVh
cmVyLCBidXQgdGhhdCBkb2VzbuKAmXQgbmVjZXNzYXJpbHkgaW1wcm92ZSB0aGUKPj4+Pj4gb3Zl
cmFsbAo+Pj4+PiBwaWN0dXJlLiBUaGUgbWFpbiBjaGFsbGVuZ2UgaXMgaG93IHRvIGV4aXQgdGhl
IGl0ZXJhdGlvbiBvZgo+Pj4+PiB3aGlsZSAocGFnZV92bWFfbWFwcGVkX3dhbGsoJnB2bXcpKS4K
Pj4+Pgo+Pj4+IE9rYXksIEkgZ2V0IHdoYXQgeW91IG1lYW4gbm93Lgo+Pj4+Cj4+Pj4+Cj4+Pj4+
IFJpZ2h0IG5vdywgd2UgaGF2ZSBpdCBsYWlkIG91dCBxdWl0ZSBzdHJhaWdodGZvcndhcmRseToK
Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogV2UgaGF2ZSBhbHJl
YWR5IGJhdGNoZWQgdGhlIGVudGlyZSBmb2xpbyAqLwo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiAobnJfcGFnZXMgPiAxKQo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byB3YWxrX2RvbmU7Cj4+Pj4K
Pj4+Pgo+Pj4+IEdpdmVuIHRoYXQgdGhlIGNvbW1lbnQgaXMgY29tcGxldGVseSBjb25mdXNpbmcg
d2hlbnMgc2VlaW5nIHRoZQo+Pj4+IGNoZWNrIC4uLiA6KQo+Pj4+Cj4+Pj4gLyoKPj4+PiAgwqDC
oCAqIElmIHdlIGFyZSBzdXJlIHRoYXQgd2UgYmF0Y2hlZCB0aGUgZW50aXJlIGZvbGlvIGFuZCBj
bGVhcmVkIGFsbAo+Pj4+IFBURXMsCj4+Pj4gIMKgwqAgKiB3ZSBjYW4ganVzdCBvcHRpbWl6ZSBh
bmQgc3RvcCByaWdodCBoZXJlLgo+Pj4+ICDCoMKgICovCj4+Pj4gaWYgKG5yX3BhZ2VzID09IGZv
bGlvX25yX3BhZ2VzKGZvbGlvKSkKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHdhbGtfZG9u
ZTsKPj4+Pgo+Pj4+IHdvdWxkIG1ha2UgdGhlIGNvbW1lbnQgbWF0Y2guCj4+Pgo+Pj4gWWVzLCB0
aGF0IGNsYXJpZmllcyBpdC4KPj4+Cj4+Pj4KPj4+Pj4KPj4+Pj4gd2l0aCBhbnkgbnIgYmV0d2Vl
biAxIGFuZCBmb2xpb19ucl9wYWdlcygpLCB3ZSBoYXZlIHRvIGNvbnNpZGVyIHR3bwo+Pj4+PiBp
c3N1ZXM6Cj4+Pj4+IDEuIEhvdyB0byBza2lwIFBURSBjaGVja3MgaW5zaWRlIHBhZ2Vfdm1hX21h
cHBlZF93YWxrIGZvciBlbnRyaWVzIHRoYXQKPj4+Pj4gd2VyZSBhbHJlYWR5IGhhbmRsZWQgaW4g
dGhlIHByZXZpb3VzIGJhdGNoOwo+Pj4+Cj4+Pj4gVGhleSBhcmUgY2xlYXJlZCBpZiB3ZSByZWFj
aCB0aGF0IHBvaW50LiBTbyB0aGUgcHRlX25vbmUoKSBjaGVja3Mgd2lsbAo+Pj4+IHNpbXBseSBz
a2lwIHRoZW0/Cj4+Pj4KPj4+Pj4gMi4gSG93IHRvIGJyZWFrIHRoZSBpdGVyYXRpb24gd2hlbiB0
aGlzIGJhdGNoIGhhcyBhcnJpdmVkIGF0IHRoZSBlbmQuCj4+Pj4KPj4+PiBwYWdlX3ZtYV9tYXBw
ZWRfd2FsaygpIHNob3VsZCBiZSBkb2luZyB0aGF0Pwo+Pj4KPj4+IEl0IHNlZW1zIHlvdSBtaWdo
dCBoYXZlIG1pc3NlZCB0aGUgcGFydCBpbiBteSByZXBseSB0aGF0IHNheXM6Cj4+PiAiT2YgY291
cnNlLCB3ZSBjb3VsZCBhdm9pZCBib3RoLCBidXQgdGhhdCB3b3VsZCBtZWFuIHBlcmZvcm1pbmcK
Pj4+IHVubmVjZXNzYXJ5Cj4+PiBjaGVja3MgaW5zaWRlIHBhZ2Vfdm1hX21hcHBlZF93YWxrKCku
Igo+PiAgID4gPiBUaGF04oCZcyB0cnVlIGZvciBib3RoLiBCdXQgSeKAmW0gd29uZGVyaW5nIHdo
eSB3ZeKAmXJlIHN0aWxsIGRvaW5nIHRoZQo+PiBjaGVjaywKPj4+IGV2ZW4gd2hlbiB3ZeKAmXJl
IGZhaXJseSBzdXJlIHRoZXnigJl2ZSBhbHJlYWR5IGJlZW4gY2xlYXJlZCBvciB3ZeKAmXZlIHJl
YWNoZWQKPj4+IHRoZSBlbmQgOi0pCj4+Cj4+IDopCj4+Cj4+Pgo+Pj4gU29tZWhvdywgSSBmZWVs
IHdlIGNvdWxkIGNvbWJpbmUgeW91ciBjbGVhbnVwIGNvZGXigJR3aGljaCBoYW5kbGVzIGEgYmF0
Y2gKPj4+IHNpemUgb2YgIm5yIiBiZXR3ZWVuIDEgYW5kIG5yX3BhZ2Vz4oCUd2l0aCB0aGUKPj4+
ICJpZiAobnJfcGFnZXMgPT0gZm9saW9fbnJfcGFnZXMoZm9saW8pKSBnb3RvIHdhbGtfZG9uZSIg
Y2hlY2suCj4+Cj4+IFllYWgsIHRoYXQncyB3aGF0IEkgd2FzIHN1Z2dlc3RpbmcuIEl0IHdvdWxk
IGhhdmUgdG8gYmUgcGFydCBvZiB0aGUKPj4gY2xlYW51cCBJIHRoaW5rLgo+Pgo+PiBJJ20gc3Rp
bGwgd29uZGVyaW5nIGlmIHRoZXJlIGlzIGEgY2FzZSB3aGVyZQo+Pgo+PiBpZiAobnJfcGFnZXMg
PT0gZm9saW9fbnJfcGFnZXMoZm9saW8pKQo+PiAgIMKgwqDCoMKgZ290byB3YWxrX2RvbmU7Cj4+
Cj4+IHdvdWxkIGJlIHdyb25nIHdoZW4gZGVhbGluZyB3aXRoIHNtYWxsIGZvbGlvcy4KPiAKPiBX
ZSBjYW4gbWFrZSB0aGUgY2hlY2sgbW9yZSBleHBsaWNpdCB0byBhdm9pZCBhbnkgZnV0dXJlIHRy
b3VibGUgOykKPiAKPiBpZiAobnJfcGFnZXMgPiAxICYmIG5yX3BhZ2VzID09IGZvbGlvX25yX3Bh
Z2VzKGZvbGlvKSkKPiAgICAgICBnb3RvIHdhbGtfZG9uZTsKPiAKPiBJdCBzaG91bGQgYmUgc2Fm
ZSBmb3Igc21hbGwgZm9saW9zLgoKSSBtZWFuLCB3ZSBhcmUgd2Fsa2luZyBhIHNpbmdsZSBWTUEs
IGFuZCBhIHNtYWxsIGZvbGlvIHNob3VsZCBuZXZlciBiZSAKbWFwcGVkIG11bHRpcGxlIHRpbWVz
IGludG8gdGhlIHNhbWUgVk1BLiAoaWdub3JpbmcgS1NNLCBidXQgS1NNIGlzIApoYW5kbGVkIGRp
ZmZlcmVudGx5IGVpdGhlciB3YXkpCgpTbyB3ZSBzaG91bGQgYmUgZ29vZCwganVzdCB3YW50ZWQg
dG8gcmFpc2UgaXQuCgotLSAKQ2hlZXJzLAoKRGF2aWQgLyBkaGlsZGVuYgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
