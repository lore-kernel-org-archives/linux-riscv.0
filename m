Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3B0CFA76E
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 11:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LZLbCgp8ZqKBcAKoC2XAjVMb/CC5D9VJjYzEls7mqvU=; b=gCyEatTdL795Yt
	7qVf0WNkb7apZkf91zSk2NH75V99UIIse7ko2WETvyQcN0uNOZgtHpw7Oh02kb8zQybYiqHYWZdHG
	MbQf9CSpWSzxedW/27HtTQ/X08/SqUAK5ur5P/8yL/qfqVMhD4N7fpMdC+Z/ck5M2kZupVSt5snjc
	WhWRQkXLYZCl0nRE4CnmRrYx7qSmcuvuai5+Y/r9NMkUbw/LlqD9s4beCZA9U2Vyyj7PM4qEJ5mvD
	LuIv6oXVHa1mhHuyVyACTfEZ1vFq6f319KRRyDz309MPJFyVb2HPNXksC7bmQLJkVIMbjQzR/DwDM
	ESkL16wwa968NYAiF8ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swgd7-0000000C8wD-3Zk8;
	Fri, 04 Oct 2024 11:37:53 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swgd4-0000000C8uf-2e5L
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 11:37:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 109F3FF803;
	Fri,  4 Oct 2024 11:37:44 +0000 (UTC)
Message-ID: <0c9371f2-e8e9-479f-856d-408a81213747@ghiti.fr>
Date: Fri, 4 Oct 2024 13:37:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] Cannot boot Lichee Pi 4A with
 FORTIFY_SOURCE enabled
To: Kees Cook <kees@kernel.org>, Jason Montleon <jmontleo@redhat.com>
Cc: linux-hardening@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 linux-riscv@lists.infradead.org
References: <B2A62C7F-45BA-43E1-975F-5AF0197CD2C3@kernel.org>
 <CAJD_bP+43=XXD7p3fRfDxCbj=_YedgVLv38XO4iOAw94a+4PHg@mail.gmail.com>
 <202409221511.9AF49BD@keescook>
 <CAJD_bP+6qCgseo9of-cKW3+nH_UbGFwPo6WRbqqcneOZ+EEtOw@mail.gmail.com>
 <800CC050-E858-409C-A565-A6EF430E1B25@kernel.org>
 <CAJD_bPKNbKo5tj4OV4MpgtSN6_FXfmQtBFgVFzZeZapCPNT6PA@mail.gmail.com>
 <eb7354f6-98bd-45c6-a616-733637848a14@ghiti.fr>
 <CAJD_bPKHA5+Ta1vzokN-TXJU4bk4OA5QTXEEvAwmzLzmW8YtTQ@mail.gmail.com>
 <f9d17698-0c74-42b7-acc8-3ca3adf3ba4d@ghiti.fr>
 <CAJD_bP+ZYKFaeZ2hQXjAZda=RhLkfnXfGLW-ZYTrOV4GfNRzpA@mail.gmail.com>
 <202410031417.A5AB8BA5@keescook>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <202410031417.A5AB8BA5@keescook>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_043750_838779_9511BF08 
