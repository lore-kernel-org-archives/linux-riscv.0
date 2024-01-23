Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB4AC47DDB
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 11:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13gfyZ208yXDaw3FycQnF1pTmDG/aSnnE9XoDuXEXJY=; b=XL2bHc+hMvSxEr
	xLqPDrFqo+/bILcwH6OcnYJJcA44oAarc6cyywEJ5Evi196BlnWgLiBghmyU+OPVhMK7A9DK0YQ+Q
	0+/prqJOmcJLAT2Hn+YidUVaHmKSwdy+rrTIH3AnlVOwxr7EpJQEbdjQ/AXC8+xbsJFndHLbW7VoQ
	y0S2CKumYSGHUZ1jWj1+ZrhvU9zY0KPvcUUluIWQXFZh0Aq4gVOTLdS/4sbqsWZTbTD3B7iZELteA
	TOa7TSSyRhVpjlNyAbw09FU4lpLsCR9rAwVLmqGZBJ8Dtasf771dHOcUDAZpzBQooduDOwf2XCDEp
	/4Ydh12WjfDWfUbSSpYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSEmM-00G6t5-0J;
	Tue, 23 Jan 2024 11:17:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSEmI-00G6rE-1N;
	Tue, 23 Jan 2024 11:17:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AAB21FB;
	Tue, 23 Jan 2024 03:17:58 -0800 (PST)
