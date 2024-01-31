Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB744C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 13:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H0OhiF2VkCA8UZyXCTqu9w0mIERM/kxIVn4xSrG7/7Q=; b=R4jIB8R+8Kts3U
	TuReeZbdwWzfSd6Pd59o/azF9fM4iLzYBLOljCCqG4NYFN1TqrX59bQT41GIFdr7hIDbQg2COVEQO
	3lEbJXF13uSTWc3kIiWo+l1F7BiOkPBj45od6VZ3pYLH3sw13wi4LLkxVfD3oYedsNMRW4NgMe1/A
	blFfPpFwsz2u0MEJDsJLW+sDtPuhu9UolDd7o5BwiAhNZIGqU6NOmIw9eGEWV+0AIhCcj2Rdryreg
	aYMnRltOUSdZ8r2dLfpI7bzUHoiFQaOe+lERa+MquY6BG1HVsehSI+Cf5bnWtvEPMCqoUuLfR88QY
	HdoNlkVyufAquFSy85rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAnF-00000003eZ0-0Jet;
	Wed, 31 Jan 2024 13:38:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAnC-00000003eWp-45yo
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 13:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706708295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vNnp/Z0S7DqUPASGq4M26R4kayT9Cyd518Jol1/4wN4=;
	b=CwqOugy7qfkANbysCSkkl08ZnMAtotw1GM6hlNIs84gu7dg1lwxkQlo5S46KH8fBpdLukv
	QzUry7sJ9tZn+o5i4gLwMtZmBhv1GJ4UkMf8aB4ZU9SiW8q4io96bZXNP1gq6BY7P4QAWR
	HlXkS+nEMlG43y6CVlVXkOAKwqJKIcY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-A-RxP9IvPIqb1zPurLg8vQ-1; Wed, 31 Jan 2024 08:38:12 -0500
X-MC-Unique: A-RxP9IvPIqb1zPurLg8vQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40fb64f802dso1590485e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 05:38:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706708291; x=1707313091;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNnp/Z0S7DqUPASGq4M26R4kayT9Cyd518Jol1/4wN4=;
        b=IDX0C6jq92wO9iInbKo5GrjS24mXBVIBuu6aHR2UrXoq9oz4/BGvO+f3etR7xj+Ebv
         FpOzBywavp/gHPQa1wexdGqb+NglNCIWRri3nQRn3RNKISPd5Ei8MOJ+f5WWvYJFMm/9
         Hq+/6jSxy3l6AZdI+XjvGJyRxZsTKFe4CtcHbva5OTghagshcL8Aaq3QuTmW10k1Grs2
         KfNWbwFnq7qZ9eZZQXcDIAAO8tLhzjBnNAjXcnu3YO1p8HJ9tovyN9NCHecOBh5K8Az9
         WqUk4h2xwbK9zE2KMby1Yj0aHUNjO7r3ONvm3paT0N4Vzt+/YnYanFRyJOXvDM8bCrco
         ehag==
X-Gm-Message-State: AOJu0YzX/0+sFaOLaEOLEt9YXSCz6i131XwvPHbo/a+NzxUIpxfILWj7
	0RpO+zOCVnurDar6r9PM9mRCHPcoBVvENAg1GlMYQoQ55e0BPgYQn7h4T6Q5SktQ5iepEQp6uif
	QXYiXhtZnwZr2EDlNo/P6tOtiJnJOtZYoBOUFhPnSpnSfraZUwzRNtulKQy38nq01bg==
X-Received: by 2002:a05:600c:6551:b0:40e:b93e:4a0f with SMTP id dn17-20020a05600c655100b0040eb93e4a0fmr1406565wmb.19.1706708291162;
        Wed, 31 Jan 2024 05:38:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoAHxE3D/zHX4Njds0uFxoI5Tm9039gsOQ1jUjIaqjF15lPY9fb5u6xV8tefJ0lfUgXMicvQ==
X-Received: by 2002:a05:600c:6551:b0:40e:b93e:4a0f with SMTP id dn17-20020a05600c655100b0040eb93e4a0fmr1406543wmb.19.1706708290739;
        Wed, 31 Jan 2024 05:38:10 -0800 (PST)
