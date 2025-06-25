Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C408BC7EE2A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 17:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Ns2vJtpsqQNsWbrTI81hJ0Yn7E4E1i9TigmYPx6mFw=; b=jmWUE9eBmtMx7b
	oxZI9OejBxQJ/MochJCS5kWnJ2PC61aYY+bxUBOLjf4KBovyi4sS8w7AQBRJaBgM7rvLXHPCx4o8Q
	lseI+N2/AOQeV09TXXtqQKmDxnSUiHvZuQPsfKGQpn6fkZYgz/GFmaKGymBmKYgyx7m1tqqNrGoUZ
	G1IvAu5yO/95MCqGcHsiV9hY3ACkBiiROFWrIBDmCVG76zFAC9BnVqOy6K29leq8s0nuB/FmnRQOq
	qwosa48uCo6HRXS9na87lb1kYHuo3nExNZtGBtu76LEjuHjTfhlcpl8aqZK9Tp83gAQB5ClVc4lGA
	Y69YCPVmC6MM1jeTXqnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU5C-00000009V0x-1SFI;
	Wed, 25 Jun 2025 17:38:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOxB-00000008aQY-21hA
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 12:10:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750853412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hXz4L9AjmUQwaNKAx39lxTXVJAFR2RsUPQZWFFE3k78=;
	b=Zw1utY++ENw26iG8DsUxwobX5AvB7u+CIPHAahJcgsczrBjWuWZi/GoMMZnrnewRMIiKMP
	P/a/uc83qWsofGk1pYx88eY2MAZkcjQfbmJdNd3Ubos11KKih+R/Sc+K7spMstLXKB8HtK
	citgWeHFeW6Lhg3lOJ1q1kErw2KBxhU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-S5JcgM9zPtmTB_XXoeeP8w-1; Wed, 25 Jun 2025 08:09:10 -0400
X-MC-Unique: S5JcgM9zPtmTB_XXoeeP8w-1
X-Mimecast-MFC-AGG-ID: S5JcgM9zPtmTB_XXoeeP8w_1750853349
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a6da94a532so2482692f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 05:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750853349; x=1751458149;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hXz4L9AjmUQwaNKAx39lxTXVJAFR2RsUPQZWFFE3k78=;
        b=UOz0Rg9nxpPL1epCihqILpNVgQntwzzDbGPOjP0FHLtVR6i1c5OkcTpG8K5+CDyc8H
         SZQHW4P4nDnViyuGmu121+eK8Q2gahjr+1VQINMsCwtATSX5oNJM0YsS82KyNOBmIdo5
         j3dq/VEXcyBRqoX+bwYtOL9XSmbYX/KZr5W5Dm1itxu+/taYCjeLRaUVB6Rm8w7ZM9vC
         qWg7lUeljPYyXwbCzBTQRADJZd8aP4PO+zBmxSN6Im9JSnQfaWL5zQfFIdUswakCveTj
         ZvKfgy6n6KLh+t9gLjkJ/ijD1gYus48rpbNnwg/qwaDVU7AGxLym2bCaK3nsafFDVbeU
         WgLg==
X-Forwarded-Encrypted: i=1; AJvYcCXCJ/jtZySFWj7evsJNyrSHY/lxM56T66V7/0mWJ7s2vxj/K1A6ASmp9d70J+vOpnqEO0m6+ytqXkKRJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYMrE+4LrcKcBOC4v1eREnrAf8Ted7zdsENeaCVU9hSH8DPTQK
	cyezjFYH+CBCswgTjJT6vxbGim8PKPJ9Ja09oB1mCHe56kkBxSM8y5WjkyKA5suYL4Hf29kAZhR
	fO3Ky5m5bks8op1rSDuSmW9VVOOEEiywn5L6+yMVioKhy8GAxppRielPwYgZHjSDgT7Xn0g==
X-Gm-Gg: ASbGncs+2sOatWzJgatG9nMOsr56f28vSN3qIdp3lLyFZ8GVo/nDdRHtl/u7L30yo5Z
	g4Tm7rhKb+T5q4igOLssdryOxYmZTsa7lYO6vf47PZj8bXbN9Urx9rRtCkbbfkkUhupfpSoi5O+
	1bPod0K8uQArk+qCejYbNq3IjRtuHN1upZp6eBozWg3MdRVriRUVif6+HuO8AZ1XKcNWSdLnOVx
	dnclld3cN08ZqYhUahoQxeSI0wEweCf2dfpOQyCUL4UodVQ1QopuUZxr8hlfVNQ17BzmkqnlzmE
	nAdDGd1A8cFOQw/YKdK2efjlb1ZSuSo4aASDk3A7yYFX2P5jhrFdUtH7LVTJgHbf56Y6l6CGybG
	3MCEGD5yIWDXF9pGH8CZyq/20DWjs9EdahHf6KmEhBXb7
