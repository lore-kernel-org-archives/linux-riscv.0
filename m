Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC362CAC5AB
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 22:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vHgV3EYgyC8A0SOxK3Bv80fluLkOvfW8hRHYLwlxDRU=; b=FJY2SIzvS2mEIN
	iQNFEwcXUS6p60DnhIDrZ/hQSGl2kmaVYc8RBqLNCyAfV3YePF/JQDMzMCsCjhnoUsdrrsy3x4nt3
	4usBShrI1yj+RIWlxorjS/Gqu5YpNAD/gz33hlg10xlDG0IlUZTfq3R4ZYiZHsx3XgSCsUL/6qlyq
	OP10gWIX5ucou7aLhu+O7+HKxNPCkv3sgqXw70ddLF86RNim6rs8F0md+EWMcR6iIebikHh/GudD6
	j8ZcGNBPN25Qk6MZQq6A+eU/j5yY6tMQxWFsUs979ktwDv7wYCy9yfxhjqqE/5a2p+xP0PCpQAO0h
	v6syGU2w/G5mQdCrI30Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqgai-000000072Bk-05Pe;
	Tue, 17 Sep 2024 22:22:36 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqgad-0000000729W-3LOD
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 22:22:34 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id EE57A72C8CC;
	Wed, 18 Sep 2024 01:22:26 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id D77587CCB3C; Wed, 18 Sep 2024 01:22:26 +0300 (IDT)
Date: Wed, 18 Sep 2024 01:22:26 +0300
From: "Dmitry V . Levin" <ldv@strace.io>
To: Celeste Liu <coelacanthushex@gmail.com>,
	Andrea Bolognani <abologna@redhat.com>
Cc: linux-riscv@lists.infradead.org,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Felix Yan <felixonmars@archlinux.org>,
	Ruizhe Pan <c141028@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2] riscv: entry: always initialize regs->a0 to -ENOSYS
Message-ID: <20240917222226.GA25527@altlinux.org>
References: <20240627142338.5114-2-CoelacanthusHex@gmail.com>
 <CABJz62PRAv0QqszOTHDUdrrgY-Za9y9Vq6mYke=FqP=N5qXvbw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABJz62PRAv0QqszOTHDUdrrgY-Za9y9Vq6mYke=FqP=N5qXvbw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_152232_194449_709C3673 
X-CRM114-Status: GOOD (  30.58  )
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

