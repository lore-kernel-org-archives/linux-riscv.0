Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FD0C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 11:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/UPBXBBhBejWN2Kabo3jcfJ2n+DxxJrKs2hyuDgPRU=; b=PgKOOM4EjvzlLr
	etzWxqPC/mLWdvpLeJOjW58pvfiC+pUZy52HvByAqxsaecSZwhGgTLkIwT9sRYYXdPJf2WiSzvfA0
	Kbh1NEmWKo8kMo2alw1Bn1+lDrB8QOhFmLmcFHIi2PjVSHh45NLDpEzZtq6b6sNmJGhL8Ti6Y6G8i
	uPTw5EtmoSDzCG86gDz3+cE2bOIsGGSiwDFzIQ7/gj+aLQCoa2ZXpCyCxm1HvmzRUpVVuOZOoGtDM
	MCt7yQKPRp/10aB9x8i+XekPZMzig7qojQ0Y2ucxFIFcq5ele3GIIR+Ebr59Fyoqq9Ir0NykZaX2u
	8lngcxYRw7XeS9y3mcyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxPhB-00000001xRl-45RJ;
	Thu, 18 Apr 2024 11:12:49 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxPh5-00000001xPd-3add
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 11:12:47 +0000
Date: Thu, 18 Apr 2024 13:12:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1713438759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nCv9ASSWxGZcIN7EnwuxCIn0p9FkfWST0gNno06amaQ=;
	b=l6a+QUypxbl9h555q2yiw/t94zDEElznKUzGxGLAY/rHnR02Y/nSIP4bBAiuhDhJDVZUK5
	H7Np4stZZGUcBsoAjV4oysMkigqHK4i2tspfqn9A4bR1K54JUR9lxe+/RIfaJu3RwmVrS2
	7P6Bte7YnLDphUF1DtMd4oS3ccYZQTcjjXSic9zRlTt1gNqwO0q7KsZlY6/+E1Vvk50bHR
	GUeCDi7Nnkfzr4+5dYFOKNdrVCpxFh9lpbZfAKlZEmX7qQVbNeNAqfpugKtYCEAKNEJ470
	ZLMjEUwZ8XEQj7TEjffWRS5wc/xE8vPB+Xl+nB1Hd5iemqeNli8Bkz5+N+3Hrw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1713438759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nCv9ASSWxGZcIN7EnwuxCIn0p9FkfWST0gNno06amaQ=;
	b=ODGVWrPhBwMPbqT0n48i9td51IgqEIAiB+5frU9luBafGaLa8VPMmXOcF4TATtx3YH0bzt
	ghlP4tJrhhPeHEBA==
From: Nam Cao <namcao@linutronix.de>
To: Mike Rapoport <rppt@kernel.org>, Andreas Dilger <adilger@dilger.ca>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, "ndesaulniers @ google . com"
 <ndesaulniers@google.com>, Luis Chamberlain <mcgrof@kernel.org>, Ingo
 Molnar <mingo@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Tejun Heo <tj@kernel.org>, Krister Johansen <kjlx@templeofstupid.com>,
 Changbin Du <changbin.du@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: Re: [PATCH] init: fix allocated page overlapping with PTR_ERR
Message-ID: <20240418131238.636bee2c@namcao>
In-Reply-To: <20240418102943.180510-1-namcao@linutronix.de>
References: <20240418102943.180510-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_041244_062929_8E390175 
X-CRM114-Status: GOOD (  21.66  )
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

