Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82639CA9EDE
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 02:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5LjbeQ8aiglZThQ3CtXtUqb92TXd7TRNSgqZ0toCxtQ=; b=ykClRs451xsdV/
	GropcVMiIdh/NgIAnMbVFiZOLv9sWGtEHH1xL4nt+SnHk2KVPE6AqtFpQGRzaO+6YbBlHJjKo5Pjr
	2lT37KT4KXfkteszTC2qQucMj5vjRUllQrbPN581L70pNKRolyxlK1Tc1uEoQOvZEpsVR1iDDjOeq
	P86VW4z8vkE30sgmPja7ewFlQ7iEs6L4Cvoi9ltbYtAV6SZ+GFL1Id385JafTcOTw4B7/9P85Xajo
	TYc3ETuBzvM07EM7hsJEPR5Dx0ocGfXRYrXW6eG7B8+LSWW9b8GJ/8xoholQgDARG80mCSGDNvlsC
	0WLX+Gfo5tMZUypJxQRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSbM-0000000BqAf-1Oig;
	Tue, 13 Oct 2026 02:50:52 +0000
Received: from out-48.mta0.migadu.com ([2001:41d0:1004:224b::30] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSbI-0000000Bq8t-1jzN
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 02:50:51 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=8wMdqUD76bepHOzOME5xbGf9H6wBMPJCOauRyfPWxJE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791859845; v=1; x=1792464645;
 b=oNPtqFiXxOnTU0X6djyqNB5Ani+3gr1I6RXWS1BqRJvAY16ZMR4dOS8JM5773LU8YHIiFcjn
 Bv1zvPpk1o0kxvVbA+SeDa2/4LNFdl6no0YIWSlHSQSsaH5xf3Rwttgyrl7E+zB/DFCIZSlN+8C
 ChXlTFK6PauB81+RAz+tia2g=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a849ca26c8b26880;
	Tue, 13 Oct 2026 02:50:38 +0000
X-Mizu-Trace-ID: a849ca26c8b26880
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 1/4] mm: fix missing page-table destructor in
 pagetable_free()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261012193114.77147e0a43affa8ee1ae896c@linux-foundation.org>
Date: Tue, 13 Oct 2026 10:50:21 +0800
Cc: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
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
Message-Id: <200A83B9-233C-44C7-B4AF-0900BA1E09DF@linux.dev>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-2-songmuchun@bytedance.com>
 <asy-b7_C3SjnmSaS@gmail.com> <145CD5DC-6457-4E1E-8B9D-AE7D1EDB0AB8@linux.dev>
 <20261012193114.77147e0a43affa8ee1ae896c@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_195048_584820_840DB06A 
X-CRM114-Status: GOOD (  16.96  )
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

