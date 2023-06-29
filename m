Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1B4EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 06:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MD4gCY3k45Ok9ARM+ItVDy3ULasPrUwhH73kg3uvBl0=; b=oPD+IOzRAAV5TT
	RstSWQevPRf9T5fobWs29XOKajTut+C+503qrgfYJd4r5sS5rPcEBUSiDZuCjIMD0dPiv5PlvMqtf
	tbh0IwR+a2oruHsPtXSTLXa3M8i/7Zoq+dFBCqBQsfafDU9XQSxv7d6FIdgGD1YIuzgNAw5mrdGoP
	I6R0yu4nD+8m3HCnk57ji8q+tvTgpIMGVOhcuyDEKUVcqkVyhi9/RY8k123uylWIdMrKVnHbiuUK2
	b4hxXf1kgtn3qSunKjfmBL8i+kUQuv/njw+KIrn0eacJC1LKccLjO8bTsEAazTwyB8qLMpz/5tFAo
	jAecn1spBJy5p5rAT6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEklh-0003bj-08;
	Thu, 29 Jun 2023 06:04:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEkle-0003bJ-1N
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 06:04:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B6F32614CB
	for <linux-riscv@lists.infradead.org>; Thu, 29 Jun 2023 06:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BE7C433CD
	for <linux-riscv@lists.infradead.org>; Thu, 29 Jun 2023 06:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688018672;
	bh=eOV+Q/WY6yfuYqDsdD3DSm2Gr6TU+FhiLRbQEJxbTbA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SwU/uUyPUIW6kfkaqop4/5pxz5BiHPJY66C1WzBVdKZ9608lrLpsbKJmwS2St+e2V
	 +TaxSFP4yX7YblbF9TqOo5rDMbKcbxFMfYnND4Cr8HrtvxBGb8tQ3CXYlKibqyTu3X
	 6Gq5uv5XtICsLEfHDF74n03klCe54AHYrgXZQ4NrUHILlVYCTTgDFACxl9DjdPs65z
	 0Fo+J1J1hKswP3PeefIGUbOucJIeZhoPMexUf1Xm6px1a/f8rtN2zXrRXhd2LqQ7TE
	 ukYfZohAojOHCNTQWiWsgs1mlqNKvPe0BrNY+ETkhzFyLPOM5X8IYu0+LNinkPJgEN
	 qXTaiuhFeLf5A==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b5c231f842so4150581fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jun 2023 23:04:32 -0700 (PDT)
X-Gm-Message-State: AC+VfDxocCnypTnrTkOOHh/1z8INO+qpOamzipmqOfGASXLp4bDUiUDq
	q8IGJcYsk2etlo1jxSkadYtfL4Crvto79kGJpas=
X-Google-Smtp-Source: ACHHUZ6F9agCsLWRiS5ccSayUrZfjShbRI2euadQdMpwQyPLhiGDyCV6/0OdIy4dWgLvPmvV7g5Gj98d1xzsY43ZZWk=
X-Received: by 2002:a19:6742:0:b0:4f8:5671:ed1 with SMTP id
 e2-20020a196742000000b004f856710ed1mr21008108lfj.29.1688018670570; Wed, 28
 Jun 2023 23:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230625155416.18629-1-andy.chiu@sifive.com>
In-Reply-To: <20230625155416.18629-1-andy.chiu@sifive.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 29 Jun 2023 02:04:19 -0400
X-Gmail-Original-Message-ID: <CAJF2gTR8NxRBq011e=JeS30ajDzQPLM5RxmX4Xt3_SOCOZ73ag@mail.gmail.com>
Message-ID: <CAJF2gTR8NxRBq011e=JeS30ajDzQPLM5RxmX4Xt3_SOCOZ73ag@mail.gmail.com>
Subject: Re: [PATCH] riscv: vector: only enable interrupts in the first-use trap
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, Jisheng Zhang <jszhang@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Xianting Tian <xianting.tian@linux.alibaba.com>, Mattias Nissler <mnissler@rivosinc.com>, 
	Richard Henderson <richard.henderson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_230434_564328_F6B315ED 
X-CRM114-Status: GOOD (  19.05  )
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

