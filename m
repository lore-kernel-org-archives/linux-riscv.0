Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54668CCD184
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 12:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3o0sdI2vYKDbETQwVXVBfE6wvK9PDuhECe59vBUfwZo=; b=tBtVoLvavpEmkQ
	2ma3wos1M97lJH5rn5Y76R/5K4YkjLTkOXm4h2OHiaFyTdPN0GvxdhjnTiylzNNNq76lBve8O7sif
	i4xK2r/UcE1e0cwK1uyD48q2g5aQRXGCp+vCnnVloDiguoQD/VjxyfToKBYXvhXEyndjyLoHlWolc
	GZyQ0MhWrSORj2vMr66Onz0Ielpm5X4hJnjv+TERlGGE0R94rcPkga8+UMe1zRg7+42BE78zcVnRr
	hkuosntV9rCGVUDIoxa8HANY46xe4mMPtJggHJIve9LfvcvDi9zJ+TU7mZ8on7GWKlmsP1kQglbeq
	dT2AG0yGvrLcYsoSQ4kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6pdO-000000064be-0atK;
	Thu, 09 Oct 2025 12:20:38 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6pdL-000000064ar-1F4y;
	Thu, 09 Oct 2025 12:20:36 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cj7tc3BBqz9sSy;
	Thu,  9 Oct 2025 14:08:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t-GI2jPxTJia; Thu,  9 Oct 2025 14:08:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cj7tc1MWCz9sSv;
	Thu,  9 Oct 2025 14:08:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 08F7B8B76C;
	Thu,  9 Oct 2025 14:08:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id dX5DSkuE_w6O; Thu,  9 Oct 2025 14:08:07 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BC52E8B767;
	Thu,  9 Oct 2025 14:08:05 +0200 (CEST)
Message-ID: <4632e721-0ac8-4d72-a8ed-e6c928eee94d@csgroup.eu>
Date: Thu, 9 Oct 2025 14:08:05 +0200
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
 <0c730c52-97ee-43ea-9697-ac11d2880ab7@csgroup.eu>
 <543e9440-8ee0-4d9e-9b05-0107032d665b@redhat.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <543e9440-8ee0-4d9e-9b05-0107032d665b@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_052035_509972_A866D734 
X-CRM114-Status: GOOD (  42.75  )
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

