Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43045C47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 13:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zgMsUiVQBHLgbVcl1R/piVwo6V/ZCSL/lhFLGp2eFbU=; b=j9c3zS+RTGrP3B
	dQ//rgePTmpePGEbmFB3nIMSAFg/hGK1ceklgH0RP3gBuHx2lMR97PYfNxzBnhTpliGW5WYZw6ura
	qfRT4GEKc5BDGako7L2rLUdXTWIZZ9EklODJBPcMM8crKQHEftN0CfDC2I7AfhxVTK0TSixNVT+Cy
	CWPYcL91VMXvLS16cDSffp15SeQ1P6gYmuXqX7joVMmHZygkIRyB4EekD0pE5uC0chQ+Ofy9GNnD3
	qYB3H2Nr6NnXYnvbBuq24+akTCt2vOCcbfG0NpWhLOGOL8Zbi8aB2XI8AhOim/J0rsM4EGjysZKfg
	O/4lce4IFMgEofP8pYdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSH35-00GfJj-0Q;
	Tue, 23 Jan 2024 13:42:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSH31-00GfII-0l;
	Tue, 23 Jan 2024 13:42:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D631FEC;
	Tue, 23 Jan 2024 05:43:20 -0800 (PST)
Received: from [10.57.77.165] (unknown [10.57.77.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8BB63F762;
	Tue, 23 Jan 2024 05:42:30 -0800 (PST)
Message-ID: <94d33a07-c59a-4315-9c64-8b4d959ca1f4@arm.com>
Date: Tue, 23 Jan 2024 13:42:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/11] mm/memory: ignore dirty/accessed/soft-dirty bits
 in folio_pte_batch()
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S. Miller"
 <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-11-david@redhat.com>
 <59592b50-fe89-4b32-8490-2e6c296f972f@arm.com>
 <76740e33-9b52-4e23-b407-8ae38bac15ec@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <76740e33-9b52-4e23-b407-8ae38bac15ec@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_054239_372758_8D09EC71 
X-CRM114-Status: GOOD (  19.02  )
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

T24gMjMvMDEvMjAyNCAxMzowNiwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gT24gMjMuMDEu
MjQgMTM6MjUsIFJ5YW4gUm9iZXJ0cyB3cm90ZToKPj4gT24gMjIvMDEvMjAyNCAxOTo0MSwgRGF2
aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+PiBMZXQncyBpZ25vcmUgdGhlc2UgYml0czogdGhleSBh
cmUgaXJyZWxldmFudCBmb3IgZm9yaywgYW5kIHdpbGwgbGlrZWx5Cj4+PiBiZSBpcnJlbGV2YW50
IGZvciB1cGNvbWluZyB1c2VycyBzdWNoIGFzIHBhZ2UgdW5tYXBwaW5nLgo+Pj4KPj4+IFNpZ25l
ZC1vZmYtYnk6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgo+Pj4gLS0tCj4+
PiDCoCBtbS9tZW1vcnkuYyB8IDEwICsrKysrKysrLS0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL21tL21l
bW9yeS5jIGIvbW0vbWVtb3J5LmMKPj4+IGluZGV4IGY1NjNhZWM4NWIyYTguLjM0MWIyYmU4NDVi
NmUgMTAwNjQ0Cj4+PiAtLS0gYS9tbS9tZW1vcnkuYwo+Pj4gKysrIGIvbW0vbWVtb3J5LmMKPj4+
IEBAIC05NTMsMjQgKzk1MywzMCBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgX19jb3B5
X3ByZXNlbnRfcHRlcyhzdHJ1Y3QKPj4+IHZtX2FyZWFfc3RydWN0ICpkc3Rfdm1hLAo+Pj4gwqDC
oMKgwqDCoCBzZXRfcHRlcyhkc3Rfdm1hLT52bV9tbSwgYWRkciwgZHN0X3B0ZSwgcHRlLCBucik7
Cj4+PiDCoCB9Cj4+PiDCoCArc3RhdGljIGlubGluZSBwdGVfdCBfX3B0ZV9iYXRjaF9jbGVhcl9p
Z25vcmVkKHB0ZV90IHB0ZSkKPj4+ICt7Cj4+PiArwqDCoMKgIHJldHVybiBwdGVfY2xlYXJfc29m
dF9kaXJ0eShwdGVfbWtjbGVhbihwdGVfbWtvbGQocHRlKSkpOwo+Pj4gK30KPj4+ICsKPj4+IMKg
IC8qCj4+PiDCoMKgICogRGV0ZWN0IGEgUFRFIGJhdGNoOiBjb25zZWN1dGl2ZSAocHJlc2VudCkg
UFRFcyB0aGF0IG1hcCBjb25zZWN1dGl2ZQo+Pj4gwqDCoCAqIHBhZ2VzIG9mIHRoZSBzYW1lIGZv
bGlvLgo+Pj4gwqDCoCAqCj4+PiDCoMKgICogQWxsIFBURXMgaW5zaWRlIGEgUFRFIGJhdGNoIGhh
dmUgdGhlIHNhbWUgUFRFIGJpdHMgc2V0LCBleGNsdWRpbmcgdGhlIFBGTi4KPj4KPj4gbml0OiBs
YXN0IGNoYXIgc2hvdWxkIGJlIGEgY29tbWEgKCwpIG5vdCBhIGZ1bGwgc3RvcCAoLikKPj4KPj4+
ICsgKiB0aGUgYWNjZXNzZWQgYml0LCBkaXJ0eSBiaXQgYW5kIHNvZnQtZGlydHkgYml0Lgo+Pj4g
wqDCoCAqLwo+Pj4gwqAgc3RhdGljIGlubGluZSBpbnQgZm9saW9fcHRlX2JhdGNoKHN0cnVjdCBm
b2xpbyAqZm9saW8sIHVuc2lnbmVkIGxvbmcgYWRkciwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBw
dGVfdCAqc3RhcnRfcHRlcCwgcHRlX3QgcHRlLCBpbnQgbWF4X25yKQo+Pj4gwqAgewo+Pj4gwqDC
oMKgwqDCoCB1bnNpZ25lZCBsb25nIGZvbGlvX2VuZF9wZm4gPSBmb2xpb19wZm4oZm9saW8pICsg
Zm9saW9fbnJfcGFnZXMoZm9saW8pOwo+Pj4gwqDCoMKgwqDCoCBjb25zdCBwdGVfdCAqZW5kX3B0
ZXAgPSBzdGFydF9wdGVwICsgbWF4X25yOwo+Pj4gLcKgwqDCoCBwdGVfdCBleHBlY3RlZF9wdGUg
PSBwdGVfbmV4dF9wZm4ocHRlKTsKPj4+ICvCoMKgwqAgcHRlX3QgZXhwZWN0ZWRfcHRlID0gX19w
dGVfYmF0Y2hfY2xlYXJfaWdub3JlZChwdGVfbmV4dF9wZm4ocHRlKSk7Cj4+PiDCoMKgwqDCoMKg
IHB0ZV90ICpwdGVwID0gc3RhcnRfcHRlcCArIDE7Cj4+PiDCoCDCoMKgwqDCoMKgIFZNX1dBUk5f
T05fRk9MSU8oIXB0ZV9wcmVzZW50KHB0ZSksIGZvbGlvKTsKPj4+IMKgIMKgwqDCoMKgwqAgd2hp
bGUgKHB0ZXAgIT0gZW5kX3B0ZXApIHsKPj4+IC3CoMKgwqDCoMKgwqDCoCBwdGUgPSBwdGVwX2dl
dChwdGVwKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBwdGUgPSBfX3B0ZV9iYXRjaF9jbGVhcl9pZ25v
cmVkKHB0ZXBfZ2V0KHB0ZXApKTsKPj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIXB0ZV9z
YW1lKHB0ZSwgZXhwZWN0ZWRfcHRlKSkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJy
ZWFrOwo+Pgo+PiBJIHRoaW5rIHlvdSdsbCBsb3NlIGRpcnR5IGluZm9ybWF0aW9uIGluIHRoZSBj
aGlsZCBmb3IgcHJpdmF0ZSBtYXBwaW5ncz8gSWYgdGhlCj4+IGZpcnN0IHB0ZSBpbiBhIGJhdGNo
IGlzIGNsZWFuLCBidXQgYSBzdWJzZXF1ZW50IHBhZ2UgaXMgZGlydHksIHlvdSB3aWxsIGVuZCB1
cAo+PiBzZXR0aW5nIGFsbCB0aGUgcGFnZXMgaW4gdGhlIGJhdGNoIGFzIGNsZWFuIGluIHRoZSBj
aGlsZC4gUHJldmlvdXMgYmVoYXZpb3IKPj4gd291bGQgcHJlc2VydmUgZGlydHkgYml0IGZvciBw
cml2YXRlIG1hcHBpbmdzLgo+Pgo+PiBJbiBteSB2ZXJzaW9uICh2MykgdGhhdCBkaWQgYXJiaXRy
YXJ5IGJhdGNoaW5nLCBJIGhhZCBzb21lIGZ1biBhbmQgZ2FtZXMKPj4gdHJhY2tpbmcgZGlydHks
IHdyaXRlIGFuZCB1ZmZkX3dwOgo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0t
a2VybmVsLzIwMjMxMjA0MTA1NDQwLjYxNDQ4LTItcnlhbi5yb2JlcnRzQGFybS5jb20vCj4+Cj4+
IEFsc28sIEkgdGhpbmsgeW91IHdpbGwgY3VycmVudGx5IGVpdGhlciBzZXQgc29mdCBkaXJ0eSBv
biBhbGwgb3Igbm9uZSBvZiB0aGUKPj4gcGFnZXMgaW4gdGhlIGJhdGNoLCBkZXBlbmRpbmcgb24g
dGhlIHZhbHVlIG9mIHRoZSBmaXJzdC4gSSBwcmV2aW91c2x5IGNvbnZpbmNlZAo+PiBteXNlbGYg
dGhhdCB0aGUgc3RhdGUgd2FzIHVuaW1wb3J0YW50IHNvIGFsd2F5cyBjbGVhcmVkIGl0IGluIHRo
ZSBjaGlsZCB0bwo+PiBwcm92aWRlIGNvbnNpc3RlbmN5Lgo+IAo+IEdvb2QgcG9pbnRzIHJlZ2Fy
ZGluZyBkaXJ0eSBhbmQgc29mdC1kaXJ0eS4gSSB3YW50ZWQgdG8gYXZvaWQgcGFzc2luZyBmbGFn
cyB0bwo+IGZvbGlvX3B0ZV9iYXRjaCgpLCBidXQgbWF5YmUgdGhhdCdzIGp1c3Qgd2hhdCB3ZSBu
ZWVkIHRvIG5vdCBjaGFuZ2UgYmVoYXZpb3IuCgpJIHRoaW5rIHlvdSBjb3VsZCBub3QgYm90aGVy
IHdpdGggdGhlIGVuZm9yY2VfdWZmZF93cCAtIGp1c3QgYWx3YXlzIGVuZm9yY2UKdWZmZC13cC4g
U28gdGhhdCdzIG9uZSBzaW1wbGlmaWNhdGlvbiB2cyBtaW5lLiBUaGVuIHlvdSBqdXN0IG5lZWQg
YW4gYW55X2RpcnR5CmZsYWcgZm9sbG93aW5nIHRoZSBzYW1lIHBhdHRlcm4gYXMgeW91ciBhbnlf
d3JpdGFibGUuIFRoZW4ganVzdCBzZXQgZGlydHkgb24gdGhlCndob2xlIGJhdGNoIGluIHRoZSBj
aGlsZCBpZiBhbnkgd2VyZSBkaXJ0eSBpbiB0aGUgcGFyZW50LgoKQWx0aG91Z2ggbm93IEknbSB3
b25kZXJpbmcgaWYgdGhlcmUgaXMgYSByYWNlIGhlcmUuLi4gV2hhdCBoYXBwZW5zIGlmIGEgcGFn
ZSBpbgp0aGUgcGFyZW50IGJlY29tZXMgZGlydHkgYWZ0ZXIgeW91IGhhdmUgY2hlY2tlZCBpdCBi
dXQgYmVmb3JlIHlvdSB3cml0ZSBwcm90ZWN0Cml0PyBJc24ndCB0aGF0IGFscmVhZHkgYSBwcm9i
bGVtIHdpdGggdGhlIGN1cnJlbnQgbm9uLWJhdGNoZWQgdmVyc2lvbj8gV2h5IGRvIHdlCmV2ZW4g
dG8gcHJlc2VydmUgZGlydHkgaW4gdGhlIGNoaWxkIGZvciBwcml2YXRlIG1hcHBpbmdzPwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
