Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99206C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 02:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2Ck0h6AuWbsGIzzgGZhK4yEAMKMu2TL9ysK9pDhAYU=; b=eerv36PCz63XG9
	Ngy8MwtsB+DecXsesW4bq+QSTTYkSO3dym4vSSUWRwS9gcrragG/g4OBjt6B8XzQPSl2zPsigFaeR
	YEsw+Y9os8auTLTtnzFWyaKs7xqz2xJn4z2tltX+ur4btKFnM8rp8X2iv8bg4ep4EXeICx1cmmgX3
	8lGEL3ZghNeH3aoe/JuOwjTMfj+SWerEt3TVFV9t0FsbKL009tWpKYPMFMEui7Wl5eCRWzRX6A6mt
	UEHHYId/RPlrUNZBWTLLnCxFjRB7zpJfQHjHrK8xKA0mzfuKWr2/Ytq0tU71sHPwt8MQOGdisgmu8
	gVxnUK8WQfpnFugR2LnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXCyB-00FQ1u-4t; Thu, 24 Mar 2022 02:12:59 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXCxw-00FPxB-QZ
 for linux-riscv@lists.infradead.org; Thu, 24 Mar 2022 02:12:46 +0000
Received: by mail-ej1-x632.google.com with SMTP id qx21so6337251ejb.13
 for <linux-riscv@lists.infradead.org>; Wed, 23 Mar 2022 19:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BCOovJyPh0b4zYvl+nTG0Ejb+isbohuepHr7Xg5SeZ8=;
 b=aqT0DmxhPMdzHQ6ds1qvDm0Gqk/I2X8ppXoBJCVmqFF7EOyhFa8PFPf7PnmiiZl85G
 bJmb0HIn27+yvh7bbJJJ5m2qrODaPlNDCdEZZMHkevjqNOvrYDCvPYK2vQ5lgoIu2BRv
 7w5sy6kQG5FQm0AnuSecon0cZcbw9iz3HZisUfPKhux/Ks5SG8pJY+kyFM0rbMp18EJw
 oFYgTvLim1rFKqLN5nA6585PcRceunwoXs5Yr7ALwFOp5R8fCo8qm2oQjI07xKruS/vb
 DUgzpNAI6sEacBHrhiemU5rWKI4pPNRB/Wv2bB13IOkB20UplQrsrEPgrOZU/cmOoXXm
 0W2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BCOovJyPh0b4zYvl+nTG0Ejb+isbohuepHr7Xg5SeZ8=;
 b=Cq2aUBVoa/ztIHGR85XOVxcrDdbuqAB9cDFZnEyMj5GF6Y4xEPfwHFdTaW7XADE92r
 aC8n62UZR/6fx6NuSiBBj5LCz9FTW/DBLis5YQmDdTda1pJOqAB4X7gfRdn4q2YmsOG/
 Q/I8I02LB91RAf0U5jMFiafC/W4GsweGkw3sAD8JxQd7HP3ZyZWmNvFJ5kUkuUcLzHyA
 nSqoVu/j+wBgHblUCqUQuzzuTSwHN9yHFyBbecyZyqMgOaI67RQnYrvaDVGWBiYJJiTZ
 o5TYJ/wDZJ5pa+AGNqMaZuWF1+S1XzFJKolOsDEDGEXVVPtlkAkFxJU4ejMB8pM5yc4X
 X5hw==
X-Gm-Message-State: AOAM530L4zpAD4mvD07XItOfPplXjvvbsMkuhuC5Ly2yY3VM+hyG0u/g
 BrN6ASnG/R/A1DPNiw6v4S6CWWYMttK4IzoTbemdCA==
X-Google-Smtp-Source: ABdhPJzpZ1gIybuFI4pn4eTHzXP1tUx/TNO22fj/wIoPss7PW3L5NtzpTcrmPLJdonNgbkRnQvB642mK2quWLD0+UCk=
X-Received: by 2002:a17:907:9602:b0:6df:e82c:f84 with SMTP id
 gb2-20020a170907960200b006dfe82c0f84mr3302273ejc.590.1648087962953; Wed, 23
 Mar 2022 19:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220322144447.3563146-1-tongtiangen@huawei.com>
 <20220322144447.3563146-3-tongtiangen@huawei.com>
 <CA+CK2bAa96oE0FbtJUjAJ=vpuzQsW3R60K9SUhca6mZ3BL1f8w@mail.gmail.com>
 <0c95c24d-b980-a8b3-9c68-e10d16e05e10@huawei.com>
In-Reply-To: <0c95c24d-b980-a8b3-9c68-e10d16e05e10@huawei.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 23 Mar 2022 22:12:02 -0400
Message-ID: <CA+CK2bAhxZEyirFHjwEB6aRDqH8ZzbJu_NELaT+vBAuDtDh9PQ@mail.gmail.com>
Subject: Re: [PATCH -next v2 2/4] mm: page_table_check: add hooks to public
 helpers
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_191245_091400_FF69BBDC 
X-CRM114-Status: GOOD (  22.40  )
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

