Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BCFC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 13:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6VISce7ev4vvSab5fuDqXALA5BW3Q1iLweMGUelut/4=; b=5E/mJHkrigWHuL
	Dvp35yk5OHHNa/m4RFbJy9hkocdhJdsF2x3N3geTq+WAgJsLvotWnpjTaPOJipTAGt594zhTQb689
	SB/6qXBimgyI/QPrREwOxhpwFI5eTZPaEXzf6XZrGdJYaFF/ZCURE8afhKGplxxeSXvVuSRYuSOAz
	hCm61q7ejXczanG4aPkBuQ3Qmw8fztHGYxeVqTJgZS7eXOPyCFN0u75mQzhR4s941TschJXpYtsX+
	xyZEar1RKtcFf2G48L/v5A8LuO13uqnHrp/fob7sQ1p53t3eua5Yd0qYsMrfZnp68WbLRUXy+w6bg
	Q+AuKa8CKYdPq/aKzNAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxROu-00000002I6T-1jpr;
	Thu, 18 Apr 2024 13:02:04 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxROk-00000002Hyf-3r0n
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 13:02:02 +0000
Date: Thu, 18 Apr 2024 15:01:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1713445310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0GJg4wo0VKLac1PG97GL83QKeqaA9szY5zPKromLH+A=;
	b=td7NRfGfcrv0MyyqY+R9o3SoF/k2jyFG+Hw7c1iUg6sGEx/jr18/rj4iS1DJnfvGCR68pw
	rPRsi11sW51RYh1zIYoVxRPbgMoAcCiEAMrRLR9nlGI5MXoHvXTg5w8haFnEipTHC8L2HL
	GWVwjcdQbvWzbsxenfbbEpLyISg/ZtzSzQqBBJIKiBRu1NpOfgm0acuuLOqhmM7RBrjlCv
	s1DWtTp64zduTiWs856+1dllq2b+ovcJwOPy67hRL8w+Lhx9oDOQqbijAjb1461hu1NJiM
	A0X0DzUjidKOd+p1q3gRJpZoCjKF40N02qN+mT8SxrMv/j+9pK+Fqj7LhvA3Yw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1713445310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0GJg4wo0VKLac1PG97GL83QKeqaA9szY5zPKromLH+A=;
	b=NTafIBCYsXh1Tdh3iOhsXmxdqRGVtfe43CHFbsPqgsih4/iAHkX8D+I5XsL1Gc1tYxHC6+
	BnB4ua0EWdlKKbCw==
From: Nam Cao <namcao@linutronix.de>
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Andreas Dilger <adilger@dilger.ca>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, "ndesaulniers @ google . com"
 <ndesaulniers@google.com>, Luis Chamberlain <mcgrof@kernel.org>, Ingo
 Molnar <mingo@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Tejun Heo <tj@kernel.org>, Krister Johansen <kjlx@templeofstupid.com>,
 Changbin Du <changbin.du@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] init: fix allocated page overlapping with PTR_ERR
Message-ID: <20240418150148.6a0b4664@namcao>
In-Reply-To: <87edb2sv0d.fsf@all.your.base.are.belong.to.us>
References: <20240418102943.180510-1-namcao@linutronix.de>
	<20240418131238.636bee2c@namcao>
	<87edb2sv0d.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_060155_286175_33BF45F0 
X-CRM114-Status: GOOD (  33.31  )
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

