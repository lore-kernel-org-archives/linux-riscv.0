Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B87CA0EF8
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 13:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qwJVdbKGkRv9iq61etK0rfEK4ftvjgvlSq1k14bvMro=; b=PfOaqw2X9X45uI
	W629Jflpf1fZ0PDFQ4xyx0YKdQMNQB4fsx5zXIa+/XR4ySpDBk+M9Zl2IYdtAAw6FK5ON+Om9vfJ2
	OXMami33Jw+dgGepCwaQ88jMLCM76SpkVQC50cPAYsJKpGT3oiTsviATIvDzUBi6ZzPTlNylE5w0h
	Rng3gNOZZa1+O73KoGNVY8BWLOdJcZ7uapfIUD8H1lIbsR+nuk+tx9TrSByHJMzF7aA1lMvNQe4i+
	CiRVyMaZ4SWWM8TfOVU7va9HtHyWsX3q2CixGLWak3zoO8EB8a/VE3GT1TFCHA76MGVb73maA4qmt
	gD1wD+/3MdzOqiM4J4PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5Cw-0000000H26Y-3dmb;
	Thu, 21 Aug 2025 13:19:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2lP-0000000Ge7Z-1kBn
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 10:43:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51F9D152B;
	Thu, 21 Aug 2025 03:43:14 -0700 (PDT)
Received: from [10.57.91.188] (unknown [10.57.91.188])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 298EB3F63F;
	Thu, 21 Aug 2025 03:43:14 -0700 (PDT)
Message-ID: <88ea592c-c6ff-4a19-a366-eadeca66b039@arm.com>
Date: Thu, 21 Aug 2025 12:43:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] selftests/mm: Add -Wunused family of flags
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>
Cc: kernel@collabora.com
References: <20250731160132.1795351-1-usama.anjum@collabora.com>
 <20250731160132.1795351-5-usama.anjum@collabora.com>
 <57c816d6-a9ba-47c9-8f40-3978580b7f67@arm.com>
 <8e9d7c59-46b4-4e1b-8a55-1898302f5080@collabora.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <8e9d7c59-46b4-4e1b-8a55-1898302f5080@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_034323_496946_429D4FDB 
X-CRM114-Status: GOOD (  13.14  )
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

