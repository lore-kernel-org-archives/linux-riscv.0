Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE58C47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 11:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mNxsebUkAxykDynuKdXpPVrqpjAEyWVAe5UJHMFodgY=; b=gOe2zzluvsk2cq
	JVFe6QUUO8BhPQ6sLRZOJPajd8Fq/a0wjw6byVHJwsBV0NzNYVNhex7M9yoCEPn/AMK6sexnr0DmX
	PnnxvK4foOYkm7LIoBiLYEd9SRnFZ6HENEqzNJtMCaw/YsezWN6z7q0kZ9jWpxcLThHIei1A4/ULA
	h5YsAjEsKB6Z+mczIYdNLi7/y9olH/vN6ZzlEo7NHYQlNF707S5Qqavi8YDr13CZ/OWCUIudASEkh
	v8EseJc0KvapvPohK9YrMpa27qKzh+yq3hyy6PwDVIgLwE1cZsgCQ7GNaDrlD6Nal3lQp7M4GRi+S
	/oCStTnVCU0U7nTUtdTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSEe9-00G4ty-0r;
	Tue, 23 Jan 2024 11:08:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSEe5-00G4rE-0g;
	Tue, 23 Jan 2024 11:08:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AADC1FB;
	Tue, 23 Jan 2024 03:09:26 -0800 (PST)