T24gVHVlLCBTZXAgMTcsIDIwMjQgYXQgMDE6NDk6NTJBTSArMDkwMCwgQW5kcmVhIEJvbG9nbmFu
aSB3cm90ZToKPiBPbiBUaHUsIEp1biAyNywgMjAyNCBhdCAxMDoyMzozOVBNIEdNVCwgQ2VsZXN0
ZSBMaXUgd3JvdGU6Cj4gPiBPdGhlcndpc2Ugd2hlbiB0aGUgdHJhY2VyIGNoYW5nZXMgc3lzY2Fs
bCBudW1iZXIgdG8gLTEsIHRoZSBrZXJuZWwgZmFpbHMKPiA+IHRvIGluaXRpYWxpemUgYTAgd2l0
aCAtRU5PU1lTIGFuZCBzdWJzZXF1ZW50bHkgZmFpbHMgdG8gcmV0dXJuIHRoZSBlcnJvcgo+ID4g
Y29kZSBvZiB0aGUgZmFpbGVkIHN5c2NhbGwgdG8gdXNlcnNwYWNlLiBGb3IgZXhhbXBsZSwgaXQg
d2lsbCBicmVhawo+ID4gc3RyYWNlIHN5c2NhbGwgdGFtcGVyaW5nLgo+ID4KPiA+IEZpeGVzOiA1
MjQ0OWMxN2JkZDEgKCJyaXNjdjogZW50cnk6IHNldCBhMCA9IC1FTk9TWVMgb25seSB3aGVuIHN5
c2NhbGwgIT0gLTEiKQo+ID4gUmVwb3J0ZWQtYnk6ICJEbWl0cnkgVi4gTGV2aW4iIDxsZHZAc3Ry
YWNlLmlvPgo+ID4gUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNv
bT4KPiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gPiBTaWduZWQtb2ZmLWJ5OiBDZWxl
c3RlIExpdSA8Q29lbGFjYW50aHVzSGV4QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlz
Y3Yva2VybmVsL3RyYXBzLmMgfCA0ICsrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ID4gaW5kZXggMDVhMTZi
MWYwYWVlLi41MWViZmQyM2UwMDcgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90
cmFwcy5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPiBAQCAtMzE5LDYg
KzMxOSw3IEBAIHZvaWQgZG9fdHJhcF9lY2FsbF91KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4K
PiA+ICAJCXJlZ3MtPmVwYyArPSA0Owo+ID4gIAkJcmVncy0+b3JpZ19hMCA9IHJlZ3MtPmEwOwo+
ID4gKwkJcmVncy0+YTAgPSAtRU5PU1lTOwo+ID4KPiA+ICAJCXJpc2N2X3ZfdnN0YXRlX2Rpc2Nh
cmQocmVncyk7Cj4gPgo+ID4gQEAgLTMyOCw4ICszMjksNyBAQCB2b2lkIGRvX3RyYXBfZWNhbGxf
dShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+Cj4gPiAgCQlpZiAoc3lzY2FsbCA+PSAwICYmIHN5
c2NhbGwgPCBOUl9zeXNjYWxscykKPiA+ICAJCQlzeXNjYWxsX2hhbmRsZXIocmVncywgc3lzY2Fs
bCk7Cj4gPiAtCQllbHNlIGlmIChzeXNjYWxsICE9IC0xKQo+ID4gLQkJCXJlZ3MtPmEwID0gLUVO
T1NZUzsKPiA+ICsKPiA+ICAJCS8qCj4gPiAgCQkgKiBVbHRpbWF0ZWx5LCB0aGlzIHZhbHVlIHdp
bGwgZ2V0IGxpbWl0ZWQgYnkgS1NUQUNLX09GRlNFVF9NQVgoKSwKPiA+ICAJCSAqIHNvIHRoZSBt
YXhpbXVtIHN0YWNrIG9mZnNldCBpcyAxayBieXRlcyAoMTAgYml0cykuCj4gCj4gSGksCj4gCj4g
dGhpcyBjaGFuZ2Ugc2VlbXMgdG8gaGF2ZSBicm9rZW4gc3RyYWNlJ3MgdGVzdCBzdWl0ZS4KPiAK
PiBJbiBwYXJ0aWN1bGFyLCB0aGUgImxlZ2FjeV9zeXNjYWxsX2luZm8iIHRlc3QsIHdoaWNoIGlz
IG1lYW50IHRvCj4gdmVyaWZ5IHRoYXQgc3RyYWNlIGJlaGF2ZXMgY29ycmVjdGx5IHdoZW4gUFRS
QUNFX0dFVF9TWVNDQUxMX0lORk8gaXMKPiBub3QgYXZhaWxhYmxlLCByZXBvcnRzIGEgYm9ndXMg
dmFsdWUgZm9yIHRoZSBmaXJzdCBhcmd1bWVudCBvZiB0aGUKPiBzeXNjYWxsICh0aGUgb25lIHBh
c3NlZCB2aWEgYTApLgo+IAo+IFRoZSBib2d1cyB2YWx1ZSBjb21lcyBkaXJlY3RseSBmcm9tIHRo
ZSBwdHJhY2UoKSBjYWxsLCBiZWZvcmUgc3RyYWNlCj4gaGFzIGEgY2hhbmNlIHRvIG1lZGRsZSB3
aXRoIGl0LCBoZW5jZSB3aHkgdGhlIG1haW50YWluZXIgc3VnZ2VzdGVkCj4gdGhhdCB0aGUgaXNz
dWUgd291bGQgbGlrZWx5IGJlIHRyYWNlZCBiYWNrIHRvIHRoZSBrZXJuZWwuCj4gCj4gSSBoYXZl
IGJ1aWx0IGEga2VybmVsIHdpdGggdGhpcyBjaGFuZ2UgcmV2ZXJ0ZWQgYW5kLCBhcyBleHBlY3Rl
ZCwgdGhlCj4gc3RyYWNlIHRlc3Qgc3VpdGUgcGFzc2VzLiBBZG1pdHRlZGx5IEkndmUgdXNlZCB0
aGUgNi4xMS1yYzcgRmVkb3JhCj4ga2VybmVsIGFzIHRoZSBiYXNlbGluZSBmb3IgdGhpcyB0ZXN0
LCBidXQgbm9uZSBvZiB0aGUgRmVkb3JhIHBhdGNoZXMKPiB0b3VjaCB0aGUgUklTQy1WIGNvZGUg
YXQgYWxsIGFuZCB0aGUgZmlsZSBpdHNlbGYgaGFzbid0IGJlZW4gdG91Y2hlZAo+IHNpbmNlIHJj
Nywgc28gSSdtIGZhaXJseSBjb25maWRlbnQgdGhlIHNhbWUgYmVoYXZpb3IgaXMgcHJlc2VudCBp
bgo+IHZhbmlsbGEgNi4xMSB0b28uCj4gCj4gU2VlCj4gCj4gICBodHRwczovL2dpdGh1Yi5jb20v
c3RyYWNlL3N0cmFjZS9pc3N1ZXMvMzE1Cj4gCj4gZm9yIHRoZSBvcmlnaW5hbCByZXBvcnQuIFBs
ZWFzZSBsZXQgbWUga25vdyBpZiBJIG5lZWQgdG8gcHJvdmlkZQo+IGFkZGl0aW9uYWwgaW5mb3Jt
YXRpb24sIHJlcG9ydCB0aGlzIGFueXdoZXJlIGVsc2UgKGJ1Z3ppbGxhPyksIGFuZCBzbwo+IG9u
Li4uCgpCeSB0aGUgd2F5LCBpbiBzdHJhY2Ugd2UgaGFkIHRvIGFwcGx5IGEgd29ya2Fyb3VuZCBb
MV0gZm9yIHRoZSByaXNjdiBwdHJhY2UKcmVncmVzc2lvbiBjYXVzZWQgYnkgY29tbWl0IDUyNDQ5
YzE3YmRkMTU0MDk0MGUyMTUxMTYxMmI1OGFjZWJjNDljMDYuCgpBcyByZXN1bHQsIHJldmVydGlu
ZyBjb21taXQgNjExMTkzOTQ2MzFmMjE5ZTIzY2U5OGJjYzNlYjk5M2E2NGE4ZWE2NCB0aGF0CmZp
eGVkIHRoZSByZWdyZXNzaW9uIGJ1dCBpbnRyb2R1Y2VkIGEgUFRSQUNFX0dFVFJFR1NFVCBzeXNj
YWxsIGFyZ3VtZW50CmNsb2JiZXJpbmcgd2hpY2ggaXMgbW9yZSBzZXJpb3VzIHJlZ3Jlc3Npb24g
c2VlbXMgdG8gYmUgdGhlIGxlYXN0IG9mIHR3bwpldmlscy4KClRoaXMgZXNzZW50aWFsbHkgbWVh
bnMgc3RyYWNlIHdvdWxkIGhhdmUgdG8ga2VlcCB0aGUgd29ya2Fyb3VuZAppbmRlZmluaXRlbHks
IGJ1dCB3ZSBjYW4gbGl2ZSB3aXRoIHRoYXQuCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL3N0cmFj
ZS9zdHJhY2UvY29tbWl0L2MzYWUyYjI3NzMyOTUyNjYzYTM2MDAyNjk4ODRlMzYzY2I3N2EwMjQK
CgotLSAKbGR2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
