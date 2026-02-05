Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3015FEC1EAF
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 12:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJgcT58N73zTitUmGeujJFa0lHZywM4+U7gEW/99cdU=; b=EmIDAOezk5OPVr
	xNxJJajkfvZhBQQ0wmGYVRwIY2WItng35rk4S1RKspATXQjHHFp4/+LU/0zrGtT6+bd4cOu9MbqM6
	wjICKQJNZbeH956G4/2mbybwNBwDR4l4bbOKXmeza+LoJ3cmdLPvS5BQn/Ubm+07rsLgOTEQPB4P4
	PBCYoeBu3cozlmEcmLl5qM/kJebarPIvvMnSEyrYC1kUxPQjvjMg2f5p5i01aiA0oLFmxdoBYoCfL
	T5+ByXKT9jLmB5dxMCCwWSmB+4b/ce4QOlyn40EAzO7cq64PXTP+ZiR/cr7kuJmjvEwXDAmkrJ/6A
	Fn1vBH8cpOXq8Vz9mSKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnyud-00000009uwL-3Pzb;
	Thu, 05 Feb 2026 12:56:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnyub-00000009uwC-2LBK
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 12:56:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 989FC60010;
	Thu,  5 Feb 2026 12:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37BABC4CEF7;
	Thu,  5 Feb 2026 12:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770296204;
	bh=e5VyJ5rggvxgVaaTXdiX2bO8uDhtniRYd2c5UWCrvPU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=AEzNcPowN4BXmt/D6Aou5d8c+1I3HBIPjz0gA7sikgv0Ip1rzk5T6BtqxHkZb5VkE
	 DePut29gHzvT8VyvfG9xbgwY+Kibkxt4Pb5EjnOaeBTV5BMNyVVVLMFUNjpBMd1Ugk
	 mPQBR5np1zulD6HftFxxFg09JX0BLr6DopqBYv2cA87ylu0Mt8qe60WVBtaHupSjIe
	 bLmBOpbkINgrjrAieAMtg9kVh9w4PfCG4/U4g6dxJUvV67RnqoDmVI4M9E6VV8PHBh
	 Kt0gJ+sj6BjoBSDBo0z+ZQb2tH1OkHtkHK+Ki2AyawzNqqsCg9diht8nNeNd/ZXMSg
	 GTBttbb6q2jYQ==
Message-ID: <062900fa-6419-4748-81d1-9128ce6c46d0@kernel.org>
Date: Thu, 5 Feb 2026 13:56:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6 06/17] LoongArch/mm: Align vmemmap to maximal folio size
From: "David Hildenbrand (Arm)" <david@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-7-kas@kernel.org>
 <2ce0e684-de54-43ec-be7d-c58bbffb3f4e@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <2ce0e684-de54-43ec-be7d-c58bbffb3f4e@kernel.org>
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

