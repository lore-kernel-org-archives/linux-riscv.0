Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9FCD489B8
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 12:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8S62jL/yhkDjDIkO5RdbrA6JoiHev2jxW2vQ25pA574=; b=RIg8+d4bRRyqM2
	SpWi5/nJB5+XJMuFfZLLqVsm17hhG0y4/Ji5p4zg895IDKAblYzztHGvaPsEJK6xtScV6SgFqP86F
	ArfvXW7LollpcpfCWo1p9urK38K1cTwRaW4xxoHoLDmelWZAw54S++S9Yq5sAnFkiiKzarcKjJp1+
	ilkW1qCQRqVwMIh+WF6AsL82nP4XJBInXrwOSjmCYizLUpb0XtFYZzAu85XoqMylFRgG7Jmjhn76/
	71kpvHQxT250GAvBihxBatAEaj7XSS3L1i51aISHgYmhx6uxEKBtZO0SRQy/F9zmflsUBk6kjzRb8
	bPXX7bMMXKFMIcVUG5lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhomb-000000026PQ-2JR4;
	Mon, 19 Jan 2026 12:55:01 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhomT-000000026NK-1RqL
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 12:54:54 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-382fb535b73so38926401fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 04:54:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768827289; cv=none;
        d=google.com; s=arc-20240605;
        b=YLkQoUzXcmHzp5Zn6IwRyGxYMEABhMR0+fGSku/8DvBFSwT2AlItxlU0kA0oGKEdjU
         il7RzfLYxXlrhyDu3zS/+cM5RkQXQz2cL8aWKlxUfUochTVmzYISrggjVmQOuMtE9Ino
         VtML9zYRDeth715TpwXa4EhimP9cPlo4Zqb0DR0/jnutP6evHNkPWzduuKQsy355XzqJ
         JFBvEKh8SlfRWRLKgbhPW9xR0jlTUBVX+nYqB1QuZPowUuWVYVy4pBxgsLRL26XAYGFH
         ax+NiVZrz2VuGVX0x6266mQMraQCcpd0GUBeMSb325BpocM2pk5gjMqpl7u5yqIhUuVw
         jwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qGur8UDGGcBE3Hmocy7dgLQOrypMFPCEL+jwBXmsi0Y=;
        fh=cbLrJal8GQvRKjjAzqC9TYsG5JCoVG2rkgyD8Yx+l7k=;
        b=N/Twvz4dT2+y1E9hbv78EnN/HXt8Xa+vLgZFg2u++Rec5uLt7PdNYLgkp79DuhT3It
         Y6X1u9VIbUCgjYEOspBTf5JG8xvbcsuN7Wv17wSFA0I1z1H4dQmUppJtmCn0Apott2Vh
         63WtT1U801MtOF5iPhfdX0ZJwPZQ6nvG5dxlwpAolABjWtZeth6OHtS5az1y/Ge2rulw
         GQo1RCIj09WB9F8yfSksRzJSJkP1IcUhzbtewwGF1fixqxFSh1Mnak08FxWOxKnPXdO4
         TV7ASM+ZBDMnHeyMLA32ewtGYr2dJYLbwbRP+mmdT+awDRYOozsdAFUtmGtxsOjixFZ0
         OGzQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768827289; x=1769432089; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGur8UDGGcBE3Hmocy7dgLQOrypMFPCEL+jwBXmsi0Y=;
        b=m0Qk2+2diidN2sBa6abqTOnvr6luXLgx/5cYq0z6nRoeoXA/ulmFm5jUAWhMdE6ABV
         Mtp3c9hX9kzUhG+HlLuHp7LP+bYKnw0Z4NmE/Wlhe9Q+7zF8xX00Hcylqz9TxtjuUOea
         PQ2sZCq2aD7sjoibA7UVyvVQL+Vtowg++S7knsa/lPpQUmMpflagi5QpBeTAC0Zrcfy2
         OmK73GOItud8qH8uk3NgpzHUu3jhbY1JaACc0F+saf2TuS4AMsc2F5BXxJjzWxOqQSi0
         p3EDAb/Hpu4cqXWd0lj1Pn9awNlpRe1SyyzQ6pSjw47jdIDqjckGZ3jrjD3/drziOOtF
         pkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768827289; x=1769432089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qGur8UDGGcBE3Hmocy7dgLQOrypMFPCEL+jwBXmsi0Y=;
        b=J6CLbU0FzRlzGRSoDnYdVK/Zw2wHXW1WLnWzJDCrETEgsby7Clf39VEOOaesNBzwxx
         oatvIZZ9oE+l/rBpcK6Mnz7RYwGx5Tyl+EhkLov/4nrhF7BN5bWAnDcqglrURNvg5bXi
         pmfwEn0T3VrtkWdMhDk6o+jBPcSP+/zHI//8JKHD3FyFkLhfMVwVaD/D8fmJ2TfSNQn/
         5t/M8ycjNWeLgECtNdfPboSQNM6D0QC35x0GpqGq90t3Vmb6PLZ3PwfRCiQhT50X9Kkv
         pYpn0OMf7qHbVBQEN86vPnuzM43u9cRTXecTQCC5KGZyryOuHTr+rtR8TNKfJmg+bljc
         FD3A==
