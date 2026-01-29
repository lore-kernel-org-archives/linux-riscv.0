Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BD9D358C8
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 07:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUeCtXYBrKYOXz44k4atSvMHJkEzlrBRbjnFucD47M0=; b=aJHaOP/qjgMSyy
	WmO4zF82bcjaKwmT/MuFCpUZiejtMyQDWz/+QLNZZmVKDWUS1jby5JueqtMcOFIPmB6M77nFKpUii
	OviEm/rWvQZtfBYEpFHrJmq+jMi4Aqz/6tNHTnRxvob4sdatTwtHNucI6w9fzOCa9EeVyGC9fVBWN
	MI3qI50QRk0Se+swTdECwDMEfEvy5z5w0KJuHYqVXSGFt3h0xtQn4Sr8HZv2t5XPbbtcdcdnlpd/Z
	E8QdvoEbISOOjuCoeIOptgxMMjZRbv30oqDmxKtbVlHPHPv7wcqjgZp+1xH5ZY94yzhrFKbjWIYF8
	MIYCsqHvnyN5C3Y45VCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlM6l-0000000HMwx-2X05;
	Thu, 29 Jan 2026 07:06:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlM6i-0000000HMwq-376r
	for linux-riscv@bombadil.infradead.org;
	Thu, 29 Jan 2026 07:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description;
	bh=3vg92+QaCjCV3/Bar3U+6CnYR1oFAyAXYUL9A8jeWm8=; b=JgxjBgM+rNoMp9iDpTQVuELrmC
	sou/3zkkK+uWYI1Daq85Rl6W7R1jotg5jiYWlDnBYvQB25k5mgju05lJ0HuzT7JK9LaOKITUMAQM2
	L5dkl84bbG5Lr8mPsv5cNXOCJke1lKtIs3ZPkg9aF238hSXFseb39EXzaYkiaIdSQJZLqvtmKnwJO
	VCayrukVYkYHtmikRdFvTXE14gYC4tTIbXxTOyMm3OatDTREZ+zugzmIb8R0gCKiC6gOc1W1KJvfR
	JSZ8Zj9HkU1w/iwkzRmtvBGcDxKwclTflZOWPyPPHyuluBjTDd3Q4A/6W3LlSINYUMsw9fiFJJGNF
	X42GzG2g==;
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlM4h-00000009tWu-2nnc
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 07:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769670247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3vg92+QaCjCV3/Bar3U+6CnYR1oFAyAXYUL9A8jeWm8=;
	b=Iob+/9N6mglmQ5CwLaS9ocAUEvMwsKem7aRvOHuqJ5HnZvpj1vwXZDUrnsWiKKeNk39mkq
	UFbqDvLd2nu/cRKHcmggetWBLn3vX8rXwHqI8Rpjn1DgVQV7NLjb4HAmSLVSB61+LJXKgu
	aJVVdIpvm/M8OWL50qQK1YgMS9HnhjY=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCHv5 09/17] mm/sparse: Check memmap alignment for
 compound_info_has_mask()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <5AFAE2FC-7274-4A23-AE92-797D5B69AA8B@nvidia.com>
Date: Thu, 29 Jan 2026 15:03:21 +0800
Cc: Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
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
Message-Id: <8CDE3AB8-EF51-4D53-A1D2-6084A7613E9A@linux.dev>
References: <20260128135500.22121-1-kas@kernel.org>
 <20260128135500.22121-10-kas@kernel.org>
 <B4674CF0-7534-462B-A761-D9124234BFE4@linux.dev>
 <3DA11168-5E37-4CE9-9934-CD1CAF3085D6@nvidia.com>
 <1A08D224-E1AC-4FE5-B1D0-1BAE2D5FF31E@linux.dev>
 <5AFAE2FC-7274-4A23-AE92-797D5B69AA8B@nvidia.com>
To: Zi Yan <ziy@nvidia.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_070421_955514_1083932E 
X-CRM114-Status: GOOD (  16.65  )
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

