Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD56C7EE2A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 16:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8YKlAOjE5f23ZdEhnc3z45PRqgRw/ojkvz3RYarXJo=; b=vXPN9seC8ME0ie
	xlmn0JaS72T3yN3e0qpTkDn6xqdOTRWsI/U6U+P3zFMxwmOg2sara/ObotnbFmkMQ0z+OAEYu3GmZ
	JfSf4sMzyDIcD50+F8Pf1HSCNsUP4Hqkm09P10c43lcjxwgn8dlwv8FR5WMNDFdXTNSf8f0jKSDkh
	3KCzmCRUtx7OEW8o3DcoSTSr/52yZ3cEhlXHQTOZ3LtyrQOhRmUe58N/dXifmvf36HdQn0db5uALh
	6b+1rD8Ko4bAhDyOsgkxMcGLpv9xNuy3SJouQvi83jXh6mZjAe4WVU++RtiLl79Yh09LS+EoABhw9
	9mamN4MOA0vf7SPWGBsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUT2i-00000009JTM-247k;
	Wed, 25 Jun 2025 16:32:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPBz-00000008cM7-0yIh
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 12:25:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750854330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HDYmk8nUIEBllr11u7gZCCbXSbBQzHOYE0IyCu7JXpA=;
	b=ByeRLj+cZMuGL11Ux263XpTEqvcmGchdw0SCMrEfspOgk6F6HDKQZTk1bWP5YnEVUI/P5T
	+LhrkQchz3MnGWwFSZJ4rfxeKtvzG19tpONqVFRSZkXZAwCZ8BpO+M4VYRoPgJUOedCSut
	1ggR2yzsHFMjyRQz1jKvKyuT8NyKcsU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-5MoMPn2GNSu_T6GTOPy6-Q-1; Wed, 25 Jun 2025 08:25:28 -0400
X-MC-Unique: 5MoMPn2GNSu_T6GTOPy6-Q-1
X-Mimecast-MFC-AGG-ID: 5MoMPn2GNSu_T6GTOPy6-Q_1750854328
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a6d1394b07so825207f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 05:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750854328; x=1751459128;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HDYmk8nUIEBllr11u7gZCCbXSbBQzHOYE0IyCu7JXpA=;
        b=UDsPBovFaIoZgql3/70ZutgllJEsaooCgwOfpnC8/FVz06HJAhMnBgBfSaln2jlDpZ
         4r54Zuijhj19vZQGlJ8lQIWKXNYf0UA8Mhtdl4a+0UaTteZTML7+6yR/XYxZnpO78P/V
         5VAZvV/xn50tCgmzmTL1cX/jLP7AeFDT8Axd+1M8SkIKgeNSAtMGL89gh4WoTHRRO0n+
         cP86uNvV+kKN+qI7RktCuaQugaoV9lWdeq60jYnAze/8+BnKuDaC2aiwr5TpGvdnC+id
         9YJ/1je77WLC92w8YVQXGDVEJ7RyCqRvR9+HoeHxST+wB+JoYMZYdsq0z2s9Dv6aCIbA
         F2+A==
X-Forwarded-Encrypted: i=1; AJvYcCUzm60mumGXeKP48gERVJKTkDMqvNdyQwZnHZuDpwAbhqK0ftCfJLv0yRERlmgWKPEoPSHHTWuruN/6Yg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnQyVWA9rAl32q6OFKojwgYsuu1WDfsQ6oaJ2922fhwBTA1Wyy
	aat0mGdg9lcXZRR+lTGIBfIttSwAjooIkioj+eYh15QZKxQtoHMxhugwS01FEzvMEt/TbkuQFZl
	Mku2QRvejXmNBIZvEMfoWSr5RMTsOLJ/mj/46fA4v8TVaGtbLoAngZyoHZ6ccS2Ew/vh5LQ==