Cgo+IE9uIE9jdCAxMywgMjAyNiwgYXQgMTA6MzEsIEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgt
Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+IAo+IE9uIE1vbiwgMTIgT2N0IDIwMjYgMjA6NTU6MDYg
KzA4MDAgTXVjaHVuIFNvbmcgPG11Y2h1bi5zb25nQGxpbnV4LmRldj4gd3JvdGU6Cj4gCj4+IAo+
PiAKPj4+IE9uIE9jdCAxMiwgMjAyNiwgYXQgMTk6MTUsIEpvc2UgQS4gUGVyZXogZGUgQXpwaWxs
YWdhIDxhenBpanJAZ21haWwuY29tPiB3cm90ZToKPj4+IAo+Pj4gT24gU2F0LCBPY3QgMTAsIDIw
MjYgYXQgMDc6MjQ6NTRQTSArMDgwMCwgTXVjaHVuIFNvbmcgd3JvdGU6Cj4+Pj4gU2luY2UgY29t
bWl0IDQ5ZjU5OTY2NjQyMCAoIm1tOiBjYWxsIGN0b3IvZHRvciBmb3Iga2VybmVsIFBURXMiKSwK
Pj4+PiBwdGVfYWxsb2Nfb25lX2tlcm5lbCgpIHJ1bnMgdGhlIHBhZ2UtdGFibGUgY29uc3RydWN0
b3IgZm9yIGtlcm5lbCBQVEUKPj4+PiB0YWJsZXMuCj4+Pj4gCj4+Pj4gSFZPIChIdWdlVExCIFZt
ZW1tYXAgT3B0aW1pemF0aW9uKSB1c2VzIHB0ZV9hbGxvY19vbmVfa2VybmVsKCkgd2hlbgo+Pj4+
IHNwbGl0dGluZyBhIFBNRC4gUmVzdG9yaW5nIHRoZSB2bWVtbWFwIGJhY2tpbmcgcGFnZXMgZG9l
cyBub3QgY29sbGFwc2UKPj4+PiB0aGUgUFRFIHRhYmxlLCBzbyBhIGxhdGVyIG1lbW9yeSBob3Qt
cmVtb3ZlIGV2ZW50dWFsbHkgZnJlZXMgaXQgdGhyb3VnaAo+Pj4+IHBhZ2V0YWJsZV9mcmVlKCkg
b24geDg2LTY0LiBUaGF0IHJlbGVhc2VzIHRoZSBwYWdlIHdpdGhvdXQgcnVubmluZyB0aGUKPj4+
PiBtYXRjaGluZyBkZXN0cnVjdG9yIGFuZCBsZWF2ZXMgTlJfUEFHRVRBQkxFIGVsZXZhdGVkLgo+
Pj4+IAo+Pj4+IE1ha2UgcGFnZXRhYmxlX2ZyZWUoKSBkZXRlY3QgY29uc3RydWN0b3ItYmFja2Vk
IHBhZ2VzIGFuZCBydW4gdGhlCj4+Pj4gZGVzdHJ1Y3RvciBiZWZvcmUgcmVsZWFzaW5nIHRoZWly
IG1lbW9yeSB0byBmaXggdGhlIHByb2JsZW0uCj4+Pj4gCj4+Pj4gRml4ZXM6IDQ5ZjU5OTY2NjQy
MCAoIm1tOiBjYWxsIGN0b3IvZHRvciBmb3Iga2VybmVsIFBURXMiKQo+Pj4+IENjOiBzdGFibGVA
dmdlci5rZXJuZWwub3JnCj4+PiAKPj4+IGlzIHRoZSB4ODYgY2FzZSBjb3ZlcmVkIGZvciA2LjE2
LTYuMTg/IGFzIGZhciBhcyBJIGNhbiBzZWUsIHg4Ngo+Pj4gZnJlZV9wYWdldGFibGUoKSBvbmx5
IHVzZXMgcGFnZXRhYmxlX2ZyZWUoKSBzaW5jZSBiZjllNGUzMGYzNTMKPj4+ICgieDg2L21tOiB1
c2UgcGFnZXRhYmxlX2ZyZWUoKSIpIGluIHY2LjE5LCBzbyB0aGUgYmFja3BvcnQgd291bGRuJ3QK
Pj4+IGNoYW5nZSBhbnl0aGluZyB0aGVyZS4gb3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KPj4g
Cj4+IFllcywgeW91IGFyZSBhYnNvbHV0ZWx5IHJpZ2h0IOKAlCB0aGFua3MgZm9yIGNhdGNoaW5n
IHRoaXMuCj4+IAo+PiBJIGRvdWJsZS1jaGVja2VkIGFuZCBpbmRlZWQgeDg2J3MgZnJlZV9wYWdl
dGFibGUoKSBvbmx5IHN0YXJ0cyB1c2luZwo+PiBwYWdldGFibGVfZnJlZSgpIHNpbmNlIGJmOWU0
ZTMwZjM1MyAoIng4Ni9tbTogdXNlIHBhZ2V0YWJsZV9mcmVlKCkiKSwKPj4gd2hpY2ggbGFuZGVk
IGluIHY2LjE5LiBTbyBmb3IgNi4xNi02LjE4IHRoZSBwcmVyZXF1aXNpdGUgaXMgbm90IHByZXNl
bnQKPj4gYW5kIHRoZSBiYWNrcG9ydCB3b3VsZCBiZSBhIG5vLW9wIHRoZXJlLgo+PiAKPj4gVGhl
IGNvcnJlY3QgdHJhaWxlciBpczoKPj4gCj4+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4g
IyA2LjE2LTYuMTg6IGJmOWU0ZTMwZjM1MzogeDg2L21tOiB1c2UgcGFnZXRhYmxlX2ZyZWUoKQo+
PiAKPj4gQW5kcmV3LCB3b3VsZCB5b3UgYmUgYWJsZSB0byB1cGRhdGUgdGhlIHRyYWlsZXIgaW4g
dGhlIHBhdGNoIHdoZW4geW91Cj4+IHBpY2sgaXQgdXA/IElmIHRoZXJlIGFyZSBmdXJ0aGVyIHJl
dmlldyBjb21tZW50cyB0aGF0IHJlcXVpcmUgY29kZQo+PiBjaGFuZ2VzLCBJJ2xsIGZpeCB0aGlz
IHRyYWlsZXIgYXMgcGFydCBvZiB0aGUgdjMgcmVzcGluLiBUaGFua3MgYSBsb3QhCj4gCj4gSSBk
b24ndCBrbm93IGlmL2hvdyB0aGUgLXN0YWJsZSBtYWludGFpbmVycyBoYW5kbGUgYSBjb21tZW50
IGxpa2UgdGhhdC4KPiBJIGV4cGVjdCBpdCdzIG1vcmUgcmVsaWFibGUgdG8gZG8gdGhpcyB2aWEg
Rml4ZXM6LiAgUG9zc2libGU/Cj4gCgpUaGFua3MuIEkgdXNlZCB0aGlzIGZvcm1hdCBiZWNhdXNl
IGl0IGlzIGV4cGxpY2l0bHkgZG9jdW1lbnRlZCBieSB0aGUKc3RhYmxlIGtlcm5lbCBydWxlcy4K
ClRoZSBzaGVsbC1zdHlsZSBjb21tZW50IGlzIHRoZSBmb3JtYXQgZG9jdW1lbnRlZCBpbgpEb2N1
bWVudGF0aW9uL3Byb2Nlc3Mvc3RhYmxlLWtlcm5lbC1ydWxlcy5yc3QgZm9yIHNwZWNpZnlpbmcg
YWRkaXRpb25hbApwYXRjaCBwcmVyZXF1aXNpdGVzOgoKICBDYzogPHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmc+ICMgMy4zLng6IDxjb21taXQ+OiA8c3ViamVjdD4KICBDYzogPHN0YWJsZUB2Z2VyLmtl
cm5lbC5vcmc+ICMgMy4zLngKClNlZToKCiAgaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvcHJvY2Vz
cy9zdGFibGUta2VybmVsLXJ1bGVzLmh0bWwjb3B0aW9uLTEKCkEgRml4ZXMgdGFnIGFsb25lIGNh
bm5vdCBleHByZXNzIHRoaXMgZGVwZW5kZW5jeS4gSXQgZG9lcyBub3Qgc3BlY2lmeQphbiBhZGRp
dGlvbmFsIGNvbW1pdCB0aGF0IG11c3QgYmUgY2hlcnJ5LXBpY2tlZCBmaXJzdC4gVGhlIGRvY3Vt
ZW50ZWQKQ2MgY29tbWVudCBwcm92aWRlcyBib3RoIHRoZSBwcmVyZXF1aXNpdGUgYW5kIHRoZSBy
ZXF1aXJlZCBjaGVycnktcGljawpvcmRlci4KCldvdWxkIHRoaXMgYmUgc3VmZmljaWVudCBmb3Ig
dGhlIHN0YWJsZSB0ZWFtIHRvIHBpY2sgdXAgdGhlIHByZXJlcXVpc2l0ZT8KClRoYW5rcywKTXVj
aHVuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
