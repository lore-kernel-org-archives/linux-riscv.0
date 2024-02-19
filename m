Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99E8C48BC3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 09:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lOTjnN0HUcWe1oDMeipCcRkjbG8sci2eQz/BR1Ukoh0=; b=YQzpXVP9XPef+/
	X3b6RjReAd/TfI04Gv4eGziB2/Z0/JhOK7UgMUmOICLwpSUWeSwv1z9Fmyllb3XqnQognoRtBCFku
	MCjaAa48qq3if8AYGA2e2zpeVp9rEohfPG6QxNkinH+SSWYEqE9ZNwONGHb49J9WFBAuHNTcAQRa4
	BTU5WdJvK8b+s/7HC3SjqhzjXJHzodEVPM3q1SZAl2Ji7y+7IUlL+cVQLzCI8Mr2nHzYryLS3MR3P
	wovblmS+EATABqdyL/89C+Eyk7FXke9VezJuYpxGt+JItI7EKS+DL+UaoLPphs5zXHvkqO5CoJVF9
	vfQBuodW/3uTK5A4K4kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc03t-00000009qCQ-0tyG;
	Mon, 19 Feb 2024 09:35:45 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc03o-00000009qBO-3uMH
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 09:35:44 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-511570b2f49so4232906e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 01:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708335339; x=1708940139; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YXFCVZu0xeTYReG8iTx+B6CeSN2wh50vnPVuE5JAz4=;
        b=FBnc3oGxJ7PTx6v7wQJ55bDXvQQlEEHzBrr5x8iP1yyJscpgp9E7gb6F3XKXno+S4L
         N6BSynlgoGonTuE5Ps5u2UK2GKOHptP2ZBZmwWEb2uxblhh+oWqZX1re4IxH/xhyz2lq
         Ox8cVUTjnYHZu4B2rXNrdhLmmvAP63cRKN5N+9zpTojcNf9XZMnfLrZ0YK+CTJK+gwWF
         cYBLeMu1LqXNS5K8k/5IcDS2UqlE5W5bhb6ZEVbUdMwgKQ35QsVzc/zCAUwZgHzjtUFi
         qRmmvZpq1+f+YeeKCvsHk0ZQ1xTiochKQYqlprC9+wUaqeUJiL/dGiLLsc3whOAARaiE
         Jm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708335339; x=1708940139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YXFCVZu0xeTYReG8iTx+B6CeSN2wh50vnPVuE5JAz4=;
        b=LdNtKL4TE7CI9lZFR4rA9v1wU4zbMEX0ULZ6wZCVOPWVyMLow4frMC1Ik1onNWO2gp
         RKCY6DF75ceRhO5Rvyxa00G0qDS0zZoAnMjUHijKtBT2KNGDVsVnpcdTUJeuDEiWJE4L
         zdNt2TXYIUpYwcIUyypv2xGNvD3uEXbMbPaZ2hY2j7s7C09aNg/fcbwLjZFJsbvdYoO9
         nFHYnluLgvJHcm7z/MpAvQSnz0lIHIKb3Kywf/UZwnNfcqgDAflHN/1krdppHRv2l1Qw
         aPB8ELpVcC59d2FqAp1XkjSVyth/l7bUBvhZWQyprUIq0VplyMeX1oMC5Ru92DepGuK+
         m5eA==
X-Forwarded-Encrypted: i=1; AJvYcCWvxsW1dj29QyEDvGuEaRMU/szoa81XZh2tLIG62qFW31YPYT+nTdoZ3zVEz/9xuLWbEtHK2xF4JYsSKZWdF5fRQVAqGSf0qFtN8ZszZJZs
X-Gm-Message-State: AOJu0YwB3Fb0b4RRxnoJLkRbkOxUlVSUTRM72L6pEBGw4TkAjdKvrQP/
	0sCDvl0IBLwqNnkUvW5GjahOuYhpkdbMvstxrZxBrJekmhtDIieL4eIOQiVZlgWRJsqV79ZbZex
	aJXIadp2jcVv8JwJm0tLaUiGaibqaVUmrTeMN+g==
X-Google-Smtp-Source: AGHT+IHKBoXvqDfBDeOhzuqjW0NvaEpjXXu31tio9dyFtOxU3tQdArUbgNnkiYg2tcU8DAO0JGXTtbfHK108EupdJdU=
X-Received: by 2002:a05:6512:3254:b0:512:bb2c:9221 with SMTP id
 c20-20020a056512325400b00512bb2c9221mr306467lfr.34.1708335339012; Mon, 19 Feb
 2024 01:35:39 -0800 (PST)
