Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A86AC47DDC
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 20:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l6iUuHqX96d5B1gaDCAlEG2YhGLlcp6pOdJMQinfMAY=; b=HGbQeVMuKdmNyX
	kn6aBOSGXD6Ib+0qkfjX6QmkzENWQkBp/b2PaltGZ0YD6Lwp/G2AFCPawAj3kNVzhuSGz6BfAwdrd
	LubHHhord9zV33UqKNk2qXjwvaEbMkHAiBMO5eOYRZwFySLG7L0SoEp/t2LQaUDss7Es8YA5Osmzj
	yNddeyWqPyBv/wnvrLikGSCagagxxZ10G6PLlYyUWgmP+ARufqabSTZ2LpwCzyPPUdLUBYWCN5fow
	eYIPvNLibj/6ojzAV9hkTjGwTt9I7Al288tC8wl70AUqRKokPt92ohJInSLjZu1Uu7htjRo6TJa46
	1Et3nMyx7AWrgKcEBTcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSNct-000Qbp-2m;
	Tue, 23 Jan 2024 20:44:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSNcp-000QZK-1J;
	Tue, 23 Jan 2024 20:44:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F4471FB;
	Tue, 23 Jan 2024 12:44:44 -0800 (PST)
Received: from [10.57.77.165] (unknown [10.57.77.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 526623F73F;
	Tue, 23 Jan 2024 12:43:55 -0800 (PST)
Message-ID: <f9eb630a-f0f8-4219-b74f-109c51f31eb4@arm.com>
Date: Tue, 23 Jan 2024 20:43:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/11] mm/memory: optimize fork() with PTE-mapped THP
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
 <56bee384-461e-4167-b7e9-4dd60666dd66@arm.com>
 <fa9425e8-f489-48d0-9bf5-98d1b46b6d1a@redhat.com>
 <7d92d27a-44f6-47d0-8eab-3f80bd7bd75d@arm.com>
 <33cf54a9-b855-4d2d-9926-a4936fc9068b@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <33cf54a9-b855-4d2d-9926-a4936fc9068b@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_124403_610294_09D34FB7 
X-CRM114-Status: GOOD (  26.27  )
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

T24gMjMvMDEvMjAyNCAyMDoxNCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gT24gMjMuMDEu
MjQgMjA6NDMsIFJ5YW4gUm9iZXJ0cyB3cm90ZToKPj4gT24gMjMvMDEvMjAyNCAxOTozMywgRGF2
aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+PiBPbiAyMy4wMS4yNCAyMDoxNSwgUnlhbiBSb2JlcnRz
IHdyb3RlOgo+Pj4+IE9uIDIyLzAxLzIwMjQgMTk6NDEsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3Rl
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
IHRoYXQKPj4+Pj4gYnVpbGQgdXAgb24gdG9wIG9mIHRoZSB0b3RhbCBtYXBjb3VudC4KPj4+Pgo+
Pj4+IEknbSBjdXJyZW50bHkgcmViYXNpbmcgbXkgY29udHB0ZSB3b3JrIG9udG8gdGhpcyBzZXJp
ZXMsIGFuZCBoYXZlIGhpdCBhCj4+Pj4gcHJvYmxlbS4KPj4+PiBJIG5lZWQgdG8gZXhwb3NlIHRo
ZSAic2l6ZSIgb2YgYSBwdGUgKHB0ZV9zaXplKCkpIGFuZCBza2lwIGZvcndhcmQgdG8gdGhlIHN0
YXJ0Cj4+Pj4gb2YgdGhlIG5leHQgKGNvbnQpcHRlIGV2ZXJ5IHRpbWUgdGhyb3VnaCB0aGUgZm9s
aW9fcHRlX2JhdGNoKCkgbG9vcC4gQnV0Cj4+Pj4gcHRlX25leHRfcGZuKCkgb25seSBhbGxvd3Mg
YWR2YW5jaW5nIGJ5IDEgcGZuOyBJIG5lZWQgdG8gYWR2YW5jZSBieSBuciBwZm5zOgo+Pj4+Cj4+
Pj4KPj4+PiBzdGF0aWMgaW5saW5lIGludCBmb2xpb19wdGVfYmF0Y2goc3RydWN0IGZvbGlvICpm
b2xpbywgdW5zaWduZWQgbG9uZyBhZGRyLAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgcHRlX3QgKnN0
YXJ0X3B0ZXAsIHB0ZV90IHB0ZSwgaW50IG1heF9uciwgYm9vbCAqYW55X3dyaXRhYmxlKQo+Pj4+
IHsKPj4+PiDCoMKgwqDCoMKgdW5zaWduZWQgbG9uZyBmb2xpb19lbmRfcGZuID0gZm9saW9fcGZu
KGZvbGlvKSArIGZvbGlvX25yX3BhZ2VzKGZvbGlvKTsKPj4+PiDCoMKgwqDCoMKgY29uc3QgcHRl
X3QgKmVuZF9wdGVwID0gc3RhcnRfcHRlcCArIG1heF9ucjsKPj4+PiDCoMKgwqDCoMKgcHRlX3Qg
ZXhwZWN0ZWRfcHRlID0gX19wdGVfYmF0Y2hfY2xlYXJfaWdub3JlZChwdGVfbmV4dF9wZm4ocHRl
KSk7Cj4+Pj4gLcKgwqDCoCBwdGVfdCAqcHRlcCA9IHN0YXJ0X3B0ZXAgKyAxOwo+Pj4+ICvCoMKg
wqAgcHRlX3QgKnB0ZXAgPSBzdGFydF9wdGVwOwo+Pj4+ICvCoMKgwqAgaW50IHZmbiwgbnIsIGk7
Cj4+Pj4gwqDCoMKgwqDCoGJvb2wgd3JpdGFibGU7Cj4+Pj4KPj4+PiDCoMKgwqDCoMKgaWYgKGFu
eV93cml0YWJsZSkKPj4+PiDCoMKgwqDCoMKgwqDCoMKgICphbnlfd3JpdGFibGUgPSBmYWxzZTsK
Pj4+Pgo+Pj4+IMKgwqDCoMKgwqBWTV9XQVJOX09OX0ZPTElPKCFwdGVfcHJlc2VudChwdGUpLCBm
b2xpbyk7Cj4+Pj4KPj4+PiArwqDCoMKgIHZmbiA9IGFkZHIgPj4gUEFHRV9TSVpFOwo+Pj4+ICvC
oMKgwqAgbnIgPSBwdGVfc2l6ZShwdGUpOwo+Pj4+ICvCoMKgwqAgbnIgPSBBTElHTl9ET1dOKHZm
biArIG5yLCBucikgLSB2Zm47Cj4+Pj4gK8KgwqDCoCBwdGVwICs9IG5yOwo+Pj4+ICsKPj4+PiDC
oMKgwqDCoMKgd2hpbGUgKHB0ZXAgIT0gZW5kX3B0ZXApIHsKPj4+PiArwqDCoMKgwqDCoMKgwqAg
cHRlID0gcHRlcF9nZXQocHRlcCk7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBuciA9IHB0ZV9zaXpl
KHB0ZSk7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAoYW55X3dyaXRhYmxlKQo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0YWJsZSA9ICEhcHRlX3dyaXRlKHB0ZSk7Cj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoCBwdGUgPSBfX3B0ZV9iYXRjaF9jbGVhcl9pZ25vcmVkKHB0ZSk7Cj4+Pj4K
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIGlmICghcHRlX3NhbWUocHRlLCBleHBlY3RlZF9wdGUpKQo+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+Pgo+Pj4+IMKgwqDCoMKgwqDC
oMKgwqAgLyoKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgKiBTdG9wIGltbWVkaWF0ZWx5IG9uY2Ug
d2UgcmVhY2hlZCB0aGUgZW5kIG9mIHRoZSBmb2xpby4gSW4KPj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgKiBjb3JuZXIgY2FzZXMgdGhlIG5leHQgUEZOIG1pZ2h0IGZhbGwgaW50byBhIGRpZmZlcmVu
dAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAqIGZvbGlvLgo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCAqLwo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAocHRlX3BmbihwdGUpID09IGZvbGlvX2VuZF9w
Zm4pCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChwdGVfcGZuKHB0ZSkgPj0gZm9saW9fZW5kX3Bm
bikKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4KPj4+PiDCoMKgwqDC
oMKgwqDCoMKgIGlmIChhbnlfd3JpdGFibGUpCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICphbnlfd3JpdGFibGUgfD0gd3JpdGFibGU7Cj4+Pj4KPj4+PiAtwqDCoMKgwqDCoMKgwqAgZXhw
ZWN0ZWRfcHRlID0gcHRlX25leHRfcGZuKGV4cGVjdGVkX3B0ZSk7Cj4+Pj4gLcKgwqDCoMKgwqDC
oMKgIHB0ZXArKzsKPj4+PiArwqDCoMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IG5yOyBpKysp
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXhwZWN0ZWRfcHRlID0gcHRlX25leHRfcGZu
KGV4cGVjdGVkX3B0ZSk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHB0ZXAgKz0gbnI7Cj4+Pj4gwqDC
oMKgwqDCoH0KPj4+Pgo+Pj4+IMKgwqDCoMKgwqByZXR1cm4gcHRlcCAtIHN0YXJ0X3B0ZXA7Cj4+
Pj4gfQo+Pj4+Cj4+Pj4KPj4+PiBTbyBJJ20gd29uZGVyaW5nIGlmIGluc3RlYWQgb2YgZW5hYmxp
bmcgcHRlX25leHRfcGZuKCkgZm9yIGFsbCB0aGUgYXJjaGVzLAo+Pj4+IHBlcmhhcHMgaXRzIGFj
dHVhbGx5IGJldHRlciB0byBleHBvc2UgcHRlX3BncHJvdCgpIGZvciBhbGwgdGhlIGFyY2hlcy4g
VGhlbiB3ZQo+Pj4+IGNhbiBiZSBtdWNoIG1vcmUgZmxleGlibGUgYWJvdXQgZ2VuZXJhdGluZyBw
dGVzIHdpdGggcGZuX3B0ZShwZm4sIHBncHJvdCkuCj4+Pj4KPj4+PiBXaGF0IGRvIHlvdSB0aGlu
az8KPj4+Cj4+PiBUaGUgcHRlX3BncHJvdCgpIHN0dWZmIGlzIGp1c3QgbmFzdHkgSU1ITy4KPj4K
Pj4gSSBkdW5ubzsgd2UgaGF2ZSBwZm5fcHRlKCkgd2hpY2ggdGFrZXMgYSBwZm4gYW5kIGEgcGdw
cm90LiBJdCBzZWVtcyByZWFzb25hYmxlCj4+IHRoYXQgd2Ugc2hvdWxkIGJlIGFibGUgdG8gZG8g
dGhlIHJldmVyc2UuCj4gCj4gQnV0IHB0ZV9wZ3Byb3QoKSBpcyBvbmx5IGF2YWlsYWJsZSBvbiBh
IGhhbmRmdWwgb2YgYXJjaGl0ZWN0dXJlcywgbm8/IEl0IHdvdWxkCj4gYmUgbmljZSB0byBoYXZl
IGEgY29tcGxldGVseSBnZW5lcmljIHB0ZV9uZXh0X3BmbigpIC8gcHRlX2FkdmFuY2VfcGZucygp
LCB0aG91Z2guCj4gCj4gQW55aG93LCB0aGlzIGlzIGFsbCAiZWFzeSIgdG8gcmV3b3JrIGxhdGVy
LiBVbmxlc3MgSSBhbSBtaXNzaW5nIHNvbWV0aGluZywgdGhlCj4gbG93IGhhbmdpbmcgZnJ1aXQg
aXMgc2ltcGx5IHVzaW5nIFBGTl9QVEVfU0hJRlQgZm9yIG5vdyB0aGF0IGV4aXN0cyBvbiBtb3N0
Cj4gYXJjaHMgYWxyZWFkeS4KPiAKPj4KPj4+Cj4+PiBMaWtlbHkgaXQncyBiZXN0IHRvIHNpbXBs
eSBjb252ZXJ0IHB0ZV9uZXh0X3BmbigpIHRvIHNvbWV0aGluZyBsaWtlCj4+PiBwdGVfYWR2YW5j
ZV9wZm5zKCkuIFRoZSB3ZSBjb3VsZCBqdXN0IGhhdmUKPj4+Cj4+PiAjZGVmaW5lIHB0ZV9uZXh0
X3BmbihwdGUpIHB0ZV9hZHZhbmNlX3BmbnMocHRlLCAxKQo+Pj4KPj4+IFRoYXQgc2hvdWxkIGJl
IGZhaXJseSBlYXN5IHRvIGRvIG9uIHRvcCAoYmFzZWQgb24gUEZOX1BURV9TSElGVCkuIEFuZCBv
bmx5IDMKPj4+IGFyY2hzICh4ODYtNjQsIGFybTY0LCBhbmQgcG93ZXJwYykgbmVlZCBzbGlnaHQg
Y2FyZSB0byByZXBsYWNlIGEgaGFyZGNvZGVkICIxIgo+Pj4gYnkgYW4gaW50ZWdlciB3ZSBwYXNz
IGluLgo+Pgo+PiBJIHRob3VnaHQgd2UgYWdyZWVkIHBvd2VycGMgd2FzIHNhZmUgdG8ganVzdCBk
ZWZpbmUgUEZOX1BURV9TSElGVD8gQnV0LCB5ZWFoLAo+PiB0aGUgcHJpbmNpcGxlIHdvcmtzIEkg
Z3Vlc3MuIEkgZ3Vlc3MgSSBjYW4gZG8gdGhpcyBjaGFuZ2UgYWxvbmcgd2l0aCBteSBzZXJpZXMu
Cj4gCj4gSXQgaXMsIGlmIG5vYm9keSBpbnNpc3RzIG9uIHRoYXQgbWljcm8tb3B0aW1pemF0aW9u
IG9uIHBvd2VycGMuCj4gCj4gSWYgdGhlcmUgaXMgZ29vZCByZWFzb24gdG8gaW52ZXN0IG1vcmUg
dGltZSBhbmQgZWZmb3J0IHJpZ2h0IG5vdyBvbiB0aGUKPiBwdGVfcGdwcm90IGFwcHJvYWNoLCB0
aGVuIHBsZWFzZSBsZXQgbWUga25vdyA6KQo+IAoKTm8gSSB0aGluayB5b3UncmUgcmlnaHQuIEkg
dGhvdWdodCBwdGVfcGdwcm90KCkgd2FzIGltcGxlbWVudGVkIGJ5IG1vcmUgYXJjaGVzLApidXQg
dGhlcmUgYXJlIDEzIHdpdGhvdXQgaXQsIHNvIGNsZWFybHkgYSBsb3Qgb2YgZWZmb3J0IHRvIHBs
dWcgdGhhdCBnYXAuIEknbGwKdGFrZSB0aGUgYXBwcm9hY2ggeW91IHN1Z2dlc3Qgd2l0aCBwdGVf
YWR2YW5jZV9wZm5zKCkuIEl0J2xsIGp1c3QgcmVxdWlyZSBtb2RzCnRvIHg4NiBhbmQgYXJtNjQs
ICsvLSBwcGMuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