Received: from [10.32.64.237] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600016c900b0033aedb71269sm8183465wrf.88.2024.01.31.05.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 05:38:10 -0800 (PST)
Message-ID: <c63870b0-690a-4051-b4f5-296cf3b73be2@redhat.com>
Date: Wed, 31 Jan 2024 14:38:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] mm/memory: optimize fork() with PTE-mapped THP
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
References: <20240129124649.189745-1-david@redhat.com>
 <a335a9d2-9b8f-4eb8-ba22-23a223b59b06@arm.com>
 <a1a0e9b3-dae2-418f-bd63-50e65f471728@redhat.com>
 <57eb82c7-4816-42a2-b5ab-cc221e289b21@arm.com>
 <e6eaba5b-f290-4d1f-990b-a47d89f56ee4@redhat.com>
 <714d0930-2202-48b6-9728-d248f820325e@arm.com>
 <dcaa20c4-bd1f-4f15-bb0a-3a790808937d@arm.com>
 <30718fc8-15cf-41e4-922c-5cdbf00a0840@redhat.com>
 <de975655-8f8f-40dc-b281-75c40dd1e2c1@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <de975655-8f8f-40dc-b281-75c40dd1e2c1@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_053819_116354_43E79614 
X-CRM114-Status: GOOD (  32.63  )
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

