Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AD4CD13CF
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JGYpYEG4hxcIAsbSRf9zx+5Hnb15sILBbb5NsSlayE=; b=Ugtr7W6UXH2Ik1
	zc2NHO8o47w4fm8cYiwXicVP/PzbgipHczoKF3+X+oAw7VKZTqlbC2RIB3GYRMn19ViBn+Ldc2kZN
	i+x38heYmvusUGnXe3tEa82HQPZrNT6hhGjqDUYkwsjJOc9OSXIZIDZPyaS1781qT8qZpKLCwkjuT
	pcukh9ltkhWvH1BrjSO/N3VpSMgvSCMP7upsbC2xXJmXYSRMxK2F9nW7aD1Q6l5LgM5qXvSnw6WuV
	C9Dvo9RC0OCVTZh6dYsxV0yRZm1o9uwgvf6GieamrMqfCGlZznU2RDmyks0bOtkoOqB7MhZI6VIfL
	3sHPHRvltZV8NJLJj4ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slPgz-0000000H6qq-1IxL;
	Tue, 03 Sep 2024 09:19:17 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slPeb-0000000H61c-1JlD
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 09:16:51 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2f50966c448so58076911fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Sep 2024 02:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725355007; x=1725959807; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWjGQ4YHroQwD/57wggdSbHx9qHopndgiBjBXsMUmLI=;
        b=QzhHpoIDba/igwQre9ZsI4gw8U6iIpIPD18FZ7A+eFw5l8tjwK6Jhbmx/5OjtGEhqY
         kdS9HfZALMh7kT916HDPA9i9fdliIU+tU/6cMBXQNJRA7dH8ofteC8qLx31pmT8LwM1z
         HPmSUabtLE12DZBaJWW9vUyLWAC8thHWIE5Htep1iayR8C5EgSWT0m6Yw8+jHZeSbjTm
         7hrsDpW10MCzKeyXWefPiryrqJ7A6Z+ENxyd1VDJ8uXlXHMJmCGa8UhTs0aeM8k/biw2
         Esmw+xOMCyrkp2SkW31h0wGnp33pSGtmX0ZtTwtVo7I/pSB4tuH4jEVXRP95xWdSe6z/
         NRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725355007; x=1725959807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWjGQ4YHroQwD/57wggdSbHx9qHopndgiBjBXsMUmLI=;
        b=PGfpBnu5PFhsU3CFfGMmJIFmG4DYiZwLMECp8fkEszb/c3sJcL4rbFVSHSwQIfVLYh
         5of+5hz9o2XHsEf3icb8PLuhNtksTeQcDVY4SUieV7yT5oqOAK4D4cotUbcwSKrgnQjk
         85sXyqlrBHYeoHEDjMYTO3LufpyBNjFjof0OJdBsLR+fDf2h/x8AAvfITPU8zcVDtfGv
         A9VvTfu5gQ7FaV1qszGbHM/EJ+5S725UM4y6VX/uljokTUr47NOUL5vAlW1h4WXXeuFC
         9AteVpgYn/9Dzia8PbXO9SP1epe+cbVwoqWlotse83aWt5gcH72duuSnAc+Gh8Tym1Kq
         +ldQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbmRTMzQlgv/fkoxNwENAC5Vg91LiaDzoTVJ0dN7WIDu+jeJtzLDbZYiaZnok8U+YV1d2a9EIloxnYkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbOcd7fazeqqUPO9Kh+F85nmul0jkV3nfcjKxprvjz83B2eOpt
	dj4P/QAuyhNZAuWJZyapzgpdytRKwA82pO5MsS5M5e1hXmgzmqWlylJ5BVQ8I9N8XEQTAGlPs92
	/L4OfOlBVaDXEIQxJf8FCe4mjQnJ82fEBLTcjOw==
X-Google-Smtp-Source: AGHT+IF5iXmXm3uBNGtfu2k2W3mUA/wL6HSlGri8eJbZA0MDiPWsO5xxdT1fn59W0sd0nud+XYxGXlKqBmQA/C+s9Vc=
X-Received: by 2002:a2e:a9a1:0:b0:2f3:d008:a54e with SMTP id
 38308e7fff4ca-2f6104f2859mr113545281fa.36.1725355005999; Tue, 03 Sep 2024
 02:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
 <20240828-dt-bindings-gpio-hog-v1-2-63b83e47d804@linaro.org>
 <CACRpkdZzF5yJQnnDsjU8cTr9Fpe7wZZXoW3K-wFYuAq2vv8XxA@mail.gmail.com>
 <CAMRc=Mcv9nfiG7N-ttS_A=Ay-5Wv2mYpT+41G1u8G4GrMQAuEA@mail.gmail.com>
 <CAMRc=Md9+pmiDSzjhNXBOzZeBLCemvxCzFMAyfFH_Qi329jG9Q@mail.gmail.com> <884facf9-09dd-4454-9f39-67335b4e8c5f@linaro.org>
In-Reply-To: <884facf9-09dd-4454-9f39-67335b4e8c5f@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 3 Sep 2024 11:16:34 +0200
Message-ID: <CACRpkdZosOeBhEo460Wr3r9gF+xg1wJGdhvX0xf2_PWLZ2hkYg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: qcom: add missing type to GPIO hogs
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_021649_394346_9FA5A082 
X-CRM114-Status: GOOD (  14.69  )
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

T24gTW9uLCBTZXAgMiwgMjAyNCBhdCAxMjowMuKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cgo+ID4+PiBJIHN1cHBvc2UgaXQn
cyBiZXN0IG9mIEJhcnRvc3ogYXBwbGllcyB0aGlzIHRvIHRoZSBHUElPIHRyZWUgd2l0aAo+ID4+
PiB0aGUgcmVzdCBvZiB0aGUgc2VyaWVzPwo+ID4+Pgo+ID4+PiBZb3VycywKPiA+Pj4gTGludXMg
V2FsbGVpago+ID4+Cj4gPj4gQWgsIEkgcGlja2VkIHVwIHRoZSBHUElPIGNoYW5nZXMgc2VwYXJh
dGVseS4gTm8gcHJvYmxlbSwgSSdsbCBwaWNrCj4gPj4gdGhpcyBvbmUgdXAgYXMgd2VsbC4KPiA+
Pgo+ID4+IEJhcnQKPiA+Cj4gPiBOb3BlLCBJIGNhbm5vdCwgdGhpcyBkb2Vzbid0IGFwcGx5IHRv
IHRoZSBHUElPIHRyZWUuCj4KPiBIbSwgcHJvYmFibHkgdGhlcmUgaXMgc29tZXRoaW5nIGluIHBp
bmN0cmwgdHJlZS4KPgo+IEBMaW51cywgY2FuIHlvdSBncmFiIHBpbmN0cmwgYml0cz8KCk9LIEkg
YXBwbGllZCB0aGlzIHBhdGNoIDIvMyB0byB0aGUgcGluY3RybCB0cmVlIQoKWW91cnMsCkxpbnVz
IFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
