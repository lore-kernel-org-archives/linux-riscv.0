Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FB4C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 12:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l9rSCyM7pR+vdzR/IbRz/rjCIwUB7v1VfxegnViqBjg=; b=AXIhMECrmdaKDO
	yhbrVMbDuIRJ5LQwAY53yTT2pmSj9FTogLysSIwUBKxV/AczIs/wPxlLUcgmO3ACa0wl7jjuNInJ8
	eDuRSnbQwFgK2RiFCiopE/llVKhrlKKENzI0DNBmLiE2X8+AWduiWzichtrtDkty9YDGsN6i8+LUa
	aM6SqhXxUPvsBiuPtAq6lzo20gzQuXUDUD8TNJ/hw0tI9EnIAWUuviymbaJeif2ox7BhYCBsXG2vx
	S1PtJKhYVjL8+sucYXoE772XXefjr0BVa/6OmwdcL7Iiv0pBaCgx5d01t97kgrecoCdRBERtFL2x9
	ucbuQCedOzmRxn6ODnHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzyg9-00000008M2c-1Laf;
	Thu, 25 Apr 2024 12:58:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzyg6-00000008M1R-1WQ1
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 12:58:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F156161E02;
	Thu, 25 Apr 2024 12:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B1DC113CC;
	Thu, 25 Apr 2024 12:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714049896;
	bh=JyQm9VGmJkZTxCcFWAIKfFZx/qAJNcE1EJUqGNLUBZc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PkcNfV3LVD62NBTVN5zwqCBk8/ewv7iodL7F3a/SAIaUh2T5MMh0bSJooF51j5UEz
	 MP4G6fU64nvIX49BeQBIFPQnXuTs0bghJGDbrwZBxWyyEX7G2zx58jfsCsjNKJQbbO
	 EGUnKZrlA7r1Fn8SKH5AsnFGlKbOb1XfaBx/ogxkjSH3I6iBa96oRkIFBCbYaTv0zf
	 JUkyQK94PZIc2XeMiNRmEi+tEL1U5IbrZ8YORU1Uk5xxOGwKYE3CKY58tAp+/fNpQh
	 wKQqkNnLZges1L9IoV/SBAfR9BKWuZpy+IOIxVAjXw8TKEJgGD0Nhmz+tyDSfTCoLC
	 dhfx0rfL12Kgw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew
 Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, Sami
 Tolvanen <samitolvanen@google.com>, Chen Jiahao <chenjiahao16@huawei.com>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, rppt@kernel.org
Cc: Nam Cao <namcao@linutronix.de>, stable@vger.kernel.org
Subject: Re: [PATCH] riscv: fix overlap of allocated page and PTR_ERR
In-Reply-To: <20240425115201.3044202-1-namcao@linutronix.de>
References: <20240425115201.3044202-1-namcao@linutronix.de>
Date: Thu, 25 Apr 2024 14:58:12 +0200
Message-ID: <87bk5xbnvf.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_055818_624916_55B692E7 
X-CRM114-Status: GOOD (  25.19  )
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

