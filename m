Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CF9C36002
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 17:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuLngLUPszMHmmF+MRmFtU96irl75QqFA7cehogjX1M=; b=jpkkZS+Mj8H+WKN9mOSxDUXHEl
	Ys9hRkqG2Uhsr3jXdNe6AHCHptgoBsUWRhCAxgT3paze6Y1lQ4KbHYwd0l0Wd9ZRTjWSD11+fwGtz
	o0bWnAHhhDPWS7RiIa6lRITzOeYknV2R3tDnGdWPBLjm8+PFOxPii0L4x7XiETwwcZZHr/qAhA+0y
	1IWlDRkb46VqB1P5mkr7ABlL0s4zyCCIr3rmzRXN34REqwlP8QNGLB7KtxShps8w6wu2Ztj07oOSy
	Dyjj938FTFkYDeE1jyMxhg0Yu1oUz7atZksgrqzVQGLY1MSjQcDI660t25urwKRT0r9kT9axY4Ymi
	V19mNKsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvgYh-0000000Flaa-0aG2;
	Fri, 21 Mar 2025 17:53:27 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvgVR-0000000Fky1-3vWL;
	Fri, 21 Mar 2025 17:50:07 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ZK8Sl5g91z9sSc;
	Fri, 21 Mar 2025 18:24:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zGiE3Fieq8zB; Fri, 21 Mar 2025 18:24:23 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ZK8Sl3Q1Zz9sSZ;
	Fri, 21 Mar 2025 18:24:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 13D588B79C;
	Fri, 21 Mar 2025 18:24:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id PgNENOWgR9TQ; Fri, 21 Mar 2025 18:24:22 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4E6918B763;
	Fri, 21 Mar 2025 18:24:22 +0100 (CET)
Message-ID: <1b0d0513-9d18-4603-91e9-20af36334145@csgroup.eu>
Date: Fri, 21 Mar 2025 18:24:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] Merge arm64/riscv hugetlbfs contpte support
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Matthew Wilcox <willy@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mm@kvack.org
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250321130635.227011-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_105006_140742_241EEC90 
X-CRM114-Status: GOOD (  22.14  )
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

