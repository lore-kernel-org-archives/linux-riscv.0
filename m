Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DB5C54E65
	for <linux-riscv@archiver.kernel.org>; Wed, 21 May 2025 11:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RgipZUeXDxcfya1ExYm6OvnZIS0JYNs3ylIxNThUMw0=; b=sAPO5ADOoWGf4x
	C2VNtQvTRxVF5hFkpPI6L1b/adPuDLNxM2Id9UEZB8+Kmaq9fyX1NiUcFPnYJM1KD66mf+iz6ObN5
	Kejg1i1I47y1h8h96zmkQnuUzj+7+OrZ50QH0DweM4IRChR9PNBK+/B9c5YPeSd0FgjqI1OHiZ1dx
	EY+wGMsTzJKnmLJEYhrNeOk6U8pZaueDfIOQeYSdm0XYrVrShP5rDEH/QaccZCSZ79gSF0n94Swqc
	8SH6XxkeneoMl2i21DfO7Hd/PFkg8ffb6Y1eSrq+BGd9OfLJS+TiltAouVhcsn6Xhz74P/PzIpz6N
	HPCwtyJGhqnKqC7GfV/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhlC-0000000Fe1n-1doF;
	Wed, 21 May 2025 11:37:22 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhlA-0000000Fe1K-1rtF
	for linux-riscv@lists.infradead.org;
	Wed, 21 May 2025 11:37:21 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-551ed0038a0so4667506e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 May 2025 04:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747827438; x=1748432238; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bq2unRbgv/HFo6D86aX5CmiwTp0UijkhqdpWvEJewKM=;
        b=EI4/wNzOU0lcUzEpvm+3HzYXMiBgg0AdWVw33IqXL7KcHcJIlDn86NO243nXuJNS/g
         7vPFcT9RY3zj+Ck1QnbyVfSJHjBwAVdRwpfXJ8xM6nfKEteF+WyUXJZDzM2nOMXC7j1I
         DxehQmtZm2cRiPDymZFYIkO1ddjUg1DwFMf526T1FV9llMmjSMxNlfDmW/9YwezGJZ7v
         4yqJ3U/mIDt4bQzTIuG+d1QJwY+uc+RHXfXleQ1FRn7ahjlKpnqLRBc+fMY6HpR6Quha
         Gafj89rV+VRdyS6ST6syd2XkaviMpjWg05I2ScDFB5rBM22pnqp11PJs1ulPxRacc3iL
         2soA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747827438; x=1748432238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bq2unRbgv/HFo6D86aX5CmiwTp0UijkhqdpWvEJewKM=;
        b=pTP68sTXwp/k5C/hUO65WPK5wTWwQ5YgTSruqcCsf94wGQ66FaDxZpqYlRI1WICLWa
         fOb1ITnuOEGswjpEnNPXrVSMR9qhH2lkx/UURXYgKYxjXV85ymjHpUEWWYgIyb00tzZ+
         V4/2Ne4Rut1BKu3SB1PZxzHtyJByLBLeV9Q/Mu/hix8GkE1b5bnu0AFFgZWzSL/6cohC
         5QaDWI23nGaYUN4o1V1k5e2+X1XWiFu9nwdR+Dkk4/ovMlnb3rT/VOzLYUqVIx9lgVMP
         3c2s/FnZJ02WpuAfRJQSjUWJQj7QkNMh0kPhHpLH9R7cev88CpbcQ8M4Mg6kgE3cho3W
         /DDw==
X-Forwarded-Encrypted: i=1; AJvYcCVNWfZeINMK2Tok+VkzFnY+p8oZW/CEc3oIjZQxhVBMT4BvrDsNOwClrlNBQZ8UBoDUIbyzkVGIMzT9yw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXK0FEe++df6VeN7lmI6iFHba2RMRLfy7RR0Xm8RS8jDFV8b8o
	8QzhhFDZgg1Y0M9USnxyETV+WwF96MOaxJV+iOTtuNK1TTgDTqsyUh9ZMaJ5ltOWeVTl7DBf8X8
	pijasMSeanPxo1trX/CBw0Gw5Prlo+wkFIwP5bac85g==
