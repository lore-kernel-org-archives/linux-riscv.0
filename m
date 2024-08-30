Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52593CA101A
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 22:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5SBIHu108SF3ST/sNIiaqWxJPs2aGdv5FGmoGmm8O4k=; b=SW1x3pbKMrZro+
	bUcBDdA1qIjyfBBCenE+Jfj9kQHYBgbWi/Vml2lTk8q+0cEojjyVM1d5UpGzGJXnpqr/UZOl0C6GD
	t7FG/8SWZ9uvLj8m36AoD70lhfEyojrEh5iRSR0qaexsr16WUSChguPAR+a2FMHGFYmnYhjzvP8Z9
	eFzhpJlnxqBqZJAd6AvO0j3TrdSxqMlutzY+Xn9+LwKO8Ya9FG7/gy8LLrVlmkAf9NWMwAyRnQSVe
	OmVpGHw3LHwifFH5zsmmdF7Zc18iPsAU14HM5sm728nseXYXYzA3I41OhpD+ntIOb/8SwwYeFwyGU
	e0fPkrlArGRtGOdYHpFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skAFE-00000007vG2-2xgC;
	Fri, 30 Aug 2024 22:37:28 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skA9t-00000007tr1-3eC5
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 22:31:59 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e04196b7603so2425566276.0
        for <linux-riscv@lists.infradead.org>; Fri, 30 Aug 2024 15:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725057116; x=1725661916; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFKG3Hu1nlWUnpmyKv12SHPAEdjyrNL7oAPMm5KuvUI=;
        b=KyTKH2zfaGyhR4QAv6ECxCv8I2JRBkRUqil6XDXt4R+Y37jmw7jPfxT8w8pjkPt+Sj
         NctqfDG9PZA3Kq1WBqsbxaQ+9iq2dcIm6QLVESook57UzRMtMX9TnSRjjM6zdtZ0to6b
         zRkHJrIvmsCcrM6UVS6JyDtXUWHiR3wMqKwu0HASFGKsX08iLy97H6NKMMYnj+QfPijj
         zOvDNulJ/0kZQuMGWEjQo9A/+riauMDLCTGzOOR3rJLgNDLy+g1enstdetRkgtKBevO8
         HgYtiZGDUK2ZxYscWvKc5TyYKUoZcnPeMWtODr7yDjy9USYrmX2WTS4b3q2Bp4U2LQeq
         GNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725057116; x=1725661916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KFKG3Hu1nlWUnpmyKv12SHPAEdjyrNL7oAPMm5KuvUI=;
        b=DUsLhomxkV46fCgk7PEXrqDzEs3qAVssMOC7AbHMCNGxwHMAWaQSdfwVwB1eCQGdHL
         dh6boyj8IDtWrdRWiVHyfpkCyl6s6mvw8JCwU5OAeycQBJsNSQD2vY1bGmFiVXkJjt39
         TV7gvO6490DqiDOGbrYJj6DDUaiMZnwPf0E2Xxc2npY8Q1H9uvBVBOcM02S3o8otYt/9
         3aM+BanZuhdFsnX2wXPdnricyKPoVmORfB1LSMfXaReugmdUxqG1IQeYR8ZrYdNsqr/k
         uLouXWamv4JEyaCP6ZE/gFLO2xY7QJ73D8MxeEGMyY+uGqCoqFfSpi5gf6pP8sfUXyw5
         sz9A==
X-Forwarded-Encrypted: i=1; AJvYcCU/WUUk8s/EHHFF0tvOMi+DuWPjrWthCjex5K+QuoMG5vj5giUsIzHLPpMFvhcuOs6PJ7/AgbICtLTJ0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YylN3fi4gMRRvBKJQxGPSN803HqLmXKUAewzdZoBtkH5cyNQbph
	JrhIFztQXAhCxxQt21I49pEsK1uvYMSoMapS9xECI2n90nUKz3ABsZ6OxzOJZ9SWEC082n7mkVx
	pX4YShUsB951rVT6WbaQeKRsMD0dQj2upEtUYoQ==
X-Google-Smtp-Source: AGHT+IFqP+CzrvoB2S61/4pRdTw0AxY6t4jTtKN7C5yPQXEGWe74JgnEezcm+LFW4t+C4VT7OfM7HAVzLldND7oy2+s=
X-Received: by 2002:a05:690c:4589:b0:6d4:f41d:de2f with SMTP id
 00721157ae682-6d4f42d2475mr13586507b3.39.1725057116454; Fri, 30 Aug 2024
 15:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org> <20240828-dt-bindings-gpio-hog-v1-1-63b83e47d804@linaro.org>
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-1-63b83e47d804@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:31:44 +0200
Message-ID: <CACRpkdamSDSPmTM9eEd=QAdZPM0Mb4mjh2+mQv7cx5TRT7MBNg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: fcs,fxl6408: add missing type to
 GPIO hogs
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
X-CRM114-CacheID: sfid-20240830_153157_937399_79037DEF 
X-CRM114-Status: UNSURE (   8.36  )
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
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlq
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
