Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1674C47DB3
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 11:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ntWzRsKU3VijwxMhG++VNfxVQdKn1po5m2R1jfIsD+4=; b=CScDPjkIY7AXoH
	4Y2okpPvaRxJha7gtwONANOm151/gqXamsJJokwOadQsyxBdMsn4IZhdIOrdwV/kzkvkmqVhyap9L
	c8eKaCS+Xi2d3SV48gUaTTeANLkzVNj5tdbugMrtGQ4dMpiTTI8ZC8FFmcMQSz8+1kUvodJFIHqlY
	tEp0fcX5dr2g5Z3OXjTLE/E9em7kiWwY2X8pAcFHcGZ1UMg+caiHcqQxw6GFZvC7E5cTt0iGrhzpc
	g1KDJ6oXG1a9A3OWugRno9AzFf+vA5dbb0gchNBY1OHbUD5CVK4kVRZgI1sdG0yvop+X/zq7sKYJ+
	WtDv+MKkj58KSpxSBHmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV961-00000003CvX-1auU;
	Wed, 31 Jan 2024 11:49:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV95x-00000003Ctw-0jpb;
	Wed, 31 Jan 2024 11:49:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2681F11FB;
	Wed, 31 Jan 2024 03:50:14 -0800 (PST)
Received: from [10.57.79.60] (unknown [10.57.79.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E085D3F738;
	Wed, 31 Jan 2024 03:49:26 -0800 (PST)
Message-ID: <714d0930-2202-48b6-9728-d248f820325e@arm.com>
Date: Wed, 31 Jan 2024 11:49:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] mm/memory: optimize fork() with PTE-mapped THP
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
References: <20240129124649.189745-1-david@redhat.com>
 <a335a9d2-9b8f-4eb8-ba22-23a223b59b06@arm.com>
 <a1a0e9b3-dae2-418f-bd63-50e65f471728@redhat.com>
 <57eb82c7-4816-42a2-b5ab-cc221e289b21@arm.com>
 <e6eaba5b-f290-4d1f-990b-a47d89f56ee4@redhat.com>
Content-Language: en-GB
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <e6eaba5b-f290-4d1f-990b-a47d89f56ee4@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_034933_343039_2C472BA1 
X-CRM114-Status: GOOD (  26.30  )
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

T24gMzEvMDEvMjAyNCAxMToyOCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gT24gMzEuMDEu
MjQgMTI6MTYsIFJ5YW4gUm9iZXJ0cyB3cm90ZToKPj4gT24gMzEvMDEvMjAyNCAxMTowNiwgRGF2
aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+PiBPbiAzMS4wMS4yNCAxMTo0MywgUnlhbiBSb2JlcnRz
IHdyb3RlOgo+Pj4+IE9uIDI5LzAxLzIwMjQgMTI6NDYsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3Rl
Ogo+Pj4+PiBOb3cgdGhhdCB0aGUgcm1hcCBvdmVyaGF1bFsxXSBpcyB1cHN0cmVhbSB0aGF0IHBy
b3ZpZGVzIGEgY2xlYW4gaW50ZXJmYWNlCj4+Pj4+IGZvciBybWFwIGJhdGNoaW5nLCBsZXQncyBp
bXBsZW1lbnQgUFRFIGJhdGNoaW5nIGR1cmluZyBmb3JrIHdoZW4gcHJvY2Vzc2luZwo+Pj4+PiBQ
VEUtbWFwcGVkIFRIUHMuCj4+Pj4+Cj4+Pj4+IFRoaXMgc2VyaWVzIGlzIHBhcnRpYWxseSBiYXNl
ZCBvbiBSeWFuJ3MgcHJldmlvdXMgd29ya1syXSB0byBpbXBsZW1lbnQKPj4+Pj4gY29udC1wdGUg
c3VwcG9ydCBvbiBhcm02NCwgYnV0IGl0cyBhIGNvbXBsZXRlIHJld3JpdGUgYmFzZWQgb24gWzFd
IHRvCj4+Pj4+IG9wdGltaXplIGFsbCBhcmNoaXRlY3R1cmVzIGluZGVwZW5kZW50IG9mIGFueSBz
dWNoIFBURSBiaXRzLCBhbmQgdG8KPj4+Pj4gdXNlIHRoZSBuZXcgcm1hcCBiYXRjaGluZyBmdW5j
dGlvbnMgdGhhdCBzaW1wbGlmeSB0aGUgY29kZSBhbmQgcHJlcGFyZQo+Pj4+PiBmb3IgZnVydGhl
ciBybWFwIGFjY291bnRpbmcgY2hhbmdlcy4KPj4+Pj4KPj4+Pj4gV2UgY29sbGVjdCBjb25zZWN1
dGl2ZSBQVEVzIHRoYXQgbWFwIGNvbnNlY3V0aXZlIHBhZ2VzIG9mIHRoZSBzYW1lIGxhcmdlCj4+
Pj4+IGZvbGlvLCBtYWtpbmcgc3VyZSB0aGF0IHRoZSBvdGhlciBQVEUgYml0cyBhcmUgY29tcGF0
aWJsZSwgYW5kIChhKSBhZGp1c3QKPj4+Pj4gdGhlIHJlZmNvdW50IG9ubHkgb25jZSBwZXIgYmF0
Y2gsIChiKSBjYWxsIHJtYXAgaGFuZGxpbmcgZnVuY3Rpb25zIG9ubHkKPj4+Pj4gb25jZSBwZXIg
YmF0Y2ggYW5kIChjKSBwZXJmb3JtIGJhdGNoIFBURSBzZXR0aW5nL3VwZGF0ZXMuCj4+Pj4+Cj4+
Pj4+IFdoaWxlIHRoaXMgc2VyaWVzIHNob3VsZCBiZSBiZW5lZmljaWFsIGZvciBhZGRpbmcgY29u
dC1wdGUgc3VwcG9ydCBvbgo+Pj4+PiBBUk02NFsyXSwgaXQncyBvbmUgb2YgdGhlIHJlcXVpcmVt
ZW50cyBmb3IgbWFpbnRhaW5pbmcgYSB0b3RhbCBtYXBjb3VudFszXQo+Pj4+PiBmb3IgbGFyZ2Ug
Zm9saW9zIHdpdGggbWluaW1hbCBhZGRlZCBvdmVyaGVhZCBhbmQgZnVydGhlciBjaGFuZ2VzWzRd
IHRoYXQKPj4+Pj4gYnVpbGQgdXAgb24gdG9wIG9mIHRoZSB0b3RhbCBtYXBjb3VudC4KPj4+Pj4K
Pj4+Pj4gSW5kZXBlbmRlbnQgb2YgYWxsIHRoYXQsIHRoaXMgc2VyaWVzIHJlc3VsdHMgaW4gYSBz
cGVlZHVwIGR1cmluZyBmb3JrIHdpdGgKPj4+Pj4gUFRFLW1hcHBlZCBUSFAsIHdoaWNoIGlzIHRo
ZSBkZWZhdWx0IHdpdGggVEhQcyB0aGF0IGFyZSBzbWFsbGVyIHRoYW4gYSBQTUQKPj4+Pj4gKGZv
ciBleGFtcGxlLCAxNktpQiB0byAxMDI0S2lCIG1USFBzIGZvciBhbm9ueW1vdXMgbWVtb3J5WzVd
KS4KPj4+Pj4KPj4+Pj4gT24gYW4gSW50ZWwgWGVvbiBTaWx2ZXIgNDIxMFIgQ1BVLCBmb3JrJ2lu
ZyB3aXRoIDFHaUIgb2YgUFRFLW1hcHBlZCBmb2xpb3MKPj4+Pj4gb2YgdGhlIHNhbWUgc2l6ZSAo
c3RkZGV2IDwgMSUpIHJlc3VsdHMgaW4gdGhlIGZvbGxvd2luZyBydW50aW1lcwo+Pj4+PiBmb3Ig
Zm9yaygpIChzaG9ydGVyIGlzIGJldHRlcik6Cj4+Pj4+Cj4+Pj4+IEZvbGlvIFNpemUgfCB2Ni44
LXJjMSB8wqDCoMKgwqDCoCBOZXcgfCBDaGFuZ2UKPj4+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4+IMKgwqDCoMKgwqDCoMKgIDRLaUIgfCAwLjAxNDMy
OCB8IDAuMDE0MDM1IHzCoMKgIC0gMiUKPj4+Pj4gwqDCoMKgwqDCoMKgIDE2S2lCIHwgMC4wMTQy
NjMgfCAwLjAxMTk2wqAgfMKgwqAgLTE2JQo+Pj4+PiDCoMKgwqDCoMKgwqAgMzJLaUIgfCAwLjAx
NDMzNCB8IDAuMDEwOTTCoCB8wqDCoCAtMjQlCj4+Pj4+IMKgwqDCoMKgwqDCoCA2NEtpQiB8IDAu
MDE0MDQ2IHwgMC4wMTA0NDQgfMKgwqAgLTI2JQo+Pj4+PiDCoMKgwqDCoMKgIDEyOEtpQiB8IDAu
MDE0MDExIHwgMC4wMTAwNjMgfMKgwqAgLTI4JQo+Pj4+PiDCoMKgwqDCoMKgIDI1NktpQiB8IDAu
MDEzOTkzIHwgMC4wMDk5MzggfMKgwqAgLTI5JQo+Pj4+PiDCoMKgwqDCoMKgIDUxMktpQiB8IDAu
MDEzOTgzIHwgMC4wMDk4NcKgIHzCoMKgIC0zMCUKPj4+Pj4gwqDCoMKgwqAgMTAyNEtpQiB8IDAu
MDEzOTg2IHwgMC4wMDk4MsKgIHzCoMKgIC0zMCUKPj4+Pj4gwqDCoMKgwqAgMjA0OEtpQiB8IDAu
MDE0MzA1IHwgMC4wMTAwNzYgfMKgwqAgLTMwJQo+Pj4+Cj4+Pj4gSnVzdCBhIGhlYWRzIHVwIHRo
YXQgSSdtIHNlZWluZyBzb21lIHN0cmFuZ2UgcmVzdWx0cyBvbiBBcHBsZSBNMi4gRm9yayBmb3IK
Pj4+PiBvcmRlci0wIGlzIHNlZW1pbmdseSBjb3N0aW5nIH4xNyUgbW9yZS4gSSdtIHVzaW5nIEdD
QyAxMy4yIGFuZCB3YXMgcHJldHR5Cj4+Pj4gc3VyZSBJCj4+Pj4gZGlkbid0IHNlZSB0aGlzIHBy
b2JsZW0gd2l0aCB2ZXJzaW9uIDE7IGFsdGhvdWdoIHRoYXQgd2FzIG9uIGEgZGlmZmVyZW50Cj4+
Pj4gYmFzZWxpbmUgYW5kIEkndmUgdGhyb3duIHRoZSBudW1iZXJzIGF3YXkgc28gd2lsbCByZXJ1
biBhbmQgdHJ5IHRvIGRlYnVnIHRoaXMuCgpOdW1iZXJzIGZvciB2MSBvZiB0aGUgc2VyaWVzLCBi
b3RoIG9uIHRvcCBvZiA2LjgtcmMxIGFuZCByZWJhc2VkIHRvIHRoZSBzYW1lCm1tLXVuc3RhYmxl
IGJhc2UgYXMgdjMgb2YgdGhlIHNlcmllcyAoZmlyc3QgMiByb3dzIGFyZSBmcm9tIHdoYXQgSSBq
dXN0IHBvc3RlZApmb3IgY29udGV4dCk6Cgp8IGtlcm5lbCAgICAgICAgICAgICB8ICAgbWVhbl9y
ZWwgfCAgIHN0ZF9yZWwgfAp8Oi0tLS0tLS0tLS0tLS0tLS0tLS18LS0tLS0tLS0tLS06fC0tLS0t
LS0tLS06fAp8IG1tLXVuc3RhYmUgKGJhc2UpICB8ICAgICAgIDAuMCUgfCAgICAgIDEuMSUgfAp8
IG1tLXVuc3RhYmxlICsgdjMgICB8ICAgICAgMTYuNyUgfCAgICAgIDAuOCUgfAp8IG1tLXVuc3Rh
YmxlICsgdjEgICB8ICAgICAgLTIuNSUgfCAgICAgIDEuNyUgfAp8IHY2LjgtcmMxICsgdjEgICAg
ICB8ICAgICAgLTYuNiUgfCAgICAgIDEuMSUgfAoKU28gYWxsIGxvb2tzIGdvb2Qgd2l0aCB2MS4g
QW5kIHNlZW1zIHRvIHN1Z2dlc3QgbW0tdW5zdGFibGUgaGFzIHJlZ3Jlc3NlZCBieSB+NCUKdnMg
djYuOC1yYzEuIElzIHRoaXMgcmVhbGx5IGEgdXNlZnVsIGJlbmNobWFyaz8gRG9lcyB0aGUgcmF3
IHBlcmZvcm1hbmNlIG9mCmZvcmsoKSBzeXNjYWxsIHJlYWxseSBtYXR0ZXI/IEV2aWRlbmNlIHN1
Z2dlc3RzIGl0cyBtb3ZpbmcgYWxsIG92ZXIgdGhlIHBsYWNlIC0KYnJlYXRoIG9uIHRoZSBjb2Rl
IGFuZCBpdCBjaGFuZ2VzIC0gbm90IGEgZ3JlYXQgcGxhY2UgdG8gYmUgd2hlbiB1c2luZyB0aGUg
dGVzdApmb3IgZ2F0aW5nIHB1cnBvc2VzIQoKU3RpbGwgd2l0aCB0aGUgb2xkIHRlc3RzIC0gSSds
bCBtb3ZlIHRvIHRoZSBuZXcgb25lcyBub3cuCgoKPj4+Pgo+Pj4KPj4+IFNvIGZhciwgb24gbXkg
eDg2IHRlc3RzIChJbnRlbCwgQU1EIEVQWUMpLCBJIHdhcyBub3QgYWJsZSB0byBvYnNlcnZlIHRo
aXMuCj4+PiBmb3JrKCkgZm9yIG9yZGVyLTAgd2FzIGNvbnNpc3RlbnRseSBlZmZlY3RpdmVseSB1
bmNoYW5nZWQuIERvIHlvdSBvYnNlcnZlIHRoYXQKPj4+IG9uIG90aGVyIEFSTSBzeXN0ZW1zIGFz
IHdlbGw/Cj4+Cj4+IE5vcGU7IHJ1bm5pbmcgdGhlIGV4YWN0IHNhbWUga2VybmVsIGJpbmFyeSBh
bmQgdXNlciBzcGFjZSBvbiBBbHRyYSwgSSBzZWUKPj4gc2Vuc2libGUgbnVtYmVyczsKPj4KPj4g
Zm9yayBvcmRlci0wOiAtMS4zJQo+PiBmb3JrIG9yZGVyLTk6IC03LjYlCj4+IGRvbnRuZWVkIG9y
ZGVyLTA6IC0wLjUlCj4+IGRvbnRuZWVkIG9yZGVyLTk6IDAuMSUKPj4gbXVubWFwIG9yZGVyLTA6
IDAuMCUKPj4gbXVubWFwIG9yZGVyLTk6IC02Ny45JQo+Pgo+PiBTbyBJIGd1ZXNzIHNvbWUgcGlw
ZWxpbmluZyBpc3N1ZSB0aGF0IGNhdXNlcyB0aGUgTTIgdG8gc3RhbGwgbW9yZT8KPiAKPiBXaXRo
IG9uZSBlZmZlY3RpdmUgYWRkZWQgZm9saW9fdGVzdF9sYXJnZSgpLCBpdCBjb3VsZCBvbmx5IGJl
IGEgY29kZSBsYXlvdXQKPiBwcm9ibGVtPyBPciB0aGUgY29tcGlsZXIgZG9lcyBzb21ldGhpbmcg
c3R1cGlkLCBidXQgeW91IHNheSB0aGF0IHlvdSBydW4gdGhlCj4gZXhhY3Qgc2FtZSBrZXJuZWwg
YmluYXJ5LCBzbyB0aGF0IGRvZXNuJ3QgbWFrZSBzZW5zZS4KCll1cCwgc2FtZSBiaW5hcnkuIFdl
IGtub3cgdGhpcyBjb2RlIGlzIHZlcnkgc2Vuc2l0aXZlIC0gMSBjeWNsZSBtYWtlcyBhIGJpZwpk
aWZmZXJlbmNlLiBTbyBjb3VsZCBlYXNpbHkgYmUgY29kZSBsYXlvdXQsIGJyYW5jaCBwcmVkaWN0
aW9uLCBldGMuLi4KCj4gCj4gSSdtIGFsc28gc3VycHJpc2VkIGFib3V0IHRoZSBkb250bmVlZCB2
cy4gbXVubWFwIG51bWJlcnMuCgpZb3UgbWVhbiB0aGUgb25lcyBmb3IgQWx0cmEgdGhhdCBJIHBv
c3RlZD8gKEkgZGlkbid0IHBvc3QgYW55IGZvciBNMikuIFRoZSBhbHRyYQpudW1iZXJzIGxvb2sg
b2sgdG8gbWU7IGRvbnRuZWVkIGhhcyBubyBjaGFuZ2UsIGFuZCBtdW5tYXAgaGFzIG5vIGNoYW5n
ZSBmb3IKb3JkZXItMCBhbmQgaXMgbWFzc2l2ZWx5IGltcHJvdmVkIGZvciBvcmRlci05LgoKIERv
ZXNuJ3QgbWFrZSBhbnkgc2Vuc2UKPiAoYWdhaW4sIHRoZXJlIHdhcyB0aGlzIFZNQSBtZXJnaW5n
IHByb2JsZW0gYnV0IGl0IHdvdWxkIHN0aWxsIGFsbG93IGZvciBiYXRjaGluZwo+IHdpdGhpbiBh
IHNpbmdsZSBWTUEgdGhhdCBzcGFucyBleGFjdGx5IG9uZSBsYXJnZSBmb2xpbykuCj4gCj4gV2hh
dCBhcmUgeW91IHVzaW5nIGFzIGJhc2VsaW5lPyBSZWFsbHkganVzdCBtbS11bnN0YWJsZSB2cy4g
bW0tdW5zdGFibGUrcGF0Y2hlcz8KCnllcy4gZXhjZXB0IGZvciAidjYuOC1yYzEgKyB2MSIgYWJv
dmUuCgo+IAo+IExldCdzIHNlZSBpZiB0aGUgbmV3IHRlc3QgY2hhbmdlcyB0aGUgbnVtYmVycyB5
b3UgbWVhc3VyZS4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
