Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A7FCCD187
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 07:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXve6YltW1N2ENWJeL9SOaZYyY204CgEjIpI1KCno1A=; b=TGRpTYKzOEFb5H
	x4qdf3N6QPJcdDrCalCSAmI5WdLQ1pkrOA5Fa2nkaqEcm3G8B459ZM7x3Z/fl32Z891xZxzlV4zmM
	k1N0gEqQs4TzwECxTg+wNzX5g+xDbcOGQR3Cy8bv+1rmPyqOyi9iMxJ0k6QY4r1gBCT2mNgcL2QnN
	d9wY04ljBdS7KCvi1WzxD4A65JC3K0w9Du7FxkdjFfz5aBLrH9Z6S2OyGFLw/EclN0SqVe2P9mqOp
	OB+ury8AlArDyuIw8CHRrG0Zf9sTZf9pBdU9w1PIfau1qutEwaf8vBSHdmj9FwZ8+nrdrqGkmdgXL
	n8KmAKemBn5ACZSQ6SaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kyq-00000005MCO-2LCF;
	Thu, 09 Oct 2025 07:22:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kyo-00000005MAk-1LSS
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 07:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759994545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NR0GPPrQth8s1EL9fLV4+qP3WUCAWdzIUfVSZ9j+y5w=;
	b=dPANKf4+ue6wc7GttDLbrsVWeZq1jmmAdReiD232fVcnComFNUtbSq2mLgW3mn0xFb5Dwh
	zTXHfLi2TsxB8oDG7yqUuH5xqnw/AwjrgosJNfDI9LoAkzIwTTugfBZKMF9fX0bsBh9wO4
	jLe5IgjQUrF6VqJTDTMD1Ygy5tT2jLQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-CsFI6TKKOmq08eJ0iuUWaQ-1; Thu, 09 Oct 2025 03:22:22 -0400
X-MC-Unique: CsFI6TKKOmq08eJ0iuUWaQ-1
X-Mimecast-MFC-AGG-ID: CsFI6TKKOmq08eJ0iuUWaQ_1759994541
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4256fae4b46so443782f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 00:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759994541; x=1760599341;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NR0GPPrQth8s1EL9fLV4+qP3WUCAWdzIUfVSZ9j+y5w=;
        b=pk3wW9QTB6yii/HDFnKm1dzDfZDy0WzQE0uDvoCanHD7oa96stSUfhjFv9eaNtaFgC
         thRohGTrLl0b+gI4P1fFH6SAFWXJWM1EKYkmGHqqhf4bVwyHYMLokYfkUeBEGLKB45Qu
         +3DwRtRpBy5tE4l1sppNJr9fnvs2XB0EzZ9x2E7R2PYX6DZlNYxFkNyDzfypXmR0/gQZ
         5frX7SGFfWdwTW4sALjr8+jnAc4FUuEA/cky8bLy/W9QeUq8ltwt5t1k0QXLAnHm/KG3
         qyUs/DalzwLcW6HEU29KLVd0mf8JUg6z26hhtouuZ4eTit8/dZEfSu3QG+kKOStsC5En
         tpUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYzmhaPJgbuATcrvY19Jw7m5HwhsZyEaxPw24N2VBmPISfmO70n9BAA2mj0DsTb1eAXEGoFNABHP4Q+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNwYWhmBuqG7I4Cy41Moj8NM55dOL7hge5hF85tWkmcj5FCyq9
	tAo2NPjL2eeZ6lv32dIlUk+BjTTYsyeJqnG6DKoRd2H9nRbQskfUkB0YUYimOAcvbLJ56YHUHl9
	C5fZap3db3rgdswDtjBiVA0Jj7wMlNMvg9CBFGbBbaymhGSsG95vF6s9xP5DUT4yyzXWAog==
X-Gm-Gg: ASbGncsWKU4K/EpF36fKt+gVRIy9BQIV5ZQY7m1m1jz4VHqstG6l7VRzxMrNhTm8ddk
	GkeFMDrddRfTMVoEoDrLfsM0m539OPz4hZhXV5LevAvIndDS+W6a6Blg64vPbksyr2qNY75Fc0T
	00MdYnupj+iD9mzV7nD298/Uh+FDoXu8fepNqCDKoiv41DTug1U8Y01AoboVuuJycbIeffsxw9m
	m62An2poLV6rZIHW3QZ3p0xBPXnL/eVW5g6NlQf5ETksTDpUnc7Xqb1tmzJ/997HtERMCtF+0XM
	0K1vcRM77TFTf2fes33Hfn6edYUUW+tVdO4RrNJWNMxGnWA3Kp8F1X5P3b9TGipnOaeNaEQB+EX
	zUAkg9Hsu