T24gMjAyNC0wNC0xOCBOYW0gQ2FvIHdyb3RlOgo+IFRoZXJlIGlzIG5vdGhpbmcgcHJldmVudGlu
ZyBrZXJuZWwgbWVtb3J5IGFsbG9jYXRvcnMgZnJvbSBhbGxvY2F0aW5nIGEKPiBwYWdlIHRoYXQg
b3ZlcmxhcHMgd2l0aCBQVFJfRVJSKCksIGV4Y2VwdCBmb3IgYXJjaGl0ZWN0dXJlLXNwZWNpZmlj
Cj4gY29kZSB0aGF0IHNldHVwIG1lbWJsb2NrLgo+IAo+IEl0IHdhcyBkaXNjb3ZlcmVkIHRoYXQg
UklTQ1YgYXJjaGl0ZWN0dXJlIGRvZXNuJ3Qgc2V0dXAgbWVtYmxvY2sKPiBjb3JlY3RseSwgbGVh
ZGluZyB0byBhIHBhZ2Ugb3ZlcmxhcHBpbmcgd2l0aCBQVFJfRVJSKCkgYmVpbmcgYWxsb2NhdGVk
LAo+IGFuZCBzdWJzZXF1ZW50bHkgY3Jhc2hpbmcgdGhlIGtlcm5lbCAobGluayBpbiBDbG9zZTog
KQo+IAo+IFRoZSByZXBvcnRlZCBjcmFzaCBoYXMgbm90aGluZyB0byBkbyB3aXRoIFBUUl9FUlIo
KTogdGhlIGxhc3QgcGFnZQo+IChhdCBhZGRyZXNzIDB4ZmZmZmYwMDApIGJlaW5nIGFsbG9jYXRl
ZCBsZWFkcyB0byBhbiB1bmV4cGVjdGVkCj4gYXJpdGhtZXRpYyBvdmVyZmxvdyBpbiBleHQ0OyBi
dXQgc3RpbGwsIHRoaXMgcGFnZSBzaG91bGRuJ3QgYmUKPiBhbGxvY2F0ZWQgaW4gdGhlIGZpcnN0
IHBsYWNlLgo+IAo+IEJlY2F1c2UgUFRSX0VSUigpIGlzIGFuIGFyY2hpdGVjdHVyZS1pbmRlcGVu
ZGVudCB0aGluZywgd2Ugc2hvdWxkbid0Cj4gYXNrIGV2ZXJ5IHNpbmdsZSBhcmNoaXRlY3R1cmUg
dG8gc2V0IHRoaXMgdXAuIFRoZXJlIG1heSBiZSBvdGhlcgo+IGFyY2hpdGVjdHVyZXMgYmVzaWRl
IFJJU0NWIHRoYXQgaGF2ZSB0aGUgc2FtZSBwcm9ibGVtLgo+IAo+IEZpeCB0aGlzIG9uZSBhbmQg
Zm9yIGFsbCBieSByZXNlcnZpbmcgdGhlIHBoeXNpY2FsIG1lbW9yeSBwYWdlIHRoYXQKPiBtYXkg
YmUgbWFwcGVkIHRvIHRoZSBsYXN0IHZpcnR1YWwgbWVtb3J5IHBhZ2UgYXMgcGFydCBvZiBsb3cg
bWVtb3J5Lgo+IAo+IFVuZm9ydHVuYXRlbHksIHRoaXMgbWVhbnMgaWYgdGhlcmUgaXMgYWN0dWFs
IG1lbW9yeSBhdCB0aGlzIHJlc2VydmVkCj4gbG9jYXRpb24sIHRoYXQgbWVtb3J5IHdpbGwgYmVj
b21lIGluYWNjZXNzaWJsZS4gSG93ZXZlciwgaWYgdGhpcyBwYWdlCj4gaXMgbm90IHJlc2VydmVk
LCBpdCBjYW4gb25seSBiZSBhY2Nlc3NlZCBhcyBoaWdoIG1lbW9yeSwgc28gdGhpcwo+IGRvZXNu
J3QgbWF0dGVyIGlmIGhpZ2ggbWVtb3J5IGlzIG5vdCBzdXBwb3J0ZWQuIEV2ZW4gaWYgaGlnaCBt
ZW1vcnkgaXMKPiBzdXBwb3J0ZWQsIGl0IGlzIHN0aWxsIG9ubHkgb25lIHBhZ2UuCj4gCj4gQ2xv
c2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi84NzhyMWlicGRuLmZzZkBh
bGwueW91ci5iYXNlLmFyZS5iZWxvbmcudG8udXMKPiBTaWduZWQtb2ZmLWJ5OiBOYW0gQ2FvIDxu
YW1jYW9AbGludXRyb25peC5kZT4KPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgYWxs
IHZlcnNpb25zCgpTb3JyeSwgZm9yZ290IHRvIGFkZDoKUmVwb3J0ZWQtYnk6IEJqw7ZybiBUw7Zw
ZWwgPGJqb3JuQGtlcm5lbC5vcmc+Cgo+IC0tLQo+ICBpbml0L21haW4uYyB8IDEgKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvaW5pdC9tYWluLmMg
Yi9pbml0L21haW4uYwo+IGluZGV4IDg4MWY2MjMwZWU1OS4uZjhkMjc5M2M0NjQxIDEwMDY0NAo+
IC0tLSBhL2luaXQvbWFpbi5jCj4gKysrIGIvaW5pdC9tYWluLmMKPiBAQCAtOTAwLDYgKzkwMCw3
IEBAIHZvaWQgc3RhcnRfa2VybmVsKHZvaWQpCj4gIAlwYWdlX2FkZHJlc3NfaW5pdCgpOwo+ICAJ
cHJfbm90aWNlKCIlcyIsIGxpbnV4X2Jhbm5lcik7Cj4gIAllYXJseV9zZWN1cml0eV9pbml0KCk7
Cj4gKwltZW1ibG9ja19yZXNlcnZlKF9fcGEoLVBBR0VfU0laRSksIFBBR0VfU0laRSk7IC8qIHJl
c2VydmUgbGFzdCBwYWdlIGZvciBFUlJfUFRSICovCj4gIAlzZXR1cF9hcmNoKCZjb21tYW5kX2xp
bmUpOwo+ICAJc2V0dXBfYm9vdF9jb25maWcoKTsKPiAgCXNldHVwX2NvbW1hbmRfbGluZShjb21t
YW5kX2xpbmUpOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
