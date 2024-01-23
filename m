Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36974C47DDB
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 11:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNyi4N4BRp+hXvQqHc79fWCOcgKErDKdHvivA5QyFTg=; b=tMRWR9PoRmwmIv
	Qt+QZjEy3EGwr854TNcssmRwlX7+AtL1TD37IVEgRKwuMnAQjSOH7kF7LXS6WIpgEeKOYFgdFnWWk
	CLcuADv8d6oCytAjlfQe25CL8giUTukuepJxTjo8UOsMi8Rh51K41ywCerb/qjavD/qiGuVmBsLqB
	jwc5Gju6aGDdlQMueAjqOli7EFu6VmUyhw4z5kTmOybVokZLO8Xcv2esYqlW9iJRzFTmGyXWNkJVZ
	C1cYjESfd8SNHZ2XjPFPslJEgZB5cWd+lMiXHDS3A11T9sQv34J1jL3jyoU4UpCAroE11X8iTNiA5
	4wOoKOO2q7zJg0kKTo4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSF8r-00GHnE-01;
	Tue, 23 Jan 2024 11:40:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSF8p-00GHl1-0B
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 11:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706010030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mHQJhRmmFuVPQzf2Ks7ba/QVJg0CSBYgTnFxRHPHOBc=;
	b=YvhrH7+bS2kujALY3KWebTiqVv+qOsGbouiXaxtxBHmIjIcOEeJ/EL13WDwR1E0oSBOZ3G
	tMtjJg/waM5+xBUxk0KToisheBU9igyZx1FuFgTGfvEmiYNgcnV1PqRzzcCKZWP/kyNeIH
	cxUgbb4EShNiodgVpChy59Q67mabzQA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-C_meuL-iPz28JVZepLwSTw-1; Tue, 23 Jan 2024 06:40:28 -0500
X-MC-Unique: C_meuL-iPz28JVZepLwSTw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-40e40126031so41552955e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jan 2024 03:40:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706010027; x=1706614827;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHQJhRmmFuVPQzf2Ks7ba/QVJg0CSBYgTnFxRHPHOBc=;
        b=AWtpbUQByXT5PvQGGS5vdnhOqo5uzxDD8SJLqtmI0hau+dzYhgy6dUG7EpkHRMDrpD
         128kyZMArBCEr8jaYxyABKvATu/Qn60FCg1Ol31o7/dHRtbPMD1Hkw690AM52g8Q4rFd
         Shwsq73G45/gjzbK7WmmRjokIkdI9UXJ1e0COhdZNei9oX6V55LeUc20WaA+4JLipmhs
         q7CQhS6lXjIUMhAOoDgb+sZKVh6jhHIqGmmWexhb/YPZzX/EFhb17dh4iUgd1ed3XsQA
         NCDDfQapM7/Anq+WiEAF2LrezFHEUIzygwBxSxWfnj1iPLhwACFlMs3P/1kgGnLIvUOk
         RbEQ==
X-Gm-Message-State: AOJu0YymDnzCCUh1gS3VjOYoIoRl39ZsGSRCFgwrK15iinNWCtlXplHO
	tDYeWpIpJQ5KKxkVM30BecQRiJQqI4Kh+qIJEnNDl2ChxiKFiTjQ9lrGfYxfulEsGYkbUJrofAC
	oge0Lww9KLBL1fFY1Lqd126GdNDWRBo1sgeWVgN1646w3Py7B9AN0Wlc0rdzYnrsokg==
X-Received: by 2002:a05:600c:4f12:b0:40e:bf59:8246 with SMTP id l18-20020a05600c4f1200b0040ebf598246mr46508wmq.117.1706010027558;
        Tue, 23 Jan 2024 03:40:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1kFvm+DlgIqRqwbxyQH1B05JVSmcOI99Tf5Z/okgQJwonXU9OBUcVluhtsVk4NbD4ebx2hg==
X-Received: by 2002:a05:600c:4f12:b0:40e:bf59:8246 with SMTP id l18-20020a05600c4f1200b0040ebf598246mr46493wmq.117.1706010027150;
        Tue, 23 Jan 2024 03:40:27 -0800 (PST)
Received: from ?IPV6:2003:cb:c741:de00:bf0f:cd46:dc1c:2de9? (p200300cbc741de00bf0fcd46dc1c2de9.dip0.t-ipconnect.de. [2003:cb:c741:de00:bf0f:cd46:dc1c:2de9])
        by smtp.gmail.com with ESMTPSA id jb13-20020a05600c54ed00b0040e418494absm41219877wmb.46.2024.01.23.03.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 03:40:26 -0800 (PST)
Message-ID: <794c1dc3-520c-4030-b0fe-e24782576347@redhat.com>
Date: Tue, 23 Jan 2024 12:40:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] arm/pgtable: define PFN_PTE_SHIFT on arm and
 arm64
