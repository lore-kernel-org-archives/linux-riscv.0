Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC038C7115B
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=02wlmKnYGBgkRGzmvjyqtKdjqR/iDu5e+YY7HHF7YyY=; b=rKk74DXOfSUQCy
	UkjByVM4Zv8t0y0MH1Ru2l9BJUvpp2uqPGt+wDMV1OAugH/jDmvTlBokSkl9T9t3JCHnwv4ZViSyy
	CmaB4vCur7G9GCfqJEBDZabSwZZ1ejVAXgLr9GHgfI6UJkxCCZS//IkzD9GKVPnO79TNrU4iq045k
	DeOwCqnOwSYxxv8LP0GtcPgBcKYwY1jXHz5n2JH6H5mKk0LFEf+ZY2F+Og6PiXR/oUJ6KG2hAIxD7
	vvFC1ngWcc4oaXIFOgdH3PrST7ihs23QHVN0wYYKqN3SfnQMgb211ZO0jl/K/wn5nquW+dwz4fasS
	NJk4l9pmKx6ZWCRhr1xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtCq-0000000AMTn-3UsK;
	Wed, 18 Jun 2025 13:52:00 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRs0I-0000000A9AR-1oGA
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 12:34:59 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54e7967cf67so7032795e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 05:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750250097; x=1750854897; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NCFXvXRzTnNTsIn79B1ObpiC19qiQmFuZrgGsmP12M=;
        b=E3WWQsE+B7mUbttvreWYIP8DCXObXFraGmbjVitWXDNljHcejRPvjyLNTboq+XX9OO
         yLxg+jMx9A62+EgeLs87J6+wrABzNLnRvnxMpv7foJ2n9PkJYfeZX8PLUQPGsoZn/q5z
         jD2UbV347kVfGuX6AxDzDv+H+3HeZcsUuUjw4swyxQk84xXR3z7uDmKBReecqPMXXEHb
         ZpJpAlaCQpN441phGi/N2SjWFWDmgzFPY7Nqsce8QsQ/yfZIOPLIH92E308xEaSAIQ0Y
         zYbysfHRjqKWiQaJn7lORJDcs9KA857tZJ7pSPMrOBXCq+26t4IWeVYeUKMzQtzV/kU3
         4u2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750250097; x=1750854897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NCFXvXRzTnNTsIn79B1ObpiC19qiQmFuZrgGsmP12M=;
        b=ccMT5nIkYmAO+Xvk8oFxGOkt79UfxobWAzMHWREOjwDfVxH8h/FxJYS7swbmxUYU2u
         +lU+tlhA5GRResrLggbKdvJpEicv/9Js+5w6ztvNX1rdBRwBFa/tkVx1fqIEvFKD/U79
         lvIgrYnG8/RVi5gYZwTrE7wzGBF1kbe4cU0/HYfBh3mLQqd7hU0mNQDgOwqtJN3KKtD5
         QleJEdxPSUeVRyNhfE5JUGCsaAxjfmmHdqtUnSDT3l3n7EBhV7uVn+0E36C5oQITIecS
         Vp265bSuoON1ZbdfS0+OzOMaZyc9/nAeVpIOwhbInFvomJcpspC/B0LSIznDTUTbqch9
         9FGg==
X-Forwarded-Encrypted: i=1; AJvYcCUNsH04UqxJbNtJDVjD4CXx+TUHIv+2TfQQR+yLXwBJn44lMWkJr95s2zibnDdqnZaLknmCh7R/8Uk+Qw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwLHiWURUVqg3YxVrlVaY0t6G9sWwsgYkQSmVNfGh1rgOM/Vx+
	g0dANzvXjs+YrEYcy0twun1z6CSXjzpz1hDyAAquIAji1n7hOXky09iGjbLayEpMfQVycfyDayc
	rQLuCXFVbpy2dv5YfiYSQXSHNhednZnoeBYcGx7IEZA==
X-Gm-Gg: ASbGncuedw1v0Huf0f8lO4OPz580bh+iB9btQZA8hZBfBdZdxnSluCGdRcUOx5d19N+
	r/CebXUHiSYrEbdM7uE/63HaRfd4aqjV19YJqUG3TAD1qzxedpZPkQm4MvtZwdpJnJIJsXbSMAJ
	J+y8tqs/+7HbuJmncJfn0yUvX63I1AWf1pMkqkEKlDwspeGceeYuBRZG30LLtTIgpXta7jMS0vl
	g==
