Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0026ACC6B03
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 06:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NL2w5f2XKvgVKs7yYgByOaMtuld88AN3/CJC5RZOqhw=; b=VOzMNdYTe1Sebl
	UMmhWBB1sy1G96oLvXqanakZ30eaROybkmNW1MtJLWpbhA1Zq/9bz0R8Pm4GQsptl2udj+f5eAPqW
	xSxk4x8gS9/RtS1BIlrqRIne3yBSmFyzS30prBTROLJO5MVgOUOIQboEnKq3WExuDxtWMzeW32euq
	mFeq4BtmfgGgpupnbXCuNfYrScTSICMUA8LSYjSsykAipcweWw9JwJ2mNGHCN43q+wKOGzLyL4H6L
	kiSJZmzURpZaiSbv4vu2RhQLpKtf0MNR7fiJbOXM1JkNnP3sEG0YMaEzseV4ILNE+tDs6M23swM+0
	jpMuC5jNtE6WuEIQWPXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGW5Y-0000000C9Zd-0kof;
	Tue, 13 Oct 2026 06:34:16 +0000
Received: from out-209.mta1.migadu.com ([2001:41d0:203:375::d1] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGW5U-0000000C9Yd-0KYi
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 06:34:14 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=x3TJ+nLYXw+aqTgNhbnY0u+0hp8FGUc5AIcm44+MuiU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791873249; v=1; x=1792478049;
 b=jPEz53G9zFtMf7S7MMA3ep20v99EcICky/EP9W6meqhELt5OpbuudGf6WopZUAQNGX9cbUKp
 oL5ue2WlC4wtiqVIRa6KGdXuVmtzRp5adDL+7FzQKnKieXPXu4d223bjJvrQA680vlem2AgFhI7
 Sdrm3rr1ohq7fHe9xPgdcgq0=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4af039548b386c01;
	Tue, 13 Oct 2026 06:34:09 +0000
X-Mizu-Trace-ID: 4af039548b386c01
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 1/4] mm: fix missing page-table destructor in
 pagetable_free()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <3ab63358-8bbe-4457-b21c-bb81bca804cc@gmail.com>
Date: Tue, 13 Oct 2026 14:33:49 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <songmuchun@bytedance.com>,
 David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Dave Hansen <dave.hansen@intel.com>,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org,
 linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Message-Id: <2B2F2818-9309-450B-A2A4-9F53D802F1C6@linux.dev>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-2-songmuchun@bytedance.com>
 <asy-b7_C3SjnmSaS@gmail.com> <145CD5DC-6457-4E1E-8B9D-AE7D1EDB0AB8@linux.dev>
 <3ab63358-8bbe-4457-b21c-bb81bca804cc@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_233412_264217_40166CAA 
X-CRM114-Status: GOOD (  12.08  )
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

