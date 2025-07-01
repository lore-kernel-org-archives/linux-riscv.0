Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99924C7EE30
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 07:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fbifNjG8S3+3l4CxG0a5oQbZddHdUJG5kOP+WeHmFRs=; b=G8XtWb+MML7w+U
	AkK3lzV5IflWGa4Lw3rOLCicXMWi1mDH1Up28FdBL8XvuxfFx5X94Pb0hZPCwyrKosbqAoaWbm5I/
	wYRmrppoAhX7CWfjU2OBGcaaawlEUKzXVijEmpr57WXLfaaAvWn/besZeQmUokX1tjtUFzSdGwlja
	LHDuQ9cZFW6RXBoqV7621KalErxgNWmG3QgYeb4wO13sJfl46o7kZJpmf2F876U6wxFMPVP5ReCYU
	pdcLgsPQ32bNEUYBXwMloe9Rqpzgb/S3pcINHaS9fu0YuswiruqWPsIQO3E4OTBGlRKg41scskwIa
	boR6GpjOS6FRrlTuHhyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVSi-00000004H80-0ITl;
	Tue, 01 Jul 2025 07:31:28 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWV1M-00000004Dnu-0fyB
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 07:03:13 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-553dceb342fso4784998e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 00:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751353390; x=1751958190; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIU5NNrDBXiK6ci+KkmpULxlihLtb8DLKHWe5DIQOM0=;
        b=nw9Qz9IYEFTT2FIdAhHG66aqH1p2ygqcMtmxsakBLQqINrScStyxQ8LAe6X/L+TbdK
         i1cvEbOKh+lmAYxRRGWAN18et72K4ydxVZiiY3yYrW0WwiRc9ltRSjjU6dK+oAJPopvI
         oh3O6co95/SsLL5k0xo323i0tALaMrymzD35XUl4GWAPITTehA3H5ScjNJNt91B/kngn
         5Ndsy/hAZTHR0/ChN82wlznwtuPuAgUrnG+vF7wy33f1peUEv1ajYAMDrErUvTx8azDe
         LtZV9g17Ltgn/9ExLJBb3aGpNcpGUGrHvGJlZVaP353lMIORUxt8SlFc+GBiMD2mLCc3
         Nwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751353390; x=1751958190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIU5NNrDBXiK6ci+KkmpULxlihLtb8DLKHWe5DIQOM0=;
        b=U8tyK3Qc5ag2ToHMsfW2y9YbjkRkFh8YDimwmEvYt9OWH4C056+yCC29q2ygH/VqqL
         AAoMDAs1FuuwsCnf17UWiqItih53HqbJa4ym0PkTgGg9nqHJG4XAF5Bbo3r/4ZJ5z2Or
         JtoW087b23CvTCRAkHT8OY/Bvkh72Kjci6Ya1A64GlR4r0Q+D5M01UiH8+UKXzp9Sl/3
         rSDwnVSWGBlIg+icZvpX5oGv0R/KTSCOE/rIdDtI6BWAWhwrF8IOydMjZ+PYVLfNBUyZ
         quBXSdYiIdQQIjl6KRHj6Y4u4kufbQ/E093GdvmqNbyfq3cFBiaDFRYbTkRNtlEdjoXv
         r72Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+K7czzfdx5KiOm0jF9s+z7aIR+a9uwtb7myhDmW0FFmQVn6WxCU8DLcPaxjsOMrjYfBoEflhZonN04w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwNZcyJZc8SgPseJ8hIBv8SbC/aYxBTIoEdQvIbYvChSPE02T2
	QOubdKQYHMxDDOrl7Ws182Zj9KQmhvyLtCIdYp+FHbcVT4lLArVeLSKjMunsi4fou4QIPySLl8K
	WZgB6V0h5LClzIFPDX30DMkpsKLBNAyEBIJODT8E01Q==
X-Gm-Gg: ASbGncth4gox/V6wXzgFxVY2pneC9/+F74LtY4EaroDl9V1ihvwZyDplZuTaWWTMvZ2
	Gk1A39iXe1oojrsEm/xCaWyqfReOYLJJftC6F+EEN1NzPxWYfYAicE06Oc53ygwCm4dxhH6C7P9
	xACnhBtfDhFQ/GTg4eivCbVWrjHEUOj8l2KvPQG9W/rm5auAYJ+fb++PA=
X-Google-Smtp-Source: AGHT+IG2hO6nzI2GLaUpV//IQuh9V9bSS/bokBUiGKqfApG5Zg7ceEjqZCY0yleadUsPuqLCZd4pLgQndJnpi85hp6w=
X-Received: by 2002:a05:6512:220d:b0:554:f76a:baaf with SMTP id
 2adb3069b0e04-5550b9ee1c0mr5526546e87.56.1751353390315; Tue, 01 Jul 2025
 00:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-7-apatel@ventanamicro.com> <aFkVQTSCSkvBhzgC@smile.fi.intel.com>
