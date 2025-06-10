Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD40C71132
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 12:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qggpHQVPmDel5LU+99/h8Q7Nd+b2KIB5zCiBkKzWw8k=; b=tp1pHKohM8MCnw
	qYaRUGr+xpKbjR3saKBfHzpftp5gZ/9xlaNYQf0y2AlnNis6JesFPb3jCc+gUQhjzfdLc9KU1kJcE
	BguauZPKroo0dCEofJEVpPdd3jv/FkF+CYDmME8TvUgzCRX+7833zfTfoioAVBDVX6/QC8GyLyoDO
	C0MXJJ0gDT6OkVZMqmO75voNGKFZZnHhaeTUg+tzdAts+ULlPor9/+xpc86tR1d8tz+7pm64ej4ow
	HsIKUGVndpCv8twxEF+F0l9qaDdzl7rFqz5kjWnLei8eX6QynbeYwDKIMkm30gny1Kt5Hv5ZF5Owm
	t1Ld5Z6uTiBdLTMNMwVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxhN-00000006hrq-2bpx;
	Tue, 10 Jun 2025 12:03:25 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwls-00000006bfW-3gLp
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 11:04:02 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-54998f865b8so5000456e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 04:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749553439; x=1750158239; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKrG+/t13RZcj2XOvH9v9z8+L2fFTYYa3Ltd42Ng0rE=;
        b=KFQkg6W+TnLl+aofVtj2fbjokFzfCPo/RUppH1eT2Cq6MLBx/E8vamCvk8cuWRUDia
         FoWwsAtw2xmZL77/EGjFh4E+h4eIjpxo2tdX1gk9Tw396YvH9UClC0Y5xKC8T0nUAjiJ
         xrN0ID7u9KvjtoCErBEXDXZ+4hW5H10Pn3rtBOQxPrcUsAqc5RCG2C8PcRsJsA+/fIGl
         YZqqGG39PlWuo2PccoFQWd9QPGT8N2466k9Z7wZhr5R4vviXl/u6JR2bDqpTSIx7chvp
         I5By2tbiFhVQc86e2fOW1Fo6RDOaAyK0fddlARZot19Rk7Ali6c2UI7b8UeMWKTEqF5M
         cswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749553439; x=1750158239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKrG+/t13RZcj2XOvH9v9z8+L2fFTYYa3Ltd42Ng0rE=;
        b=A1uOfjuhpby/SazmcQKHGCL1xS/Phgu5cWrBaWo38vbCg4DX6iMwy2GHm0Mv397Ruv
         8XXurLW0OYBo3hQs5QfKBH6wH8kWx1r7hLk6BTp3Dv+k88TjPOqnGpVk1O+LII4EUsr6
         iHn7FXNRzwrwQ6/Qfl6joOB4lkAOzpYtHnLeK099LL1zNGodzmKk9EBD+HeO4FJ2H7rx
         8/i7JXJ6qQkxyVhZ9unuMpm7Skb/FdbYXibc7qtYPoaGCH6iTbOgWT36/boDUwi9nBY1
         BtOOIoQDFPUMY0r0ufterHtpql9m07mUumoPGHC4x59+D71Gmm8jbX+sZDhSYn7rl+ro
         U0Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUfp1Qc1goHd5u1tz3NGzYSWDrVlryV/H5WAvhMDYdqW3f6hBQslRdRjRUFFMzKA7LUmrOMgu/SHiqjVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhqszwGLCTI60wUoXeUjxVqI2ZQw+q6ctTIZ853kspDsPb+sIP
	fndi3ms5MrJbhiVPG4zvn3BxDEWY8noU9fKMZ/XkTd7xWVEiTINLDFd4UOd7/ksGKNHjgw8CKNp
	A9uzDtg0v9kHeYaCF9tfrNe+WD88KKLWaOy7+e49X/A==