X-Gm-Message-State: AOJu0YzgaxVYYWDmqwcAhS7A1m9DQ7qFlT4iWFEK+9JHxzAlYHBTv8oM
	ACCVZL7PZCYxFqwyMoGkJni5NqhTAA/3P4VL5/o+6PyTXIziI86lIT+RJ3KXeo3a/gm/NTL92iI
	IMpS6Hf2N7iw3QZLIsamPUOEckMFQLyU=
X-Gm-Gg: AY/fxX6P/6OrT6jgwlEzdW0uKC8PLHXzP5N2zJkhCNNuCWTeA9iRnNglwRwpmPSoyRk
	XGHWWWPZ5HZfT3snEarZnd6KwZ2TT00TPljHj7a6c+WjtHpVQpYk6o4GscqhEED98041f0uv8Qs
	DBy5oaelViEh/RDC0d8iJJkJuQBsTJBrTNbtsSMck5/hD20aEv1zKCo8FGrdPphKQGAK8AirQsI
	hBScDDMKMUvoXa1yqbl0iI/IyXMsnd4ZnvWHqROo/j+KGeuqHj2UqdOoBsxmXGxMnZDb7nOyDYt
	j7P/9oDDDf03Ww1d6YZtmxtdwz6gZfdFnEfh/MfNyhSwDB9XqBE+STuKlmycBdQxuXE6nc9ozN1
	n+YA2zPr0kGxby6VtLxh580ncI41cy+SnK28Yfuex3Q==
X-Received: by 2002:a05:651c:508:b0:383:5482:b853 with SMTP id
 38308e7fff4ca-383842bcaeemr36918321fa.21.1768827288971; Mon, 19 Jan 2026
 04:54:48 -0800 (PST)
MIME-Version: 1.0
References: <20251222-cstr-pwm-v1-1-e8916d976f8d@gmail.com> <CAJ-ks9mrpcLaeiGjBcXNqTUwo00Y2MhhHWnWauou6exU1y920Q@mail.gmail.com>
In-Reply-To: <CAJ-ks9mrpcLaeiGjBcXNqTUwo00Y2MhhHWnWauou6exU1y920Q@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 19 Jan 2026 07:54:12 -0500
X-Gm-Features: AZwV_Qix7Aukya090jJW0kiXMssAD-LNF3xuSuIb8jpVn4bil5K-YxfJFOSV4PI
Message-ID: <CAJ-ks9=LNe_STYSEJj7tvFNFzLsfEBKd+=Nbft4Kj-7+RbU99w@mail.gmail.com>
Subject: Re: [PATCH] drivers: pwm: replace `kernel::c_str!` with C-Strings
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_045453_402672_50657DA3 
X-CRM114-Status: GOOD (  18.21  )
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

