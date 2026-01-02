Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE406FA3748
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jan 2026 13:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	References:MIME-Version:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+eIXE+mYOPinWtMpR3MLW9a3zKPsQIy1amNUE7cZmaY=; b=Jil/dli7XhQTR/oRH1M8sjObEJ
	UAIABLYnkEYhqavApckjHg5Ab3iW3zf3WOvvtaM0kygeCEIianGDisK49Tta7uSu6wNRNl8HNzWtk
	9RYCCsCIRAbCQKyCoZuHCujhtExGIY1MjpnYgPKPk8C/z9iQ7aEB48Ig7Spa6azmPhvUp45R7Z2/B
	qdThNgWQY9duC5k9cwORLZPYXhu3p1nxxS1q+f8FG7St99mR20VjWAUirytXaT9qvHDeub1ri/bvO
	njMHvL3Iz86VSsA44w3eDKsyNC7XtuxaYzCS15rF66WQEaKQZaZYOSeHXyGaf4xlPqVL9tTyMJZFm
	I1WGLvZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbfMA-00000008IkP-1jIj;
	Fri, 02 Jan 2026 13:38:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbfM8-00000008Ik0-0Qhp
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jan 2026 13:38:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86D3A442AA
	for <linux-riscv@lists.infradead.org>; Fri,  2 Jan 2026 13:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3FAC19424
	for <linux-riscv@lists.infradead.org>; Fri,  2 Jan 2026 13:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767361095;
	bh=gq+78Fh/gPAKqoWALmYCs3Wq8SZnDyUWpmAJ14Lfa9M=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=CZJoR2dhd3AvgA42ulIUoDPndc0HhGe2/B0lTkgiorXqXwGPvO1J46zmiD1zATfEF
	 JnmANo/5dpSiK3Ipj//Et47GbCRIWLhKHUXdVMoczQjHSD/IdwILNB0xe4tkulTAW2
	 FCpsVjHYIAfjAx98lQDVVuW8NwT6GtA5nWfR2n4HAeyp9bExaiEfmip/JdYPyZdhnO
	 sYJ0Ig/x5ENnJhEkBxB84BnjAhC3etu+UG926KsZFhBwBEuNxAUrb3aylZTZ4MjypU
	 eU2UB2dOYatljrVaJY7Asy1Wj4avkc8/532VIn0yaz4gQ4Q2oGLTz6+0GTQ9OJCf1Q
	 HYRrk9xTRpZVA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37b99da107cso113897451fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jan 2026 05:38:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJ1NBN9ViFvbnREXNAfKLIoGbUj6bLxFsj4NwhYirX1Y4vgXjRUv0CsJ+YxuG+38+Ubv/kl6H7sWg4hw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNfgindt7X7YBbeurluZILNWisC5bKsu60uchcWIBPBz/g8LUb
	8BJuN7OINdVFlaQvqLEPpqr/RmQxUi6z54VvH5nFpW6gYZc1G+JOZqbUHY/cmhzJOQrnpHzjoAR
	RfhlhsHUiCnH9HLYwBs8TI4a8DtbNGyOhLYpUygkIzA==
X-Google-Smtp-Source: AGHT+IGuDMXwA23bDwSJce/Vd9d45irhKXefXohA/Hh2xht/kdpdJ9akMojcELSe93u+/GpGxclkCRihGnFWklcOYY8=
X-Received: by 2002:a2e:bc18:0:b0:37b:a32b:ed41 with SMTP id
 38308e7fff4ca-381215c5edemr119052751fa.18.1767361093846; Fri, 02 Jan 2026
 05:38:13 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Jan 2026 08:38:12 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Jan 2026 08:38:12 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260102122045-GYA2060493@gentoo.org>
MIME-Version: 1.0
References: <20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org>
 <20251229-02-k3-gpio-v1-2-269e76785abb@gentoo.org> <CAMRc=MfHzP+xm-uX+jad5gPOGDpR23O6mB+xcSvF6ZiZfnxQjg@mail.gmail.com>
 <20260102113643-GYA2060252@gentoo.org> <20260102122045-GYA2060493@gentoo.org>
Date: Fri, 2 Jan 2026 08:38:12 -0500
X-Gmail-Original-Message-ID: <CAMRc=Meq8T_HJwDvf3wm5W2+ZFuHezGjqQx6sj-6HNJhThKjhg@mail.gmail.com>
X-Gm-Features: AQt7F2qd6dFpn0yYdBOT3j_jTKwwJxkbKKmPhd6nOCJ-bhAWcdN7_KfX3YW0ch8
Message-ID: <CAMRc=Meq8T_HJwDvf3wm5W2+ZFuHezGjqQx6sj-6HNJhThKjhg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: spacemit: Add GPIO support for K3 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_053816_200522_877F0267 
X-CRM114-Status: GOOD (  24.46  )
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

