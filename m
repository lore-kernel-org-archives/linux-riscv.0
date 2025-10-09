Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAD1CCD188
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 08:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wIWkcHkaEun40wkyGZAOBF1/piBRQcPYlDGbY0v/poI=; b=cdCl+qDQ+hjkib
	81gauOwj0ZU8nWYm8+VBHF4cQ2p8K3sdjMC5SDulSszi3jn2rTkvBUQ4Mt7OhnzJSUmZTeSWkCW8c
	+42u+EVbSQz9dgnlc6rjD0QyXG8pLzRX0hRz6AMdHPUCVzi4nWlrvXtbceZr8QaCFoDGJHiaC6bRg
	CcajR3QfjHNqKpf2KemJEd9Rx8iaWPCICvMzz/5gO0nn/RCT2kOSFJHXjPfzNjknQSLoQ6TR0Hw0m
	PhHSxcorGTXnN/FVYNFtlphbDzHKh+AO6Vewwrn2/Ne1WFXwW3hvlxLGw9ogcRed/h1Kzlocj84pV
	YJOc7uM/LwthX591omMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lmx-00000005U17-02kS;
	Thu, 09 Oct 2025 08:14:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lmt-00000005Tyo-3ZY1
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 08:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759997651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=z/B31lhY4bVYeZNnk+dMlfOVrRbTYtHHzwgcdMMaTVE=;
	b=SeDXrVcz4weTcWna3ui4lsWu55ONqO6CjYOGEXRC33tI8pdYAmE857GAbJyi87ipf5xfeF
	qnBwJ+cQYz78BS8FWTB98aYGunhiPFPKE140PuQpzzKW41U8QwjwuQ+j8tNLO1NYMuKFOh
	4J0QKDJQHU7hMPb3F7LHz9y5tl0U1uA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-56_kfNjXOEKGYPrQANUswA-1; Thu, 09 Oct 2025 04:14:09 -0400
X-MC-Unique: 56_kfNjXOEKGYPrQANUswA-1
X-Mimecast-MFC-AGG-ID: 56_kfNjXOEKGYPrQANUswA_1759997648
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46b303f6c9cso4511845e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 01:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759997648; x=1760602448;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/B31lhY4bVYeZNnk+dMlfOVrRbTYtHHzwgcdMMaTVE=;
        b=FN4dnP2oFxdt2Ig/ABy2cghwxA5mAAGIjCLAfQSN+tmXFsVxwaOU9JtOdrtcZW2UcE
         XAVH9ypGZhtnzODYDilBRe5JWy0cOMKmL3fEwubAOTmT0ZhfBpLK6XPjhgw2ydSHseJx
         vqYrOmTxGEBU6LdkdPIWs3fyIJeKjJOCQtjwMjsfnDYGCDcu2XiRwH+JHzTBOoOoDWaP
         AB5/tUpBIYwTLYbk3P3JkegcOzYQ1ZoXwE4j7WHCMN9iQG/3cjhNe+T1/JKwEmhwi89k
         qpkRrUKvle5KugIBFu82CSjhr0l8rb1jchcStdrL60MCEbWfT7yaoSiBvyQh07t+fok7
         zjZg==
X-Forwarded-Encrypted: i=1; AJvYcCV4KSZ3xGk2x7YF2VQEphAWp58itrmP2Rklx2x7bhyVIBbowrOom3hw+eBWOvJ6dK9vGoe3K4qLQKL7nA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFgekWj2kcIpW0Qme9MuTXKW2oLVF0f+vupzBW5qEqOkkbVw6W
	smPvdoP++hzcNFcTzNTgamuySk/U2eV/zRITHiX2A3a1bdBB6sMdF5kSFI7LNM3CU9xkYatCcvO
	RfFmAuTogmopOdTB0yejvODgNTDJSTv+ap8LBMxU3AcOeM5Lid9sgWL/FtSLbUVfMF0Ha2g==
X-Gm-Gg: ASbGncuKYu9PP8AGKf6m8hc8CywJl915Cc5yFB4ZnIupmwdyYFHD3iuYAYNSfcMvU5R
	di6cOd8uibXpvbcn0b5QMeBX9otMEhmUcr4KMaK/77WUXVfAEFY0pbpP4I1UL/4OGfwDqqFOSI+
	vanjS6s0Z8eS4jYGFv9Y6Bxg1DuUETYOIsJyuLGs3vEfc0qALqtj1EolV/dkUH/5tj2Aq5COFtx
	Ybb1kvl/o08zaEKUllfQsQloo2uJl8bkFIA3DzpcnPNVe74wW/keeUCxOOnFRiWcIvDHFUDu/fo
	ZMa2jgu2QPtJJEcXWf2mgufb1EMzTApavyDeWaqfk7L0F+ebsqeB5t6mO9F1XeCkLu3E4RrJw+F
	G8fjQGD6p
X-Received: by 2002:a05:600c:4750:b0:45f:28d2:bd38 with SMTP id 5b1f17b1804b1-46fa9af3095mr47092695e9.18.1759997648086;
        Thu, 09 Oct 2025 01:14:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo93r/upxlN0XWroa/gVbVuSE1HI9H4cBHGhOGnkYv+FuHkp7MlpzQ4ByJt+h+2JF6rzGBiQ==
