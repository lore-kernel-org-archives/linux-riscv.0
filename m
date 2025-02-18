Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F988C021AA
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 13:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jtNS4m9SE13ZPtKarYH6aizq45VXriaOmZdHxUOE06Y=; b=4c86yCB2yQNQDY
	NkxvIEbRp057q1h7iRxu0qUCxG9jQkFHxUIdDCGc23OOqmOi6rHDT3/TrfQetC+gWaCT4wcSmUaj+
	2hMk6B2BCjLmG4IRrzliONOjPGPEMKDU9zSy05mhS/4Wud17m3k9tKclGHSUO0PcX5lfiKoWAob/Z
	DDfNaTPVKae8bhQe44HRZ82tH1eOhmreRCXoNRAMcM9vegiC5DYzAp+bhe6auXHxYv9MGJ28jAEcY
	IalZnYjoB8r3wBLj3EpByT6HeFnUHLU6ame6z4HU+sqNQUfmAwo6/b4kH6QnTYfAm3hone47pwW4V
	BA0mA1EKefc9Y24M7Eww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkNUv-00000008Hx5-0Iba;
	Tue, 18 Feb 2025 13:18:49 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkNMV-00000008GAe-1gKR
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 13:10:08 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-543cc81ddebso5780802e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Feb 2025 05:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739884205; x=1740489005; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2H4CFTIInDOtT3tOm3edOpwQRv60P1DUgV4VG+RFkE=;
        b=aEmM5i0vbAdzWZa3YesR+hlwX39cl3aPdT0FlPcNGFD+HGVqi9vdlrHGN6da9hYwnQ
         Yhfo6RwHVI8PxhbU3YVVIMzY7YA9eslhBw/a8xtqoa/wpE5MuHVuG+Iz/KlvfihD2p5Y
         y+usLHKoIkCpXpFdLozuyyGAVHMS1iua0B6gcM8CHTaofqxGKJljvfa7qBvaYqx1Bplt
         vrJy0O8WkR0X2ubIFeYqJ4hNb9VP9lq/7espM6w7hVe7xNJh8oxWsR1hoRDgSLDALu85
         urRKStI13C2udX4ORzn5Y3pcEOowGivXmI/KuZO+Z7YbXttQQuARvx1M1yxm6pQiEVec
         +k6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739884205; x=1740489005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2H4CFTIInDOtT3tOm3edOpwQRv60P1DUgV4VG+RFkE=;
        b=DAWLLRX/8+kHR4PMy6tfB9M1kgq3325YPapkcsaFj7cmLcFOm5utJonpZCv2+P4mYV
         Uo2ng1rLzZKj6pZtAQMWoKsAyRBAlDdBN/Ryclvbu85QbYfKEMokrkLHB4Ggll69QmzD
         9POULyn15aJMn9YVF3og4ZIQ1yq1/2vj/yUrn5OI6D1kvcWx4T/HZRqPyT6k5D2lvP/a
         Ae74Ub0Br19j08bsuMLwswI3dnGb/Zo1E1xEvWIuoUkEcWRSF3NOx+2thFn7Wf9J6slA
         DuhRsra063c5ruWWLfSJZ+4sAv9DxTKyEdtOriMRblMG1ETrO+vqu38UyUuSDDXVyEoI
         QoSw==
X-Forwarded-Encrypted: i=1; AJvYcCVsdBHRGZeK3duH4I6Yv5g7o4v0MDDRAKR+YrdtjpxWEB/U1kRzx25VF/Cd2Ei3A+5fGmtzxlh9xqIocw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTsj3Wpi2OootQJtu94EpHypJa2gueaXjnTEnEYO+E3ehqlr1K
	zvZMtjPceiimMupb1z1YJ1bojK8FX9f4Seq/DcxkNZOdfZhPmMOJhHHMSdQke2V7uk0KB1bkY4+
	Md5G5U4fDBqMwII6TgJNef/8bDrq5RT1M6p2EZw==