X-Gm-Gg: ASbGncu4bg8wmJhEc0wGahd4Hx0JbsJvAEQ1hLFXBaY4pKX1dtK61i42uZA2AaJPe5c
	umi2Ib5/ONY7uJCb4e7AV0UnT4PsFW/uvw5zdQqBrvSz4KThFQkLIiwZSe8ANrX3BN8rQbRE7Dx
	5m+p+glhk96OsslYj+VBge6Aypo9RYrsdjtV790LMmnBbi
X-Google-Smtp-Source: AGHT+IEfFRJ1uCRuqmP4owkMAUn9fjXR/6fk30LYXalgtbRk3jIERMhcf1RDrfIEzlwpn6xl8q47m+FQo99BZm7P7qM=
X-Received: by 2002:a05:6512:22d1:b0:550:f012:96a with SMTP id
 2adb3069b0e04-550f0120cdbmr4068337e87.20.1747827438295; Wed, 21 May 2025
 04:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-14-apatel@ventanamicro.com> <aCGaKXOOWyM4JQMg@smile.fi.intel.com>
In-Reply-To: <aCGaKXOOWyM4JQMg@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 21 May 2025 17:07:05 +0530
X-Gm-Features: AX0GCFvNwxTxwAgZLci2dmWWitFjI2kQU-baZRFrggBnWcQZjGdOl85COFKoeDQ
Message-ID: <CAK9=C2U1rzSa42qMNqxfTtjAC5RiJrhwg_32_B86nT2+xJ4Qow@mail.gmail.com>
Subject: Re: [PATCH v3 13/23] irqchip: Add driver for the RPMI system MSI
 service group
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_043720_488706_2C8B3FF7 
X-CRM114-Status: GOOD (  34.78  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXkgMTIsIDIwMjUgYXQgMTI6MjDigK9QTSBBbmR5IFNoZXZjaGVua28KPGFuZHJp
eS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBTdW4sIE1heSAxMSwg
MjAyNSBhdCAwNzowOToyOVBNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gVGhlIFJQTUkg
c3BlY2lmaWNhdGlvbiBkZWZpbmVzIGEgc3lzdGVtIE1TSSBzZXJ2aWNlIGdyb3VwIHdoaWNoCj4g
PiBhbGxvd3MgYXBwbGljYXRpb24gcHJvY2Vzc29ycyB0byByZWNlaXZlIE1TSXMgdXBvbiBzeXN0
ZW0gZXZlbnRzCj4gPiBzdWNoIGFzIGdyYWNlZnVsIHNodXRkb3duL3JlYm9vdCByZXF1ZXN0LCBD
UFUgaG90cGx1ZyBldmVudCwgbWVtb3J5Cj4gPiBob3RwbHVnIGV2ZW50LCBldGMuCj4gPgo+ID4g
QWRkIGFuIGlycWNoaXAgZHJpdmVyIGZvciB0aGUgUklTQy1WIFJQTUkgc3lzdGVtIE1TSSBzZXJ2
aWNlIGdyb3VwCj4gPiB0byBkaXJlY3RseSByZWNlaXZlIHN5c3RlbSBNU0lzIGluIExpbnV4IGtl
cm5lbC4KPgo+IC4uLgo+Cj4gPiArLyoKPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjUgVmVudGFu
YSBNaWNybyBTeXN0ZW1zIEluYy4KPiA+ICsgKi8KPgo+IEl0IGNhbiBvY2N1cHkgYSBzaW5nbGUg
bGluZSBpbnN0ZWFkIG9mIDMgTG9Dcy4KCk9rYXksIEkgd2lsbCB1cGRhdGUuCgo+Cj4gLi4uCj4K
PiA+ICsjaW5jbHVkZSA8bGludXgvYml0ZmllbGQuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvYml0
b3BzLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2NwdS5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9p
bnRlcnJ1cHQuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvaXJxY2hpcC5oPgo+ID4gKyNpbmNsdWRl
IDxsaW51eC9tYWlsYm94X2NsaWVudC5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9tYWlsYm94L3Jp
c2N2LXJwbWktbWVzc2FnZS5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiA+ICsj
aW5jbHVkZSA8bGludXgvbXNpLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L29mX2lycS5oPgo+ID4g
KyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgv
cHJpbnRrLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3NtcC5oPgo+Cj4gKyB0eXBlcy5oCj4KPiBB
Y3R1YWxseSB0aGlzIG9uZSBpcyBtb3N0IGNsZWFuLCB0aGUgcmVzdCBvZiB0aGUgcGF0Y2hlcyB3
aGVyZSB0aGUgbmV3IGNvZGUKPiBpcyBpbnRyb2R1Y2VkIGhhcyBzZW1pLXJhbmRvbSBsaXN0IG9m
IHRoZSBpbmNsdXNpb25zLCBwbGVhc2UsIGZvbGxvdyB0aGUgSVdZVQo+IHByaW5jaXBsZS4KClN1
cmUsIEkgd2lsbCBzaW1wbGlmeSB0aGUgI2luY2x1ZGVzCgo+Cj4gLi4uCj4KPiA+ICtzdGF0aWMg
dm9pZCBycG1pX3N5c21zaV9pcnFfbWFzayhzdHJ1Y3QgaXJxX2RhdGEgKmQpCj4gPiArewo+ID4g
KyAgICAgc3RydWN0IHJwbWlfc3lzbXNpX3ByaXYgKnByaXYgPSBpcnFfZGF0YV9nZXRfaXJxX2No
aXBfZGF0YShkKTsKPiA+ICsgICAgIGludCByZXQ7Cj4gPiArCj4gPiArICAgICByZXQgPSBycG1p
X3N5c21zaV9zZXRfbXNpX3N0YXRlKHByaXYsIGQtPmh3aXJxLCAwKTsKPgo+IFBsZWFzZSwgdXNl
IHRoZSByZXNwZWN0aXZlIGdldHRlciBhbmQgdGhlIHR5cGU6CgpPa2F5Cgo+Cj4gICAgICAgICBp
cnFfaHdfbnVtYmVyX3QgaHdpcnEgPSBpcnFkX3RvX2h3aXJxKGQpOwo+Cj4gRGl0dG8gZm9yIGFs
bCBvdGhlciBzaW1pbGFyIGNhc2VzLgo+Cj4gPiArICAgICBpZiAocmV0KSB7Cj4gPiArICAgICAg
ICAgICAgIGRldl93YXJuKHByaXYtPmRldiwgIkZhaWxlZCB0byBtYXNrIGh3aXJxICVkIChlcnJv
ciAlZClcbiIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICh1MzIpZC0+aHdpcnEsIHJldCk7
Cj4KPiBObywgdGhpcyBpcyB3cm9uZyBpbiB0d28gd2F5czogdXNhZ2Ugb2Ygc3BlY2lmaWVkIGZv
ciBzaWduZWQgdmFsdWUgYW5kCj4gcGFzc2luZyB0aGUgdW5zaWduZWQ7IHVzaW5nIGV4cGxpY2l0
IGNhc3RpbmcgdG8gc29tZXRoaW5nIHVuc2lnbmVkLgo+IEluc3RlYWQgb2ZhIHRoZSBleHBsaWNp
dCBjYXN0aW5nLCBmaW5kIHRoZSBiZXN0IGZvcm1hdHRpbmcgc3BlY2lmaWVyCj4gYW5kIHVzZSBp
dC4KPgo+IERpdHRvIGZvciAgYWxsIHlvdXIgY29kZS4KCk9rYXksIEkgd2lsbCB1cGRhdGUuCgo+
Cj4gPiArICAgICB9Cj4gPiArICAgICBpcnFfY2hpcF9tYXNrX3BhcmVudChkKTsKPiA+ICt9Cj4K
PiAuLi4KPgo+ID4gK3N0YXRpYyBpbnQgcnBtaV9zeXNtc2lfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRl
di0+ZGV2Owo+ID4gKyAgICAgc3RydWN0IHJwbWlfc3lzbXNpX3ByaXYgKnByaXY7Cj4gPiArICAg
ICBpbnQgcmM7Cj4gPiArCj4gPiArICAgICBwcml2ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9m
KCpwcml2KSwgR0ZQX0tFUk5FTCk7Cj4gPiArICAgICBpZiAoIXByaXYpCj4gPiArICAgICAgICAg
ICAgIHJldHVybiAtRU5PTUVNOwo+ID4gKyAgICAgcHJpdi0+ZGV2ID0gZGV2Owo+ID4gKyAgICAg
cGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgcHJpdik7Cj4gPiArCj4gPiArICAgICAvKiBTZXR1
cCBtYWlsYm94IGNsaWVudCAqLwo+ID4gKyAgICAgcHJpdi0+Y2xpZW50LmRldiAgICAgICAgICAg
ICAgICA9IHByaXYtPmRldjsKPiA+ICsgICAgIHByaXYtPmNsaWVudC5yeF9jYWxsYmFjayAgICAg
ICAgPSBOVUxMOwo+ID4gKyAgICAgcHJpdi0+Y2xpZW50LnR4X2Jsb2NrICAgICAgICAgICA9IGZh
bHNlOwo+ID4gKyAgICAgcHJpdi0+Y2xpZW50Lmtub3dzX3R4ZG9uZSAgICAgICA9IHRydWU7Cj4g
PiArICAgICBwcml2LT5jbGllbnQudHhfdG91dCAgICAgICAgICAgID0gMDsKPiA+ICsKPiA+ICsg
ICAgIC8qIFJlcXVlc3QgbWFpbGJveCBjaGFubmVsICovCj4gPiArICAgICBwcml2LT5jaGFuID0g
bWJveF9yZXF1ZXN0X2NoYW5uZWwoJnByaXYtPmNsaWVudCwgMCk7Cj4gPiArICAgICBpZiAoSVNf
RVJSKHByaXYtPmNoYW4pKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihwcml2LT5j
aGFuKTsKPiA+ICsKPiA+ICsgICAgIC8qIEdldCBudW1iZXIgb2Ygc3lzdGVtIE1TSXMgKi8KPiA+
ICsgICAgIHJjID0gcnBtaV9zeXNtc2lfZ2V0X251bV9tc2kocHJpdik7Cj4gPiArICAgICBpZiAo
cmMgPCAxKSB7Cj4gPiArICAgICAgICAgICAgIG1ib3hfZnJlZV9jaGFubmVsKHByaXYtPmNoYW4p
Owo+ID4gKyAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIC1FTk9ERVYsICJO
byBzeXN0ZW0gTVNJcyBmb3VuZFxuIik7Cj4KPiBDYW4gcmMgYmUgbmVnYXRpdmUgaG9sZGluZyBh
biBlcnJvciBjb2RlPyBJZiBzbywgd2h5IGRvZXMgdGhlIGNvZGUgc2hhZG93IHRoYXQ/CgpBaGgg
eWVzLCB3ZSBzaG91bGQgcHJpbnQgYSBkaWZmZXJlbnQgZXJyb3IgbWVzc2FnZSB3aGVuIHJjIDwg
MC4gSSB3aWxsIHVwZGF0ZS4KCj4KPiA+ICsgICAgIH0KPiA+ICsgICAgIHByaXYtPm5yX2lycXMg
PSByYzsKPiA+ICsKPiA+ICsgICAgIC8qIFNldCB0aGUgZGV2aWNlIE1TSSBkb21haW4gaWYgbm90
IGF2YWlsYWJsZSAqLwo+ID4gKyAgICAgaWYgKCFkZXZfZ2V0X21zaV9kb21haW4oZGV2KSkgewo+
ID4gKyAgICAgICAgICAgICAvKgo+ID4gKyAgICAgICAgICAgICAgKiBUaGUgZGV2aWNlIE1TSSBk
b21haW4gZm9yIE9GIGRldmljZXMgaXMgb25seSBzZXQgYXQgdGhlCj4gPiArICAgICAgICAgICAg
ICAqIHRpbWUgb2YgcG9wdWxhdGluZy9jcmVhdGluZyBPRiBkZXZpY2UuIElmIHRoZSBkZXZpY2Ug
TVNJCj4gPiArICAgICAgICAgICAgICAqIGRvbWFpbiBpcyBkaXNjb3ZlcmVkIGxhdGVyIGFmdGVy
IHRoZSBPRiBkZXZpY2UgaXMgY3JlYXRlZAo+ID4gKyAgICAgICAgICAgICAgKiB0aGVuIHdlIG5l
ZWQgdG8gc2V0IGl0IGV4cGxpY2l0bHkgYmVmb3JlIHVzaW5nIGFueSBwbGF0Zm9ybQo+ID4gKyAg
ICAgICAgICAgICAgKiBNU0kgZnVuY3Rpb25zLgo+ID4gKyAgICAgICAgICAgICAgKi8KPiA+ICsg
ICAgICAgICAgICAgaWYgKGlzX29mX25vZGUoZGV2X2Z3bm9kZShkZXYpKSkKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBvZl9tc2lfY29uZmlndXJlKGRldiwgdG9fb2Zfbm9kZShkZXZfZndub2Rl
KGRldikpKTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgaWYgKCFkZXZfZ2V0X21zaV9kb21haW4o
ZGV2KSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVQUk9CRV9ERUZFUjsKPiA+
ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIGlmICghbXNpX2NyZWF0ZV9kZXZpY2VfaXJxX2RvbWFp
bihkZXYsIE1TSV9ERUZBVUxUX0RPTUFJTiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAmcnBtaV9zeXNtc2lfdGVtcGxhdGUsCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcHJpdi0+bnJfaXJxcywgcHJpdiwgcHJpdikpCj4gPiAr
ICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLUVOT01FTSwgImZhaWxlZCB0
byBjcmVhdGUgTVNJIGlycSBkb21haW5cbiIpOwo+ID4gKwo+ID4gKyAgICAgZGV2X2luZm8oZGV2
LCAiJWQgc3lzdGVtIE1TSXMgcmVnaXN0ZXJlZFxuIiwgcHJpdi0+bnJfaXJxcyk7Cj4gPiArICAg
ICByZXR1cm4gMDsKPiA+ICt9Cj4KPiAuLi4KPgo+ID4gKy8qKiBSUE1JIHN5c3RlbSBNU0kgc2Vy
dmljZSBJRHMgKi8KPgo+IFdoeSBkb2VzIHRoaXMgaGF2ZSBhIGtlcm5lbC1kb2MgbWFya2VyPwoK
T2theSwgSSB3aWxsIHVzZSAiLyogKi8iLgoKPgo+ID4gK2VudW0gcnBtaV9zeXNtc2lfc2Vydmlj
ZV9pZCB7Cj4gPiArICAgICBSUE1JX1NZU01TSV9TUlZfRU5BQkxFX05PVElGSUNBVElPTiA9IDB4
MDEsCj4gPiArICAgICBSUE1JX1NZU01TSV9TUlZfR0VUX0FUVFJJQlVURVMgPSAweDIsCj4gPiAr
ICAgICBSUE1JX1NZU01TSV9TUlZfR0VUX01TSV9BVFRSSUJVVEVTID0gMHgzLAo+ID4gKyAgICAg
UlBNSV9TWVNNU0lfU1JWX1NFVF9NU0lfU1RBVEUgPSAweDQsCj4gPiArICAgICBSUE1JX1NZU01T
SV9TUlZfR0VUX01TSV9TVEFURSA9IDB4NSwKPiA+ICsgICAgIFJQTUlfU1lTTVNJX1NSVl9TRVRf
TVNJX1RBUkdFVCA9IDB4NiwKPiA+ICsgICAgIFJQTUlfU1lTTVNJX1NSVl9HRVRfTVNJX1RBUkdF
VCA9IDB4NywKPgo+IFBsZWFzZSwgYmUgY29uc2lzdGVudCBpbiB0aGUgc3R5bGUgb2YgdmFsdWVz
LgoKT2theSwgSSB3aWxsIHVwZGF0ZS4KCj4KPiA+ICsgICAgIFJQTUlfU1lTTVNJX1NSVl9JRF9N
QVhfQ09VTlQsCj4KPiBObyBjb21tYSBpbiB0aGUgdGVybWluYXRvciBlbnRyeS4KCk9rYXkuCgo+
Cj4gPiArfTsKPgo+IC0tCj4gV2l0aCBCZXN0IFJlZ2FyZHMsCj4gQW5keSBTaGV2Y2hlbmtvCj4K
PgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