X-CRM114-Status: GOOD (  12.57  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgS2VlcywgSmFzb24sCgpPbiAwMy8xMC8yMDI0IDIzOjIxLCBLZWVzIENvb2sgd3JvdGU6Cj4g
T24gVGh1LCBPY3QgMDMsIDIwMjQgYXQgMDE6MTI6NTlQTSAtMDQwMCwgSmFzb24gTW9udGxlb24g
d3JvdGU6Cj4+IE9uIFRodSwgT2N0IDMsIDIwMjQgYXQgMTA6NDHigK9BTSBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+Pj4gU28gSSB3YXMgYWJsZSB0byByZXByb2R1Y2Ug
dGhlIGlzc3VlIG9uIHFlbXUgYnkgYWRkaW5nIGEgZmV3IHR3ZWFrcywgYW5kCj4+PiBpbmRlZWQg
d2UgdHJhcCBpbiBfX3dhcm5fcHJpbnRrKCkgb24gYSB2aXJ0dWFsIGFkZHJlc3MgYnV0IE1NVSBp
cyBub3QKPj4+IGVuYWJsZWQgeWV0Lgo+Pj4KPj4+IFRoZSBmb2xsb3dpbmcgZGlmZiB0aG91Z2gg
YWxsb3dzIG1lIHRvIHBhc3MgdGhpcyBmYWlsdXJlIGJ1dCBJIGNhbid0IGdldAo+Pj4gbXVjaCBm
dXJ0aGVyIGluIHRoZSBib290IHNpbmNlIHRoZSB0d2Vha3MgSSBhZGRlZCB3b24ndCBhbGxvdyBp
dCwgY2FuCj4+PiB5b3UgZ2l2ZSB0aGUgZm9sbG93aW5nIGEgdHJ5Pwo+Pj4KPj4+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2VycmF0YS9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvZXJyYXRhL01ha2Vm
aWxlCj4+PiBpbmRleCA4YTI3Mzk0ODUxMjMzLi40OTEzZjNiM2YxOThjIDEwMDY0NAo+Pj4gLS0t
IGEvYXJjaC9yaXNjdi9lcnJhdGEvTWFrZWZpbGUKPj4+ICsrKyBiL2FyY2gvcmlzY3YvZXJyYXRh
L01ha2VmaWxlCj4+PiBAQCAtMiw2ICsyLDEwIEBAIGlmZGVmIENPTkZJR19SRUxPQ0FUQUJMRQo+
Pj4gICAgS0JVSUxEX0NGTEFHUyArPSAtZm5vLXBpZQo+Pj4gICAgZW5kaWYKPj4+Cj4+PiAraWZk
ZWYgQ09ORklHX1JJU0NWX0FMVEVSTkFUSVZFX0VBUkxZCj4+PiArS0JVSUxEX0NGTEFHUyArPSAt
RF9fTk9fRk9SVElGWQo+Pj4gK2VuZGlmCj4+PiArCj4+PiAgICBvYmotJChDT05GSUdfRVJSQVRB
X0FOREVTKSArPSBhbmRlcy8KPj4+ICAgIG9iai0kKENPTkZJR19FUlJBVEFfU0lGSVZFKSArPSBz
aWZpdmUvCj4+PiAgICBvYmotJChDT05GSUdfRVJSQVRBX1RIRUFEKSArPSB0aGVhZC8KPj4gWWVz
LCB0aGlzIHdvcmtlZC4KCgpHcmVhdDsgdGhhbmtzIQoKCj4gVGhhbmtzIGZvciB0ZXN0aW5nIQo+
Cj4gWWVhaCwgdGhpcyBtYXRjaGVzIHNpbWlsYXIgZm9ydGlmeSBkaXNhYmxpbmcgaW4gb3RoZXIg
ZWFybHkgYm9vdCBhcmVhcy4KPiBVc3VhbGx5IGl0J3MgcGFydCBvZiBhIGNvbW1vbiBoZWFkZXIs
IGJ1dCBzZXR0aW5nIGl0IHZpYSB0aGUgTWFrZWZpbGUKPiBhbHNvIHdvcmtzLiBJJ2xsIGxlYXZl
IGl0IHVwIHRvIHRoZSByaXNjdiBtYWludGFpbmVycyEgOikKCgpJIGZvdW5kIGEgZmV3IG90aGVy
IHNwb3RzIHdoZXJlIHdlIGRpZCBub3QgZGlzYWJsZSBmb3J0aWZ5LCB0aGUgZWFzaWVzdCAKcGF0
aCBJIGZvdW5kIHdhcyBpbmRlZWQgdG8gZG8gdGhhdCBpbiB0aGUgTWFrZWZpbGUuCgpJIGhhdmUg
YSBxdWVzdGlvbiB0aG91Z2g6IHNob3VsZCB3ZSBkbyBzb21ldGhpbmcgYWJvdXQgdGhlIGZvbGxv
d2luZyAKd2FybmluZ3M/IElzIHRoZXJlIHNvbWV0aGluZyB3cm9uZyBzb21ld2hlcmU/CgpXYW50
ZWQgdG8gd3JpdGUgOCB0byBhIDAtc2l6ZWQgZGVzdGluYXRpb246IG9sZHB0ciBhdCAKYXJjaC9y
aXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmM6MTg1CldhbnRlZCB0byB3cml0ZSAyOCB0byBhIDAt
c2l6ZWQgZGVzdGluYXRpb246IG9sZHB0ciBhdCAKYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJy
YXRhLmM6MTg1CgpUaGFua3MsCgpBbGV4CgoKPgo+IC1LZWVzCj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