X-Gm-Gg: ASbGncueE6sA59nQbskKe/3yUdGnNF0mQlOs2JzLXY6gfpvtOH107AnUPfaUDyefMws
	BhlEs2ergIZpoWNbGIa0K2cZ/AGNYf4n8OMmKK1r3AsJW6TNsN++8mW7emdYBvFGFZA2mPMco
X-Google-Smtp-Source: AGHT+IHdB6MXsIp6ZqlQsI40sZGvOLeSKe+AB5abn2fY1o/Am7w1jOVveK3QMy7dhDaAVzYZIDd9lE1wi3yAkqHGnxI=
X-Received: by 2002:a05:6512:3992:b0:545:2d27:5ae1 with SMTP id
 2adb3069b0e04-5452feae86fmr3466160e87.53.1739884205513; Tue, 18 Feb 2025
 05:10:05 -0800 (PST)
MIME-Version: 1.0
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org> <20250217-03-k1-gpio-v5-2-2863ec3e7b67@gentoo.org>
In-Reply-To: <20250217-03-k1-gpio-v5-2-2863ec3e7b67@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Feb 2025 14:09:54 +0100
X-Gm-Features: AWEUYZlVwAj_YWqJ9Lyi5dg687EoTYyaneVjRfcETc4JasvXfyarUzHN15z58MI
Message-ID: <CACRpkdbxatfvPnOY_gNVAWdtoJ+xj3DbKNUqFU=9AC_UKM88sw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] dt-bindings: gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_051007_450058_50878A60 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgWWl4dW4sCgpPbiBNb24sIEZlYiAxNywgMjAyNSBhdCAxOjU44oCvUE0gWWl4dW4gTGFuIDxk
bGFuQGdlbnRvby5vcmc+IHdyb3RlOgoKPiBUaGUgR1BJTyBjb250cm9sbGVyIG9mIEsxIHN1cHBv
cnQgYmFzaWMgZnVuY3Rpb25zIGFzIGlucHV0L291dHB1dCwKPiBhbGwgcGlucyBjYW4gYmUgdXNl
ZCBhcyBpbnRlcnJ1cHQgd2hpY2ggcm91dGUgdG8gb25lIElSUSBsaW5lLAo+IHRyaWdnZXIgdHlw
ZSBjYW4gYmUgc2VsZWN0IGJldHdlZW4gcmlzaW5nIGVkZ2UsIGZhaWxpbmcgZWRnZSwgb3IgYm90
aC4KPiBUaGVyZSBhcmUgZm91ciBHUElPIGJhbmtzLCBlYWNoIGNvbnNpc3Rpbmcgb2YgMzIgcGlu
cy4KPgo+IFNpZ25lZC1vZmYtYnk6IFlpeHVuIExhbiA8ZGxhbkBnZW50b28ub3JnPgooLi4uKQoK
PiArICAgICAgZ3Bpby1yYW5nZXMgPSA8JnBpbmN0cmwgMCAwIDMyPiwKPiArICAgICAgICAgICAg
ICAgICAgICA8JnBpbmN0cmwgMCAzMiAzMj4sCj4gKyAgICAgICAgICAgICAgICAgICAgPCZwaW5j
dHJsIDAgNjQgMzI+LAo+ICsgICAgICAgICAgICAgICAgICAgIDwmcGluY3RybCAwIDk2IDMyPjsK
CkluIG15IGNvcmUgcGF0Y2ggSSBhc3N1bWUgdGhhdCB3ZSBlbmNvZGUgdGhlIGdwaW9jaGlwIGlu
c3RhbmNlIG51bWJlcgphbHNvIGludG8gdGhlIHJhbmdlczoKPCZwaW5jdHJsIDAgMCAwIDMyPiwg
PCZwaW5jdHJsIDEgMCA2NCAzMj4gZXRjLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
