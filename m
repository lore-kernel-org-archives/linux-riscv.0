Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC310C48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 09:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ly6Cr6MEgXp2cKVC3SoPeXIWj4pGcVRweK5DdEoheNc=; b=j5OM/rXcZE+wGr
	w/r96bgdUpZK2Ocq0oHjGHuPdJAuSrx5tJIVsSamETm5sq5IlDph8diC0ji3MY/bnbiMtAQRs1nfZ
	tDT9JFY0JEVWiV8wAjIz/rfcVhzlT8krHBbgr10QDAL4tt5ZiLCawfB/flz2UxE4s61dg7HKitchm
	4T2usXA3OpRqqdklQd2mZyPrX8XlhXOojUxsOcLsUj7BWB2eC4bby/b2VKKwKVYK9VVMqAixOX90+
	Nr8lyLVyBg0X1FAj9xYgsIv7qI8eO9aEHSfVknzaqW/fI9isLDHhY+XPukg9ZjPGMNT5yo8IOh3At
	zD5nF0RhHtVnpE+THYhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rciso-00000000FIl-2tsT;
	Wed, 21 Feb 2024 09:27:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcism-00000000FI1-2K53
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 09:27:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708507635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JqDQzqQUNVGgLXFQ47h2MyrP+vNxqZ2Sfg76FoOL2Z4=;
	b=YFslji75Q/eCXAx0UssqFmxyG3kw6PNQutqWTAhzWGqemHH90Qy/ZsSjYVD5bs3xhw4+Ay
	kk5tdK+z+Z4z466S0BvdPSZ6DmHzLl7Ncrp8ZPt2r8+f4VrBaRqgzr3AVZh6CvzqiBo7Wt
	rksXrZuZKnrcjyTluPpYzbJrdvpksZk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-tAWL_0QiO_GSUvfS1p9xwQ-1; Wed, 21 Feb 2024 04:27:13 -0500
X-MC-Unique: tAWL_0QiO_GSUvfS1p9xwQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-410d0660929so31518305e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Feb 2024 01:27:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708507633; x=1709112433;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqDQzqQUNVGgLXFQ47h2MyrP+vNxqZ2Sfg76FoOL2Z4=;
        b=B+HxKl8X9vBPoZDSj9E6gJU9hueJqkqia3yXJnv/Up8hRDNVqZRTLkN2d7Q5a6Ip0P
         /3yPUlQ9XxPq9fXYQhVFDL0TJig05V9FOw1gmrdknaoq35ZtYvom9g8MxEXF4Bml9wkJ
         MXnDiXYyWRbLTvWWI0GzkjHfpYzwDIYixKW9sIW3JTF19t+ipv3zsgtem/qUG7UO2U7r
         XP+SlchZy1xgLFIRKiELrMjiXFLT3ASHVDnRMMXzhw5dnDgM45ZFG5OntwcAA1uN/Vi0
         d8V8WP/3SCgB131EGtMx0dW1dRpS2iw+1GiPgPZyq8DUo0zs+fex4hOjksEJprXMwSxy
         v7uA==
X-Forwarded-Encrypted: i=1; AJvYcCVO59fYqUsFpsxIsGlgqZtWUoN9rfZMgUQrONGIeC/WnTSk7cusEbil/sFGUj7prME3lrQ2dB+WSgUCxnypDNge6HqiwNY8lF+8CK+joSTf
X-Gm-Message-State: AOJu0Yzbw4XJvRW1LzpIXgw86EMQyL8sMbyuFkW3mkvZs6qiHDyqizx/
	cK22QlYGqRd4+kAgpddgZhQVD7mXd0zG+T1nf97moUMPgRVBHuC4TnXuOjqld/F+pqGUxzQHS45
	zqQMJxQ1yUY9aLOMKxBNjt0TL5pvOiL56RbxY9asJ1WMnmZZRiwHMhD9qYE6SwL93wg==
X-Received: by 2002:a05:600c:19c7:b0:412:5296:9737 with SMTP id u7-20020a05600c19c700b0041252969737mr13136557wmq.12.1708507631857;
        Wed, 21 Feb 2024 01:27:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ7FuH/em5oiRt/ZTOR4oMLbXYFTRabnhBDn5rQM4tupeTaNWMPYn2RFDHXi6wWaSGqKntiQ==
X-Received: by 2002:a05:600c:19c7:b0:412:5296:9737 with SMTP id u7-20020a05600c19c700b0041252969737mr13136504wmq.12.1708507631270;
        Wed, 21 Feb 2024 01:27:11 -0800 (PST)
