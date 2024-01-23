Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83530C47DDB
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 11:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8GXA/+kNbWmI7zx6Ac1dlm8tLnnuzhk7NHvNKskexg=; b=TQOGql1kUhmmvn
	/Q9DRwoIGEWEGK60fb9ZmQQfqAfy4ChyA0O1TlcpnKPkVSI5OgcxqT075l1uMJkMvPzHovIbfKz/v
	AZyXfyZXsR2ST0Bc4692JagOJHj8HHoAgAb7k4PVxcvO6g+bDCdBQxdsxc2lTrWxsMTc1f6DRkzqP
	lk3xM+gDWv1ByoPV3FN+e5m1j/NbQoeOG1LzYf2tLZFF+4s2GU7mczH8ESkolMRod+T/DhdUJZ7Ki
	kS+tuxu/TZuKkP7lZjm2xot/NlUhmxQOVtKeP4ZEvxbyivpPArZkr8bTUCESvpWDgDCU2RsM/NiG+
	xVtKeJFWSxSuDO6xI2uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSFLD-00GKhS-0p;
	Tue, 23 Jan 2024 11:53:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSFL9-00GKfN-2k
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 11:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706010792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OM9IhUGiOaLE1ebI+XJlgsu9ejPIdgeJLVL+K3APrjE=;
	b=XKcuQqXFa4hI/kJgZtlxl6Vc1DW/zZeTbeUJ4SY+xTbLHMO20yCTAwAHIfkEvVq9U92oaT
	PsIXtlS6D9MfhLEgIEXNe7QMjoBgcpCwpJpvLyYDO2O/ejxxei2IjXtLM/+4Nb83HzhG4Y
	LEZSZhVqcEYLDzjx2PfUEfojblNsrOo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-SOE7N4YsP1aGX_OtCIXkoQ-1; Tue, 23 Jan 2024 06:53:11 -0500
X-MC-Unique: SOE7N4YsP1aGX_OtCIXkoQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-40eaedb4446so15332275e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jan 2024 03:53:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706010790; x=1706615590;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OM9IhUGiOaLE1ebI+XJlgsu9ejPIdgeJLVL+K3APrjE=;
        b=vWY0q+CbWnbdurLCtr0WknRGjt7eGTbFtf3VNYNgDnc7kc6uZDuHiTKqEvRDcukrPF
         YrBTmvUfsKwNhjY/OHsgDRYAJvajpC46dU68i74lGVa1sjZyHYGKO80LCiWdpURx57DA
         Zi8VlV89Qj9+wVXHV+YpnJ24mNlTm+tIqHxo2RnMlv7O1QZeT80NaQSXdaUUo8LfRdSp
         leQY1e8ORsQr64jzsor941OGdUeEO2Ga+Xcn/PUxN6CR5cpYAFukS0CwUsuOGA66T24A
         5E0axpGsQBqBFkkn0s7xDVLLLM/CGizzkn1Vss00gnMCg1vYsMaube6p38oIDuOUi4mU
         iZEg==
X-Gm-Message-State: AOJu0YzZ7nce6reegaiM8hKryHd+uiu8zT30onP202oGlec8t5YKDfIm
	mc7LxgR6l2RjugzJ2GjLKdR/54el91o/vDqqATvagzwFUX49s4XRtOLQf9sT+XBgxLYS2IcSicq
	BXUVFJClQF1rSE5kygjf4sEWSPYzt8z6MrXWNGhFowLEgq/+5U3CSLonSuCDhrsMdIg==
X-Received: by 2002:a05:600c:4494:b0:40e:4df2:5d17 with SMTP id e20-20020a05600c449400b0040e4df25d17mr61852wmo.65.1706010790128;
        Tue, 23 Jan 2024 03:53:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyHLojobAL/xO6r5H704NTLO+OeBxBmoUI2Pa1L/RVK39XSRW6cW383DtchwzbIsfgNlfxLw==
X-Received: by 2002:a05:600c:4494:b0:40e:4df2:5d17 with SMTP id e20-20020a05600c449400b0040e4df25d17mr61841wmo.65.1706010789693;
        Tue, 23 Jan 2024 03:53:09 -0800 (PST)
Received: from ?IPV6:2003:cb:c741:de00:bf0f:cd46:dc1c:2de9? (p200300cbc741de00bf0fcd46dc1c2de9.dip0.t-ipconnect.de. [2003:cb:c741:de00:bf0f:cd46:dc1c:2de9])
        by smtp.gmail.com with ESMTPSA id v21-20020a05600c445500b0040e3bdff98asm45737522wmn.23.2024.01.23.03.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 03:53:09 -0800 (PST)
Message-ID: <1facdace-241a-4ceb-a206-bd44ea4e3ae4@redhat.com>
Date: Tue, 23 Jan 2024 12:53:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] arm/pgtable: define PFN_PTE_SHIFT on arm and
 arm64
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Ryan Roberts <ryan.roberts@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
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
 <11a7232c-8623-4c2c-b980-a13645f3fe89@csgroup.eu>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <11a7232c-8623-4c2c-b980-a13645f3fe89@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_035315_964156_FBBFE3CB 
X-CRM114-Status: GOOD (  13.63  )
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

