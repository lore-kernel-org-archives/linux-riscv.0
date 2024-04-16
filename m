Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A738FC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 16:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oNMQSZ9Te/j5GQlI96GmVbYrtjv/olqHDqyY2maJlzo=; b=2YFoxMx5okdpUJ
	SV/Oz4FKXXMVldD2wGILN+/AANlErnzdKJ/ukSedAP2tquVuzZ94YWi+tdaRMtOctKVZEBvv0PySJ
	V28t7CUIApRyexgghmQUKdFwBYj4wlbR+PvhNMd2aeNvA3xJ1IcZfBwp1p5dS0me0DiUVVJ+qw44l
	XeeuAhfEDSs26WuQpRpTHniAMMXiCLMzAZARi7U7Va2G1ln2z2JEbUv6NqbqNePwinlMlAbRXdnhO
	Pa86PpVNbST3LvaRO5IIG1iTw7XwdcboVDIje2I9+a8K+2w4I1uwnvbJ8bOF3fb2/iL/POnH+00OC
	LX/xmAekCGRzCWPpmSDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwlXI-0000000CzNZ-1cqR;
	Tue, 16 Apr 2024 16:19:56 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwlXD-0000000CzKs-1OSU
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 16:19:54 +0000
Date: Tue, 16 Apr 2024 18:19:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1713284387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A23kAXEf9C2KhbYlAYQaiPt99jI8MlAVS/+Sw78HXwk=;
	b=kJN1kvZz5VI9X1N44mbAnqG+ChDEeeB8pSyDOQ6ehcAFkalZx0dHpMGO5OuOv4Vvth9DDO
	YIkd6myOE8E0VxNvTutlXGo5yVZnBn28av6knai5Q+ZnF2v9MsZfsuA/rD3M4vXJerWTMn
	buMdeVp9l2uCQJqtF7+Dc9cVFTOHT5/p70lcg/xocSDSggwmX1S8stgD+E0MS0UoWlYVTa
	5sq9E/LJ3rJMdxGXiG1eM9zOh0fpzg2XksNuZpcAFEX395HLswMEPpw5zgh1Bn+sy1dbVI
	NkPlvnarvQEiu0kNzsLznOIC91t1qIAQFcyVZnByx78jzgBPTBMt4g5fE8C5Hg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1713284387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A23kAXEf9C2KhbYlAYQaiPt99jI8MlAVS/+Sw78HXwk=;
	b=4XT0Vx5xO8W/erNB63yAHRYfUcl16Pw8c0TDGAchcUnv7GWfAGkXmMBdMT37fDCP2dMi8A
	vE2JarnSJaBlAQDg==
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
Message-ID: <20240416181944.23af44ee@namcao>
In-Reply-To: <87v84h2tee.fsf@all.your.base.are.belong.to.us>
References: <20240416-deppen-gasleitung-8098fcfd6bbd@brauner>
	<8734rlo9j7.fsf@all.your.base.are.belong.to.us>
	<Zh6KNglOu8mpTPHE@kernel.org>
	<20240416171713.7d76fe7d@namcao>
	<20240416173030.257f0807@namcao>
	<87v84h2tee.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_091951_557651_26B4D462 