X-Received: by 2002:a05:600c:4750:b0:45f:28d2:bd38 with SMTP id 5b1f17b1804b1-46fa9af3095mr47092215e9.18.1759997647608;
        Thu, 09 Oct 2025 01:14:07 -0700 (PDT)
Received: from [192.168.3.141] (tmo-083-189.customers.d1-online.com. [80.187.83.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9d6fb41sm71628175e9.17.2025.10.09.01.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 01:14:07 -0700 (PDT)
Message-ID: <9361c75a-ab37-4d7f-8680-9833430d93d4@redhat.com>
Date: Thu, 9 Oct 2025 10:14:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (bisected) [PATCH v2 08/37] mm/hugetlb: check for unreasonable
 folio sizes when registering hstate
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-kernel@vger.kernel.org
Cc: Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20250901150359.867252-1-david@redhat.com>
 <20250901150359.867252-9-david@redhat.com>
 <3e043453-3f27-48ad-b987-cc39f523060a@csgroup.eu>
 <d3fc12d4-0b59-4b1f-bb5c-13189a01e13d@redhat.com>
 <faf62f20-8844-42a0-a7a7-846d8ead0622@csgroup.eu>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <faf62f20-8844-42a0-a7a7-846d8ead0622@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mE5wYIQYLN74Rd6vxUQijDZFfaqHV9yZMfBObUp_ESM_1759997648
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_011411_973149_8FA116CB 
X-CRM114-Status: GOOD (  14.07  )
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

T24gMDkuMTAuMjUgMTA6MDQsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4gCj4gCj4gTGUgMDkv
MTAvMjAyNSDDoCAwOToyMiwgRGF2aWQgSGlsZGVuYnJhbmQgYSDDqWNyaXTCoDoKPj4gT24gMDku
MTAuMjUgMDk6MTQsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+PiBIaSBEYXZpZCwKPj4+Cj4+
PiBMZSAwMS8wOS8yMDI1IMOgIDE3OjAzLCBEYXZpZCBIaWxkZW5icmFuZCBhIMOpY3JpdMKgOgo+
Pj4+IGRpZmYgLS1naXQgYS9tbS9odWdldGxiLmMgYi9tbS9odWdldGxiLmMKPj4+PiBpbmRleCAx
ZTc3N2NjNTFhZDA0Li5kMzU0MmU5MmE3MTJlIDEwMDY0NAo+Pj4+IC0tLSBhL21tL2h1Z2V0bGIu
Ywo+Pj4+ICsrKyBiL21tL2h1Z2V0bGIuYwo+Pj4+IEBAIC00NjU3LDYgKzQ2NTcsNyBAQCBzdGF0
aWMgaW50IF9faW5pdCBodWdldGxiX2luaXQodm9pZCkKPj4+PiAgwqDCoMKgwqDCoMKgIEJVSUxE
X0JVR19PTihzaXplb2ZfZmllbGQoc3RydWN0IHBhZ2UsIHByaXZhdGUpICogQklUU19QRVJfQllU
RSA8Cj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19OUl9IUEFHRUZMQUdTKTsK
Pj4+PiArwqDCoMKgIEJVSUxEX0JVR19PTl9JTlZBTElEKEhVR0VUTEJfUEFHRV9PUkRFUiA+IE1B
WF9GT0xJT19PUkRFUik7Cj4+Pj4gIMKgwqDCoMKgwqDCoCBpZiAoIWh1Z2VwYWdlc19zdXBwb3J0
ZWQoKSkgewo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaHVnZXRsYl9tYXhfaHN0YXRl
IHx8IGRlZmF1bHRfaHN0YXRlX21heF9odWdlX3BhZ2VzKQo+Pj4+IEBAIC00NzQwLDYgKzQ3NDEs
NyBAQCB2b2lkIF9faW5pdCBodWdldGxiX2FkZF9oc3RhdGUodW5zaWduZWQgaW50IG9yZGVyKQo+
Pj4+ICDCoMKgwqDCoMKgwqAgfQo+Pj4+ICDCoMKgwqDCoMKgwqAgQlVHX09OKGh1Z2V0bGJfbWF4
X2hzdGF0ZSA+PSBIVUdFX01BWF9IU1RBVEUpOwo+Pj4+ICDCoMKgwqDCoMKgwqAgQlVHX09OKG9y
ZGVyIDwgb3JkZXJfYmFzZV8yKF9fTlJfVVNFRF9TVUJQQUdFKSk7Cj4+Pj4gK8KgwqDCoCBXQVJO
X09OKG9yZGVyID4gTUFYX0ZPTElPX09SREVSKTsKPj4+PiAgwqDCoMKgwqDCoMKgIGggPSAmaHN0
YXRlc1todWdldGxiX21heF9oc3RhdGUrK107Cj4+Pj4gIMKgwqDCoMKgwqDCoCBfX211dGV4X2lu
aXQoJmgtPnJlc2l6ZV9sb2NrLCAicmVzaXplIG11dGV4IiwgJmgtPnJlc2l6ZV9rZXkpOwo+Pj4+
ICDCoMKgwqDCoMKgwqAgaC0+b3JkZXIgPSBvcmRlcjsKPj4KPj4gV2UgZW5kIHVwIHJlZ2lzdGVy
aW5nIGh1Z2V0bGIgZm9saW9zIHRoYXQgYXJlIGJpZ2dlciB0aGFuCj4+IE1BWF9GT0xJT19PUkRF
Ui4gU28gd2UgaGF2ZSB0byBmaWd1cmUgb3V0IGhvdyBhIGNvbmZpZyBjYW4gdHJpZ2dlciB0aGF0
Cj4+IChhbmQgaWYgd2UgaGF2ZSB0byBzdXBwb3J0IHRoYXQpLgo+Pgo+IAo+IE1BWF9GT0xJT19P
UkRFUiBpcyBkZWZpbmVkIGFzOgo+IAo+ICNpZmRlZiBDT05GSUdfQVJDSF9IQVNfR0lHQU5USUNf
UEFHRQo+ICNkZWZpbmUgTUFYX0ZPTElPX09SREVSCQlQVURfT1JERVIKPiAjZWxzZQo+ICNkZWZp
bmUgTUFYX0ZPTElPX09SREVSCQlNQVhfUEFHRV9PUkRFUgo+ICNlbmRpZgo+IAo+IE1BWF9QQUdF
X09SREVSIGlzIHRoZSBsaW1pdCBmb3IgZHluYW1pYyBjcmVhdGlvbiBvZiBodWdlcGFnZXMgdmlh
Cj4gL3N5cy9rZXJuZWwvbW0vaHVnZXBhZ2VzLyBidXQgYmlnZ2VyIHBhZ2VzIGNhbiBiZSBjcmVh
dGVkIGF0IGJvb3R0aW1lCj4gd2l0aCBrZXJuZWwgYm9vdCBwYXJhbWV0ZXJzIHdpdGhvdXQgQ09O
RklHX0FSQ0hfSEFTX0dJR0FOVElDX1BBR0U6Cj4gCj4gICAgIGh1Z2VwYWdlc3o9NjRtIGh1Z2Vw
YWdlcz0xIGh1Z2VwYWdlc3o9MjU2bSBodWdlcGFnZXM9MQo+IAo+IEdpdmVzOgo+IAo+IEh1Z2VU
TEI6IHJlZ2lzdGVyZWQgMS4wMCBHaUIgcGFnZSBzaXplLCBwcmUtYWxsb2NhdGVkIDAgcGFnZXMK
PiBIdWdlVExCOiAwIEtpQiB2bWVtbWFwIGNhbiBiZSBmcmVlZCBmb3IgYSAxLjAwIEdpQiBwYWdl
Cj4gSHVnZVRMQjogcmVnaXN0ZXJlZCA2NC4wIE1pQiBwYWdlIHNpemUsIHByZS1hbGxvY2F0ZWQg
MSBwYWdlcwo+IEh1Z2VUTEI6IDAgS2lCIHZtZW1tYXAgY2FuIGJlIGZyZWVkIGZvciBhIDY0LjAg
TWlCIHBhZ2UKPiBIdWdlVExCOiByZWdpc3RlcmVkIDI1NiBNaUIgcGFnZSBzaXplLCBwcmUtYWxs
b2NhdGVkIDEgcGFnZXMKPiBIdWdlVExCOiAwIEtpQiB2bWVtbWFwIGNhbiBiZSBmcmVlZCBmb3Ig
YSAyNTYgTWlCIHBhZ2UKPiBIdWdlVExCOiByZWdpc3RlcmVkIDQuMDAgTWlCIHBhZ2Ugc2l6ZSwg
cHJlLWFsbG9jYXRlZCAwIHBhZ2VzCj4gSHVnZVRMQjogMCBLaUIgdm1lbW1hcCBjYW4gYmUgZnJl
ZWQgZm9yIGEgNC4wMCBNaUIgcGFnZQo+IEh1Z2VUTEI6IHJlZ2lzdGVyZWQgMTYuMCBNaUIgcGFn
ZSBzaXplLCBwcmUtYWxsb2NhdGVkIDAgcGFnZXMKPiBIdWdlVExCOiAwIEtpQiB2bWVtbWFwIGNh
biBiZSBmcmVlZCBmb3IgYSAxNi4wIE1pQiBwYWdlCgpJIHRoaW5rIGl0J3MgYSB2aW9sYXRpb24g
b2YgQ09ORklHX0FSQ0hfSEFTX0dJR0FOVElDX1BBR0UuIFRoZSBleGlzdGluZyAKZm9saW9fZHVt
cCgpIGNvZGUgd291bGQgbm90IGhhbmRsZSBpdCBjb3JyZWN0bHkgYXMgd2VsbC4KClNlZSBob3cg
c25hcHNob3RfcGFnZSgpIHVzZXMgTUFYX0ZPTElPX05SX1BBR0VTLgoKLS0gCkNoZWVycwoKRGF2
aWQgLyBkaGlsZGVuYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
