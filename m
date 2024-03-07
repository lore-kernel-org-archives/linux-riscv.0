Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1385C54798
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 15:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fgamnU8sGzyOL5LEPaVvu6M0ui4/MlOkihrZM/OXfrU=; b=uLVQMCv911OCkX
	XjH2Jt/EJAOOs4aS7tU+crwG/VPqDZnHyXP1fQqsm2mKeoYkL4xpj2UK3kJSfy6yPnJeY1xqs/iZH
	eD6TODzvrsg7cFRSDfdUPdpuGO0OcQ8Xqemmg2AaIxhofo+SX3BmPKcaYhGy5SjVXrE8AAXnvJ6ii
	ymMWsbVQ0J561PW7F4C+SnNkAol1Tzp23FZortoN7HAe8SmQ+KJF/6ObvKys8Z1dj82orQ/7Vy5tp
	7gGp0Rx52h0lGzcoDLQ+UNr5rPPsN+B0s4t6vTWNfFZOkzp83+iLl+0vjByWa2p5Ian4+MejY8SYU
	+rWE4DyPoktP0UKA9SpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riFcr-00000005GsM-0AJt;
	Thu, 07 Mar 2024 15:25:41 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riFcl-00000005GqS-46IX
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 15:25:39 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-51344bebe2fso942069e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Mar 2024 07:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709825133; x=1710429933; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4QjOqiWioy7Z+s/XLgIt5Rc6ziLvdsXpnYEthSWbOk=;
        b=ODnWnotkUCEUlSXNEdu0Ma08NAWzXcnaCltQNkCA5kfUzE4zibryvU1rTUFmr2vLWQ
         gY16u9bkaVlknIBhqnzzINVz5gucrHVuPYj9yPD9Bxg3X2vWlt0rZCRRaSvxrDe2AwIJ
         PLEC+qLZ3VWE2PQpCE7Mgx/0OdOWDWh+Hi4ZGe6Wcv38AiLd67lIAsAAyJf1sT3Dv9Gi
         SnNRZjKD8lGP+EBJ5W0aLnWI24/VSQLwLW3gJtthcDq/47E/GbAJB00PtqQht+frDCCZ
         1/W8zus1VGWBOII68OfXIX0sqnuWHKw76G8+k54urVHrhNIGFKx3n8JdLxlzCAp3eZzb
         DDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709825133; x=1710429933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4QjOqiWioy7Z+s/XLgIt5Rc6ziLvdsXpnYEthSWbOk=;
        b=PPUknDCGMPu0hx1I2wR5Qft55ZL4fKGsusrPmwUpTmfl+vCT9j15jANbp755Ln04RW
         SxHYqdHao95pLsh4d/PGXGwJbbF115E28xSs/b54HCSsPsOAsP7cHMWJ5TB1olWXC0ht
         3bXjzwDLo5QgFP2Bo+zkp5rviWu3ajFz5ooJ/D6eNo4Zebe66afmxON7/2zaSU/KqfkN
         chRhDTxbi53NguChkYMXSPGz8WHkgDyQhhqn/ZOQBE+OIAHaxNaIIUyzEiKq22ERj6sj
         15q6NeD2JTrO+F3gIXYJhTEEMLKRiCdNGQ8G/zMOdY6ILtVEhncYo9d2RZ2fyTOfN1q0
         cn8w==
X-Forwarded-Encrypted: i=1; AJvYcCUZFmt78UTf0cZjfwuXCY/8/4l3ys14KmwjKD/e5q3fPw+dQuNwjk5TglUnjnoH3avlI8eJ6YW8vyK4raEqzEoHcUBoGZ25yCTFupCEtHIb
X-Gm-Message-State: AOJu0Yx/tWpat5xFKXUp0xYD16ZQdWjp6tN+gMiJdDCl9MxUDhWwin1B
	Eq3yuqmC3jryJZb7i0D4+Gy4buTy8k5743XJv+ubvX+Bb5ej3wpixh6D9xofhe2BTYAMKRVp7xu
	BJp8gFBYbo2By2p2uxVwb7C89PZfvCzgre3l0+g==
