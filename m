Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39965C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 06:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R0c1jteWRBXh1ee6THajBnieZE8XRaD3eaw3maPGRGU=; b=g8dJMjFQCy4wiQ
	OXBxDCLP22PoIl1IJJWwT8+NegzO7byJiR6KGI+Q+E9c2UoWvN2bxSJ/hpmLwJmpI27AEyyYswprt
	0U2Jf4QVSwAlwA2JCTaC1OVozCEo+JIsyneTaElImM9LOJDA3tOXBBxIQxnPLq4c/0sHGHU/Akkxc
	L01JF1InS4cMMMCOa31mb7GmOn2WQPzSh3J+6RFxP2sd2axh+kBCX97S/lSAJyHt/cQyAvW/+8q1n
	sMs6o8QQeEVUBKNMjqlSQnahBpP5ZaJBdGfAo0VgpbwsryCdOctEk7KuTP4XCTPiNE66mUMgPKQR5
	lhZmR7XMvJSFCFkBejfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKubt-009skH-1P;
	Wed, 03 Jan 2024 06:20:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKubq-009sih-0e
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 06:20:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 65D29CE12A1
	for <linux-riscv@lists.infradead.org>; Wed,  3 Jan 2024 06:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA62C433B7
	for <linux-riscv@lists.infradead.org>; Wed,  3 Jan 2024 06:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704262802;
	bh=Syb/OqAPuzYkJd/5Px0xgqgiiqYsgunBbJPRk+8KkZk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VrpHQY4bOMX16ib5//rn5B/6EwaQX8iX3JhFsdosCLXjW5JtqWiZsvVg0FDVC7Xhb
	 4G25xxRR3YlQq7xWuSJttInLMiv9gL97254bZEq6n4rRtM99PD4XkBJ57OEcZGEKfW
	 6lUKmoitg7d2op82zCkRlUmm7VLt8XtnwfF5HNZsBRtqea2A1h3k42RdsDj8gRCh5M
	 +yuQUsoOC0D/aesiBMCrNY8Z7W48GBsxcW+jFOajrPcSIWiJuayA+KyF8rGrZJEKmy
	 8yCKXa1Jq5p05lbljMVI6u4LkK//Y0hVoO2A764VzjVwzhuC6Iy2H/K98CCgbcFipy
	 mzIg5VHdMoaRA==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a275b3a1167so540280866b.3
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 22:20:01 -0800 (PST)
X-Gm-Message-State: AOJu0Yx9VcS4V6WC2IPPe6HvAWGw0xOKCbxptDvnHWgNFFLPYu820TXx
	9hyF3Q4v+jjUwZQV6Rpgi5GFJ8kF2B45sDRt4A8=
X-Google-Smtp-Source: AGHT+IFuqReRJk5xVqnVeZa5r5yG7/RHdYMjjYSaCy4RdhwvqtTkrOn7uiNzIFtRiAXwoRAR+JW8Lr1qkPKp+W3wpfQ=
X-Received: by 2002:a17:906:c012:b0:a25:49d5:e272 with SMTP id
 e18-20020a170906c01200b00a2549d5e272mr8392516ejz.12.1704262800314; Tue, 02
 Jan 2024 22:20:00 -0800 (PST)
MIME-Version: 1.0
References: <20231231082955.16516-1-guoren@kernel.org> <20231231082955.16516-3-guoren@kernel.org>
 <20240102-7e62facbd8322db4dee4b0dd@orel>
