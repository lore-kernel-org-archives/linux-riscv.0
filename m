Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C4ACCD188
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 10:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wgfAhvpwZbOdAtAGdYmgsqu8utvsU9yh+Y1B5Q6Btr8=; b=RabQEpHezgNdMy
	1tkzz8xlOmUp1tqmHTaEfSBy8h1m7Op5vjtmEVh5wFJ9R/P31/J1vTWm3pT8BFwfAmxh7IRJbsJC3
	c7nGYX5ax6Bl4rxHqv/hixuOWLE94pSYs1hC4AjLRdpH38IOc3gRNEpNxSxQ0wEmkFlONZtNyXE5a
	68EoblwEy54x9wQvSTlGePoUn+/3fUHhbmWtdsNLhg3/pICC/lJDNBx+F2cwAg+0SkJjf6Sziezwj
	7WZOIYiravA0NU7TCxSGnrF8olUXMXUJ8QMnyPLX2EMy/GDZCyzztc8eVYrNl1NmlQBYo+wwWFZWd
	+KCeLdvQVG3LRZXLbYBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nlJ-00000005m3P-2Otg;
	Thu, 09 Oct 2025 10:20:41 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nlG-00000005m2L-2jay;
	Thu, 09 Oct 2025 10:20:40 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cj548110xz9sSL;
	Thu,  9 Oct 2025 12:01:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qOLNCcqM6pFr; Thu,  9 Oct 2025 12:01:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cj5476tjqz9sSC;
	Thu,  9 Oct 2025 12:01:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D06108B76C;
	Thu,  9 Oct 2025 12:01:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id MfDghYtIuYkA; Thu,  9 Oct 2025 12:01:11 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 776CE8B767;
	Thu,  9 Oct 2025 12:01:09 +0200 (CEST)
Message-ID: <0c730c52-97ee-43ea-9697-ac11d2880ab7@csgroup.eu>
Date: Thu, 9 Oct 2025 12:01:08 +0200
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
 <03671aa8-4276-4707-9c75-83c96968cbb2@csgroup.eu>
 <1db15a30-72d6-4045-8aa1-68bd8411b0ba@redhat.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <1db15a30-72d6-4045-8aa1-68bd8411b0ba@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_032038_854274_4ADBD3DD 
X-CRM114-Status: GOOD (  19.44  )
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

