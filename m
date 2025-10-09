Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E962CCD187
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 08:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jBcQqhUV7s5qkS4NP7wNC5ru/W/0wOwhYGYV59sXlCE=; b=y9bX7aX+tnUUhB
	u5MMg1bL5un/Vdcr+qSSNp4YkzE9aeGzKT6ZKFBflbbyLZf5EQpJWyG5QOq0dcyKtnuGaRE3tEysT
	pq67NRn4edB0vIgHIh5gRtv4jUbtOj8YFy1AgJRDO2E8Y7YOthfptR8P4U8K0hWJxTOYTfbPVP8wa
	WHE4/6ZrVwSpPP9+YlIvHAA3kPYmA7CbZl3xEV/+aj+qk2/9lMirEvoCIi5Byy5ZEBVFC640Ha2Ug
	fg/cV7OwN9Jyjy0HubFZjXrzuypo0J/5/KQqAusvwIDSXaaxApcaA8e6iveL9ug8G60Gf1QYNawrJ
	gn+QD0G7QOMG2HOKY3MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lt9-00000005V3g-1tos;
	Thu, 09 Oct 2025 08:20:39 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lt6-00000005V2b-4BDj;
	Thu, 09 Oct 2025 08:20:38 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cj2Td0Mj6z9sSL;
	Thu,  9 Oct 2025 10:04:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qQ36Dhni13kk; Thu,  9 Oct 2025 10:04:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cj2Tc5kJ8z9sSC;
	Thu,  9 Oct 2025 10:04:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A8FDF8B770;
	Thu,  9 Oct 2025 10:04:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id CnXkw3FAfnqR; Thu,  9 Oct 2025 10:04:36 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AE04F8B76D;
	Thu,  9 Oct 2025 10:04:34 +0200 (CEST)
Message-ID: <faf62f20-8844-42a0-a7a7-846d8ead0622@csgroup.eu>
Date: Thu, 9 Oct 2025 10:04:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (bisected) [PATCH v2 08/37] mm/hugetlb: check for unreasonable
 folio sizes when registering hstate
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
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
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <d3fc12d4-0b59-4b1f-bb5c-13189a01e13d@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_012037_189572_7C7964ED 
X-CRM114-Status: GOOD (  10.62  )
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