T24gU3VuLCBKdW4gMjUsIDIwMjMgYXQgMTE6NTTigK9BTSBBbmR5IENoaXUgPGFuZHkuY2hpdUBz
aWZpdmUuY29tPiB3cm90ZToKPgo+IFRoZSBmdW5jdGlvbiBpcnFlbnRyeV9leGl0X3RvX3VzZXJf
bW9kZSgpIG11c3QgYmUgY2FsbGVkIHdpdGggaW50ZXJydXB0Cj4gZGlzYWJsZWQuIFRoZSBjYWxs
ZXIgb2YgZG9fdHJhcF9pbnNuX2lsbGVnYWwoKSBhbHNvIGFzc3VtZXMgcnVubmluZwo+IHdpdGhv
dXQgaW50ZXJydXB0cy4gU28sIHdlIHNob3VsZCB0dXJuIG9mZiBpbnRlcnJ1cHRzIGFmdGVyCj4g
cmlzY3Zfdl9maXJzdF91c2VfaGFuZGxlcigpIHJldHVybnMuCj4KPiBGaXhlczogY2QwNTQ4Mzcy
NDNiICgicmlzY3Y6IEFsbG9jYXRlIHVzZXIncyB2ZWN0b3IgY29udGV4dCBpbiB0aGUgZmlyc3Qt
dXNlIHRyYXAiKQo+IFNpZ25lZC1vZmYtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5j
b20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgfCA4ICsrKysrKystCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMu
Ywo+IGluZGV4IDA1ZmZkY2QxNDI0ZS4uMTU5NWUyNDZiZGExIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL3RyYXBzLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4g
QEAgLTE0OSwxMiArMTQ5LDE4IEBAIERPX0VSUk9SX0lORk8oZG9fdHJhcF9pbnNuX2ZhdWx0LAo+
Cj4gIGFzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9pbnNu
X2lsbGVnYWwoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gIHsKPiArICAgICAgIGJvb2wgaGFuZGxl
ZDsKPiArCj4gICAgICAgICBpZiAodXNlcl9tb2RlKHJlZ3MpKSB7Cj4gICAgICAgICAgICAgICAg
IGlycWVudHJ5X2VudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3MpOwo+Cj4gICAgICAgICAgICAgICAg
IGxvY2FsX2lycV9lbmFibGUoKTsKPgo+IC0gICAgICAgICAgICAgICBpZiAoIXJpc2N2X3ZfZmly
c3RfdXNlX2hhbmRsZXIocmVncykpCj4gKyAgICAgICAgICAgICAgIGhhbmRsZWQgPSByaXNjdl92
X2ZpcnN0X3VzZV9oYW5kbGVyKHJlZ3MpOwpIb3cgYWJvdXQgbWFraW5nIHJpc2N2X3ZfZmlyc3Rf
dXNlX2hhbmRsZXIgaXJxX2Rpc2FibGUgc2FmZT8KLS0tLS0tLS0KZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCmluZGV4IDUx
NTg5NjFlYTk3Ny4uNTQ1Mjk1MDQ1NzA1IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90
cmFwcy5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKQEAgLTE1Myw4ICsxNTMsNiBA
QCBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkCmRvX3RyYXBfaW5zbl9p
bGxlZ2FsKHN0cnVjdCBwdF9yZWdzICpyZQogICAgICAgIGlmICh1c2VyX21vZGUocmVncykpIHsK
ICAgICAgICAgICAgICAgIGlycWVudHJ5X2VudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3MpOwoKLSAg
ICAgICAgICAgICAgIGxvY2FsX2lycV9lbmFibGUoKTsKLQogICAgICAgICAgICAgICAgaWYgKCFy
aXNjdl92X2ZpcnN0X3VzZV9oYW5kbGVyKHJlZ3MpKQogICAgICAgICAgICAgICAgICAgICAgICBk
b190cmFwX2Vycm9yKHJlZ3MsIFNJR0lMTCwgSUxMX0lMTE9QQywgcmVncy0+ZXBjLAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJPb3BzIC0gaWxsZWdhbCBpbnN0cnVjdGlv
biIpOwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC92ZWN0b3IuYwppbmRleCBmOWM4ZTE5YWIzMDEuLjc2MTZjMDI3ZWU2NCAxMDA2NDQK
LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
dmVjdG9yLmMKQEAgLTg0LDcgKzg0LDcgQEAgc3RhdGljIGludCByaXNjdl92X3RocmVhZF96YWxs
b2Modm9pZCkKIHsKICAgICAgICB2b2lkICpkYXRhcDsKCi0gICAgICAgZGF0YXAgPSBremFsbG9j
KHJpc2N2X3ZfdnNpemUsIEdGUF9LRVJORUwpOworICAgICAgIGRhdGFwID0ga3phbGxvYyhyaXNj
dl92X3ZzaXplLCBHRlBfS0VSTkVMIHwgR0ZQX0FUT01JQyk7CiAgICAgICAgaWYgKCFkYXRhcCkK
ICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwotLS0tLS0tLS0KCj4gKwo+ICsgICAgICAg
ICAgICAgICBsb2NhbF9pcnFfZGlzYWJsZSgpOwo+ICsKPiArICAgICAgICAgICAgICAgaWYgKCFo
YW5kbGVkKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGRvX3RyYXBfZXJyb3IocmVncywgU0lH
SUxMLCBJTExfSUxMT1BDLCByZWdzLT5lcGMsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAiT29wcyAtIGlsbGVnYWwgaW5zdHJ1Y3Rpb24iKTsKPgo+IC0tCj4gMi4xNy4x
Cj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
