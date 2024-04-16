Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD62C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 18:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6FT/QP4xEcbNwxTg6fu1JyHt7bQNosrJF8i2Jmfmrew=; b=VQ8qR57ZxqekLg
	3Z02psyeRL4eUd0CWC+8RdnMbjUSPmkKS7ZwmgbFWkSwWEwTe5C9wEJEuR11Oy8BY+3Cg5szfN70/
	r2YHN4O/f3TPVi+KeEmY6+BUZtiiOHx35KfX39YXDXF4CKQY0UxXxfvVJeim/Hu/Ss/ZxGLtjcYRT
	SYT4inXaroialhPMhvhYpXHk7dGVdrYt1Mx5W4iopLAFG31sO9RT6jC5m45QePJAX2ivv12Unl5i0
	WdypLPMbIqc3qtnowH7NvKe7iPckKz3SxXkefEtSapGodORGN0QiHp1kbT2/eij9qDQm13ok5gIct
	J9cwBZklT7AE9qTWs9qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnFF-0000000DGcH-31oF;
	Tue, 16 Apr 2024 18:09:26 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnF8-0000000DGaG-2WLb
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 18:09:24 +0000
Date: Tue, 16 Apr 2024 20:09:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1713290953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SKLrAI5OCUe/r2J49t7qM8eP1fCwVfsTtu23X+cbhBw=;
	b=GMhnFAjb5aq0fLq1hjaVwDC+5vKgO0aCNwGaU5Cg54Dwdl9OeS42slUU0vCDSUpV6s95+f
	So/JFdqMFwQ0NhjaqOe7zQ6d/VA+QxIwi1ucEUpCvWu3Z99MtkGTlNIi+1NEvgulAc7YK4
	mGvSc0PTS7Km/W9dDgIwMo0psk4jzZkt8Hjk2JQlw+oovvt5+rRdK1El/jdfj0lNyKmJM8
	K3c5LmVS0QcaJ04UQk8GV7B8uhyW95BRdfrKnE8JKF2ILPHxVKa8r24H2DSgA65SfvSj8e
	eEa7YmcRxOk5ZCcqgm4uc/7pdnlChnyC0eyqwezB7TpQ98nV0HvVanFPYH5acA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1713290953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SKLrAI5OCUe/r2J49t7qM8eP1fCwVfsTtu23X+cbhBw=;
	b=ixQmOQ/Z45c/M1fP70O0/XH6yLZ1zVX1OS5AAh3Zp3iBkAq1q4nMCxItjJ18ha6HRKoS0G
	uM/NfWOUolPOHiBA==
From: Nam Cao <namcao@linutronix.de>
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Andreas Dilger <adilger@dilger.ca>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Theodore Ts'o <tytso@mit.edu>, Ext4
 Developers List <linux-ext4@vger.kernel.org>, Conor Dooley
 <conor@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Anders
 Roxell <anders.roxell@linaro.org>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
Message-ID: <20240416200910.294ea07b@namcao>
In-Reply-To: <875xwhuqrx.fsf@all.your.base.are.belong.to.us>
References: <20240416-deppen-gasleitung-8098fcfd6bbd@brauner>
	<8734rlo9j7.fsf@all.your.base.are.belong.to.us>
	<Zh6KNglOu8mpTPHE@kernel.org>
	<20240416171713.7d76fe7d@namcao>
	<20240416173030.257f0807@namcao>
	<87v84h2tee.fsf@all.your.base.are.belong.to.us>
	<20240416181944.23af44ee@namcao>
	<875xwhuqrx.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_110919_289989_8121A700 
X-CRM114-Status: GOOD (  17.28  )
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