X-Google-Smtp-Source: AGHT+IHni8UYaPdT07e1XtlA0mP9S9vuUEv4b9Fh2GsvReSwDcrJOqBGXFRA8/BIJlLaDhNaDP/WuGDOz3ZpmDlzkRU=
X-Received: by 2002:a05:6512:20c9:b0:513:ece:1fe1 with SMTP id
 u9-20020a05651220c900b005130ece1fe1mr1477863lfr.54.1709825133335; Thu, 07 Mar
 2024 07:25:33 -0800 (PST)
MIME-Version: 1.0
References: <20240226040746.1396416-1-apatel@ventanamicro.com>
 <20240226040746.1396416-9-apatel@ventanamicro.com> <87y1avbboj.fsf@all.your.base.are.belong.to.us>
 <CAK9=C2Ud+CJzWfY0Lp97OMt9QvJBFX=hHJidn_90XY5cEB9LHw@mail.gmail.com> <871q8mdr2i.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <871q8mdr2i.fsf@all.your.base.are.belong.to.us>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 7 Mar 2024 20:55:21 +0530
Message-ID: <CAK9=C2UfpTtQ6DOSE7-EVsC+zyYAY6CvigQ6iDLuLgQNj2e5vw@mail.gmail.com>
Subject: Re: [PATCH v15 08/10] irqchip/riscv-aplic: Add support for MSI-mode
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_072536_059579_48FFC84C 
X-CRM114-Status: GOOD (  22.96  )
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