CgpMZSAwOS8xMC8yMDI1IMOgIDA5OjIyLCBEYXZpZCBIaWxkZW5icmFuZCBhIMOpY3JpdMKgOgo+
IE9uIDA5LjEwLjI1IDA5OjE0LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+PiBIaSBEYXZpZCwK
Pj4KPj4gTGUgMDEvMDkvMjAyNSDDoCAxNzowMywgRGF2aWQgSGlsZGVuYnJhbmQgYSDDqWNyaXTC
oDoKPj4+IGRpZmYgLS1naXQgYS9tbS9odWdldGxiLmMgYi9tbS9odWdldGxiLmMKPj4+IGluZGV4
IDFlNzc3Y2M1MWFkMDQuLmQzNTQyZTkyYTcxMmUgMTAwNjQ0Cj4+PiAtLS0gYS9tbS9odWdldGxi
LmMKPj4+ICsrKyBiL21tL2h1Z2V0bGIuYwo+Pj4gQEAgLTQ2NTcsNiArNDY1Nyw3IEBAIHN0YXRp
YyBpbnQgX19pbml0IGh1Z2V0bGJfaW5pdCh2b2lkKQo+Pj4gwqDCoMKgwqDCoMKgIEJVSUxEX0JV
R19PTihzaXplb2ZfZmllbGQoc3RydWN0IHBhZ2UsIHByaXZhdGUpICogQklUU19QRVJfQllURSA8
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fTlJfSFBBR0VGTEFHUyk7Cj4+PiAr
wqDCoMKgIEJVSUxEX0JVR19PTl9JTlZBTElEKEhVR0VUTEJfUEFHRV9PUkRFUiA+IE1BWF9GT0xJ
T19PUkRFUik7Cj4+PiDCoMKgwqDCoMKgwqAgaWYgKCFodWdlcGFnZXNfc3VwcG9ydGVkKCkpIHsK
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChodWdldGxiX21heF9oc3RhdGUgfHwgZGVmYXVs
dF9oc3RhdGVfbWF4X2h1Z2VfcGFnZXMpCj4+PiBAQCAtNDc0MCw2ICs0NzQxLDcgQEAgdm9pZCBf
X2luaXQgaHVnZXRsYl9hZGRfaHN0YXRlKHVuc2lnbmVkIGludCBvcmRlcikKPj4+IMKgwqDCoMKg
wqDCoCB9Cj4+PiDCoMKgwqDCoMKgwqAgQlVHX09OKGh1Z2V0bGJfbWF4X2hzdGF0ZSA+PSBIVUdF
X01BWF9IU1RBVEUpOwo+Pj4gwqDCoMKgwqDCoMKgIEJVR19PTihvcmRlciA8IG9yZGVyX2Jhc2Vf
MihfX05SX1VTRURfU1VCUEFHRSkpOwo+Pj4gK8KgwqDCoCBXQVJOX09OKG9yZGVyID4gTUFYX0ZP
TElPX09SREVSKTsKPj4+IMKgwqDCoMKgwqDCoCBoID0gJmhzdGF0ZXNbaHVnZXRsYl9tYXhfaHN0
YXRlKytdOwo+Pj4gwqDCoMKgwqDCoMKgIF9fbXV0ZXhfaW5pdCgmaC0+cmVzaXplX2xvY2ssICJy
ZXNpemUgbXV0ZXgiLCAmaC0+cmVzaXplX2tleSk7Cj4+PiDCoMKgwqDCoMKgwqAgaC0+b3JkZXIg
PSBvcmRlcjsKPiAKPiBXZSBlbmQgdXAgcmVnaXN0ZXJpbmcgaHVnZXRsYiBmb2xpb3MgdGhhdCBh
cmUgYmlnZ2VyIHRoYW4gCj4gTUFYX0ZPTElPX09SREVSLiBTbyB3ZSBoYXZlIHRvIGZpZ3VyZSBv
dXQgaG93IGEgY29uZmlnIGNhbiB0cmlnZ2VyIHRoYXQgCj4gKGFuZCBpZiB3ZSBoYXZlIHRvIHN1
cHBvcnQgdGhhdCkuCj4gCgpNQVhfRk9MSU9fT1JERVIgaXMgZGVmaW5lZCBhczoKCiNpZmRlZiBD
T05GSUdfQVJDSF9IQVNfR0lHQU5USUNfUEFHRQojZGVmaW5lIE1BWF9GT0xJT19PUkRFUgkJUFVE
X09SREVSCiNlbHNlCiNkZWZpbmUgTUFYX0ZPTElPX09SREVSCQlNQVhfUEFHRV9PUkRFUgojZW5k
aWYKCk1BWF9QQUdFX09SREVSIGlzIHRoZSBsaW1pdCBmb3IgZHluYW1pYyBjcmVhdGlvbiBvZiBo
dWdlcGFnZXMgdmlhIAovc3lzL2tlcm5lbC9tbS9odWdlcGFnZXMvIGJ1dCBiaWdnZXIgcGFnZXMg
Y2FuIGJlIGNyZWF0ZWQgYXQgYm9vdHRpbWUgCndpdGgga2VybmVsIGJvb3QgcGFyYW1ldGVycyB3
aXRob3V0IENPTkZJR19BUkNIX0hBU19HSUdBTlRJQ19QQUdFOgoKICAgaHVnZXBhZ2Vzej02NG0g
aHVnZXBhZ2VzPTEgaHVnZXBhZ2Vzej0yNTZtIGh1Z2VwYWdlcz0xCgpHaXZlczoKCkh1Z2VUTEI6
IHJlZ2lzdGVyZWQgMS4wMCBHaUIgcGFnZSBzaXplLCBwcmUtYWxsb2NhdGVkIDAgcGFnZXMKSHVn
ZVRMQjogMCBLaUIgdm1lbW1hcCBjYW4gYmUgZnJlZWQgZm9yIGEgMS4wMCBHaUIgcGFnZQpIdWdl
VExCOiByZWdpc3RlcmVkIDY0LjAgTWlCIHBhZ2Ugc2l6ZSwgcHJlLWFsbG9jYXRlZCAxIHBhZ2Vz
Ckh1Z2VUTEI6IDAgS2lCIHZtZW1tYXAgY2FuIGJlIGZyZWVkIGZvciBhIDY0LjAgTWlCIHBhZ2UK
SHVnZVRMQjogcmVnaXN0ZXJlZCAyNTYgTWlCIHBhZ2Ugc2l6ZSwgcHJlLWFsbG9jYXRlZCAxIHBh
Z2VzCkh1Z2VUTEI6IDAgS2lCIHZtZW1tYXAgY2FuIGJlIGZyZWVkIGZvciBhIDI1NiBNaUIgcGFn
ZQpIdWdlVExCOiByZWdpc3RlcmVkIDQuMDAgTWlCIHBhZ2Ugc2l6ZSwgcHJlLWFsbG9jYXRlZCAw
IHBhZ2VzCkh1Z2VUTEI6IDAgS2lCIHZtZW1tYXAgY2FuIGJlIGZyZWVkIGZvciBhIDQuMDAgTWlC
IHBhZ2UKSHVnZVRMQjogcmVnaXN0ZXJlZCAxNi4wIE1pQiBwYWdlIHNpemUsIHByZS1hbGxvY2F0
ZWQgMCBwYWdlcwpIdWdlVExCOiAwIEtpQiB2bWVtbWFwIGNhbiBiZSBmcmVlZCBmb3IgYSAxNi4w
IE1pQiBwYWdlCgoKQ2hyaXN0b3BoZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