In-Reply-To: <20240102-7e62facbd8322db4dee4b0dd@orel>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 3 Jan 2024 14:19:49 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRv4UgSHMTp_tOhNGV2mQXBt1dPj6RdB2XXBGfT6iCWSw@mail.gmail.com>
Message-ID: <CAJF2gTRv4UgSHMTp_tOhNGV2mQXBt1dPj6RdB2XXBGfT6iCWSw@mail.gmail.com>
Subject: Re: [PATCH V2 2/3] riscv: Add ARCH_HAS_PRETCHW support with Zibop
To: Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_222010_613731_FDD650DC 
X-CRM114-Status: GOOD (  20.61  )
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
Cc: wefu@redhat.com, keescook@chromium.org, peterz@infradead.org, unicorn_wang@outlook.com, atishp@atishpatra.org, chao.wei@sophgo.com, bjorn@rivosinc.com, linux-kernel@vger.kernel.org, xiaoguang.xing@sophgo.com, conor.dooley@microchip.com, leobras@redhat.com, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, Guo Ren <guoren@linux.alibaba.com>, panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org, wuwei2016@iscas.ac.cn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKYW4gMiwgMjAyNCBhdCA2OjQ14oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPgo+IHMvWmlib3AvWmljYm9wLyA8PDwkU1VCSkVDVApv
a2F5Cgo+Cj4gT24gU3VuLCBEZWMgMzEsIDIwMjMgYXQgMDM6Mjk6NTJBTSAtMDUwMCwgZ3VvcmVu
QGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFi
YS5jb20+Cj4gPgo+ID4gRW5hYmxlIExpbnV4IHByZWZldGNodyBwcmltaXRpdmUgd2l0aCBaaWJv
cCBjcHVmZWF0dXJlLCB3aGljaCBwcmVsb2Fkcwo+Cj4gQWxzbyBzL1ppYm9wL1ppY2JvcC8gaGVy
ZQpva2F5LCB0aHguCgo+Cj4gPiBjYWNoZSBsaW5lIGludG8gTDEgY2FjaGUgZm9yIHRoZSBuZXh0
IHdyaXRlIG9wZXJhdGlvbi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5A
bGludXguYWxpYmFiYS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2Vy
bmVsLm9yZz4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgg
fCAxNiArKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMo
KykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3Iu
aCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiA+IGluZGV4IGYxOWY4NjFj
ZGE1NC4uOGQzYTJhYjM3Njc4IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wcm9jZXNzb3IuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3Iu
aAo+ID4gQEAgLTEzLDYgKzEzLDkgQEAKPiA+ICAjaW5jbHVkZSA8dmRzby9wcm9jZXNzb3IuaD4K
PiA+Cj4gPiAgI2luY2x1ZGUgPGFzbS9wdHJhY2UuaD4KPiA+ICsjaW5jbHVkZSA8YXNtL2luc24t
ZGVmLmg+Cj4gPiArI2luY2x1ZGUgPGFzbS9hbHRlcm5hdGl2ZS1tYWNyb3MuaD4KPiA+ICsjaW5j
bHVkZSA8YXNtL2h3Y2FwLmg+Cj4gPgo+ID4gICNpZmRlZiBDT05GSUdfNjRCSVQKPiA+ICAjZGVm
aW5lIERFRkFVTFRfTUFQX1dJTkRPVyAgIChVTCgxKSA8PCAoTU1BUF9WQV9CSVRTIC0gMSkpCj4g
PiBAQCAtMTA2LDYgKzEwOSwxOSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgYXJjaF90aHJlYWRfc3Ry
dWN0X3doaXRlbGlzdCh1bnNpZ25lZCBsb25nICpvZmZzZXQsCj4gPiAgI2RlZmluZSBLU1RLX0VJ
UCh0c2spICAgICAgICAgICAgICAgICh0YXNrX3B0X3JlZ3ModHNrKS0+ZXBjKQo+ID4gICNkZWZp
bmUgS1NUS19FU1AodHNrKSAgICAgICAgICAgICAgICAodGFza19wdF9yZWdzKHRzayktPnNwKQo+
ID4KPiA+ICsjaWZkZWYgQ09ORklHX1JJU0NWX0lTQV9aSUNCT1AKPiA+ICsjZGVmaW5lIEFSQ0hf
SEFTX1BSRUZFVENIVwo+ID4gKwo+ID4gKyNkZWZpbmUgUFJFRkVUQ0hXX0FTTSh4KSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgIEFMVEVSTkFU
SVZFKF9fbm9wcygxKSwgQ0JPX1BSRUZFVENIX1coeCwgMCksIDAsICAgICAgICAgICAgICAgICBc
Cj4gPiArICAgICAgICAgICAgICAgICBSSVNDVl9JU0FfRVhUX1pJQ0JPUCwgQ09ORklHX1JJU0NW
X0lTQV9aSUNCT1ApCj4gPiArCj4gPiArCj4gPiArc3RhdGljIGlubGluZSB2b2lkIHByZWZldGNo
dyhjb25zdCB2b2lkICp4KQo+ID4gK3sKPiA+ICsgICAgIF9fYXNtX18gX192b2xhdGlsZV9fKFBS
RUZFVENIV19BU00oJTApIDogOiAiciIgKHgpIDogIm1lbW9yeSIpOwo+ID4gK30KPgo+IFNob3Vs
ZG4ndCB3ZSBjcmVhdGUgYW4gaW50ZXJmYWNlIHdoaWNoIGV4cG9zZXMgdGhlIG9mZnNldCBpbnB1
dCBvZgo+IHRoZSBpbnN0cnVjdGlvbiwgYWxsb3dpbmcgYSBzZXF1ZW5jZSBvZiBjYWxscyB0byBi
ZSB1bnJvbGxlZD8gQnV0Cj4gSSBndWVzcyB0aGF0IGNvdWxkIGJlIHB1dCBvZmYgdW50aWwgdGhl
cmUncyBhIG5lZWQgZm9yIGl0LgpJIHdhbnQgdG8gcHV0IGl0IG9mZiB1bnRpbCB0aGVyZSdzIGEg
dXNlci4gTGV0J3Mga2VlcCB0aGUgd2hvbGUKaW1tWzExOjBdIHplcm8gZm9yIHRoZSBjdXJyZW50
LgoKPgo+ID4gKyNlbmRpZiAvKiBDT05GSUdfUklTQ1ZfSVNBX1pJQ0JPUCAqLwo+ID4KPiA+ICAv
KiBEbyBuZWNlc3Nhcnkgc2V0dXAgdG8gc3RhcnQgdXAgYSBuZXdseSBleGVjdXRlZCB0aHJlYWQu
ICovCj4gPiAgZXh0ZXJuIHZvaWQgc3RhcnRfdGhyZWFkKHN0cnVjdCBwdF9yZWdzICpyZWdzLAo+
ID4gLS0KPiA+IDIuNDAuMQo+ID4KPgo+IFRoYW5rcywKPiBkcmV3CgoKCi0tIApCZXN0IFJlZ2Fy
ZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