T24gVGh1LCBNYXIgNywgMjAyNCBhdCA4OjMx4oCvUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4g
d3JpdGVzOgo+Cj4gPiBPbiBXZWQsIE1hciA2LCAyMDI0IGF0IDk6MjLigK9QTSBCasO2cm4gVMO2
cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Pgo+ID4+IEFudXAgUGF0ZWwgPGFwYXRl
bEB2ZW50YW5hbWljcm8uY29tPiB3cml0ZXM6Cj4gPj4KPiA+PiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1zaS5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1y
aXNjdi1hcGxpYy1tc2kuYwo+ID4+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+PiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uYjJhMjVlMDExYmIyCj4gPj4gPiAtLS0gL2Rldi9udWxsCj4gPj4gPiAr
KysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1zaS5jCj4gPj4gPiArc3RhdGlj
IHZvaWQgYXBsaWNfbXNpX3dyaXRlX21zZyhzdHJ1Y3QgaXJxX2RhdGEgKmQsIHN0cnVjdCBtc2lf
bXNnICptc2cpCj4gPj4gPiArewo+ID4+ID4gKyAgICAgdW5zaWduZWQgaW50IGdyb3VwX2luZGV4
LCBoYXJ0X2luZGV4LCBndWVzdF9pbmRleCwgdmFsOwo+ID4+ID4gKyAgICAgc3RydWN0IGFwbGlj
X3ByaXYgKnByaXYgPSBpcnFfZGF0YV9nZXRfaXJxX2NoaXBfZGF0YShkKTsKPiA+PiA+ICsgICAg
IHN0cnVjdCBhcGxpY19tc2ljZmcgKm1jID0gJnByaXYtPm1zaWNmZzsKPiA+PiA+ICsgICAgIHBo
eXNfYWRkcl90IHRwcG4sIHRicHBuLCBtc2dfYWRkcjsKPiA+PiA+ICsgICAgIHZvaWQgX19pb21l
bSAqdGFyZ2V0Owo+ID4+ID4gKwo+ID4+ID4gKyAgICAgLyogRm9yIHplcm9lZCBNU0ksIHNpbXBs
eSB3cml0ZSB6ZXJvIGludG8gdGhlIHRhcmdldCByZWdpc3RlciAqLwo+ID4+ID4gKyAgICAgaWYg
KCFtc2ctPmFkZHJlc3NfaGkgJiYgIW1zZy0+YWRkcmVzc19sbyAmJiAhbXNnLT5kYXRhKSB7Cj4g
Pj4gPiArICAgICAgICAgICAgIHRhcmdldCA9IHByaXYtPnJlZ3MgKyBBUExJQ19UQVJHRVRfQkFT
RTsKPiA+PiA+ICsgICAgICAgICAgICAgdGFyZ2V0ICs9IChkLT5od2lycSAtIDEpICogc2l6ZW9m
KHUzMik7Cj4gPj4gPiArICAgICAgICAgICAgIHdyaXRlbCgwLCB0YXJnZXQpOwo+ID4+Cj4gPj4g
SXMgdGhlIGZlbmNlIG5lZWRlZCBoZXJlICh3cml0ZWxfcmVsYXhlZCgpKS4uLgo+ID4KPiA+IFRo
ZSBwY2lfd3JpdGVfbXNnX21zaXgoKSAoY2FsbGVkIHZpYSBwY2lfbXNpX2RvbWFpbl93cml0ZV9t
c2coKSkKPiA+IHVzZXMgd3JpdGVsKCkgaGVuY2UgdGFraW5nIGluc3BpcmF0aW9uIGZyb20gdGhh
dCB3ZSB1c2Ugd3JpdGVsKCkgb3ZlciBoZXJlCj4gPiBhcyB3ZWxsLgo+ID4KPiA+IElmIHRoYXQn
cyB3cm9uZyB0aGVuIHBjaV93cml0ZV9tc2dfbXNpeCgpIG11c3QgYmUgZml4ZWQgYXMgd2VsbC4K
Pgo+IEh1aD8gVGhlIHdyaXRlbCgpcyBpbiBwY2lfd3JpdGVfbXNnX21zaXgoKSBhcmUgYmVjYXVz
ZSB0aGVyZSdzIGFuCj4gb3JkZXJpbmcgY29uc3RyYWludCwgYW5kIGNvZGUgd291bGQgYmUgYnJv
a2VuIHcvbyBpdC4gTXkgcXVlc3Rpb24gd2FzCj4gIndoYXQgYXJlIHRoZSBvcmRlcmluZyBjb25z
dHJhaW50cyBmb3IgdGhpcyBwaWVjZSBvZiBjb2RlIiwgYmVjYXVzZSBpdAo+IGxvb2tzIGxpa2Ug
dGhpcyBpcyBhIHNpbmdsZSBJL08gd3JpdGUgd2l0aG91dCBhbnkgb3JkZXJpbmcgY29uc3RyYWlu
dHMuCgpXaGF0ZXZlciBvcmRlcmluZyBjb25zdHJhaW50cyBhcHBseSB0byBwY2lfd3JpdGVfbXNn
X21zaXgoKSBhbHNvCmFwcGx5IHRvIEFQTElDIE1TSS1tb2RlIGJlY2F1c2UgYm90aCBjcmVhdGUg
dGhlIGxlYWYtbGV2ZWwgSVJRCmRvbWFpbiBmb3IgdGhlIGNsaWVudCBkZXZpY2UgZHJpdmVyIChQ
Q0llIG9yIFBsYXRmb3JtIGRldmljZSkgd2hvc2UKcGFyZW50IGlzIElNU0lDIGJhc2UgZG9tYWlu
LgoKPgo+IEknbSBub3QgYSBmYW4gb2Ygc3ByaW5rbGluZyBmZW5jZXMgYXJvdW5kICJ0byBiZSBz
YWZlIiwgYnV0IEkgZG9uJ3Qgd2FudAo+IHRvIGRlbGF5IHRoZSB2MTYgYmVjYXVzZSBvZiBpdC4g
SXQgY2FuIGJlIGZpeGVkIGxhdGVyLCBpZiBpdCdzIG5vdAo+IG5lZWRlZC4KCkkgZG9uJ3QgdGhp
bmsgdGhlcmUgaXMgYSBjbGVhciB3YXkgb2YgcHJvdmluZyB0aGF0IHVzaW5nIHdyaXRlX3JlbGF4
ZWQoKQppbiBhcGxpY19tc2lfd3JpdGVfbXNnKCkgaXMgc2FmZSBjb25zaWRlcmluZyB0aGVyZSBp
cyBhIHZhc3QgdmFyaWV0eQpvZiBwbGF0Zm9ybSBkcml2ZXJzIHdobyB3b3VsZCBiZSBjbGllbnRz
IG9mIHRoZSBBUExJQyBNU0ktbW9kZQpkb21haW4uCgpJIGFncmVlIHRoYXQgd2Ugc2hvdWxkIGRl
YWwgd2l0aCB0aGlzIGxhdGVyLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