Cgo+IE9uIE9jdCAxMywgMjAyNiwgYXQgMDE6MjEsIEpvc2UgQS4gUGVyZXogZGUgQXpwaWxsYWdh
IDxhenBpanJAZ21haWwuY29tPiB3cm90ZToKPiAKPiBPbiAxMC8xMi8yNiAyOjU1IFBNLCBNdWNo
dW4gU29uZyB3cm90ZToKPj4gCj4+IAo+Pj4gT24gT2N0IDEyLCAyMDI2LCBhdCAxOToxNSwgSm9z
ZSBBLiBQZXJleiBkZSBBenBpbGxhZ2EgPGF6cGlqckBnbWFpbC5jb20+IHdyb3RlOgo+Pj4gCj4+
PiBPbiBTYXQsIE9jdCAxMCwgMjAyNiBhdCAwNzoyNDo1NFBNICswODAwLCBNdWNodW4gU29uZyB3
cm90ZToKPj4+PiBTaW5jZSBjb21taXQgNDlmNTk5NjY2NDIwICgibW06IGNhbGwgY3Rvci9kdG9y
IGZvciBrZXJuZWwgUFRFcyIpLAo+Pj4+IHB0ZV9hbGxvY19vbmVfa2VybmVsKCkgcnVucyB0aGUg
cGFnZS10YWJsZSBjb25zdHJ1Y3RvciBmb3Iga2VybmVsIFBURQo+Pj4+IHRhYmxlcy4KPj4+PiAK
Pj4+PiBIVk8gKEh1Z2VUTEIgVm1lbW1hcCBPcHRpbWl6YXRpb24pIHVzZXMgcHRlX2FsbG9jX29u
ZV9rZXJuZWwoKSB3aGVuCj4+Pj4gc3BsaXR0aW5nIGEgUE1ELiBSZXN0b3JpbmcgdGhlIHZtZW1t
YXAgYmFja2luZyBwYWdlcyBkb2VzIG5vdCBjb2xsYXBzZQo+Pj4+IHRoZSBQVEUgdGFibGUsIHNv
IGEgbGF0ZXIgbWVtb3J5IGhvdC1yZW1vdmUgZXZlbnR1YWxseSBmcmVlcyBpdCB0aHJvdWdoCj4+
Pj4gcGFnZXRhYmxlX2ZyZWUoKSBvbiB4ODYtNjQuIFRoYXQgcmVsZWFzZXMgdGhlIHBhZ2Ugd2l0
aG91dCBydW5uaW5nIHRoZQo+Pj4+IG1hdGNoaW5nIGRlc3RydWN0b3IgYW5kIGxlYXZlcyBOUl9Q
QUdFVEFCTEUgZWxldmF0ZWQuCj4+Pj4gCj4+Pj4gTWFrZSBwYWdldGFibGVfZnJlZSgpIGRldGVj
dCBjb25zdHJ1Y3Rvci1iYWNrZWQgcGFnZXMgYW5kIHJ1biB0aGUKPj4+PiBkZXN0cnVjdG9yIGJl
Zm9yZSByZWxlYXNpbmcgdGhlaXIgbWVtb3J5IHRvIGZpeCB0aGUgcHJvYmxlbS4KPj4+PiAKPj4+
PiBGaXhlczogNDlmNTk5NjY2NDIwICgibW06IGNhbGwgY3Rvci9kdG9yIGZvciBrZXJuZWwgUFRF
cyIpCj4+Pj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPj4+IAo+Pj4gaXMgdGhlIHg4NiBj
YXNlIGNvdmVyZWQgZm9yIDYuMTYtNi4xOD8gYXMgZmFyIGFzIEkgY2FuIHNlZSwgeDg2Cj4+PiBm
cmVlX3BhZ2V0YWJsZSgpIG9ubHkgdXNlcyBwYWdldGFibGVfZnJlZSgpIHNpbmNlIGJmOWU0ZTMw
ZjM1Mwo+Pj4gKCJ4ODYvbW06IHVzZSBwYWdldGFibGVfZnJlZSgpIikgaW4gdjYuMTksIHNvIHRo
ZSBiYWNrcG9ydCB3b3VsZG4ndAo+Pj4gY2hhbmdlIGFueXRoaW5nIHRoZXJlLiBvciBhbSBJIG1p
c3Npbmcgc29tZXRoaW5nPwo+PiAKPj4gWWVzLCB5b3UgYXJlIGFic29sdXRlbHkgcmlnaHQg4oCU
IHRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcy4KPj4gCj4+IEkgZG91YmxlLWNoZWNrZWQgYW5kIGlu
ZGVlZCB4ODYncyBmcmVlX3BhZ2V0YWJsZSgpIG9ubHkgc3RhcnRzIHVzaW5nCj4+IHBhZ2V0YWJs
ZV9mcmVlKCkgc2luY2UgYmY5ZTRlMzBmMzUzICgieDg2L21tOiB1c2UgcGFnZXRhYmxlX2ZyZWUo
KSIpLAo+PiB3aGljaCBsYW5kZWQgaW4gdjYuMTkuIFNvIGZvciA2LjE2LTYuMTggdGhlIHByZXJl
cXVpc2l0ZSBpcyBub3QgcHJlc2VudAo+PiBhbmQgdGhlIGJhY2twb3J0IHdvdWxkIGJlIGEgbm8t
b3AgdGhlcmUuCj4+IAo+PiBUaGUgY29ycmVjdCB0cmFpbGVyIGlzOgo+PiAKPj4gQ2M6IDxzdGFi
bGVAdmdlci5rZXJuZWwub3JnPiAjIDYuMTYtNi4xODogYmY5ZTRlMzBmMzUzOiB4ODYvbW06IHVz
ZSBwYWdldGFibGVfZnJlZSgpCj4gCj4gYWxzbywgYmY5ZTRlMzBmMzUzIGFsb25lIGxlYWtzIFBN
RC1zaXplZCB2bWVtbWFwIHBhZ2VzIG9uIHRob3NlIHRyZWVzLAo+IGl0IG5lZWRzIDM5NDA2YzA1
ZjhmMSAoIng4Ni9tbTogRml4IGZyZWVpbmcgb2YgUE1ELXNpemVkIHZtZW1tYXAgcGFnZXMiKQo+
IGFzIHdlbGwgOikKClllYWgsIHlvdSBhcmUgc28gbWV0aWN1bG91cy4KCj4gCj4gUmV2aWV3ZWQt
Ynk6IEpvc2UgQS4gUGVyZXogZGUgQXpwaWxsYWdhIDxhenBpanJAZ21haWwuY29tPgo+IAoKVGhh
bmtzLgoKPiAtLSAKPiBjaGVlcnMsCj4gam9zZSBhLiBwLWEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