T24gU2F0LCBKYW4gMywgMjAyNiBhdCA5OjMw4oCvUE0gVGFtaXIgRHViZXJzdGVpbiA8dGFtaXJk
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIERlYyAyMiwgMjAyNSBhdCA3OjI04oCvQU0g
VGFtaXIgRHViZXJzdGVpbiA8dGFtaXJkQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEZyb206
IFRhbWlyIER1YmVyc3RlaW4gPHRhbWlyZEBnbWFpbC5jb20+Cj4gPgo+ID4gQy1TdHJpbmcgbGl0
ZXJhbHMgd2VyZSBhZGRlZCBpbiBSdXN0IDEuNzcuIFJlcGxhY2UgaW5zdGFuY2VzIG9mCj4gPiBg
a2VybmVsOjpjX3N0ciFgIHdpdGggQy1TdHJpbmcgbGl0ZXJhbHMgd2hlcmUgcG9zc2libGUuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogVGFtaXIgRHViZXJzdGVpbiA8dGFtaXJkQGdtYWlsLmNvbT4K
PiA+IC0tLQo+ID4gIGRyaXZlcnMvcHdtL3B3bV90aDE1MjAucnMgfCAzICstLQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9wd20vcHdtX3RoMTUyMC5ycyBiL2RyaXZlcnMvcHdtL3B3bV90aDE1MjAu
cnMKPiA+IGluZGV4IGUzYjdlNzczNTZmYy4uOGFlOGY4NTJlYzAyIDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9wd20vcHdtX3RoMTUyMC5ycwo+ID4gKysrIGIvZHJpdmVycy9wd20vcHdtX3RoMTUy
MC5ycwo+ID4gQEAgLTIyLDcgKzIyLDYgQEAKPiA+Cj4gPiAgdXNlIGNvcmU6Om9wczo6RGVyZWY7
Cj4gPiAgdXNlIGtlcm5lbDo6ewo+ID4gLSAgICBjX3N0ciwKPiA+ICAgICAgY2xrOjpDbGssCj4g
PiAgICAgIGRldmljZTo6e0JvdW5kLCBDb3JlLCBEZXZpY2V9LAo+ID4gICAgICBkZXZyZXMsCj4g
PiBAQCAtMzI3LDcgKzMyNiw3IEBAIGZuIGRyb3Aoc2VsZjogUGluPCZtdXQgU2VsZj4pIHsKPiA+
ICAgICAgT0ZfVEFCTEUsCj4gPiAgICAgIE1PRFVMRV9PRl9UQUJMRSwKPiA+ICAgICAgPFRoMTUy
MFB3bVBsYXRmb3JtRHJpdmVyIGFzIHBsYXRmb3JtOjpEcml2ZXI+OjpJZEluZm8sCj4gPiAtICAg
IFsob2Y6OkRldmljZUlkOjpuZXcoY19zdHIhKCJ0aGVhZCx0aDE1MjAtcHdtIikpLCAoKSldCj4g
PiArICAgIFsob2Y6OkRldmljZUlkOjpuZXcoYyJ0aGVhZCx0aDE1MjAtcHdtIiksICgpKV0KPiA+
ICApOwo+ID4KPiA+ICBpbXBsIHBsYXRmb3JtOjpEcml2ZXIgZm9yIFRoMTUyMFB3bVBsYXRmb3Jt
RHJpdmVyIHsKPiA+Cj4gPiAtLS0KPiA+IGJhc2UtY29tbWl0OiA4ZjBiNGNjZTQ0ODFmYjIyNjUz
Njk3Y2NlZDhkMGQwNDAyN2NiMWU4Cj4gPiBjaGFuZ2UtaWQ6IDIwMjUxMjIyLWNzdHItcHdtLWM5
YjlhNDcwMTE1Nwo+ID4KPiA+IEJlc3QgcmVnYXJkcywKPiA+IC0tCj4gPiBUYW1pciBEdWJlcnN0
ZWluIDx0YW1pcmRAZ21haWwuY29tPgo+ID4KPgo+IEBVd2UgY291bGQgeW91IHBsZWFzZSBoYXZl
IGEgbG9vaz8KPgo+IENoZWVycy4KPiBUYW1pcgoKRHJldywgR3VvLCBvciBGdTogY291bGQgeW91
IHBsZWFzZSB0YWtlIHRoaXMgdGhyb3VnaCB5b3VyIHRyZWUsIG9yCndvdWxkIHlvdSBiZSBPSyB3
aXRoIGl0IGdvaW5nIHRocm91Z2ggcnVzdC1uZXh0PwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