X-Gm-Gg: ASbGncuvqJR5FMv4Gg7zQnPtNeF1KwuKYyZajs2UQcavnstzsdWeHBkgzslCrCyy8bv
	G+R9zlcYIA7bRa2bTECal1Q00WJ0UkzZwmh+RZFh91DuO17TKiFeGbrQsdsHT9z7HP/glDHGQok
	2LM211SNEOaBWVCjfkj7IOJlLC1DCD8xQg8xsBTBNNgcw6
X-Google-Smtp-Source: AGHT+IESMN1xY0S0unbcyTuOy1IpGOvKrvakY0krrQjYzGxBna97nQp1FPjoYQhSDGAOnzFkYRrS1ke1WZ4KLHhwEvw=
X-Received: by 2002:a05:6512:1390:b0:553:349c:6465 with SMTP id
 2adb3069b0e04-553947c776fmr618266e87.33.1749553439019; Tue, 10 Jun 2025
 04:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-14-apatel@ventanamicro.com> <aDWjG9jAJ7kSaC9b@smile.fi.intel.com>
In-Reply-To: <aDWjG9jAJ7kSaC9b@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 10 Jun 2025 16:33:46 +0530
X-Gm-Features: AX0GCFshka7Yxp7fjO1jD3jzFyiwSbjQL6yn3YQHCZzypSxtbBGLaVxP7eVlcr8
Message-ID: <CAK9=C2VYCSkMV5zoyVEKHTY30Y0KpUr_M8FELm37M8=WYi+4HQ@mail.gmail.com>
Subject: Re: [PATCH v4 13/23] irqchip: Add driver for the RPMI system MSI
 service group
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_040400_920321_D9D9B994 
X-CRM114-Status: GOOD (  30.42  )
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

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgNTowM+KAr1BNIEFuZHkgU2hldmNoZW5rbwo8YW5kcml5
LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFN1biwgTWF5IDI1LCAy
MDI1IGF0IDAyOjE3OjAwUE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBUaGUgUlBNSSBz
cGVjaWZpY2F0aW9uIGRlZmluZXMgYSBzeXN0ZW0gTVNJIHNlcnZpY2UgZ3JvdXAgd2hpY2gKPiA+
IGFsbG93cyBhcHBsaWNhdGlvbiBwcm9jZXNzb3JzIHRvIHJlY2VpdmUgTVNJcyB1cG9uIHN5c3Rl
bSBldmVudHMKPiA+IHN1Y2ggYXMgZ3JhY2VmdWwgc2h1dGRvd24vcmVib290IHJlcXVlc3QsIENQ
VSBob3RwbHVnIGV2ZW50LCBtZW1vcnkKPiA+IGhvdHBsdWcgZXZlbnQsIGV0Yy4KPiA+Cj4gPiBB
ZGQgYW4gaXJxY2hpcCBkcml2ZXIgZm9yIHRoZSBSSVNDLVYgUlBNSSBzeXN0ZW0gTVNJIHNlcnZp
Y2UgZ3JvdXAKPiA+IHRvIGRpcmVjdGx5IHJlY2VpdmUgc3lzdGVtIE1TSXMgaW4gTGludXgga2Vy
bmVsLgo+Cj4gLi4uCj4KPiA+ICsjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+Cj4KPiBQZXJoYXBz
IEkgbWlzc2VkIHNvbWV0aGluZywgYnV0IGRldm1fa3phbGxvYygpIGlzIGluIGRldmljZS9kZXZy
ZXMuaC4gRG8geW91Cj4gbmVlZCBpdCBmb3Igc29tZXRoaW5nIGVsc2U/CgpkZXZfZ2V0X21zaV9k
b21haW4oKSBpcyBwYXJ0IG9mIGxpbnV4L2RldmljZS5oIGhlbmNlIGl0IHNob3VsZApiZSBpbmNs
dWRlZC4KCkkgd2lsbCBhZGQgbGludXgvZGV2aWNlL2RldnJlcy5oIGFzIHdlbGwuCgo+Cj4gPiAr
I2luY2x1ZGUgPGxpbnV4L2Rldl9wcmludGsuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvaXJxLmg+
Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2lycWRvbWFpbi5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9t
YWlsYm94X2NsaWVudC5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9tYWlsYm94L3Jpc2N2LXJwbWkt
bWVzc2FnZS5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiA+ICsjaW5jbHVkZSA8
bGludXgvbXNpLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L29mX2lycS5oPgo+ID4gKyNpbmNsdWRl
IDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4K
Pgo+ID4gKyNpbmNsdWRlIDx2ZHNvL2JpdHMuaD4KPgo+IEp1c3QgbWFrZSBpdCBsaW51eC9iaXRz
LmggYXMgdmRzbyBpcyBmb3IgdXNlciBzcGFjZSBsaWJ2ZHNvIGFuZCByZWxhdGVkLgo+Cj4gQnV0
Cj4KPiArIGFzbS9ieXRlb3JkZXIuaAo+Cj4gLi4uCj4KPiA+ICtzdGF0aWMgdm9pZCBycG1pX3N5
c21zaV9pcnFfbWFzayhzdHJ1Y3QgaXJxX2RhdGEgKmQpCj4gPiArewo+ID4gKyAgICAgc3RydWN0
IHJwbWlfc3lzbXNpX3ByaXYgKnByaXYgPSBpcnFfZGF0YV9nZXRfaXJxX2NoaXBfZGF0YShkKTsK
Pgo+IERlY2xhcmUgdGVtcG9yYXJ5IHZhcmlhYmxlIGZvciBod2lycSBhbmQgZG8gaXJxZF90b19o
d2lycSgpIG9ubHkgb25jZS4KCk9rYXksIEkgd2lsbCB1cGRhdGUuCgo+Cj4gPiArICAgICBpbnQg
cmV0Owo+ID4gKwo+ID4gKyAgICAgcmV0ID0gcnBtaV9zeXNtc2lfc2V0X21zaV9zdGF0ZShwcml2
LCBpcnFkX3RvX2h3aXJxKGQpLCAwKTsKPiA+ICsgICAgIGlmIChyZXQpIHsKPiA+ICsgICAgICAg
ICAgICAgZGV2X3dhcm4ocHJpdi0+ZGV2LCAiRmFpbGVkIHRvIG1hc2sgaHdpcnEgJWx1IChlcnJv
ciAlZClcbiIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgIGlycWRfdG9faHdpcnEoZCksIHJl
dCk7Cj4gPiArICAgICB9Cj4gPiArICAgICBpcnFfY2hpcF9tYXNrX3BhcmVudChkKTsKPiA+ICt9
Cj4KPiAuLi4KPgo+ID4gK3N0YXRpYyB2b2lkIHJwbWlfc3lzbXNpX2lycV91bm1hc2soc3RydWN0
IGlycV9kYXRhICpkKQo+Cj4gRGl0dG8uCj4KPiAuLi4KPgo+ID4gK3N0YXRpYyB2b2lkIHJwbWlf
c3lzbXNpX3NldF9kZXNjKG1zaV9hbGxvY19pbmZvX3QgKmFyZywgc3RydWN0IG1zaV9kZXNjICpk
ZXNjKQo+ID4gK3sKPiA+ICsgICAgIGFyZy0+ZGVzYyA9IGRlc2M7Cj4gPiArICAgICBhcmctPmh3
aXJxID0gKHUzMilkZXNjLT5kYXRhLmljb29raWUudmFsdWU7Cj4KPiBIbW0uLi4gV2h5IGRvIHlv
dSBuZWVkIGFuIGV4cGxpY2l0IGNhc3Rpbmc/CgpOb3QgbmVlZGVkLCBJIHdpbGwgZHJvcCB0aGUg
Y2FzdGluZyBpbiB0aGUgbmV4dCByZXZpc2lvbi4KCj4KPiA+ICt9Cj4KPiAuLi4KPgo+ID4gKyAg
ICAgaWYgKFdBUk5fT04oZndzcGVjLT5wYXJhbV9jb3VudCA8IDEpKQo+Cj4gKyBidWcuaAoKT2th
eSwgSSB3aWxsIHVwZGF0ZS4KCj4KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4K
PiArIGVycm5vLmggKGJ1dCBhY3R1YWxseSB5b3UgbmVlZCBlcnIuaCBkdWUgdG8gUFRSX0VSUigp
IGV0IGFsLikKPgo+IC4uLgo+Cj4gPiArc3RhdGljIGludCBycG1pX3N5c21zaV9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBkZXZpY2Ug
KmRldiA9ICZwZGV2LT5kZXY7Cj4gPiArICAgICBzdHJ1Y3QgcnBtaV9zeXNtc2lfcHJpdiAqcHJp
djsKPiA+ICsgICAgIGludCByYzsKPgo+IEJlIGNvbnNpc3RlbnQgd2l0aCB2YXJpYWJsZSBuYW1p
bmcgZm9yIHRoZSBzYW1lIChzZW1hbnRpY2FsbHkpIHN0dWZmLgo+Cj4gPiArICAgICBwcml2ID0g
ZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpwcml2KSwgR0ZQX0tFUk5FTCk7Cj4gPiArICAgICBp
ZiAoIXByaXYpCj4gPiArICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4gKyAgICAgcHJp
di0+ZGV2ID0gZGV2Owo+Cj4gPiArICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBwcml2
KTsKPgo+IEhvdyBpcyBiZWluZyB1c2VkPwoKVHlwaWNhbGx5LCBpdCdzIGZvciBkcml2ZXJfcmVt
b3ZlKCkgYnV0IHNpbmNlIHdlIGRvbid0IGhhdmUKZHJpdmVyX3JlbW92ZSgpIHdlIGNhbiBkcm9w
IGl0LgoKPgo+ID4gKwo+ID4gKyAgICAgLyogU2V0dXAgbWFpbGJveCBjbGllbnQgKi8KPiA+ICsg
ICAgIHByaXYtPmNsaWVudC5kZXYgICAgICAgICAgICAgICAgPSBwcml2LT5kZXY7Cj4gPiArICAg
ICBwcml2LT5jbGllbnQucnhfY2FsbGJhY2sgICAgICAgID0gTlVMTDsKPiA+ICsgICAgIHByaXYt
PmNsaWVudC50eF9ibG9jayAgICAgICAgICAgPSBmYWxzZTsKPiA+ICsgICAgIHByaXYtPmNsaWVu
dC5rbm93c190eGRvbmUgICAgICAgPSB0cnVlOwo+ID4gKyAgICAgcHJpdi0+Y2xpZW50LnR4X3Rv
dXQgICAgICAgICAgICA9IDA7Cj4gPiArCj4gPiArICAgICAvKiBSZXF1ZXN0IG1haWxib3ggY2hh
bm5lbCAqLwo+ID4gKyAgICAgcHJpdi0+Y2hhbiA9IG1ib3hfcmVxdWVzdF9jaGFubmVsKCZwcml2
LT5jbGllbnQsIDApOwo+ID4gKyAgICAgaWYgKElTX0VSUihwcml2LT5jaGFuKSkKPiA+ICsgICAg
ICAgICAgICAgcmV0dXJuIFBUUl9FUlIocHJpdi0+Y2hhbik7Cj4gPiArCj4gPiArICAgICAvKiBH
ZXQgbnVtYmVyIG9mIHN5c3RlbSBNU0lzICovCj4gPiArICAgICByYyA9IHJwbWlfc3lzbXNpX2dl
dF9udW1fbXNpKHByaXYpOwo+ID4gKyAgICAgaWYgKHJjIDwgMSkgewo+ID4gKyAgICAgICAgICAg
ICBtYm94X2ZyZWVfY2hhbm5lbChwcml2LT5jaGFuKTsKPiA+ICsgICAgICAgICAgICAgaWYgKHJj
KQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmMs
ICJGYWlsZWQgdG8gZ2V0IG51bWJlciBvZiBzeXN0ZW0gTVNJc1xuIik7Cj4gPiArICAgICAgICAg
ICAgIGVsc2UKPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShk
ZXYsIC1FTk9ERVYsICJObyBzeXN0ZW0gTVNJcyBmb3VuZFxuIik7Cj4gPiArICAgICB9Cj4gPiAr
ICAgICBwcml2LT5ucl9pcnFzID0gcmM7Cj4gPiArCj4gPiArICAgICAvKiBTZXQgdGhlIGRldmlj
ZSBNU0kgZG9tYWluIGlmIG5vdCBhdmFpbGFibGUgKi8KPiA+ICsgICAgIGlmICghZGV2X2dldF9t
c2lfZG9tYWluKGRldikpIHsKPiA+ICsgICAgICAgICAgICAgLyoKPiA+ICsgICAgICAgICAgICAg
ICogVGhlIGRldmljZSBNU0kgZG9tYWluIGZvciBPRiBkZXZpY2VzIGlzIG9ubHkgc2V0IGF0IHRo
ZQo+ID4gKyAgICAgICAgICAgICAgKiB0aW1lIG9mIHBvcHVsYXRpbmcvY3JlYXRpbmcgT0YgZGV2
aWNlLiBJZiB0aGUgZGV2aWNlIE1TSQo+ID4gKyAgICAgICAgICAgICAgKiBkb21haW4gaXMgZGlz
Y292ZXJlZCBsYXRlciBhZnRlciB0aGUgT0YgZGV2aWNlIGlzIGNyZWF0ZWQKPiA+ICsgICAgICAg
ICAgICAgICogdGhlbiB3ZSBuZWVkIHRvIHNldCBpdCBleHBsaWNpdGx5IGJlZm9yZSB1c2luZyBh
bnkgcGxhdGZvcm0KPiA+ICsgICAgICAgICAgICAgICogTVNJIGZ1bmN0aW9ucy4KPiA+ICsgICAg
ICAgICAgICAgICovCj4KPiA+ICsgICAgICAgICAgICAgaWYgKGlzX29mX25vZGUoZGV2X2Z3bm9k
ZShkZXYpKSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICBvZl9tc2lfY29uZmlndXJlKGRldiwg
dG9fb2Zfbm9kZShkZXZfZndub2RlKGRldikpKTsKPgo+ICAgICAgICAgICAgICAgICBpZiAoZGV2
X29mX25vZGUoZGV2KSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBvZl9tc2lfY29uZmlndXJl
KGRldiwgZGV2X29mX25vZGUoZGV2KSk7CgpPa2F5LCBJIHdpbGwgdXBkYXRlLgoKPgo+ID4gKyAg
ICAgICAgICAgICBpZiAoIWRldl9nZXRfbXNpX2RvbWFpbihkZXYpKSB7Cj4gPiArICAgICAgICAg
ICAgICAgICAgICAgbWJveF9mcmVlX2NoYW5uZWwocHJpdi0+Y2hhbik7Cj4gPiArICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIC1FUFJPQkVfREVGRVI7Cj4gPiArICAgICAgICAgICAgIH0KPiA+
ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIGlmICghbXNpX2NyZWF0ZV9kZXZpY2VfaXJxX2RvbWFp
bihkZXYsIE1TSV9ERUZBVUxUX0RPTUFJTiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAmcnBtaV9zeXNtc2lfdGVtcGxhdGUsCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcHJpdi0+bnJfaXJxcywgcHJpdiwgcHJpdikpIHsKPiA+
ICsgICAgICAgICAgICAgbWJveF9mcmVlX2NoYW5uZWwocHJpdi0+Y2hhbik7Cj4gPiArICAgICAg
ICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLUVOT01FTSwgImZhaWxlZCB0byBjcmVh
dGUgTVNJIGlycSBkb21haW5cbiIpOwo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgZGV2X2lu
Zm8oZGV2LCAiJXUgc3lzdGVtIE1TSXMgcmVnaXN0ZXJlZFxuIiwgcHJpdi0+bnJfaXJxcyk7Cj4g
PiArICAgICByZXR1cm4gMDsKPiA+ICt9Cj4KPiAtLQo+IFdpdGggQmVzdCBSZWdhcmRzLAo+IEFu
ZHkgU2hldmNoZW5rbwo+Cj4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