X-Google-Smtp-Source: AGHT+IEcY0ia8sTwoRAYv0yUxmwNgwPhm8wtdrftfa4ddrwo+GTxfk9hINsrO5aUlvjYzopy0PhTBONSdU1zFixC2QI=
X-Received: by 2002:a05:6512:4005:b0:553:a30b:ee0a with SMTP id
 2adb3069b0e04-553b6e8c9bamr5355914e87.24.1750250096692; Wed, 18 Jun 2025
 05:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org> <2rw2sncevdiyirpdovotztlg77apcq2btzytuv5jnm55aqhlne@swtts3hl53tw>
In-Reply-To: <2rw2sncevdiyirpdovotztlg77apcq2btzytuv5jnm55aqhlne@swtts3hl53tw>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 14:34:43 +0200
X-Gm-Features: AX0GCFtJGsl5fi6e6i6LCEjO1TuJe6n2Li_qY-Pi8nS955_BMUgd9yxByrvzkO8
Message-ID: <CAMRc=Mf==gzqXEUMd3D_-XYG7Bg7dSMLgjg3sq5-GoB1BUGchA@mail.gmail.com>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
To: Klara Modin <klarasmodin@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_053458_469245_1CB323DB 
X-CRM114-Status: GOOD (  22.52  )
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