X-Received: by 2002:a05:6000:4815:b0:3a4:dc42:a0ac with SMTP id ffacd0b85a97d-3a6ed64e5ddmr2082395f8f.49.1750853348868;
        Wed, 25 Jun 2025 05:09:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9Lr46v9Q28gB+WmOXi6ZuJCE56NnF+cZrNGYOXSV4lsNJpeXOrIPDeZxjqvKUmorwq1CGfA==
X-Received: by 2002:a05:6000:4815:b0:3a4:dc42:a0ac with SMTP id ffacd0b85a97d-3a6ed64e5ddmr2082376f8f.49.1750853348346;
        Wed, 25 Jun 2025 05:09:08 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c57d7sm18992765e9.40.2025.06.25.05.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 05:09:06 -0700 (PDT)
Message-ID: <5db6fb4c-079d-4237-80b3-637565457f39@redhat.com>
Date: Wed, 25 Jun 2025 14:09:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Barry Song <21cnbao@gmail.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com,
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAGsJ_4yTH5ngM++e=c+P7g0fXs-QQsOk2oxd1RWa3Qww97Knrw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Pl0tyJMhivjRhAEJEkDl2rWrAhq35C81jpfmloZGssk_1750853349
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_051013_605572_A6F586EE 
X-CRM114-Status: GOOD (  27.00  )
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