TmFtIENhbyA8bmFtY2FvQGxpbnV0cm9uaXguZGU+IHdyaXRlczoKCj4gT24gcmlzY3YzMiwgaXQg
aXMgcG9zc2libGUgZm9yIHRoZSBsYXN0IHBhZ2UgaW4gdmlydHVhbCBhZGRyZXNzIHNwYWNlCj4g
KDB4ZmZmZmYwMDApIHRvIGJlIGFsbG9jYXRlZC4gVGhpcyBwYWdlIG92ZXJsYXBzIHdpdGggUFRS
X0VSUiwgc28gdGhhdAo+IHNob3VsZG4ndCBoYXBwZW4uCj4KPiBUaGVyZSBpcyBhbHJlYWR5IHNv
bWUgY29kZSB0byBlbnN1cmUgbWVtYmxvY2sgd29uJ3QgYWxsb2NhdGUgdGhlIGxhc3QgcGFnZS4K
PiBIb3dldmVyLCBidWRkeSBhbGxvY2F0b3IgaXMgbGVmdCB1bmNoZWNrZWQuCj4KPiBGaXggdGhp
cyBieSByZXNlcnZpbmcgcGh5c2ljYWwgbWVtb3J5IHRoYXQgd291bGQgYmUgbWFwcGVkIGF0IHZp
cnR1YWwKPiBhZGRyZXNzZXMgZ3JlYXRlciB0aGFuIDB4ZmZmZmYwMDAuCj4KPiBSZXBvcnRlZC1i
eTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KPiBDbG9zZXM6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2Lzg3OHIxaWJwZG4uZnNmQGFsbC55b3VyLmJhc2UuYXJl
LmJlbG9uZy50by51cwo+IEZpeGVzOiA3NmQyYTA0OTNhMTcgKCJSSVNDLVY6IEluaXQgYW5kIEhh
bHQgQ29kZSIpCj4gU2lnbmVkLW9mZi1ieTogTmFtIENhbyA8bmFtY2FvQGxpbnV0cm9uaXguZGU+
Cj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgoKClRoYW5rcyBmb3IgcGlja2luZyBpdCB1
cCBhZ2FpbiwgTmFtLgoKVGhpcyBwYXNzZXMgbXkgdGVzdDoKVGVzdGVkLWJ5OiBCasO2cm4gVMO2
cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cgo+IC0tLQo+ICBhcmNoL3Jpc2N2L21tL2luaXQuYyB8
IDIxICsrKysrKysrKysrLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9u
cygrKSwgMTAgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0
LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+IGluZGV4IDk2ODc2MTg0MzIwMy4uN2M5ODU0MzVi
M2ZjIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gKysrIGIvYXJjaC9yaXNj
di9tbS9pbml0LmMKPiBAQCAtMjM1LDE4ICsyMzUsMTkgQEAgc3RhdGljIHZvaWQgX19pbml0IHNl
dHVwX2Jvb3RtZW0odm9pZCkKPiAgCQlrZXJuZWxfbWFwLnZhX3BhX29mZnNldCA9IFBBR0VfT0ZG
U0VUIC0gcGh5c19yYW1fYmFzZTsKPiAgCj4gIAkvKgo+IC0JICogbWVtYmxvY2sgYWxsb2NhdG9y
IGlzIG5vdCBhd2FyZSBvZiB0aGUgZmFjdCB0aGF0IGxhc3QgNEsgYnl0ZXMgb2YKPiAtCSAqIHRo
ZSBhZGRyZXNzYWJsZSBtZW1vcnkgY2FuIG5vdCBiZSBtYXBwZWQgYmVjYXVzZSBvZiBJU19FUlJf
VkFMVUUKPiAtCSAqIG1hY3JvLiBNYWtlIHN1cmUgdGhhdCBsYXN0IDRrIGJ5dGVzIGFyZSBub3Qg
dXNhYmxlIGJ5IG1lbWJsb2NrCj4gLQkgKiBpZiBlbmQgb2YgZHJhbSBpcyBlcXVhbCB0byBtYXhp
bXVtIGFkZHJlc3NhYmxlIG1lbW9yeS4gIEZvciA2NC1iaXQKPiAtCSAqIGtlcm5lbCwgdGhpcyBw
cm9ibGVtIGNhbid0IGhhcHBlbiBoZXJlIGFzIHRoZSBlbmQgb2YgdGhlIHZpcnR1YWwKPiAtCSAq
IGFkZHJlc3Mgc3BhY2UgaXMgb2NjdXBpZWQgYnkgdGhlIGtlcm5lbCBtYXBwaW5nIHRoZW4gdGhp
cyBjaGVjayBtdXN0Cj4gLQkgKiBiZSBkb25lIGFzIHNvb24gYXMgdGhlIGtlcm5lbCBtYXBwaW5n
IGJhc2UgYWRkcmVzcyBpcyBkZXRlcm1pbmVkLgo+ICsJICogUmVzZXJ2ZSBwaHlzaWNhbCBhZGRy
ZXNzIHNwYWNlIHRoYXQgd291bGQgYmUgbWFwcGVkIHRvIHZpcnR1YWwKPiArCSAqIGFkZHJlc3Nl
cyBncmVhdGVyIHRoYW4gKHZvaWQgKikoLVBBR0VfU0laRSkgYmVjYXVzZToKPiArCSAqICAtIFRo
aXMgbWVtb3J5IHdvdWxkIG92ZXJsYXAgd2l0aCBFUlJfUFRSCj4gKwkgKiAgLSBUaGlzIG1lbW9y
eSBiZWxvbmdzIHRvIGhpZ2ggbWVtb3J5LCB3aGljaCBpcyBub3Qgc3VwcG9ydGVkCj4gKwkgKgo+
ICsJICogVGhpcyBpcyBub3QgYXBwbGljYWJsZSB0byA2NC1iaXQga2VybmVsLCBiZWNhdXNlIHZp
cnR1YWwgYWRkcmVzc2VzCj4gKwkgKiBhZnRlciAodm9pZCAqKSgtUEFHRV9TSVpFKSBhcmUgbm90
IGxpbmVhcmx5IG1hcHBlZDogdGhleSBhcmUKPiArCSAqIG9jY3VwaWVkIGJ5IGtlcm5lbCBtYXBw
aW5nLiBBbHNvIGl0IGlzIHVucmVhbGlzdGljIGZvciBoaWdoIG1lbW9yeQo+ICsJICogdG8gZXhp
c3Qgb24gNjQtYml0IHBsYXRmb3Jtcy4KPiAgCSAqLwo+ICAJaWYgKCFJU19FTkFCTEVEKENPTkZJ
R182NEJJVCkpIHsKPiAtCQltYXhfbWFwcGVkX2FkZHIgPSBfX3BhKH4odWxvbmcpMCk7Cj4gLQkJ
aWYgKG1heF9tYXBwZWRfYWRkciA9PSAocGh5c19yYW1fZW5kIC0gMSkpCj4gLQkJCW1lbWJsb2Nr
X3NldF9jdXJyZW50X2xpbWl0KG1heF9tYXBwZWRfYWRkciAtIDQwOTYpOwo+ICsJCW1heF9tYXBw
ZWRfYWRkciA9IF9fdmFfdG9fcGFfbm9kZWJ1ZygtUEFHRV9TSVpFKTsKPiArCQltZW1ibG9ja19y
ZXNlcnZlKG1heF9tYXBwZWRfYWRkciwgKHBoeXNfYWRkcl90KS1tYXhfbWFwcGVkX2FkZHIpOwoK
Tml0IChhbmQgb25seSBpZiB5b3UgcmVzcGluIGZvciBzb21lIHJlYXNvbik6IE1vdmUgbWF4X21h
cHBlZF9hZGRyIGludG8KdGhlIGlmLWNsYXVzZSwgb3Igc2ltcGx5IGdldCByaWQgb2YgaXQgKGFs
bCBvbiBvbmUgbGluZSkuCgpSZWdhcmRsZXNzOgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8
Ympvcm5Acml2b3NpbmMuY29tPgoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