CgpMZSAwOS8xMC8yMDI1IMOgIDExOjIwLCBEYXZpZCBIaWxkZW5icmFuZCBhIMOpY3JpdMKgOgo+
IE9uIDA5LjEwLjI1IDExOjE2LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pgo+Pgo+PiBMZSAw
OS8xMC8yMDI1IMOgIDEwOjE0LCBEYXZpZCBIaWxkZW5icmFuZCBhIMOpY3JpdMKgOgo+Pj4gT24g
MDkuMTAuMjUgMTA6MDQsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+Pj4KPj4+Pgo+Pj4+IExl
IDA5LzEwLzIwMjUgw6AgMDk6MjIsIERhdmlkIEhpbGRlbmJyYW5kIGEgw6ljcml0wqA6Cj4+Pj4+
IE9uIDA5LjEwLjI1IDA5OjE0LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pj4+Pj4gSGkgRGF2
aWQsCj4+Pj4+Pgo+Pj4+Pj4gTGUgMDEvMDkvMjAyNSDDoCAxNzowMywgRGF2aWQgSGlsZGVuYnJh
bmQgYSDDqWNyaXTCoDoKPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvbW0vaHVnZXRsYi5jIGIvbW0vaHVn
ZXRsYi5jCj4+Pj4+Pj4gaW5kZXggMWU3NzdjYzUxYWQwNC4uZDM1NDJlOTJhNzEyZSAxMDA2NDQK
Pj4+Pj4+PiAtLS0gYS9tbS9odWdldGxiLmMKPj4+Pj4+PiArKysgYi9tbS9odWdldGxiLmMKPj4+
Pj4+PiBAQCAtNDY1Nyw2ICs0NjU3LDcgQEAgc3RhdGljIGludCBfX2luaXQgaHVnZXRsYl9pbml0
KHZvaWQpCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBCVUlMRF9CVUdfT04oc2l6ZW9mX2ZpZWxk
KHN0cnVjdCBwYWdlLCBwcml2YXRlKSAqCj4+Pj4+Pj4gQklUU19QRVJfQllURSA8Cj4+Pj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19OUl9IUEFHRUZMQUdTKTsKPj4+Pj4+
PiArwqDCoMKgIEJVSUxEX0JVR19PTl9JTlZBTElEKEhVR0VUTEJfUEFHRV9PUkRFUiA+IE1BWF9G
T0xJT19PUkRFUik7Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWh1Z2VwYWdlc19zdXBw
b3J0ZWQoKSkgewo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaHVnZXRsYl9t
YXhfaHN0YXRlIHx8IAo+Pj4+Pj4+IGRlZmF1bHRfaHN0YXRlX21heF9odWdlX3BhZ2VzKQo+Pj4+
Pj4+IEBAIC00NzQwLDYgKzQ3NDEsNyBAQCB2b2lkIF9faW5pdCBodWdldGxiX2FkZF9oc3RhdGUo
dW5zaWduZWQgaW50Cj4+Pj4+Pj4gb3JkZXIpCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCB9Cj4+
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBCVUdfT04oaHVnZXRsYl9tYXhfaHN0YXRlID49IEhVR0Vf
TUFYX0hTVEFURSk7Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBCVUdfT04ob3JkZXIgPCBvcmRl
cl9iYXNlXzIoX19OUl9VU0VEX1NVQlBBR0UpKTsKPj4+Pj4+PiArwqDCoMKgIFdBUk5fT04ob3Jk
ZXIgPiBNQVhfRk9MSU9fT1JERVIpOwo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgaCA9ICZoc3Rh
dGVzW2h1Z2V0bGJfbWF4X2hzdGF0ZSsrXTsKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIF9fbXV0
ZXhfaW5pdCgmaC0+cmVzaXplX2xvY2ssICJyZXNpemUgbXV0ZXgiLCAmaC0gCj4+Pj4+Pj4gPnJl
c2l6ZV9rZXkpOwo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgaC0+b3JkZXIgPSBvcmRlcjsKPj4+
Pj4KPj4+Pj4gV2UgZW5kIHVwIHJlZ2lzdGVyaW5nIGh1Z2V0bGIgZm9saW9zIHRoYXQgYXJlIGJp
Z2dlciB0aGFuCj4+Pj4+IE1BWF9GT0xJT19PUkRFUi4gU28gd2UgaGF2ZSB0byBmaWd1cmUgb3V0
IGhvdyBhIGNvbmZpZyBjYW4gdHJpZ2dlciAKPj4+Pj4gdGhhdAo+Pj4+PiAoYW5kIGlmIHdlIGhh
dmUgdG8gc3VwcG9ydCB0aGF0KS4KPj4+Pj4KPj4+Pgo+Pj4+IE1BWF9GT0xJT19PUkRFUiBpcyBk
ZWZpbmVkIGFzOgo+Pj4+Cj4+Pj4gI2lmZGVmIENPTkZJR19BUkNIX0hBU19HSUdBTlRJQ19QQUdF
Cj4+Pj4gI2RlZmluZSBNQVhfRk9MSU9fT1JERVLCoMKgwqDCoMKgwqDCoCBQVURfT1JERVIKPj4+
PiAjZWxzZQo+Pj4+ICNkZWZpbmUgTUFYX0ZPTElPX09SREVSwqDCoMKgwqDCoMKgwqAgTUFYX1BB
R0VfT1JERVIKPj4+PiAjZW5kaWYKPj4+Pgo+Pj4+IE1BWF9QQUdFX09SREVSIGlzIHRoZSBsaW1p
dCBmb3IgZHluYW1pYyBjcmVhdGlvbiBvZiBodWdlcGFnZXMgdmlhCj4+Pj4gL3N5cy9rZXJuZWwv
bW0vaHVnZXBhZ2VzLyBidXQgYmlnZ2VyIHBhZ2VzIGNhbiBiZSBjcmVhdGVkIGF0IGJvb3R0aW1l
Cj4+Pj4gd2l0aCBrZXJuZWwgYm9vdCBwYXJhbWV0ZXJzIHdpdGhvdXQgQ09ORklHX0FSQ0hfSEFT
X0dJR0FOVElDX1BBR0U6Cj4+Pj4KPj4+PiDCoMKgwqDCoCBodWdlcGFnZXN6PTY0bSBodWdlcGFn
ZXM9MSBodWdlcGFnZXN6PTI1Nm0gaHVnZXBhZ2VzPTEKPj4+Pgo+Pj4+IEdpdmVzOgo+Pj4+Cj4+
Pj4gSHVnZVRMQjogcmVnaXN0ZXJlZCAxLjAwIEdpQiBwYWdlIHNpemUsIHByZS1hbGxvY2F0ZWQg
MCBwYWdlcwo+Pj4+IEh1Z2VUTEI6IDAgS2lCIHZtZW1tYXAgY2FuIGJlIGZyZWVkIGZvciBhIDEu
MDAgR2lCIHBhZ2UKPj4+PiBIdWdlVExCOiByZWdpc3RlcmVkIDY0LjAgTWlCIHBhZ2Ugc2l6ZSwg
cHJlLWFsbG9jYXRlZCAxIHBhZ2VzCj4+Pj4gSHVnZVRMQjogMCBLaUIgdm1lbW1hcCBjYW4gYmUg
ZnJlZWQgZm9yIGEgNjQuMCBNaUIgcGFnZQo+Pj4+IEh1Z2VUTEI6IHJlZ2lzdGVyZWQgMjU2IE1p
QiBwYWdlIHNpemUsIHByZS1hbGxvY2F0ZWQgMSBwYWdlcwo+Pj4+IEh1Z2VUTEI6IDAgS2lCIHZt
ZW1tYXAgY2FuIGJlIGZyZWVkIGZvciBhIDI1NiBNaUIgcGFnZQo+Pj4+IEh1Z2VUTEI6IHJlZ2lz
dGVyZWQgNC4wMCBNaUIgcGFnZSBzaXplLCBwcmUtYWxsb2NhdGVkIDAgcGFnZXMKPj4+PiBIdWdl
VExCOiAwIEtpQiB2bWVtbWFwIGNhbiBiZSBmcmVlZCBmb3IgYSA0LjAwIE1pQiBwYWdlCj4+Pj4g
SHVnZVRMQjogcmVnaXN0ZXJlZCAxNi4wIE1pQiBwYWdlIHNpemUsIHByZS1hbGxvY2F0ZWQgMCBw
YWdlcwo+Pj4+IEh1Z2VUTEI6IDAgS2lCIHZtZW1tYXAgY2FuIGJlIGZyZWVkIGZvciBhIDE2LjAg
TWlCIHBhZ2UKPj4+Cj4+PiBJIHRoaW5rIGl0J3MgYSB2aW9sYXRpb24gb2YgQ09ORklHX0FSQ0hf
SEFTX0dJR0FOVElDX1BBR0UuIFRoZSBleGlzdGluZwo+Pj4gZm9saW9fZHVtcCgpIGNvZGUgd291
bGQgbm90IGhhbmRsZSBpdCBjb3JyZWN0bHkgYXMgd2VsbC4KPj4KPj4gSSdtIHRyeWluZyB0byBk
aWcgaW50byBoaXN0b3J5IGFuZCB3aGVuIGxvb2tpbmcgYXQgY29tbWl0IDRlYjA3MTZlODY4ZQo+
PiAoImh1Z2V0bGI6IGFsbG93IHRvIGZyZWUgZ2lnYW50aWMgcGFnZXMgcmVnYXJkbGVzcyBvZiB0
aGUKPj4gY29uZmlndXJhdGlvbiIpIEkgdW5kZXJzdGFuZCB0aGF0IENPTkZJR19BUkNIX0hBU19H
SUdBTlRJQ19QQUdFIGlzCj4+IG5lZWRlZCB0byBiZSBhYmxlIHRvIGFsbG9jYXRlIGdpZ2FudGlj
IHBhZ2VzIGF0IHJ1bnRpbWUuIEl0IGlzIG5vdAo+PiBuZWVkZWQgdG8gcmVzZXJ2ZSBnaWdhbnRp
YyBwYWdlcyBhdCBib290dGltZS4KPj4KPj4gV2hhdCBhbSBJIG1pc3NpbmcgPwo+IAo+IFRoYXQg
Q09ORklHX0FSQ0hfSEFTX0dJR0FOVElDX1BBR0UgaGFzIG5vdGhpbmcgcnVudGltZS1zcGVjaWZp
YyBpbiBpdHMgCj4gbmFtZS4KCkluIGl0cyBuYW1lIGZvciBzdXJlLCBidXQgdGhlIGNvbW1pdCBJ
IG1lbnRpb24gc2F5czoKCiAgICAgT24gc3lzdGVtcyB3aXRob3V0IENPTlRJR19BTExPQyBhY3Rp
dmF0ZWQgYnV0IHRoYXQgc3VwcG9ydCBnaWdhbnRpYyAKcGFnZXMsCiAgICAgYm9vdHRpbWUgcmVz
ZXJ2ZWQgZ2lnYW50aWMgcGFnZXMgY2FuIG5vdCBiZSBmcmVlZCBhdCBhbGwuICBUaGlzIHBhdGNo
CiAgICAgc2ltcGx5IGVuYWJsZXMgdGhlIHBvc3NpYmlsaXR5IHRvIGhhbmQgYmFjayB0aG9zZSBw
YWdlcyB0byBtZW1vcnkKICAgICBhbGxvY2F0b3IuCgpBbmQgb25lIG9mIHRoZSBodW5rcyBpczoK
CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L0tjb25maWcgYi9hcmNoL2FybTY0L0tjb25maWcKaW5k
ZXggN2Y3ZmJkOGJkOWQ1Yi4uN2ExYWE1M2QxODhkMyAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9L
Y29uZmlnCisrKyBiL2FyY2gvYXJtNjQvS2NvbmZpZwpAQCAtMTksNyArMTksNyBAQCBjb25maWcg
QVJNNjQKICAgICAgICAgc2VsZWN0IEFSQ0hfSEFTX0ZBU1RfTVVMVElQTElFUgogICAgICAgICBz
ZWxlY3QgQVJDSF9IQVNfRk9SVElGWV9TT1VSQ0UKICAgICAgICAgc2VsZWN0IEFSQ0hfSEFTX0dD
T1ZfUFJPRklMRV9BTEwKLSAgICAgICBzZWxlY3QgQVJDSF9IQVNfR0lHQU5USUNfUEFHRSBpZiBD
T05USUdfQUxMT0MKKyAgICAgICBzZWxlY3QgQVJDSF9IQVNfR0lHQU5USUNfUEFHRQogICAgICAg
ICBzZWxlY3QgQVJDSF9IQVNfS0NPVgogICAgICAgICBzZWxlY3QgQVJDSF9IQVNfS0VFUElOSVRS
RAogICAgICAgICBzZWxlY3QgQVJDSF9IQVNfTUVNQkFSUklFUl9TWU5DX0NPUkUKClNvIEkgdW5k
ZXJzdGFuZCBmcm9tIHRoZSBjb21taXQgbWVzc2FnZSB0aGF0IGl0IHdhcyBwb3NzaWJsZSBhdCB0
aGF0IAp0aW1lIHRvIGhhdmUgZ2lnYW50aWMgcGFnZXMgd2l0aG91dCBBUkNIX0hBU19HSUdBTlRJ
Q19QQUdFIGFzIGxvbmcgYXMgCnlvdSBkaWRuJ3QgaGF2ZSB0byBiZSBhYmxlIHRvIGZyZWUgdGhl
bSBkdXJpbmcgcnVudGltZS4KCj4gCj4gQ2FuJ3Qgd2UganVzdCBzZWxlY3QgQ09ORklHX0FSQ0hf
SEFTX0dJR0FOVElDX1BBR0UgZm9yIHRoZSByZWxldmFudCAKPiBodWdldGxiIGNvbmZpZyB0aGF0
IGFsbG93cyBmb3IgKmdpZ2FudGljIHBhZ2VzKi4KPiAKCldlIHByb2JhYmx5IGNhbiwgYnV0IEkn
ZCByZWFsbHkgbGlrZSB0byB1bmRlcnN0YW5kIGhpc3RvcnkgYW5kIGhvdyB3ZSAKZW5kZWQgdXAg
aW4gdGhlIHNpdHVhdGlvbiB3ZSBhcmUgbm93LgpCZWNhdXNlIGJsaW5kIGZpeGVzIG9mdGVuIGxl
YWQgdG8gbW9yZSBwcm9ibGVtcy4KCklmIEkgZm9sbG93IHRoaW5ncyBjb3JyZWN0bHkgSSBzZWUg
YSBoZWxwZXIgZ2lnYW50aWNfcGFnZV9zdXBwb3J0ZWQoKSAKYWRkZWQgYnkgY29tbWl0IDk0NGQ5
ZmVjOGQ3YSAoImh1Z2V0bGI6IGFkZCBzdXBwb3J0IGZvciBnaWdhbnRpYyBwYWdlIAphbGxvY2F0
aW9uIGF0IHJ1bnRpbWUiKS4KCkFuZCB0aGVuIGNvbW1pdCA0NjFhNzE4NDMyMGEgKCJtbS9odWdl
dGxiOiBpbnRyb2R1Y2UgCkFSQ0hfSEFTX0dJR0FOVElDX1BBR0UiKSBpcyBhZGRlZCB0byB3cmFw
IGdpZ2FudGljX3BhZ2Vfc3VwcG9ydGVkKCkKClRoZW4gY29tbWl0IDRlYjA3MTZlODY4ZSAoImh1
Z2V0bGI6IGFsbG93IHRvIGZyZWUgZ2lnYW50aWMgcGFnZXMgCnJlZ2FyZGxlc3Mgb2YgdGhlIGNv
bmZpZ3VyYXRpb24iKSBjaGFuZ2VkIGdpZ2FudGljX3BhZ2Vfc3VwcG9ydGVkKCkgdG8gCmdpZ2Fu
dGljX3BhZ2VfcnVudGltZV9zdXBwb3J0ZWQoKQoKU28gd2hlcmUgYXJlIHdlIG5vdyA/CgpDaHJp
c3RvcGhlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
