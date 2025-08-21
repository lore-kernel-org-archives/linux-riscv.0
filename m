Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8632ECA0EFA
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 02:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ndtjDFoLA/8KjdQ760/QFd90sq4zcq0H1qGxVNZyArQ=; b=Kru6QwiA4aNVBQ
	/vtdUYu9Nif2dmf2A712IEervX1P3NeygmxLE+l9eG40q6txFKuFtHRgKFIP2ihHLvhdaF+shpEQ4
	tp30EqLDUuarFxj10gcw2JSHeFyM5yhFsZQ+rOnjgkzgH8uR1mQ2lAsdxT5e/1W1QaofcgQgR2bfO
	oy0yZXGrW4NwQRyGTEXhjQklKYD/Y1m+ItYWQii+bkKMVg4Sl4bVTIQ9q3VhvJ/TVuLYA3nxAG7LF
	KkFJCSzsxeiC9rvRT18YYCHaF8wMv0Yp/3IcF4VaVhNJ5ndtZLuTxAuoH46+ueL1EtARtd6tlJoko
	/IvRrlmKEIxNXuaRjnTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upHNK-00000001GAz-1a9O;
	Fri, 22 Aug 2025 02:19:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCDk-00000000Y0I-42am
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:49:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755809356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OQbfbvrWDouK+ZcKIphQE1nervr1PSIMFSTWfTxDfjA=;
	b=G40SbERBJh+llM8CAKgG2B3k8FjrE5hIXCq1ar/UQVQSUJ4IdqSKKuzvTm661gIjP3WNLP
	JNzZ475Kkf3BemLcxh6G1AzU13YsAEZiT/JXPsB1QTM3Lkotehf9TPH8Q7UDHEG78MP5RS
	34NbAef/ZzkwMcl75fsfXwlzf8McXvk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-bEThClQoMzuq0KCd6cz3ZA-1; Thu, 21 Aug 2025 16:49:12 -0400
X-MC-Unique: bEThClQoMzuq0KCd6cz3ZA-1
X-Mimecast-MFC-AGG-ID: bEThClQoMzuq0KCd6cz3ZA_1755809351
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45a1b0cfbafso7963485e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755809351; x=1756414151;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OQbfbvrWDouK+ZcKIphQE1nervr1PSIMFSTWfTxDfjA=;
        b=of/JEBI7H+ahy9LXNoZOFtrJaDyA7lyx+5iK0s8NjCdgnQviwYhlSpQpar/iA+AJLs
         LPs6H1J8uV/gL4IpqZpwaxP4gmsjwKMXkF/1q9slyR+oAkcG2Wb2ZF8Li7cRRTHDItxC
         MGEN/NMhrB1y559UPdem/rj+bKBKl6GFReJ5rJFnPRUE7dbGEZXumfTeklXTaSC52H1/
         0oA8uUJuTGfUGFJPuq7GDp24/KDWm0iArbRFPrz7JmOX3QV3vwIPlccYoihqLXmRwkX8
         AkKiilngRPIhaffsvDk027x3zsNpojEydY/mlUuIuN7EO8KnC6RQYcC77gIqj65lGo34
         sYiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEz2qPa8AfthQPEj1o2wEW2MgNMo2kMVEgfLoUlJt0RiyD9T28eMV5L5ItCx71FuKYx2nl+wPOg7dazg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFACgFriyaxTRoPx7DqmI9dNm4gVJ2OcgCaUPfsgmzPCjdAGJk
	bx1Dlrj8dM7N/d2n5oGnQ7sZtLePMToIG0N1bkRLyrH/m3oTElGq76EC2NuXao66ZRzTLWa7KkO
	Yf+PAvt1r7wyzIXaPvlwacG5li50miw9lNOw/0TLs1mVS86gQUf/5d42yyjxcJQvbikL36w==
X-Gm-Gg: ASbGncuoqPtIkVmbI6wzsECjI6Ji03xW7YH30oVfZ/AleNrQSpIbPpYifdyoeTchVSQ
	TdTaaxvAVKnSGkt14TnEQALzB8vBU8OXQI1bshsLy4e9+ka9mT+ByZG5At9+aZXRWzYaNTapn9t
	hB5sqDzD7ZKZ81O4EZCjEQNa8Y2gWHs8De7WAG1xHzPV7mdKNwdBYYFWlU9vX41TxIg0guhUh3p
	ywEKiR28nsNXeOb45X1YU9GVtkjlRRD5Qz3berVOiAzJ5q6Bou9cZ5FXm8+Hw1JmjPehdOgjpDr
	9WQztYmlJi/khK6Llnk3AFsdPFDpmh43Vk4gKBbNRTQHH3deLL4rq5cT5P01wlUCxj+DJc2IVEe
	rxHmnCLH0SUR9Wp1fGThbZubdBnEH/+lNhLbaYOJY97eOL45/rBk9CB2X34IeQw==
