Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FCACA101A
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 22:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ezBN5WqqoQ3h9Lh/EJRGF24eCFzQ8q1mD2BpM6GU7qA=; b=FZePXaOsc10eIa
	XUzObE7DPnmyhazN76Tpqn1oNXZt/SPfpyyCqbdKJmw9JEaLNa5gHhUbgbSU6im7T/AcSqeub8Dlh
	PqiA9YCP+GKXyXzMm2wcwhdwM6v3bCLuTCys3+AQzcyRG0RkammZhfaMIPG98E1cWy7TJ7G906/UW
	PQDr/cKXPmYEkZWZy+TL4SsB6OlSv/W9tit2SkxfHZ04OVj0VVr4+L5kOHOwM4d5fo5M5AxZXsTbN
	XUnUuvEN83yji2nPc28+FKCESiyiLPIhQlx4jAxXEu54bNM6CpqbW17pRHT1h3kN7CFw/qH2QG0Ot
	LbneBvekAEKf4LUodyhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skAG7-00000007vSl-0BwG;
	Fri, 30 Aug 2024 22:38:23 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skAAY-00000007u1j-0hr3
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 22:32:39 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e03caab48a2so1944635276.1
        for <linux-riscv@lists.infradead.org>; Fri, 30 Aug 2024 15:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725057157; x=1725661957; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4BVzo4/O12zJnAXRC6H/18YaBmS+B36iZcOSvO8Wdk=;
        b=K4pLM7ZgSZ0PaphzfeYz2uL8i01ZdnA1fLuJnk1m3HZlOdRmOhQ7ji3+9bzNg15LWa
         DNFaKwXeHtzpWtbg2FbwulR7A/GFvCJy1cLb/PR1xftB1Hn2Qwq4INA/k9kwc4IDuOX5
         F37M1qez8isWlWwPpyWPolwb9dlyn0CVI8mVPGUEgU3lWYmwU+wesZxlhSfcyQLEn1Ye
         Z98DCMzfj/FeWSbFlv/szT6XINa0D1pPDlO7f/xrylTESpJ5+wItZgQk2SEkUJdZ6/HC
         gmJDEX2JCq1UtoMq+5egfCCa0iRALP9MH1JvjRPtX6Y2Zo/idn9oifKH3u9bXlL8X2/G
         PEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725057157; x=1725661957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4BVzo4/O12zJnAXRC6H/18YaBmS+B36iZcOSvO8Wdk=;
        b=rmoVoL+EMj9ar8PqYam16SXzMiSrt3L08IBMvAo+pdLH0WLifxdXeHYeM7+vbYzSut
         FRoNDJhITmYMILfqnOw0YQIPDxLaqJ0VrJgN/Sn4dbJLPzo+EtjFFQP46UHKv1NPnZTe
         1xMOOlIRs+Vx9svjMNBnIjb1X+Qdr75TjhHS5UmRL1FHPHIui3fb6rONOiUH0j/kYFJP
         7a81HOc0eNHYbK5QojU9oSI4AeeRNoeOo/T6hTZrah4UBbgKUxqDh+vbQOsYZnkOtU73
         5a98EjyCzKH/+lofvi/23GS67SgoRCzdvEMlXRo4n12ZhG3CcHPxIRtTk2CH/ZDXIzec
         FfRw==
X-Forwarded-Encrypted: i=1; AJvYcCX0B9QxaXw/k70pXxYoZ6lBswwEdfJ22fFSSksxhNAVWoa0EcUeodbiC4MCMox+36kF/na+5eDx39t0MA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZdzUSkOcUqBubB7FHTOP20BeEqOf1B4QyFpTfIhtNDnie8n7/
	QCxvIDe8+nQXAPkNnkplj5UnLaYRcWERmIc5ZCis9UYoeqA7xmNL/Q86A98dREtRmkLC7jgBqmT
	rIlTFiho1h54WzxxoZFkGzpPeJWIj/ff+CPL70w==
X-Google-Smtp-Source: AGHT+IGY8O84DiR2Aaig1136Hn1BZ4NVKNmKGEF29tIOvuMMt+pTTKh5RAqmh/aYiy5yQpsPuZ+gYm0rdnzyEcUt/SA=
X-Received: by 2002:a25:8391:0:b0:e16:7070:97e6 with SMTP id
 3f1490d57ef6-e1a5c648a4fmr6700554276.9.1725057156927; Fri, 30 Aug 2024
 15:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org> <20240828-dt-bindings-gpio-hog-v1-2-63b83e47d804@linaro.org>
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-2-63b83e47d804@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:32:25 +0200
Message-ID: <CACRpkdZzF5yJQnnDsjU8cTr9Fpe7wZZXoW3K-wFYuAq2vv8XxA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240830_153238_237594_731C0B32 
X-CRM114-Status: UNSURE (   9.23  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBBdWcgMjgsIDIwMjQgYXQgMTE6MzbigK9BTSBLcnp5c3p0b2YgS296bG93c2tpCjxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBHUElPIGhvZyBub2RlcyBz
aG91bGQgZGVmaW5lIHR5cGUsIG90aGVyd2lzZSAiZHVtbXktaG9nIiBib29sZWFuCj4gcHJvcGVy
dGllcyB3b3VsZCBiZSBhbGxvd2VkLgo+Cj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgoKUmV2aWV3ZWQtYnk6IExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCkkgc3VwcG9zZSBpdCdzIGJlc3Qg
b2YgQmFydG9zeiBhcHBsaWVzIHRoaXMgdG8gdGhlIEdQSU8gdHJlZSB3aXRoCnRoZSByZXN0IG9m
IHRoZSBzZXJpZXM/CgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