X-Gm-Gg: ASbGnct1cF5syG0FlsxajTMEEx/DHlY3uoyvYU48rR8QBm56t0hVx1MGc3mzqfyzWh3
	QRQ8jNpk3o6uzVlmGvSOSpJDDJZEMET0ZiChMwQCuuHV0dZrMM8+X09SjYhC8z2czLDBZ/OwZHV
	TExFgmwX5dvv9vUIiDAnlYM6q4gW68zF+uQ5se24Et2pyBwOlgrWzI3sTe2WRwyox/euwkrIfvB
	bHo3fV5kcewDqyKGKWxD+zWqFE5WaS+lk9AyXnZ40AWtp7nHqeWp2xO2owLGtUiYrvYTv1mfv7D
	cRtdlbMiIT+qbsZNKD0Fh5iqUArNdJOO7XCtWdHMlc4NIVPijUl9SZ77jnpDPuMZoTuMG4AklCp
	o+9Ij1k5/sm6zrDcK8IsinAVx5RkI2chwEotRVcoak2x5
X-Received: by 2002:a5d:59c5:0:b0:3a6:ec41:b9df with SMTP id ffacd0b85a97d-3a6ed64c0b6mr2122591f8f.49.1750854327713;
        Wed, 25 Jun 2025 05:25:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzzn1jUnDPQBJAUUttMGYVvx0eT64PRI60IqxVI+7ZhvAx6ZiMuZPeCNf6yzmjyKxVSvIBOw==
X-Received: by 2002:a5d:59c5:0:b0:3a6:ec41:b9df with SMTP id ffacd0b85a97d-3a6ed64c0b6mr2122565f8f.49.1750854327273;
        Wed, 25 Jun 2025 05:25:27 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f294asm4571380f8f.58.2025.06.25.05.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 05:25:26 -0700 (PDT)
Message-ID: <9bb1e917-891d-4e1b-915f-98cdd5fc578b@redhat.com>
Date: Wed, 25 Jun 2025 14:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>, Barry Song <21cnbao@gmail.com>
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
 <42f1d84f-2d17-43b7-8fa2-83322fcca44f@linux.dev>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <42f1d84f-2d17-43b7-8fa2-83322fcca44f@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gcomsIQiVm8HZvmplIdQmIWMOKwRiI-Jftobpv9kAsI_1750854328
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_052531_338736_4790A193 
X-CRM114-Status: GOOD (  15.26  )
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