T24gMjMuMDEuMjQgMTI6NDgsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4gCj4gCj4gTGUgMjMv
MDEvMjAyNCDDoCAxMjozOCwgUnlhbiBSb2JlcnRzIGEgw6ljcml0wqA6Cj4+IE9uIDIzLzAxLzIw
MjQgMTE6MzEsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+Pj4+Pgo+Pj4+Pj4gSWYgaGlnaCBi
aXRzIGFyZSB1c2VkIGZvcgo+Pj4+Pj4gc29tZXRoaW5nIGVsc2UsIHRoZW4gd2UgbWlnaHQgcHJv
ZHVjZSBhIGdhcmJhZ2UgUFRFIG9uIG92ZXJmbG93LCBidXQgdGhhdAo+Pj4+Pj4gc2hvdWxkbid0
IHJlYWxseSBtYXR0ZXIgSSBjb25jbHVkZWQgZm9yIGZvbGlvX3B0ZV9iYXRjaCgpIHB1cnBvc2Vz
LCB3ZSdkIG5vdAo+Pj4+Pj4gZGV0ZWN0ICJiZWxvbmdzIHRvIHRoaXMgZm9saW8gYmF0Y2giIGVp
dGhlciB3YXkuCj4+Pj4+Cj4+Pj4+IEV4YWN0bHkuCj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gTWF5YmUg
aXQncyBsaWtlbHkgY2xlYW5lciB0byBhbHNvIGhhdmUgYSBjdXN0b20gcHRlX25leHRfcGZuKCkg
b24gcHBjLCBJIGp1c3QKPj4+Pj4+IGhvcGUgdGhhdCB3ZSBkb24ndCBsb3NlIGFueSBvdGhlciBh
cmJpdHJhcnkgUFRFIGJpdHMgYnkgZG9pbmcgdGhlIHB0ZV9wZ3Byb3QoKS4KPj4+Pj4KPj4+Pj4g
SSBkb24ndCBzZWUgdGhlIG5lZWQgZm9yIHBwYyB0byBpbXBsZW1lbnQgcHRlX25leHRfcGZuKCku
Cj4+Pj4KPj4+PiBBZ3JlZWQuCj4+Pgo+Pj4gU28gbGlrZWx5IHdlIHNob3VsZCB0aGVuIGRvIG9u
IHRvcCBmb3IgcG93ZXJwYyAod2hpdGVzcGFjZSBkYW1hZ2UpOgo+Pj4KPj4+IGRpZmYgLS1naXQg
YS9hcmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5jIGIvYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYwo+
Pj4gaW5kZXggYTA0YWU0NDQ5YTAyNS4uNTQ5YTQ0MGVkN2Y2NSAxMDA2NDQKPj4+IC0tLSBhL2Fy
Y2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMKPj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxl
LmMKPj4+IEBAIC0yMjAsMTAgKzIyMCw3IEBAIHZvaWQgc2V0X3B0ZXMoc3RydWN0IG1tX3N0cnVj
dCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkciwKPj4+IHB0ZV90ICpwdGVwLAo+Pj4gICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4gICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHRlcCsrOwo+Pj4gICDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgYWRkciArPSBQQUdFX1NJWkU7Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAvKgo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGluY3Jl
bWVudCB0aGUgcGZuLgo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+Pj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHRlID0gcGZuX3B0ZShwdGVfcGZuKHB0ZSkg
KyAxLCBwdGVfcGdwcm90KChwdGUpKSk7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBwdGUgPSBwdGVfbmV4dF9wZm4ocHRlKTsKPj4+ICAgwqDCoMKgwqDCoMKgwqAgfQo+Pj4gICDC
oH0KPj4KPj4gTG9va3MgbGlrZSBjb21taXQgNDdiOGRlZjkzNThjICgicG93ZXJwYy9tbTogQXZv
aWQgY2FsbGluZwo+PiBhcmNoX2VudGVyL2xlYXZlX2xhenlfbW11KCkgaW4gc2V0X3B0ZXMiKSBj
aGFuZ2VkIGZyb20gZG9pbmcgdGhlIHNpbXBsZQo+PiBpbmNyZW1lbnQgdG8gdGhpcyBtb3JlIGNv
bXBsZXggYXBwcm9hY2gsIGJ1dCB0aGUgbG9nIGRvZXNuJ3Qgc2F5IHdoeS4KPiAKPiBSaWdodC4g
VGhlcmUgd2FzIGEgZGlzY3Vzc2lvbiBhYm91dCBpdCB3aXRob3V0IGFueSBjb25jbHVzaW9uOgo+
IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvcGF0Y2gv
MjAyMzEwMjQxNDM2MDQuMTY3NDktMS1hbmVlc2gua3VtYXJAbGludXguaWJtLmNvbS8KPiAKPiBB
cyBmYXIgYXMgdW5kZXJzdGFuZCB0aGUgc2ltcGxlIGluY3JlbWVudCBpcyBiZXR0ZXIgb24gcHBj
LzMyIGJ1dCB3b3JzZQo+IGluIHBwYy82NC4KClNvdW5kcyBsaWtlIHdlJ3JlIG1pY3JvLW9wdGlt
aXppbmcgZm9yIGEgc3BlY2lmaWMgY29tcGlsZXIgdmVyc2lvbiAKb3V0cHV0LiBIdXJyYXkuCgot
LSAKQ2hlZXJzLAoKRGF2aWQgLyBkaGlsZGVuYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
