Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E239CCA0EFA
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 16:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hn83QcKAIfJ7ShBl1huJQ/r1mOmjQ5TpOu6JLDDZLGc=; b=NOC04QMix4JLsU
	6Fimb3evjK9QfYOvHMPboA5leFYsVsNVQen/geq0UJ67trTT55rNvrxJy/GfxFJSV/c8MFvcg+ioi
	hqBAzvBgJsrCj1DyxWI470e5vabgjo+zZictjklUwddRtdH0YYQvWuDU5pHmSal3vxNgp1bp1BNJ4
	tR3TP016l+q8UpXGZU4hDYiMI8bKk3UEbKoHUwHBG+S3RHyg7i+ku5GMjx26DCnmafJsNGHeJg1F+
	Rjxfe1ec+IpPDK6qbidEGXsbLqx2MYQUE3QZqj1hPxFZHAFqXM8rsbkC8Qsa0K2rVRyAEcSnNBla8
	t7wjAZpB05rgb/2A5Q+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqa6k-00000008fqr-1tfM;
	Mon, 25 Aug 2025 16:31:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZLF-00000008YIV-3X6n
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 15:42:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756136560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5rvZAalDayw76mXlaVcK2G8fQoANSfCHvdaqQVOogfc=;
	b=EytJjY0cBNp0tEzsaygczBtf+uleFK9BXGkpRwZ1UY0bkGyFe4e2kc3pKKANTnNOQNbKi9
	Rh31OVVOr+uVXgoA6zOQSpM5ZO/lzFCkK7YxQmF7C2cdJaiq99THlbYcLZWF8YofD+GppD
	ILXwPV9A/O3DSJfiBpry5naLsegbbFI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-eGw1lqS7NqKShJm6WTKh9Q-1; Mon, 25 Aug 2025 11:42:39 -0400
X-MC-Unique: eGw1lqS7NqKShJm6WTKh9Q-1
X-Mimecast-MFC-AGG-ID: eGw1lqS7NqKShJm6WTKh9Q_1756136558
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45a1b0d221aso22974985e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 08:42:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756136558; x=1756741358;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rvZAalDayw76mXlaVcK2G8fQoANSfCHvdaqQVOogfc=;
        b=UUVxBLNteEhQqsYk6LeXlJin9LqqEubJYh9yO5vNeSKDIcx10z/F1+iwU8e45E2ICJ
         VCCe0ayBwV0vOedEFF3X2nU8uPrFA/5fEznf02bR9RRRYpd5247LM3rOUt6HvmBr2aHI
         j7UPt8PBgDJkLi1FwajtksaKPm1qLDvbh+TJ9157NY5q4Li9+QZdgLTYA2JoMJ6wedYc
         F5BkBfYee8oxNBDBTEjcm8JE9EYyKeKr5HNDdbhdTqVXO6Rl2ym8KW3jwdcHXJIOXQBa
         vj8zz0hHqP/v4tjl5Z3cCClgZm+atWzqCO120RdAHg3MSE3tkF6gZGpE/UFQ7snElGzl
         STqw==
X-Forwarded-Encrypted: i=1; AJvYcCV4MISIXlGzb7LTB9xYVrX8CeX8MhY0q2FAPzcWFDWkM9XKaTMhyciozUaWsr/xROe6yY3s8XJwaMXR9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxihShh7vwdOo1ui2A7ncLCF66j0i3kQLOVTs6oENY4lAj2QeZ3
	lgzfT5X0b8SpIGUa1FHMJ2LlfmJFT6SegPIeszEJItT/I70xQA3kndBILc2IfC4ulfVEhUthsBJ
	lpVyfzVAtnpBnqpunrIX2HEFlk/pixNNSpC1so4+bTWkQiSddKiBRwMcY5p0qvHcz6UpUYg==
X-Gm-Gg: ASbGncvhUoTaXBZdx/TpvoYxS8A1trF2T2HRtB+U0hA5J8HEifFniiBoyxv5kO4/mB5
	sbgeOlZhb+sb5gIhQV3F9vSipg7Bgt6DBZJsQm6Qdzd3baM0wRfgkAlS/csO+32axunqJN/eqDK
	WJRaGoW8UQma+bFx99LaDS+JV9RXZcM1qydWuC+LsjOWema0rGRtVMiy715aeoRK6kS3G65bqmk
	tzCfL6cnmRZT444G1E7MITHbgK5YW8ye0QhXjzwOPIIGWODjGuRaPyjoBLFCofdiCq+IiXl3g4I
	8bKttmbL5oSGdfUouRIhGOF6xl3mDxFHUktIi9P22FiT0+KuVobQEjOcJFwyFn+0sP5tkkZrg61
	fHpSRnnpVSrnV9/JZ1D1kbBD8TEZBMmxTaYy5wvIqAcYRI9ZdmiAG7/LJBxf9UfKoAIA=