T24gV2VkLCBKdW4gMTgsIDIwMjUgYXQgMTo1OeKAr1BNIEtsYXJhIE1vZGluIDxrbGFyYXNtb2Rp
bkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiAyMDI1LTA2LTEwIDE0OjMzOjExICsw
MjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IHN0cnVjdCBncGlv
X2NoaXAgbm93IGhhcyBjYWxsYmFja3MgZm9yIHNldHRpbmcgbGluZSB2YWx1ZXMgdGhhdCByZXR1
cm4KPiA+IGFuIGludGVnZXIsIGFsbG93aW5nIHRvIGluZGljYXRlIGZhaWx1cmVzLiBDb252ZXJ0
IHRoZSBkcml2ZXIgdG8gdXNpbmcKPiA+IHRoZW0uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQmFy
dG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4gLS0t
Cj4gPiAgZHJpdmVycy9ncGlvL2dwaW8tbW1pby5jIHwgNTMgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMzIGluc2Vy
dGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
aW8vZ3Bpby1tbWlvLmMgYi9kcml2ZXJzL2dwaW8vZ3Bpby1tbWlvLmMKPiA+IGluZGV4IDQ4NDFl
NGViZTdhNjdkMGY5NTRlOWE2Zjk5NWVjNTc1OGYxMjRlZGQuLjkxNjllY2NhZGIyMzhlZmU5NDRk
NDk0MDU0YjFlMDA5ZjE2ZWVlN2YgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby1t
bWlvLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3Bpby9ncGlvLW1taW8uYwo+ID4gQEAgLTIxMSwxMSAr
MjExLDEyIEBAIHN0YXRpYyBpbnQgYmdwaW9fZ2V0X211bHRpcGxlX2JlKHN0cnVjdCBncGlvX2No
aXAgKmdjLCB1bnNpZ25lZCBsb25nICptYXNrLAo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+
ID4KPiA+IC1zdGF0aWMgdm9pZCBiZ3Bpb19zZXRfbm9uZShzdHJ1Y3QgZ3Bpb19jaGlwICpnYywg
dW5zaWduZWQgaW50IGdwaW8sIGludCB2YWwpCj4gPiArc3RhdGljIGludCBiZ3Bpb19zZXRfbm9u
ZShzdHJ1Y3QgZ3Bpb19jaGlwICpnYywgdW5zaWduZWQgaW50IGdwaW8sIGludCB2YWwpCj4gPiAg
ewo+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+IC1zdGF0aWMgdm9pZCBiZ3Bpb19z
ZXQoc3RydWN0IGdwaW9fY2hpcCAqZ2MsIHVuc2lnbmVkIGludCBncGlvLCBpbnQgdmFsKQo+ID4g
K3N0YXRpYyBpbnQgYmdwaW9fc2V0KHN0cnVjdCBncGlvX2NoaXAgKmdjLCB1bnNpZ25lZCBpbnQg
Z3BpbywgaW50IHZhbCkKPiA+ICB7Cj4gPiAgICAgICB1bnNpZ25lZCBsb25nIG1hc2sgPSBiZ3Bp
b19saW5lMm1hc2soZ2MsIGdwaW8pOwo+ID4gICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPiA+
IEBAIC0yMzAsMTAgKzIzMSwxMiBAQCBzdGF0aWMgdm9pZCBiZ3Bpb19zZXQoc3RydWN0IGdwaW9f
Y2hpcCAqZ2MsIHVuc2lnbmVkIGludCBncGlvLCBpbnQgdmFsKQo+ID4gICAgICAgZ2MtPndyaXRl
X3JlZyhnYy0+cmVnX2RhdCwgZ2MtPmJncGlvX2RhdGEpOwo+ID4KPiA+ICAgICAgIHJhd19zcGlu
X3VubG9ja19pcnFyZXN0b3JlKCZnYy0+YmdwaW9fbG9jaywgZmxhZ3MpOwo+ID4gKwo+ID4gKyAg
ICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+IC1zdGF0aWMgdm9pZCBiZ3Bpb19zZXRfd2l0aF9j
bGVhcihzdHJ1Y3QgZ3Bpb19jaGlwICpnYywgdW5zaWduZWQgaW50IGdwaW8sCj4gPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaW50IHZhbCkKPiA+ICtzdGF0aWMgaW50IGJncGlvX3Nl
dF93aXRoX2NsZWFyKHN0cnVjdCBncGlvX2NoaXAgKmdjLCB1bnNpZ25lZCBpbnQgZ3BpbywKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCB2YWwpCj4gPiAgewo+ID4gICAgICAg
dW5zaWduZWQgbG9uZyBtYXNrID0gYmdwaW9fbGluZTJtYXNrKGdjLCBncGlvKTsKPiA+Cj4gPiBA
QCAtMjQxLDkgKzI0NCwxMSBAQCBzdGF0aWMgdm9pZCBiZ3Bpb19zZXRfd2l0aF9jbGVhcihzdHJ1
Y3QgZ3Bpb19jaGlwICpnYywgdW5zaWduZWQgaW50IGdwaW8sCj4gPiAgICAgICAgICAgICAgIGdj
LT53cml0ZV9yZWcoZ2MtPnJlZ19zZXQsIG1hc2spOwo+ID4gICAgICAgZWxzZQo+ID4gICAgICAg
ICAgICAgICBnYy0+d3JpdGVfcmVnKGdjLT5yZWdfY2xyLCBtYXNrKTsKPiA+ICsKPiA+ICsgICAg
IHJldHVybiAwOwo+ID4gIH0KPiA+Cj4gPiAtc3RhdGljIHZvaWQgYmdwaW9fc2V0X3NldChzdHJ1
Y3QgZ3Bpb19jaGlwICpnYywgdW5zaWduZWQgaW50IGdwaW8sIGludCB2YWwpCj4gPiArc3RhdGlj
IGludCBiZ3Bpb19zZXRfc2V0KHN0cnVjdCBncGlvX2NoaXAgKmdjLCB1bnNpZ25lZCBpbnQgZ3Bp
bywgaW50IHZhbCkKPiA+ICB7Cj4gPiAgICAgICB1bnNpZ25lZCBsb25nIG1hc2sgPSBiZ3Bpb19s
aW5lMm1hc2soZ2MsIGdwaW8pOwo+ID4gICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPiA+IEBA
IC0yNTgsNiArMjYzLDggQEAgc3RhdGljIHZvaWQgYmdwaW9fc2V0X3NldChzdHJ1Y3QgZ3Bpb19j
aGlwICpnYywgdW5zaWduZWQgaW50IGdwaW8sIGludCB2YWwpCj4gPiAgICAgICBnYy0+d3JpdGVf
cmVnKGdjLT5yZWdfc2V0LCBnYy0+YmdwaW9fZGF0YSk7Cj4gPgo+ID4gICAgICAgcmF3X3NwaW5f
dW5sb2NrX2lycXJlc3RvcmUoJmdjLT5iZ3Bpb19sb2NrLCBmbGFncyk7Cj4gPiArCj4gPiArICAg
ICByZXR1cm4gMDsKPiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyB2b2lkIGJncGlvX211bHRpcGxlX2dl
dF9tYXNrcyhzdHJ1Y3QgZ3Bpb19jaGlwICpnYywKPiA+IEBAIC0yOTgsMjEgKzMwNSwyNSBAQCBz
dGF0aWMgdm9pZCBiZ3Bpb19zZXRfbXVsdGlwbGVfc2luZ2xlX3JlZyhzdHJ1Y3QgZ3Bpb19jaGlw
ICpnYywKPiA+ICAgICAgIHJhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKCZnYy0+YmdwaW9fbG9j
aywgZmxhZ3MpOwo+ID4gIH0KPiA+Cj4gPiAtc3RhdGljIHZvaWQgYmdwaW9fc2V0X211bHRpcGxl
KHN0cnVjdCBncGlvX2NoaXAgKmdjLCB1bnNpZ25lZCBsb25nICptYXNrLAo+ID4gK3N0YXRpYyBp
bnQgYmdwaW9fc2V0X211bHRpcGxlKHN0cnVjdCBncGlvX2NoaXAgKmdjLCB1bnNpZ25lZCBsb25n
ICptYXNrLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nICpi
aXRzKQo+ID4gIHsKPiA+ICAgICAgIGJncGlvX3NldF9tdWx0aXBsZV9zaW5nbGVfcmVnKGdjLCBt
YXNrLCBiaXRzLCBnYy0+cmVnX2RhdCk7Cj4gPiArCj4gPiArICAgICByZXR1cm4gMDsKPiA+ICB9
Cj4gPgo+ID4gLXN0YXRpYyB2b2lkIGJncGlvX3NldF9tdWx0aXBsZV9zZXQoc3RydWN0IGdwaW9f
Y2hpcCAqZ2MsIHVuc2lnbmVkIGxvbmcgKm1hc2ssCj4gPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBsb25nICpiaXRzKQo+ID4gK3N0YXRpYyBpbnQgYmdwaW9fc2V0
X211bHRpcGxlX3NldChzdHJ1Y3QgZ3Bpb19jaGlwICpnYywgdW5zaWduZWQgbG9uZyAqbWFzaywK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyAqYml0cykK
PiA+ICB7Cj4gPiAgICAgICBiZ3Bpb19zZXRfbXVsdGlwbGVfc2luZ2xlX3JlZyhnYywgbWFzaywg
Yml0cywgZ2MtPnJlZ19zZXQpOwo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4K
PiA+IC1zdGF0aWMgdm9pZCBiZ3Bpb19zZXRfbXVsdGlwbGVfd2l0aF9jbGVhcihzdHJ1Y3QgZ3Bp
b19jaGlwICpnYywKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBsb25nICptYXNrLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgKmJpdHMpCj4gPiArc3RhdGljIGludCBiZ3Bpb19zZXRfbXVs
dGlwbGVfd2l0aF9jbGVhcihzdHJ1Y3QgZ3Bpb19jaGlwICpnYywKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgKm1hc2ssCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nICpiaXRzKQo+ID4g
IHsKPiA+ICAgICAgIHVuc2lnbmVkIGxvbmcgc2V0X21hc2ssIGNsZWFyX21hc2s7Cj4gPgo+ID4g
QEAgLTMyMiw2ICszMzMsOCBAQCBzdGF0aWMgdm9pZCBiZ3Bpb19zZXRfbXVsdGlwbGVfd2l0aF9j
bGVhcihzdHJ1Y3QgZ3Bpb19jaGlwICpnYywKPiA+ICAgICAgICAgICAgICAgZ2MtPndyaXRlX3Jl
ZyhnYy0+cmVnX3NldCwgc2V0X21hc2spOwo+ID4gICAgICAgaWYgKGNsZWFyX21hc2spCj4gPiAg
ICAgICAgICAgICAgIGdjLT53cml0ZV9yZWcoZ2MtPnJlZ19jbHIsIGNsZWFyX21hc2spOwo+ID4g
Kwo+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+ICBzdGF0aWMgaW50IGJncGlvX2Rp
cl9yZXR1cm4oc3RydWN0IGdwaW9fY2hpcCAqZ2MsIHVuc2lnbmVkIGludCBncGlvLCBib29sIGRp
cl9vdXQpCj4gPiBAQCAtNTEwLDE4ICs1MjMsMTggQEAgc3RhdGljIGludCBiZ3Bpb19zZXR1cF9p
byhzdHJ1Y3QgZ3Bpb19jaGlwICpnYywKPiA+ICAgICAgIGlmIChzZXQgJiYgY2xyKSB7Cj4gPiAg
ICAgICAgICAgICAgIGdjLT5yZWdfc2V0ID0gc2V0Owo+ID4gICAgICAgICAgICAgICBnYy0+cmVn
X2NsciA9IGNscjsKPiA+IC0gICAgICAgICAgICAgZ2MtPnNldCA9IGJncGlvX3NldF93aXRoX2Ns
ZWFyOwo+ID4gLSAgICAgICAgICAgICBnYy0+c2V0X211bHRpcGxlID0gYmdwaW9fc2V0X211bHRp
cGxlX3dpdGhfY2xlYXI7Cj4gPiArICAgICAgICAgICAgIGdjLT5zZXRfcnYgPSBiZ3Bpb19zZXRf
d2l0aF9jbGVhcjsKPiA+ICsgICAgICAgICAgICAgZ2MtPnNldF9tdWx0aXBsZV9ydiA9IGJncGlv
X3NldF9tdWx0aXBsZV93aXRoX2NsZWFyOwo+ID4gICAgICAgfSBlbHNlIGlmIChzZXQgJiYgIWNs
cikgewo+ID4gICAgICAgICAgICAgICBnYy0+cmVnX3NldCA9IHNldDsKPiA+IC0gICAgICAgICAg
ICAgZ2MtPnNldCA9IGJncGlvX3NldF9zZXQ7Cj4gPiAtICAgICAgICAgICAgIGdjLT5zZXRfbXVs
dGlwbGUgPSBiZ3Bpb19zZXRfbXVsdGlwbGVfc2V0Owo+ID4gKyAgICAgICAgICAgICBnYy0+c2V0
X3J2ID0gYmdwaW9fc2V0X3NldDsKPiA+ICsgICAgICAgICAgICAgZ2MtPnNldF9tdWx0aXBsZV9y
diA9IGJncGlvX3NldF9tdWx0aXBsZV9zZXQ7Cj4gPiAgICAgICB9IGVsc2UgaWYgKGZsYWdzICYg
QkdQSU9GX05PX09VVFBVVCkgewo+ID4gLSAgICAgICAgICAgICBnYy0+c2V0ID0gYmdwaW9fc2V0
X25vbmU7Cj4gPiAtICAgICAgICAgICAgIGdjLT5zZXRfbXVsdGlwbGUgPSBOVUxMOwo+ID4gKyAg
ICAgICAgICAgICBnYy0+c2V0X3J2ID0gYmdwaW9fc2V0X25vbmU7Cj4gPiArICAgICAgICAgICAg
IGdjLT5zZXRfbXVsdGlwbGVfcnYgPSBOVUxMOwo+ID4gICAgICAgfSBlbHNlIHsKPiA+IC0gICAg
ICAgICAgICAgZ2MtPnNldCA9IGJncGlvX3NldDsKPiA+IC0gICAgICAgICAgICAgZ2MtPnNldF9t
dWx0aXBsZSA9IGJncGlvX3NldF9tdWx0aXBsZTsKPiA+ICsgICAgICAgICAgICAgZ2MtPnNldF9y
diA9IGJncGlvX3NldDsKPiA+ICsgICAgICAgICAgICAgZ2MtPnNldF9tdWx0aXBsZV9ydiA9IGJn
cGlvX3NldF9tdWx0aXBsZTsKPiA+ICAgICAgIH0KPiA+Cj4gPiAgICAgICBpZiAoIShmbGFncyAm
IEJHUElPRl9VTlJFQURBQkxFX1JFR19TRVQpICYmCj4gPiBAQCAtNjU0LDcgKzY2Nyw3IEBAIGlu
dCBiZ3Bpb19pbml0KHN0cnVjdCBncGlvX2NoaXAgKmdjLCBzdHJ1Y3QgZGV2aWNlICpkZXYsCj4g
PiAgICAgICB9Cj4gPgo+ID4gICAgICAgZ2MtPmJncGlvX2RhdGEgPSBnYy0+cmVhZF9yZWcoZ2Mt
PnJlZ19kYXQpOwo+ID4gLSAgICAgaWYgKGdjLT5zZXQgPT0gYmdwaW9fc2V0X3NldCAmJgo+ID4g
KyAgICAgaWYgKGdjLT5zZXRfcnYgPT0gYmdwaW9fc2V0X3NldCAmJgo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICEoZmxhZ3MgJiBCR1BJT0ZfVU5SRUFEQUJMRV9SRUdfU0VUKSkKPiA+ICAgICAg
ICAgICAgICAgZ2MtPmJncGlvX2RhdGEgPSBnYy0+cmVhZF9yZWcoZ2MtPnJlZ19zZXQpOwo+ID4K
PiA+Cj4gPiAtLQo+ID4gMi40OC4xCj4gPgo+Cj4gSXNuJ3QgdGhpcyBtaXNzaW5nIHRvIGNvbnZl
cnQgZ2MtPnNldCgpIHRvIGdjLXNldF9ydigpIGluIHNldmVyYWwKPiBwbGFjZXM/Cj4KPiBXaXRo
b3V0IHRoZSBhdHRhY2hlZCBkaWZmIEkgZ2V0IGEgbnVsbCBwb2ludGVyIHJlZmVyZW5jZSBvbiBl
LmcuIHRoZQo+IHNwYWNlbWl0IGsxIGRyaXZlci4KPgoKQWgsIHllcywgc29ycnkgZm9yIHRoaXMg
YW5kIHRoYW5rcyBmb3IgdGhlIGNhdGNoLiBJIHdpbGwgc2VuZCBhIGZvbGxvdy11cC4KCkJhcnRv
c3oKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
