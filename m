Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259C4C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 12:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KaELOCaIZyewg/8DeelYVLpy26ut6SKze8EPVVydbBk=; b=gurt+iv5wwZ/ph
	uwNvaCtIkPEpkQS5qFjL7JiLEpTt/dY1bi0p10mPk2vtL+9VNJc4mzg7k/5ISeRZwsVSV3ExvJdzO
	76RxHu7v6j6ohfQXM0rVoPMD4vXLfxB1fC9RFbP72mS6ckOntQHBFpeYNI9HkYBw32eE27S7bSTDc
	fmT5ORpUTikT46qDxydeB78OKcQa1wyOeqwWTAOEBVMEhNVHJhBPMkW7dcYRQJ6EZqzxKtK7+GaEA
	xXzf46Jr6Xc+fJdQaVmqHFcLnkRJW7azLmWwiSDUdgy51w8uGipuxKRJ8jLwqpjT1zs/1Fqy+M45s
	HmnEHDB5v5E3auGPcKqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV9ki-00000003MAW-3v3q;
	Wed, 31 Jan 2024 12:31:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8a4-000000032Ga-1rM3;
	Wed, 31 Jan 2024 11:16:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1741CDA7;
	Wed, 31 Jan 2024 03:17:18 -0800 (PST)
Received: from [10.57.79.60] (unknown [10.57.79.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCBC23F762;
	Wed, 31 Jan 2024 03:16:28 -0800 (PST)
Message-ID: <57eb82c7-4816-42a2-b5ab-cc221e289b21@arm.com>
Date: Wed, 31 Jan 2024 11:16:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] mm/memory: optimize fork() with PTE-mapped THP
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
References: <20240129124649.189745-1-david@redhat.com>
 <a335a9d2-9b8f-4eb8-ba22-23a223b59b06@arm.com>
 <a1a0e9b3-dae2-418f-bd63-50e65f471728@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <a1a0e9b3-dae2-418f-bd63-50e65f471728@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_031636_602727_877C7360 
X-CRM114-Status: GOOD (  25.50  )
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

T24gMzEvMDEvMjAyNCAxMTowNiwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gT24gMzEuMDEu
MjQgMTE6NDMsIFJ5YW4gUm9iZXJ0cyB3cm90ZToKPj4gT24gMjkvMDEvMjAyNCAxMjo0NiwgRGF2
aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+PiBOb3cgdGhhdCB0aGUgcm1hcCBvdmVyaGF1bFsxXSBp
cyB1cHN0cmVhbSB0aGF0IHByb3ZpZGVzIGEgY2xlYW4gaW50ZXJmYWNlCj4+PiBmb3Igcm1hcCBi
YXRjaGluZywgbGV0J3MgaW1wbGVtZW50IFBURSBiYXRjaGluZyBkdXJpbmcgZm9yayB3aGVuIHBy
b2Nlc3NpbmcKPj4+IFBURS1tYXBwZWQgVEhQcy4KPj4+Cj4+PiBUaGlzIHNlcmllcyBpcyBwYXJ0
aWFsbHkgYmFzZWQgb24gUnlhbidzIHByZXZpb3VzIHdvcmtbMl0gdG8gaW1wbGVtZW50Cj4+PiBj
b250LXB0ZSBzdXBwb3J0IG9uIGFybTY0LCBidXQgaXRzIGEgY29tcGxldGUgcmV3cml0ZSBiYXNl
ZCBvbiBbMV0gdG8KPj4+IG9wdGltaXplIGFsbCBhcmNoaXRlY3R1cmVzIGluZGVwZW5kZW50IG9m
IGFueSBzdWNoIFBURSBiaXRzLCBhbmQgdG8KPj4+IHVzZSB0aGUgbmV3IHJtYXAgYmF0Y2hpbmcg
ZnVuY3Rpb25zIHRoYXQgc2ltcGxpZnkgdGhlIGNvZGUgYW5kIHByZXBhcmUKPj4+IGZvciBmdXJ0
aGVyIHJtYXAgYWNjb3VudGluZyBjaGFuZ2VzLgo+Pj4KPj4+IFdlIGNvbGxlY3QgY29uc2VjdXRp
dmUgUFRFcyB0aGF0IG1hcCBjb25zZWN1dGl2ZSBwYWdlcyBvZiB0aGUgc2FtZSBsYXJnZQo+Pj4g
Zm9saW8sIG1ha2luZyBzdXJlIHRoYXQgdGhlIG90aGVyIFBURSBiaXRzIGFyZSBjb21wYXRpYmxl
LCBhbmQgKGEpIGFkanVzdAo+Pj4gdGhlIHJlZmNvdW50IG9ubHkgb25jZSBwZXIgYmF0Y2gsIChi
KSBjYWxsIHJtYXAgaGFuZGxpbmcgZnVuY3Rpb25zIG9ubHkKPj4+IG9uY2UgcGVyIGJhdGNoIGFu
ZCAoYykgcGVyZm9ybSBiYXRjaCBQVEUgc2V0dGluZy91cGRhdGVzLgo+Pj4KPj4+IFdoaWxlIHRo
aXMgc2VyaWVzIHNob3VsZCBiZSBiZW5lZmljaWFsIGZvciBhZGRpbmcgY29udC1wdGUgc3VwcG9y
dCBvbgo+Pj4gQVJNNjRbMl0sIGl0J3Mgb25lIG9mIHRoZSByZXF1aXJlbWVudHMgZm9yIG1haW50
YWluaW5nIGEgdG90YWwgbWFwY291bnRbM10KPj4+IGZvciBsYXJnZSBmb2xpb3Mgd2l0aCBtaW5p
bWFsIGFkZGVkIG92ZXJoZWFkIGFuZCBmdXJ0aGVyIGNoYW5nZXNbNF0gdGhhdAo+Pj4gYnVpbGQg
dXAgb24gdG9wIG9mIHRoZSB0b3RhbCBtYXBjb3VudC4KPj4+Cj4+PiBJbmRlcGVuZGVudCBvZiBh
bGwgdGhhdCwgdGhpcyBzZXJpZXMgcmVzdWx0cyBpbiBhIHNwZWVkdXAgZHVyaW5nIGZvcmsgd2l0
aAo+Pj4gUFRFLW1hcHBlZCBUSFAsIHdoaWNoIGlzIHRoZSBkZWZhdWx0IHdpdGggVEhQcyB0aGF0
IGFyZSBzbWFsbGVyIHRoYW4gYSBQTUQKPj4+IChmb3IgZXhhbXBsZSwgMTZLaUIgdG8gMTAyNEtp
QiBtVEhQcyBmb3IgYW5vbnltb3VzIG1lbW9yeVs1XSkuCj4+Pgo+Pj4gT24gYW4gSW50ZWwgWGVv
biBTaWx2ZXIgNDIxMFIgQ1BVLCBmb3JrJ2luZyB3aXRoIDFHaUIgb2YgUFRFLW1hcHBlZCBmb2xp
b3MKPj4+IG9mIHRoZSBzYW1lIHNpemUgKHN0ZGRldiA8IDElKSByZXN1bHRzIGluIHRoZSBmb2xs
b3dpbmcgcnVudGltZXMKPj4+IGZvciBmb3JrKCkgKHNob3J0ZXIgaXMgYmV0dGVyKToKPj4+Cj4+
PiBGb2xpbyBTaXplIHwgdjYuOC1yYzEgfMKgwqDCoMKgwqAgTmV3IHwgQ2hhbmdlCj4+PiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+IMKgwqDCoMKgwqDCoCA0
S2lCIHwgMC4wMTQzMjggfCAwLjAxNDAzNSB8wqDCoCAtIDIlCj4+PiDCoMKgwqDCoMKgIDE2S2lC
IHwgMC4wMTQyNjMgfCAwLjAxMTk2wqAgfMKgwqAgLTE2JQo+Pj4gwqDCoMKgwqDCoCAzMktpQiB8
IDAuMDE0MzM0IHwgMC4wMTA5NMKgIHzCoMKgIC0yNCUKPj4+IMKgwqDCoMKgwqAgNjRLaUIgfCAw
LjAxNDA0NiB8IDAuMDEwNDQ0IHzCoMKgIC0yNiUKPj4+IMKgwqDCoMKgIDEyOEtpQiB8IDAuMDE0
MDExIHwgMC4wMTAwNjMgfMKgwqAgLTI4JQo+Pj4gwqDCoMKgwqAgMjU2S2lCIHwgMC4wMTM5OTMg
fCAwLjAwOTkzOCB8wqDCoCAtMjklCj4+PiDCoMKgwqDCoCA1MTJLaUIgfCAwLjAxMzk4MyB8IDAu
MDA5ODXCoCB8wqDCoCAtMzAlCj4+PiDCoMKgwqAgMTAyNEtpQiB8IDAuMDEzOTg2IHwgMC4wMDk4
MsKgIHzCoMKgIC0zMCUKPj4+IMKgwqDCoCAyMDQ4S2lCIHwgMC4wMTQzMDUgfCAwLjAxMDA3NiB8
wqDCoCAtMzAlCj4+Cj4+IEp1c3QgYSBoZWFkcyB1cCB0aGF0IEknbSBzZWVpbmcgc29tZSBzdHJh
bmdlIHJlc3VsdHMgb24gQXBwbGUgTTIuIEZvcmsgZm9yCj4+IG9yZGVyLTAgaXMgc2VlbWluZ2x5
IGNvc3RpbmcgfjE3JSBtb3JlLiBJJ20gdXNpbmcgR0NDIDEzLjIgYW5kIHdhcyBwcmV0dHkgc3Vy
ZSBJCj4+IGRpZG4ndCBzZWUgdGhpcyBwcm9ibGVtIHdpdGggdmVyc2lvbiAxOyBhbHRob3VnaCB0
aGF0IHdhcyBvbiBhIGRpZmZlcmVudAo+PiBiYXNlbGluZSBhbmQgSSd2ZSB0aHJvd24gdGhlIG51
bWJlcnMgYXdheSBzbyB3aWxsIHJlcnVuIGFuZCB0cnkgdG8gZGVidWcgdGhpcy4KPj4KPiAKPiBT
byBmYXIsIG9uIG15IHg4NiB0ZXN0cyAoSW50ZWwsIEFNRCBFUFlDKSwgSSB3YXMgbm90IGFibGUg
dG8gb2JzZXJ2ZSB0aGlzLgo+IGZvcmsoKSBmb3Igb3JkZXItMCB3YXMgY29uc2lzdGVudGx5IGVm
ZmVjdGl2ZWx5IHVuY2hhbmdlZC4gRG8geW91IG9ic2VydmUgdGhhdAo+IG9uIG90aGVyIEFSTSBz
eXN0ZW1zIGFzIHdlbGw/CgpOb3BlOyBydW5uaW5nIHRoZSBleGFjdCBzYW1lIGtlcm5lbCBiaW5h
cnkgYW5kIHVzZXIgc3BhY2Ugb24gQWx0cmEsIEkgc2VlCnNlbnNpYmxlIG51bWJlcnM7Cgpmb3Jr
IG9yZGVyLTA6IC0xLjMlCmZvcmsgb3JkZXItOTogLTcuNiUKZG9udG5lZWQgb3JkZXItMDogLTAu
NSUKZG9udG5lZWQgb3JkZXItOTogMC4xJQptdW5tYXAgb3JkZXItMDogMC4wJQptdW5tYXAgb3Jk
ZXItOTogLTY3LjklCgpTbyBJIGd1ZXNzIHNvbWUgcGlwZWxpbmluZyBpc3N1ZSB0aGF0IGNhdXNl
cyB0aGUgTTIgdG8gc3RhbGwgbW9yZT8KCj4gCj4gCj4+IHwga2VybmVswqDCoMKgwqDCoCB8wqDC
oCBtZWFuX3JlbCB8wqDCoCBzdGRfcmVsIHwKPj4gfDotLS0tLS0tLS0tLS18LS0tLS0tLS0tLS06
fC0tLS0tLS0tLS06fAo+PiB8IG1tLXVuc3RhYmxlIHzCoMKgwqDCoMKgwqAgMC4wJSB8wqDCoMKg
wqDCoCAxLjElIHwKPj4gfCBwYXRjaCAxwqDCoMKgwqAgfMKgwqDCoMKgwqAgLTIuMyUgfMKgwqDC
oMKgwqAgMS4zJSB8Cj4+IHwgcGF0Y2ggMTDCoMKgwqAgfMKgwqDCoMKgwqAgLTIuOSUgfMKgwqDC
oMKgwqAgMi43JSB8Cj4+IHwgcGF0Y2ggMTHCoMKgwqAgfMKgwqDCoMKgwqAgMTMuNSUgfMKgwqDC
oMKgwqAgMC41JSB8Cj4+IHwgcGF0Y2ggMTLCoMKgwqAgfMKgwqDCoMKgwqAgMTUuMiUgfMKgwqDC
oMKgwqAgMS4yJSB8Cj4+IHwgcGF0Y2ggMTPCoMKgwqAgfMKgwqDCoMKgwqAgMTguMiUgfMKgwqDC
oMKgwqAgMC43JSB8Cj4+IHwgcGF0Y2ggMTTCoMKgwqAgfMKgwqDCoMKgwqAgMjAuNSUgfMKgwqDC
oMKgwqAgMS4wJSB8Cj4+IHwgcGF0Y2ggMTXCoMKgwqAgfMKgwqDCoMKgwqAgMTcuMSUgfMKgwqDC
oMKgwqAgMS42JSB8Cj4+IHwgcGF0Y2ggMTXCoMKgwqAgfMKgwqDCoMKgwqAgMTYuNyUgfMKgwqDC
oMKgwqAgMC44JSB8Cj4+Cj4+IGZvcmsgZm9yIG9yZGVyLTkgaXMgbG9va2luZyBnb29kICgtMjAl
KSwgYW5kIGZvciB0aGUgemFwIHNlcmllcywgbXVubWFwIGlzCj4+IGxvb2tpbmcgZ29vZCwgYnV0
IGRvbnRuZWVkIGlzIGxvb2tpbmcgcG9vciBmb3IgYm90aCBvcmRlci0wIGFuZCA5LiBCdXQgb25l
IHRoaW5nCj4+IGF0IGEgdGltZS4uLiBsZXQncyBjb25jZW50cmF0ZSBvbiBmb3JrIG9yZGVyLTAg
Zmlyc3QuCj4gCj4gbXVubWFwIGFuZCBkb250bmVlZCBlbmQgdXAgY2FsbGluZyB0aGUgZXhhY3Qg
c2FtZSBjYWxsIHBhdGhzLiBTbyBhIGJpZwo+IHBlcmZvcm1hbmNlIGRpZmZlcmVuY2UgaXMgcmF0
aGVyIHN1cnByaXNpbmcgYW5kIG1pZ2h0IGluZGljYXRlIHNvbWV0aGluZyBlbHNlLgo+IAo+IChJ
IHRoaW5rIEkgdG9sZCB5b3UgdGhhdCBJIHdhcyBydW5uaW5nIGluIHNvbWUga2luZCBvZiBWTUEg
bWVyZ2luZyBwcm9ibGVtIHdoZXJlCj4gb25lIHdvdWxkIHN1ZGRlbmx5IGdldCB3aXRoIG15IGJl
bmNobWFyayAxIFZNQSBwZXIgcGFnZS4gVGhlIG5ldyBiZW5jaG1hcmsgYmVsb3cKPiB3b3JrcyBh
cm91bmQgdGhhdCwgYnV0IEkgYW0gbm90IHN1cmUgaWYgdGhhdCB3YXMgZml4ZWQgaW4gdGhlIG1l
YW50aW1lKQo+IAo+IFZNQSBtZXJnaW5nIGNhbiBvZiBjb3Vyc2UgZXhwbGFpbiBhIGJpZyBkaWZm
ZXJlbmNlIGluIGZvcmsgYW5kIG11bm1hcCB2cy4KPiBkb250bmVlZCB0aW1lcywgZXNwZWNpYWxs
eSB3aGVuIGNvbXBhcmluZyBkaWZmZXJlbnQgY29kZSBiYXNlIHdoZXJlIHRoYXQgVk1BCj4gbWVy
Z2luZyBiZWhhdmlvciB3YXMgZGlmZmVyZW50Lgo+IAo+Pgo+PiBOb3RlIHRoYXQgSSdtIHN0aWxs
IHVzaW5nIHRoZSAib2xkIiBiZW5jaG1hcmsgY29kZS4gQ291bGQgeW91IHJlc2VuZCBtZSB0aGUg
bGluawo+PiB0byB0aGUgbmV3IGNvZGU/IEFsdGhvdWdoIEkgZG9uJ3QgdGhpbmsgdGhlcmUgc2hv
dWxkIGJlIGFueSBlZmZlY3QgZm9yIG9yZGVyLTAKPj4gYW55d2F5LCBpZiBJIHVuZGVyc3Rvb2Qg
eW91ciBjaGFuZ2VzIGNvcnJlY3RseT8KPiAKPiBUaGlzIGlzIHRoZSBjb21iaW5lZCBvbmUgKHNt
YWxsIGFuZCBsYXJnZSBQVEVzKToKPiAKPiBodHRwczovL2dpdGxhYi5jb20vZGF2aWRoaWxkZW5i
cmFuZC9zY3JhdGNoc3BhY2UvLS9yYXcvbWFpbi9wdGUtbWFwcGVkLWZvbGlvLWJlbmNobWFya3Mu
Yz9pbmxpbmU9ZmFsc2UKCkknbGwgaGF2ZSBhIGdvIHdpdGggdGhpcy4KCj4gCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
