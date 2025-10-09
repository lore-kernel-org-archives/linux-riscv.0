Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A25CCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 10:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rKXxCwmHtD+/wUbVaTcXYwcfh2ACZyayFIE8tIqoS2E=; b=wBqn3ljs92BXfD
	zaajzfDYitvPcmeVM5+p0BlBgfp7Lvkpgcu282+Uqr/2Igce/5yP446qMzH3/mlZ2xEjWEAKOJEOC
	gR6zYglm8Ub19H4JR/ZPkLBA1Gfjb4ktpBM2gqaPapY34x75cgghLla2eXo4TZeDmfKOY52Foksrv
	8I8DWTqXZXuhw60zyBc8+CN64KHqcIK+UD+9wYmu9pZOpNSAKiHK5flJ/jbu+jmFm68Bdrlrhx8Fm
	cCj3cGeoY/WjK4msXdPdt/JyumbDxGizDKeaZADmFDA4M68SyQJRF50fBzoECRoSBBzuP9gZdzJ18
	X0iuLIXS836CfNcSAY/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nux-00000005nfU-1FXX;
	Thu, 09 Oct 2025 10:30:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nuu-00000005neo-2jpv
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 10:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760005835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5kNnaE3wosVbbZxnmP0sVKpcafEUi286yAMPQXV2QSw=;
	b=QhNlqUuEsZntvTKx/8um0mOXPrBTaocXHhJUBiXc0eBjqWRq2yTGClJBkTGOc2yp7VwzTy
	QjsteWnmZaTPA0KvttQcbt9UdhQhB5/iu4v2IN3rowl2TpF4BlKjApsiN7jS1ukF677+wu
	UOH+Qgx/PilnAElVViX2pOLP3CclQVw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-lrbWbdDcMt6WQzIwj2BpGQ-1; Thu, 09 Oct 2025 06:30:34 -0400
X-MC-Unique: lrbWbdDcMt6WQzIwj2BpGQ-1
X-Mimecast-MFC-AGG-ID: lrbWbdDcMt6WQzIwj2BpGQ_1760005833
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46e3e177893so4602605e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 03:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760005833; x=1760610633;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5kNnaE3wosVbbZxnmP0sVKpcafEUi286yAMPQXV2QSw=;
        b=J6XBkCZipYjc7hBVbcrUKxijpi1Q43Z5rwhzCBTekVJKQWQO6okjUaoGRLgGVOLGY/
         F18DgM13iLDTqgrwKHjABz2pwLDLnSjmXAnPnedIOOtg9pKYRibv14s1cOxg/3OIMrfF
         4tmSeljS2wiOSCJBqkoOy9xDtiay8N330XH9X5f+kTOY1WBjFuC9tj0FUiVxfT6Rb0XL
         LvhFN86mkXepiLbWw+APmvwYjm4OhLPGg3iAm0knP8GDXnd8F2LFW/HJhdtEUcCe5VO3
         SIwPsJxYhSawVivjaK4yB86UZ6723II5q4M5yDrDBQViUv3kh393phLWW0Bd2XblfRn2
         3Npw==
X-Forwarded-Encrypted: i=1; AJvYcCWNJfnttRHZXlkGwVtj3a/n7vfvxaX5tMl/LrGPg4hlXSVrbgyhdhhI3mqTkvqARb2Q3MitM91uSLyhGg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw59xUQpV+JiWrAq1RgdpZF7aWr+clDfDgl749X/hoELROB5D7+
	i/u7gdyk9NpzOiHcb1/bz00D3isPamYJiFZxxB5/pKANhSAPoDFtztmrRrj9l9HDC6Ogf00mpt/
	OUpA6eHev1tQw6gmoJF3T2Lmy0YLW6x4f+wMrpF16jl6+zDZWVVZLRodIZA/cwNw/qCk7ng==
X-Gm-Gg: ASbGnct49lQ6ga/JoOWDoW+oc9Lg+ZcRt2GVJomGGwYUbRAMfhu/IRC+CD7qXZTNQRf
	pqRAPET+3hoxw4ahmkaOAlFCa4Pr1nGnCYP5/J+pTyugh0bJtGXJu9manUotPk3gGAY7QZAGgcP
	DBNo3CMT/fkOWI+5D9WltzEHxY1JVT2aoUaNGn2JdUOjMQi9SHKNslmXOrwkyJIOhsdw03uAj1t
	DN2HSt54Fq+DoYhNqHyhYDYU6A1r3B/YPFjbQcoum3bSRpi5epy7VkP0SplxSNModJoWGJ/3olw
	h4bH5r95YMfVzF8ZRl8h96VlLDSbIgrfMfcCLMBcJs1Oc+Mcko9CMxgOIY5EaOmEM7XSUmE2zrT
	UbWnVpbWI