In-Reply-To: <aFkVQTSCSkvBhzgC@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 1 Jul 2025 12:32:57 +0530
X-Gm-Features: Ac12FXyj6dh_QMGxazJoimu3YO2qWqoVT9ukdJkMwkLRVDb7ZkWPIfUsIhiEvxA
Message-ID: <CAK9=C2Wh3ha9bV_JhGqJRhBSWheXqRMmBN-M0x2-ffZyFni_cw@mail.gmail.com>
Subject: Re: [PATCH v6 06/23] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_000312_203604_F1006F8A 
X-CRM114-Status: GOOD (  22.17  )
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

T24gTW9uLCBKdW4gMjMsIDIwMjUgYXQgMjoyMOKAr1BNIEFuZHkgU2hldmNoZW5rbwo8YW5kcml5
LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVuIDE4LCAy
MDI1IGF0IDA1OjQzOjQxUE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBBZGQgYSBtYWls
Ym94IGNvbnRyb2xsZXIgZHJpdmVyIGZvciB0aGUgbmV3IFNCSSBtZXNzYWdlIHByb3h5IGV4dGVu
c2lvbgo+ID4gd2hpY2ggaXMgcGFydCBvZiB0aGUgU0JJIHYzLjAgc3BlY2lmaWNhdGlvbi4KPgo+
IC4uLgo+Cj4gPiArc3RhdGljIHZvaWQgbXB4eV9tYm94X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBtcHh5X21ib3ggKm1ib3ggPSBw
bGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKPgo+ID4gKyAgICAgaWYgKG1ib3gtPm1zaV9jb3Vu
dCkKPgo+IEknbSBzdGlsbCBub3QgY29udmluY2VkIHdlIG5lZWQgdGhpcyBjaGVjayBfaGVyZV8u
Cj4gQ2FuIGl0IGJlIHJhdGhlciBhIHNlcGFyYXRlIHBhdGNoIHRvIGFkZCBpdCBpbnNpZGUKPiB0
aGUgYmVsb3cgY2FsbD8KCklNSE8sIGltcHJvdmluZyBwbGF0Zm9ybV9kZXZpY2VfbXNpX2ZyZWVf
aXJxc19hbGwoKSBhbmQgaXRzCnVzZXJzIHNob3VsZCBiZSBhIHNlcGFyYXRlIHNlcmllcy4KCj4K
PiA+ICsgICAgICAgICAgICAgcGxhdGZvcm1fZGV2aWNlX21zaV9mcmVlX2lycXNfYWxsKG1ib3gt
PmRldik7Cj4gPiArfQo+Cj4gLi4uCj4KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBtcHh5X21ib3hfb2ZfbWF0Y2hbXSA9IHsKPiA+ICsgICAgIHsuY29tcGF0aWJsZSA9ICJy
aXNjdixzYmktbXB4eS1tYm94IiwgfSwKPgo+IE1pc3Npbmcgc3BhY2UgYW5kIHVubmVlZGVkIGlu
bmVyIGNvbW1hLgoKT2theSwgSSB3aWxsIHVwZGF0ZS4KCj4KPiA+ICsgICAgIHt9Cj4gPiArfTsK
Pgo+IC4uLgo+Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2J5dGVvcmRlci9nZW5lcmljLmgKPiA+
ICsrKyBiL2luY2x1ZGUvbGludXgvYnl0ZW9yZGVyL2dlbmVyaWMuaAo+Cj4gVGhpcyBpcyBnb29k
IGNoYW5nZSwgYnV0IGRlc2VydmVzIHRvIGJlIGluIGEgc2VwYXJhdGUgcGF0Y2guCj4gSSB3aWxs
IEFjay9SZXZpZXcgaXQgYXMgc29vbiBhcyBpdCBhcHBlYXJzIHRvIGJlIHNvLgo+CgpJIGdlbmVy
YWxseSBwcmVmZXIgaW50cm9kdWN0aW9uIGFuZCB1c2FnZSBvZiBhIG5ldyBBUEkgaW4gdGhlCnNh
bWUgcGF0Y2ggc2luY2UgaXQgcHJvdmlkZXMgYmV0dGVyIGNvbnRleHQuIEkgZG9uJ3QgbWluZCBj
cmVhdGluZwpzZXBhcmF0ZSBwYXRjaCBzbyBJIHdpbGwgdXBkYXRlIGluIHRoZSBuZXh0IHJldmlz
aW9uLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
