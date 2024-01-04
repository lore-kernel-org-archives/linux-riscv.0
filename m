Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9B2C47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 12:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nWkkHvpCo0rxYDNhByy10KKDZxt/30MS8LNWZ8T6q0g=; b=y486gYiGTrRJvt
	hY1LjqVT4LuyCH88/QWt8QNVNxvykQAMaAeq5d2BPtWhqDsEck5JzROl7xB6jkmIzwDxGhLaQpQOa
	pchb7b2jtLpAba/4Bu1BhNqhUYXaMYPndcCRElf+4lbcoGQPBcmFeSAQUgwziGDqlrxlxCiQZ+2IW
	UMaVu/wB4eYR7wspXJ0yj5nBmstWmQrBWJ3D0fcfU31TX8a7me/mpE+4D/CG/WfH3bdtAPIjBKmEb
	jYZ1LqpwYxKWQG0bVWDueNPE/fGlR81YlpLGKrVQpaglDnKsI2nR/u+WxQFuE5i5g9b/s4EGyY4f1
	n4LkkeQrbsUIcA7IVv/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLMvR-00Dyls-2b;
	Thu, 04 Jan 2024 12:34:17 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLMvO-00DykJ-0p
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 12:34:16 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-55614bb435aso2522192a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 04:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704371648; x=1704976448; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ik4uyCYv2TQarb31EWuXmmWrYINJlUytsNJyudVrGMk=;
        b=fs/ytKF/PTRt9ygdorz1c6fUO+g9ZS6x+krD87E4vAj3Z/CsLY+mnrKTC6aYb6i6sW
         8qEQKHV1FgKyOvQO7/VPU+/TjaLkhd+T7NG+MLASB5Mo/r7rw2wnC50ODZONhTmGElSG
         QcHeH8J/hhlqp/+/FfETp2+XQxxhM0hNAQ6//CAscehMbzz+mYKUeKG6gMuy5KnGTnrn
         /zujn8st6fQPXAbHMGgDFg/NbiFBsjCf7Mp8PFFWbu0Pn9XU0cOKWrpacDX3XHY9U4fg
         uma9Cdxf3x0nJbJLFGYg/pkRk6zSMlJR8q3MDUpO6mcJFzk5PZvpW3e+TTmek/P4pDVP
         WQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704371648; x=1704976448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ik4uyCYv2TQarb31EWuXmmWrYINJlUytsNJyudVrGMk=;
        b=ZhZ/kNvhrG+4+gYzjEZ+r7Ul1gZBydRWZGjP8CM9/qmPgsXfmDJvyFgN2tBx9/VqUf
         bhAF5llTkIbRMvGIkyJrSIRbisw8UkeXue2zZI2NwmSQ4rKlTGCxyMJQAOVSkLOcFY8J
         tvdsIy3X8h6gkY60EPIcdOqdgwKXRsnCUo7iC25BCgkMdUCsJdtqbzDo9D6IHTzZ3r5G
         dYAJ0ONZ4effG7pdorwk3nMPnSjJvRRPtYnl8tdpakwO2SpBRhEoIOs//4Yp0WJLs3vn
         hAXDgFwptnecPDBJBJtuMQhv6Hnay/Y7yYti+TkaCAlJ2hHWOuGZm0QRkPeHr+ZeTVdw
         289A==
X-Gm-Message-State: AOJu0Yx8Dgp5TzFlN9F00JRLuhXrpEhBPW0ZSz8zVxd2Uep6oSWw6u9N
	4Ae7Ha2rLJm4YzoCV5iZxydRScGYvSLWOPyTO6p85ozPCl93Gg==
X-Google-Smtp-Source: AGHT+IERCr09H6KSLmfFQXyDrlFQIYorvDwOvmuf00b1qBW8NX0+J9jeWqyUIre3qPyVI8Wbm7Z5IHlV/zHPZA4aVyk=
X-Received: by 2002:a17:906:56d3:b0:a23:5893:1ac8 with SMTP id
 an19-20020a17090656d300b00a2358931ac8mr587088ejc.27.1704371648530; Thu, 04
 Jan 2024 04:34:08 -0800 (PST)
MIME-Version: 1.0
References: <20240102220134.3229156-1-samuel.holland@sifive.com> <20240102220134.3229156-5-samuel.holland@sifive.com>
In-Reply-To: <20240102220134.3229156-5-samuel.holland@sifive.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 4 Jan 2024 13:33:57 +0100
Message-ID: <CAHVXubh+qnJCF1e6u8G0h+5fnfoGDHz0jjBr+KW11WZbKt3F9A@mail.gmail.com>
Subject: Re: [PATCH v4 04/12] riscv: Only send remote fences when some other
 CPU is online
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_043414_292489_7B3EE4EF 
X-CRM114-Status: GOOD (  18.45  )
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