T24gMi80LzI2IDE3OjU2LCBEYXZpZCBIaWxkZW5icmFuZCAoYXJtKSB3cm90ZToKPiBPbiAyLzIv
MjYgMTY6NTYsIEtpcnlsIFNodXRzZW1hdSB3cm90ZToKPj4gVGhlIHVwY29taW5nIGNoYW5nZSB0
byB0aGUgSHVnZVRMQiB2bWVtbWFwIG9wdGltaXphdGlvbiAoSFZPKSByZXF1aXJlcwo+PiBzdHJ1
Y3QgcGFnZXMgb2YgdGhlIGhlYWQgcGFnZSB0byBiZSBuYXR1cmFsbHkgYWxpZ25lZCB3aXRoIHJl
Z2FyZCB0byB0aGUKPj4gZm9saW8gc2l6ZS4KPj4KPj4gQWxpZ24gdm1lbW1hcCB0byBNQVhfRk9M
SU9fTlJfUEFHRVMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEtpcnlsIFNodXRzZW1hdSA8a2FzQGtl
cm5lbC5vcmc+Cj4+IC0tLQo+PiDCoCBhcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9wZ3RhYmxl
LmggfCAzICsrLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmggYi9hcmNoL2xvb25nYXJjaC8gCj4+IGluY2x1ZGUvYXNtL3BndGFibGUuaAo+PiBpbmRl
eCBjMzNiM2JjYjczM2UuLmY5NDE2YWNiOTE1NiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9sb29uZ2Fy
Y2gvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+ICsrKyBiL2FyY2gvbG9vbmdhcmNoL2luY2x1ZGUv
YXNtL3BndGFibGUuaAo+PiBAQCAtMTEzLDcgKzExMyw4IEBAIGV4dGVybiB1bnNpZ25lZCBsb25n
IGVtcHR5X3plcm9fcGFnZVtQQUdFX1NJWkUgLyAKPj4gc2l6ZW9mKHVuc2lnbmVkIGxvbmcpXTsK
Pj4gwqDCoMKgwqDCoMKgIG1pbihQVFJTX1BFUl9QR0QgKiBQVFJTX1BFUl9QVUQgKiBQVFJTX1BF
Ul9QTUQgKiBQVFJTX1BFUl9QVEUgKiAKPj4gUEFHRV9TSVpFLCAoMVVMIDw8IGNwdV92YWJpdHMp
IC8gMikgLSBQTURfU0laRSAtIFZNRU1NQVBfU0laRSAtIAo+PiBLRkVOQ0VfQVJFQV9TSVpFKQo+
PiDCoCAjZW5kaWYKPj4gLSNkZWZpbmUgdm1lbW1hcMKgwqDCoMKgwqDCoMKgICgoc3RydWN0IHBh
Z2UgKikoKFZNQUxMT0NfRU5EICsgUE1EX1NJWkUpICYgCj4+IFBNRF9NQVNLKSkKPj4gKyNkZWZp
bmUgVk1FTU1BUF9BTElHTsKgwqDCoCBtYXgoUE1EX1NJWkUsIE1BWF9GT0xJT19OUl9QQUdFUyAq
IAo+PiBzaXplb2Yoc3RydWN0IHBhZ2UpKQo+PiArI2RlZmluZSB2bWVtbWFwwqDCoMKgwqDCoMKg
wqAgKChzdHJ1Y3QgcGFnZSAqKShBTElHTihWTUFMTE9DX0VORCwgCj4+IFZNRU1NQVBfQUxJR04p
KSkKPiAKPiAKPiBTYW1lIGNvbW1lbnQsIHRoZSAiTUFYX0ZPTElPX05SX1BBR0VTICogc2l6ZW9m
KHN0cnVjdCBwYWdlKSIgaXMganVzdCAKPiBibGFjayBtYWdpYyBoZXJlCj4gYW5kIHRoZSBkZXNj
cmlwdGlvbiBvZiB0aGUgc2l0dWF0aW9uIGlzIHdyb25nLgo+IAo+IE1heWJlIHlvdSB3YW50IHRv
IHB1bGwgdGhlIG1hZ2ljICJNQVhfRk9MSU9fTlJfUEFHRVMgKiBzaXplb2Yoc3RydWN0IAo+IHBh
Z2UpIiBpbnRvIHRoZSBjb3JlIGFuZCBjYWxsIGl0Cj4gCj4gI2RlZmluZSBNQVhfRk9MSU9fVk1F
TU1BUF9BTElHTsKgwqDCoCAoTUFYX0ZPTElPX05SX1BBR0VTICogc2l6ZW9mKHN0cnVjdCAKPiBw
YWdlKSkKPiAKPiBCdXQgdGhlbiBzcGVjaWFsIGNhc2UgaXQgYmFzZSBvbiAoYSkgSFZPIGJlaW5n
IGNvbmZpZ3VyZWQgaW4gYW4gKGIpIEhWTyAKPiBiZWluZyBwb3NzaWJsZQo+IAo+ICNpZmRlZiBI
VUdFVExCX1BBR0VfT1BUSU1JWkVfVk1FTU1BUCAmJiBpc19wb3dlcl9vZl8yKHNpemVvZihzdHJ1
Y3QgcGFnZSkKPiAvKiBBIHZlcnkgaGVscGZ1bCBjb21tZW50IGV4cGxhaW5pbmcgdGhlIHNpdHVh
dGlvbi4gKi8KPiAjZGVmaW5lIE1BWF9GT0xJT19WTUVNTUFQX0FMSUdOwqDCoMKgIChNQVhfRk9M
SU9fTlJfUEFHRVMgKiBzaXplb2Yoc3RydWN0IAo+IHBhZ2UpKQo+ICNlbHNlCj4gI2RlZmluZSBN
QVhfRk9MSU9fVk1FTU1BUF9BTElHTsKgwqDCoCAwCj4gI2VuZGlmCj4gCj4gU29tZXRoaW5nIGxp
a2UgdGhhdC4KPiAKClRoaW5raW5nIGFib3V0IHRoaXMgLi4uCgp0aGUgdm1lbW1hcCBzdGFydCBp
cyBhbHdheXMgc3RydWN0LXBhZ2UtYWxpZ25lZC4gT3RoZXJ3aXNlIHdlJ2QgYmUgaW4gCnRyb3Vi
bGUgYWxyZWFkeS4KCklzbid0IGl0IHRoZW4gc3VmZmljaWVudCB0byBqdXN0IGFsaWduIHRoZSBz
dGFydCB0byBNQVhfRk9MSU9fTlJfUEFHRVM/CgpMZXQncyBhc3N1bWUgc2l6ZW9mKHN0cnVjdCBw
YWdlKSA9PSA2NCBhbmQgTUFYX0ZPTElPX05SX1BBR0VTID0gNTEyIGZvciAKc2ltcGxpY2l0eS4K
CnZtZW1tYXAgc3RhcnQgd291bGQgYmUgbXVsdGlwbGVzIG9mIDUxMiAoMHgwMDEwMDAwMDAwKS4K
CjUxMiwgMTAyNCwgMTUzNiwgMjA0OCAuLi4KCkFzc3VtZSB3ZSBoYXZlIGFuIDI1Ni1wYWdlcyBm
b2xpbyBhdCAxNTM2KzI1NiA9IDB4MTExMDAwMDAwCgpBc3N1bWUgd2UgaGF2ZSB0aGUgbGFzdCBw
YWdlIG9mIHRoYXQgZm9saW8gKDB4MDExMTExMTExMTExKSwgd2Ugd291bGQgCmp1c3QgZ2V0IHRv
IHRoZSBzdGFydCBvZiB0aGF0IGZvbGlvIGJ5IEFORC1pbmcgd2l0aCB+KDI1Ni0xKS4KCldoaWNo
IGNhc2UgYW0gSSBpZ25vcmluZz8KCi0tIApDaGVlcnMsCgpEYXZpZAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