X-Received: by 2002:a05:600c:8b22:b0:46e:4882:94c7 with SMTP id 5b1f17b1804b1-46fa9b02c6amr45782595e9.28.1760005833125;
        Thu, 09 Oct 2025 03:30:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU6FTiIKoa0UkBC9Zx589zDahv6+GU8nNOKIx+xH1kxdPK8/6eRVsJOlUDPEfHImp4fkFddw==
X-Received: by 2002:a05:600c:8b22:b0:46e:4882:94c7 with SMTP id 5b1f17b1804b1-46fa9b02c6amr45781975e9.28.1760005832588;
        Thu, 09 Oct 2025 03:30:32 -0700 (PDT)
Received: from [192.168.3.141] (tmo-083-189.customers.d1-online.com. [80.187.83.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3cc939sm34647705e9.1.2025.10.09.03.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 03:30:32 -0700 (PDT)
Message-ID: <7d82cf5e-f60c-4295-9566-c40f6897fce7@redhat.com>
Date: Thu, 9 Oct 2025 12:30:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/35] mm/page_alloc: reject unreasonable
 folio/compound page sizes in alloc_contig_range_noprof()
To: Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org,
 Zi Yan <ziy@nvidia.com>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-7-david@redhat.com>
 <fa2e262c-d732-48e3-9c59-6ed7c684572c@nvidia.com>
 <5a5013ca-e976-4622-b881-290eb0d78b44@redhat.com>
 <a04d8499-85ad-40b4-8173-dcc81a5a71bf@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <a04d8499-85ad-40b4-8173-dcc81a5a71bf@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QZSDDRMx-z3aAMMKb2IISI8shNt-3jqw0oy4oX1xJQc_1760005833
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_033036_793774_F593EC5F 
X-CRM114-Status: GOOD (  21.73  )
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

T24gMDkuMTAuMjUgMTI6MjUsIEJhbGJpciBTaW5naCB3cm90ZToKPiBPbiAxMC85LzI1IDE3OjEy
LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4gT24gMDkuMTAuMjUgMDY6MjEsIEJhbGJpciBT
aW5naCB3cm90ZToKPj4+IE9uIDgvMjIvMjUgMDY6MDYsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3Rl
Ogo+Pj4+IExldCdzIHJlamVjdCB0aGVtIGVhcmx5LCB3aGljaCBpbiB0dXJuIG1ha2VzIGZvbGlv
X2FsbG9jX2dpZ2FudGljKCkgcmVqZWN0Cj4+Pj4gdGhlbSBwcm9wZXJseS4KPj4+Pgo+Pj4+IFRv
IGF2b2lkIGNvbnZlcnRpbmcgZnJvbSBvcmRlciB0byBucl9wYWdlcywgbGV0J3MganVzdCBhZGQg
TUFYX0ZPTElPX09SREVSCj4+Pj4gYW5kIGNhbGN1bGF0ZSBNQVhfRk9MSU9fTlJfUEFHRVMgYmFz
ZWQgb24gdGhhdC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEhpbGRlbmJyYW5kIDxk
YXZpZEByZWRoYXQuY29tPgo+Pj4+IC0tLQo+Pj4+ICDCoCBpbmNsdWRlL2xpbnV4L21tLmggfCA2
ICsrKystLQo+Pj4+ICDCoCBtbS9wYWdlX2FsbG9jLmPCoMKgwqAgfCA1ICsrKystCj4+Pj4gIMKg
IDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pj4+Cj4+
Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUvbGludXgvbW0uaAo+
Pj4+IGluZGV4IDAwYzhhNTQxMjdkMzcuLjc3NzM3Y2JmMjIxNmEgMTAwNjQ0Cj4+Pj4gLS0tIGEv
aW5jbHVkZS9saW51eC9tbS5oCj4+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9tbS5oCj4+Pj4gQEAg
LTIwNTUsMTEgKzIwNTUsMTMgQEAgc3RhdGljIGlubGluZSBsb25nIGZvbGlvX25yX3BhZ2VzKGNv
bnN0IHN0cnVjdCBmb2xpbyAqZm9saW8pCj4+Pj4gIMKgIMKgIC8qIE9ubHkgaHVnZXRsYmZzIGNh
biBhbGxvY2F0ZSBmb2xpb3MgbGFyZ2VyIHRoYW4gTUFYX09SREVSICovCj4+Pj4gIMKgICNpZmRl
ZiBDT05GSUdfQVJDSF9IQVNfR0lHQU5USUNfUEFHRQo+Pj4+IC0jZGVmaW5lIE1BWF9GT0xJT19O
Ul9QQUdFU8KgwqDCoCAoMVVMIDw8IFBVRF9PUkRFUikKPj4+PiArI2RlZmluZSBNQVhfRk9MSU9f
T1JERVLCoMKgwqDCoMKgwqDCoCBQVURfT1JERVIKPj4+Cj4+PiBEbyB3ZSBuZWVkIHRvIGNoZWNr
IGZvciBDT05USUdfQUxMT0MgYXMgd2VsbCB3aXRoIENPTkZJR19BUkNIX0hBU19HSUdBTlRJQ19Q
QUdFPwo+Pj4KPj4KPj4gSSBkb24ndCB0aGluayBzbywgY2FuIHlvdSBlbGFib3JhdGU/Cj4+Cj4g
Cj4gVGhlIG9ubHkgd2F5IHRvIGFsbG9jYXRlIGEgZ2lnYW50aWMgcGFnZSBpcyB0byB1c2UgQ01B
LCBJSVJDLCB3aGljaCBpcyBjb3ZlcmVkIGJ5IENPTlRJR19BTExPQwoKQXMgd2UgYXJlIGRpc2N1
c3NpbmcgYXMgcGFydCBvZiB2MiByaWdodCBub3csIHRoZXJlIGlzIHRoZSB3YXkgdG8ganVzdCAK
b2J0YWluIHRoZW0gZnJvbSBtZW1ibG9jayBkdXJpbmcgYm9vdC4KCj4gCj4+Pj4gIMKgICNlbHNl
Cj4+Pj4gLSNkZWZpbmUgTUFYX0ZPTElPX05SX1BBR0VTwqDCoMKgIE1BWF9PUkRFUl9OUl9QQUdF
Uwo+Pj4+ICsjZGVmaW5lIE1BWF9GT0xJT19PUkRFUsKgwqDCoMKgwqDCoMKgIE1BWF9QQUdFX09S
REVSCj4+Pj4gIMKgICNlbmRpZgo+Pj4+ICDCoCArI2RlZmluZSBNQVhfRk9MSU9fTlJfUEFHRVPC
oMKgwqAgKDFVTCA8PCBNQVhfRk9MSU9fT1JERVIpCj4+Pj4gKwo+Pj4+ICDCoCAvKgo+Pj4+ICDC
oMKgICogY29tcG91bmRfbnIoKSByZXR1cm5zIHRoZSBudW1iZXIgb2YgcGFnZXMgaW4gdGhpcyBw
b3RlbnRpYWxseSBjb21wb3VuZAo+Pj4+ICDCoMKgICogcGFnZS7CoCBjb21wb3VuZF9ucigpIGNh
biBiZSBjYWxsZWQgb24gYSB0YWlsIHBhZ2UsIGFuZCBpcyBkZWZpbmVkIHRvCj4+Pj4gZGlmZiAt
LWdpdCBhL21tL3BhZ2VfYWxsb2MuYyBiL21tL3BhZ2VfYWxsb2MuYwo+Pj4+IGluZGV4IGNhOWU2
Yjk2MzNmNzkuLjFlNmFlNGMzOTViMzAgMTAwNjQ0Cj4+Pj4gLS0tIGEvbW0vcGFnZV9hbGxvYy5j
Cj4+Pj4gKysrIGIvbW0vcGFnZV9hbGxvYy5jCj4+Pj4gQEAgLTY4MzMsNiArNjgzMyw3IEBAIHN0
YXRpYyBpbnQgX19hbGxvY19jb250aWdfdmVyaWZ5X2dmcF9tYXNrKGdmcF90IGdmcF9tYXNrLCBn
ZnBfdCAqZ2ZwX2NjX21hc2spCj4+Pj4gIMKgIGludCBhbGxvY19jb250aWdfcmFuZ2Vfbm9wcm9m
KHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLAo+Pj4+ICDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhY3JfZmxhZ3NfdCBhbGxvY19mbGFncywgZ2Zw
X3QgZ2ZwX21hc2spCj4+Pj4gIMKgIHsKPj4+PiArwqDCoMKgIGNvbnN0IHVuc2lnbmVkIGludCBv
cmRlciA9IGlsb2cyKGVuZCAtIHN0YXJ0KTsKPj4+Cj4+PiBEbyB3ZSBuZWVkIGEgVk1fV0FSTl9P
TihlbmQgPCBzdGFydCk/Cj4+Cj4+IEkgZG9uJ3QgdGhpbmsgc28uCj4+Cj4gCj4gZW5kIC0gc3Rh
cnQgYmVpbmcgPCAwLCBjb21wbGV0ZWx5IGJyZWFrcyBpbG9nMi4gQnV0IHdlIHdvdWxkIGVycm9y
IG91dCBiZWNhdXNlIGlsb2cyID4gTUFYX0ZPTElPX09SREVSLCBzbyB3ZSBzaG91bGQgZmluZQoK
UmlnaHQsIGFuZCBpZiB3ZSBoYXZlIGNvZGUgdGhhdCBidWdneSB0aGF0IGRvZXMgaXQsIGl0IHBy
b2JhYmx5IApzaG91bGRuJ3QgYmUgb3VyIHJlc3BvbnNpYmlsaXR5IHRvIHNhbml0eSBjaGVjayB0
aGF0IDopCgpJdCB3b3VsZCBoYXZlIGJlZW4gY29tcGxldGVseSBidWdneSBiZWZvcmUgdGhpcyBw
YXRjaC4KCj4gCj4+Pgo+Pj4+ICDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgb3V0ZXJfc3RhcnQs
IG91dGVyX2VuZDsKPj4+PiAgwqDCoMKgwqDCoCBpbnQgcmV0ID0gMDsKPj4+PiAgwqAgQEAgLTY4
NTAsNiArNjg1MSw5IEBAIGludCBhbGxvY19jb250aWdfcmFuZ2Vfbm9wcm9mKHVuc2lnbmVkIGxv
bmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLAo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBQQl9JU09MQVRFX01PREVfQ01BX0FMTE9DIDoK
Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
UEJfSVNPTEFURV9NT0RFX09USEVSOwo+Pj4+ICDCoCArwqDCoMKgIGlmIChXQVJOX09OX09OQ0Uo
KGdmcF9tYXNrICYgX19HRlBfQ09NUCkgJiYgb3JkZXIgPiBNQVhfRk9MSU9fT1JERVIpKQo+Pj4+
ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4+PiArCj4+Pj4gIMKgwqDCoMKgwqAg
Z2ZwX21hc2sgPSBjdXJyZW50X2dmcF9jb250ZXh0KGdmcF9tYXNrKTsKPj4+PiAgwqDCoMKgwqDC
oCBpZiAoX19hbGxvY19jb250aWdfdmVyaWZ5X2dmcF9tYXNrKGdmcF9tYXNrLCAoZ2ZwX3QgKikm
Y2MuZ2ZwX21hc2spKQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+
Pj4gQEAgLTY5NDcsNyArNjk1MSw2IEBAIGludCBhbGxvY19jb250aWdfcmFuZ2Vfbm9wcm9mKHVu
c2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLAo+Pj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBmcmVlX2NvbnRpZ19yYW5nZShlbmQsIG91dGVyX2VuZCAtIGVuZCk7Cj4+
Pj4gIMKgwqDCoMKgwqAgfSBlbHNlIGlmIChzdGFydCA9PSBvdXRlcl9zdGFydCAmJiBlbmQgPT0g
b3V0ZXJfZW5kICYmIGlzX3Bvd2VyX29mXzIoZW5kIC0gc3RhcnQpKSB7Cj4+Pj4gIMKgwqDCoMKg
wqDCoMKgwqDCoCBzdHJ1Y3QgcGFnZSAqaGVhZCA9IHBmbl90b19wYWdlKHN0YXJ0KTsKPj4+PiAt
wqDCoMKgwqDCoMKgwqAgaW50IG9yZGVyID0gaWxvZzIoZW5kIC0gc3RhcnQpOwo+Pj4+ICDCoCDC
oMKgwqDCoMKgwqDCoMKgwqAgY2hlY2tfbmV3X3BhZ2VzKGhlYWQsIG9yZGVyKTsKPj4+PiAgwqDC
oMKgwqDCoMKgwqDCoMKgIHByZXBfbmV3X3BhZ2UoaGVhZCwgb3JkZXIsIGdmcF9tYXNrLCAwKTsK
Pj4+Cj4+PiBBY2tlZC1ieTogQmFsYmlyIFNpbmdoIDxiYWxiaXJzQG52aWRpYS5jb20+Cj4+Cj4+
IFRoYW5rcyBmb3IgdGhlIHJldmlldywgYnV0IG5vdGUgdGhhdCB0aGlzIGlzIGFscmVhZHkgdXBz
dHJlYW0uCj4+Cj4gCj4gU29ycnksIHRoaXMgc2hvd2VkIHVwIGluIG15IHVwZGF0ZWQgbW0gdGhy
ZWFkIGFuZCBJIGVuZGVkIHVwIHJldmlld2luZyBpdCwgcGxlYXNlIGlnbm9yZSBpZiBpdCdzIHVw
c3RyZWFtCgpJJ20gaGFwcHkgZm9yIGFueSByZXZpZXcgKGJldHRlciBpbiByZXBseSB0byB2Miks
IGJlY2F1c2UgYW55IGJ1ZyBjYXVnaHQgCmVhcmx5IGlzIGdvb2QhCgoKLS0gCkNoZWVycwoKRGF2
aWQgLyBkaGlsZGVuYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