Cgo+IE9uIEphbiAyOSwgMjAyNiwgYXQgMTE6MjksIFppIFlhbiA8eml5QG52aWRpYS5jb20+IHdy
b3RlOgo+IAo+IE9uIDI4IEphbiAyMDI2LCBhdCAyMjoyMywgTXVjaHVuIFNvbmcgd3JvdGU6Cj4g
Cj4+PiBPbiBKYW4gMjksIDIwMjYsIGF0IDExOjEwLCBaaSBZYW4gPHppeUBudmlkaWEuY29tPiB3
cm90ZToKPj4+IAo+Pj4gT24gMjggSmFuIDIwMjYsIGF0IDIyOjAwLCBNdWNodW4gU29uZyB3cm90
ZToKPj4+IAo+Pj4+PiBPbiBKYW4gMjgsIDIwMjYsIGF0IDIxOjU0LCBLaXJ5bCBTaHV0c2VtYXUg
PGthc0BrZXJuZWwub3JnPiB3cm90ZToKPj4+Pj4gCj4+Pj4+IElmIHBhZ2UtPmNvbXBvdW5kX2lu
Zm8gZW5jb2RlcyBhIG1hc2ssIGl0IGlzIGV4cGVjdGVkIHRoYXQgdm1lbW1hcCB0byBiZQo+Pj4+
PiBuYXR1cmFsbHkgYWxpZ25lZCB0byB0aGUgbWF4aW11bSBmb2xpbyBzaXplLgo+Pj4+PiAKPj4+
Pj4gVHJpZ2dlciBhIEJVRygpIGZvciBDT05GSUdfREVCVUdfVk09eSBvciBXQVJOKCkgb3RoZXJ3
aXNlLgo+Pj4+PiAKPj4+Pj4gU2lnbmVkLW9mZi1ieTogS2lyeWwgU2h1dHNlbWF1IDxrYXNAa2Vy
bmVsLm9yZz4KPj4+Pj4gQWNrZWQtYnk6IFppIFlhbiA8eml5QG52aWRpYS5jb20+Cj4+Pj4+IC0t
LQo+Pj4+PiBtbS9zcGFyc2UuYyB8IDEzICsrKysrKysrKysrKysKPj4+Pj4gMSBmaWxlIGNoYW5n
ZWQsIDEzIGluc2VydGlvbnMoKykKPj4+Pj4gCj4+Pj4+IGRpZmYgLS1naXQgYS9tbS9zcGFyc2Uu
YyBiL21tL3NwYXJzZS5jCj4+Pj4+IGluZGV4IGI1YjJiNmY3MDQxYi4uOWMwZjQwMTU3NzhjIDEw
MDY0NAo+Pj4+PiAtLS0gYS9tbS9zcGFyc2UuYwo+Pj4+PiArKysgYi9tbS9zcGFyc2UuYwo+Pj4+
PiBAQCAtNjAwLDYgKzYwMCwxOSBAQCB2b2lkIF9faW5pdCBzcGFyc2VfaW5pdCh2b2lkKQo+Pj4+
PiBCVUlMRF9CVUdfT04oIWlzX3Bvd2VyX29mXzIoc2l6ZW9mKHN0cnVjdCBtZW1fc2VjdGlvbikp
KTsKPj4+Pj4gbWVtYmxvY2tzX3ByZXNlbnQoKTsKPj4+Pj4gCj4+Pj4+ICsgIGlmIChjb21wb3Vu
ZF9pbmZvX2hhc19tYXNrKCkpIHsKPj4+Pj4gKyAgIHVuc2lnbmVkIGxvbmcgYWxpZ25tZW50Owo+
Pj4+PiArICAgYm9vbCBhbGlnbmVkOwo+Pj4+PiArCj4+Pj4+ICsgICBhbGlnbm1lbnQgPSBNQVhf
Rk9MSU9fTlJfUEFHRVMgKiBzaXplb2Yoc3RydWN0IHBhZ2UpOwo+Pj4+PiArICAgYWxpZ25lZCA9
IElTX0FMSUdORUQoKHVuc2lnbmVkIGxvbmcpIHBmbl90b19wYWdlKDApLCBhbGlnbm1lbnQpOwo+
Pj4+PiArCj4+Pj4+ICsgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfREVCVUdfVk0pKQo+Pj4+PiAr
ICAgQlVHX09OKCFhbGlnbmVkKTsKPj4+Pj4gKyAgIGVsc2UKPj4+Pj4gKyAgIFdBUk5fT04oIWFs
aWduZWQpOwo+Pj4+IAo+Pj4+IFNpbmNlIHlvdeKAmXZlIGZpeGVkIGFsbCB0aGUgcHJvYmxlbWF0
aWMgYXJjaGl0ZWN0dXJlcywgSSBkb27igJl0IGJlbGlldmUKPj4+PiB3ZeKAmWxsIGV2ZXIgaGl0
IHRoZSBXQVJOIG9yIEJVRyBoZXJlIGFueW1vcmUuCj4+Pj4gCj4+Pj4gSSB0aGluayB3ZSBjYW4g
bm93IHNpbXBsaWZ5IHRoZSBjb2RlIGZ1cnRoZXIgYW5kIGp1c3QgdXNlIFZNX0JVR19PTjoKPj4+
PiBpZiBhbnkgYXJjaGl0ZWN0dXJlIGNoYW5nZXMgaW4gdGhlIGZ1dHVyZSwgdGhlIG1pc2FsaWdu
bWVudCB3aWxsIGJlCj4+Pj4gY2F1Z2h0IGR1cmluZyB0ZXN0aW5nLCBzbyB3ZSB3b27igJl0IG5l
ZWQgdG8gd29ycnkgYWJvdXQgaXQgYXQgcnVuLXRpbWUuCj4+Pj4gCj4+PiAKPj4+IFZNX1dBUk5f
T04gc2hvdWxkIGJlIHN1ZmZpY2llbnQsIHNpbmNlIGJvdHMgc2hvdWxkIHJlcG9ydCB3YXJuaW5n
cwo+Pj4gZnJvbSBhbnkgcGF0Y2gvY2hhbmdlLgo+PiAKPj4gSeKAmW0gbm90IHN1cmUgYSBXQVJO
IHdpbGwgZ2V0IGRldmVsb3BlcnPigJkgYXR0ZW50aW9uLCBzaW5jZSB0aGUgbWVzc2FnZQo+PiBp
cyB1bmxpa2VseSB0byBoYXZlIGFueSB2aXNpYmxlIGNvbnNlcXVlbmNlcyBhbmQgb25seSBmaXJl
cyBvbgo+PiBhbGxvY2F0aW9ucyB3aXRoIGEgc3BlY2lhbCBvcmRlci4KPiAKPiBJZiBhIGRldmVs
b3BlciBtaXNzZXMgdGhlIFdBUk4gYW5kIHRoZSBwYXRjaCBnZXRzIGludG8gbGludXgtbW0gb3Ig
bGludXgtbmV4dCwKPiBrZXJuZWwgdGVzdCByb2JvdCBydW5zIHNlbGZ0ZXN0cyBvbiB0aGUga2Vy
bmVsIGFuZCByZXBvcnRzIGFueSB3YXJuaW5ncwo+IHRvIHRoZSBtYWlsaW5nIGxpc3QuIERvIHdl
IGhhdmUgYW55IHJlbGF0ZWQgdGVzdCBpbiBzZWxmdGVzdHMvbW0/IFRoYXQgc2hvdWxkCj4gaGVs
cCB1cyBjYXRjaCBhbnl0aGluZyBpZiBhIGRldmVsb3BlciBkb2VzIG5vdCBjYXRjaCBpdC4KCkkg
bG9va2VkIGF0IHRoZSBzZWxmdGVzdCBhbmQgaXQgZG9lc27igJl0IHNlZW0gdG8gaGF2ZSBhIHRl
c3QgdGhhdAphbGxvY2F0ZXMgYXQgTUFYX0ZPTElPX09SREVSIGFuZCBjaGVja3MgdGhhdCBpdCB3
b3JrcyBjb3JyZWN0bHkuCgo+IAo+IEJlc3QgUmVnYXJkcywKPiBZYW4sIFppCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