CgpMZSAyMS8wMy8yMDI1IMOgIDE0OjA2LCBBbGV4YW5kcmUgR2hpdGkgYSDDqWNyaXTCoDoKPiBU
aGlzIHBhdGNoc2V0IGludGVuZHMgdG8gbWVyZ2UgdGhlIGNvbnRpZ3VvdXMgcHRlcyBodWdldGxi
ZnMgaW1wbGVtZW50YXRpb24KPiBvZiBhcm02NCBhbmQgcmlzY3YuCgpDYW4gd2UgYWxzbyBhZGQg
cG93ZXJwYyBpbiB0aGUgZGFuY2UgPwoKcG93ZXJwYyBhbHNvIHVzZSBjb250aWd1b3VzIFBURXMg
YWxsdGhvdWdoIHRoZXJlIGlzIG5vdCAoeWV0KSBhIHNwZWNpYWwgCm5hbWUgZm9yIGl0OgotIGIy
NTBjOGMwOGM3OSBwb3dlcnBjLzh4eDogTWFuYWdlIDUxMmsgaHVnZSBwYWdlcyBhcyBzdGFuZGFy
ZCBwYWdlcwotIGU0NzE2OGYzZDFiMSBwb3dlcnBjLzh4eDogU3VwcG9ydCAxNmsgaHVnZXBhZ2Vz
IHdpdGggNGsgcGFnZXMKCnBvd2VycGMgYWxzbyB1c2UgY29uZmlndW91cyBQTURzL1BVRHMgZm9y
IGxhcmdlciBodWdlcGFnZXM6Ci0gNTdmYjE1YzMyZjRmICgicG93ZXJwYy82NHM6IHVzZSBjb250
aWd1b3VzIFBNRC9QVUQgaW5zdGVhZCBvZiBIVUdFUEQiKQotIDdjNDQyMDJlMzYwOSAoInBvd2Vy
cGMvZTUwMDogdXNlIGNvbnRpZ3VvdXMgUE1EIGluc3RlYWQgb2YgaHVnZXBkIikKLSAwNTQ5ZTc2
NjYzNzMgKCJwb3dlcnBjLzh4eDogcmV3b3JrIHN1cHBvcnQgZm9yIDhNIHBhZ2VzIHVzaW5nIApj
b250aWd1b3VzIFBURSBlbnRyaWVzIikKCkNocmlzdG9waGUKCj4gCj4gQm90aCBhcm02NCBhbmQg
cmlzY3Ygc3VwcG9ydCB0aGUgdXNlIG9mIGNvbnRpZ3VvdXMgcHRlcyB0byBtYXAgcGFnZXMgdGhh
dAo+IGFyZSBsYXJnZXIgdGhhbiB0aGUgZGVmYXVsdCBwYWdlIHRhYmxlIHNpemUsIHJlc3BlY3Rp
dmVseSBjYWxsZWQgY29udHB0ZQo+IGFuZCBzdm5hcG90Lgo+IAo+IFRoZSByaXNjdiBpbXBsZW1l
bnRhdGlvbiBkaWZmZXJzIGZyb20gdGhlIGFybTY0J3MgaW4gdGhhdCB0aGUgTFNCcyBvZiB0aGUK
PiBwZm4gb2YgYSBzdm5hcG90IHB0ZSBhcmUgdXNlZCB0byBzdG9yZSB0aGUgc2l6ZSBvZiB0aGUg
bWFwcGluZywgYWxsb3dpbmcKPiBmb3IgZnV0dXJlIHNpemVzIHRvIGJlIGFkZGVkIChmb3Igbm93
IG9ubHkgNjRLQiBpcyBzdXBwb3J0ZWQpLiBUaGF0J3MgYW4KPiBpc3N1ZSBmb3IgdGhlIGNvcmUg
bW0gY29kZSB3aGljaCBleHBlY3RzIHRvIGZpbmQgdGhlICpyZWFsKiBwZm4gYSBwdGUgcG9pbnRz
Cj4gdG8uIFBhdGNoIDEgZml4ZXMgdGhhdCBieSBhbHdheXMgcmV0dXJuaW5nIHN2bmFwb3QgcHRl
cyB3aXRoIHRoZSByZWFsIHBmbgo+IGFuZCByZXN0b3JlcyB0aGUgc2l6ZSBvZiB0aGUgbWFwcGlu
ZyB3aGVuIGl0IGlzIHdyaXR0ZW4gdG8gYSBwYWdlIHRhYmxlLgo+IAo+IFRoZSBmb2xsb3dpbmcg
cGF0Y2hlcyBhcmUganVzdCBtZXJnZXMgb2YgdGhlIDIgZGlmZmVyZW50IGltcGxlbWVudGF0aW9u
cwo+IHRoYXQgY3VycmVudGx5IGV4aXN0IGluIGFybTY0IGFuZCByaXNjdiB3aGljaCBhcmUgdmVy
eSBzaW1pbGFyLiBJdCBwYXZlcwo+IHRoZSB3YXkgdG8gdGhlIHJldXNlIG9mIHRoZSByZWNlbnQg
Y29udHB0ZSBUSFAgd29yayBieSBSeWFuIFsxXSB0byBhdm9pZAo+IHJlaW1wbGVtZW50aW5nIHRo
ZSBzYW1lIGluIHJpc2N2Lgo+IAo+IFRoaXMgcGF0Y2hzZXQgd2FzIHRlc3RlZCBieSBydW5uaW5n
IHRoZSBsaWJodWdldGxiZnMgdGVzdHN1aXRlIHdpdGggNjRLQgo+IGFuZCAyTUIgcGFnZXMgb24g
Ym90aCBhcmNoaXRlY3R1cmVzIChvbiBhIDRLQiBiYXNlIHBhZ2Ugc2l6ZSBhcm02NCBrZXJuZWwp
Lgo+IAo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjQw
MjE1MTAzMjA1LjI2MDcwMTYtMS1yeWFuLnJvYmVydHNAYXJtLmNvbS8KPiAKPiB2NDogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNTAxMjcwOTM1MzAuMTk1NDgtMS1hbGV4
Z2hpdGlAcml2b3NpbmMuY29tLwo+IHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
NDA4MDIxNTE0MzAuOTkxMTQtMS1hbGV4Z2hpdGlAcml2b3NpbmMuY29tLwo+IHYyOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MDUwODExMzQxOS4xODYyMC0xLWFsZXhn
aGl0aUByaXZvc2luYy5jb20vCj4gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJp
c2N2LzIwMjQwMzAxMDkxNDU1LjI0NjY4Ni0xLWFsZXhnaGl0aUByaXZvc2luYy5jb20vCj4gCj4g
Q2hhbmdlcyBpbiB2NToKPiAgICAtIEZpeCAiaW50IGkiIHVudXNlZCB2YXJpYWJsZSBpbiBwYXRj
aCAyIChhcyByZXBvcnRlZCBieSBQVykKPiAgICAtIEZpeCAhc3ZuYXBvdCBidWlsZAo+ICAgIC0g
Rml4IGFyY2hfbWFrZV9odWdlX3B0ZSgpIHdoaWNoIHJldHVybmVkIGEgcmVhbCBuYXBvdCBwdGUK
PiAgICAtIE1ha2UgX19wdGVwX2dldCgpLCBwdGVwX2dldF9hbmRfY2xlYXIoKSBhbmQgX19zZXRf
cHRlcygpIG5hcG90IGF3YXJlIHRvCj4gICAgICBhdm9pZCBsZWFraW5nIHJlYWwgbmFwb3QgcGZu
cyB0byBjb3JlIG1tCj4gICAgLSBGaXggYXJjaF9jb250cHRlX2dldF9udW1fY29udGlnKCkgdGhh
dCB1c2VkIHRvIGFsd2F5cyB0cnkgdG8gZ2V0IHRoZQo+ICAgICAgbWFwcGluZyBzaXplIGZyb20g
dGhlIHB0ZXAsIHdoaWNoIGRvZXMgbm90IHdvcmsgaWYgdGhlIHB0ZXAgY29tZXMgdGhlIGNvcmUg
bW0KPiAgICAtIFJlYmFzZSBvbiB0b3Agb2YgNi4xNC1yYzcgKyBmaXggZm9yCj4gICAgICBodWdl
X3B0ZXBfZ2V0X2FuZF9jbGVhcigpL2h1Z2VfcHRlX2NsZWFyKCkKPiAgICAgIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUwMzE3MDcyNTUxLjU3MjE2OS0xLWFsZXhnaGl0
aUByaXZvc2luYy5jb20vCj4gCj4gQ2hhbmdlcyBpbiB2NDoKPiAgICAtIFJlYmFzZSBvbiB0b3Ag
b2YgNi4xMwo+IAo+IENoYW5nZXMgaW4gdjM6Cj4gICAgLSBTcGxpdCBzZXRfcHRlcyBhbmQgcHRl
cF9nZXQgaW50byBpbnRlcm5hbCBhbmQgZXh0ZXJuYWwgQVBJIChSeWFuKQo+ICAgIC0gUmVuYW1l
IEFSQ0hfSEFTX0NPTlRQVEUgaW50byBBUkNIX1dBTlRfR0VORVJBTF9IVUdFVExCX0NPTlRQVEUg
c28gdGhhdAo+ICAgICAgd2Ugc3BsaXQgaHVnZXRsYiBmdW5jdGlvbnMgZnJvbSBjb250cHRlIGZ1
bmN0aW9ucyAoYWN0dWFsbHkgcmlzY3YgY29udHB0ZQo+ICAgICAgZnVuY3Rpb25zIHRvIHN1cHBv
cnQgVEhQIHdpbGwgY29tZSBpbnRvIGFub3RoZXIgc2VyaWVzKSAoUnlhbikKPiAgICAtIFJlYmFz
ZSBvbiB0b3Agb2YgNi4xMS1yYzEKPiAKPiBDaGFuZ2VzIGluIHYyOgo+ICAgIC0gUmViYXNlIG9u
IHRvcCBvZiA2LjktcmMzCj4gCj4gQWxleGFuZHJlIEdoaXRpICg5KToKPiAgICByaXNjdjogU2Fm
ZWx5IHJlbW92ZSBodWdlX3B0ZV9vZmZzZXQoKSB3aGVuIG1hbmlwdWxhdGluZyBOQVBPVCBwdGVz
Cj4gICAgcmlzY3Y6IFJlc3RvcmUgdGhlIHBmbiBpbiBhIE5BUE9UIHB0ZSB3aGVuIG1hbmlwdWxh
dGVkIGJ5IGNvcmUgbW0gY29kZQo+ICAgIG1tOiBVc2UgY29tbW9uIGh1Z2VfcHRlcF9nZXQoKSBm
dW5jdGlvbiBmb3IgcmlzY3YvYXJtNjQKPiAgICBtbTogVXNlIGNvbW1vbiBzZXRfaHVnZV9wdGVf
YXQoKSBmdW5jdGlvbiBmb3IgcmlzY3YvYXJtNjQKPiAgICBtbTogVXNlIGNvbW1vbiBodWdlX3B0
ZV9jbGVhcigpIGZ1bmN0aW9uIGZvciByaXNjdi9hcm02NAo+ICAgIG1tOiBVc2UgY29tbW9uIGh1
Z2VfcHRlcF9nZXRfYW5kX2NsZWFyKCkgZnVuY3Rpb24gZm9yIHJpc2N2L2FybTY0Cj4gICAgbW06
IFVzZSBjb21tb24gaHVnZV9wdGVwX3NldF9hY2Nlc3NfZmxhZ3MoKSBmdW5jdGlvbiBmb3Igcmlz
Y3YvYXJtNjQKPiAgICBtbTogVXNlIGNvbW1vbiBodWdlX3B0ZXBfc2V0X3dycHJvdGVjdCgpIGZ1
bmN0aW9uIGZvciByaXNjdi9hcm02NAo+ICAgIG1tOiBVc2UgY29tbW9uIGh1Z2VfcHRlcF9jbGVh
cl9mbHVzaCgpIGZ1bmN0aW9uIGZvciByaXNjdi9hcm02NAo+IAo+ICAgYXJjaC9hcm02NC9LY29u
ZmlnICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ICAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9o
dWdldGxiLmggICAgfCAgMjIgKy0tCj4gICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3BndGFibGUu
aCAgICB8ICA2OCArKysrKystCj4gICBhcmNoL2FybTY0L21tL2h1Z2V0bGJwYWdlLmMgICAgICAg
ICB8IDI5NCArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICBhcmNoL3Jpc2N2L0tjb25m
aWcgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h1
Z2V0bGIuaCAgICB8ICAzNiArLS0tCj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUt
NjQuaCB8ICAxMSArKwo+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggICAgfCAy
MjIgKysrKysrKysrKysrKysrKysrLS0tCj4gICBhcmNoL3Jpc2N2L21tL2h1Z2V0bGJwYWdlLmMg
ICAgICAgICB8IDI0MyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgYXJjaC9yaXNjdi9tbS9w
Z3RhYmxlLmMgICAgICAgICAgICAgfCAgIDYgKy0KPiAgIGluY2x1ZGUvbGludXgvaHVnZXRsYl9j
b250cHRlLmggICAgIHwgIDM5ICsrKysKPiAgIG1tL0tjb25maWcgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAzICsKPiAgIG1tL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAxICsKPiAgIG1tL2h1Z2V0bGJfY29udHB0ZS5jICAgICAgICAgICAgICAgIHwgMjU4ICsrKysr
KysrKysrKysrKysrKysrKysrKwo+ICAgMTQgZmlsZXMgY2hhbmdlZCwgNTgzIGluc2VydGlvbnMo
KyksIDYyMiBkZWxldGlvbnMoLSkKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4
L2h1Z2V0bGJfY29udHB0ZS5oCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgbW0vaHVnZXRsYl9jb250
cHRlLmMKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