X-Received: by 2002:a05:600c:a344:b0:459:443e:b180 with SMTP id 5b1f17b1804b1-45b51f30f97mr116842355e9.8.1756136557848;
        Mon, 25 Aug 2025 08:42:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGzUl9/0T2mWXVZgblyhy3uP4lA/MNqA3E39+SzULqMR3WsGlHrWnWezXsHsIiYJtRmIOh8A==
X-Received: by 2002:a05:600c:a344:b0:459:443e:b180 with SMTP id 5b1f17b1804b1-45b51f30f97mr116841885e9.8.1756136557395;
        Mon, 25 Aug 2025 08:42:37 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4f:1300:42f1:98e5:ddf8:3a76? (p200300d82f4f130042f198e5ddf83a76.dip0.t-ipconnect.de. [2003:d8:2f4f:1300:42f1:98e5:ddf8:3a76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b57444958sm113196675e9.2.2025.08.25.08.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 08:42:36 -0700 (PDT)
Message-ID: <f8140a17-c4ec-489b-b314-d45abe48bf36@redhat.com>
Date: Mon, 25 Aug 2025 17:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/35] mm/hugetlb: cleanup
 hugetlb_folio_init_tail_vmemmap()
To: Mike Rapoport <rppt@kernel.org>
Cc: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>,
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
 Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-11-david@redhat.com>
 <9156d191-9ec4-4422-bae9-2e8ce66f9d5e@redhat.com>
 <7077e09f-6ce9-43ba-8f87-47a290680141@redhat.com>
 <aKmDBobyvEX7ZUWL@kernel.org>
 <a90cf9a3-d662-4239-ad54-7ea917c802a5@redhat.com>
 <aKxz9HLQTflFNYEu@kernel.org>
 <a72080b4-5156-4add-ac7c-1160b44e0dfe@redhat.com>
 <aKx6SlYrj_hiPXBB@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <aKx6SlYrj_hiPXBB@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y41ZhsUQssxAv-AC_BYXhKOrPblR4GAxd0pyhy53KCs_1756136558
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_084241_955702_3C676F5C 
X-CRM114-Status: GOOD (  25.08  )
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

T24gMjUuMDguMjUgMTY6NTksIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gT24gTW9uLCBBdWcgMjUs
IDIwMjUgYXQgMDQ6Mzg6MDNQTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+IE9u
IDI1LjA4LjI1IDE2OjMyLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+Pj4gT24gTW9uLCBBdWcgMjUs
IDIwMjUgYXQgMDI6NDg6NThQTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+Pj4g
T24gMjMuMDguMjUgMTA6NTksIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4+Pj4+IE9uIEZyaSwgQXVn
IDIyLCAyMDI1IGF0IDA4OjI0OjMxQU0gKzAyMDAsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+
Pj4+Pj4gT24gMjIuMDguMjUgMDY6MDksIE1pa2EgUGVudHRpbMOkIHdyb3RlOgo+Pj4+Pj4+Cj4+
Pj4+Pj4gT24gOC8yMS8yNSAyMzowNiwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+Pj4+Pj4K
Pj4+Pj4+Pj4gQWxsIHBhZ2VzIHdlcmUgYWxyZWFkeSBpbml0aWFsaXplZCBhbmQgc2V0IHRvIFBh
Z2VSZXNlcnZlZCgpIHdpdGggYQo+Pj4+Pj4+PiByZWZjb3VudCBvZiAxIGJ5IE1NIGluaXQgY29k
ZS4KPj4+Pj4+Pgo+Pj4+Pj4+IEp1c3QgdG8gYmUgc3VyZSwgaG93IGlzIHRoaXMgd29ya2luZyB3
aXRoIE1FTUJMT0NLX1JTUlZfTk9JTklULCB3aGVyZSBNTSBpcyBzdXBwb3NlZCBub3QgdG8KPj4+
Pj4+PiBpbml0aWFsaXplIHN0cnVjdCBwYWdlcz8KPj4+Pj4+Cj4+Pj4+PiBFeGNlbGxlbnQgcG9p
bnQsIEkgZGlkIG5vdCBrbm93IGFib3V0IHRoYXQgb25lLgo+Pj4+Pj4KPj4+Pj4+IFNwb3R0aW5n
IHRoYXQgd2UgZG9uJ3QgZG8gdGhlIHNhbWUgZm9yIHRoZSBoZWFkIHBhZ2UgbWFkZSBtZSBhc3N1
bWUgdGhhdAo+Pj4+Pj4gaXQncyBqdXN0IGEgbWlzdXNlIG9mIF9faW5pdF9zaW5nbGVfcGFnZSgp
Lgo+Pj4+Pj4KPj4+Pj4+IEJ1dCB0aGUgbmFzdHkgdGhpbmcgaXMgdGhhdCB3ZSB1c2UgbWVtYmxv
Y2tfcmVzZXJ2ZWRfbWFya19ub2luaXQoKSB0byBvbmx5Cj4+Pj4+PiBtYXJrIHRoZSB0YWlsIHBh
Z2VzIC4uLgo+Pj4+Pgo+Pj4+PiBBbmQgZXZlbiBuYXN0aWVyIHRoaW5nIGlzIHRoYXQgd2hlbiBD
T05GSUdfREVGRVJSRURfU1RSVUNUX1BBR0VfSU5JVCBpcwo+Pj4+PiBkaXNhYmxlZCBzdHJ1Y3Qg
cGFnZXMgYXJlIGluaXRpYWxpemVkIHJlZ2FyZGxlc3Mgb2YKPj4+Pj4gbWVtYmxvY2tfcmVzZXJ2
ZWRfbWFya19ub2luaXQoKS4KPj4+Pj4KPj4+Pj4gSSB0aGluayB0aGlzIHBhdGNoIHNob3VsZCBn
byBpbiBiZWZvcmUgeW91ciB1cGRhdGVzOgo+Pj4+Cj4+Pj4gU2hvdWxkbid0IHdlIGZpeCB0aGlz
IGluIG1lbWJsb2NrIGNvZGU/Cj4+Pj4KPj4+PiBIYWNraW5nIGFyb3VuZCB0aGF0IGluIHRoZSBt
ZW1ibG9ja19yZXNlcnZlZF9tYXJrX25vaW5pdCgpIHVzZXIgc291bmQgd3JvbmcKPj4+PiAtLSBh
bmQgbm90aGluZyBpbiB0aGUgZG9jIG9mIG1lbWJsb2NrX3Jlc2VydmVkX21hcmtfbm9pbml0KCkg
c3BlbGxzIHRoYXQKPj4+PiBiZWhhdmlvciBvdXQuCj4+Pgo+Pj4gV2UgY2FuIHN1cmVseSB1cGRh
dGUgdGhlIGRvY3MsIGJ1dCB1bmZvcnR1bmF0ZWx5IEkgZG9uJ3Qgc2VlIGhvdyB0byBhdm9pZAo+
Pj4gaGFja2luZyBhcm91bmQgaXQgaW4gaHVnZXRsYi4KPj4+IFNpbmNlIGl0J3MgdXNlZCB0byBv
cHRpbWlzZSBIVk8gZXZlbiBmdXJ0aGVyIHRvIHRoZSBwb2ludCBodWdldGxiIG9wZW4KPj4+IGNv
ZGVzIG1lbW1hcCBpbml0aWFsaXphdGlvbiwgSSB0aGluayBpdCdzIGZhaXIgdGhhdCBpdCBzaG91
bGQgZGVhbCB3aXRoIGFsbAo+Pj4gcG9zc2libGUgY29uZmlndXJhdGlvbnMuCj4+Cj4+IFJlbWlu
ZCBtZSwgd2h5IGNhbid0IHdlIHN1cHBvcnQgbWVtYmxvY2tfcmVzZXJ2ZWRfbWFya19ub2luaXQo
KSB3aGVuCj4+IENPTkZJR19ERUZFUlJFRF9TVFJVQ1RfUEFHRV9JTklUIGlzIGRpc2FibGVkPwo+
IAo+IFdoZW4gQ09ORklHX0RFRkVSUkVEX1NUUlVDVF9QQUdFX0lOSVQgaXMgZGlzYWJsZWQgd2Ug
aW5pdGlhbGl6ZSB0aGUgZW50aXJlCj4gbWVtbWFwIGVhcmx5IChzZXR1cF9hcmNoKCktPmZyZWVf
YXJlYV9pbml0KCkpLCBhbmQgd2UgbWF5IGhhdmUgYSBidW5jaCBvZgo+IG1lbWJsb2NrX3Jlc2Vy
dmVkX21hcmtfbm9pbml0KCkgYWZ0ZXJ3YXJkcwoKT2gsIHlvdSBtZWFuIHRoYXQgd2UgZ2V0IGVm
ZmVjdGl2ZSBtZW1ibG9jayBtb2RpZmljYXRpb25zIGFmdGVyIGFscmVhZHkKaW5pdGlhbGl6aW5n
IHRoZSBtZW1tYXAuCgpUaGF0IHNvdW5kcyAuLi4gaW50ZXJlc3RpbmcgOikKClNvIHllYWgsIHdl
IGhhdmUgdG8gZG9jdW1lbnQgdGhpcyBmb3IgbWVtYmxvY2tfcmVzZXJ2ZWRfbWFya19ub2luaXQo
KS4KCklzIGl0IGFsc28gYSBwcm9ibGVtIGZvciBrZXhlY19oYW5kb3Zlcj8KCldlIHNob3VsZCBk
byBzb21ldGhpbmcgbGlrZToKCmRpZmYgLS1naXQgYS9tbS9tZW1ibG9jay5jIGIvbW0vbWVtYmxv
Y2suYwppbmRleCAxNTRmMWQ3M2I2MWYyLi5lZDRjNTYzZDcyYzMyIDEwMDY0NAotLS0gYS9tbS9t
ZW1ibG9jay5jCisrKyBiL21tL21lbWJsb2NrLmMKQEAgLTEwOTEsMTMgKzEwOTEsMTYgQEAgaW50
IF9faW5pdF9tZW1ibG9jayBtZW1ibG9ja19jbGVhcl9ub21hcChwaHlzX2FkZHJfdCBiYXNlLCBw
aHlzX2FkZHJfdCBzaXplKQogIAogIC8qKgogICAqIG1lbWJsb2NrX3Jlc2VydmVkX21hcmtfbm9p
bml0IC0gTWFyayBhIHJlc2VydmVkIG1lbW9yeSByZWdpb24gd2l0aCBmbGFnCi0gKiBNRU1CTE9D
S19SU1JWX05PSU5JVCB3aGljaCByZXN1bHRzIGluIHRoZSBzdHJ1Y3QgcGFnZXMgbm90IGJlaW5n
IGluaXRpYWxpemVkCi0gKiBmb3IgdGhpcyByZWdpb24uCisgKiBNRU1CTE9DS19SU1JWX05PSU5J
VCB3aGljaCBhbGxvd3MgZm9yIHRoZSAic3RydWN0IHBhZ2VzIiBjb3JyZXNwb25kaW5nCisgKiB0
byB0aGlzIHJlZ2lvbiBub3QgZ2V0dGluZyBpbml0aWFsaXplZCwgYmVjYXVzZSB0aGUgY2FsbGVy
IHdpbGwgdGFrZQorICogY2FyZSBvZiBpdC4KICAgKiBAYmFzZTogdGhlIGJhc2UgcGh5cyBhZGRy
IG9mIHRoZSByZWdpb24KICAgKiBAc2l6ZTogdGhlIHNpemUgb2YgdGhlIHJlZ2lvbgogICAqCi0g
KiBzdHJ1Y3QgcGFnZXMgd2lsbCBub3QgYmUgaW5pdGlhbGl6ZWQgZm9yIHJlc2VydmVkIG1lbW9y
eSByZWdpb25zIG1hcmtlZCB3aXRoCi0gKiAlTUVNQkxPQ0tfUlNSVl9OT0lOSVQuCisgKiAic3Ry
dWN0IHBhZ2VzIiB3aWxsIG5vdCBiZSBpbml0aWFsaXplZCBmb3IgcmVzZXJ2ZWQgbWVtb3J5IHJl
Z2lvbnMgbWFya2VkCisgKiB3aXRoICVNRU1CTE9DS19SU1JWX05PSU5JVCBpZiB0aGlzIGZ1bmN0
aW9uIGlzIGNhbGxlZCBiZWZvcmUgaW5pdGlhbGl6YXRpb24KKyAqIGNvZGUgcnVucy4gV2l0aG91
dCBDT05GSUdfREVGRVJSRURfU1RSVUNUX1BBR0VfSU5JVCwgaXQgaXMgbW9yZSBsaWtlbHkKKyAq
IHRoYXQgdGhpcyBmdW5jdGlvbiBpcyBub3QgZWZmZWN0aXZlLgogICAqCiAgICogUmV0dXJuOiAw
IG9uIHN1Y2Nlc3MsIC1lcnJubyBvbiBmYWlsdXJlLgogICAqLwoKCk9wdGltaXppbmcgdGhlIGh1
Z2V0bGIgY29kZSBjb3VsZCBiZSBkb25lLCBidXQgSSBhbSBub3Qgc3VyZSBob3cgaGlnaAp0aGUg
cHJpb3JpdHkgaXMgKG5vYm9keSBjb21wbGFpbmVkIHNvIGZhciBhYm91dCB0aGUgZG91YmxlIGlu
aXQpLgoKLS0gCkNoZWVycwoKRGF2aWQgLyBkaGlsZGVuYgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
