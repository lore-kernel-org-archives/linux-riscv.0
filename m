Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006DBEC1EB9
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 13:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAmFP+It+IC3ZbBFV8vN2PQSVCadoHVhh2mwQSpyrXw=; b=Vq2nxAzNr35MeI
	etEOA+RgSzzzcza8RgZqyjVJs0S/L7XomLHWHFEPPeun1umm/K69BrjiJIRBBnrburjWDxP8YIXxe
	V8QqYNokx1BfBDqg6HaPLEmW5SRrfU+WWEhwGdzcfu9z7SoEMuNYm3Ar0FP6OVIIV30kVsl4SdQX+
	FJFC8lAQtZvgqAkADFIjbU+sP4xNih9e5CM83DZCnBCe2eYaLNPWg9A0mv/A5TwmloEpAg0gre7P6
	tkd8V4W9Yzg8iprTIJJbBthQZjAZsv6EyL3TpbNgm95v+57lqpSIV5IO4m750LlEvV/cFhcTOdVIw
	3Xpy+JA3rUF4uFSESTqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzt0-0000000A0Cj-0YcH;
	Thu, 05 Feb 2026 13:59:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzsx-0000000A0Bg-1F80
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 13:59:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A508444FC;
	Thu,  5 Feb 2026 13:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9A4C4CEF7;
	Thu,  5 Feb 2026 13:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770299946;
	bh=NrgItkvDCDI0JdjjTiJgmYN8Hu+I5JatU6qOApBTUkQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=UDgEXs2326E6nluf1TRc8JSNvhmzOon3wFQO4IGhep2GcsTFGb51oZnfVZiY1GAaR
	 AP8fzqcnv7eYrYj9lL4FNmIylIXtktJO6S/8lPEsr9/blHUuTeaYrMQZrCri1qieYO
	 cq0gkqvEXFYLEhEOZv7vi4RklL+UFVEE6ysMw5CnfQHGwPi5Qp1XZ6xxWiFW46pN2N
	 kiqi1m6pj9kSW9RPBUIsDiBzSO344zesdF59KRQwvqScPSbSq4fhaJHCL1XMX/KL6Z
	 AGh6cTxV+hX4OwAQ5pwgwcuIpE1fW7fngurZgxukYKy1X9RCDc7bsKDUrmmVxEI6CF
	 RZ/PweRaGfL5Q==
Message-ID: <a3f454aa-7cff-4e85-b046-5d4c55d8ccb9@kernel.org>
Date: Thu, 5 Feb 2026 14:58:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6 09/17] mm/sparse: Check memmap alignment for
 compound_info_has_mask()
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
 <20260202155634.650837-10-kas@kernel.org>
 <ef1f6ec1-7036-400c-9d4f-fc4f6f969ef7@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <ef1f6ec1-7036-400c-9d4f-fc4f6f969ef7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_055907_373746_17D0946F 
X-CRM114-Status: GOOD (  12.71  )
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

T24gMi81LzI2IDE0OjMxLCBEYXZpZCBIaWxkZW5icmFuZCAoQXJtKSB3cm90ZToKPiBPbiAyLzIv
MjYgMTY6NTYsIEtpcnlsIFNodXRzZW1hdSB3cm90ZToKPj4gSWYgcGFnZS0+Y29tcG91bmRfaW5m
byBlbmNvZGVzIGEgbWFzaywgaXQgaXMgZXhwZWN0ZWQgdGhhdCB2bWVtbWFwIHRvIGJlCj4+IG5h
dHVyYWxseSBhbGlnbmVkIHRvIHRoZSBtYXhpbXVtIGZvbGlvIHNpemUuCj4+Cj4+IEFkZCBhIFZN
X0JVR19PTigpIHRvIGNoZWNrIHRoZSBhbGlnbm1lbnQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEtp
cnlsIFNodXRzZW1hdSA8a2FzQGtlcm5lbC5vcmc+Cj4+IEFja2VkLWJ5OiBaaSBZYW4gPHppeUBu
dmlkaWEuY29tPgo+PiAtLS0KPj4gwqAgbW0vc3BhcnNlLmMgfCA3ICsrKysrKysKPj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvbW0vc3BhcnNl
LmMgYi9tbS9zcGFyc2UuYwo+PiBpbmRleCBiNWIyYjZmNzA0MWIuLjZjOWI2MjYwN2YzZiAxMDA2
NDQKPj4gLS0tIGEvbW0vc3BhcnNlLmMKPj4gKysrIGIvbW0vc3BhcnNlLmMKPj4gQEAgLTYwMCw2
ICs2MDAsMTMgQEAgdm9pZCBfX2luaXQgc3BhcnNlX2luaXQodm9pZCkKPj4gwqDCoMKgwqDCoCBC
VUlMRF9CVUdfT04oIWlzX3Bvd2VyX29mXzIoc2l6ZW9mKHN0cnVjdCBtZW1fc2VjdGlvbikpKTsK
Pj4gwqDCoMKgwqDCoCBtZW1ibG9ja3NfcHJlc2VudCgpOwo+PiArwqDCoMKgIGlmIChjb21wb3Vu
ZF9pbmZvX2hhc19tYXNrKCkpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgYWxp
Z25tZW50Owo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCBhbGlnbm1lbnQgPSBNQVhfRk9MSU9fTlJf
UEFHRVMgKiBzaXplb2Yoc3RydWN0IHBhZ2UpOwo+PiArwqDCoMKgwqDCoMKgwqAgVk1fQlVHX09O
KCFJU19BTElHTkVEKCh1bnNpZ25lZCBsb25nKSBwZm5fdG9fcGFnZSgwKSwgCj4+IGFsaWdubWVu
dCkpOwo+IAo+IE5vIFZNX0JVR19PTi4gVk1fV0FSTl9PTl9PTkNFKCkgc2hvdWxkIGJlIGdvb2Qg
ZW5vdWdoLCBubz8KPiAKPiBBcyBkaXNjdXNzZWQgaW4gdGhlIG90aGVyIHRocmVhZCwgaXMgY2hl
Y2tpbmcgZm9yIE1BWF9GT0xJT19OUl9QQUdFUyAKPiBhbGlnbm1lbnQgc3VmZmljaWVudD8KCkFu
ZCBhZnRlciBmdXJ0aGVyIGRpc2N1c3Npb25zLCB3ZSBjb3VsZCB1c2UgTUFYX0ZPTElPX1ZNRU1N
QVBfQUxJR04gCm1hY3JvIG9uY2Ugd2UgaGF2ZSB0aGF0LgoKLS0gCkNoZWVycywKCkRhdmlkCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