T24gMjUuMDYuMjUgMTQ6MjAsIExhbmNlIFlhbmcgd3JvdGU6Cj4gCj4gCj4gT24gMjAyNS82LzI1
IDIwOjA5LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4+Cj4+PiBTb21laG93LCBJIGZlZWwg
d2UgY291bGQgY29tYmluZSB5b3VyIGNsZWFudXAgY29kZeKAlHdoaWNoIGhhbmRsZXMgYSBiYXRj
aAo+Pj4gc2l6ZSBvZiAibnIiIGJldHdlZW4gMSBhbmQgbnJfcGFnZXPigJR3aXRoIHRoZQo+Pj4g
ImlmIChucl9wYWdlcyA9PSBmb2xpb19ucl9wYWdlcyhmb2xpbykpIGdvdG8gd2Fsa19kb25lIiBj
aGVjay4KPj4KPj4gWWVhaCwgdGhhdCdzIHdoYXQgSSB3YXMgc3VnZ2VzdGluZy4gSXQgd291bGQg
aGF2ZSB0byBiZSBwYXJ0IG9mIHRoZQo+PiBjbGVhbnVwIEkgdGhpbmsuCj4+Cj4+IEknbSBzdGls
bCB3b25kZXJpbmcgaWYgdGhlcmUgaXMgYSBjYXNlIHdoZXJlCj4+Cj4+IGlmIChucl9wYWdlcyA9
PSBmb2xpb19ucl9wYWdlcyhmb2xpbykpCj4+ICAgwqDCoMKgwqBnb3RvIHdhbGtfZG9uZTsKPj4K
Pj4gd291bGQgYmUgd3Jvbmcgd2hlbiBkZWFsaW5nIHdpdGggc21hbGwgZm9saW9zLgo+Pgo+Pj4g
SW4gcHJhY3RpY2UsIHRoaXMgd291bGQgbGV0IHVzIHNraXAgYWxtb3N0IGFsbCB1bm5lY2Vzc2Fy
eSBjaGVja3MsCj4+PiBleGNlcHQgZm9yIGEgZmV3IHJhcmUgY29ybmVyIGNhc2VzLgo+Pj4KPj4+
IEZvciB0aG9zZSBjb3JuZXIgY2FzZXMgd2hlcmUgIm5yIiB0cnVseSBmYWxscyBiZXR3ZWVuIDEg
YW5kIG5yX3BhZ2VzLAo+Pj4gd2UgY2FuIGp1c3QgbGVhdmUgdGhlbSBhcy1pc+KAlHBlcmZvcm1p
bmcgdGhlIHJlZHVuZGFudCBjaGVjayBpbnNpZGUKPj4+IHBhZ2Vfdm1hX21hcHBlZF93YWxrKCku
Cj4+Cj4+IEkgbWVhbiwgYmF0Y2hpbmcgbWFwY291bnQrcmVmY291bnQgdXBkYXRlcyBldGMuIGlz
IGFsd2F5cyBhIHdpbi4gSWYgd2UKPj4gZW5kIHVwIGRvaW5nIHNvbWUgdW5uZWNlc3NhcnkgcHRl
X25vbmUoKSBjaGVja3MsIHRoYXQgbWlnaHQgYmUKPj4gc3Vib3B0aW1hbCBidXQgbW9zdGx5IG5v
aXNlIGluIGNvbnRyYXN0IHRvIHRoZSBvdGhlciBzdHVmZiB3ZSB3aWxsCj4+IG9wdGltaXplIG91
dCDwn5mCCj4+Cj4+IEFncmVlZCB0aGF0IGlmIHdlIGNhbiBlYXNpbHkgYXZvaWQgdGhlc2UgcHRl
X25vbmUoKSBjaGVja3MsIHdlIHNob3VsZCBkbwo+PiB0aGF0LiBPcHRpbWl6aW5nIHRoYXQgZm9y
ICJucl9wYWdlcyA9PSBmb2xpb19ucl9wYWdlcyhmb2xpbykiIG1ha2VzIHNlbnNlLgo+IAo+IEht
bS4uLiBJIGhhdmUgYSBxdWVzdGlvbiBhYm91dCB0aGUgcmVmZXJlbmNlIGNvdW50aW5nIGhlcmUg
Li4uCj4gCj4gCQlpZiAodm1hLT52bV9mbGFncyAmIFZNX0xPQ0tFRCkKPiAJCQltbG9ja19kcmFp
bl9sb2NhbCgpOwo+IAkJZm9saW9fcHV0KGZvbGlvKTsKPiAJCS8qIFdlIGhhdmUgYWxyZWFkeSBi
YXRjaGVkIHRoZSBlbnRpcmUgZm9saW8gKi8KPiAKPiBEb2VzIGFueW9uZSBlbHNlIHN0aWxsIGhv
bGQgYSByZWZlcmVuY2UgdG8gdGhpcyBmb2xpbyBhZnRlciBmb2xpb19wdXQoKT8KClRoZSBjYWxs
ZXIgb2YgdGhlIHVubWFwIG9wZXJhdGlvbiBzaG91bGQgYmV0dGVyIGhvbGQgYSByZWZlcmVuY2Ug
OikKCkFsc28sIEkgYW0gbm90IHN1cmUgd2h5IHdlIGRvbid0IHBlcmZvcm0gYQoKZm9saW9fcHV0
X3JlZnMoZm9saW8sIG5yX3BhZ2VzKTsKCi4uLiA6KQoKLS0gCkNoZWVycywKCkRhdmlkIC8gZGhp
bGRlbmIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
