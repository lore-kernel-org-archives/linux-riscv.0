Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC81E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 15:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7E5BjF2DouEDvfnnn9M5cxB3V+BJtpNd+tFiXoy4TzI=; b=y6SR34rYZbNM9X
	IdZnTNEqeanU0OfailxaTzUUJbKxZbRLUU3UnGwlzG5gdUdEf7M6pE/bgDs9DgiDCpQ5KrmYAKA5j
	OCXecL5Jf190LVkIx2LiYyiKjXOM/0Po5N2eE1ZxtNMp+Lq6sCo0kqEVq6yCakwhJC4CBaElf6lfn
	yPQnEO2NawrrOZbTw9QPQN1fss+k07Az0NYZIz8eNTNm6FrfuInjauRrscGVh06zchKuudrS6BRAW
	buZzMoka1AdxWufNvAvzv9bgqJ5Lwr77PEdYVek80BrqoIGS+BpLjWOc6wgqh34qHuFdhdnlx34K8
	/wDRswBJxGzKTAjU5dRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXioF-00000008qdA-0X1J;
	Tue, 14 Jan 2025 15:26:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXioC-00000008qck-1kK0
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 15:26:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 44EACA417B0
	for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 15:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13DA1C4AF09
	for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736868383;
	bh=ZthyYuufIyQbKQa92INzA8IczLKQwFsfvTd24Qk7aeA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Jong+J7NPqkLBT6xJT0swFS32aF2o1jqXit1P0hTiDKQbZZgbuMdwayNb02HDjGwx
	 D7K28+CUlZTDaTHjV/toRHv4+J0pbnnWOUMkrvhCSpGPSp1ZYmjBYpjiVrej5iiHLV
	 1KGmS27cPxOGygOMmgqVEfjCD+TaOnVtsIYM1HyJu0NP8ubocKIoJKvm64Olo6/u2Q
	 nlLmN5DOT192fO5JGo3+CCGneLV6R4jxo9Iu6//7WOucetB4m/MESX5T+vQO5K4LuY
	 CrLQP6erxjtW4q/eWThzwsKwIj1UZvlyNNdhPje2pfcDanEr8sJZ/QccL/xoPqnfaI
	 taz2SqZCL4Pyw==
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e4419a47887so7784342276.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 07:26:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+uSGEZ16S35HDeyHf2LBKy1vhwNVWoOGUupW3KHBk+Le57Mrda0mGeOi5eFvZqT2b4Fhlyb52lCalAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4XgFFEOSkKJGLrT4mi1N6eXpNL55bIfU2lHnzBc6OA1hm7Ywl
	rQU4hAjYF+1mzsJqO6LnoMgQ/T3N4pGlDg11phecjazBJXV+y4mboXQrOgJ92TioKkxgzAnSvFU
	FafRzG0kXvp+Q3o7xJ/WoXU3/KQ==
X-Google-Smtp-Source: AGHT+IExVBEzWAUJXwyYlK0uvMzvtlLQ+fzi7QOOF3BosmP+vxXhkN7SRFWGE9B56mEG038CPJUd7Ap1puK0T1B38UE=
X-Received: by 2002:a05:690c:30a:b0:6ef:4ed2:7dfe with SMTP id
 00721157ae682-6f5312d637amr205742707b3.31.1736868382282; Tue, 14 Jan 2025
 07:26:22 -0800 (PST)
MIME-Version: 1.0
References: <20241231161400.214307-1-robh@kernel.org> <CAMuHMdVKRJ4z-s6hF+=RyMk70n_TU8fQ4tu6A4NVzQPgakMBsQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVKRJ4z-s6hF+=RyMk70n_TU8fQ4tu6A4NVzQPgakMBsQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 14 Jan 2025 09:25:52 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJPHOv5355tD40B7zgFpRJ4BAoM-d6fQOaKKFWJ0-9fuQ@mail.gmail.com>
X-Gm-Features: AbW1kva6_ooyD1p2jq7gDH04fWOMaxMLr6Lutc8hSRCSj_NSTxu9w_H1zdDkP8c
Message-ID: <CAL_JsqJPHOv5355tD40B7zgFpRJ4BAoM-d6fQOaKKFWJ0-9fuQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] riscv: cacheinfo: Use of_property_present() for
 non-boolean properties
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_072624_525984_33F7ED82 
X-CRM114-Status: GOOD (  15.91  )
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

T24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgNDo1MuKAr0FNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+Cj4gSGkgUm9iLAo+Cj4gVGhhbmtzIGZvciB5b3Vy
IHBhdGNoIQo+Cj4gT24gVHVlLCBEZWMgMzEsIDIwMjQgYXQgNToxNOKAr1BNIFJvYiBIZXJyaW5n
IChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gVGhlIHVzZSBvZiBvZl9wcm9wZXJ0
eV9yZWFkX2Jvb2woKSBmb3Igbm9uLWJvb2xlYW4gcHJvcGVydGllcyBpcwo+ID4gZGVwcmVjYXRl
ZCBpbiBmYXZvciBvZiBvZl9wcm9wZXJ0eV9wcmVzZW50KCkgd2hlbiB0ZXN0aW5nIGZvciBwcm9w
ZXJ0eQo+ID4gcHJlc2VuY2UuCj4KPiBQbGVhc2UgYWRkCj4KPiAgICAgVGhpcyBnZXRzIHJpZCBv
ZiB0aGUgZm9sbG93aW5nIGJvb3Qgd2FybmluZ3M6Cj4KPiAgICAgICAgIE9GOiAvY3B1cy9jcHVA
MDogUmVhZCBvZiBib29sZWFuIHByb3BlcnR5ICdpLWNhY2hlLXNpemUnIHdpdGggYSB2YWx1ZS4K
PiAgICAgICAgIE9GOiAvY3B1cy9jcHVAMDogUmVhZCBvZiBib29sZWFuIHByb3BlcnR5ICdkLWNh
Y2hlLXNpemUnIHdpdGggYSB2YWx1ZS4KPiAgICAgICAgIE9GOiAvc29jL2NhY2hlLWNvbnRyb2xs
ZXJAMTM0MDAwMDA6IFJlYWQgb2YgYm9vbGVhbiBwcm9wZXJ0eQo+ICdjYWNoZS1zaXplJyB3aXRo
IGEgdmFsdWUuCj4KPiBzbyB0aGUgbmV4dCBwZXJzb24gZG9lc24ndCBoYXZlIHRvIGRpdmUgaW50
byB0aGUgY29kZSB0byBmaW5kIHRoaXMgcGF0Y2ggOy0pCgpJZiB0aGlzIHBhdGNoIGhhZCBiZWVu
IHBpY2tlZCB1cCBpbiBhIHRpbWVseSBtYW5uZXIsIG5vIG9uZSB3b3VsZCBoYXZlCmV2ZXIgc2Vl
biB0aGF0IHdhcm5pbmcuIEknbGwgbGVhdmUgaXQgdG8gdGhlIHJpc2N2IG1haW50YWluZXJzIHRv
IGFkZAp0aGF0IGlmIHRoZXkgZGVzaXJlLiBUaGF0IHdhcm5pbmcgZGlkbid0IGV4aXN0IHdoZW4g
dGhpcyBwYXRjaCB3YXMKd3JpdHRlbi4KClJvYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
