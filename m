Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866ABE7717F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 01:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lWBEFp7JTv9135ZXAD+liELOD9vEAWAb5n0oGBqV9nU=; b=gYfACVrwPWIu9Q
	n5m9Y+M0KqVziScMQdiiWl1JIBe4a4vSuqJbGgse4pkKXWxCzIdfEQ+I2qoBzzKCYxUv/p2WNpBPg
	AjAb5M+kCPHkDf3M3yFILUOx1kCWzouYA4Oa86BghL3xUlDpkBKobqqMNpRu75YuFAp9sLwo+Hwn+
	TtADNGGj9E9uPrgbpLlyZqp+xhm2e/3JzhUP4fIhKkWvwz+Ghe4U0iH6BOU3W+fyvsYQYIsZgZyk4
	7aplz7GWI2lVkZkjhjTFK/2+yW856HoHaXu/tr84cl9Upz5JHqNL6Dj0BcFkk5c0yURJOu3KnAWlJ
	eulRW52krwDLUEefEwDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNMIM-0000000BrJW-40vB;
	Tue, 17 Dec 2024 01:22:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNMIK-0000000BrIx-10Rs
	for linux-riscv@lists.infradead.org;
	Tue, 17 Dec 2024 01:22:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E8FF95C6359
	for <linux-riscv@lists.infradead.org>; Tue, 17 Dec 2024 01:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333E3C4CEE7
	for <linux-riscv@lists.infradead.org>; Tue, 17 Dec 2024 01:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734398558;
	bh=ztbDHdD003AOFmkjJ9AhaS5FsmU905bwNd9pOiS40QQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bQXnJFijtV5PYaCHuXV+fDuIxmLKmMaASLcShIDiz9au4NTHOgSCymUL1zC7V8OnP
	 qu+r3Jw+SlabWIdGRWMVSfJDCFn5coaS9H7vWFtEXZ+r8AX9hQlzoY4MUq0+7qyPiY
	 0fdiyrCcTQjooc0cAP1DToOXzWMo7kPUwzvdeeYri/IDHyd5WcIkX+QK4EdSqNzOJg
	 laZ1OqAbc3g/HHWTvePXK4G346BIK4lfa7EyUxQwdFRXAWx9EjWe/AlRoFriTiMBoz
	 EyowMJjlslrOceGMFSc3lE41CQMolxPgh75D5Qf+2stdpWY0updL/nf8q+SGUCPK/A
	 qhFT4m4Sm+v7w==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d647d5df91so6654267a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Dec 2024 17:22:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWzOZ7C3MlFMZtlLs9zc4tJkgGq6iV5TQFPM2C/ShcWSKgQ4M+VxJXaEyKMJ7cxuu3EarCRDrZ9drbw/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YytYH93dRPHgymPkgUrJFyIFRKqFe8EGhZyoVNQuofn9hx8QVa+
	hiUsQee0U6jnuN5QIK1BR8Vxv+8aSomUGxHpcBd5soedQLoebb4IPWcPgbfMBgpCsXCErILOy28
	n/Y/1n+BXrDKWLZuRByT2gUdSgE8=
X-Google-Smtp-Source: AGHT+IGp8AFySWj1OjXr6Yj19dq7LENEnmWaczQRT6IvNs2FTaqIFLXG8Tco51vkdEVUnOPFQLjGN9K3Olb69FIPR8g=
X-Received: by 2002:a05:6402:518f:b0:5d2:729f:995b with SMTP id
 4fb4d7f45d1cf-5d63c3ad372mr13239770a12.24.1734398556585; Mon, 16 Dec 2024
 17:22:36 -0800 (PST)