X-Received: by 2002:a5d:5f84:0:b0:3ee:1578:3181 with SMTP id ffacd0b85a97d-4266e8de444mr4275627f8f.49.1759994540830;
        Thu, 09 Oct 2025 00:22:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3pZJrfQfix+9KKt4WdXWXcZ6zm7mHa+Vng4C8E+STUwzM8VHEo7EV1uD0vgxW+NxE9Pp9bw==
X-Received: by 2002:a5d:5f84:0:b0:3ee:1578:3181 with SMTP id ffacd0b85a97d-4266e8de444mr4275568f8f.49.1759994540323;
        Thu, 09 Oct 2025 00:22:20 -0700 (PDT)
Received: from [192.168.3.141] (tmo-083-189.customers.d1-online.com. [80.187.83.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9d62890sm68237045e9.14.2025.10.09.00.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 00:22:19 -0700 (PDT)
Message-ID: <d3fc12d4-0b59-4b1f-bb5c-13189a01e13d@redhat.com>
Date: Thu, 9 Oct 2025 09:22:14 +0200
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <3e043453-3f27-48ad-b987-cc39f523060a@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6eDvcQTtoHJ6XoJ4v8DqzIDLuqO6NdGQOdpE6SR3MFE_1759994541
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_002226_426646_DBB10BBB 
X-CRM114-Status: GOOD (  17.97  )
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

T24gMDkuMTAuMjUgMDk6MTQsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4gSGkgRGF2aWQsCj4g
Cj4gTGUgMDEvMDkvMjAyNSDDoCAxNzowMywgRGF2aWQgSGlsZGVuYnJhbmQgYSDDqWNyaXTCoDoK
Pj4gTGV0J3MgY2hlY2sgdGhhdCBubyBoc3RhdGUgdGhhdCBjb3JyZXNwb25kcyB0byBhbiB1bnJl
YXNvbmFibGUgZm9saW8gc2l6ZQo+PiBpcyByZWdpc3RlcmVkIGJ5IGFuIGFyY2hpdGVjdHVyZS4g
SWYgd2Ugd2VyZSB0byBzdWNjZWVkIHJlZ2lzdGVyaW5nLCB3ZQo+PiBjb3VsZCBsYXRlciB0cnkg
YWxsb2NhdGluZyBhbiB1bnN1cHBvcnRlZCBnaWdhbnRpYyBmb2xpbyBzaXplLgo+Pgo+PiBGdXJ0
aGVyLCBsZXQncyBhZGQgYSBCVUlMRF9CVUdfT04oKSBmb3IgY2hlY2tpbmcgdGhhdCBIVUdFVExC
X1BBR0VfT1JERVIKPj4gaXMgc2FuZSBhdCBidWlsZCB0aW1lLiBBcyBIVUdFVExCX1BBR0VfT1JE
RVIgaXMgZHluYW1pYyBvbiBwb3dlcnBjLCB3ZSBoYXZlCj4+IHRvIHVzZSBhIEJVSUxEX0JVR19P
Tl9JTlZBTElEKCkgdG8gbWFrZSBpdCBjb21waWxlLgo+Pgo+PiBObyBleGlzdGluZyBrZXJuZWwg
Y29uZmlndXJhdGlvbiBzaG91bGQgYmUgYWJsZSB0byB0cmlnZ2VyIHRoaXMgY2hlY2s6Cj4+IGVp
dGhlciBTUEFSU0VNRU0gd2l0aG91dCBTUEFSU0VNRU1fVk1FTU1BUCBjYW5ub3QgYmUgY29uZmln
dXJlZCBvcgo+PiBnaWdhbnRpYyBmb2xpb3Mgd2lsbCBub3QgZXhjZWVkIGEgbWVtb3J5IHNlY3Rp
b24gKHRoZSBjYXNlIG9uIHNwYXJzZSkuCj4+Cj4+IFJldmlld2VkLWJ5OiBaaSBZYW4gPHppeUBu
dmlkaWEuY29tPgo+PiBSZXZpZXdlZC1ieTogTG9yZW56byBTdG9ha2VzIDxsb3JlbnpvLnN0b2Fr
ZXNAb3JhY2xlLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IExpYW0gUi4gSG93bGV0dCA8TGlhbS5Ib3ds
ZXR0QG9yYWNsZS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZp
ZEByZWRoYXQuY29tPgo+IAo+IEkgZ2V0IGZvbGxvd2luZyB3YXJuaW5nIG9uIHBvd2VycGMgd2l0
aCBsaW51cyB0cmVlLCBiaXNlY3RlZCB0byBjb21taXQKPiA3YjRmMjFmNWUwMzggKCJtbS9odWdl
dGxiOiBjaGVjayBmb3IgdW5yZWFzb25hYmxlIGZvbGlvIHNpemVzIHdoZW4KPiByZWdpc3Rlcmlu
ZyBoc3RhdGUiKQoKRG8geW91IGhhdmUgdGhlIGtlcm5lbCBjb25maWcgYXJvdW5kPyBJcyBpdCAz
MmJpdD8KClRoYXQgd291bGQgYmUgaGVscGZ1bC4KClsuLi5dCgo+PiAtLS0KPj4gICAgbW0vaHVn
ZXRsYi5jIHwgMiArKwo+PiAgICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+Cj4+
IGRpZmYgLS1naXQgYS9tbS9odWdldGxiLmMgYi9tbS9odWdldGxiLmMKPj4gaW5kZXggMWU3Nzdj
YzUxYWQwNC4uZDM1NDJlOTJhNzEyZSAxMDA2NDQKPj4gLS0tIGEvbW0vaHVnZXRsYi5jCj4+ICsr
KyBiL21tL2h1Z2V0bGIuYwo+PiBAQCAtNDY1Nyw2ICs0NjU3LDcgQEAgc3RhdGljIGludCBfX2lu
aXQgaHVnZXRsYl9pbml0KHZvaWQpCj4+ICAgIAo+PiAgICAJQlVJTERfQlVHX09OKHNpemVvZl9m
aWVsZChzdHJ1Y3QgcGFnZSwgcHJpdmF0ZSkgKiBCSVRTX1BFUl9CWVRFIDwKPj4gICAgCQkJX19O
Ul9IUEFHRUZMQUdTKTsKPj4gKwlCVUlMRF9CVUdfT05fSU5WQUxJRChIVUdFVExCX1BBR0VfT1JE
RVIgPiBNQVhfRk9MSU9fT1JERVIpOwo+PiAgICAKPj4gICAgCWlmICghaHVnZXBhZ2VzX3N1cHBv
cnRlZCgpKSB7Cj4+ICAgIAkJaWYgKGh1Z2V0bGJfbWF4X2hzdGF0ZSB8fCBkZWZhdWx0X2hzdGF0
ZV9tYXhfaHVnZV9wYWdlcykKPj4gQEAgLTQ3NDAsNiArNDc0MSw3IEBAIHZvaWQgX19pbml0IGh1
Z2V0bGJfYWRkX2hzdGF0ZSh1bnNpZ25lZCBpbnQgb3JkZXIpCj4+ICAgIAl9Cj4+ICAgIAlCVUdf
T04oaHVnZXRsYl9tYXhfaHN0YXRlID49IEhVR0VfTUFYX0hTVEFURSk7Cj4+ICAgIAlCVUdfT04o
b3JkZXIgPCBvcmRlcl9iYXNlXzIoX19OUl9VU0VEX1NVQlBBR0UpKTsKPj4gKwlXQVJOX09OKG9y
ZGVyID4gTUFYX0ZPTElPX09SREVSKTsKPj4gICAgCWggPSAmaHN0YXRlc1todWdldGxiX21heF9o
c3RhdGUrK107Cj4+ICAgIAlfX211dGV4X2luaXQoJmgtPnJlc2l6ZV9sb2NrLCAicmVzaXplIG11
dGV4IiwgJmgtPnJlc2l6ZV9rZXkpOwo+PiAgICAJaC0+b3JkZXIgPSBvcmRlcjsKCldlIGVuZCB1
cCByZWdpc3RlcmluZyBodWdldGxiIGZvbGlvcyB0aGF0IGFyZSBiaWdnZXIgdGhhbiAKTUFYX0ZP
TElPX09SREVSLiBTbyB3ZSBoYXZlIHRvIGZpZ3VyZSBvdXQgaG93IGEgY29uZmlnIGNhbiB0cmln
Z2VyIHRoYXQgCihhbmQgaWYgd2UgaGF2ZSB0byBzdXBwb3J0IHRoYXQpLgoKLS0gCkNoZWVycwoK
RGF2aWQgLyBkaGlsZGVuYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
