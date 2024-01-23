Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6083C47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 19:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OI8Va27L1cdZ00sPlRES1gCvuXhkGmyfu8Cvq9uyhuU=; b=NH8ahr+164XBv9
	jzcBIIvenM03txC3Wj4NY6p0X58+V8JXb3oYFZfrf46QHhYzr+jWc6CLYSfYEp6YOMxNcCm/uzCwK
	GGfPHw/pRLZ2Kk44kkReKu0QafTxwSPsJrJGKlWpGVEQaRG9a+SUeKIrBqwwWMzs0gdJUxg8d22uk
	kcGqq8CgboTEJQ72/l7h4Vp1VxqgJsI8gc7kcyCcuGqb/JJKdtUWxbSc5ZzuwAFUyLFAJNufDKZ8E
	IZlpunrDOM4bSqMeS6BGMWU1R5FJKqo2M67qEH349MXNXPHdw3ffwED/Nvu4QN9VyrJvC4bEzaA2m
	OaAY4AJHyODHBFkCtDnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSMg8-000In1-0U;
	Tue, 23 Jan 2024 19:43:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSMfx-000Ikc-2X;
	Tue, 23 Jan 2024 19:43:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41E301FB;
	Tue, 23 Jan 2024 11:43:55 -0800 (PST)
Received: from [10.57.77.165] (unknown [10.57.77.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBFA03F73F;
	Tue, 23 Jan 2024 11:43:04 -0800 (PST)
Message-ID: <7d92d27a-44f6-47d0-8eab-3f80bd7bd75d@arm.com>
Date: Tue, 23 Jan 2024 19:43:03 +0000
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
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <fa9425e8-f489-48d0-9bf5-98d1b46b6d1a@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_114313_957449_1332D420 
X-CRM114-Status: GOOD (  24.07  )
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

T24gMjMvMDEvMjAyNCAxOTozMywgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gT24gMjMuMDEu
MjQgMjA6MTUsIFJ5YW4gUm9iZXJ0cyB3cm90ZToKPj4gT24gMjIvMDEvMjAyNCAxOTo0MSwgRGF2
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
dXAgb24gdG9wIG9mIHRoZSB0b3RhbCBtYXBjb3VudC4KPj4KPj4gSSdtIGN1cnJlbnRseSByZWJh
c2luZyBteSBjb250cHRlIHdvcmsgb250byB0aGlzIHNlcmllcywgYW5kIGhhdmUgaGl0IGEgcHJv
YmxlbS4KPj4gSSBuZWVkIHRvIGV4cG9zZSB0aGUgInNpemUiIG9mIGEgcHRlIChwdGVfc2l6ZSgp
KSBhbmQgc2tpcCBmb3J3YXJkIHRvIHRoZSBzdGFydAo+PiBvZiB0aGUgbmV4dCAoY29udClwdGUg
ZXZlcnkgdGltZSB0aHJvdWdoIHRoZSBmb2xpb19wdGVfYmF0Y2goKSBsb29wLiBCdXQKPj4gcHRl
X25leHRfcGZuKCkgb25seSBhbGxvd3MgYWR2YW5jaW5nIGJ5IDEgcGZuOyBJIG5lZWQgdG8gYWR2
YW5jZSBieSBuciBwZm5zOgo+Pgo+Pgo+PiBzdGF0aWMgaW5saW5lIGludCBmb2xpb19wdGVfYmF0
Y2goc3RydWN0IGZvbGlvICpmb2xpbywgdW5zaWduZWQgbG9uZyBhZGRyLAo+PiDCoMKgwqDCoMKg
wqDCoCBwdGVfdCAqc3RhcnRfcHRlcCwgcHRlX3QgcHRlLCBpbnQgbWF4X25yLCBib29sICphbnlf
d3JpdGFibGUpCj4+IHsKPj4gwqDCoMKgwqB1bnNpZ25lZCBsb25nIGZvbGlvX2VuZF9wZm4gPSBm
b2xpb19wZm4oZm9saW8pICsgZm9saW9fbnJfcGFnZXMoZm9saW8pOwo+PiDCoMKgwqDCoGNvbnN0
IHB0ZV90ICplbmRfcHRlcCA9IHN0YXJ0X3B0ZXAgKyBtYXhfbnI7Cj4+IMKgwqDCoMKgcHRlX3Qg
ZXhwZWN0ZWRfcHRlID0gX19wdGVfYmF0Y2hfY2xlYXJfaWdub3JlZChwdGVfbmV4dF9wZm4ocHRl
KSk7Cj4+IC3CoMKgwqAgcHRlX3QgKnB0ZXAgPSBzdGFydF9wdGVwICsgMTsKPj4gK8KgwqDCoCBw
dGVfdCAqcHRlcCA9IHN0YXJ0X3B0ZXA7Cj4+ICvCoMKgwqAgaW50IHZmbiwgbnIsIGk7Cj4+IMKg
wqDCoMKgYm9vbCB3cml0YWJsZTsKPj4KPj4gwqDCoMKgwqBpZiAoYW55X3dyaXRhYmxlKQo+PiDC
oMKgwqDCoMKgwqDCoCAqYW55X3dyaXRhYmxlID0gZmFsc2U7Cj4+Cj4+IMKgwqDCoMKgVk1fV0FS
Tl9PTl9GT0xJTyghcHRlX3ByZXNlbnQocHRlKSwgZm9saW8pOwo+Pgo+PiArwqDCoMKgIHZmbiA9
IGFkZHIgPj4gUEFHRV9TSVpFOwo+PiArwqDCoMKgIG5yID0gcHRlX3NpemUocHRlKTsKPj4gK8Kg
wqDCoCBuciA9IEFMSUdOX0RPV04odmZuICsgbnIsIG5yKSAtIHZmbjsKPj4gK8KgwqDCoCBwdGVw
ICs9IG5yOwo+PiArCj4+IMKgwqDCoMKgd2hpbGUgKHB0ZXAgIT0gZW5kX3B0ZXApIHsKPj4gK8Kg
wqDCoMKgwqDCoMKgIHB0ZSA9IHB0ZXBfZ2V0KHB0ZXApOwo+PiDCoMKgwqDCoMKgwqDCoCBuciA9
IHB0ZV9zaXplKHB0ZSk7Cj4+IMKgwqDCoMKgwqDCoMKgIGlmIChhbnlfd3JpdGFibGUpCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGFibGUgPSAhIXB0ZV93cml0ZShwdGUpOwo+PiDCoMKg
wqDCoMKgwqDCoCBwdGUgPSBfX3B0ZV9iYXRjaF9jbGVhcl9pZ25vcmVkKHB0ZSk7Cj4+Cj4+IMKg
wqDCoMKgwqDCoMKgIGlmICghcHRlX3NhbWUocHRlLCBleHBlY3RlZF9wdGUpKQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pgo+PiDCoMKgwqDCoMKgwqDCoCAvKgo+PiDCoMKgwqDC
oMKgwqDCoMKgICogU3RvcCBpbW1lZGlhdGVseSBvbmNlIHdlIHJlYWNoZWQgdGhlIGVuZCBvZiB0
aGUgZm9saW8uIEluCj4+IMKgwqDCoMKgwqDCoMKgwqAgKiBjb3JuZXIgY2FzZXMgdGhlIG5leHQg
UEZOIG1pZ2h0IGZhbGwgaW50byBhIGRpZmZlcmVudAo+PiDCoMKgwqDCoMKgwqDCoMKgICogZm9s
aW8uCj4+IMKgwqDCoMKgwqDCoMKgwqAgKi8KPj4gLcKgwqDCoMKgwqDCoMKgIGlmIChwdGVfcGZu
KHB0ZSkgPT0gZm9saW9fZW5kX3BmbikKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChwdGVfcGZuKHB0
ZSkgPj0gZm9saW9fZW5kX3BmbikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4K
Pj4gwqDCoMKgwqDCoMKgwqAgaWYgKGFueV93cml0YWJsZSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqYW55X3dyaXRhYmxlIHw9IHdyaXRhYmxlOwo+Pgo+PiAtwqDCoMKgwqDCoMKgwqAgZXhw
ZWN0ZWRfcHRlID0gcHRlX25leHRfcGZuKGV4cGVjdGVkX3B0ZSk7Cj4+IC3CoMKgwqDCoMKgwqDC
oCBwdGVwKys7Cj4+ICvCoMKgwqDCoMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgbnI7IGkrKykKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXhwZWN0ZWRfcHRlID0gcHRlX25leHRfcGZuKGV4cGVj
dGVkX3B0ZSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBwdGVwICs9IG5yOwo+PiDCoMKgwqDCoH0KPj4K
Pj4gwqDCoMKgwqByZXR1cm4gcHRlcCAtIHN0YXJ0X3B0ZXA7Cj4+IH0KPj4KPj4KPj4gU28gSSdt
IHdvbmRlcmluZyBpZiBpbnN0ZWFkIG9mIGVuYWJsaW5nIHB0ZV9uZXh0X3BmbigpIGZvciBhbGwg
dGhlIGFyY2hlcywKPj4gcGVyaGFwcyBpdHMgYWN0dWFsbHkgYmV0dGVyIHRvIGV4cG9zZSBwdGVf
cGdwcm90KCkgZm9yIGFsbCB0aGUgYXJjaGVzLiBUaGVuIHdlCj4+IGNhbiBiZSBtdWNoIG1vcmUg
ZmxleGlibGUgYWJvdXQgZ2VuZXJhdGluZyBwdGVzIHdpdGggcGZuX3B0ZShwZm4sIHBncHJvdCku
Cj4+Cj4+IFdoYXQgZG8geW91IHRoaW5rPwo+IAo+IFRoZSBwdGVfcGdwcm90KCkgc3R1ZmYgaXMg
anVzdCBuYXN0eSBJTUhPLgoKSSBkdW5ubzsgd2UgaGF2ZSBwZm5fcHRlKCkgd2hpY2ggdGFrZXMg
YSBwZm4gYW5kIGEgcGdwcm90LiBJdCBzZWVtcyByZWFzb25hYmxlCnRoYXQgd2Ugc2hvdWxkIGJl
IGFibGUgdG8gZG8gdGhlIHJldmVyc2UuCgo+IAo+IExpa2VseSBpdCdzIGJlc3QgdG8gc2ltcGx5
IGNvbnZlcnQgcHRlX25leHRfcGZuKCkgdG8gc29tZXRoaW5nIGxpa2UKPiBwdGVfYWR2YW5jZV9w
Zm5zKCkuIFRoZSB3ZSBjb3VsZCBqdXN0IGhhdmUKPiAKPiAjZGVmaW5lIHB0ZV9uZXh0X3Bmbihw
dGUpIHB0ZV9hZHZhbmNlX3BmbnMocHRlLCAxKQo+IAo+IFRoYXQgc2hvdWxkIGJlIGZhaXJseSBl
YXN5IHRvIGRvIG9uIHRvcCAoYmFzZWQgb24gUEZOX1BURV9TSElGVCkuIEFuZCBvbmx5IDMKPiBh
cmNocyAoeDg2LTY0LCBhcm02NCwgYW5kIHBvd2VycGMpIG5lZWQgc2xpZ2h0IGNhcmUgdG8gcmVw
bGFjZSBhIGhhcmRjb2RlZCAiMSIKPiBieSBhbiBpbnRlZ2VyIHdlIHBhc3MgaW4uCgpJIHRob3Vn
aHQgd2UgYWdyZWVkIHBvd2VycGMgd2FzIHNhZmUgdG8ganVzdCBkZWZpbmUgUEZOX1BURV9TSElG
VD8gQnV0LCB5ZWFoLAp0aGUgcHJpbmNpcGxlIHdvcmtzIEkgZ3Vlc3MuIEkgZ3Vlc3MgSSBjYW4g
ZG8gdGhpcyBjaGFuZ2UgYWxvbmcgd2l0aCBteSBzZXJpZXMuCgo+IAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