T24gMjUuMDYuMjUgMTM6NDIsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gT24gV2VkLCBKdW4gMjUsIDIw
MjUgYXQgMTE6MjfigK9QTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4gd3Jv
dGU6Cj4+Cj4+IE9uIDI1LjA2LjI1IDEzOjE1LCBCYXJyeSBTb25nIHdyb3RlOgo+Pj4gT24gV2Vk
LCBKdW4gMjUsIDIwMjUgYXQgMTE6MDHigK9QTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4+Pj4KPj4+PiBPbiAyNS4wNi4yNSAxMjo1NywgQmFycnkgU29uZyB3
cm90ZToKPj4+Pj4+Pgo+Pj4+Pj4+IE5vdGUgdGhhdCBJIGRvbid0IHF1aXRlIHVuZGVyc3RhbmQg
d2h5IHdlIGhhdmUgdG8gYmF0Y2ggdGhlIHdob2xlIHRoaW5nCj4+Pj4+Pj4gb3IgZmFsbGJhY2sg
dG8KPj4+Pj4+PiBpbmRpdmlkdWFsIHBhZ2VzLiBXaHkgY2FuJ3Qgd2UgcGVyZm9ybSBvdGhlciBi
YXRjaGVzIHRoYXQgc3BhbiBvbmx5IHNvbWUKPj4+Pj4+PiBQVEVzPyBXaGF0J3Mgc3BlY2lhbAo+
Pj4+Pj4+IGFib3V0IDEgUFRFIHZzLiAyIFBURXMgdnMuIGFsbCBQVEVzPwo+Pj4+Pj4KPj4+Pj4+
IFRoYXQncyBhIGdvb2QgcG9pbnQgYWJvdXQgdGhlICJhbGwtb3Itbm90aGluZyIgYmF0Y2hpbmcg
bG9naWMgOykKPj4+Pj4+Cj4+Pj4+PiBJdCBzZWVtcyB0aGUgImFsbC1vci1ub3RoaW5nIiBhcHBy
b2FjaCBpcyBzcGVjaWZpYyB0byB0aGUgbGF6eWZyZWUgdXNlCj4+Pj4+PiBjYXNlLCB3aGljaCBu
ZWVkcyB0byB1bm1hcCB0aGUgZW50aXJlIGZvbGlvIGZvciByZWNsYW1hdGlvbi4gSWYgdGhhdCdz
Cj4+Pj4+PiBub3QgcG9zc2libGUsIGl0IGZhbGxzIGJhY2sgdG8gdGhlIHNpbmdsZS1wYWdlIHNs
b3cgcGF0aC4KPj4+Pj4KPj4+Pj4gT3RoZXIgY2FzZXMgYWR2YW5jZSB0aGUgUFRFIHRoZW1zZWx2
ZXMsIHdoaWxlIHRyeV90b191bm1hcF9vbmUoKSByZWxpZXMKPj4+Pj4gb24gcGFnZV92bWFfbWFw
cGVkX3dhbGsoKSB0byBhZHZhbmNlIHRoZSBQVEUuIFVubGVzcyB3ZSB3YW50IHRvIG1hbnVhbGx5
Cj4+Pj4+IG1vZGlmeSBwdm13LnB0ZSBhbmQgcHZtdy5hZGRyZXNzIG91dHNpZGUgb2YgcGFnZV92
bWFfbWFwcGVkX3dhbGsoKSwgd2hpY2gKPj4+Pj4gdG8gbWUgc2VlbXMgbGlrZSBhIHZpb2xhdGlv
biBvZiBsYXllcnMuIDotKQo+Pj4+Cj4+Pj4gUGxlYXNlIGV4cGxhaW4gdG8gbWUgd2h5IHRoZSBm
b2xsb3dpbmcgaXMgbm90IGNsZWFyZXIgYW5kIGJldHRlcjoKPj4+Cj4+PiBUaGlzIHBhcnQgaXMg
bXVjaCBjbGVhcmVyLCBidXQgdGhhdCBkb2VzbuKAmXQgbmVjZXNzYXJpbHkgaW1wcm92ZSB0aGUg
b3ZlcmFsbAo+Pj4gcGljdHVyZS4gVGhlIG1haW4gY2hhbGxlbmdlIGlzIGhvdyB0byBleGl0IHRo
ZSBpdGVyYXRpb24gb2YKPj4+IHdoaWxlIChwYWdlX3ZtYV9tYXBwZWRfd2FsaygmcHZtdykpLgo+
Pgo+PiBPa2F5LCBJIGdldCB3aGF0IHlvdSBtZWFuIG5vdy4KPj4KPj4+Cj4+PiBSaWdodCBub3cs
IHdlIGhhdmUgaXQgbGFpZCBvdXQgcXVpdGUgc3RyYWlnaHRmb3J3YXJkbHk6Cj4+PiAgICAgICAg
ICAgICAgICAgICAvKiBXZSBoYXZlIGFscmVhZHkgYmF0Y2hlZCB0aGUgZW50aXJlIGZvbGlvICov
Cj4+PiAgICAgICAgICAgICAgICAgICBpZiAobnJfcGFnZXMgPiAxKQo+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICBnb3RvIHdhbGtfZG9uZTsKPj4KPj4KPj4gR2l2ZW4gdGhhdCB0aGUgY29t
bWVudCBpcyBjb21wbGV0ZWx5IGNvbmZ1c2luZyB3aGVucyBzZWVpbmcgdGhlIGNoZWNrIC4uLiA6
KQo+Pgo+PiAvKgo+PiAgICAqIElmIHdlIGFyZSBzdXJlIHRoYXQgd2UgYmF0Y2hlZCB0aGUgZW50
aXJlIGZvbGlvIGFuZCBjbGVhcmVkIGFsbCBQVEVzLAo+PiAgICAqIHdlIGNhbiBqdXN0IG9wdGlt
aXplIGFuZCBzdG9wIHJpZ2h0IGhlcmUuCj4+ICAgICovCj4+IGlmIChucl9wYWdlcyA9PSBmb2xp
b19ucl9wYWdlcyhmb2xpbykpCj4+ICAgICAgICAgIGdvdG8gd2Fsa19kb25lOwo+Pgo+PiB3b3Vs
ZCBtYWtlIHRoZSBjb21tZW50IG1hdGNoLgo+IAo+IFllcywgdGhhdCBjbGFyaWZpZXMgaXQuCj4g
Cj4+Cj4+Pgo+Pj4gd2l0aCBhbnkgbnIgYmV0d2VlbiAxIGFuZCBmb2xpb19ucl9wYWdlcygpLCB3
ZSBoYXZlIHRvIGNvbnNpZGVyIHR3byBpc3N1ZXM6Cj4+PiAxLiBIb3cgdG8gc2tpcCBQVEUgY2hl
Y2tzIGluc2lkZSBwYWdlX3ZtYV9tYXBwZWRfd2FsayBmb3IgZW50cmllcyB0aGF0Cj4+PiB3ZXJl
IGFscmVhZHkgaGFuZGxlZCBpbiB0aGUgcHJldmlvdXMgYmF0Y2g7Cj4+Cj4+IFRoZXkgYXJlIGNs
ZWFyZWQgaWYgd2UgcmVhY2ggdGhhdCBwb2ludC4gU28gdGhlIHB0ZV9ub25lKCkgY2hlY2tzIHdp
bGwKPj4gc2ltcGx5IHNraXAgdGhlbT8KPj4KPj4+IDIuIEhvdyB0byBicmVhayB0aGUgaXRlcmF0
aW9uIHdoZW4gdGhpcyBiYXRjaCBoYXMgYXJyaXZlZCBhdCB0aGUgZW5kLgo+Pgo+PiBwYWdlX3Zt
YV9tYXBwZWRfd2FsaygpIHNob3VsZCBiZSBkb2luZyB0aGF0Pwo+IAo+IEl0IHNlZW1zIHlvdSBt
aWdodCBoYXZlIG1pc3NlZCB0aGUgcGFydCBpbiBteSByZXBseSB0aGF0IHNheXM6Cj4gIk9mIGNv
dXJzZSwgd2UgY291bGQgYXZvaWQgYm90aCwgYnV0IHRoYXQgd291bGQgbWVhbiBwZXJmb3JtaW5n
IHVubmVjZXNzYXJ5Cj4gY2hlY2tzIGluc2lkZSBwYWdlX3ZtYV9tYXBwZWRfd2FsaygpLiIKID4g
PiBUaGF04oCZcyB0cnVlIGZvciBib3RoLiBCdXQgSeKAmW0gd29uZGVyaW5nIHdoeSB3ZeKAmXJl
IHN0aWxsIGRvaW5nIHRoZSAKY2hlY2ssCj4gZXZlbiB3aGVuIHdl4oCZcmUgZmFpcmx5IHN1cmUg
dGhleeKAmXZlIGFscmVhZHkgYmVlbiBjbGVhcmVkIG9yIHdl4oCZdmUgcmVhY2hlZAo+IHRoZSBl
bmQgOi0pCgo6KQoKPiAKPiBTb21laG93LCBJIGZlZWwgd2UgY291bGQgY29tYmluZSB5b3VyIGNs
ZWFudXAgY29kZeKAlHdoaWNoIGhhbmRsZXMgYSBiYXRjaAo+IHNpemUgb2YgIm5yIiBiZXR3ZWVu
IDEgYW5kIG5yX3BhZ2Vz4oCUd2l0aCB0aGUKPiAiaWYgKG5yX3BhZ2VzID09IGZvbGlvX25yX3Bh
Z2VzKGZvbGlvKSkgZ290byB3YWxrX2RvbmUiIGNoZWNrLgoKWWVhaCwgdGhhdCdzIHdoYXQgSSB3
YXMgc3VnZ2VzdGluZy4gSXQgd291bGQgaGF2ZSB0byBiZSBwYXJ0IG9mIHRoZSAKY2xlYW51cCBJ
IHRoaW5rLgoKSSdtIHN0aWxsIHdvbmRlcmluZyBpZiB0aGVyZSBpcyBhIGNhc2Ugd2hlcmUKCmlm
IChucl9wYWdlcyA9PSBmb2xpb19ucl9wYWdlcyhmb2xpbykpCglnb3RvIHdhbGtfZG9uZTsKCndv
dWxkIGJlIHdyb25nIHdoZW4gZGVhbGluZyB3aXRoIHNtYWxsIGZvbGlvcy4KCj4gSW4gcHJhY3Rp
Y2UsIHRoaXMgd291bGQgbGV0IHVzIHNraXAgYWxtb3N0IGFsbCB1bm5lY2Vzc2FyeSBjaGVja3Ms
Cj4gZXhjZXB0IGZvciBhIGZldyByYXJlIGNvcm5lciBjYXNlcy4KPiAKPiBGb3IgdGhvc2UgY29y
bmVyIGNhc2VzIHdoZXJlICJuciIgdHJ1bHkgZmFsbHMgYmV0d2VlbiAxIGFuZCBucl9wYWdlcywK
PiB3ZSBjYW4ganVzdCBsZWF2ZSB0aGVtIGFzLWlz4oCUcGVyZm9ybWluZyB0aGUgcmVkdW5kYW50
IGNoZWNrIGluc2lkZQo+IHBhZ2Vfdm1hX21hcHBlZF93YWxrKCkuCgpJIG1lYW4sIGJhdGNoaW5n
IG1hcGNvdW50K3JlZmNvdW50IHVwZGF0ZXMgZXRjLiBpcyBhbHdheXMgYSB3aW4uIElmIHdlIApl
bmQgdXAgZG9pbmcgc29tZSB1bm5lY2Vzc2FyeSBwdGVfbm9uZSgpIGNoZWNrcywgdGhhdCBtaWdo
dCBiZSAKc3Vib3B0aW1hbCBidXQgbW9zdGx5IG5vaXNlIGluIGNvbnRyYXN0IHRvIHRoZSBvdGhl
ciBzdHVmZiB3ZSB3aWxsIApvcHRpbWl6ZSBvdXQgOikKCkFncmVlZCB0aGF0IGlmIHdlIGNhbiBl
YXNpbHkgYXZvaWQgdGhlc2UgcHRlX25vbmUoKSBjaGVja3MsIHdlIHNob3VsZCBkbyAKdGhhdC4g
T3B0aW1pemluZyB0aGF0IGZvciAibnJfcGFnZXMgPT0gZm9saW9fbnJfcGFnZXMoZm9saW8pIiBt
YWtlcyBzZW5zZS4KCi0tIApDaGVlcnMsCgpEYXZpZCAvIGRoaWxkZW5iCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
