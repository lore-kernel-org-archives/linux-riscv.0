Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA367CCD187
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 09:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m8r3kpiHuV+iYrcuKs5zEhzclMuOtFgQK88aweBY9EY=; b=QmkqWP0NXNCAg5
	UZvqKaVxUXwM2hcFM5nNbn1f5VdJqhdfHyO7Hv/AlDUQ5bAuCXn9qCxgda/n1lXufOgXdQtyu+LyR
	LtIYa2zin9P8l0tdjD6rMzPTASmoZc//uK15wm9uJlhMCgh1I9BScZekjxl3XKz2YOGA4LiyfJ6Em
	t9jovEn+b8O2YpA4/kh1/kbSar6Ks4ynV0VMNlTmXabUWfnJhtREAt8aGZDuEJFm6ogVHtqpzoYHZ
	U3dGcRX+WMTycYzfOU5lbV3/wQkH5s9DpVZrX2JefXeWeBTti2XnT3amQhe8sQhZf3CMk0TXTJDrJ
	Zp9iKbfSI8lXVnF5z/Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nIM-00000005hN0-448K;
	Thu, 09 Oct 2025 09:50:46 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nIJ-00000005hLI-185O;
	Thu, 09 Oct 2025 09:50:45 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cj4530nVNz9sSY;
	Thu,  9 Oct 2025 11:16:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1xW49BLVjvgf; Thu,  9 Oct 2025 11:16:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cj4526L27z9sSX;
	Thu,  9 Oct 2025 11:16:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BC2658B773;
	Thu,  9 Oct 2025 11:16:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ecZHQXz6ERX1; Thu,  9 Oct 2025 11:16:54 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BE4258B770;
	Thu,  9 Oct 2025 11:16:52 +0200 (CEST)
Message-ID: <03671aa8-4276-4707-9c75-83c96968cbb2@csgroup.eu>
Date: Thu, 9 Oct 2025 11:16:52 +0200
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
 <faf62f20-8844-42a0-a7a7-846d8ead0622@csgroup.eu>
 <9361c75a-ab37-4d7f-8680-9833430d93d4@redhat.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <9361c75a-ab37-4d7f-8680-9833430d93d4@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_025043_477717_AB2DF752 
X-CRM114-Status: GOOD (  13.80  )
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

