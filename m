Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193BFD46C19
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 03:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hz+ptQBuEEHRw1eDyhLKpy4dlrkFXDq3khBNO7rdWXA=; b=g2zNQxPyL57TiN
	DO1G+vMDIxFtQeCV+8FDqgMDmOQuOVYwEDhWMEGRucsBkkX1H9hfBTfsF2R+VCuHvl5UTeiflTnJs
	sxkPdJwalhuElO8QOJcZsxsum58jGR+j5WIx/OE4vDyKlv/7E/c9azAdR0k7DhYZ17H8SNOd7BuHP
	aNrNZ24Q7Xsw+2/ionWcPy96CedMf3KmiGhMQaVTlSBYX+4uu/GU7v/HOmDWNVdX8mW+DkJ1mGPSM
	w534fFViLqggVc7yCq4CmxJsO6OXjqFKNyko6tAavjL7TfCi5qt8iwK/MLqq2+Q0GSxkUPbHCtA3P
	EPkpkKjV4IcfmsoB02Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlIHK-0000000HAG3-2K4a;
	Thu, 29 Jan 2026 03:01:06 +0000
Received: from out-180.mta0.migadu.com ([91.218.175.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlIHH-0000000HAFf-1z9d
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 03:01:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769655650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iLgsJJ2DJ+t6b/hazprnCVEL54/CGelmOLPvH7wJObs=;
	b=kGqKVANvKr8PZg++xZhG7iMds+BlyQUvRkODZXgyoNViIuAV23ppanBy4xDGgWkoto+6Ia
	qN+ffnsYEqzRetMcVO4Mcvf+Vsqa2mdwGQBVnS2PiSH7oAYdUwxJwOV58otZFJelHA6tG2
	KKoBUdiQdqErcwgsiLlY8mNzRmPEOC0=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCHv5 09/17] mm/sparse: Check memmap alignment for
 compound_info_has_mask()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260128135500.22121-10-kas@kernel.org>
Date: Thu, 29 Jan 2026 11:00:07 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 kernel-team@meta.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org
Message-Id: <B4674CF0-7534-462B-A761-D9124234BFE4@linux.dev>
References: <20260128135500.22121-1-kas@kernel.org>
 <20260128135500.22121-10-kas@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_190103_821232_D15400AB 
X-CRM114-Status: GOOD (  16.04  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Cgo+IE9uIEphbiAyOCwgMjAyNiwgYXQgMjE6NTQsIEtpcnlsIFNodXRzZW1hdSA8a2FzQGtlcm5l
bC5vcmc+IHdyb3RlOgo+IAo+IElmIHBhZ2UtPmNvbXBvdW5kX2luZm8gZW5jb2RlcyBhIG1hc2ss
IGl0IGlzIGV4cGVjdGVkIHRoYXQgdm1lbW1hcCB0byBiZQo+IG5hdHVyYWxseSBhbGlnbmVkIHRv
IHRoZSBtYXhpbXVtIGZvbGlvIHNpemUuCj4gCj4gVHJpZ2dlciBhIEJVRygpIGZvciBDT05GSUdf
REVCVUdfVk09eSBvciBXQVJOKCkgb3RoZXJ3aXNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtpcnls
IFNodXRzZW1hdSA8a2FzQGtlcm5lbC5vcmc+Cj4gQWNrZWQtYnk6IFppIFlhbiA8eml5QG52aWRp
YS5jb20+Cj4gLS0tCj4gbW0vc3BhcnNlLmMgfCAxMyArKysrKysrKysrKysrCj4gMSBmaWxlIGNo
YW5nZWQsIDEzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvbW0vc3BhcnNlLmMgYi9t
bS9zcGFyc2UuYwo+IGluZGV4IGI1YjJiNmY3MDQxYi4uOWMwZjQwMTU3NzhjIDEwMDY0NAo+IC0t
LSBhL21tL3NwYXJzZS5jCj4gKysrIGIvbW0vc3BhcnNlLmMKPiBAQCAtNjAwLDYgKzYwMCwxOSBA
QCB2b2lkIF9faW5pdCBzcGFyc2VfaW5pdCh2b2lkKQo+IEJVSUxEX0JVR19PTighaXNfcG93ZXJf
b2ZfMihzaXplb2Yoc3RydWN0IG1lbV9zZWN0aW9uKSkpOwo+IAltZW1ibG9ja3NfcHJlc2VudCgp
Owo+IAo+ICsgCWlmIChjb21wb3VuZF9pbmZvX2hhc19tYXNrKCkpIHsKPiArIAkJdW5zaWduZWQg
bG9uZyBhbGlnbm1lbnQ7Cj4gKyAJCWJvb2wgYWxpZ25lZDsKPiArCj4gKyAJCWFsaWdubWVudCA9
IE1BWF9GT0xJT19OUl9QQUdFUyAqIHNpemVvZihzdHJ1Y3QgcGFnZSk7Cj4gKyAJCWFsaWduZWQg
PSBJU19BTElHTkVEKCh1bnNpZ25lZCBsb25nKSBwZm5fdG9fcGFnZSgwKSwgYWxpZ25tZW50KTsK
PiArCj4gKyAJCWlmIChJU19FTkFCTEVEKENPTkZJR19ERUJVR19WTSkpCj4gKyAJCQlCVUdfT04o
IWFsaWduZWQpOwo+ICsgCQllbHNlCj4gKyAJCQlXQVJOX09OKCFhbGlnbmVkKTsKClNpbmNlIHlv
deKAmXZlIGZpeGVkIGFsbCB0aGUgcHJvYmxlbWF0aWMgYXJjaGl0ZWN0dXJlcywgSSBkb27igJl0
IGJlbGlldmUKd2XigJlsbCBldmVyIGhpdCB0aGUgV0FSTiBvciBCVUcgaGVyZSBhbnltb3JlLgoK
SSB0aGluayB3ZSBjYW4gbm93IHNpbXBsaWZ5IHRoZSBjb2RlIGZ1cnRoZXIgYW5kIGp1c3QgdXNl
IFZNX0JVR19PTjoKaWYgYW55IGFyY2hpdGVjdHVyZSBjaGFuZ2VzIGluIHRoZSBmdXR1cmUsIHRo
ZSBtaXNhbGlnbm1lbnQgd2lsbCBiZQpjYXVnaHQgZHVyaW5nIHRlc3RpbmcsIHNvIHdlIHdvbuKA
mXQgbmVlZCB0byB3b3JyeSBhYm91dCBpdCBhdCBydW4tdGltZS4KCj4gKyAJfQo+ICsKPiAJcG51
bV9iZWdpbiA9IGZpcnN0X3ByZXNlbnRfc2VjdGlvbl9ucigpOwo+IAluaWRfYmVnaW4gPSBzcGFy
c2VfZWFybHlfbmlkKF9fbnJfdG9fc2VjdGlvbihwbnVtX2JlZ2luKSk7Cj4gCj4gLS0gCj4gMi41
MS4yCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