Pj4+IE5vcGU6IGxvb2tzIHRoZSBzYW1lLiBJJ3ZlIHRha2VuIG15IHRlc3QgaGFybmVzcyBvdXQg
b2YgdGhlIHBpY3R1cmUgYW5kIGRvbmUKPj4+IGV2ZXJ5dGhpbmcgbWFudWFsbHkgZnJvbSB0aGUg
Z3JvdW5kIHVwLCB3aXRoIHRoZSBvbGQgdGVzdHMgYW5kIHRoZSBuZXcuIEhlYWRsaW5lCj4+PiBp
cyB0aGF0IEkgc2VlIHNpbWlsYXIgbnVtYmVycyBmcm9tIGJvdGguCj4+Cj4+IEkgdG9vayBtZSBh
IHdoaWxlIHRvIGdldCByZWFsbHkgcmVwcm9kdWNpYmxlIG51bWJlcnMgb24gSW50ZWwuIE1vc3Qg
aW1wb3J0YW50bHk6Cj4+ICogU2V0IGEgZml4ZWQgQ1BVIGZyZXF1ZW5jeSwgZGlzYWJsaW5nIGFu
eSBib29zdCBhbmQgYXZvaWRpbmcgYW55Cj4+ICDCoCB0aGVybWFsIHRocm90dGxpbmcuCj4+ICog
UGluIHRoZSB0ZXN0IHRvIENQVXMgYW5kIHNldCBhIG5pY2UgbGV2ZWwuCj4gCj4gSSdtIGFscmVh
ZHkgcGlubmluZyB0aGUgdGVzdCB0byBjcHUgMC4gQnV0IGZvciBNMiwgYXQgbGVhc3QsIEknbSBy
dW5uaW5nIGluIGEgVk0KPiBvbiB0b3Agb2YgbWFjb3MsIGFuZCBJIGRvbid0IGhhdmUgYSBtZWNo
YW5pc20gdG8gcGluIHRoZSBRRU1VIHRocmVhZHMgdG8gdGhlCj4gcGh5c2ljYWwgQ1BVcy4gQW55
d2F5LCBJIGRvbid0IHRoaW5rIHRoZXNlIGFyZSBwcm9ibGVtcyBiZWNhdXNlIGZvciBhIGdpdmVu
Cj4ga2VybmVsIGJ1aWxkIEkgY2FuIGFjY3VyYXRlbHkgcmVwcm8gbnVtYmVycy4KCk9oLCB5b3Ug
ZG8gaGF2ZSBhIGxheWVyIG9mIHZpcnR1YWxpemF0aW9uIGluIHRoZXJlLiBJICpzdXNwZWN0KiB0
aGF0IAptaWdodCBhbXBsaWZ5IHNvbWUgb2RkIHRoaW5ncyByZWdhcmRpbmcgY29kZSBsYXlvdXQs
IGNhY2hpbmcgZWZmZWN0cywgZXRjLgoKSSBndWVzcyBlc3BlY2lhbGx5IHRoZSBmb3JrKCkgYmVu
Y2htYXJrIGlzIHRvbyBzZW5zaWJsZSAoZmFzdCkgZm9yIAp0aGluZ3MgbGlrZSB0aGF0LCBzbyBJ
IHdvdWxkIGp1c3QgZm9jdXMgb24gYmFyZSBtZXRhbCByZXN1bHRzIHdoZXJlIHlvdSAKY2FuIGNv
bnRyb2wgdGhlIGVudmlyb25tZW50IGNvbXBsZXRlbHkuCgpOb3RlIHRoYXQgcmVnYXJkaW5nIE5V
TUEgZWZmZWN0cywgSSBtZWFuIHdoZW4gc29tZSBtZW1vcnkgYWNjZXNzIHdpdGhpbiAKdGhlIHNh
bWUgc29ja2V0IGlzIGZhc3Rlci9zbG93ZXIgZXZlbiB3aXRoIG9ubHkgYSBzaW5nbGUgbm9kZS4g
T24gQU1EIApFUFlDIHRoYXQncyBwb3NzaWJsZSwgZGVwZW5kaW5nIG9uIHdoaWNoIGNvcmUgeW91
IGFyZSBydW5uaW5nIGFuZCBvbiAKd2hpY2ggbWVtb3J5IGNvbnRyb2xsZXIgdGhlIG1lbW9yeSB5
b3Ugd2FudCB0byBhY2Nlc3MgaXMgbG9jYXRlZC4gSWYgCmJvdGggYXJlIGluIGRpZmZlcmVudCBx
dWFkcmFudHMgSUlVQywgdGhlIGFjY2VzcyBsYXRlbmN5IHdpbGwgYmUgZGlmZmVyZW50LgoKPj4g
QnV0IHllczogSSB3YXMgb2JzZXJ2aW5nIHNvbWV0aGluZyBzaW1pbGFyIG9uIEFNRCBFUFlDLCB3
aGVyZSB5b3UgZ2V0Cj4+IGNvbnNlY3V0aXZlIHBhZ2VzIGZyb20gdGhlIGJ1ZGR5LCBidXQgb25j
ZSB5b3UgYWxsb2NhdGUgZnJvbSB0aGUgUENQIGl0IG1pZ2h0IG5vCj4+IGxvbmdlciBiZSBjb25z
ZWN1dGl2ZS4KPj4KPj4+ICDCoCAtIHRlc3QgaXMgNS0xMCUgc2xvd2VyIHdoZW4gb3V0cHV0IGlz
IHByaW50ZWQgdG8gdGVybWluYWwgdnMgd2hlbiByZWRpcmVjdGVkIHRvCj4+PiAgwqDCoMKgIGZp
bGUuIEkndmUgYWx3YXlzIGVmZmVjdGl2ZWx5IGJlZW4gcmVkaXJlY3RpbmcuIE5vdCBzdXJlIGlm
IHRoaXMgb3ZlcmhlYWQKPj4+ICDCoMKgwqAgY291bGQgc3RhcnQgdG8gZG9taW5hdGUgdGhlIHJl
Z3Jlc3Npb24gYW5kIHRoYXQncyB3aHkgeW91IGRvbid0IHNlZSBpdD8KPj4KPj4gVGhhdCdzIHdl
aXJkLCBiZWNhdXNlIHdlIGRvbid0IHByaW50IHdoaWxlIG1lYXN1cmluZz8gQW55aG93LCA1LzEw
JSB2YXJpYW5jZSBvbgo+PiBzb21lIHN5c3RlbSBpcyBub3QgdGhlIGVuZCBvZiB0aGUgd29ybGQu
Cj4gCj4gSSBpbWFnaW5lIGl0cyBjYWNoZSBlZmZlY3RzPyBNb3JlIHdvcmsgdG8gZG8gdG8gcHJp
bnQgdGhlIG91dHB1dCBjb3VsZCBiZQo+IGV2aWN0aW5nIHNvbWUgY29kZSB0aGF0J3MgaW4gdGhl
IGJlbmNobWFyayBwYXRoPwoKTWF5YmUuIERvIHlvdSBhbHNvIHNlZSB0aGVzZSBvZGRpdGllcyBv
biB0aGUgYmFyZSBtZXRhbCBzeXN0ZW0/Cgo+IAo+Pgo+Pj4KPj4+IEknbSBpbmNsaW5lZCB0byBy
dW4gdGhpcyB0ZXN0IGZvciB0aGUgbGFzdCBOIGtlcm5lbCByZWxlYXNlcyBhbmQgaWYgdGhlIG51
bWJlcgo+Pj4gbW92ZXMgYXJvdW5kIHNpZ25pZmljYW50bHksIGNvbmNsdWRlIHRoYXQgdGhlc2Ug
dGVzdHMgZG9uJ3QgcmVhbGx5IG1hdHRlci4KPj4+IE90aGVyd2lzZSBpdHMgYW4gZXhlcmNpc2Ug
aW4gcmFuZG9tbHkgcmVmYWN0b3JpbmcgY29kZSB1bnRpbCBpdCB3b3JrcyB3ZWxsLCBidXQKPj4+
IHRoYXQncyBqdXN0IG92ZXJmaXR0aW5nIHRvIHRoZSBjb21waWxlciBhbmQgaHcuIFdoYXQgZG8g
eW91IHRoaW5rPwo+Pgo+PiBQZXJzb25hbGx5LCBJIHdvdWxkbid0IGxvc2Ugc2xlZXAgaWYgeW91
IHNlZSB3ZWlyZCwgdW5leHBsYWluYWJsZSBiZWhhdmlvciBvbgo+PiBzb21lIHN5c3RlbSAobm90
IGV2ZW4gYXJjaGl0ZWN0dXJlISkuIFRyeWluZyB0byBvcHRpbWl6ZSBmb3IgdGhhdCB3b3VsZCBp
bmRlZWQKPj4gYmUgcmFuZG9tIHJlZmFjdG9yaW5ncy4KPj4KPj4gQnV0IEkgd291bGQgbm90IGJl
IHNvIGZhc3QgdG8gc2F5IHRoYXQgInRoZXNlIHRlc3RzIGRvbid0IHJlYWxseSBtYXR0ZXIiIGFu
ZAo+PiB0aGVuIGdvIHdpbGQgYW5kIGRlZ3JhZGUgdGhlbSBhcyBtdWNoIGFzIHlvdSB3YW50LiBU
aGVyZSBhcmUgdXNlIGNhc2VzIHRoYXQgY2FyZQo+PiBhYm91dCBmb3JrIHBlcmZvcm1hbmNlIGVz
cGVjaWFsbHkgd2l0aCBvcmRlci0wIHBhZ2VzIC0tIHN1Y2ggYXMgUmVkaXMuCj4gCj4gSW5kZWVk
LiBCdXQgYWxzbyByZW1lbWJlciB0aGF0IG15IGZvcmsgYmFzZWxpbmUgdGltZSBpcyB+Mi41bXMs
IGFuZCBJIHRoaW5rIHlvdQo+IHNhaWQgeW91cnMgd2FzIDE0bXMgOikKClllcywgbm8gaWRlYSB3
aHkgTTIgaXMgdGhhdCBmYXN0IChCVFcsIHdoaWNoIHBhZ2Ugc2l6ZT8gNGsgb3IgMTZrPyApIDop
Cgo+IAo+IEknbGwgY29udGludWUgdG8gbWVzcyBhcm91bmQgd2l0aCBpdCB1bnRpbCB0aGUgZW5k
IG9mIHRoZSBkYXkuIEJ1dCBJJ20gbm90Cj4gbWFraW5nIGFueSBoZWFkd2F5LCB0aGVuIEknbGwg
Y2hhbmdlIHRhY2s7IEknbGwganVzdCBtZWFzdXJlIHRoZSBwZXJmb3JtYW5jZSBvZgo+IG15IGNv
bnRwdGUgY2hhbmdlcyB1c2luZyB5b3VyIGZvcmsvemFwIHN0dWZmIGFzIHRoZSBiYXNlbGluZSBh
bmQgcG9zdCBiYXNlZCBvbiB0aGF0LgoKWW91IHNob3VsZCBsaWtlbHkgbm90IGZvY3VzIG9uIE0y
IHJlc3VsdHMuIEp1c3QgcGljayBhIHJlcHJlc2VudGF0aXZlIApiYXJlIG1ldGFsIG1hY2hpbmUg
d2hlcmUgeW91IGdldCBjb25zaXN0ZW50LCBleHBsYWluYWJsZSByZXN1bHRzLgoKTm90aGluZyBp
biB0aGUgY29kZSBpcyBmaW5lLXR1bmVkIGZvciBhIHBhcnRpY3VsYXIgYXJjaGl0ZWN0dXJlIHNv
IGZhciwgCm9ubHkgb3JkZXItMCBoYW5kbGluZyBpcyBrZXB0IHNlcGFyYXRlLgoKQlRXOiBJIHNl
ZSB0aGUgZXhhY3Qgc2FtZSBzcGVlZHVwcyBmb3IgZG9udG5lZWQgdGhhdCBJIHNlZSBmb3IgbXVu
bWFwLiAKRm9yIGV4YW1wbGUsIGZvciBvcmRlci05LCBpdCBnb2VzIGZyb20gMC4wMjM0MTJzIC0+
IDAuMDA5Nzg1LCBzbyAtNTglLiAKU28gSSdtIGN1cmlvdXMgd2h5IHlvdSBzZWUgYSBzcGVlZHVw
IGZvciBtdW5tYXAgYnV0IG5vdCBmb3IgZG9udG5lZWQuCgotLSAKQ2hlZXJzLAoKRGF2aWQgLyBk
aGlsZGVuYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
