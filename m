Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28109C83F07
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 16:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9x+roQkrvT74L79MzNPNo3vvem3yHwYTN57XhIV+jy4=; b=Ja6r9pe3koLvUs
	Z4154v2R3bU3ZFxXycMuHfacQctnSoWU/uel7AhLVQA1MR5ykXPQC4QicXIuR59NBmHH4EGcT8TYD
	o/Rp93QlDljV/ogKwQYif/wm627Yh622OFQYhpUL2kYiczKkWQY9t99IghDtP5C9fyKVmpjTHCA5L
	30V5MBp8TDgNw7S4bgZPLuGi2lpTpItuMh4JsNAcSm1pOT4X081CrsdJWwEQau0NiZDgypsBct4Pk
	DFQeFkyTQ6QjrRCD1PhDL8JouQQSRa0yCTL4xRhuAgMx7pXJnu1bDgfWRHYfFw0S3lChfX/SjBT+d
	vteVEJsF/KA+s5YbeONw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzwP-00000008t9a-1sox;
	Wed, 02 Jul 2025 16:04:09 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWz2i-00000008jTV-3bEh
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 15:06:38 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-234b440afa7so70694365ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 08:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751468796; x=1752073596; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DuxrgWn37wvxnmqKJavpfaOGptqxe8oR/pHOsdwVSXg=;
        b=kfaHQl9LoCMmNavNvNn9hDbHTlqcxkPUJo4jb5nvhaY+w0Fkb9f7NsLVqekyrlPYkD
         HOSVyQAYqlQpD+1HdLAmZh5gK9VkK6V4Hq3h1ujrUK+WMyW94afstwJumKrF3Biu2g31
         +PdeTaTNYbiECMCFkFKX5I6uTu6M9mHLq8skBQWy3bBI6rmD5bETd9ixtwO0K8Puwt0g
         x/sTmBNno5RUukgZFNGm+8AbUHp4Y1s9uePoix89lnN//qkqe8YLzQdPCymXoeQlxFyy
         Hzp77rnC4XCLMauYO4GOPujLdQUPECW6ta4OZOhjqGJBc2HU0Y9OmWO4/dfZsx7o4V96
         ZBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751468796; x=1752073596;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DuxrgWn37wvxnmqKJavpfaOGptqxe8oR/pHOsdwVSXg=;
        b=BOZe3uP9sgjtSr5p06fA8oRbdscx1X+XXMCvv5Cv09PeKe1nEZIt5SDABH7BD6UKvi
         rrTmaRqr35Sa9cCQbYJKeRZLMsJ5ERrgLq7Z9c5gIKsB/bXYGGoz0zVEVBvJ/zRP/72e
         TjogptbxQhb4agHwhK4Ks2pOan8RY0NaTKfdimvAz/2zbdhDi0msFwbjcu+Ok6x5cn96
         byQ5ISnuahb0femtWKmU+RLTO80eJ2inxjLtFzOCLH2xG1/+C0LZL0Jeqt+0fsqAvhba
         DQ3gSr3ZJHhzsCjZHNd4rdG6Ymnv9xdz+aPBdbWHrvFaDPpJVcd5CqmwuJmqjP4oJTUU
         HMvA==
X-Forwarded-Encrypted: i=1; AJvYcCUu6WlXOZdhnFMba3bRm46GW7ancgVVP53/Oe4xcspn42y1uAdP9D/Buot1sF3dtNM8hG61y+cn/WqFJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzW+EqxFOGL6nVYYL1X+BPci34+1gdbB+whpR3R2z2yb+Q2sxPw
	3maOGlWOouwny4F1gpEAoBDr8grBwxQ52TiZNDU/D8dWUbs0ni84PY2GsjplAvqzPUY=
