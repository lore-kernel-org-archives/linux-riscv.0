Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81DFC54E65
	for <linux-riscv@archiver.kernel.org>; Wed, 21 May 2025 11:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHlFiX01O+r0gVTjso4abHDNkaxTW6mJkTiYSnFcZSk=; b=yw6nrooQocSxU7
	9fV+bNWqgSX86Gzm0kgtuAg1/3pPo6loBt3Xj3gF4IoR+2y+z4rJ38mXHEhogvjHuNkR+Wj6h2t3u
	gTyCGnLTGaNHjt4P7LR3NSkOhEAeLxrNfVS9HQsSFs1VbcvpXQE7YYgCBRvAY1NLyOS5L0rEI+t5K
	GroqMugqDLdddMeITZL8eCg8XKg4amuNTXcqg8SXD9RuuTra8mEbkDi+jax9mxdw1Ar+RD97WyOZn
	6xnyUKozzPfBLi08dGk+MwGZih+RPioOx4mVCmAosEnK2m9rkaICOgsrfODoVIFsglNBIJj+R1QKf
	Q9OjB0OiciZPBthH5s/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhla-0000000Fe8l-003J;
	Wed, 21 May 2025 11:37:46 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhlX-0000000Fe7N-1Xcj
	for linux-riscv@lists.infradead.org;
	Wed, 21 May 2025 11:37:44 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-328114b26e1so29923341fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 May 2025 04:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747827461; x=1748432261; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCrdqzJOZ+r5b5uVV31OhUBXHQ/N/WAYYeoHpygOTPU=;
        b=Y7e8yGDm4nJzihBsGYATDLgtBiv+jFWZxIYq/OHbZrSGo8qvCo6Vg4ko8RBHC3X/sZ
         EvWD/wSI5TyY4Tr9Hq0ekG7ZYTvdHi5maA/I0BNRJE3F7/b3LlD4efqfclIt49kVzNYm
         lVGgLTbBwOZgQob7rNhFjhrqWs+8DKnWiVPdZa4UjXQar8Mm3DV5HUIcABbBl6yuZ2CZ
         YmR60dEISDCV2i4tzWqPCU0XmbZ/hkiCRoH7n8NmM9Eb8ap0ljhPs4NZ6Kx/zyzu9fMq
         gqpMffLyp0bvKvEIAIQfr1tqlgZoLUSIREsULx/RG14OTjtu+M27ZBvWvuwbkQzQVbK0
         U8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747827461; x=1748432261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCrdqzJOZ+r5b5uVV31OhUBXHQ/N/WAYYeoHpygOTPU=;
        b=Ok57jT1aMDerFUK01nf/iu+SXtDfwsysRblrkrWCLh/v/PC7zircXcI8svNuK1ad8Q
         rF0zkEF5Bmh2SjWkqZZI0duA1Hbyyn2YMbwnzk2KczdJgCyJ0vFRSQ8UZqShYRnFFWc0
         d57pb/9tumcwJjQU06TEDmckz1eoHH9xdgrMugi2fDn+BgQ5RwSLIU5/DmXiyI5a+WNL
         e8iBwvuErrmHC4omrtiVG3OmqPrgX+eyZCMrkPNtpPsRdmBMJjWqYtgzZnsJc2f6CDTL
         EMeRerOYZL9Xv9dByW17vXvXwUprxS+zmbygh6kdttpG2Oy7Krlb/Cs3JFPDitDmLJqG
         8nAA==
X-Forwarded-Encrypted: i=1; AJvYcCUDDeGUQde2Pj0ggPdWXAVtWGOFtAwy86nfWpcULDb0AyR6LN5oL4HfrldwsdfYuaha00IAEG1EolB/EA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRHk2ymfmOsxFiycL4yI/FlhyTPWwndOwZshHSU9NrQZD1Dhp7
	zbqUuL/W3qBGWems5/AAae4drutbMfWCTNS9dKkZvKoqp3O7AFh05H+EES5QINkRY63eflXjVhU
	skQjVmaJ1cuqStY3+h91MuvMT39/TwqK9C0eWMHtjfI0mPigEDZpP
