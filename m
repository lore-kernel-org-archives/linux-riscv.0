Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30749C43219
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 19:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w1NgoSV2qgcWlfUfPbDpNIZbwJykJKyeD6YCc8bJoUc=; b=MnszV0rx9W13sV
	3Yw0umItPzeW/yiYh3aSeq92IXMXTiumI5EkcBwxda4r3Va8OohYfj6E18xJpLu0CFGZpF7f3RQ2j
	c63wvxh7oj7Yb7lS6kCJu6SsFqnEWRMsQB3zsAdzzAbKtMhwwBhGBX0DKQaoA0U/rnZjl7yN/Oyp3
	qDYEgDkRF9gwG9UfsSq1NPg9YyzDPCl7MlIAmAMq/XUjtZ1uVSub2J133eoB9JIJLgZ0GtyzsDFo1
	+ZrwEFDQAKenasjpz8qZ/bVUf/hywBS1/h4fZ9qbng8HVpG442nMuyy6mu1JLPfx8bRNb97UdqACn
	VVhIyt+qW5OjVqjSazzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyHh2-00BBO3-Lj; Thu, 24 Nov 2022 19:15:28 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyHgz-00BBI5-Ey
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 19:15:27 +0000
Received: by mail-ej1-x632.google.com with SMTP id m22so5922654eji.10
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 11:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWeAC6tVqoQ6bNA7whBca/Z25C/J+Qx03REs2nGyD7A=;
        b=lPSQbOINQxMXT+unJ0mshlxYmnlkNXq1M658zJNMI6XNi60l8MdT4SqaAKByvLexEt
         L81yxMT3JA8b+ku9YUOab8bjrQ2S+DwYX3DjsefZzvwKHDZmFpeE50l8/w32qvrAZiYg
         efhZr0c7YGbjYQ+3Fo6cayGSIU1jEE1BzjGmqxBhZUXYrkx2+8ryQCKl5ICk4VWI0gzj
         HqUjUHKvYS8KLqPa5rwwfFKBD7FKmZtC8USRuA09eXEZ94+GQFoi+3QIT1gPfRhI3OGT
         HDPbFqPKnCeTSKFT7/c+e5G7ph6Dg3pGl7/7ArPE4gHQ6LakyEiq/74acw0OnlB+JW2w
         1V4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWeAC6tVqoQ6bNA7whBca/Z25C/J+Qx03REs2nGyD7A=;
        b=yMoLsu+ffi5hCKwyjU0SvENnkx+M9mSbCxiqqQGLCTztJZ6PNIJ7amX14rs6NlZXBB
         9R/5ucEQ26MFhhzszdTPKH/JFNdDnnlv2vDEb8YwbGWQBAyDtXwrWPu/ODK3THxzvBS3
         l2HescEIKA6T6Dd1uxzGYMEU1g9U9jqeoIwA1zo+WgDG0HQV+YyJN1RlQ2MnEu3FOwk6
         3xR0d/IsRGVjmRcatyOp+hupHVdqyqBiOyTiuu6YwKYtbuCW6750qFwvVOvW5r+GtuKF
         i77sNy293meJ3bOfAmXXqoLdXfnydYw/QVj2hzXlcK7h7nunBgyM/lrTW89T129m5GOz
         GFag==
X-Gm-Message-State: ANoB5pkWUVhmmKdJXoL+LkQ0hSRPTHQmSILuBVoRXC0Ualhjxz7buyov
	x0bx7Fugow1D29wu+T8AMth8q/jKeI7nD8yo3z4=
X-Google-Smtp-Source: AA0mqf5ok9xKhUigClOCzJ/g0cQ1rY0k5p19eoRhweDVXGsjFwjIINpC/tel64cTzP0N5/jVCdXGqfEtPHiuLf8z7zE=
X-Received: by 2002:a17:906:79c4:b0:778:e3e2:8311 with SMTP id
 m4-20020a17090679c400b00778e3e28311mr14512080ejo.342.1669317321518; Thu, 24
 Nov 2022 11:15:21 -0800 (PST)
MIME-Version: 1.0
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <4542837.QJadu78ljV@diego>
In-Reply-To: <4542837.QJadu78ljV@diego>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 24 Nov 2022 19:14:54 +0000
Message-ID: <CA+V-a8uB8LVc4rPehYOYM2OKa4hW2TPegB2zmm5xV-ZcznqNQA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] riscv: errata: Add Andes alternative ports
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Nathan Chancellor <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_111525_563641_7448E837 
X-CRM114-Status: GOOD (  22.29  )
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

