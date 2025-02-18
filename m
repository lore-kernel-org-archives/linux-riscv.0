Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B984EC02198
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 10:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/TiD6cR6Tt0NhbcKOg9CEM9DsyHe/bL8vzXtXw3LtsE=; b=Yj3ni4sOciHrsX
	ofhatVyTep7BWHK5WDqatGaKs6BvYkK/666f5NkcPQwQ9SH+Wn+TppLX4HciByleK+fj5QU9rnMUq
	fauhuiJlhh3QPYqupk3Ne8N4RYX2zeDAXlL/ucfUmWRVzLhWtyBxE9dR6VYBj7FXzcibBVjpSwDyN
	CX5kw8YoJXJfgvmFVHnEq/BRj4dSdHhG4JRWd92VhZyb/Bl255D1bMjX3MPvaVX5Ouv3+UmX7NmXi
	8kUoa/wBEfHTzAey6uhAfMV3GE4t8hv8xVUcag+PdmNrUDvUFEbk71arOdmCg0IUtWM4gufvY90il
	ueHI+jOcmTC3jUnLaWTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKPc-00000007e29-1PPN;
	Tue, 18 Feb 2025 10:01:08 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKAC-00000007ZyW-3UE3
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 09:45:13 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-30920855d5bso40279181fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Feb 2025 01:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739871910; x=1740476710; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BN2VhcauqG9RbV8MqCf3noWGKfT4ixMjIIxfEPq00RA=;
        b=SlUh4qiNnR/vxcCtuYSi/4PDhbLM91DHc8jVlcblTsTIoJZsnzXiC0aTPPecKlF6Mz
         HKSQdzHqnxUVy7dA6m9pAwbBQXfXtd22mSrMvxkRIslqxj8e/zPAUgPQ0FCHoIWBakeX
         EC0SrEutQLJv09w2rI/xIki/IJjMfJV5tO5SoMkho5genRZQNXu1sWDRFMYI9K6bETAm
         N0VV6uQB5YpwuCgHjlwdxHpzXqNpbble4zE8MLTY7VzG8Pr3lJzc88J2c2tpwVLqZO8t
         BiiVldcReLnVPL9dMMExRhZLwjyu2ICgWlkJBdZIE9FshPGQ1iFiC7HO9FEXhqTbaYqI
         /dfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739871910; x=1740476710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BN2VhcauqG9RbV8MqCf3noWGKfT4ixMjIIxfEPq00RA=;
        b=ux0pYfkCFIyiWJ1FuTSBmUZbIkSpSQ+GHStCZUT2dFQ0taIW5ctOhlFdOibxhLe7Y7
         23b58lx34VTLdSzgIzQFipfBpuHRhyneddfaxUL4L5pC6CLDzIyoPO7VoIzTMfT8DFXn
         Gk2Z2fecPP9OHUF+hsUmqdS9QLsGSU1IB5cttWJ1D6QrJ0MtZfIMHXevluppiXKG6VbV
         ZZPKbeHfKukz4MVrYZu19I6hZsIa759rJ767IQr4t5j7DTLAef94tBC/IcXmr6RMqczR
         7RYiCldiF30kH0BU2z6rwdXhdk76UvK2PMJ9lZrQqVC2SpncSWvR8cS1fWna6HbK0AXR
         6qcA==
X-Forwarded-Encrypted: i=1; AJvYcCUZZAx4/7E2uKpDPXzwSqC8FKot4jVwXZ6e5uwUscR6oIdG8CMepyOi/a0WCHJbhQAx5mtzvz06UsHVRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlYkgTSn8XgcvZCQlaogR0Ik23CXUce7LHzOZjpjFeMc3uv9SP
	SnCFtq9mfYiBSUYjNwPvRvpCi1U0G6ze2vbipDxb3iHLmwUZ9bnJaGQ95KcFgyzcSEyjiFTcIf4
	oMU/7Y21m+v5/Oqb+8SOsnSdg6ieiq7+bKVU5+g==
X-Gm-Gg: ASbGnctNnDSvTBWP55EmiBRGHYyoQu21myog+OpwUp3CrdyGD9VMA2v5N9lxaZ/Hq0c
	yFBO9C4uPqESopKiuz0kt82JREDtYyqptwWjh2nEuCWosJY3p2I/bg6fjkRmAdg8L4URIv/J4
X-Google-Smtp-Source: AGHT+IGxEO+DF5kRzIjq3qFDfgxYzzAxwLSdI984z84zV2jQrwPlYtypYU1pgjXiiaRe+HuUJiU9UcU2s7gThRggfQU=
X-Received: by 2002:a2e:8457:0:b0:309:31bf:ec17 with SMTP id
 38308e7fff4ca-30931bfef5fmr28690911fa.15.1739871910394; Tue, 18 Feb 2025
 01:45:10 -0800 (PST)