X-CRM114-Status: GOOD (  15.76  )
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
dHJvbml4LmRlPiB3cml0ZXM6Cj4gCj4gPiBGaXhlZCB2ZXJzaW9uOgo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPiBpbmRl
eCBmYTM0Y2Y1NTAzN2IuLmFmNDE5MmJjNTFkMCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yv
bW0vaW5pdC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ID4gQEAgLTI0NSw2ICsy
NDUsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfYm9vdG1lbSh2b2lkKQo+ID4gIAkgKiBi
ZSBkb25lIGFzIHNvb24gYXMgdGhlIGtlcm5lbCBtYXBwaW5nIGJhc2UgYWRkcmVzcyBpcyBkZXRl
cm1pbmVkLgo+ID4gIAkgKi8KPiA+ICAJaWYgKCFJU19FTkFCTEVEKENPTkZJR182NEJJVCkpIHsK
PiA+ICsJCW1lbWJsb2NrX3Jlc2VydmUoX19wYSgtUEFHRV9TSVpFKSwgUEFHRV9TSVpFKTsKPiA+
ICAJCW1heF9tYXBwZWRfYWRkciA9IF9fcGEofih1bG9uZykwKTsKPiA+ICAJCWlmIChtYXhfbWFw
cGVkX2FkZHIgPT0gKHBoeXNfcmFtX2VuZCAtIDEpKQo+ID4gIAkJCW1lbWJsb2NrX3NldF9jdXJy
ZW50X2xpbWl0KG1heF9tYXBwZWRfYWRkciAtIDQwOTYpOyAgCj4gCj4gTmljZSEKPiAKPiBDYW4n
dCB3ZSBnZXQgcmlkIG9mIHRoZSBpZi1zdGF0ZW1lbnQsIGFuZCBtYXhfbWFwcGVkX2FkZHJlc3Mg
YXMgd2VsbD8KCkkgZG9uJ3Qgc2VlIHdoeSBub3QgOkQKCkJlc3QgcmVnYXJkcywKTmFtCgpkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwppbmRl
eCBmYTM0Y2Y1NTAzN2IuLmY2MDBjZmVlMGFlZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9tbS9p
bml0LmMKKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKQEAgLTE5Nyw3ICsxOTcsNiBAQCBlYXJs
eV9wYXJhbSgibWVtIiwgZWFybHlfbWVtKTsKIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9ib290
bWVtKHZvaWQpCiB7CiAJcGh5c19hZGRyX3Qgdm1saW51eF9lbmQgPSBfX3BhX3N5bWJvbCgmX2Vu
ZCk7Ci0JcGh5c19hZGRyX3QgbWF4X21hcHBlZF9hZGRyOwogCXBoeXNfYWRkcl90IHBoeXNfcmFt
X2VuZCwgdm1saW51eF9zdGFydDsKIAogCWlmIChJU19FTkFCTEVEKENPTkZJR19YSVBfS0VSTkVM
KSkKQEAgLTIzOCwxNyArMjM3LDkgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX2Jvb3RtZW0o
dm9pZCkKIAkvKgogCSAqIG1lbWJsb2NrIGFsbG9jYXRvciBpcyBub3QgYXdhcmUgb2YgdGhlIGZh
Y3QgdGhhdCBsYXN0IDRLIGJ5dGVzIG9mCiAJICogdGhlIGFkZHJlc3NhYmxlIG1lbW9yeSBjYW4g
bm90IGJlIG1hcHBlZCBiZWNhdXNlIG9mIElTX0VSUl9WQUxVRQotCSAqIG1hY3JvLiBNYWtlIHN1
cmUgdGhhdCBsYXN0IDRrIGJ5dGVzIGFyZSBub3QgdXNhYmxlIGJ5IG1lbWJsb2NrCi0JICogaWYg
ZW5kIG9mIGRyYW0gaXMgZXF1YWwgdG8gbWF4aW11bSBhZGRyZXNzYWJsZSBtZW1vcnkuICBGb3Ig
NjQtYml0Ci0JICoga2VybmVsLCB0aGlzIHByb2JsZW0gY2FuJ3QgaGFwcGVuIGhlcmUgYXMgdGhl
IGVuZCBvZiB0aGUgdmlydHVhbAotCSAqIGFkZHJlc3Mgc3BhY2UgaXMgb2NjdXBpZWQgYnkgdGhl
IGtlcm5lbCBtYXBwaW5nIHRoZW4gdGhpcyBjaGVjayBtdXN0Ci0JICogYmUgZG9uZSBhcyBzb29u
IGFzIHRoZSBrZXJuZWwgbWFwcGluZyBiYXNlIGFkZHJlc3MgaXMgZGV0ZXJtaW5lZC4KKwkgKiBt
YWNyby4gTWFrZSBzdXJlIHRoYXQgbGFzdCA0ayBieXRlcyBhcmUgbm90IHVzYWJsZSBieSBtZW1i
bG9jay4KIAkgKi8KLQlpZiAoIUlTX0VOQUJMRUQoQ09ORklHXzY0QklUKSkgewotCQltYXhfbWFw
cGVkX2FkZHIgPSBfX3BhKH4odWxvbmcpMCk7Ci0JCWlmIChtYXhfbWFwcGVkX2FkZHIgPT0gKHBo
eXNfcmFtX2VuZCAtIDEpKQotCQkJbWVtYmxvY2tfc2V0X2N1cnJlbnRfbGltaXQobWF4X21hcHBl
ZF9hZGRyIC0gNDA5Nik7Ci0JfQorCW1lbWJsb2NrX3Jlc2VydmUoX19wYSgtUEFHRV9TSVpFKSwg
UEFHRV9TSVpFKTsKIAogCW1pbl9sb3dfcGZuID0gUEZOX1VQKHBoeXNfcmFtX2Jhc2UpOwogCW1h
eF9sb3dfcGZuID0gbWF4X3BmbiA9IFBGTl9ET1dOKHBoeXNfcmFtX2VuZCk7CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