T24gMjEvMDgvMjAyNSAwODoyOCwgTXVoYW1tYWQgVXNhbWEgQW5qdW0gd3JvdGU6Cj4+IEFzIHRv
IC1XdW51c2VkLXBhcmFtZXRlciBJIGFtIGZyYW5rbHkgbm90IGNvbnZpbmNlZCBpdCdzIHdvcnRo
IHRoZQo+PiBoYXNzbGUuIFdlJ3JlIGdldHRpbmcgOTAgbGluZXMgY2hhbmdlZCBpbiBwYXRjaCA2
LTgganVzdCB0byBtYXJrCj4+IHBhcmFtZXRlcnMgYXMgdW51c2VkLCBpbiBvdGhlciB3b3JkcyBu
b2lzZSB0byBrZWVwIHRoZSBjb21waWxlciBoYXBweS4KPj4gSXQgaXMgbm90IGVuYWJsZWQgYnkg
ZGVmYXVsdCBpbiB0aGUga2VybmVsIHByb3BlciBwcmVjaXNlbHkgYmVjYXVzZSBpdAo+PiBpcyBz
byBub2lzeSB3aGVuIGNhbGxiYWNrcyBhcmUgaW52b2x2ZWQuCj4+Cj4+IFBhdGNoIDUgaXMgY2xl
YXJseSBhbiBpbXByb3ZlbWVudCwgYnV0IEknZCByYXRoZXIgdGFrZSBpdCB3aXRob3V0Cj4+IGFj
dHVhbGx5IGVuYWJsaW5nIC1XdW51c2VkLXBhcmFtZXRlci4gVGhlIHJlc3Qgb2YgdGhpcyBwYXRj
aCBpc24ndCB0aGF0Cj4+IHVzZWZ1bCBlaXRoZXIgSU1ITy4KPiBQYXRjaCA1IHJlbW92ZXMgZ2Vu
dWluZWx5IHVudXNlZCBwYXJhbWV0ZXJzIGZsYWdnZWQgYnkgdGhlIGNvbXBpbGVyLiBJZiB3ZQo+
IGRyb3AgdGhlIC1XdW51c2VkLXBhcmFtZXRlciBvcHRpb24sIGhvd2V2ZXIsIG5ldyB1bnVzZWQg
cGFyYW1ldGVycyB3aWxsCj4gY29udGludWUgdG8gY3JlZXAgaW4gd2l0aCBmdXR1cmUgcGF0Y2hl
cy4gVGhlIGdvYWwgb2YgZW5hYmxpbmcgdGhpcyB3YXJuaW5nCj4gaXMgdG8gc3VyZmFjZSBzdWNo
IGlzc3VlcyBlYXJseSBzbyBkZXZlbG9wZXJzIGNhbiBhZGRyZXNzIHRoZW0gZHVyaW5nCj4gZGV2
ZWxvcG1lbnQsIHJhdGhlciB0aGFuIGxhdGVyIGR1cmluZyByZXZpZXcgb3IgZGVidWdnaW5nLgo+
Cj4gTG9uZyB0ZXJtLCBJ4oCZZCBsaWtlIHVzIHRvIHJlbHkgbW9yZSBvbiBjb21waWxlciBhbmQg
c3RhdGljIGFuYWx5c2lzIGp1c3QgbGlrZQo+IGtlcm5lbCB0byBjYXRjaCB0aGVzZSBraW5kcyBv
ZiBwcm9ibGVtcyBwcm9hY3RpdmVseSwgaW5zdGVhZCBvZiB3YWl0aW5nIHVudGlsCj4gdGhleeKA
mXJlIHJlcG9ydGVkIG9yIHNvbWVvbmUgZml4ZXMgdGhlbSBsYXRlci4gV2hpbGUgaXQgbWF5IGZl
ZWwgbGlrZSBub2lzZQo+IGluaXRpYWxseSwgdGhpcyBpcyBsYXJnZWx5IGEgb25lLXRpbWUgY2xl
YW51cOKAlG9uY2UgZG9uZSwgZGV2ZWxvcGVycyB3aWxsCj4gc2ltcGx5IGZpeCB3YXJuaW5ncyBh
cyB0aGV5IGFyaXNlLCBrZWVwaW5nIHRoZSBjb2RlYmFzZSBjbGVhbmVyIGdvaW5nIGZvcndhcmQu
CgpBZ3JlZWQgb24gdGhlIGdlbmVyYWwgcHJpbmNpcGxlLCBidXQgSSB0aGluayB0aGUgaGFzc2xl
IGlzIGp1c3QgdG9vIGJpZwpmb3Igd2hhdCB3ZSdyZSBnZXR0aW5nIGluIHJldHVybiBoZXJlIChz
ZWUgYWxzbyBBbmRyZXcncyByZXBseSkuIE5ldwpjb2RlIG1heSBhbHNvIGludHJvZHVjZSBhIGJ1
bmNoIG9mIHVudXNlZCBwYXJhbWV0ZXJzIGZvciBsZWdpdGltYXRlCnJlYXNvbnMgYW5kIGl0J3Mg
ZWFzeSB0byBpbWFnaW5lIGNvbnRyaWJ1dG9ycyBpZ25vcmluZyBzdWNoIHNlZW1pbmdseQpoYXJt
bGVzcy9pcnJlbGV2YW50IHdhcm5pbmdzIGluc3RlYWQgb2Ygc3ByaW5rbGluZyBfX3VudXNlZCBh
bGwgb3Zlci4gTXkKZmVlbGluZyBpcyB0aGF0IHVudXNlZCBwYXJhbWV0ZXJzIGFyZSBleHBlY3Rl
ZCB0byBiZSBhbGxvd2VkIGluIHRoZQprZXJuZWwgYW5kIGl0IGlzbid0IGhlbHBmdWwgdG8gZ28g
YWdhaW5zdCB0aGF0IGV4cGVjdGF0aW9uIGluIGp1c3QgYQpzbWFsbCBzdWJzZXQgb2Yga3NlbGZ0
ZXN0cy4KCi0gS2V2aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