X-Received: by 2002:a05:600c:3584:b0:459:a1c7:99ad with SMTP id 5b1f17b1804b1-45b517c5dc0mr2898235e9.22.1755809351439;
        Thu, 21 Aug 2025 13:49:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQxIz6cJmjwdOB6bO2j0uv4baEhvDU693i3u6jJ5B08S4e/6/ILSJ1Cj5B/IwK2GJTi24SIA==
X-Received: by 2002:a05:600c:3584:b0:459:a1c7:99ad with SMTP id 5b1f17b1804b1-45b517c5dc0mr2897695e9.22.1755809350879;
        Thu, 21 Aug 2025 13:49:10 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f26:ba00:803:6ec5:9918:6fd? (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c4c218c599sm3550158f8f.67.2025.08.21.13.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:49:10 -0700 (PDT)
Message-ID: <835b776a-4e15-4821-a601-1470807373a1@redhat.com>
Date: Thu, 21 Aug 2025 22:49:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 12/35] mm: limit folio/compound page sizes in
 problematic kernel configs
To: Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>,
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
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-13-david@redhat.com>
 <FFF22E91-6CA5-4C8F-92DE-89C22DB3EAD7@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <FFF22E91-6CA5-4C8F-92DE-89C22DB3EAD7@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JMRMNeZMGm3PGC-4IbULAcqiD3Kwo118ybCOqL29ELA_1755809351
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_134917_069076_B5E22D82 
X-CRM114-Status: GOOD (  17.24  )
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