Received: from [10.57.77.165] (unknown [10.57.77.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 436DD3F762;
	Tue, 23 Jan 2024 03:17:09 -0800 (PST)
Message-ID: <75e99c49-734a-47f4-b7a5-7e346bd2487b@arm.com>
Date: Tue, 23 Jan 2024 11:17:07 +0000
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
 <02d42161-a867-424d-bef8-efd67d592cbc@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <02d42161-a867-424d-bef8-efd67d592cbc@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_031714_561203_9F2E0D9C 
X-CRM114-Status: GOOD (  14.59  )
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

T24gMjMvMDEvMjAyNCAxMTowMiwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gT24gMjMuMDEu
MjQgMTE6NDgsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+PiBPbiAyMy4wMS4yNCAxMTozNCwg
UnlhbiBSb2JlcnRzIHdyb3RlOgo+Pj4gT24gMjIvMDEvMjAyNCAxOTo0MSwgRGF2aWQgSGlsZGVu
YnJhbmQgd3JvdGU6Cj4+Pj4gV2Ugd2FudCB0byBtYWtlIHVzZSBvZiBwdGVfbmV4dF9wZm4oKSBv
dXRzaWRlIG9mIHNldF9wdGVzKCkuIExldCdzCj4+Pj4gc2ltcGxpeSBkZWZpbmUgUEZOX1BURV9T
SElGVCwgcmVxdWlyZWQgYnkgcHRlX25leHRfcGZuKCkuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KPj4+PiAtLS0KPj4+PiDCoMKg
IGFyY2gvYXJtL2luY2x1ZGUvYXNtL3BndGFibGUuaMKgwqAgfCAyICsrCj4+Pj4gwqDCoCBhcmNo
L2FybTY0L2luY2x1ZGUvYXNtL3BndGFibGUuaCB8IDIgKysKPj4+PiDCoMKgIDIgZmlsZXMgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vaW5j
bHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+Pj4g
aW5kZXggZDY1N2I4NGI2YmY3MC4uYmU5MWUzNzZkZjc5ZSAxMDA2NDQKPj4+PiAtLS0gYS9hcmNo
L2FybS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPj4+PiArKysgYi9hcmNoL2FybS9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLmgKPj4+PiBAQCAtMjA5LDYgKzIwOSw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBf
X3N5bmNfaWNhY2hlX2RjYWNoZShwdGVfdCBwdGV2YWwpCj4+Pj4gwqDCoCBleHRlcm4gdm9pZCBf
X3N5bmNfaWNhY2hlX2RjYWNoZShwdGVfdCBwdGV2YWwpOwo+Pj4+IMKgwqAgI2VuZGlmCj4+Pj4g
wqDCoCArI2RlZmluZSBQRk5fUFRFX1NISUZUwqDCoMKgwqDCoMKgwqAgUEFHRV9TSElGVAo+Pj4+
ICsKPj4+PiDCoMKgIHZvaWQgc2V0X3B0ZXMoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVk
IGxvbmcgYWRkciwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwdGVfdCAq
cHRlcCwgcHRlX3QgcHRldmFsLCB1bnNpZ25lZCBpbnQgbnIpOwo+Pj4+IMKgwqAgI2RlZmluZSBz
ZXRfcHRlcyBzZXRfcHRlcwo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNt
L3BndGFibGUuaAo+Pj4+IGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPj4+PiBp
bmRleCA3OWNlNzBmYmI3NTFjLi5kNGIzYmQ5NmUzMzA0IDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gv
YXJtNjQvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+Pj4gKysrIGIvYXJjaC9hcm02NC9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmgKPj4+PiBAQCAtMzQxLDYgKzM0MSw4IEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCBfX3N5bmNfY2FjaGVfYW5kX3RhZ3MocHRlX3QgcHRlLAo+Pj4+IHVuc2lnbmVkIGludCBucl9w
YWdlcykKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtdGVfc3luY190YWdzKHB0ZSwgbnJfcGFn
ZXMpOwo+Pj4+IMKgwqAgfQo+Pj4+IMKgwqAgKyNkZWZpbmUgUEZOX1BURV9TSElGVMKgwqDCoMKg
wqDCoMKgIFBBR0VfU0hJRlQKPj4+Cj4+PiBJIHRoaW5rIHRoaXMgaXMgYnVnZ3kuIEFuZCBzbyBp
cyB0aGUgYXJtNjQgaW1wbGVtZW50YXRpb24gb2Ygc2V0X3B0ZXMoKS4gSXQKPj4+IHdvcmtzIGZp
bmUgZm9yIDQ4LWJpdCBvdXRwdXQgYWRkcmVzcywgYnV0IGZvciA1Mi1iaXQgT0FzLCB0aGUgaGln
aCBiaXRzIGFyZSBub3QKPj4+IGtlcHQgY29udGlnb3VzbHksIHNvIGlmIHlvdSBoYXBwZW4gdG8g
YmUgc2V0dGluZyBhIG1hcHBpbmcgZm9yIHdoaWNoIHRoZQo+Pj4gcGh5c2ljYWwgbWVtb3J5IGJs
b2NrIHN0cmFkZGxlcyBiaXQgNDgsIHRoaXMgd29uJ3Qgd29yay4KPj4KPj4gUmlnaHQsIGFzIHNv
b24gYXMgdGhlIFBURSBiaXRzIGFyZSBub3QgY29udGlndW91cywgdGhpcyBzdG9wcyB3b3JraW5n
LAo+PiBqdXN0IGxpa2Ugc2V0X3B0ZXMoKSB3b3VsZCwgd2hpY2ggSSB1c2VkIGFzIG9yaWVudGF0
aW9uLgo+Pgo+Pj4KPj4+IFRvZGF5LCBvbmx5IHRoZSA2NEsgYmFzZSBwYWdlIGNvbmZpZyBjYW4g
c3VwcG9ydCA1MiBiaXRzLCBhbmQgZm9yIHRoaXMsCj4+PiBPQVs1MTo0OF0gYXJlIHN0b3JlZCBp
biBQVEVbMTU6MTJdLiBCdXQgNTIgYml0cyBmb3IgNEsgYW5kIDE2SyBiYXNlIHBhZ2VzIGlzCj4+
PiBjb21pbmcgKGhvcGVmdWxseSB2Ni45KSBhbmQgaW4gdGhpcyBjYXNlIE9BWzUxOjUwXSBhcmUg
c3RvcmVkIGluIFBURVs5OjhdLgo+Pj4gRm9ydHVuYXRlbHkgd2UgYWxyZWFkeSBoYXZlIGhlbHBl
cnMgaW4gYXJtNjQgdG8gYWJzdHJhY3QgdGhpcy4KPj4+Cj4+PiBTbyBJIHRoaW5rIGFybTY0IHdp
bGwgd2FudCB0byBkZWZpbmUgaXRzIG93biBwdGVfbmV4dF9wZm4oKToKPj4+Cj4+PiAjZGVmaW5l
IHB0ZV9uZXh0X3BmbiBwdGVfbmV4dF9wZm4KPj4+IHN0YXRpYyBpbmxpbmUgcHRlX3QgcHRlX25l
eHRfcGZuKHB0ZV90IHB0ZSkKPj4+IHsKPj4+IMKgwqDCoMKgcmV0dXJuIHBmbl9wdGUocHRlX3Bm
bihwdGUpICsgMSwgcHRlX3BncHJvdChwdGUpKTsKPj4+IH0KPj4+Cj4gCj4gRGlnZ2luZyBpbnRv
IHRoZSBkZXRhaWxzLCBvbiBhcm02NCB3ZSBoYXZlOgo+IAo+ICNkZWZpbmUgcHRlX3BmbihwdGUp
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKF9fcHRlX3RvX3BoeXMocHRlKSA+PiBQQUdFX1NISUZUKQo+
IAo+IGFuZAo+IAo+ICNkZWZpbmUgX19wdGVfdG9fcGh5cyhwdGUpwqDCoMKgwqAgKHB0ZV92YWwo
cHRlKSAmIFBURV9BRERSX01BU0spCj4gCj4gQnV0IHRoYXQgaW1wbGllcywgdGhhdCB1cHN0cmVh
bSB0aGUgUEZOIGlzIGFsd2F5cyBjb250aWd1b3VzLCBubz8KPiAKCgpCdXQgX19wdGVfdG9fcGh5
cygpIGFuZCBfX3BoeXNfdG9fcHRlX3ZhbCgpIGRlcGVuZCBvbiBhIEtjb25maWcuIElmIFBBIGJp
dHMgaXMKNTIsIHRoZSBiaXRzIGFyZSBub3QgYWxsIGNvbnRpZ3VvdXM6CgojaWZkZWYgQ09ORklH
X0FSTTY0X1BBX0JJVFNfNTIKc3RhdGljIGlubGluZSBwaHlzX2FkZHJfdCBfX3B0ZV90b19waHlz
KHB0ZV90IHB0ZSkKewoJcmV0dXJuIChwdGVfdmFsKHB0ZSkgJiBQVEVfQUREUl9MT1cpIHwKCQko
KHB0ZV92YWwocHRlKSAmIFBURV9BRERSX0hJR0gpIDw8IFBURV9BRERSX0hJR0hfU0hJRlQpOwp9
CnN0YXRpYyBpbmxpbmUgcHRldmFsX3QgX19waHlzX3RvX3B0ZV92YWwocGh5c19hZGRyX3QgcGh5
cykKewoJcmV0dXJuIChwaHlzIHwgKHBoeXMgPj4gUFRFX0FERFJfSElHSF9TSElGVCkpICYgUFRF
X0FERFJfTUFTSzsKfQojZWxzZQojZGVmaW5lIF9fcHRlX3RvX3BoeXMocHRlKQkocHRlX3ZhbChw
dGUpICYgUFRFX0FERFJfTUFTSykKI2RlZmluZSBfX3BoeXNfdG9fcHRlX3ZhbChwaHlzKQkocGh5
cykKI2VuZGlmCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
