Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AD8C48BF8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 13:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iI/Il+iSA9Afc02kY/mbPzDMqP40giDb8/baa/rSDNk=; b=uzmF3ySLgPAP8N
	H6RXw3huSj1Mdkc+KV9gBow1AGJ7URbUPTwXxnmXlhPBF5xlMk/MIMLZirkEcR6Yuv2bgaVVa1FCd
	4aR5Me2MzquYTCVU79IzCHrVFURQTRf2TFo5r/tHxXvBJ1bqLTSRfVme5YVta5wR8eiYp6sVv0yrm
	2Wk2MCw7YBnBd/1mZ5ztM1i5C38kzFYZxTooc3aoLOw+UQFQV1jYWZ0xa3lVb1jYX1692yq0RjkUH
	kY6DK1qFf8RCiqs1fogWmCpvqc4+XIm8Ebjc/LmbCqdiiIGrA3iktI3OE3SLO3P0sIHf1COPRk21P
	0CQ4Ms4XWcLyyTzKlZyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd9Nj-000000055WR-1qEf;
	Thu, 22 Feb 2024 13:44:59 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd9Nf-000000055Ua-2rOh
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 13:44:58 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-36517cfd690so5064445ab.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 05:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1708609494; x=1709214294; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EswbuaXlWdyWvQSXByNFyyCNmlubm5it++fspmdd4Cs=;
        b=RJLzNrlQW0tbhaw46MM76Gra4nyFzm0aHRhdOzPiI1nD6iir0YJIeMqPWTwdpTMjhR
         Xca5QI3pluDqeVO0hR7NmVipq6zmHFMRO/YT2PsCrflk0b9Y5V56ISgDja3nK46Ei3zk
         NnsPLWqfbgFmJ78pDrOo0u23Jxe1DNz5Da+/DWzCgYxlGusXZ95JsjGtTIQjgec+IIsA
         zO86YlcUSEP9utt97wa7H/GBH9mdzqoqvsrLP5aC6MVN4P+krAI3Jl+cwoCMWYF6KqXL
         w1RsBvmATHY/opNlDBqsd+3udJWPPa3gLVuNqDL0QJEgasaJ6gCaQX69Mpmf72z4mLna
         7XZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708609494; x=1709214294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EswbuaXlWdyWvQSXByNFyyCNmlubm5it++fspmdd4Cs=;
        b=f0Y/XzHnyuL3SQIJsCL8SF1nPZ7S8WqKamR9bHMqNrdUn6jJrnYbl27KI2+5R+WZ3x
         Y+AR0hScQhK5AfpTCGMfnFOALrWnAaWzn3q2cASkSSNRxudq8AhBx+mBdc1X/N2wTabB
         oWrJlqC9llpaaqoHO4vyRSH5vUYOf9hTSZtblgOe+BllmW/8NGvuwIGYfJH+1463B3mM
         0rdLwMOUNi24qc/I/m2YS7QWJSSgwb0g5fcjbe6ZNt8DkaUZquzKHSpI7KBPUtmo+Hma
         R3CzDcxEwBeMyZ9KwtEHb2c4Lpok4DfzTSok3SE2DVfZkLUULyoX4HUEaWbTXF3B3wV6
         T/tg==
X-Forwarded-Encrypted: i=1; AJvYcCXw/AKEUpL7eZktO0o1HxsuR/Xofz+ezNt7ZRvJC6XsOXsDd10AxgP6M0kU0Jeu/OE68A79Lp2AazPzX2dlfTqavH9qoQ9nxMGQKhoynKzB
X-Gm-Message-State: AOJu0YwtTqnNiQCH5fiZ9qm9u7BLzzFs8VBxW8A5B9JgKgfCkJgbWfwz
	FoQQc5xsQ1WQ74n3jjsw7ZrBcNT+CXdn9mdfKJu+A1I3sGpg/x9ZTe10644TVylQyDb8vkKKtoK
	n3iudWUjQD7uze5eNM4NhSR1GTulur7vj+X0nKQ==
X-Google-Smtp-Source: AGHT+IGuwVUGIA/rJKeevzNlSfij9OPuE8wC6KsD+yqt5T+6uRdLRzE93C4Sp7zGIDWKgMwGatjwI7z3VqvOQwS6888=
X-Received: by 2002:a92:d981:0:b0:365:1035:83ab with SMTP id
 r1-20020a92d981000000b00365103583abmr18164814iln.32.1708609494485; Thu, 22
 Feb 2024 05:44:54 -0800 (PST)