T24gMjAyNC0wNC0xOCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IE5hbSBDYW8gPG5hbWNhb0BsaW51
dHJvbml4LmRlPiB3cml0ZXM6Cj4gCj4gPiBPbiAyMDI0LTA0LTE4IE5hbSBDYW8gd3JvdGU6Cj4g
Pj4gVGhlcmUgaXMgbm90aGluZyBwcmV2ZW50aW5nIGtlcm5lbCBtZW1vcnkgYWxsb2NhdG9ycyBm
cm9tIGFsbG9jYXRpbmcgYQo+ID4+IHBhZ2UgdGhhdCBvdmVybGFwcyB3aXRoIFBUUl9FUlIoKSwg
ZXhjZXB0IGZvciBhcmNoaXRlY3R1cmUtc3BlY2lmaWMKPiA+PiBjb2RlIHRoYXQgc2V0dXAgbWVt
YmxvY2suCj4gPj4gCj4gPj4gSXQgd2FzIGRpc2NvdmVyZWQgdGhhdCBSSVNDViBhcmNoaXRlY3R1
cmUgZG9lc24ndCBzZXR1cCBtZW1ibG9jawo+ID4+IGNvcmVjdGx5LCBsZWFkaW5nIHRvIGEgcGFn
ZSBvdmVybGFwcGluZyB3aXRoIFBUUl9FUlIoKSBiZWluZyBhbGxvY2F0ZWQsCj4gPj4gYW5kIHN1
YnNlcXVlbnRseSBjcmFzaGluZyB0aGUga2VybmVsIChsaW5rIGluIENsb3NlOiApCj4gPj4gCj4g
Pj4gVGhlIHJlcG9ydGVkIGNyYXNoIGhhcyBub3RoaW5nIHRvIGRvIHdpdGggUFRSX0VSUigpOiB0
aGUgbGFzdCBwYWdlCj4gPj4gKGF0IGFkZHJlc3MgMHhmZmZmZjAwMCkgYmVpbmcgYWxsb2NhdGVk
IGxlYWRzIHRvIGFuIHVuZXhwZWN0ZWQKPiA+PiBhcml0aG1ldGljIG92ZXJmbG93IGluIGV4dDQ7
IGJ1dCBzdGlsbCwgdGhpcyBwYWdlIHNob3VsZG4ndCBiZQo+ID4+IGFsbG9jYXRlZCBpbiB0aGUg
Zmlyc3QgcGxhY2UuCj4gPj4gCj4gPj4gQmVjYXVzZSBQVFJfRVJSKCkgaXMgYW4gYXJjaGl0ZWN0
dXJlLWluZGVwZW5kZW50IHRoaW5nLCB3ZSBzaG91bGRuJ3QKPiA+PiBhc2sgZXZlcnkgc2luZ2xl
IGFyY2hpdGVjdHVyZSB0byBzZXQgdGhpcyB1cC4gVGhlcmUgbWF5IGJlIG90aGVyCj4gPj4gYXJj
aGl0ZWN0dXJlcyBiZXNpZGUgUklTQ1YgdGhhdCBoYXZlIHRoZSBzYW1lIHByb2JsZW0uCj4gPj4g
Cj4gPj4gRml4IHRoaXMgb25lIGFuZCBmb3IgYWxsIGJ5IHJlc2VydmluZyB0aGUgcGh5c2ljYWwg
bWVtb3J5IHBhZ2UgdGhhdAo+ID4+IG1heSBiZSBtYXBwZWQgdG8gdGhlIGxhc3QgdmlydHVhbCBt
ZW1vcnkgcGFnZSBhcyBwYXJ0IG9mIGxvdyBtZW1vcnkuCj4gPj4gCj4gPj4gVW5mb3J0dW5hdGVs
eSwgdGhpcyBtZWFucyBpZiB0aGVyZSBpcyBhY3R1YWwgbWVtb3J5IGF0IHRoaXMgcmVzZXJ2ZWQK
PiA+PiBsb2NhdGlvbiwgdGhhdCBtZW1vcnkgd2lsbCBiZWNvbWUgaW5hY2Nlc3NpYmxlLiBIb3dl
dmVyLCBpZiB0aGlzIHBhZ2UKPiA+PiBpcyBub3QgcmVzZXJ2ZWQsIGl0IGNhbiBvbmx5IGJlIGFj
Y2Vzc2VkIGFzIGhpZ2ggbWVtb3J5LCBzbyB0aGlzCj4gPj4gZG9lc24ndCBtYXR0ZXIgaWYgaGln
aCBtZW1vcnkgaXMgbm90IHN1cHBvcnRlZC4gRXZlbiBpZiBoaWdoIG1lbW9yeSBpcwo+ID4+IHN1
cHBvcnRlZCwgaXQgaXMgc3RpbGwgb25seSBvbmUgcGFnZS4KPiA+PiAKPiA+PiBDbG9zZXM6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2Lzg3OHIxaWJwZG4uZnNmQGFsbC55b3Vy
LmJhc2UuYXJlLmJlbG9uZy50by51cwo+ID4+IFNpZ25lZC1vZmYtYnk6IE5hbSBDYW8gPG5hbWNh
b0BsaW51dHJvbml4LmRlPgo+ID4+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyBhbGwg
dmVyc2lvbnMKPiA+Cj4gPiBTb3JyeSwgZm9yZ290IHRvIGFkZDoKPiA+IFJlcG9ydGVkLWJ5OiBC
asO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgo+IAo+IEhtbSwgY2FuJ3Qgd2UgZ2V0IHJp
ZCBvZiB0aGUgd2hvbGUgY2hlY2sgaW4gYXJjaC9yaXNjdi9tbS9pbml0LmMgZm9yCj4gMzJiPwoK
V2UgY2FuLCBidXQgdGhhdCBkZXBlbmRzIG9uIHRoaXMgcGF0Y2guIFNvIG15IGludGVudGlvbiBp
cyB0byB3YWl0IGZvcgp0aGlzIHBhdGNoIHRvIGJlIGFwcGxpZWQgZmlyc3QsIGJlY2F1c2UgSSBk
b24ndCB3YW50IHRvIGJvdGhlciB0aGUKbWFpbnRhaW5lcnMgd2l0aCBkZXBlbmRlbmNpZXMuCgo+
IC0tODwtLQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3Yv
bW0vaW5pdC5jCj4gaW5kZXggZmU4ZTE1OTM5NGQ4Li4xZTkxZDU3Mjg4ODcgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiArKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+IEBA
IC0xOTYsNyArMTk2LDYgQEAgZWFybHlfcGFyYW0oIm1lbSIsIGVhcmx5X21lbSk7Cj4gIHN0YXRp
YyB2b2lkIF9faW5pdCBzZXR1cF9ib290bWVtKHZvaWQpCj4gIHsKPiAgCXBoeXNfYWRkcl90IHZt
bGludXhfZW5kID0gX19wYV9zeW1ib2woJl9lbmQpOwo+IC0JcGh5c19hZGRyX3QgbWF4X21hcHBl
ZF9hZGRyOwo+ICAJcGh5c19hZGRyX3QgcGh5c19yYW1fZW5kLCB2bWxpbnV4X3N0YXJ0Owo+ICAK
PiAgCWlmIChJU19FTkFCTEVEKENPTkZJR19YSVBfS0VSTkVMKSkKPiBAQCAtMjM0LDIxICsyMzMs
NiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfYm9vdG1lbSh2b2lkKQo+ICAJaWYgKElTX0VO
QUJMRUQoQ09ORklHXzY0QklUKSkKPiAgCQlrZXJuZWxfbWFwLnZhX3BhX29mZnNldCA9IFBBR0Vf
T0ZGU0VUIC0gcGh5c19yYW1fYmFzZTsKPiAgCj4gLQkvKgo+IC0JICogbWVtYmxvY2sgYWxsb2Nh
dG9yIGlzIG5vdCBhd2FyZSBvZiB0aGUgZmFjdCB0aGF0IGxhc3QgNEsgYnl0ZXMgb2YKPiAtCSAq
IHRoZSBhZGRyZXNzYWJsZSBtZW1vcnkgY2FuIG5vdCBiZSBtYXBwZWQgYmVjYXVzZSBvZiBJU19F
UlJfVkFMVUUKPiAtCSAqIG1hY3JvLiBNYWtlIHN1cmUgdGhhdCBsYXN0IDRrIGJ5dGVzIGFyZSBu
b3QgdXNhYmxlIGJ5IG1lbWJsb2NrCj4gLQkgKiBpZiBlbmQgb2YgZHJhbSBpcyBlcXVhbCB0byBt
YXhpbXVtIGFkZHJlc3NhYmxlIG1lbW9yeS4gIEZvciA2NC1iaXQKPiAtCSAqIGtlcm5lbCwgdGhp
cyBwcm9ibGVtIGNhbid0IGhhcHBlbiBoZXJlIGFzIHRoZSBlbmQgb2YgdGhlIHZpcnR1YWwKPiAt
CSAqIGFkZHJlc3Mgc3BhY2UgaXMgb2NjdXBpZWQgYnkgdGhlIGtlcm5lbCBtYXBwaW5nIHRoZW4g
dGhpcyBjaGVjayBtdXN0Cj4gLQkgKiBiZSBkb25lIGFzIHNvb24gYXMgdGhlIGtlcm5lbCBtYXBw
aW5nIGJhc2UgYWRkcmVzcyBpcyBkZXRlcm1pbmVkLgo+IC0JICovCj4gLQlpZiAoIUlTX0VOQUJM
RUQoQ09ORklHXzY0QklUKSkgewo+IC0JCW1heF9tYXBwZWRfYWRkciA9IF9fcGEofih1bG9uZykw
KTsKPiAtCQlpZiAobWF4X21hcHBlZF9hZGRyID09IChwaHlzX3JhbV9lbmQgLSAxKSkKPiAtCQkJ
bWVtYmxvY2tfc2V0X2N1cnJlbnRfbGltaXQobWF4X21hcHBlZF9hZGRyIC0gNDA5Nik7Cj4gLQl9
Cj4gLQoKSWYgeW91IGFyZSBnb2luZyB0byBzZW5kIHRoaXMsIHlvdSBjYW4gYWRkOgpSZXZpZXdl
ZC1ieTogTmFtIENhbyA8bmFtY2FvQGxpbnV0cm9uaXguZGU+Cgo+ICAJbWluX2xvd19wZm4gPSBQ
Rk5fVVAocGh5c19yYW1fYmFzZSk7Cj4gIAltYXhfbG93X3BmbiA9IG1heF9wZm4gPSBQRk5fRE9X
TihwaHlzX3JhbV9lbmQpOwo+ICAJaGlnaF9tZW1vcnkgPSAodm9pZCAqKShfX3ZhKFBGTl9QSFlT
KG1heF9sb3dfcGZuKSkpOwo+IC0tODwtLQo+IAo+IE1pa2UgaGludHMgdGhhdCdzICpub3QqIHRo
ZSBjYXNlCj4gKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L1ppQWtSTVVmaVBE
VUdQZExAa2VybmVsLm9yZy8pLgo+IG1lbWJsb2NrX3Jlc2VydmUoKSBzaG91bGQgZGlzYWxsb3cg
YWxsb2NhdGlvbiBhcyB3ZWxsLCBubz8KCkhlIHNhaWQgaXQgY2FuJ3QgYmUgcmVtb3ZlZCBpZiB3
ZSBzZXQgbWF4X2xvd19wZm4gaW5zdGVhZCBvZiB1c2luZwptZW1ibG9ja19yZXNlcnZlKCkKCklm
IG1heF9sb3dfcGZuKCkgaXMgdXNlZCwgdGhlbiBpdCBjYW4gYmUgcmVtb3ZlZDoKaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvWmg2bi1udm5RYkwtMHhzc0BrZXJuZWwub3JnCgpC
ZXN0IHJlZ2FyZHMsCk5hbQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