Received: from [10.57.77.165] (unknown [10.57.77.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DDC23F762;
	Tue, 23 Jan 2024 03:08:35 -0800 (PST)
Message-ID: <6703b648-10ab-4fea-b7f1-75421319465b@arm.com>
Date: Tue, 23 Jan 2024 11:08:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] arm/pgtable: define PFN_PTE_SHIFT on arm and
 arm64
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
 <20240122194200.381241-2-david@redhat.com>
 <fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com>
 <46080ac1-7789-499b-b7f3-0231d7bd6de7@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <46080ac1-7789-499b-b7f3-0231d7bd6de7@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_030845_344989_417C524E 
X-CRM114-Status: GOOD (  26.73  )
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

T24gMjMvMDEvMjAyNCAxMDo0OCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gT24gMjMuMDEu
MjQgMTE6MzQsIFJ5YW4gUm9iZXJ0cyB3cm90ZToKPj4gT24gMjIvMDEvMjAyNCAxOTo0MSwgRGF2
aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+PiBXZSB3YW50IHRvIG1ha2UgdXNlIG9mIHB0ZV9uZXh0
X3BmbigpIG91dHNpZGUgb2Ygc2V0X3B0ZXMoKS4gTGV0J3MKPj4+IHNpbXBsaXkgZGVmaW5lIFBG
Tl9QVEVfU0hJRlQsIHJlcXVpcmVkIGJ5IHB0ZV9uZXh0X3BmbigpLgo+Pj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgo+Pj4gLS0tCj4+PiDC
oCBhcmNoL2FybS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmjCoMKgIHwgMiArKwo+Pj4gwqAgYXJjaC9h
cm02NC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfCAyICsrCj4+PiDCoCAyIGZpbGVzIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLmggYi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPj4+IGluZGV4IGQ2
NTdiODRiNmJmNzAuLmJlOTFlMzc2ZGY3OWUgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL2FybS9pbmNs
dWRlL2FzbS9wZ3RhYmxlLmgKPj4+ICsrKyBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3BndGFibGUu
aAo+Pj4gQEAgLTIwOSw2ICsyMDksOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19zeW5jX2ljYWNo
ZV9kY2FjaGUocHRlX3QgcHRldmFsKQo+Pj4gwqAgZXh0ZXJuIHZvaWQgX19zeW5jX2ljYWNoZV9k
Y2FjaGUocHRlX3QgcHRldmFsKTsKPj4+IMKgICNlbmRpZgo+Pj4gwqAgKyNkZWZpbmUgUEZOX1BU
RV9TSElGVMKgwqDCoMKgwqDCoMKgIFBBR0VfU0hJRlQKPj4+ICsKPj4+IMKgIHZvaWQgc2V0X3B0
ZXMoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkciwKPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwdGVfdCAqcHRlcCwgcHRlX3QgcHRldmFsLCB1bnNpZ25l
ZCBpbnQgbnIpOwo+Pj4gwqAgI2RlZmluZSBzZXRfcHRlcyBzZXRfcHRlcwo+Pj4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9hcm02NC9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmgKPj4+IGluZGV4IDc5Y2U3MGZiYjc1MWMuLmQ0YjNiZDk2ZTMzMDQgMTAw
NjQ0Cj4+PiAtLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+Pj4gKysrIGIv
YXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPj4+IEBAIC0zNDEsNiArMzQxLDggQEAg
c3RhdGljIGlubGluZSB2b2lkIF9fc3luY19jYWNoZV9hbmRfdGFncyhwdGVfdCBwdGUsCj4+PiB1
bnNpZ25lZCBpbnQgbnJfcGFnZXMpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgbXRlX3N5bmNfdGFn
cyhwdGUsIG5yX3BhZ2VzKTsKPj4+IMKgIH0KPj4+IMKgICsjZGVmaW5lIFBGTl9QVEVfU0hJRlTC
oMKgwqDCoMKgwqDCoCBQQUdFX1NISUZUCj4+Cj4+IEkgdGhpbmsgdGhpcyBpcyBidWdneS4gQW5k
IHNvIGlzIHRoZSBhcm02NCBpbXBsZW1lbnRhdGlvbiBvZiBzZXRfcHRlcygpLiBJdAo+PiB3b3Jr
cyBmaW5lIGZvciA0OC1iaXQgb3V0cHV0IGFkZHJlc3MsIGJ1dCBmb3IgNTItYml0IE9BcywgdGhl
IGhpZ2ggYml0cyBhcmUgbm90Cj4+IGtlcHQgY29udGlnb3VzbHksIHNvIGlmIHlvdSBoYXBwZW4g
dG8gYmUgc2V0dGluZyBhIG1hcHBpbmcgZm9yIHdoaWNoIHRoZQo+PiBwaHlzaWNhbCBtZW1vcnkg
YmxvY2sgc3RyYWRkbGVzIGJpdCA0OCwgdGhpcyB3b24ndCB3b3JrLgo+IAo+IFJpZ2h0LCBhcyBz
b29uIGFzIHRoZSBQVEUgYml0cyBhcmUgbm90IGNvbnRpZ3VvdXMsIHRoaXMgc3RvcHMgd29ya2lu
ZywganVzdCBsaWtlCj4gc2V0X3B0ZXMoKSB3b3VsZCwgd2hpY2ggSSB1c2VkIGFzIG9yaWVudGF0
aW9uLgo+IAo+Pgo+PiBUb2RheSwgb25seSB0aGUgNjRLIGJhc2UgcGFnZSBjb25maWcgY2FuIHN1
cHBvcnQgNTIgYml0cywgYW5kIGZvciB0aGlzLAo+PiBPQVs1MTo0OF0gYXJlIHN0b3JlZCBpbiBQ
VEVbMTU6MTJdLiBCdXQgNTIgYml0cyBmb3IgNEsgYW5kIDE2SyBiYXNlIHBhZ2VzIGlzCj4+IGNv
bWluZyAoaG9wZWZ1bGx5IHY2LjkpIGFuZCBpbiB0aGlzIGNhc2UgT0FbNTE6NTBdIGFyZSBzdG9y
ZWQgaW4gUFRFWzk6OF0uCj4+IEZvcnR1bmF0ZWx5IHdlIGFscmVhZHkgaGF2ZSBoZWxwZXJzIGlu
IGFybTY0IHRvIGFic3RyYWN0IHRoaXMuCj4+Cj4+IFNvIEkgdGhpbmsgYXJtNjQgd2lsbCB3YW50
IHRvIGRlZmluZSBpdHMgb3duIHB0ZV9uZXh0X3BmbigpOgo+Pgo+PiAjZGVmaW5lIHB0ZV9uZXh0
X3BmbiBwdGVfbmV4dF9wZm4KPj4gc3RhdGljIGlubGluZSBwdGVfdCBwdGVfbmV4dF9wZm4ocHRl
X3QgcHRlKQo+PiB7Cj4+IMKgwqDCoMKgcmV0dXJuIHBmbl9wdGUocHRlX3BmbihwdGUpICsgMSwg
cHRlX3BncHJvdChwdGUpKTsKPj4gfQo+Pgo+PiBJJ2xsIGRvIGEgc2VwYXJhdGUgcGF0Y2ggdG8g
Zml4IHRoZSBhbHJlYWR5IGJyb2tlbiBhcm02NCBzZXRfcHRlcygpCj4+IGltcGxlbWVudGF0aW9u
Lgo+IAo+IE1ha2Ugc2Vuc2UuCj4gCj4+Cj4+IEknbSBub3Qgc3VyZSBpZiB0aGlzIHR5cGUgb2Yg
cHJvYmxlbSBtaWdodCBhbHNvIGFwcGx5IHRvIG90aGVyIGFyY2hlcz8KPiAKPiBJIHNhdyBzaW1p
bGFyIGhhbmRsaW5nIGluIHRoZSBQUEMgaW1wbGVtZW50YXRpb24gb2Ygc2V0X3B0ZXMsIGJ1dCB3
YXMgbm90IGFibGUKPiB0byBjb252aW5jZSBtZSB0aGF0IGl0IGlzIGFjdHVhbGx5IHJlcXVpcmVk
IHRoZXJlLgo+IAo+IHB0ZV9wZm4gb24gcHBjIGRvZXM6Cj4gCj4gc3RhdGljIGlubGluZSB1bnNp
Z25lZCBsb25nIHB0ZV9wZm4ocHRlX3QgcHRlKQo+IHsKPiDCoMKgwqDCoHJldHVybiAocHRlX3Zh
bChwdGUpICYgUFRFX1JQTl9NQVNLKSA+PiBQVEVfUlBOX1NISUZUOwo+IH0KPiAKPiBCdXQgdGhh
dCBtZWFucyB0aGF0IHRoZSBQRk5zICphcmUqIGNvbnRpZ3VvdXMuCgphbGwgdGhlIHBwYyBwZm5f
cHRlKCkgaW1wbGVtZW50YXRpb25zIGFsc28gb25seSBzaGlmdCB0aGUgcGZuLCBzbyBJIHRoaW5r
IHBwYyBpcwpzYWZlIHRvIGp1c3QgZGVmaW5lIFBGTl9QVEVfU0hJRlQuIEFsdGhvdWdoIDIgb2Yg
dGhlIDMgaW1wbGVtZW50YXRpb25zIHNoaWZ0IGJ5ClBURV9SUE5fU0hJRlQgYW5kIHRoZSBvdGhl
ciBzaGlmdHMgYnkgUEFHRV9TSVpFLCBzbyB5b3UgbWlnaHQgd2FudCB0byBkZWZpbmUKUEZOX1BU
RV9TSElGVCBzZXBhcmF0ZWx5IGZvciBhbGwgMyBjb25maWdzPwoKPiBJZiBoaWdoIGJpdHMgYXJl
IHVzZWQgZm9yCj4gc29tZXRoaW5nIGVsc2UsIHRoZW4gd2UgbWlnaHQgcHJvZHVjZSBhIGdhcmJh
Z2UgUFRFIG9uIG92ZXJmbG93LCBidXQgdGhhdAo+IHNob3VsZG4ndCByZWFsbHkgbWF0dGVyIEkg
Y29uY2x1ZGVkIGZvciBmb2xpb19wdGVfYmF0Y2goKSBwdXJwb3Nlcywgd2UnZCBub3QKPiBkZXRl
Y3QgImJlbG9uZ3MgdG8gdGhpcyBmb2xpbyBiYXRjaCIgZWl0aGVyIHdheS4KCkV4YWN0bHkuCgo+
IAo+IE1heWJlIGl0J3MgbGlrZWx5IGNsZWFuZXIgdG8gYWxzbyBoYXZlIGEgY3VzdG9tIHB0ZV9u
ZXh0X3BmbigpIG9uIHBwYywgSSBqdXN0Cj4gaG9wZSB0aGF0IHdlIGRvbid0IGxvc2UgYW55IG90
aGVyIGFyYml0cmFyeSBQVEUgYml0cyBieSBkb2luZyB0aGUgcHRlX3BncHJvdCgpLgoKSSBkb24n
dCBzZWUgdGhlIG5lZWQgZm9yIHBwYyB0byBpbXBsZW1lbnQgcHRlX25leHRfcGZuKCkuCgpwdGVf
cGdwcm90KCkgaXMgbm90IGEgInByb3BlciIgYXJjaCBpbnRlcmZhY2UgKGl0cyBvbmx5IHJlcXVp
cmVkIGJ5IHRoZSBjb3JlLW1tCmlmIHRoZSBhcmNoIGltcGxlbWVudHMgYSBjZXJ0YWluIEtjb25m
aWcgSUlSQykuIEZvciBhcm02NCwgYWxsIGJpdHMgdGhhdCBhcmUgbm90CnBmbiBhcmUgcGdwcm90
LCBzbyB0aGVyZSBhcmUgbm8gYml0cyBsb3N0LgoKPiAKPiAKPiBJIGd1ZXNzIHB0ZV9wZm4oKSBp
bXBsZW1lbnRhdGlvbnMgc2hvdWxkIHRlbGwgdXMgaWYgYW55dGhpbmcgc3BlY2lhbCBuZWVkcyB0
bwo+IGhhcHBlbi4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