To: Ryan Roberts <ryan.roberts@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S. Miller"
 <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-2-david@redhat.com>
 <fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com>
 <46080ac1-7789-499b-b7f3-0231d7bd6de7@redhat.com>
 <6703b648-10ab-4fea-b7f1-75421319465b@arm.com>
 <ae3d826f-758f-4738-b72a-e99f098bb2b3@csgroup.eu>
 <3a970289-a72f-418e-b43c-89f67f0d5283@redhat.com>
 <e0d9caab-39c7-446a-aeef-5d914d321c72@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <e0d9caab-39c7-446a-aeef-5d914d321c72@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_034031_181212_CCD194DA 
X-CRM114-Status: GOOD (  13.88  )
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

T24gMjMuMDEuMjQgMTI6MzgsIFJ5YW4gUm9iZXJ0cyB3cm90ZToKPiBPbiAyMy8wMS8yMDI0IDEx
OjMxLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4+Pgo+Pj4+PiBJZiBoaWdoIGJpdHMgYXJl
IHVzZWQgZm9yCj4+Pj4+IHNvbWV0aGluZyBlbHNlLCB0aGVuIHdlIG1pZ2h0IHByb2R1Y2UgYSBn
YXJiYWdlIFBURSBvbiBvdmVyZmxvdywgYnV0IHRoYXQKPj4+Pj4gc2hvdWxkbid0IHJlYWxseSBt
YXR0ZXIgSSBjb25jbHVkZWQgZm9yIGZvbGlvX3B0ZV9iYXRjaCgpIHB1cnBvc2VzLCB3ZSdkIG5v
dAo+Pj4+PiBkZXRlY3QgImJlbG9uZ3MgdG8gdGhpcyBmb2xpbyBiYXRjaCIgZWl0aGVyIHdheS4K
Pj4+Pgo+Pj4+IEV4YWN0bHkuCj4+Pj4KPj4+Pj4KPj4+Pj4gTWF5YmUgaXQncyBsaWtlbHkgY2xl
YW5lciB0byBhbHNvIGhhdmUgYSBjdXN0b20gcHRlX25leHRfcGZuKCkgb24gcHBjLCBJIGp1c3QK
Pj4+Pj4gaG9wZSB0aGF0IHdlIGRvbid0IGxvc2UgYW55IG90aGVyIGFyYml0cmFyeSBQVEUgYml0
cyBieSBkb2luZyB0aGUgcHRlX3BncHJvdCgpLgo+Pj4+Cj4+Pj4gSSBkb24ndCBzZWUgdGhlIG5l
ZWQgZm9yIHBwYyB0byBpbXBsZW1lbnQgcHRlX25leHRfcGZuKCkuCj4+Pgo+Pj4gQWdyZWVkLgo+
Pgo+PiBTbyBsaWtlbHkgd2Ugc2hvdWxkIHRoZW4gZG8gb24gdG9wIGZvciBwb3dlcnBjICh3aGl0
ZXNwYWNlIGRhbWFnZSk6Cj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0vcGd0YWJs
ZS5jIGIvYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYwo+PiBpbmRleCBhMDRhZTQ0NDlhMDI1Li41
NDlhNDQwZWQ3ZjY1IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5jCj4+
ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMKPj4gQEAgLTIyMCwxMCArMjIwLDcgQEAg
dm9pZCBzZXRfcHRlcyhzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLAo+
PiBwdGVfdCAqcHRlcCwKPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgYnJlYWs7Cj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHRlcCsr
Owo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFkZHIgKz0gUEFHRV9TSVpFOwo+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKgo+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICogaW5jcmVtZW50IHRoZSBwZm4uCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgKi8KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHRlID0gcGZu
X3B0ZShwdGVfcGZuKHB0ZSkgKyAxLCBwdGVfcGdwcm90KChwdGUpKSk7Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHB0ZSA9IHB0ZV9uZXh0X3BmbihwdGUpOwo+PiAgwqDCoMKgwqDC
oMKgwqAgfQo+PiAgwqB9Cj4gCj4gTG9va3MgbGlrZSBjb21taXQgNDdiOGRlZjkzNThjICgicG93
ZXJwYy9tbTogQXZvaWQgY2FsbGluZwo+IGFyY2hfZW50ZXIvbGVhdmVfbGF6eV9tbXUoKSBpbiBz
ZXRfcHRlcyIpIGNoYW5nZWQgZnJvbSBkb2luZyB0aGUgc2ltcGxlCj4gaW5jcmVtZW50IHRvIHRo
aXMgbW9yZSBjb21wbGV4IGFwcHJvYWNoLCBidXQgdGhlIGxvZyBkb2Vzbid0IHNheSB3aHkuCgpA
QW5lZXNoLCB3YXMgdGhhdCBjaGFuZ2Ugb24gcHVycG9zZT8KCi0tIApDaGVlcnMsCgpEYXZpZCAv
IGRoaWxkZW5iCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