X-Gm-Gg: ASbGncvYyfKPfovookQCbZTKAxrypgct3xFd929ZRwO3Qzb6lnvPEow8xq2PoxEFYIz
	dFumw4umVykAgqye5ziYVHC3zzEO5rh0OZAeg3OOxgR1n2zlhlpPNi2sGrs4TVBuID3zJArC6RC
	9pmLekYrV8YATrCuQ2jhhEEuT564Id5TSfNtMxuRI8lK0cu3Y+NqTTGWvazVMh+MvERq8XiSiDp
	aA9X4W8eEEnDAmEB+YwabBfquY90Zh8aBUdkHoJfwV0xxhH5fomn6skSFSooujGwepk4hAMmrvy
	GIk6H7r7Epfhfsw0H2AXLp0+hCxCjN81RxNyicipPmLJqqyhvcNGyVp5s6+QcL+92AhVrQ==
X-Google-Smtp-Source: AGHT+IEayU19ekj4WiD0uxOsXBOzhuBGyVO7ozD4bXpw7JPLUlbTFpVZ7FSEPPWrdW6ZBL27rOJyQQ==
X-Received: by 2002:a17:902:e78d:b0:234:8c3d:2912 with SMTP id d9443c01a7336-23c6e4e2a1bmr41479125ad.11.1751468796094;
        Wed, 02 Jul 2025 08:06:36 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3ba530sm130521215ad.200.2025.07.02.08.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:06:35 -0700 (PDT)
Date: Wed, 2 Jul 2025 20:36:20 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 15/24] ACPI: property: Add support for cells property
Message-ID: <aGVK7NxRdDIGRzNR@sunil-laptop>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-16-apatel@ventanamicro.com>
 <CAJZ5v0iYYuK2GF2Pg3NiO4vLFzoYm6Q3Dnk5O2DkMJm1R3qSfQ@mail.gmail.com>
 <aGUaFX9WgTW1I_ZO@smile.fi.intel.com>
 <CAJZ5v0h=qzS67Xu6NUfN_LmQUmKF9=AtkaRrTx81td0m-mRNNg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0h=qzS67Xu6NUfN_LmQUmKF9=AtkaRrTx81td0m-mRNNg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_080636_902065_5C6F325B 
X-CRM114-Status: GOOD (  24.17  )
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