MIME-Version: 1.0
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <20240127161753.114685-23-apatel@ventanamicro.com> <875xyocewt.ffs@tglx>
In-Reply-To: <875xyocewt.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 19 Feb 2024 15:05:27 +0530
Message-ID: <CAK9=C2UO4=H9jPXFjJhS5b9kPezVutto1aReAmH3rU_uUhf9=g@mail.gmail.com>
Subject: Re: [PATCH v12 22/25] irqchip: Add RISC-V advanced PLIC driver for direct-mode
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_013542_528837_F9AFBFCA 
X-CRM114-Status: GOOD (  18.77  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBGZWIgMTcsIDIwMjQgYXQgMjoyMOKAr0FNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFNhdCwgSmFuIDI3IDIwMjQgYXQgMjE6NDcsIEFu
dXAgUGF0ZWwgd3JvdGU6Cj4gPiArc3RhdGljIGludCBhcGxpY19kaXJlY3RfaXJxZG9tYWluX3Ry
YW5zbGF0ZShzdHJ1Y3QgaXJxX2RvbWFpbiAqZCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBpcnFfZndzcGVjICpmd3NwZWMsCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nICpod2lycSwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAqdHlwZSkK
Pgo+IFBsZWFzZSBhbGlnbiB0aGUgYXJndW1lbnRzIHRvIHRoZSBmaXJzdCBhcmd1bWVudCBvZiB0
aGUgZmlyc3QgbGluZSBhbmQKPiB1c2UgdGhlIDEwMCBjaGFyYWN0ZXJzLCBpLmUuCj4KPiBzdGF0
aWMgaW50IGFwbGljX2RpcmVjdF9pcnFkb21haW5fdHJhbnNsYXRlKHN0cnVjdCBpcnFfZG9tYWlu
ICpkLCBzdHJ1Y3QgaXJxX2Z3c3BlYyAqZndzcGVjLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyAqaHdpcnEsIHVuc2lnbmVkIGludCAq
dHlwZSkKPiB7Cj4KPiBBbGwgb3ZlciB0aGUgcGxhY2UuCgpPa2F5LCBJIHdpbGwgdXBkYXRlLgoK
Pgo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBhcGxpY19wcml2ICpwcml2ID0gZC0+aG9zdF9kYXRh
Owo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIGFwbGljX2lycWRvbWFpbl90cmFuc2xhdGUoZndzcGVj
LCBwcml2LT5nc2lfYmFzZSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGh3aXJxLCB0eXBlKTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGludCBhcGxpY19kaXJl
Y3RfaXJxZG9tYWluX2FsbG9jKHN0cnVjdCBpcnFfZG9tYWluICpkb21haW4sCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCB2aXJxLCB1bnNpZ25lZCBp
bnQgbnJfaXJxcywKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAq
YXJnKQo+ID4gK3sKPiA+ICsgICAgIGludCBpLCByZXQ7Cj4gPiArICAgICB1bnNpZ25lZCBpbnQg
dHlwZTsKPiA+ICsgICAgIGlycV9od19udW1iZXJfdCBod2lycTsKPiA+ICsgICAgIHN0cnVjdCBp
cnFfZndzcGVjICpmd3NwZWMgPSBhcmc7Cj4gPiArICAgICBzdHJ1Y3QgYXBsaWNfcHJpdiAqcHJp
diA9IGRvbWFpbi0+aG9zdF9kYXRhOwo+ID4gKyAgICAgc3RydWN0IGFwbGljX2RpcmVjdCAqZGly
ZWN0ID0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb250YWluZXJfb2YocHJpdiwgc3RydWN0
IGFwbGljX2RpcmVjdCwgcHJpdik7Cj4KPiBWYXJpYWJsZSBvcmRlcmluZy4gUGxlYXNlIG1ha2Ug
dGhpcyBjb25zaXN0ZW50IGFjY29yZGluZyB0byBkb2N1bWVudGF0aW9uLgoKT2theSwgSSB3aWxs
IHVwZGF0ZS4KCj4KPiA+ICsgICAgIHJldCA9IGFwbGljX2lycWRvbWFpbl90cmFuc2xhdGUoZndz
cGVjLCBwcml2LT5nc2lfYmFzZSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgJmh3aXJxLCAmdHlwZSk7Cj4gPiArICAgICBpZiAocmV0KQo+ID4gKyAgICAgICAgICAg
ICByZXR1cm4gcmV0Owo+ID4gKwo+ID4gKyAgICAgZm9yIChpID0gMDsgaSA8IG5yX2lycXM7IGkr
Kykgewo+ID4gKyAgICAgICAgICAgICBpcnFfZG9tYWluX3NldF9pbmZvKGRvbWFpbiwgdmlycSAr
IGksIGh3aXJxICsgaSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmYXBs
aWNfZGlyZWN0X2NoaXAsIHByaXYsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaGFuZGxlX2Zhc3Rlb2lfaXJxLCBOVUxMLCBOVUxMKTsKPiA+ICsgICAgICAgICAgICAgaXJx
X3NldF9hZmZpbml0eSh2aXJxICsgaSwgJmRpcmVjdC0+bG1hc2spOwo+ID4gKyAgICAgICAgICAg
ICAvKiBTZWUgdGhlIHJlYXNvbiBkZXNjcmliZWQgaW4gYXBsaWNfbXNpX2lycWRvbWFpbl9hbGxv
YygpICovCj4KPiBJIHN0aWxsIGhhdmUgdG8gdW5kZXJzdGFuZCB0aGF0ICJyZWFzb24iLiA6KQoK
TGlrZSBtZW50aW9uZWQgb24gYW5vdGhlciBwYXRjaCwgSSB3aWxsIGRyb3AgaXQgZm9yIG5vdy4g
SWYgcmVxdWlyZWQKdGhlbiB3ZSBjYW4gYnJpbmcgaXQgYmFjayBhcyBhIHNlcGFyYXRlIHBhdGNo
IHdpdGggY2xlYXIgcmVhc29uaW5nLgoKPgo+ID4gKyAgICAgICAgICAgICBpcnFfc2V0X3N0YXR1
c19mbGFncyh2aXJxICsgaSwgSVJRX0RJU0FCTEVfVU5MQVpZKTsKPiA+ICsgICAgIH0KPgo+IFRo
YW5rcywKPgo+ICAgICAgICAgdGdseAoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