MIME-Version: 1.0
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
 <20240222094006.1030709-13-apatel@ventanamicro.com> <87jzmwtzbs.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87jzmwtzbs.fsf@all.your.base.are.belong.to.us>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Feb 2024 19:14:43 +0530
Message-ID: <CAAhSdy1V5yqO3kqs7+wOb34oSDgdo=QRT-i2XG+okFtHTgyMrQ@mail.gmail.com>
Subject: Re: [PATCH v14 12/18] irqchip/riscv-imsic: Add device MSI domain
 support for platform devices
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_054455_753736_A9C065C6 
X-CRM114-Status: GOOD (  22.75  )
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

T24gVGh1LCBGZWIgMjIsIDIwMjQgYXQgNjo0NeKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+
IHdyaXRlczoKPgo+ID4gVGhlIExpbnV4IHBsYXRmb3JtIE1TSSBzdXBwb3J0IGFsbG93cyBwZXIt
ZGV2aWNlIE1TSSBkb21haW5zIHNvIGFkZAo+ID4gYSBwbGF0Zm9ybSBpcnFjaGlwIGRyaXZlciBm
b3IgUklTQy1WIElNU0lDIHdoaWNoIHByb3ZpZGVzIGEgYmFzZSBJUlEKPiA+IGRvbWFpbiB3aXRo
IE1TSSBwYXJlbnQgc3VwcG9ydCBmb3IgcGxhdGZvcm0gZGV2aWNlIGRvbWFpbnMuCj4gPgo+ID4g
VGhlIElNU0lDIHBsYXRmb3JtIGRyaXZlciBhc3N1bWVzIHRoYXQgdGhlIElNU0lDIHN0YXRlIGlz
IGFscmVhZHkKPiA+IGluaXRpYWxpemVkIGJ5IHRoZSBJTVNJQyBlYXJseSBkcml2ZXIuCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4g
PiAtLS0KPiA+ICBkcml2ZXJzL2lycWNoaXAvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgfCAg
IDIgKy0KPiA+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLmMgfCAz
NDQgKysrKysrKysrKysrKysrKysrKysrCj4gPiAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1p
bXNpYy1zdGF0ZS5oICAgIHwgICAxICsKPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDM0NiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaXJx
Y2hpcC9pcnEtcmlzY3YtaW1zaWMtcGxhdGZvcm0uYwo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2lycWNoaXAvTWFrZWZpbGUgYi9kcml2ZXJzL2lycWNoaXAvTWFrZWZpbGUKPiA+IGluZGV4
IGQ3MTQ3MjQzODdjZS4uYWJjYTQ0NWEzMjI5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9pcnFj
aGlwL01ha2VmaWxlCj4gPiArKysgYi9kcml2ZXJzL2lycWNoaXAvTWFrZWZpbGUKPiA+IEBAIC05
NSw3ICs5NSw3IEBAIG9iai0kKENPTkZJR19RQ09NX01QTSkgICAgICAgICAgICAgICAgICAgICAg
Kz0gaXJxLXFjb20tbXBtLm8KPiA+ICBvYmotJChDT05GSUdfQ1NLWV9NUElOVEMpICAgICAgICAg
ICAgKz0gaXJxLWNza3ktbXBpbnRjLm8KPiA+ICBvYmotJChDT05GSUdfQ1NLWV9BUEJfSU5UQykg
ICAgICAgICAgKz0gaXJxLWNza3ktYXBiLWludGMubwo+ID4gIG9iai0kKENPTkZJR19SSVNDVl9J
TlRDKSAgICAgICAgICAgICArPSBpcnEtcmlzY3YtaW50Yy5vCj4gPiAtb2JqLSQoQ09ORklHX1JJ
U0NWX0lNU0lDKSAgICAgICAgICAgICs9IGlycS1yaXNjdi1pbXNpYy1zdGF0ZS5vIGlycS1yaXNj
di1pbXNpYy1lYXJseS5vCj4gPiArb2JqLSQoQ09ORklHX1JJU0NWX0lNU0lDKSAgICAgICAgICAg
ICs9IGlycS1yaXNjdi1pbXNpYy1zdGF0ZS5vIGlycS1yaXNjdi1pbXNpYy1lYXJseS5vIGlycS1y
aXNjdi1pbXNpYy1wbGF0Zm9ybS5vCj4gPiAgb2JqLSQoQ09ORklHX1NJRklWRV9QTElDKSAgICAg
ICAgICAgICs9IGlycS1zaWZpdmUtcGxpYy5vCj4gPiAgb2JqLSQoQ09ORklHX0lNWF9JUlFTVEVF
UikgICAgICAgICAgICs9IGlycS1pbXgtaXJxc3RlZXIubwo+ID4gIG9iai0kKENPTkZJR19JTVhf
SU5UTVVYKSAgICAgICAgICAgICArPSBpcnEtaW14LWludG11eC5vCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1wbGF0Zm9ybS5jIGIvZHJpdmVycy9pcnFj
aGlwL2lycS1yaXNjdi1pbXNpYy1wbGF0Zm9ybS5jCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5lMjM0NGZjMDhkY2EKPiA+IC0tLSAvZGV2L251bGwKPiA+
ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtcGxhdGZvcm0uYwo+ID4gQEAg
LTAsMCArMSwzNDQgQEAKPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+
ID4gKy8qCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDIxIFdlc3Rlcm4gRGlnaXRhbCBDb3Jwb3Jh
dGlvbiBvciBpdHMgYWZmaWxpYXRlcy4KPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjIgVmVudGFu
YSBNaWNybyBTeXN0ZW1zIEluYy4KPiA+ICsgKi8KPiA+ICsKPiA+ICsjZGVmaW5lIHByX2ZtdChm
bXQpICJyaXNjdi1pbXNpYzogIiBmbXQKPiA+ICsjaW5jbHVkZSA8bGludXgvYml0bWFwLmg+Cj4g
PiArI2luY2x1ZGUgPGxpbnV4L2NwdS5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQu
aD4KPiA+ICsjaW5jbHVkZSA8bGludXgvaW8uaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvaXJxLmg+
Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2lycWNoaXAuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvaXJx
ZG9tYWluLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ID4gKyNpbmNsdWRlIDxs
aW51eC9tc2kuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gPiAr
I2luY2x1ZGUgPGxpbnV4L3NwaW5sb2NrLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3NtcC5oPgo+
ID4gKwo+ID4gKyNpbmNsdWRlICJpcnEtcmlzY3YtaW1zaWMtc3RhdGUuaCIKPiA+ICsKPiA+ICtz
dGF0aWMgYm9vbCBpbXNpY19jcHVfcGFnZV9waHlzKHVuc2lnbmVkIGludCBjcHUsIHVuc2lnbmVk
IGludCBndWVzdF9pbmRleCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBoeXNf
YWRkcl90ICpvdXRfbXNpX3BhKQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBpbXNpY19nbG9iYWxf
Y29uZmlnICpnbG9iYWw7Cj4gPiArICAgICBzdHJ1Y3QgaW1zaWNfbG9jYWxfY29uZmlnICpsb2Nh
bDsKPiA+ICsKPiA+ICsgICAgIGdsb2JhbCA9ICZpbXNpYy0+Z2xvYmFsOwo+ID4gKyAgICAgbG9j
YWwgPSBwZXJfY3B1X3B0cihnbG9iYWwtPmxvY2FsLCBjcHUpOwo+ID4gKwo+ID4gKyAgICAgaWYg
KEJJVChnbG9iYWwtPmd1ZXN0X2luZGV4X2JpdHMpIDw9IGd1ZXN0X2luZGV4KQo+ID4gKyAgICAg
ICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiArCj4gPiArICAgICBpZiAob3V0X21zaV9wYSkKPiA+
ICsgICAgICAgICAgICAgKm91dF9tc2lfcGEgPSBsb2NhbC0+bXNpX3BhICsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAoZ3Vlc3RfaW5kZXggKiBJTVNJQ19NTUlPX1BBR0VfU1opOwo+
Cj4gTml0OiBBbmQgb25lIG1vcmUgcmVkdW5kYW50IHBhcmVudGhlc2lzIGFuZCAxMDAgY2hhciEg
Oy0pCgpBaGgsIEkgbWlzc2VkIHVwZGF0aW5nIHRoaXMgbGluZS4gSSB3aWxsIHVwZGF0ZSBpbiB0
aGUgbmV4dCByZXZpc2lvbi4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
