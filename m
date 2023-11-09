Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A915C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 07:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y2E77D09ZAeX18Xn1R7lHEk9DkHHthT+TjhO1IxSgZY=; b=XiwWn8LEcgIlj/
	YrqbNE2jsRtdOTJnk6DZs+ouDysIUUJcMjJSar9vbMfPH6IyDMwo0SJtX5pazmDx+J/uclLoL90Wq
	97RsEu8byT6OxPkvHcyDKueeW8jGzOR848G9yxMNhMYsgVYOzApqkAYj+IBAsz/43CJV2DS109/xf
	iSJfrzuGP2ZE9ocBAI2tY42MSJ1E0z/3A9rnAh4CbGd6nBC+bsjBzrAoQRK18/stt+56rqGNPLmQf
	hc4J+xigyp4EdErd90Xg0bgO77koATPVMPsZQ/ATX7PYuOSLt6C7C6AD0CIONm+viDlGxu3C08vPg
	ndhD3HpRmKd333H1QTDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0z3j-005SyI-39;
	Thu, 09 Nov 2023 07:02:35 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0z3g-005Sv3-3B
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 07:02:34 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-da077db5145so586208276.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Nov 2023 23:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1699513350; x=1700118150; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FoLz//LH1CjVmWy0eAZ6OsQtm1+A5S0uKqoA43bqdiA=;
        b=hdT3EvJKLoiipKHPiR7AQPIDvIZLh27VXbXgxRB5aKxdKEytP5SfpJJyvD4gruxApx
         T8xTdTSnHg/AVON7f1ZnS6daI3EF4qO9tF3cKLkoUDIN/qIFLCX+SoFyrstq83h1XS/c
         hOW6BajDHoHqbptYCOGZAlOI1DsrAtGW2uK3yLNLI7S6MMPuzN/xoyAUpWcW3/iybQpw
         ygWCngaMP9PblW6cXdxhbToRx25gQJ5mYrgxZzTodFRs68rGC/mSUkg4UZhtxyScq9UZ
         iBB4Rucu8+nm6Xo5q+MttpJ33rMH+3wp0YFT/LcptcDC3XfZ+Cl/ESOmKAxXCbEgkp11
         azhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699513350; x=1700118150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FoLz//LH1CjVmWy0eAZ6OsQtm1+A5S0uKqoA43bqdiA=;
        b=Hd165kGKZ1ZxmVqg204W/jPeM/WKh943qUGRbY1YJ+CaNaRE2GmOLY7ESWxV5VTQ+A
         kZOCcysqvwfLWBoQrBursCvrdhFDYVOonh6Jv45D/pieHn7ux4MRcKq05dnNH0tvU7ur
         ywXfBoB4BLswsrTVUeZpT0Bl/iNKdss4FVFJAqpNgZRZ4Fg6LJAJAkay1VojbWh5Dcjr
         MSKwXwXXo2JbqOYPZdwo4P+9f0bPbCyPH1TRVH4t8ZJNCaEfuPuN+8YTXEUo8uRSnhWT
         z+aAEbmcnhAiv1UwgkOAN//7Pk+7WHwtJTfteU2OFCPIuDNrwxPbdxE6T7Cy9Ie+yU0a
         44Yg==
X-Gm-Message-State: AOJu0Ywv9DswzzLR/z/TO9Vo4bNwckmQYPUn28rujc7upV1NEHbCh+9W
	f1dCoE67mzk5dtBI6X6J1UoR8oV5yu5ftTVQ4TIByQ==
X-Google-Smtp-Source: AGHT+IE8BBe1spx8hqF4fLpehhdYAM3HZKZD6rH75vUkL6sQG9EjJs+CVFPxWIJCWp5BEcf+mXPhNKGZGdoG3oWQXio=
X-Received: by 2002:a25:2396:0:b0:d86:5a8d:6e34 with SMTP id
 j144-20020a252396000000b00d865a8d6e34mr3697289ybj.29.1699513349774; Wed, 08
 Nov 2023 23:02:29 -0800 (PST)