Received: from [10.32.64.237] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id jj2-20020a05600c6a0200b004126732390asm1837805wmb.37.2024.02.21.01.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 01:27:10 -0800 (PST)
Message-ID: <cf5409c3-254a-459b-8969-429db2ec6439@redhat.com>
Date: Wed, 21 Feb 2024 10:27:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] mm: pgalloc: support address-conditional pmd
 allocation
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Maxwell Bland <mbland@motorola.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "andreyknvl@gmail.com" <andreyknvl@gmail.com>,
 "andrii@kernel.org" <andrii@kernel.org>,
 "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "ardb@kernel.org" <ardb@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "ast@kernel.org" <ast@kernel.org>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "brauner@kernel.org" <brauner@kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "cl@linux.com" <cl@linux.com>, "daniel@iogearbox.net"
 <daniel@iogearbox.net>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "dennis@kernel.org" <dennis@kernel.org>,
 "dvyukov@google.com" <dvyukov@google.com>,
 "glider@google.com" <glider@google.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "guoren@kernel.org" <guoren@kernel.org>,
 "haoluo@google.com" <haoluo@google.com>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "john.fastabend@gmail.com" <john.fastabend@gmail.com>,
 "jolsa@kernel.org" <jolsa@kernel.org>,
 "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
 "kpsingh@kernel.org" <kpsingh@kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "lstoakes@gmail.com" <lstoakes@gmail.com>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "martin.lau@linux.dev" <martin.lau@linux.dev>,
 "meted@linux.ibm.com" <meted@linux.ibm.com>,
 "michael.christie@oracle.com" <michael.christie@oracle.com>,
 "mjguzik@gmail.com" <mjguzik@gmail.com>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "mst@redhat.com"
 <mst@redhat.com>, "muchun.song@linux.dev" <muchun.song@linux.dev>,
 "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>,
 "npiggin@gmail.com" <npiggin@gmail.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "quic_nprakash@quicinc.com" <quic_nprakash@quicinc.com>,
 "quic_pkondeti@quicinc.com" <quic_pkondeti@quicinc.com>,
 "rick.p.edgecombe@intel.com" <rick.p.edgecombe@intel.com>,
 "ryabinin.a.a@gmail.com" <ryabinin.a.a@gmail.com>,
 "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
 "samitolvanen@google.com" <samitolvanen@google.com>,
 "sdf@google.com" <sdf@google.com>, "song@kernel.org" <song@kernel.org>,
 "surenb@google.com" <surenb@google.com>,
 "svens@linux.ibm.com" <svens@linux.ibm.com>, "tj@kernel.org"
 <tj@kernel.org>, "urezki@gmail.com" <urezki@gmail.com>,
 "vincenzo.frascino@arm.com" <vincenzo.frascino@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "wuqiang.matt@bytedance.com" <wuqiang.matt@bytedance.com>,
 "yonghong.song@linux.dev" <yonghong.song@linux.dev>,
 "zlim.lnx@gmail.com" <zlim.lnx@gmail.com>,
 "awheeler@motorola.com" <awheeler@motorola.com>
References: <20240220203256.31153-1-mbland@motorola.com>
 <20240220203256.31153-3-mbland@motorola.com>
 <838a05f0-568d-481d-b826-d2bb61908ace@csgroup.eu>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <838a05f0-568d-481d-b826-d2bb61908ace@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_012716_703522_74C998A1 
X-CRM114-Status: UNSURE (   8.91  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjEuMDIuMjQgMDg6MTMsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4gCj4gCj4gTGUgMjAv
MDIvMjAyNCDDoCAyMTozMiwgTWF4d2VsbCBCbGFuZCBhIMOpY3JpdMKgOgo+PiBbVm91cyBuZSBy
ZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSBtYmxhbmRAbW90b3JvbGEuY29tLiBE
w6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDDoCBodHRwczovL2FrYS5tcy9M
ZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQo+Pgo+PiBXaGlsZSBvdGhlciBkZXNjcmlw
dG9ycyAoZS5nLiBwdWQpIGFsbG93IGFsbG9jYXRpb25zIGNvbmRpdGlvbmFsIG9uCj4+IHdoaWNo
IHZpcnR1YWwgYWRkcmVzcyBpcyBhbGxvY2F0ZWQsIHBtZCBkZXNjcmlwdG9yIGFsbG9jYXRpb25z
IGRvIG5vdC4KPj4gSG93ZXZlciwgYWRkaW5nIHN1cHBvcnQgZm9yIHRoaXMgaXMgc3RyYWlnaHRm
b3J3YXJkIGFuZCBpcyBiZW5lZmljaWFsIHRvCj4+IGZ1dHVyZSBrZXJuZWwgZGV2ZWxvcG1lbnQg
dGFyZ2V0aW5nIHRoZSBQTUQgbWVtb3J5IGdyYW51bGFyaXR5Lgo+Pgo+PiBBcyBtYW55IGFyY2hp
dGVjdHVyZXMgYWxyZWFkeSBpbXBsZW1lbnQgcG1kX3BvcHVsYXRlX2tlcm5lbCBpbiBhbgo+PiBh
ZGRyZXNzLWdlbmVyaWMgbWFubmVyLCBpdCBpcyBuZWNlc3NhcnkgdG8gcm9sbCBvdXQgc3VwcG9y
dAo+PiBpbmNyZW1lbnRhbGx5LiBGb3IgdGhpcyBwdXJwb3NlIGEgcHJlcHJvY2Vzc29yIGZsYWcs
Cj4gCj4gSXMgaXQgcmVhbGx5IHdvcnRoIGl0ID8gSXQgaXMgb25seSA0OCBjYWxsIHNpdGVzIHRo
YXQgbmVlZCB0byBiZQo+IHVwZGF0ZWQuIEl0IHdvdWxkIGF2b2lkIHRoYXQgcHJvY2Vzc29yIGZs
YWcgYW5kIGF2b2lkIGludHJvZHVjaW5nIHRoYXQKPiBwbWRfcG9wdWxhdGVfa2VybmVsX2F0KCkg
aW4ga2VybmVsIGNvcmUuCgorMSwgbGV0J3MgYXZvaWQgdGhhdCBpZiBwb3NzaWJsZS4KCi0tIApD
aGVlcnMsCgpEYXZpZCAvIGRoaWxkZW5iCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