T24gV2VkLCBNYXIgMjMsIDIwMjIgYXQgMTA6MDcgUE0gVG9uZyBUaWFuZ2VuIDx0b25ndGlhbmdl
bkBodWF3ZWkuY29tPiB3cm90ZToKPgo+Cj4KPiDlnKggMjAyMi8zLzI0IDE6NDIsIFBhc2hhIFRh
dGFzaGluIOWGmemBkzoKPiA+IE9uIFR1ZSwgTWFyIDIyLCAyMDIyIGF0IDEwOjI1IEFNIFRvbmcg
VGlhbmdlbiA8dG9uZ3RpYW5nZW5AaHVhd2VpLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBNb3ZlIHB0
ZXBfY2xlYXIoKSB0byB0aGUgaW5jbHVkZS9saW51eC9wZ3RhYmxlLmggYW5kIGFkZCBwYWdlIHRh
YmxlIGNoZWNrCj4gPj4gcmVsYXRlIGhvb2tzIHRvIHNvbWUgaGVscGVycywgaXQncyBwcmVwYXJl
IGZvciBzdXBwb3J0IHBhZ2UgdGFibGUgY2hlY2sKPiA+PiBmZWF0dXJlIG9uIG5ldyBhcmNoaXRl
Y3R1cmUuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBUb25nIFRpYW5nZW4gPHRvbmd0aWFuZ2Vu
QGh1YXdlaS5jb20+Cj4gPj4gLS0tCj4gPj4gICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9wZ3RhYmxl
LmggfCAxMCAtLS0tLS0tLS0tCj4gPj4gICBpbmNsdWRlL2xpbnV4L3BndGFibGUuaCAgICAgICAg
fCAyNyArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPiA+PiAgIDIgZmlsZXMgY2hhbmdlZCwg
MTkgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEv
YXJjaC94ODYvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vcGd0
YWJsZS5oCj4gPj4gaW5kZXggOGNkNjUxNGUzMDUyLi44Yzg1ZjJlYWJiYWEgMTAwNjQ0Cj4gPj4g
LS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPj4gKysrIGIvYXJjaC94ODYv
aW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPj4gQEAgLTEwNzcsMTYgKzEwNzcsNiBAQCBzdGF0aWMg
aW5saW5lIHB0ZV90IHB0ZXBfZ2V0X2FuZF9jbGVhcl9mdWxsKHN0cnVjdCBtbV9zdHJ1Y3QgKm1t
LAo+ID4+ICAgICAgICAgIHJldHVybiBwdGU7Cj4gPj4gICB9Cj4gPj4KPiA+PiAtI2RlZmluZSBf
X0hBVkVfQVJDSF9QVEVQX0NMRUFSCj4gPj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBwdGVwX2NsZWFy
KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gPj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcHRlX3QgKnB0ZXApCj4gPj4gLXsKPiA+PiAtICAgICAgIGlm
IChJU19FTkFCTEVEKENPTkZJR19QQUdFX1RBQkxFX0NIRUNLKSkKPiA+PiAtICAgICAgICAgICAg
ICAgcHRlcF9nZXRfYW5kX2NsZWFyKG1tLCBhZGRyLCBwdGVwKTsKPiA+PiAtICAgICAgIGVsc2UK
PiA+PiAtICAgICAgICAgICAgICAgcHRlX2NsZWFyKG1tLCBhZGRyLCBwdGVwKTsKPiA+PiAtfQo+
ID4+IC0KPiA+PiAgICNkZWZpbmUgX19IQVZFX0FSQ0hfUFRFUF9TRVRfV1JQUk9URUNUCj4gPj4g
ICBzdGF0aWMgaW5saW5lIHZvaWQgcHRlcF9zZXRfd3Jwcm90ZWN0KHN0cnVjdCBtbV9zdHJ1Y3Qg
Km1tLAo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGxvbmcgYWRkciwgcHRlX3QgKnB0ZXApCj4gPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
cGd0YWJsZS5oIGIvaW5jbHVkZS9saW51eC9wZ3RhYmxlLmgKPiA+PiBpbmRleCBmNGY0MDc3Yjk3
YWEuLmQyN2ZkMGVkODRhOSAxMDA2NDQKPiA+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3BndGFibGUu
aAo+ID4+ICsrKyBiL2luY2x1ZGUvbGludXgvcGd0YWJsZS5oCj4gPj4gQEAgLTEyLDYgKzEyLDcg
QEAKPiA+PiAgICNpbmNsdWRlIDxsaW51eC9idWcuaD4KPiA+PiAgICNpbmNsdWRlIDxsaW51eC9l
cnJuby5oPgo+ID4+ICAgI2luY2x1ZGUgPGFzbS1nZW5lcmljL3BndGFibGVfdWZmZC5oPgo+ID4+
ICsjaW5jbHVkZSA8bGludXgvcGFnZV90YWJsZV9jaGVjay5oPgo+ID4+Cj4gPj4gICAjaWYgNSAt
IGRlZmluZWQoX19QQUdFVEFCTEVfUDREX0ZPTERFRCkgLSBkZWZpbmVkKF9fUEFHRVRBQkxFX1BV
RF9GT0xERUQpIC0gXAo+ID4+ICAgICAgICAgIGRlZmluZWQoX19QQUdFVEFCTEVfUE1EX0ZPTERF
RCkgIT0gQ09ORklHX1BHVEFCTEVfTEVWRUxTCj4gPj4gQEAgLTI1OSwxNCArMjYwLDYgQEAgc3Rh
dGljIGlubGluZSBpbnQgcG1kcF9jbGVhcl9mbHVzaF95b3VuZyhzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSwKPiA+PiAgICNlbmRpZiAvKiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UgKi8K
PiA+PiAgICNlbmRpZgo+ID4+Cj4gPj4gLSNpZm5kZWYgX19IQVZFX0FSQ0hfUFRFUF9DTEVBUgo+
ID4+IC1zdGF0aWMgaW5saW5lIHZvaWQgcHRlcF9jbGVhcihzdHJ1Y3QgbW1fc3RydWN0ICptbSwg
dW5zaWduZWQgbG9uZyBhZGRyLAo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHB0
ZV90ICpwdGVwKQo+ID4+IC17Cj4gPj4gLSAgICAgICBwdGVfY2xlYXIobW0sIGFkZHIsIHB0ZXAp
Owo+ID4+IC19Cj4gPj4gLSNlbmRpZgo+ID4+IC0KPiA+PiAgICNpZm5kZWYgX19IQVZFX0FSQ0hf
UFRFUF9HRVRfQU5EX0NMRUFSCj4gPj4gICBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZXBfZ2V0X2Fu
ZF9jbGVhcihzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiA+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyZXNzLAo+ID4+IEBAIC0yNzQsMTAg
KzI2NywyMyBAQCBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZXBfZ2V0X2FuZF9jbGVhcihzdHJ1Y3Qg
bW1fc3RydWN0ICptbSwKPiA+PiAgIHsKPiA+PiAgICAgICAgICBwdGVfdCBwdGUgPSAqcHRlcDsK
PiA+PiAgICAgICAgICBwdGVfY2xlYXIobW0sIGFkZHJlc3MsIHB0ZXApOwo+ID4+ICsgICAgICAg
cGFnZV90YWJsZV9jaGVja19wdGVfY2xlYXIobW0sIGFkZHJlc3MsIHB0ZSk7Cj4gPj4gICAgICAg
ICAgcmV0dXJuIHB0ZTsKPiA+PiAgIH0KPiA+PiAgICNlbmRpZgo+ID4+Cj4gPj4gKyNpZm5kZWYg
X19IQVZFX0FSQ0hfUFRFUF9DTEVBUgo+ID4+ICtzdGF0aWMgaW5saW5lIHZvaWQgcHRlcF9jbGVh
cihzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ID4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHB0ZV90ICpwdGVwKQo+ID4+ICt7Cj4gPj4gKyNpZmRlZiBD
T05GSUdfUEFHRV9UQUJMRV9DSEVDSwo+ID4+ICsgICAgICAgcHRlcF9nZXRfYW5kX2NsZWFyKG1t
LCBhZGRyLCBwdGVwKTsKPiA+PiArI2Vsc2UKPiA+PiArICAgICAgIHB0ZV9jbGVhcihtbSwgYWRk
ciwgcHRlcCk7Cj4gPj4gKyNlbmRpZgo+ID4KPiA+IEkgaGF2ZSBhIHByZWZlcmVuY2UgdG8gdXNl
IGlmIChJU19FTkFCTEVEKENPTkZJR19QQUdFX1RBQkxFX0NIRUNLKSkKPiA+IGluc3RlYWQgb2Yg
I2lmZGVmLiBUaGUgZW5kIHJlc3VsdCBpcyB0aGUgc2FtZS4gT3RoZXJ3aXNlIGl0IGxvb2tzCj4g
PiBnb29kLgo+ID4KPiA+IFRoYW5rcywKPiA+IFBhc2hhCj4gPiAuCj4KPiBJIGhhdmUgYSBsaXR0
bGUgaGVzaXRhdGlvbiB3aGVuIG1ha2luZyB0aGlzIGNoYW5nZSAsIGluIHRoZW9yeSwgYWRkIGlm
Cj4gaGVyZSBtYXkgYWZmZWN0IHRoZSBwZXJmb3JtYW5jZSBhIGxpdHRsZSBpbiBzb21lIHNjZW5h
cmlvcy4gSG93ZXZlciwgdGhlCj4gaW1wYWN0IG9uIHRoZSB3aG9sZSBjYWxsIHBhdGggc2hvdWxk
IGJlIHNtYWxsLgoKSSBkbyBub3QgdGhpbmsgc28sIHRoZSBjb21waWxlciBzaG91bGQgb3B0aW1p
emUgb3V0IElTX0VOQUJMRUQoKSB3aGVuCm5vdCBlbmFibGVkLCBubz8KCj4KPiBJIHdpbGwgc2Vu
ZCB2MyB1c2luZyBpZiAoSVNfRU5BQkxFRChDT05GSUdfUEFHRV9UQUJMRV9DSEVDSykpLgo+Cj4g
VGhhbmtzLgo+IFRvbmcKPiAuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