MIME-Version: 1.0
References: <20231024101902.6689-1-nylon.chen@sifive.com> <20231024101902.6689-3-nylon.chen@sifive.com>
In-Reply-To: <20231024101902.6689-3-nylon.chen@sifive.com>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Thu, 9 Nov 2023 15:02:18 +0800
Message-ID: <CAHh=Yk_i-tH-n_5wuwp6H8QRu3cZovkukDzMbeUZrgiih46V8g@mail.gmail.com>
Subject: Re: [v5 2/2] pwm: sifive: change the PWM controlled LED algorithm
To: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, 
	emil.renner.berthing@canonical.com, vincent.chen@sifive.com
Cc: greentime.hu@sifive.com, zong.li@sifive.com, nylon7717@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_230233_061133_EC7F4FD1 
X-CRM114-Status: GOOD (  16.16  )
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

SGksIFBpbmcgb24gdGhlIHNlcmllcy4KClV3ZSwgaXMgdGhlcmUgYW55dGhpbmcgbW9yZSBJIGNh
biBkbyB0byBwdXNoIHRoZSBwcm9jZXNzIGZvcndhcmQ/CgpOeWxvbiBDaGVuIDxueWxvbi5jaGVu
QHNpZml2ZS5jb20+IOaWvCAyMDIz5bm0MTDmnIgyNOaXpSDpgLHkuowg5LiL5Y2INjoxOeWvq+mB
k++8mgoKPgo+IFRoZSBgZnJhY2AgdmFyaWFibGUgcmVwcmVzZW50cyB0aGUgcHVsc2UgaW5hY3Rp
dmUgdGltZSwgYW5kIHRoZSByZXN1bHQKPiBvZiB0aGlzIGFsZ29yaXRobSBpcyB0aGUgcHVsc2Ug
YWN0aXZlIHRpbWUuIFRoZXJlZm9yZSwgd2UgbXVzdCByZXZlcnNlIHRoZSByZXN1bHQuCj4KPiBU
aGUgcmVmZXJlbmNlIGlzIFNpRml2ZSBGVTc0MC1DMDAwIE1hbnVhbFswXQo+Cj4gTGluazogaHR0
cHM6Ly9zaWZpdmUuY2RuLnByaXNtaWMuaW8vc2lmaXZlLzFhODJlNjAwLTFmOTMtNGY0MS1iMmQ4
LTg2ZWQ4YjE2YWNiYV9mdTc0MC1jMDAwLW1hbnVhbC12MXA2LnBkZiBbMF0KPgo+IFNpZ25lZC1v
ZmYtYnk6IE55bG9uIENoZW4gPG55bG9uLmNoZW5Ac2lmaXZlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L3B3bS9wd20tc2lmaXZlLmMgfCAxMCArKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20v
cHdtLXNpZml2ZS5jIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCj4gaW5kZXggZWFiZGRiN2M3
ODIwLi4zNTNjMjM0MmZiZjEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5j
Cj4gKysrIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCj4gQEAgLTEwMSw3ICsxMDEsNyBAQCBz
dGF0aWMgdm9pZCBwd21fc2lmaXZlX3VwZGF0ZV9jbG9jayhzdHJ1Y3QgcHdtX3NpZml2ZV9kZGF0
YSAqZGRhdGEsCj4KPiAgICAgICAgIC8qIEFzIHNjYWxlIDw9IDE1IHRoZSBzaGlmdCBvcGVyYXRp
b24gY2Fubm90IG92ZXJmbG93LiAqLwo+ICAgICAgICAgbnVtID0gKHVuc2lnbmVkIGxvbmcgbG9u
ZylOU0VDX1BFUl9TRUMgPDwgKFBXTV9TSUZJVkVfQ01QV0lEVEggKyBzY2FsZSk7Cj4gLSAgICAg
ICBkZGF0YS0+cmVhbF9wZXJpb2QgPSBkaXY2NF91bChudW0sIHJhdGUpOwo+ICsgICAgICAgZGRh
dGEtPnJlYWxfcGVyaW9kID0gRElWX1JPVU5EX1VQX1VMTChudW0sIHJhdGUpOwo+ICAgICAgICAg
ZGV2X2RiZyhkZGF0YS0+Y2hpcC5kZXYsCj4gICAgICAgICAgICAgICAgICJOZXcgcmVhbF9wZXJp
b2QgPSAldSBuc1xuIiwgZGRhdGEtPnJlYWxfcGVyaW9kKTsKPiAgfQo+IEBAIC0xMjEsMTMgKzEy
MSwxNCBAQCBzdGF0aWMgaW50IHB3bV9zaWZpdmVfZ2V0X3N0YXRlKHN0cnVjdCBwd21fY2hpcCAq
Y2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKPiAgICAgICAgICAgICAgICAgc3RhdGUtPmVu
YWJsZWQgPSBmYWxzZTsKPgo+ICAgICAgICAgc3RhdGUtPnBlcmlvZCA9IGRkYXRhLT5yZWFsX3Bl
cmlvZDsKPiArCj4gKyAgICAgICBkdXR5ID0gKDFVIDw8IFBXTV9TSUZJVkVfQ01QV0lEVEgpIC0g
MSAtIGR1dHk7Cj4gICAgICAgICBzdGF0ZS0+ZHV0eV9jeWNsZSA9Cj4gICAgICAgICAgICAgICAg
ICh1NjQpZHV0eSAqIGRkYXRhLT5yZWFsX3BlcmlvZCA+PiBQV01fU0lGSVZFX0NNUFdJRFRIOwo+
IC0gICAgICAgc3RhdGUtPnBvbGFyaXR5ID0gUFdNX1BPTEFSSVRZX0lOVkVSU0VEOwo+ICsgICAg
ICAgc3RhdGUtPnBvbGFyaXR5ID0gUFdNX1BPTEFSSVRZX05PUk1BTDsKPgo+ICAgICAgICAgcmV0
dXJuIDA7Cj4gIH0KPiAtCj4gIHN0YXRpYyBpbnQgcHdtX3NpZml2ZV9hcHBseShzdHJ1Y3QgcHdt
X2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IHN0cnVjdCBwd21fc3RhdGUgKnN0YXRlKQo+ICB7Cj4gQEAgLTEzOSw3
ICsxNDAsNyBAQCBzdGF0aWMgaW50IHB3bV9zaWZpdmVfYXBwbHkoc3RydWN0IHB3bV9jaGlwICpj
aGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAo+ICAgICAgICAgaW50IHJldCA9IDA7Cj4gICAg
ICAgICB1MzIgZnJhYzsKPgo+IC0gICAgICAgaWYgKHN0YXRlLT5wb2xhcml0eSAhPSBQV01fUE9M
QVJJVFlfSU5WRVJTRUQpCj4gKyAgICAgICBpZiAoc3RhdGUtPnBvbGFyaXR5ICE9IFBXTV9QT0xB
UklUWV9OT1JNQUwpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Cj4gICAgICAg
ICBjdXJfc3RhdGUgPSBwd20tPnN0YXRlOwo+IEBAIC0xNTgsNiArMTU5LDcgQEAgc3RhdGljIGlu
dCBwd21fc2lmaXZlX2FwcGx5KHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZp
Y2UgKnB3bSwKPiAgICAgICAgIG51bSA9ICh1NjQpZHV0eV9jeWNsZSAqICgxVSA8PCBQV01fU0lG
SVZFX0NNUFdJRFRIKTsKPiAgICAgICAgIGZyYWMgPSBESVY2NF9VNjRfUk9VTkRfQ0xPU0VTVChu
dW0sIHN0YXRlLT5wZXJpb2QpOwo+ICAgICAgICAgLyogVGhlIGhhcmR3YXJlIGNhbm5vdCBnZW5l
cmF0ZSBhIDEwMCUgZHV0eSBjeWNsZSAqLwo+ICsgICAgICAgZnJhYyA9ICgxVSA8PCBQV01fU0lG
SVZFX0NNUFdJRFRIKSAtIDEgLSBmcmFjOwo+ICAgICAgICAgZnJhYyA9IG1pbihmcmFjLCAoMVUg
PDwgUFdNX1NJRklWRV9DTVBXSURUSCkgLSAxKTsKPgo+ICAgICAgICAgbXV0ZXhfbG9jaygmZGRh
dGEtPmxvY2spOwo+IC0tCj4gMi40Mi4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