T24gVHVlLCBKYW4gMiwgMjAyNCBhdCAxMTowMeKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IElmIG5vIG90aGVyIENQVSBpcyBvbmxpbmUs
IGEgbG9jYWwgY2FjaGUgb3IgVExCIGZsdXNoIGlzIHN1ZmZpY2llbnQuCj4gVGhlc2UgY2hlY2tz
IGNhbiBiZSBjb25zdGFudC1mb2xkZWQgd2hlbiBTTVAgaXMgZGlzYWJsZWQuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPiAtLS0K
Pgo+IENoYW5nZXMgaW4gdjQ6Cj4gIC0gTmV3IHBhdGNoIGZvciB2NAo+Cj4gIGFyY2gvcmlzY3Yv
bW0vY2FjaGVmbHVzaC5jIHwgNCArKystCj4gIGFyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyAgIHwg
NCArKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vY2FjaGVmbHVzaC5jIGIvYXJjaC9yaXNj
di9tbS9jYWNoZWZsdXNoLmMKPiBpbmRleCA0N2M0ODViYzdkZjAuLmY3OTMzYWU4OGE1NSAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2NhY2hlZmx1c2guYwo+ICsrKyBiL2FyY2gvcmlzY3Yv
bW0vY2FjaGVmbHVzaC5jCj4gQEAgLTIxLDcgKzIxLDkgQEAgdm9pZCBmbHVzaF9pY2FjaGVfYWxs
KHZvaWQpCj4gIHsKPiAgICAgICAgIGxvY2FsX2ZsdXNoX2ljYWNoZV9hbGwoKTsKPgo+IC0gICAg
ICAgaWYgKHJpc2N2X3VzZV9zYmlfZm9yX3JmZW5jZSgpKQo+ICsgICAgICAgaWYgKG51bV9vbmxp
bmVfY3B1cygpIDwgMikKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsgICAgICAgZWxzZSBp
ZiAocmlzY3ZfdXNlX3NiaV9mb3JfcmZlbmNlKCkpCj4gICAgICAgICAgICAgICAgIHNiaV9yZW1v
dGVfZmVuY2VfaShOVUxMKTsKPiAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgb25fZWFj
aF9jcHUoaXBpX3JlbW90ZV9mZW5jZV9pLCBOVUxMLCAxKTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9tbS90bGJmbHVzaC5jIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gaW5kZXggMmYx
OGZlNmZjNGYzLi4zN2IzYzkzZTNjMzAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9tbS90bGJm
bHVzaC5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gQEAgLTczLDcgKzczLDkg
QEAgc3RhdGljIHZvaWQgX19pcGlfZmx1c2hfdGxiX2FsbCh2b2lkICppbmZvKQo+Cj4gIHZvaWQg
Zmx1c2hfdGxiX2FsbCh2b2lkKQo+ICB7Cj4gLSAgICAgICBpZiAocmlzY3ZfdXNlX3NiaV9mb3Jf
cmZlbmNlKCkpCj4gKyAgICAgICBpZiAobnVtX29ubGluZV9jcHVzKCkgPCAyKQo+ICsgICAgICAg
ICAgICAgICBsb2NhbF9mbHVzaF90bGJfYWxsKCk7Cj4gKyAgICAgICBlbHNlIGlmIChyaXNjdl91
c2Vfc2JpX2Zvcl9yZmVuY2UoKSkKPiAgICAgICAgICAgICAgICAgc2JpX3JlbW90ZV9zZmVuY2Vf
dm1hX2FzaWQoTlVMTCwgMCwgRkxVU0hfVExCX01BWF9TSVpFLCBGTFVTSF9UTEJfTk9fQVNJRCk7
Cj4gICAgICAgICBlbHNlCj4gICAgICAgICAgICAgICAgIG9uX2VhY2hfY3B1KF9faXBpX2ZsdXNo
X3RsYl9hbGwsIE5VTEwsIDEpOwo+IC0tCj4gMi40Mi4wCj4KCm9uX2VhY2hfY3B1KCkgYWxyZWFk
eSBkZWFscyBjb3JyZWN0bHkgd2l0aCBhIHNpbmdsZSBvbmxpbmUgY3B1LCB0aGUKb25seSB0aGlu
ZyB0byBvcHRpbWl6ZSBoZXJlIGlzIHRoZSBTQkkgcmZlbmNlLiBTbyBJJ2QgbW92ZSB0aGlzIG5l
dwp0ZXN0IGluIHNiaV9yZW1vdGVfc2ZlbmNlX3ZtYV9hc2lkKCkgYW5kIHNiaV9yZW1vdGVfZmVu
Y2VfaSgpIHRvIGF2b2lkCnRoZSBzdXBlcmZsdW91cyBNLW1vZGUgZW50cnkgd2hlbiBvbmx5IG9u
ZSBjcHUgaXMgb25saW5lIGJ5IGNoZWNraW5nCnRoZSBjcHVtYXNrLiBBbmQgc2luY2Ugc2JpX3Jl
bW90ZV9mZW5jZV9pKCkgaXMgdXNlZCBpbiBhbm90aGVyCmZ1bmN0aW9uIChmbHVzaF9pY2FjaGVf
bW0oKSksIHdlIGNvdWxkIGFsc28gdGFrZSBhZHZhbnRhZ2Ugb2YgdGhpcwpvcHRpbWl6YXRpb24g
d2hlbiBvbmx5IHRoZSBsb2NhbCBjcHUgbXVzdCBiZSBmbHVzaGVkLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