T24gV2VkLCBKdWwgMDIsIDIwMjUgYXQgMDI6Mzk6MzBQTSArMDIwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gV2VkLCBKdWwgMiwgMjAyNSBhdCAxOjM44oCvUE0gQW5keSBTaGV2Y2hl
bmtvCj4gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
T24gV2VkLCBKdWwgMDIsIDIwMjUgYXQgMTI6MjA6NTVQTSArMDIwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gPiA+IE9uIFdlZCwgSnVsIDIsIDIwMjUgYXQgNzoxNuKAr0FNIEFudXAgUGF0
ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiAuLi4KPiA+Cj4gPiA+
ID4gIHN0YXRpYyBpbnQgYWNwaV9md25vZGVfZ2V0X3JlZmVyZW5jZV9hcmdzKGNvbnN0IHN0cnVj
dCBmd25vZGVfaGFuZGxlICpmd25vZGUsCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqcHJvcG5hbWUsIGNvbnN0IGNoYXIgKm5hcmdz
X3Byb3AsCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgaW50IGFyZ3NfY291bnQsIHVuc2lnbmVkIGludCBpbmRleCwKPiA+Cj4gPiA+ID4g
ICAgICAgICBjb25zdCBzdHJ1Y3QgYWNwaV9kZXZpY2VfZGF0YSAqZGF0YTsKPiA+ID4gPiAgICAg
ICAgIHN0cnVjdCBmd25vZGVfaGFuZGxlICpyZWZfZndub2RlOwo+ID4gPiA+ICAgICAgICAgc3Ry
dWN0IGFjcGlfZGV2aWNlICpkZXZpY2U7Cj4gPiA+ID4gKyAgICAgICB1bnNpZ25lZCBpbnQgbmFy
Z3NfY291bnQ7Cj4gPiA+ID4gICAgICAgICBpbnQgcmV0LCBpZHggPSAwOwo+ID4KPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBuYXJnc19jb3VudCA9IGFjcGlfZndub2RlX2dldF9hcmdz
X2NvdW50KGRldmljZSwgbmFyZ3NfcHJvcCk7Cj4gPiA+Cj4gPiA+IEkgdGhpbmsgaXQgc2hvdWxk
IHdvcmsgdGhlIHNhbWUgd2F5IGFzIGl0IHVzZWQgdG8gZm9yIHRoZSBjYWxsZXJzIHRoYXQKPiA+
ID4gcGFzcyBhcmdzX2NvdW50LCBzbyBtYXliZQo+ID4gPgo+ID4gPiBpZiAoIWFyZ3NfY291bnQp
Cj4gPiA+ICAgICAgICAgYXJnc19jb3VudCA9IGFjcGlfZndub2RlX2dldF9hcmdzX2NvdW50KGRl
dmljZSwgbmFyZ3NfcHJvcCk7Cj4gPgo+ID4gQnV0IHRoaXMgaXMgZGlmZmVyZW50IHZhcmlhYmxl
Lgo+IAo+IE9mIGNvdXJzZSBpdCBpcyBkaWZmZXJlbnQuICBJdCBpcyBhbiBhY3BpX2Z3bm9kZV9n
ZXRfcmVmZXJlbmNlX2FyZ3MoKSBwYXJhbWV0ZXIuCj4gCj4gPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgZWxlbWVudCsrOwo+ID4gPiA+IC0KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICByZXQgPSBhY3BpX2dldF9yZWZfYXJncyhpZHggPT0gaW5kZXggPyBhcmdzIDogTlVMTCwK
PiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBh
Y3BpX2Z3bm9kZV9oYW5kbGUoZGV2aWNlKSwKPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAmZWxlbWVudCwgZW5kLCBhcmdzX2NvdW50KTsKPiA+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZWxl
bWVudCwgZW5kLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIG5hcmdzX2NvdW50ID8gbmFyZ3NfY291bnQgOiBhcmdzX2NvdW50KTsKPiA+ID4K
PiA+ID4gQW5kIHRoaXMgY2hhbmdlIHdvdWxkIG5vdCBiZSBuZWNlc3Nhcnk/Cj4gPgo+ID4gVGhp
cyBpcyBub3QgdGhlIHNhbWUgY2hlY2sgYXMgcHJvcG9zZWQgYWJvdmUuCj4gCj4gTm8sIGl0IGlz
IG5vdC4KPiAKPiBJdCBqdXN0IG1ha2VzIHRoZSBmdW5jdGlvbiB3b3JrIHRoZSBzYW1lIHdheSBp
dCBkaWQgYmVmb3JlIHRoZSBjaGFuZ2UKPiBmb3IgdGhlIGNhbGxlcnMgd2hvIHBhc3NlZCBub3pl
cm8gYXJnc19jb3VudCBhbmQgc28gdGhleSBtaWdodCBiZQo+IGZvcmdpdmVuIGV4cGVjdGluZyB0
aGF0IGl0IHdvdWxkIGJlIHRha2VuIGludG8gYWNjb3VudC4KCkJ1dCBpZiB3ZSBkbyBsaWtlIHRo
aXMsIHRoZSBleHBlY3RhdGlvbiBvZgpmd25vZGVfcHJvcGVydHlfZ2V0X3JlZmVyZW5jZV9hcmdz
KCkgd2lsbCBkaWZmZXIgZm9yIERUIGFuZCBBQ1BJLCByaWdodD8KSSBtZWFuIG5hcmdzX3Byb3Ag
c2hvdWxkIHRha2UgaGlnaGVyIHByZWNlZGVuY2UgdGhhbiBuYXJncy4KClRoYW5rcyEKU3VuaWwK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