X-Gm-Gg: ASbGnct8eLA6AtRG1rI3a9dikHL3kMqLEiHAoXXPTwxRW54fFG938dYH8pTqDhUshnL
	pB4yvKk4bHzYCxzSzeXOErf5zNrQpGx95tJnPpVI7OJWzcdQ8OmtYxqGUR4iH/vb3GFEbIvPN5f
	c6BuzDQyhc4RCqd5sVsGE5jVfW5xauC4GYlA==
X-Google-Smtp-Source: AGHT+IFCo/ALKgv/Z21C+aw3mBdutX5RxjX/Wo2w4n4aM5gHN5BBDyHXag80H/nX8q25xzSbb6mE0D2HY4rNGDEyJkM=
X-Received: by 2002:a05:651c:b25:b0:328:604:9da8 with SMTP id
 38308e7fff4ca-328096986cdmr65342161fa.6.1747827460855; Wed, 21 May 2025
 04:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-14-apatel@ventanamicro.com> <87zffhk66f.ffs@tglx>
In-Reply-To: <87zffhk66f.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 21 May 2025 17:07:28 +0530
X-Gm-Features: AX0GCFuAf4tllvQPgn6FepAG3j7A7eRcGCaf4Wy67Bn_I5YzI5K6i_uIISbee40
Message-ID: <CAK9=C2XPsYMpNmd+0XfDduVY5r5qregABk=CggOCXac1ouoMnw@mail.gmail.com>
Subject: Re: [PATCH v3 13/23] irqchip: Add driver for the RPMI system MSI
 service group
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_043743_403455_DEC2B16F 
X-CRM114-Status: GOOD (  19.11  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXkgMTMsIDIwMjUgYXQgMTI6MjjigK9BTSBUaG9tYXMgR2xlaXhuZXIgPHRnbHhA
bGludXRyb25peC5kZT4gd3JvdGU6Cj4KPiBPbiBTdW4sIE1heSAxMSAyMDI1IGF0IDE5OjA5LCBB
bnVwIFBhdGVsIHdyb3RlOgo+ID4gK3N0YXRpYyBpbnQgcnBtaV9zeXNtc2lfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSAmcGRldi0+ZGV2Owo+ID4gKyAgICAgc3RydWN0IHJwbWlfc3lzbXNpX3ByaXYgKnByaXY7
Cj4gPiArICAgICBpbnQgcmM7Cj4gPiArCj4gPiArICAgICBwcml2ID0gZGV2bV9remFsbG9jKGRl
diwgc2l6ZW9mKCpwcml2KSwgR0ZQX0tFUk5FTCk7Cj4gPiArICAgICBpZiAoIXByaXYpCj4gPiAr
ICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4gKyAgICAgcHJpdi0+ZGV2ID0gZGV2Owo+
ID4gKyAgICAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgcHJpdik7Cj4gPiArCj4gPiArICAg
ICAvKiBTZXR1cCBtYWlsYm94IGNsaWVudCAqLwo+ID4gKyAgICAgcHJpdi0+Y2xpZW50LmRldiAg
ICAgICAgICAgICAgICA9IHByaXYtPmRldjsKPiA+ICsgICAgIHByaXYtPmNsaWVudC5yeF9jYWxs
YmFjayAgICAgICAgPSBOVUxMOwo+ID4gKyAgICAgcHJpdi0+Y2xpZW50LnR4X2Jsb2NrICAgICAg
ICAgICA9IGZhbHNlOwo+ID4gKyAgICAgcHJpdi0+Y2xpZW50Lmtub3dzX3R4ZG9uZSAgICAgICA9
IHRydWU7Cj4gPiArICAgICBwcml2LT5jbGllbnQudHhfdG91dCAgICAgICAgICAgID0gMDsKPiA+
ICsKPiA+ICsgICAgIC8qIFJlcXVlc3QgbWFpbGJveCBjaGFubmVsICovCj4gPiArICAgICBwcml2
LT5jaGFuID0gbWJveF9yZXF1ZXN0X2NoYW5uZWwoJnByaXYtPmNsaWVudCwgMCk7Cj4gPiArICAg
ICBpZiAoSVNfRVJSKHByaXYtPmNoYW4pKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gUFRSX0VS
Uihwcml2LT5jaGFuKTsKPiA+ICsKPiA+ICsgICAgIC8qIEdldCBudW1iZXIgb2Ygc3lzdGVtIE1T
SXMgKi8KPiA+ICsgICAgIHJjID0gcnBtaV9zeXNtc2lfZ2V0X251bV9tc2kocHJpdik7Cj4gPiAr
ICAgICBpZiAocmMgPCAxKSB7Cj4gPiArICAgICAgICAgICAgIG1ib3hfZnJlZV9jaGFubmVsKHBy
aXYtPmNoYW4pOwo+ID4gKyAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIC1F
Tk9ERVYsICJObyBzeXN0ZW0gTVNJcyBmb3VuZFxuIik7Cj4gPiArICAgICB9Cj4gPiArICAgICBw
cml2LT5ucl9pcnFzID0gcmM7Cj4gPiArCj4gPiArICAgICAvKiBTZXQgdGhlIGRldmljZSBNU0kg
ZG9tYWluIGlmIG5vdCBhdmFpbGFibGUgKi8KPiA+ICsgICAgIGlmICghZGV2X2dldF9tc2lfZG9t
YWluKGRldikpIHsKPiA+ICsgICAgICAgICAgICAgLyoKPiA+ICsgICAgICAgICAgICAgICogVGhl
IGRldmljZSBNU0kgZG9tYWluIGZvciBPRiBkZXZpY2VzIGlzIG9ubHkgc2V0IGF0IHRoZQo+ID4g
KyAgICAgICAgICAgICAgKiB0aW1lIG9mIHBvcHVsYXRpbmcvY3JlYXRpbmcgT0YgZGV2aWNlLiBJ
ZiB0aGUgZGV2aWNlIE1TSQo+ID4gKyAgICAgICAgICAgICAgKiBkb21haW4gaXMgZGlzY292ZXJl
ZCBsYXRlciBhZnRlciB0aGUgT0YgZGV2aWNlIGlzIGNyZWF0ZWQKPiA+ICsgICAgICAgICAgICAg
ICogdGhlbiB3ZSBuZWVkIHRvIHNldCBpdCBleHBsaWNpdGx5IGJlZm9yZSB1c2luZyBhbnkgcGxh
dGZvcm0KPiA+ICsgICAgICAgICAgICAgICogTVNJIGZ1bmN0aW9ucy4KPiA+ICsgICAgICAgICAg
ICAgICovCj4gPiArICAgICAgICAgICAgIGlmIChpc19vZl9ub2RlKGRldl9md25vZGUoZGV2KSkp
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgb2ZfbXNpX2NvbmZpZ3VyZShkZXYsIHRvX29mX25v
ZGUoZGV2X2Z3bm9kZShkZXYpKSk7Cj4gPiArCj4gPiArICAgICAgICAgICAgIGlmICghZGV2X2dl
dF9tc2lfZG9tYWluKGRldikpCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FUFJP
QkVfREVGRVI7Cj4KPiBUaGlzIGxlYWtzIHRoZSBjaGFubmVsLgoKQWhoIHllcywgSSB3aWxsIHVw
ZGF0ZS4KCj4KPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIGlmICghbXNpX2NyZWF0ZV9kZXZp
Y2VfaXJxX2RvbWFpbihkZXYsIE1TSV9ERUZBVUxUX0RPTUFJTiwKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAmcnBtaV9zeXNtc2lfdGVtcGxhdGUsCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJpdi0+bnJfaXJxcywgcHJpdiwg
cHJpdikpCj4gPiArICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLUVOT01F
TSwgImZhaWxlZCB0byBjcmVhdGUgTVNJIGlycSBkb21haW5cbiIpOwo+Cj4gRGl0dG8uCj4KPiBU
aGFua3MsCj4KPiAgICAgICAgIHRnbHgKClRoYW5rcywKQW51cAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