MIME-Version: 1.0
References: <20241216032253.685728-1-guoren@kernel.org> <20241216-2d9b35cb1911106971a54356@orel>
In-Reply-To: <20241216-2d9b35cb1911106971a54356@orel>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 17 Dec 2024 09:22:25 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRGJAKepU1HCaG-aw5WqJdyGftTox-Q+LyOrHPbxxn_nA@mail.gmail.com>
Message-ID: <CAJF2gTRGJAKepU1HCaG-aw5WqJdyGftTox-Q+LyOrHPbxxn_nA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Implement smp_cond_load8/16() with Zawrs
To: Andrew Jones <ajones@ventanamicro.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, bjorn@rivosinc.com, 
	conor@kernel.org, leobras@redhat.com, alexghiti@rivosinc.com, 
	christoph.muellner@vrull.eu, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, parri.andrea@gmail.com, ericchancf@google.com, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_172240_370516_CE10CD1F 
X-CRM114-Status: GOOD (  19.44  )
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

T24gTW9uLCBEZWMgMTYsIDIwMjQgYXQgMTE6NDLigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFN1biwgRGVjIDE1LCAyMDI0IGF0IDEwOjIy
OjUzUE0gLTA1MDAsIGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+ID4gRnJvbTogR3VvIFJlbiA8
Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4KPiA+IFJJU0MtViBjb2RlIHVzZXMgdGhlIHF1
ZXVlZCBzcGlubG9jayBpbXBsZW1lbnRhdGlvbiwgd2hpY2ggY2FsbHMKPiA+IHRoZSBtYWNyb3Mg
c21wX2NvbmRfbG9hZF9hY3F1aXJlIGZvciBvbmUgYnl0ZS4gU28sIGNvbXBsZW1lbnQgdGhlCj4g
PiBpbXBsZW1lbnRhdGlvbiBvZiBieXRlIGFuZCBoYWxmd29yZCB2ZXJzaW9ucy4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oIHwgMzggKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hn
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NtcHhjaGcuaAo+ID4gaW5kZXggNGNhZGM1NjIy
MGZlLi4yYmQ0MmExMWZmOGYgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2NtcHhjaGcuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hnLmgKPiA+
IEBAIC0zNjUsMTYgKzM2NSw0OCBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgX19jbXB3
YWl0KHZvbGF0aWxlIHZvaWQgKnB0ciwKPiA+ICB7Cj4gPiAgICAgICB1bnNpZ25lZCBsb25nIHRt
cDsKPiA+Cj4gPiArICAgICB1MzIgKl9fcHRyMzJiOwo+ID4gKyAgICAgdWxvbmcgX19zLCBfX3Zh
bCwgX19tYXNrOwo+ID4gKwo+ID4gICAgICAgYXNtIGdvdG8oQUxURVJOQVRJVkUoImogJWxbbm9f
emF3cnNdIiwgIm5vcCIsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAwLCBSSVNDVl9J
U0FfRVhUX1pBV1JTLCAxKQo+ID4gICAgICAgICAgICAgICAgOiA6IDogOiBub196YXdycyk7Cj4g
Pgo+ID4gICAgICAgc3dpdGNoIChzaXplKSB7Cj4gPiAgICAgICBjYXNlIDE6Cj4gPiAtICAgICAg
ICAgICAgIGZhbGx0aHJvdWdoOwo+ID4gKyAgICAgICAgICAgICBfX3B0cjMyYiA9ICh1MzIgKiko
KHVsb25nKShwdHIpICYgfjB4Myk7Cj4gPiArICAgICAgICAgICAgIF9fcyA9ICgodWxvbmcpKHB0
cikgJiAweDMpICogQklUU19QRVJfQllURTsKPiA+ICsgICAgICAgICAgICAgX192YWwgPSB2YWwg
PDwgX19zOwo+ID4gKyAgICAgICAgICAgICBfX21hc2sgPSAweGYgPDwgX19zOwo+Cj4gVGhpcyBt
YXNrIHNob3VsZCBiZSAweGZmIGFuZCB0aGUgbWFzayBiZWxvdyBzaG91bGQgYmUgMHhmZmZmLgpU
aHggZm9yIGNhdGNoaW5nIGl0OyBpdCdzIGhhcmQgdG8gdGVzdCBpdCBvdXQuIEkgd2lsbCBjb3Jy
ZWN0IGl0IGluCnRoZSBuZXh0IHZlcnNpb24uCgo+Cj4gPiArCj4gPiArICAgICAgICAgICAgIGFz
bSB2b2xhdGlsZSgKPiA+ICsgICAgICAgICAgICAgIiAgICAgICBsci53ICAgICUwLCAlMVxuIgo+
ID4gKyAgICAgICAgICAgICAiICAgICAgIGFuZCAgICAgJTAsICUwLCAlM1xuIgo+ID4gKyAgICAg
ICAgICAgICAiICAgICAgIHhvciAgICAgJTAsICUwLCAlMlxuIgo+ID4gKyAgICAgICAgICAgICAi
ICAgICAgIGJuZXogICAgJTAsIDFmXG4iCj4gPiArICAgICAgICAgICAgICAgICAgICAgWkFXUlNf
V1JTX05UTyAiXG4iCj4gPiArICAgICAgICAgICAgICIxOiIKPiA+ICsgICAgICAgICAgICAgOiAi
PSZyIiAodG1wKSwgIitBIiAoKihfX3B0cjMyYikpCj4gPiArICAgICAgICAgICAgIDogInIiIChf
X3ZhbCksICJyIiAoX19tYXNrKQo+ID4gKyAgICAgICAgICAgICA6ICJtZW1vcnkiKTsKPiA+ICsg
ICAgICAgICAgICAgYnJlYWs7Cj4gPiAgICAgICBjYXNlIDI6Cj4gPiAtICAgICAgICAgICAgIC8q
IFJJU0MtViBkb2Vzbid0IGhhdmUgbHIgaW5zdHJ1Y3Rpb25zIG9uIGJ5dGUgYW5kIGhhbGYtd29y
ZC4gKi8KPiA+IC0gICAgICAgICAgICAgZ290byBub196YXdyczsKPiA+ICsgICAgICAgICAgICAg
X19wdHIzMmIgPSAodTMyICopKCh1bG9uZykocHRyKSAmIH4weDMpOwo+ID4gKyAgICAgICAgICAg
ICBfX3MgPSAoKHVsb25nKShwdHIpICYgMHgyKSAqIEJJVFNfUEVSX0JZVEU7Cj4gPiArICAgICAg
ICAgICAgIF9fdmFsID0gdmFsIDw8IF9fczsKPiA+ICsgICAgICAgICAgICAgX19tYXNrID0gMHhm
ZiA8PCBfX3M7Cj4gPiArCj4gPiArICAgICAgICAgICAgIGFzbSB2b2xhdGlsZSgKPiA+ICsgICAg
ICAgICAgICAgIiAgICAgICBsci53ICAgICUwLCAlMVxuIgo+ID4gKyAgICAgICAgICAgICAiICAg
ICAgIGFuZCAgICAgJTAsICUwLCAlM1xuIgo+ID4gKyAgICAgICAgICAgICAiICAgICAgIHhvciAg
ICAgJTAsICUwLCAlMlxuIgo+ID4gKyAgICAgICAgICAgICAiICAgICAgIGJuZXogICAgJTAsIDFm
XG4iCj4gPiArICAgICAgICAgICAgICAgICAgICAgWkFXUlNfV1JTX05UTyAiXG4iCj4gPiArICAg
ICAgICAgICAgICIxOiIKPiA+ICsgICAgICAgICAgICAgOiAiPSZyIiAodG1wKSwgIitBIiAoKihf
X3B0cjMyYikpCj4gPiArICAgICAgICAgICAgIDogInIiIChfX3ZhbCksICJyIiAoX19tYXNrKQo+
ID4gKyAgICAgICAgICAgICA6ICJtZW1vcnkiKTsKPiA+ICsgICAgICAgICAgICAgYnJlYWs7Cj4g
PiAgICAgICBjYXNlIDQ6Cj4gPiAgICAgICAgICAgICAgIGFzbSB2b2xhdGlsZSgKPiA+ICAgICAg
ICAgICAgICAgIiAgICAgICBsci53ICAgICUwLCAlMVxuIgo+ID4gLS0KPiA+IDIuNDAuMQo+ID4K
Pgo+IFRoYW5rcywKPiBkcmV3CgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