T24gMjAyNC0wNC0xNiBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IE5hbSBDYW8gPG5hbWNhb0BsaW51
dHJvbml4LmRlPiB3cml0ZXM6Cj4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0
LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ID4gaW5kZXggZmEzNGNmNTUwMzdiLi5mNjAwY2Zl
ZTBhZWYgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ID4gKysrIGIvYXJj
aC9yaXNjdi9tbS9pbml0LmMKPiA+IEBAIC0xOTcsNyArMTk3LDYgQEAgZWFybHlfcGFyYW0oIm1l
bSIsIGVhcmx5X21lbSk7Cj4gPiAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX2Jvb3RtZW0odm9p
ZCkKPiA+ICB7Cj4gPiAgCXBoeXNfYWRkcl90IHZtbGludXhfZW5kID0gX19wYV9zeW1ib2woJl9l
bmQpOwo+ID4gLQlwaHlzX2FkZHJfdCBtYXhfbWFwcGVkX2FkZHI7Cj4gPiAgCXBoeXNfYWRkcl90
IHBoeXNfcmFtX2VuZCwgdm1saW51eF9zdGFydDsKPiA+ICAKPiA+ICAJaWYgKElTX0VOQUJMRUQo
Q09ORklHX1hJUF9LRVJORUwpKQo+ID4gQEAgLTIzOCwxNyArMjM3LDkgQEAgc3RhdGljIHZvaWQg
X19pbml0IHNldHVwX2Jvb3RtZW0odm9pZCkKPiA+ICAJLyoKPiA+ICAJICogbWVtYmxvY2sgYWxs
b2NhdG9yIGlzIG5vdCBhd2FyZSBvZiB0aGUgZmFjdCB0aGF0IGxhc3QgNEsgYnl0ZXMgb2YKPiA+
ICAJICogdGhlIGFkZHJlc3NhYmxlIG1lbW9yeSBjYW4gbm90IGJlIG1hcHBlZCBiZWNhdXNlIG9m
IElTX0VSUl9WQUxVRQo+ID4gLQkgKiBtYWNyby4gTWFrZSBzdXJlIHRoYXQgbGFzdCA0ayBieXRl
cyBhcmUgbm90IHVzYWJsZSBieSBtZW1ibG9jawo+ID4gLQkgKiBpZiBlbmQgb2YgZHJhbSBpcyBl
cXVhbCB0byBtYXhpbXVtIGFkZHJlc3NhYmxlIG1lbW9yeS4gIEZvciA2NC1iaXQKPiA+IC0JICog
a2VybmVsLCB0aGlzIHByb2JsZW0gY2FuJ3QgaGFwcGVuIGhlcmUgYXMgdGhlIGVuZCBvZiB0aGUg
dmlydHVhbAo+ID4gLQkgKiBhZGRyZXNzIHNwYWNlIGlzIG9jY3VwaWVkIGJ5IHRoZSBrZXJuZWwg
bWFwcGluZyB0aGVuIHRoaXMgY2hlY2sgbXVzdAo+ID4gLQkgKiBiZSBkb25lIGFzIHNvb24gYXMg
dGhlIGtlcm5lbCBtYXBwaW5nIGJhc2UgYWRkcmVzcyBpcyBkZXRlcm1pbmVkLgo+ID4gKwkgKiBt
YWNyby4gTWFrZSBzdXJlIHRoYXQgbGFzdCA0ayBieXRlcyBhcmUgbm90IHVzYWJsZSBieSBtZW1i
bG9jay4KPiA+ICAJICovCj4gPiAtCWlmICghSVNfRU5BQkxFRChDT05GSUdfNjRCSVQpKSB7Cj4g
PiAtCQltYXhfbWFwcGVkX2FkZHIgPSBfX3BhKH4odWxvbmcpMCk7Cj4gPiAtCQlpZiAobWF4X21h
cHBlZF9hZGRyID09IChwaHlzX3JhbV9lbmQgLSAxKSkKPiA+IC0JCQltZW1ibG9ja19zZXRfY3Vy
cmVudF9saW1pdChtYXhfbWFwcGVkX2FkZHIgLSA0MDk2KTsKPiA+IC0JfQo+ID4gKwltZW1ibG9j
a19yZXNlcnZlKF9fcGEoLVBBR0VfU0laRSksIFBBR0VfU0laRSk7Cj4gPiAgCj4gPiAgCW1pbl9s
b3dfcGZuID0gUEZOX1VQKHBoeXNfcmFtX2Jhc2UpOwo+ID4gIAltYXhfbG93X3BmbiA9IG1heF9w
Zm4gPSBQRk5fRE9XTihwaHlzX3JhbV9lbmQpOyAgCj4gCj4gTmljZSEgV291bGQgeW91IG1pbmQg
c3VibWl0dGluZyB0aGlzIGFzIGEgcHJvcGVyIGZpeCAodW5sZXNzIHRoZXJlJ3MgYQo+IHdheSB0
byBkbyBpdCBub24tYXJjaCBzcGVjaWZpYyBsaWtlIE1hdHRoZXcgcG9pbnRlZCBvdXQpLgoKSSBk
b24ndCBtaW5kLCBidXQgSSBhbSB3YWl0aW5nIGZvciB0aGUgZGlzY3Vzc2lvbiBvbiB0aGUgbm9u
LWFyY2ggc29sdXRpb24uCgpCZXN0IHJlZ2FyZHMsCk5hbQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