CgpMZSAwOS8xMC8yMDI1IMOgIDEwOjE0LCBEYXZpZCBIaWxkZW5icmFuZCBhIMOpY3JpdMKgOgo+
IE9uIDA5LjEwLjI1IDEwOjA0LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pgo+Pgo+PiBMZSAw
OS8xMC8yMDI1IMOgIDA5OjIyLCBEYXZpZCBIaWxkZW5icmFuZCBhIMOpY3JpdMKgOgo+Pj4gT24g
MDkuMTAuMjUgMDk6MTQsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+Pj4gSGkgRGF2aWQsCj4+
Pj4KPj4+PiBMZSAwMS8wOS8yMDI1IMOgIDE3OjAzLCBEYXZpZCBIaWxkZW5icmFuZCBhIMOpY3Jp
dMKgOgo+Pj4+PiBkaWZmIC0tZ2l0IGEvbW0vaHVnZXRsYi5jIGIvbW0vaHVnZXRsYi5jCj4+Pj4+
IGluZGV4IDFlNzc3Y2M1MWFkMDQuLmQzNTQyZTkyYTcxMmUgMTAwNjQ0Cj4+Pj4+IC0tLSBhL21t
L2h1Z2V0bGIuYwo+Pj4+PiArKysgYi9tbS9odWdldGxiLmMKPj4+Pj4gQEAgLTQ2NTcsNiArNDY1
Nyw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGh1Z2V0bGJfaW5pdCh2b2lkKQo+Pj4+PiDCoMKgwqDC
oMKgwqDCoCBCVUlMRF9CVUdfT04oc2l6ZW9mX2ZpZWxkKHN0cnVjdCBwYWdlLCBwcml2YXRlKSAq
IAo+Pj4+PiBCSVRTX1BFUl9CWVRFIDwKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIF9fTlJfSFBBR0VGTEFHUyk7Cj4+Pj4+ICvCoMKgwqAgQlVJTERfQlVHX09OX0lOVkFMSUQo
SFVHRVRMQl9QQUdFX09SREVSID4gTUFYX0ZPTElPX09SREVSKTsKPj4+Pj4gwqDCoMKgwqDCoMKg
wqAgaWYgKCFodWdlcGFnZXNfc3VwcG9ydGVkKCkpIHsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiAoaHVnZXRsYl9tYXhfaHN0YXRlIHx8IGRlZmF1bHRfaHN0YXRlX21heF9odWdlX3Bh
Z2VzKQo+Pj4+PiBAQCAtNDc0MCw2ICs0NzQxLDcgQEAgdm9pZCBfX2luaXQgaHVnZXRsYl9hZGRf
aHN0YXRlKHVuc2lnbmVkIGludCAKPj4+Pj4gb3JkZXIpCj4+Pj4+IMKgwqDCoMKgwqDCoMKgIH0K
Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgQlVHX09OKGh1Z2V0bGJfbWF4X2hzdGF0ZSA+PSBIVUdFX01B
WF9IU1RBVEUpOwo+Pj4+PiDCoMKgwqDCoMKgwqDCoCBCVUdfT04ob3JkZXIgPCBvcmRlcl9iYXNl
XzIoX19OUl9VU0VEX1NVQlBBR0UpKTsKPj4+Pj4gK8KgwqDCoCBXQVJOX09OKG9yZGVyID4gTUFY
X0ZPTElPX09SREVSKTsKPj4+Pj4gwqDCoMKgwqDCoMKgwqAgaCA9ICZoc3RhdGVzW2h1Z2V0bGJf
bWF4X2hzdGF0ZSsrXTsKPj4+Pj4gwqDCoMKgwqDCoMKgwqAgX19tdXRleF9pbml0KCZoLT5yZXNp
emVfbG9jaywgInJlc2l6ZSBtdXRleCIsICZoLT5yZXNpemVfa2V5KTsKPj4+Pj4gwqDCoMKgwqDC
oMKgwqAgaC0+b3JkZXIgPSBvcmRlcjsKPj4+Cj4+PiBXZSBlbmQgdXAgcmVnaXN0ZXJpbmcgaHVn
ZXRsYiBmb2xpb3MgdGhhdCBhcmUgYmlnZ2VyIHRoYW4KPj4+IE1BWF9GT0xJT19PUkRFUi4gU28g
d2UgaGF2ZSB0byBmaWd1cmUgb3V0IGhvdyBhIGNvbmZpZyBjYW4gdHJpZ2dlciB0aGF0Cj4+PiAo
YW5kIGlmIHdlIGhhdmUgdG8gc3VwcG9ydCB0aGF0KS4KPj4+Cj4+Cj4+IE1BWF9GT0xJT19PUkRF
UiBpcyBkZWZpbmVkIGFzOgo+Pgo+PiAjaWZkZWYgQ09ORklHX0FSQ0hfSEFTX0dJR0FOVElDX1BB
R0UKPj4gI2RlZmluZSBNQVhfRk9MSU9fT1JERVLCoMKgwqDCoMKgwqDCoCBQVURfT1JERVIKPj4g
I2Vsc2UKPj4gI2RlZmluZSBNQVhfRk9MSU9fT1JERVLCoMKgwqDCoMKgwqDCoCBNQVhfUEFHRV9P
UkRFUgo+PiAjZW5kaWYKPj4KPj4gTUFYX1BBR0VfT1JERVIgaXMgdGhlIGxpbWl0IGZvciBkeW5h
bWljIGNyZWF0aW9uIG9mIGh1Z2VwYWdlcyB2aWEKPj4gL3N5cy9rZXJuZWwvbW0vaHVnZXBhZ2Vz
LyBidXQgYmlnZ2VyIHBhZ2VzIGNhbiBiZSBjcmVhdGVkIGF0IGJvb3R0aW1lCj4+IHdpdGgga2Vy
bmVsIGJvb3QgcGFyYW1ldGVycyB3aXRob3V0IENPTkZJR19BUkNIX0hBU19HSUdBTlRJQ19QQUdF
Ogo+Pgo+PiDCoMKgwqAgaHVnZXBhZ2Vzej02NG0gaHVnZXBhZ2VzPTEgaHVnZXBhZ2Vzej0yNTZt
IGh1Z2VwYWdlcz0xCj4+Cj4+IEdpdmVzOgo+Pgo+PiBIdWdlVExCOiByZWdpc3RlcmVkIDEuMDAg
R2lCIHBhZ2Ugc2l6ZSwgcHJlLWFsbG9jYXRlZCAwIHBhZ2VzCj4+IEh1Z2VUTEI6IDAgS2lCIHZt
ZW1tYXAgY2FuIGJlIGZyZWVkIGZvciBhIDEuMDAgR2lCIHBhZ2UKPj4gSHVnZVRMQjogcmVnaXN0
ZXJlZCA2NC4wIE1pQiBwYWdlIHNpemUsIHByZS1hbGxvY2F0ZWQgMSBwYWdlcwo+PiBIdWdlVExC
OiAwIEtpQiB2bWVtbWFwIGNhbiBiZSBmcmVlZCBmb3IgYSA2NC4wIE1pQiBwYWdlCj4+IEh1Z2VU
TEI6IHJlZ2lzdGVyZWQgMjU2IE1pQiBwYWdlIHNpemUsIHByZS1hbGxvY2F0ZWQgMSBwYWdlcwo+
PiBIdWdlVExCOiAwIEtpQiB2bWVtbWFwIGNhbiBiZSBmcmVlZCBmb3IgYSAyNTYgTWlCIHBhZ2UK
Pj4gSHVnZVRMQjogcmVnaXN0ZXJlZCA0LjAwIE1pQiBwYWdlIHNpemUsIHByZS1hbGxvY2F0ZWQg
MCBwYWdlcwo+PiBIdWdlVExCOiAwIEtpQiB2bWVtbWFwIGNhbiBiZSBmcmVlZCBmb3IgYSA0LjAw
IE1pQiBwYWdlCj4+IEh1Z2VUTEI6IHJlZ2lzdGVyZWQgMTYuMCBNaUIgcGFnZSBzaXplLCBwcmUt
YWxsb2NhdGVkIDAgcGFnZXMKPj4gSHVnZVRMQjogMCBLaUIgdm1lbW1hcCBjYW4gYmUgZnJlZWQg
Zm9yIGEgMTYuMCBNaUIgcGFnZQo+IAo+IEkgdGhpbmsgaXQncyBhIHZpb2xhdGlvbiBvZiBDT05G
SUdfQVJDSF9IQVNfR0lHQU5USUNfUEFHRS4gVGhlIGV4aXN0aW5nIAo+IGZvbGlvX2R1bXAoKSBj
b2RlIHdvdWxkIG5vdCBoYW5kbGUgaXQgY29ycmVjdGx5IGFzIHdlbGwuCgpJJ20gdHJ5aW5nIHRv
IGRpZyBpbnRvIGhpc3RvcnkgYW5kIHdoZW4gbG9va2luZyBhdCBjb21taXQgNGViMDcxNmU4Njhl
IAooImh1Z2V0bGI6IGFsbG93IHRvIGZyZWUgZ2lnYW50aWMgcGFnZXMgcmVnYXJkbGVzcyBvZiB0
aGUgCmNvbmZpZ3VyYXRpb24iKSBJIHVuZGVyc3RhbmQgdGhhdCBDT05GSUdfQVJDSF9IQVNfR0lH
QU5USUNfUEFHRSBpcyAKbmVlZGVkIHRvIGJlIGFibGUgdG8gYWxsb2NhdGUgZ2lnYW50aWMgcGFn
ZXMgYXQgcnVudGltZS4gSXQgaXMgbm90IApuZWVkZWQgdG8gcmVzZXJ2ZSBnaWdhbnRpYyBwYWdl
cyBhdCBib290dGltZS4KCldoYXQgYW0gSSBtaXNzaW5nID8KCj4gCj4gU2VlIGhvdyBzbmFwc2hv
dF9wYWdlKCkgdXNlcyBNQVhfRk9MSU9fTlJfUEFHRVMuCj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