SGkgSGVpa28sCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiBUaHUsIE5vdiAyNCwgMjAy
MiBhdCA2OjI1IFBNIEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+Cj4g
QW0gRG9ubmVyc3RhZywgMjQuIE5vdmVtYmVyIDIwMjIsIDE4OjIyOjAzIENFVCBzY2hyaWViIFBy
YWJoYWthcjoKPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5y
akBicC5yZW5lc2FzLmNvbT4KPiA+Cj4gPiBBZGQgcmVxdWlyZWQgcG9ydHMgb2YgdGhlIEFsdGVy
bmF0aXZlIHNjaGVtZSBmb3IgQW5kZXMgQ1BVIGNvcmVzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4K
PiA+IC0tLQo+ID4gUkZDIHYzIC0+IHY0Cj4gPiAqIE5ldyBwYXRjaAo+ID4gLS0tCj4KPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2VycmF0YS9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvZXJyYXRh
L01ha2VmaWxlCj4gPiBpbmRleCBhMTA1NTk2NWZiZWUuLjgxODI4ZTgwZjZkYyAxMDA2NDQKPiA+
IC0tLSBhL2FyY2gvcmlzY3YvZXJyYXRhL01ha2VmaWxlCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Vy
cmF0YS9NYWtlZmlsZQo+ID4gQEAgLTEsMiArMSwzIEBACj4gPiAgb2JqLSQoQ09ORklHX0VSUkFU
QV9TSUZJVkUpICs9IHNpZml2ZS8KPiA+ICBvYmotJChDT05GSUdfRVJSQVRBX1RIRUFEKSArPSB0
aGVhZC8KPiA+ICtvYmotJChDT05GSUdfRVJSQVRBX0FOREVTKSArPSBhbmRlcy8KPgo+IGFscGhh
YmV0aWNhbCBzb3J0aW5nIHBsZWFzZQo+Cj4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Vy
cmF0YS9hbmRlcy9lcnJhdGEuYyBiL2FyY2gvcmlzY3YvZXJyYXRhL2FuZGVzL2VycmF0YS5jCj4g
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5lYzNlMDUyY2E4
YzcKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2FyY2gvcmlzY3YvZXJyYXRhL2FuZGVzL2Vy
cmF0YS5jCj4gPiBAQCAtMCwwICsxLDY4IEBACj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAtb25seQo+ID4gKy8qCj4gPiArICogRXJyYXRhcyB0byBiZSBhcHBsaWVkIGZv
ciBBbmRlcyBDUFUgY29yZXMKPiA+ICsgKgo+ID4gKyAqICBDb3B5cmlnaHQgKEMpIDIwMjIgUmVu
ZXNhcyBFbGVjdHJvbmljcyBDb3Jwb3JhdGlvbi4KPiA+ICsgKgo+ID4gKyAqIEF1dGhvcjogTGFk
IFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+ID4g
KyAqLwo+ID4gKwo+ID4gKyNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiA+ICsjaW5jbHVkZSA8
bGludXgvbW9kdWxlLmg+Cj4gPiArCj4gPiArI2luY2x1ZGUgPGFzbS9hbHRlcm5hdGl2ZS5oPgo+
ID4gKyNpbmNsdWRlIDxhc20vY2FjaGVmbHVzaC5oPgo+ID4gKyNpbmNsdWRlIDxhc20vZXJyYXRh
X2xpc3QuaD4KPiA+ICsjaW5jbHVkZSA8YXNtL3BhdGNoLmg+Cj4gPiArI2luY2x1ZGUgPGFzbS92
ZW5kb3JpZF9saXN0Lmg+Cj4gPiArCj4gPiArc3RhdGljIGJvb2wgZXJyYXRhX3Byb2JlX2lvY3Ao
dW5zaWduZWQgaW50IHN0YWdlLCB1bnNpZ25lZCBsb25nIGFyY2hfaWQsIHVuc2lnbmVkIGxvbmcg
aW1waWQpCj4gPiArewo+ID4gKyAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19FUlJBVEFfQU5E
RVNfQ01PKSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gKwo+ID4gKyAgICAg
aWYgKGFyY2hfaWQgIT0gMHg4MDAwMDAwMDAwMDA4YTQ1IHx8IGltcGlkICE9IDB4NTAwKQo+ID4g
KyAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiArCj4gPiArICAgICByaXNjdl9jYm9tX2Js
b2NrX3NpemUgPSAxOwo+Cj4gYXMgdGhpcyBpcyBtYWlubHkgdG8gbWFrZSB0aGUgY29yZSBjYm8g
Y29kZSBoYXBweSwgbWF5YmUgYWRkIGEgY29tbWVudAo+IGFib3ZlIHRoYXQgbGluZSB0byBleHBs
YWluLgo+CkFncmVlZCwgSSdsbCBhZGQgYSBjb21tZW50IGhlcmUuCgo+Cj4gPiArICAgICByaXNj
dl9ub25jb2hlcmVudF9zdXBwb3J0ZWQoKTsKPiA+ICsKPiA+ICsgICAgIHJldHVybiB0cnVlOwo+
ID4gK30KPiA+ICsKPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYWx0
ZXJuYXRpdmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYWx0ZXJuYXRpdmUuaAo+ID4gaW5k
ZXggNjUxMWRkNzNlODEyLi5kODAxMmFmMzBjYmQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZlLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vYWx0ZXJuYXRpdmUuaAo+ID4gQEAgLTQ2LDYgKzQ2LDkgQEAgdm9pZCBzaWZpdmVfZXJyYXRh
X3BhdGNoX2Z1bmMoc3RydWN0IGFsdF9lbnRyeSAqYmVnaW4sIHN0cnVjdCBhbHRfZW50cnkgKmVu
ZCwKPiA+ICB2b2lkIHRoZWFkX2VycmF0YV9wYXRjaF9mdW5jKHN0cnVjdCBhbHRfZW50cnkgKmJl
Z2luLCBzdHJ1Y3QgYWx0X2VudHJ5ICplbmQsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBsb25nIGFyY2hpZCwgdW5zaWduZWQgbG9uZyBpbXBpZCwKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBzdGFnZSk7Cj4gPiArdm9pZCBhbmRlc19l
cnJhdGFfcGF0Y2hfZnVuYyhzdHJ1Y3QgYWx0X2VudHJ5ICpiZWdpbiwgc3RydWN0IGFsdF9lbnRy
eSAqZW5kLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhcmNo
aWQsIHVuc2lnbmVkIGxvbmcgaW1waWQsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBpbnQgc3RhZ2UpOwo+Cj4gYWdhaW4gYWxwaGFiZXRpY2FsIHBsZWFzZSAoaS5lLiBh
Ym92ZSBzaWZpdmUpCj4KPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
ZXJyYXRhX2xpc3QuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaAo+ID4g
aW5kZXggNDE4MDMxMmQyYTcwLi4yYmE3ZTZlNzQ1NDAgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2VycmF0YV9saXN0LmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vZXJyYXRhX2xpc3QuaAo+ID4gQEAgLTksNiArOSwxMSBAQAo+ID4gICNpbmNsdWRlIDxh
c20vY3NyLmg+Cj4gPiAgI2luY2x1ZGUgPGFzbS92ZW5kb3JpZF9saXN0Lmg+Cj4gPgo+ID4gKyNp
ZmRlZiBDT05GSUdfRVJSQVRBX0FOREVTCj4gPiArI2RlZmluZSBFUlJBVEFfQU5ERVNURUNIX05P
X0lPQ1AgICAgIDAKPiA+ICsjZGVmaW5lIEVSUkFUQV9BTkRFU1RFQ0hfTlVNQkVSICAgICAgICAg
ICAgICAxCj4gPiArI2VuZGlmCj4gPiArCj4gPiAgI2lmZGVmIENPTkZJR19FUlJBVEFfU0lGSVZF
Cj4gPiAgI2RlZmluZSAgICAgIEVSUkFUQV9TSUZJVkVfQ0lQXzQ1MyAwCj4gPiAgI2RlZmluZSAg
ICAgIEVSUkFUQV9TSUZJVkVfQ0lQXzEyMDAgMQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL2FsdGVybmF0aXZlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9hbHRlcm5hdGl2ZS5jCj4g
PiBpbmRleCBhN2QyNmEwMGJlZWEuLjRkZWQzZTlhYTNiYyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL2FsdGVybmF0aXZlLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2Fs
dGVybmF0aXZlLmMKPiA+IEBAIC00Nyw2ICs0NywxMSBAQCBzdGF0aWMgdm9pZCBfX2luaXRfb3Jf
bW9kdWxlIHJpc2N2X2ZpbGxfY3B1X21mcl9pbmZvKHN0cnVjdCBjcHVfbWFudWZhY3R1cmVyX2lu
Zgo+ID4gICAgICAgY2FzZSBUSEVBRF9WRU5ET1JfSUQ6Cj4gPiAgICAgICAgICAgICAgIGNwdV9t
ZnJfaW5mby0+cGF0Y2hfZnVuYyA9IHRoZWFkX2VycmF0YV9wYXRjaF9mdW5jOwo+ID4gICAgICAg
ICAgICAgICBicmVhazsKPiA+ICsjZW5kaWYKPiA+ICsjaWZkZWYgQ09ORklHX0VSUkFUQV9BTkRF
Uwo+ID4gKyAgICAgY2FzZSBBTkRFU1RFQ0hfVkVORE9SX0lEOgo+ID4gKyAgICAgICAgICAgICBj
cHVfbWZyX2luZm8tPnBhdGNoX2Z1bmMgPSBhbmRlc19lcnJhdGFfcGF0Y2hfZnVuYzsKPiA+ICsg
ICAgICAgICAgICAgYnJlYWs7Cj4KPiBhbmQgYWdhaW4gYWxwaGFiZXRpY2FsIHBsZWFzZQo+Ck9v
cHMgSSBtaXNzZWQgdGhhdCwgSSdsbCBzb3J0IHRoaXMgYW5kIGFsbCB0aGUgYWJvdmUuCgpDaGVl
cnMsClByYWJoYWthcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