MIME-Version: 1.0
References: <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org>
 <Z5FPJLzAEVXGWJnE@chonkvm.lixom.net> <20250123113042-GYA38135@gentoo>
 <Z5LOdh-4UxRtteOy@chonkvm.lixom.net> <20250127181726.GA538260-robh@kernel.org>
 <20250128031712-GYB47737@gentoo> <CACRpkdYbSOHD9UH5=+qjztxS3Cq_rxaoOT9tFtD8ZWm9zQGnPw@mail.gmail.com>
 <CACRpkdZa887vx4Lmxk1U_8w5n7AxMnyzGexeYzhsxNGT-DTYcQ@mail.gmail.com>
 <20250206133156-GYA5687@gentoo> <CACRpkdZYYZ5tUR4gJXuCrix0k56rPPB2TUGP3KpwqMgjs_Vd5w@mail.gmail.com>
 <20250214115410-GYA21743@gentoo>
In-Reply-To: <20250214115410-GYA21743@gentoo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Feb 2025 10:44:59 +0100
X-Gm-Features: AWEUYZnVti-LvZHDXYhaweA_xJfXLbPMVGPKFtEd0c95Dmo8gtzeCdJx9Be6kOY
Message-ID: <CACRpkdaQZ5wJ0S=FfTzBkZOfCE7zvTPQ-wn53rHcZztbHLC8xQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_014512_872430_FAB6963C 
X-CRM114-Status: GOOD (  14.08  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Olof Johansson <olof@lixom.net>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBGZWIgMTQsIDIwMjUgYXQgMTI6NTTigK9QTSBZaXh1biBMYW4gPGRsYW5AZ2VudG9v
Lm9yZz4gd3JvdGU6Cgo+IHRoYW5rcyBmb3IgdGhpcyB2ZXJ5IGRldGFpbCBwcm90b3R5cGUhIGl0
IHdvcmtzIG1vc3RseSwgd2l0aCBvbmUgcHJvYmxlbToKPgo+IGhvdyB0byBtYXAgZ3BpbyBjb3Jy
ZWN0bHkgdG8gdGhlIHBpbiBmcm9tIHBpbmN0cmwgc3Vic3lzdGVtPwo+Cj4gZm9yIGV4YW1wbGUs
IEkgc3BlY2lmeSBncGlvLXJhbmdlcyBpbiBkdHMsIHRoZW4KPiAgICAgICAgICAgICAgICAgZ3Bp
bzA6IGdwaW9AZDQwMTkwMDAgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAic3BhY2VtaXQsazEtZ3BpbyI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4
MCAweGQ0MDE5MDAwIDB4MCAweDEwMD47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgLi4uCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgZ3Bpby1yYW5nZXMgPSA8JnBpbmN0cmwgMCAwIDk2PjsK
PiAgICAgICAgICAgICAgICAgfTsKPgo+ICAgICAgICAgICAgICAgICBmb28tZ3Bpb3MgPSA8Jmdw
aW8wIDIgMjggR1BJT19BQ1RJVkVfTE9XPjsKPgo+IEl0IHNob3VsZCBnZXQgR1BJT185MiAoIDky
ID0gMiAqIDMyICsgMjgpLCBidXQgdHVybnMgb3V0IEdQSU9fMjgKPgo+IFByb2JhYmx5IHRoZXJl
IGlzIHNvbWV0aGluZyBJIG1pc3NlZC4uLgoKTm8gaXQncyBqdXN0IG1lIG1pc3NpbmcgdGhlIGNv
bXBsZXhpdHkhCgo+IHRvIG1ha2UgdGhlIGdwaW8gcGFydCB3b3JrLCB3ZSBuZWVkIGFkZGl0aW9u
YWwgY3VzdG9tIGdwaW8tcmFuZ2VzIHBhcnNlciwKPiB3aGljaCBzaG91bGQgc2ltaWxhciB0byBv
Zl9ncGlvY2hpcF9hZGRfcGluX3JhbmdlKCkgaW4gZ3Bpb2xpYi1vZi5jCj4gKGF0IGxlYXN0IGdw
aW8gY29yZSBuZWVkIHRvIGFkanVzdCB0byBjYWxsIGN1c3RvbSB0aGlzIGZ1bmN0aW9uKQoKTGV0
IG1lIHNlbmQgYSBwYXRjaCBzZXQgdG8gYnJpbmcgdGhyZWVjZWxsIGludG8gdGhlIGNvcmUgaW5z
dGVhZCwKYW5kIHNlZSBpZiBpdCB3b3JrcyBmb3IgeW91IQoKSSB3aWxsIHBvc3QgaXQgcmVhbCBz
b29uLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
