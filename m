Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DBFE7717B
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 08:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Cue4UubZJvcTbJTG2wiAaBnK3orwMhsrz8U38DPWHs=; b=Oax9xsEQ28L4Iw
	ZuYcARN6sTvDD36831A5uYfVFsGYB0HPdmAzVX7QiQD72Vmk/JOhwGJU+Uq6D8krETjzz77thMTyb
	KM9tKTAszpNBSMp6Tf+tq5oNJnVv6V4OfY8PXNL7/8g8wV7vJo+iag2QIVFXU7YwFZRb8mC6dqjdu
	rne5tGYZy4rprQM5Fw1uSelpVwKTtH5Epub0Rq2BaD+EovTTffrZkIDk/+12oBVH4TiUSpKlCGnnL
	9XkZYKAnGVUNsB1scHfyfgClQQ8R7xP512iDYoZZ6qwThgeQEMPvRNUwOuzTurp0wwBG7DvzN1lxM
	fs01XdR1XDPtEPAS48HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJTr1-00000000x54-45c6;
	Fri, 06 Dec 2024 08:38:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJTpB-00000000wiY-1ftX
	for linux-riscv@lists.infradead.org;
	Fri, 06 Dec 2024 08:36:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB4425C0F8E;
	Fri,  6 Dec 2024 08:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0347C4CED1;
	Fri,  6 Dec 2024 08:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733474192;
	bh=+KXs+jrzymKwQ80DAWh/thnKmWYFHshDzqjuxXcUoIg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dOLJOLITBkfKRvXZE25SpX29N30hgJy8M/vDFfNaPgDSdXwedOYtR/tmYFtOQydX7
	 WjtK0NySpsfaglCWMi94lKtG7nYF7KmxwksLuK5krQXRHJ2xoXniBDOLQzA/GetTTm
	 5sW4aFWFPfyC6swCyZdKg+/IaFfBsZiyUPOyulAzPv0W2xivHhoJmjEDYMEKkU6WLn
	 CQ3TBf6mp8QVkjnm18P3S96e2X8DbVeQwjIsESlpI8BUzC0fFrOjb/grU2bIjCb7JO
	 Son9JFmWwCwyJPUsHptMxxbj4EWGWIHpmdgrksx2loWRglM9tkbfjhz/QwtT1wnmko
	 lqjStT5lfgeCA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: Remove Albert Ou from riscv
In-Reply-To: <a3e117ce-abe3-4bd9-aef5-90bbe173828d@ghiti.fr>
References: <20241205-remove_albert-v1-1-17eb850f1540@rivosinc.com>
 <a3e117ce-abe3-4bd9-aef5-90bbe173828d@ghiti.fr>
Date: Fri, 06 Dec 2024 09:36:29 +0100
Message-ID: <87ed2lgqcy.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_003633_478626_E92B7B27 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cml0ZXM6Cgo+IEhpIENoYXJsaWUsCj4K
PiBPbiAwNS8xMi8yMDI0IDIzOjQ2LCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4+IEFsYmVydCBp
cyBub3QgYW4gYWN0aXZlIG1haW50YWluZXIgYW5kIGhpcyBpbmJveCByZWplY3RzIGFsbCBlbWFp
bHMuCj4+IFJlbW92ZSBoaW0gZnJvbSB0aGUgbWFpbnRhaW5lcidzIGxpc3QgdG8gcHV0IGFuIGVu
ZCB0byBldmVyeWJvZHkgd2hvCj4+IGludGVyYWN0cyB3aXRoIHRoZSByaXNjdiBsaW51eCBtYWls
aW5nIGxpc3QgZnJvbSBnZXR0aW5nIHNwYW1tZWQgd2l0aAo+PiByZWplY3Rpb24gZW1haWxzLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29t
Pgo+PiAtLS0KPj4gICBNQUlOVEFJTkVSUyB8IDEgLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRl
bGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4+
IGluZGV4IDFlOTMwYzdhNThiMS4uOGE1ZTEyMzU1ODUwIDEwMDY0NAo+PiAtLS0gYS9NQUlOVEFJ
TkVSUwo+PiArKysgYi9NQUlOVEFJTkVSUwo+PiBAQCAtMjAxMDQsNyArMjAxMDQsNiBAQCBGOglp
bmNsdWRlL2xpbnV4L2lycWNoaXAvcmlzY3YtaW1zaWMuaAo+PiAgIFJJU0MtViBBUkNISVRFQ1RV
UkUKPj4gICBNOglQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+Cj4+ICAg
TToJUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KPj4gLU06CUFsYmVydCBPdSA8
YW91QGVlY3MuYmVya2VsZXkuZWR1Pgo+PiAgIEw6CWxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKPj4gICBTOglTdXBwb3J0ZWQKPj4gICBROglodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3Byb2plY3QvbGludXgtcmlzY3YvbGlzdC8KPj4KPj4gLS0tCj4+IGJhc2UtY29tbWl0OiA0
MDM4NGM4NDBlYTE5NDRkN2M1YTM5MmU4OTc1ZWQwODhlY2YwYjM3Cj4+IGNoYW5nZS1pZDogMjAy
NDEyMDUtcmVtb3ZlX2FsYmVydC1iNTBjOTVlMTkzMDYKPgo+Cj4gSSB0b3RhbGx5IGFncmVlIQo+
Cj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4K
CisxIQoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