T24gMjEuMDguMjUgMjI6NDYsIFppIFlhbiB3cm90ZToKPiBPbiAyMSBBdWcgMjAyNSwgYXQgMTY6
MDYsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+IAo+PiBMZXQncyBsaW1pdCB0aGUgbWF4aW11
bSBmb2xpbyBzaXplIGluIHByb2JsZW1hdGljIGtlcm5lbCBjb25maWcgd2hlcmUKPj4gdGhlIG1l
bW1hcCBpcyBhbGxvY2F0ZWQgcGVyIG1lbW9yeSBzZWN0aW9uIChTUEFSU0VNRU0gd2l0aG91dAo+
PiBTUEFSU0VNRU1fVk1FTU1BUCkgdG8gYSBzaW5nbGUgbWVtb3J5IHNlY3Rpb24uCj4+Cj4+IEN1
cnJlbnRseSwgb25seSBhIHNpbmdsZSBhcmNoaXRlY3R1cmVzIHN1cHBvcnRzIEFSQ0hfSEFTX0dJ
R0FOVElDX1BBR0UKPj4gYnV0IG5vdCBTUEFSU0VNRU1fVk1FTU1BUDogc2guCj4+Cj4+IEZvcnR1
bmF0ZWx5LCB0aGUgYmlnZ2VzdCBodWdldGxiIHNpemUgc2ggc3VwcG9ydHMgaXMgNjQgTWlCCj4+
IChIVUdFVExCX1BBR0VfU0laRV82NE1CKSBhbmQgdGhlIHNlY3Rpb24gc2l6ZSBpcyBhdCBsZWFz
dCA2NCBNaUIKPj4gKFNFQ1RJT05fU0laRV9CSVRTID09IDI2KSwgc28gdGhlaXIgdXNlIGNhc2Ug
aXMgbm90IGRlZ3JhZGVkLgo+Pgo+PiBBcyBmb2xpb3MgYW5kIG1lbW9yeSBzZWN0aW9ucyBhcmUg
bmF0dXJhbGx5IGFsaWduZWQgdG8gdGhlaXIgb3JkZXItMiBzaXplCj4+IGluIG1lbW9yeSwgY29u
c2VxdWVudGx5IGEgc2luZ2xlIGZvbGlvIGNhbiBubyBsb25nZXIgc3BhbiBtdWx0aXBsZSBtZW1v
cnkKPj4gc2VjdGlvbnMgb24gdGhlc2UgcHJvYmxlbWF0aWMga2VybmVsIGNvbmZpZ3MuCj4+Cj4+
IG50aF9wYWdlKCkgaXMgbm8gbG9uZ2VyIHJlcXVpcmVkIHdoZW4gb3BlcmF0aW5nIHdpdGhpbiBh
IHNpbmdsZSBjb21wb3VuZAo+PiBwYWdlIC8gZm9saW8uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERh
dmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgo+PiAtLS0KPj4gICBpbmNsdWRlL2xp
bnV4L21tLmggfCAyMiArKysrKysrKysrKysrKysrKystLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQs
IDE4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L21tLmggYi9pbmNsdWRlL2xpbnV4L21tLmgKPj4gaW5kZXggNzc3MzdjYmYyMjE2
YS4uNDhhOTg1ZTE3ZWY0ZSAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9saW51eC9tbS5oCj4+ICsr
KyBiL2luY2x1ZGUvbGludXgvbW0uaAo+PiBAQCAtMjA1MywxMSArMjA1MywyNSBAQCBzdGF0aWMg
aW5saW5lIGxvbmcgZm9saW9fbnJfcGFnZXMoY29uc3Qgc3RydWN0IGZvbGlvICpmb2xpbykKPj4g
ICAJcmV0dXJuIGZvbGlvX2xhcmdlX25yX3BhZ2VzKGZvbGlvKTsKPj4gICB9Cj4+Cj4+IC0vKiBP
bmx5IGh1Z2V0bGJmcyBjYW4gYWxsb2NhdGUgZm9saW9zIGxhcmdlciB0aGFuIE1BWF9PUkRFUiAq
Lwo+PiAtI2lmZGVmIENPTkZJR19BUkNIX0hBU19HSUdBTlRJQ19QQUdFCj4+IC0jZGVmaW5lIE1B
WF9GT0xJT19PUkRFUgkJUFVEX09SREVSCj4+IC0jZWxzZQo+PiArI2lmICFkZWZpbmVkKENPTkZJ
R19BUkNIX0hBU19HSUdBTlRJQ19QQUdFKQo+PiArLyoKPj4gKyAqIFdlIGRvbid0IGV4cGVjdCBh
bnkgZm9saW9zIHRoYXQgZXhjZWVkIGJ1ZGR5IHNpemVzIChhbmQgY29uc2VxdWVudGx5Cj4+ICsg
KiBtZW1vcnkgc2VjdGlvbnMpLgo+PiArICovCj4+ICAgI2RlZmluZSBNQVhfRk9MSU9fT1JERVIJ
CU1BWF9QQUdFX09SREVSCj4+ICsjZWxpZiBkZWZpbmVkKENPTkZJR19TUEFSU0VNRU0pICYmICFk
ZWZpbmVkKENPTkZJR19TUEFSU0VNRU1fVk1FTU1BUCkKPj4gKy8qCj4+ICsgKiBPbmx5IHBhZ2Vz
IHdpdGhpbiBhIHNpbmdsZSBtZW1vcnkgc2VjdGlvbiBhcmUgZ3VhcmFudGVlZCB0byBiZQo+PiAr
ICogY29udGlndW91cy4gQnkgbGltaXRpbmcgZm9saW9zIHRvIGEgc2luZ2xlIG1lbW9yeSBzZWN0
aW9uLCBhbGwgZm9saW8KPj4gKyAqIHBhZ2VzIGFyZSBndWFyYW50ZWVkIHRvIGJlIGNvbnRpZ3Vv
dXMuCj4+ICsgKi8KPj4gKyNkZWZpbmUgTUFYX0ZPTElPX09SREVSCQlQRk5fU0VDVElPTl9TSElG
VAo+PiArI2Vsc2UKPj4gKy8qCj4+ICsgKiBUaGVyZSBpcyBubyByZWFsIGxpbWl0IG9uIHRoZSBm
b2xpbyBzaXplLiBXZSBsaW1pdCB0aGVtIHRvIHRoZSBtYXhpbXVtIHdlCj4+ICsgKiBjdXJyZW50
bHkgZXhwZWN0Lgo+IAo+IFRoZSBjb21tZW50IGFib3V0IGh1Z2V0bGJmcyBpcyBoZWxwZnVsIGhl
cmUsIHNpbmNlIHRoZSBvdGhlciBmb2xpb3MgYXJlIHN0aWxsCj4gbGltaXRlZCBieSBidWRkeSBh
bGxvY2F0b3LigJlzIE1BWF9PUkRFUi4KClllYWgsIGJ1dCB0aGUgb2xkIGNvbW1lbnQgd2FzIHdy
b25nICh0aGVyZSBpcyBEQVgpLgoKSSBjYW4gYWRkIGhlcmUgImN1cnJlbnRseSBleHBlY3QgKGUu
Zy4sIGh1Z2V0bGZzLCBkYXgpLiIKCi0tIApDaGVlcnMKCkRhdmlkIC8gZGhpbGRlbmIKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