T24gRnJpLCAyIEphbiAyMDI2IDEzOjIwOjQ1ICswMTAwLCBZaXh1biBMYW4gPGRsYW5AZ2VudG9v
Lm9yZz4gc2FpZDoKPiBIaSBiYXJ0LAo+Cj4gT24gMTk6MzYgRnJpIDAyIEphbiAgICAgLCBZaXh1
biBMYW4gd3JvdGU6Cj4+IEhpIEJhcnQsCj4+Cj4+IE9uIDEyOjEwIEZyaSAwMiBKYW4gICAgICwg
QmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPj4gPiBPbiBNb24sIERlYyAyOSwgMjAyNSBhdCAx
OjQ34oCvUE0gWWl4dW4gTGFuIDxkbGFuQGdlbnRvby5vcmc+IHdyb3RlOgo+PiA+ID4KPj4gPiA+
IFNwYWNlbWlUIEszIFNvQyBoYXMgY2hhbmdlZCBncGlvIHJlZ2lzdGVyIGxheW91dCB3aGlsZSBj
b21wYXJpbmcKPj4gPiA+IHdpdGggcHJldmlvdXMgZ2VuZXJhdGlvbiwgdGhlIHJlZ2lzdGVyIG9m
ZnNldCBhbmQgYmFuayBvZmZzZXQKPj4gPiA+IG5lZWQgdG8gYmUgYWRqdXN0ZWQsIGludHJvZHVj
ZSBhIGNvbXBhdGlibGUgZGF0YSB0byBleHRlbmQgdGhlCj4+ID4gPiBkcml2ZXIgdG8gc3VwcG9y
dCB0aGlzLgo+PiA+ID4KPj4gPiA+IFNpZ25lZC1vZmYtYnk6IFlpeHVuIExhbiA8ZGxhbkBnZW50
b28ub3JnPgo+PiA+ID4gLS0tCj4+ID4gPiAgZHJpdmVycy9ncGlvL2dwaW8tc3BhY2VtaXQtazEu
YyB8IDE1MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4+ID4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEwNiBpbnNlcnRpb25zKCspLCA0NCBkZWxldGlvbnMoLSkKPj4gPiA+
Cj4+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL2dwaW8tc3BhY2VtaXQtazEuYyBiL2Ry
aXZlcnMvZ3Bpby9ncGlvLXNwYWNlbWl0LWsxLmMKPj4gPiA+IGluZGV4IGViNjZhMTVjMDAyZi4u
MDJjYzVjMTFiNjE3IDEwMDY0NAo+PiA+ID4gLS0tIGEvZHJpdmVycy9ncGlvL2dwaW8tc3BhY2Vt
aXQtazEuYwo+PiA+ID4gKysrIGIvZHJpdmVycy9ncGlvL2dwaW8tc3BhY2VtaXQtazEuYwo+PiA+
ID4gQEAgLTE1LDI4ICsxNSwxOSBAQAo+PiA+ID4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9k
ZXZpY2UuaD4KPj4gPiA+ICAjaW5jbHVkZSA8bGludXgvc2VxX2ZpbGUuaD4KPj4gPiA+Cj4gW3Nu
aXBdLi4uCj4+ID4gPiAgc3RhdGljIHUzMiBzcGFjZW1pdF9ncGlvX2JhbmtfaW5kZXgoc3RydWN0
IHNwYWNlbWl0X2dwaW9fYmFuayAqZ2IpCj4+ID4gPiAgewo+PiA+ID4gICAgICAgICByZXR1cm4g
KHUzMikoZ2IgLSBnYi0+c2ctPnNnYik7Cj4+ID4gPiBAQCAtNjAsMTMgKzcwLDE0IEBAIHN0YXRp
YyB1MzIgc3BhY2VtaXRfZ3Bpb19iYW5rX2luZGV4KHN0cnVjdCBzcGFjZW1pdF9ncGlvX2Jhbmsg
KmdiKQo+PiA+ID4gIHN0YXRpYyBpcnFyZXR1cm5fdCBzcGFjZW1pdF9ncGlvX2lycV9oYW5kbGVy
KGludCBpcnEsIHZvaWQgKmRldl9pZCkKPj4gPiA+ICB7Cj4+ID4gPiAgICAgICAgIHN0cnVjdCBz
cGFjZW1pdF9ncGlvX2JhbmsgKmdiID0gZGV2X2lkOwo+PiA+ID4gKyAgICAgICBzdHJ1Y3Qgc3Bh
Y2VtaXRfZ3BpbyAqc2cgPSBnYi0+c2c7Cj4+ID4gPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgcGVu
ZGluZzsKPj4gPiA+ICAgICAgICAgdTMyIG4sIGdlZHI7Cj4+ID4gPgo+PiA+ID4gLSAgICAgICBn
ZWRyID0gcmVhZGwoZ2ItPmJhc2UgKyBTUEFDRU1JVF9HRURSKTsKPj4gPiA+ICsgICAgICAgZ2Vk
ciA9IHJlYWRsKGdiLT5iYXNlICsgdG9fc3BhY2VtaXRfZ3Bpb19yZWdzKHNnKS0+Z2Vkcik7Cj4+
ID4KPj4gPiBTaW5jZSB5b3UncmUgYWxyZWFkeSB0b3VjaGluZyBhbGwgdGhlc2UgcmVnaXN0ZXIg
YWNjZXNzZXMgLSBjYW4geW91Cj4+ID4gbWF5YmUgcHJvdmlkZSBkZWRpY2F0ZWQgd3JhcHBlciBm
dW5jdGlvbnMgYXJvdW5kIHJlYWRsKCkvd3JpdGVsKCkgYW5kCj4+ID4gYXZvaWQgYW55IGZpbGUt
d2lkZSBjaGFuZ2VzIGluIHRoZSBmdXR1cmUgaWYgYW55dGhpbmcgcmVxdWlyZXMgZnVydGhlcgo+
PiA+IG1vZGlmaWNhdGlvbj8KPj4gPgo+PiBjYW4geW91IGVsYWJvcmF0ZSBhIGJpdCBmdXJ0aGVy
IG9uIHRoaXM/Cj4+IEkgZG9uJ3QgZ2V0IGhvdyBhIHdyYXBwZXIgaGVscGVyIGNvdWxkIGhlbHAg
dG8gYXZvaWQgZmlsZS13aWRlIGNoYW5nZXMuLgo+Pgo+IGhlcmUgaXMgbXkgYXR0ZW1wdCB0byBz
b2x2ZSB0aGlzLCBkZWZpbmUgYSBtYWNybyB0byByZWdpc3RlciBhZGRyZXNzOgo+Cj4gI2RlZmlu
ZSB0b19zcGFjZW1pdF9ncGlvX3JlZ3MoZ2IpICgoZ2IpLT5zZy0+ZGF0YS0+cmVnX29mZnNldHMp
Cj4KPiAjZGVmaW5lIFNQQUNFTUlUX0dFRFIoZ2IpICAgICAgKChnYiktPmJhc2UgKyB0b19zcGFj
ZW1pdF9ncGlvX3JlZ3MoZ2IpLT5nZWRyKQo+Cj4gCWdlZHIgPSByZWFkbChTUEFDRU1JVF9HRURS
KGdiKSk7Cj4KPiBwbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhpcyBmb2xsb3cgeW91ciBzdWdnZXN0
aW9uIG9yIG5vdAo+Cj4gLS0KPiBZaXh1biBMYW4gKGRsYW4pCj4KCkkgd2FzIHRoaW5raW5nIG1v
cmUgb2Ygc29tZXRoaW5nIGxpa2UgdGhpczoKCmVudW0gc3BhY2VtaXRfZ3Bpb19yZWdpc3RlcnMg
ewoJU1BBQ0VNSVRfR1BMUiwKCVNQQUNFTUlUX0dQRFIsCgkuLi4KfTsKCnN0YXRpYyBjb25zdCB1
bnNpZ25lZCBpbnQgc3BhY2VtaXRfZ3Bpb19rMV9vZmZzZXRzID0gewoJW1NQQUNFTUlUX0dQTFJd
ID0gMHgwMCwKCVtTUEFDRU1JVF9HUERSXSA9IDB4MGMsCgkuLi4KfTsKCnN0YXRpYyBjb25zdCB1
bnNpZ25lZCBpbnQgc3BhY2VtaXRfZ3Bpb19rM19vZmZzZXRzID0gLi4uCgpzdHJ1Y3Qgc3BhY2Vt
aXRfZ3Bpb19kYXRhIHsKCWNvbnN0IHVuc2lnbmVkIGludCAqb2Zmc2V0czsKCXUzMiBiYW5rX29m
ZnNldHNbNF07Cn07CgpzdGF0aWMgdm9pZCBzcGFjZW1pdF9ncGlvX3dyaXRlKHN0cnVjdCBzcGFj
ZW1pdF9ncGlvX2JhbmsgKmdiLAoJCQkJZW51bSBzcGFjZW1pdF9ncGlvX3JlZ2lzdGVycyByZWcs
IHUzMiB2YWwpCnsKCXdyaXRlbCh2YWwsIGdiLT5iYXNlICsgZ2ItPmRhdGEtPm9mZnNldHNbcmVn
XSk7Cn0KCkJhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