CgpMZSAwOS8xMC8yMDI1IMOgIDEyOjI3LCBEYXZpZCBIaWxkZW5icmFuZCBhIMOpY3JpdMKgOgo+
IE9uIDA5LjEwLjI1IDEyOjAxLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pgo+Pgo+PiBMZSAw
OS8xMC8yMDI1IMOgIDExOjIwLCBEYXZpZCBIaWxkZW5icmFuZCBhIMOpY3JpdMKgOgo+Pj4gT24g
MDkuMTAuMjUgMTE6MTYsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+Pj4KPj4+Pgo+Pj4+IExl
IDA5LzEwLzIwMjUgw6AgMTA6MTQsIERhdmlkIEhpbGRlbmJyYW5kIGEgw6ljcml0wqA6Cj4+Pj4+
IE9uIDA5LjEwLjI1IDEwOjA0LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+
Cj4+Pj4+PiBMZSAwOS8xMC8yMDI1IMOgIDA5OjIyLCBEYXZpZCBIaWxkZW5icmFuZCBhIMOpY3Jp
dMKgOgo+Pj4+Pj4+IE9uIDA5LjEwLjI1IDA5OjE0LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+
Pj4+Pj4+PiBIaSBEYXZpZCwKPj4+Pj4+Pj4KPj4+Pj4+Pj4gTGUgMDEvMDkvMjAyNSDDoCAxNzow
MywgRGF2aWQgSGlsZGVuYnJhbmQgYSDDqWNyaXTCoDoKPj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9t
bS9odWdldGxiLmMgYi9tbS9odWdldGxiLmMKPj4+Pj4+Pj4+IGluZGV4IDFlNzc3Y2M1MWFkMDQu
LmQzNTQyZTkyYTcxMmUgMTAwNjQ0Cj4+Pj4+Pj4+PiAtLS0gYS9tbS9odWdldGxiLmMKPj4+Pj4+
Pj4+ICsrKyBiL21tL2h1Z2V0bGIuYwo+Pj4+Pj4+Pj4gQEAgLTQ2NTcsNiArNDY1Nyw3IEBAIHN0
YXRpYyBpbnQgX19pbml0IGh1Z2V0bGJfaW5pdCh2b2lkKQo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgIEJVSUxEX0JVR19PTihzaXplb2ZfZmllbGQoc3RydWN0IHBhZ2UsIHByaXZhdGUpICoK
Pj4+Pj4+Pj4+IEJJVFNfUEVSX0JZVEUgPAo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBfX05SX0hQQUdFRkxBR1MpOwo+Pj4+Pj4+Pj4gK8KgwqDCoCBCVUlMRF9C
VUdfT05fSU5WQUxJRChIVUdFVExCX1BBR0VfT1JERVIgPiBNQVhfRk9MSU9fT1JERVIpOwo+Pj4+
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghaHVnZXBhZ2VzX3N1cHBvcnRlZCgpKSB7Cj4+
Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaHVnZXRsYl9tYXhfaHN0YXRl
IHx8Cj4+Pj4+Pj4+PiBkZWZhdWx0X2hzdGF0ZV9tYXhfaHVnZV9wYWdlcykKPj4+Pj4+Pj4+IEBA
IC00NzQwLDYgKzQ3NDEsNyBAQCB2b2lkIF9faW5pdCBodWdldGxiX2FkZF9oc3RhdGUodW5zaWdu
ZWQgaW50Cj4+Pj4+Pj4+PiBvcmRlcikKPj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+
Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgQlVHX09OKGh1Z2V0bGJfbWF4X2hzdGF0ZSA+PSBI
VUdFX01BWF9IU1RBVEUpOwo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIEJVR19PTihvcmRl
ciA8IG9yZGVyX2Jhc2VfMihfX05SX1VTRURfU1VCUEFHRSkpOwo+Pj4+Pj4+Pj4gK8KgwqDCoCBX
QVJOX09OKG9yZGVyID4gTUFYX0ZPTElPX09SREVSKTsKPj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBoID0gJmhzdGF0ZXNbaHVnZXRsYl9tYXhfaHN0YXRlKytdOwo+Pj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgIF9fbXV0ZXhfaW5pdCgmaC0+cmVzaXplX2xvY2ssICJyZXNpemUgbXV0ZXgi
LCAmaC0KPj4+Pj4+Pj4+PiByZXNpemVfa2V5KTsKPj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBoLT5vcmRlciA9IG9yZGVyOwo+Pj4+Pj4+Cj4+Pj4+Pj4gV2UgZW5kIHVwIHJlZ2lzdGVyaW5n
IGh1Z2V0bGIgZm9saW9zIHRoYXQgYXJlIGJpZ2dlciB0aGFuCj4+Pj4+Pj4gTUFYX0ZPTElPX09S
REVSLiBTbyB3ZSBoYXZlIHRvIGZpZ3VyZSBvdXQgaG93IGEgY29uZmlnIGNhbiB0cmlnZ2VyCj4+
Pj4+Pj4gdGhhdAo+Pj4+Pj4+IChhbmQgaWYgd2UgaGF2ZSB0byBzdXBwb3J0IHRoYXQpLgo+Pj4+
Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gTUFYX0ZPTElPX09SREVSIGlzIGRlZmluZWQgYXM6Cj4+Pj4+Pgo+
Pj4+Pj4gI2lmZGVmIENPTkZJR19BUkNIX0hBU19HSUdBTlRJQ19QQUdFCj4+Pj4+PiAjZGVmaW5l
IE1BWF9GT0xJT19PUkRFUsKgwqDCoMKgwqDCoMKgIFBVRF9PUkRFUgo+Pj4+Pj4gI2Vsc2UKPj4+
Pj4+ICNkZWZpbmUgTUFYX0ZPTElPX09SREVSwqDCoMKgwqDCoMKgwqAgTUFYX1BBR0VfT1JERVIK
Pj4+Pj4+ICNlbmRpZgo+Pj4+Pj4KPj4+Pj4+IE1BWF9QQUdFX09SREVSIGlzIHRoZSBsaW1pdCBm
b3IgZHluYW1pYyBjcmVhdGlvbiBvZiBodWdlcGFnZXMgdmlhCj4+Pj4+PiAvc3lzL2tlcm5lbC9t
bS9odWdlcGFnZXMvIGJ1dCBiaWdnZXIgcGFnZXMgY2FuIGJlIGNyZWF0ZWQgYXQgYm9vdHRpbWUK
Pj4+Pj4+IHdpdGgga2VybmVsIGJvb3QgcGFyYW1ldGVycyB3aXRob3V0IENPTkZJR19BUkNIX0hB
U19HSUdBTlRJQ19QQUdFOgo+Pj4+Pj4KPj4+Pj4+IMKgwqDCoMKgwqAgaHVnZXBhZ2Vzej02NG0g
aHVnZXBhZ2VzPTEgaHVnZXBhZ2Vzej0yNTZtIGh1Z2VwYWdlcz0xCj4+Pj4+Pgo+Pj4+Pj4gR2l2
ZXM6Cj4+Pj4+Pgo+Pj4+Pj4gSHVnZVRMQjogcmVnaXN0ZXJlZCAxLjAwIEdpQiBwYWdlIHNpemUs
IHByZS1hbGxvY2F0ZWQgMCBwYWdlcwo+Pj4+Pj4gSHVnZVRMQjogMCBLaUIgdm1lbW1hcCBjYW4g
YmUgZnJlZWQgZm9yIGEgMS4wMCBHaUIgcGFnZQo+Pj4+Pj4gSHVnZVRMQjogcmVnaXN0ZXJlZCA2
NC4wIE1pQiBwYWdlIHNpemUsIHByZS1hbGxvY2F0ZWQgMSBwYWdlcwo+Pj4+Pj4gSHVnZVRMQjog
MCBLaUIgdm1lbW1hcCBjYW4gYmUgZnJlZWQgZm9yIGEgNjQuMCBNaUIgcGFnZQo+Pj4+Pj4gSHVn
ZVRMQjogcmVnaXN0ZXJlZCAyNTYgTWlCIHBhZ2Ugc2l6ZSwgcHJlLWFsbG9jYXRlZCAxIHBhZ2Vz
Cj4+Pj4+PiBIdWdlVExCOiAwIEtpQiB2bWVtbWFwIGNhbiBiZSBmcmVlZCBmb3IgYSAyNTYgTWlC
IHBhZ2UKPj4+Pj4+IEh1Z2VUTEI6IHJlZ2lzdGVyZWQgNC4wMCBNaUIgcGFnZSBzaXplLCBwcmUt
YWxsb2NhdGVkIDAgcGFnZXMKPj4+Pj4+IEh1Z2VUTEI6IDAgS2lCIHZtZW1tYXAgY2FuIGJlIGZy
ZWVkIGZvciBhIDQuMDAgTWlCIHBhZ2UKPj4+Pj4+IEh1Z2VUTEI6IHJlZ2lzdGVyZWQgMTYuMCBN
aUIgcGFnZSBzaXplLCBwcmUtYWxsb2NhdGVkIDAgcGFnZXMKPj4+Pj4+IEh1Z2VUTEI6IDAgS2lC
IHZtZW1tYXAgY2FuIGJlIGZyZWVkIGZvciBhIDE2LjAgTWlCIHBhZ2UKPj4+Pj4KPj4+Pj4gSSB0
aGluayBpdCdzIGEgdmlvbGF0aW9uIG9mIENPTkZJR19BUkNIX0hBU19HSUdBTlRJQ19QQUdFLiBU
aGUgCj4+Pj4+IGV4aXN0aW5nCj4+Pj4+IGZvbGlvX2R1bXAoKSBjb2RlIHdvdWxkIG5vdCBoYW5k
bGUgaXQgY29ycmVjdGx5IGFzIHdlbGwuCj4+Pj4KPj4+PiBJJ20gdHJ5aW5nIHRvIGRpZyBpbnRv
IGhpc3RvcnkgYW5kIHdoZW4gbG9va2luZyBhdCBjb21taXQgNGViMDcxNmU4NjhlCj4+Pj4gKCJo
dWdldGxiOiBhbGxvdyB0byBmcmVlIGdpZ2FudGljIHBhZ2VzIHJlZ2FyZGxlc3Mgb2YgdGhlCj4+
Pj4gY29uZmlndXJhdGlvbiIpIEkgdW5kZXJzdGFuZCB0aGF0IENPTkZJR19BUkNIX0hBU19HSUdB
TlRJQ19QQUdFIGlzCj4+Pj4gbmVlZGVkIHRvIGJlIGFibGUgdG8gYWxsb2NhdGUgZ2lnYW50aWMg
cGFnZXMgYXQgcnVudGltZS4gSXQgaXMgbm90Cj4+Pj4gbmVlZGVkIHRvIHJlc2VydmUgZ2lnYW50
aWMgcGFnZXMgYXQgYm9vdHRpbWUuCj4+Pj4KPj4+PiBXaGF0IGFtIEkgbWlzc2luZyA/Cj4+Pgo+
Pj4gVGhhdCBDT05GSUdfQVJDSF9IQVNfR0lHQU5USUNfUEFHRSBoYXMgbm90aGluZyBydW50aW1l
LXNwZWNpZmljIGluIGl0cwo+Pj4gbmFtZS4KPj4KPj4gSW4gaXRzIG5hbWUgZm9yIHN1cmUsIGJ1
dCB0aGUgY29tbWl0IEkgbWVudGlvbiBzYXlzOgo+Pgo+PiDCoMKgwqDCoMKgIE9uIHN5c3RlbXMg
d2l0aG91dCBDT05USUdfQUxMT0MgYWN0aXZhdGVkIGJ1dCB0aGF0IHN1cHBvcnQgZ2lnYW50aWMK
Pj4gcGFnZXMsCj4+IMKgwqDCoMKgwqAgYm9vdHRpbWUgcmVzZXJ2ZWQgZ2lnYW50aWMgcGFnZXMg
Y2FuIG5vdCBiZSBmcmVlZCBhdCBhbGwuwqAgVGhpcyAKPj4gcGF0Y2gKPj4gwqDCoMKgwqDCoCBz
aW1wbHkgZW5hYmxlcyB0aGUgcG9zc2liaWxpdHkgdG8gaGFuZCBiYWNrIHRob3NlIHBhZ2VzIHRv
IG1lbW9yeQo+PiDCoMKgwqDCoMKgIGFsbG9jYXRvci4KPiAKPiBSaWdodCwgSSB0aGluayBpdCB3
YXMgYSBoaXN0b3JpY2FsIGFydGlmYWN0Lgo+IAo+Pgo+PiBBbmQgb25lIG9mIHRoZSBodW5rcyBp
czoKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvS2NvbmZpZyBiL2FyY2gvYXJtNjQvS2Nv
bmZpZwo+PiBpbmRleCA3ZjdmYmQ4YmQ5ZDViLi43YTFhYTUzZDE4OGQzIDEwMDY0NAo+PiAtLS0g
YS9hcmNoL2FybTY0L0tjb25maWcKPj4gKysrIGIvYXJjaC9hcm02NC9LY29uZmlnCj4+IEBAIC0x
OSw3ICsxOSw3IEBAIGNvbmZpZyBBUk02NAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc2VsZWN0IEFS
Q0hfSEFTX0ZBU1RfTVVMVElQTElFUgo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc2VsZWN0IEFSQ0hf
SEFTX0ZPUlRJRllfU09VUkNFCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzZWxlY3QgQVJDSF9IQVNf
R0NPVl9QUk9GSUxFX0FMTAo+PiAtwqDCoMKgwqDCoMKgIHNlbGVjdCBBUkNIX0hBU19HSUdBTlRJ
Q19QQUdFIGlmIENPTlRJR19BTExPQwo+PiArwqDCoMKgwqDCoMKgIHNlbGVjdCBBUkNIX0hBU19H
SUdBTlRJQ19QQUdFCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzZWxlY3QgQVJDSF9IQVNfS0NPVgo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgc2VsZWN0IEFSQ0hfSEFTX0tFRVBJTklUUkQKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIHNlbGVjdCBBUkNIX0hBU19NRU1CQVJSSUVSX1NZTkNfQ09SRQo+Pgo+PiBT
byBJIHVuZGVyc3RhbmQgZnJvbSB0aGUgY29tbWl0IG1lc3NhZ2UgdGhhdCBpdCB3YXMgcG9zc2li
bGUgYXQgdGhhdAo+PiB0aW1lIHRvIGhhdmUgZ2lnYW50aWMgcGFnZXMgd2l0aG91dCBBUkNIX0hB
U19HSUdBTlRJQ19QQUdFIGFzIGxvbmcgYXMKPj4geW91IGRpZG4ndCBoYXZlIHRvIGJlIGFibGUg
dG8gZnJlZSB0aGVtIGR1cmluZyBydW50aW1lLgo+IAo+IFllcywgSSBhZ3JlZS4KPiAKPj4KPj4+
Cj4+PiBDYW4ndCB3ZSBqdXN0IHNlbGVjdCBDT05GSUdfQVJDSF9IQVNfR0lHQU5USUNfUEFHRSBm
b3IgdGhlIHJlbGV2YW50Cj4+PiBodWdldGxiIGNvbmZpZyB0aGF0IGFsbG93cyBmb3IgKmdpZ2Fu
dGljIHBhZ2VzKi4KPj4+Cj4+Cj4+IFdlIHByb2JhYmx5IGNhbiwgYnV0IEknZCByZWFsbHkgbGlr
ZSB0byB1bmRlcnN0YW5kIGhpc3RvcnkgYW5kIGhvdyB3ZQo+PiBlbmRlZCB1cCBpbiB0aGUgc2l0
dWF0aW9uIHdlIGFyZSBub3cuCj4+IEJlY2F1c2UgYmxpbmQgZml4ZXMgb2Z0ZW4gbGVhZCB0byBt
b3JlIHByb2JsZW1zLgo+IAo+IFllcywgbGV0J3MgZmlndXJlIG91dCBob3cgdG8gdG8gaXQgY2xl
YW5seS4KPiAKPj4KPj4gSWYgSSBmb2xsb3cgdGhpbmdzIGNvcnJlY3RseSBJIHNlZSBhIGhlbHBl
ciBnaWdhbnRpY19wYWdlX3N1cHBvcnRlZCgpCj4+IGFkZGVkIGJ5IGNvbW1pdCA5NDRkOWZlYzhk
N2EgKCJodWdldGxiOiBhZGQgc3VwcG9ydCBmb3IgZ2lnYW50aWMgcGFnZQo+PiBhbGxvY2F0aW9u
IGF0IHJ1bnRpbWUiKS4KPj4KPj4gQW5kIHRoZW4gY29tbWl0IDQ2MWE3MTg0MzIwYSAoIm1tL2h1
Z2V0bGI6IGludHJvZHVjZQo+PiBBUkNIX0hBU19HSUdBTlRJQ19QQUdFIikgaXMgYWRkZWQgdG8g
d3JhcCBnaWdhbnRpY19wYWdlX3N1cHBvcnRlZCgpCj4+Cj4+IFRoZW4gY29tbWl0IDRlYjA3MTZl
ODY4ZSAoImh1Z2V0bGI6IGFsbG93IHRvIGZyZWUgZ2lnYW50aWMgcGFnZXMKPj4gcmVnYXJkbGVz
cyBvZiB0aGUgY29uZmlndXJhdGlvbiIpIGNoYW5nZWQgZ2lnYW50aWNfcGFnZV9zdXBwb3J0ZWQo
KSB0bwo+PiBnaWdhbnRpY19wYWdlX3J1bnRpbWVfc3VwcG9ydGVkKCkKPj4KPj4gU28gd2hlcmUg
YXJlIHdlIG5vdyA/Cj4gCj4gSW4KPiAKPiBjb21taXQgZmFlN2Q4MzRjNDNjY2RiOWZjZWNhZjRk
MGYzMzE0NWQ4ODRiM2U1Ywo+IEF1dGhvcjogTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkgPHdpbGx5
QGluZnJhZGVhZC5vcmc+Cj4gRGF0ZTrCoMKgIFR1ZSBGZWIgMjcgMTk6MjM6MzEgMjAyNCArMDAw
MAo+IAo+ICDCoMKgwqAgbW06IGFkZCBfX2R1bXBfZm9saW8oKQo+IAo+IAo+IFdlIHN0YXJ0ZWQg
YXNzdW1pbmcgdGhhdCBhIGZvbGlvIGluIHRoZSBzeXN0ZW0gKGJvb3R0aW1lLCBkeW5hbWljLCAK
PiB3aGF0ZXZlcikKPiBoYXMgYSBtYXhpbXVtIG9mIE1BWF9GT0xJT19OUl9QQUdFUy4KPiAKPiBB
bnkgb3RoZXIgaW50ZXJwcmV0YXRpb24gZG9lc24ndCBtYWtlIGFueSBzZW5zZSBmb3IgTUFYX0ZP
TElPX05SX1BBR0VTLgo+IAo+IAo+IFNvIHdlIGhhdmUgdHdvIHF1ZXN0aW9uczoKPiAKPiAxKSBI
b3cgdG8gdGVhY2ggTUFYX0ZPTElPX05SX1BBR0VTIHRoYXQgaHVnZXRsYiBzdXBwb3J0cyBnaWdh
bnRpYyBwYWdlcwo+IAo+IDIpIEhvdyBkbyB3ZSBoYW5kbGUgQ09ORklHX0FSQ0hfSEFTX0dJR0FO
VElDX1BBR0UKPiAKPiAKPiBXZSBoYXZlIHRoZSBmb2xsb3dpbmcgb3B0aW9ucwo+IAo+IChBKSBS
ZW5hbWUgZXhpc3RpbmcgQ09ORklHX0FSQ0hfSEFTX0dJR0FOVElDX1BBR0UgdG8gc29tZXRoaW5n
IGVsc2UgdGhhdCBpcwo+IGNsZWFyZXIgYW5kIGFkZCBhIG5ldyBDT05GSUdfQVJDSF9IQVNfR0lH
QU5USUNfUEFHRS4KPiAKPiAoQikgUmVuYW1lIGV4aXN0aW5nIENPTkZJR19BUkNIX0hBU19HSUdB
TlRJQ19QQUdFIC0+IHRvIHNvbWV0aGluZyBlbHNlIAo+IHRoYXQgaXMKPiBjbGVhcmVyIGFuZCBk
ZXJpdmUgc29tZWhvdyBlbHNlIHRoYXQgaHVnZXRsYiBpbiB0aGF0IGNvbmZpZyBzdXBwb3J0cyAK
PiBnaWdhbnRpYyBwYWdlcy4KPiAKPiAoYykgSnVzdCB1c2UgQ09ORklHX0FSQ0hfSEFTX0dJR0FO
VElDX1BBR0UgaWYgaHVnZXRsYiBvbiBhbiBhcmNoaXRlY3R1cmUKPiBzdXBwb3J0cyBnaWdhbnRp
YyBwYWdlcy4KPiAKPiAKPiBJIGRvbid0IHF1aXRlIHNlZSB3aHkgYW4gYXJjaGl0ZWN0dXJlIHNo
b3VsZCBiZSBhYmxlIHRvIG9wdCBpbiBpbnRvIAo+IGR5bmFtaWNhbGx5Cj4gYWxsb2NhdGluZytm
cmVlaW5nIGdpZ2FudGljIHBhZ2VzLiBUaGF0J3MganVzdCBDT05USUdfQUxMT0MgbWFnaWMgYW5k
IAo+IG5vdCBzb21lCj4gYXJjaC1zcGVjaWZpYyB0aGluZyBJSVJDLgo+IAo+IAo+IE5vdGUgdGhh
dCBpbiBtbS9odWdldGxiLmMgaXQgaXMKPiAKPiAgwqDCoMKgwqAjaWZkZWYgQ09ORklHX0FSQ0hf
SEFTX0dJR0FOVElDX1BBR0UKPiAgwqDCoMKgwqAjaWZkZWYgQ09ORklHX0NPTlRJR19BTExPQwo+
IAo+IE1lYW5pbmcgdGhhdCBhdCBsZWFzdCB0aGUgYWxsb2NhdGlvbiBzaWRlIGlzIGd1YXJkZWQg
YnkgQ09OVElHX0FMTE9DLgoKWWVzIGJ1dCBub3QgdGhlIGZyZWVpbmcgc2luY2UgY29tbWl0IDRl
YjA3MTZlODY4ZSAoImh1Z2V0bGI6IGFsbG93IHRvIApmcmVlIGdpZ2FudGljIHBhZ2VzIHJlZ2Fy
ZGxlc3Mgb2YgdGhlIGNvbmZpZ3VyYXRpb24iKQoKPiAKPiBTbyBJIHRoaW5rIChDKSBpcyBqdXN0
IHRoZSByaWdodCB0aGluZyB0byBkby4KPiAKPiBkaWZmIC0tZ2l0IGEvZnMvS2NvbmZpZyBiL2Zz
L0tjb25maWcKPiBpbmRleCAwYmZkYWVjYWE4Nzc1Li4xMmMxMWViOTI3OWQzIDEwMDY0NAo+IC0t
LSBhL2ZzL0tjb25maWcKPiArKysgYi9mcy9LY29uZmlnCj4gQEAgLTI4Myw2ICsyODMsOCBAQCBj
b25maWcgSFVHRVRMQl9QTURfUEFHRV9UQUJMRV9TSEFSSU5HCj4gIMKgwqDCoMKgwqDCoMKgIGRl
Zl9ib29sIEhVR0VUTEJfUEFHRQo+ICDCoMKgwqDCoMKgwqDCoCBkZXBlbmRzIG9uIEFSQ0hfV0FO
VF9IVUdFX1BNRF9TSEFSRSAmJiBTUExJVF9QTURfUFRMT0NLUwo+IAo+ICsjIEFuIGFyY2hpdGVj
dHVyZSBtdXN0IHNlbGVjdCB0aGlzIG9wdGlvbiBpZiB0aGVyZSBpcyBhbnkgbWVjaGFuaXNtIAo+
IChlc3AuIGh1Z2V0bGIpCj4gKyMgY291bGQgb2J0YWluIGdpZ2FudGljIGZvbGlvcy4KPiAgwqBj
b25maWcgQVJDSF9IQVNfR0lHQU5USUNfUEFHRQo+ICDCoMKgwqDCoMKgwqDCoCBib29sCj4gCj4g
CgpJIGdhdmUgaXQgYSB0cnkuIFRoYXQncyBub3QgZW5vdWdoLCBpdCBmaXhlcyB0aGUgcHJvYmxl
bSBmb3IgNjQgTWJ5dGVzIApwYWdlcyBhbmQgMjU2IE1ieXRlcyBwYWdlcywgYnV0IG5vdCBmb3Ig
MSBHYnl0ZXMgcGFnZXMuCgpNYXggZm9saW8gaXMgZGVmaW5lZCBieSBQVURfT1JERVIsIGJ1dCBQ
VURfU0laRSBpcyAyNTYgTWJ5dGVzIHNvIHdlIG5lZWQgCnRvIG1ha2UgTUFYX0ZPTElPIGxhcmdl
ci4gRG8gd2UgY2hhbmdlIGl0IHRvIFA0RF9PUkRFUiBvciBpcyBpdCB0b28gbXVjaCAKPyBQNERf
U0laRSBpcyAxMjggR2J5dGVzCgpDaHJpc3RvcGhlCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
