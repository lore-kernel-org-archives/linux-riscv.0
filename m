Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06BCCA0ED3
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Sep 2024 09:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fPCWIEGSum6KwvJoKre/MqjtWmIZF9IuUBbZwHxE65o=; b=3NrniwrspdNapk
	UhS/PqKLFCVvplqF5tGblFX57QWAlnWwPtq7s4tjk95WQtOO1/xM5P2rPIRbNBMxbJBkvIoddXduU
	ZpKI7hsb8bQuxMugdWWLrFCF14iyHNzVdR2+9GqRk32IAtV0yVp7AXNDltPu27YRIZ6XmerzHzisM
	3xRKbTsx3QB4sopADBXqD1PhcO0EFVCQv50L7eV2HZ5fjNdxlWbkWdz0fR297OWh4m6uHaOdnK+as
	lkOktyVmNq2ZWTJUs4JAfVYfaut43DKHSJQzhrr8aWUbC6GBZTfdTtvQ9ZXmGRxh8cZzAxaM2wWJ1
	oiyuJI8MO0uflCZ7ouOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl3kF-0000000DmVh-1Inn;
	Mon, 02 Sep 2024 09:53:11 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl3ir-0000000Dlzc-2UWR
	for linux-riscv@lists.infradead.org;
	Mon, 02 Sep 2024 09:51:46 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-53346132348so4987291e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Sep 2024 02:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725270704; x=1725875504; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmsZkQ4ZxF52i7LYuHENnEzSp1FV0CuFPl/eYLGnvZU=;
        b=luQdsRHdTVqZWuBKCZqDiFzSS2qF+t+/owI/Z7ItcmP2jmbeKVSD0gyW0aYO/TYB0C
         6s/cmpLYfbQ50ZWmYkYtbsvTE2WzWADiELxv0Z9FMf23vQisdZzyZtKuKXixsX0xaH/v
         PPP37gy6LVOHfwCzGV5Wx7yAV1U91Mkgn4JT+z9UYu74dmSXTQg+vL6NZG2NLMEDjkC7
         6AnWqMftjmsICBvB9NQjdlIyy3/Kq5LxxU2BXdENv2XCCquF5W264QjMv91iF3WypN9A
         YHPCWo1AZQECXnZgZNJcWZf11ZzE+tKiUc8CP/Pzs8Ts8PtrvOl5GaNGCV7NpkxCCba/
         QIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725270704; x=1725875504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmsZkQ4ZxF52i7LYuHENnEzSp1FV0CuFPl/eYLGnvZU=;
        b=Mv++ck7to852L4uDJYbWvUEhXfnvCnUuxHpZde5SJttxSvQsKoQbsjEx3KaShV08Jm
         h5eqxzM5kh2COAKoxEREliT1BBME/8M6CC2mQGmpq1tlbUHcPerfn60Uicx36Ap2k50e
         bsHdYBuVjdBwN4qPVrZ9MWtyyBJZi6ON0gNuUQ7e0TeBxYfpgBnFOomy1ahZiPZ6cwAQ
         gS1VuI5aWu+PaqulliVOIqFwKI06u5ohBR2DGt/F5C97ZLBfe433MG9KlcImPQx2LMnj
         8/D07rRoewLT2YA+z/3fDMCyxyKFBnOWvVyuvVf0MT5C/5tBEwfR9b8oCe4FwwRxRoj2
         N3Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWg8XoGAtHbD+ZaEunuwrrq36n+nUV6BMxUKDvhbJ/gTWOy5XKsc7gxA7q46LI02/ZEVHYJZBHmWzItNA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf9AWfq+/ZSmKoGXuRyzAtj/EnywFxMcO5HioeAIGB0Vpbaf0H
	6/MQkPl4rY6qNl5WnJIxzRY6sahagD7qYWxoRJ9L2KoKwLh8nsLciRWML4vFbQn6J86to/0Qfrc
	g7yFosl4jGSQQTyEbs7caf4u9D6LcCYZ9IYxoOw==
X-Google-Smtp-Source: AGHT+IFqfLvZ8mKMDJqoWKL8m+Uh85ScKbEqg+TuVzZr1GdHMS+OsFqDlasVBn+Gh/2ybEBwe2mEjcHCj8mZ6Tu9m+4=
X-Received: by 2002:a05:6512:68c:b0:530:c1fb:51a1 with SMTP id
 2adb3069b0e04-53546aff14dmr6365059e87.17.1725270703170; Mon, 02 Sep 2024
 02:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
 <20240828-dt-bindings-gpio-hog-v1-2-63b83e47d804@linaro.org>
 <CACRpkdZzF5yJQnnDsjU8cTr9Fpe7wZZXoW3K-wFYuAq2vv8XxA@mail.gmail.com> <CAMRc=Mcv9nfiG7N-ttS_A=Ay-5Wv2mYpT+41G1u8G4GrMQAuEA@mail.gmail.com>
In-Reply-To: <CAMRc=Mcv9nfiG7N-ttS_A=Ay-5Wv2mYpT+41G1u8G4GrMQAuEA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Sep 2024 11:51:32 +0200
Message-ID: <CAMRc=Md9+pmiDSzjhNXBOzZeBLCemvxCzFMAyfFH_Qi329jG9Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: qcom: add missing type to GPIO hogs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>, 
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
X-CRM114-CacheID: sfid-20240902_025145_659102_D6E997FE 
X-CRM114-Status: GOOD (  16.27  )
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

T24gTW9uLCBTZXAgMiwgMjAyNCBhdCAxMTo1MOKAr0FNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+IHdyb3RlOgo+Cj4gT24gU2F0LCBBdWcgMzEsIDIwMjQgYXQgMTI6MzLigK9B
TSBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4KPiA+
IE9uIFdlZCwgQXVnIDI4LCAyMDI0IGF0IDExOjM24oCvQU0gS3J6eXN6dG9mIEtvemxvd3NraQo+
ID4gPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPgo+ID4gPiBHUElP
IGhvZyBub2RlcyBzaG91bGQgZGVmaW5lIHR5cGUsIG90aGVyd2lzZSAiZHVtbXktaG9nIiBib29s
ZWFuCj4gPiA+IHByb3BlcnRpZXMgd291bGQgYmUgYWxsb3dlZC4KPiA+ID4KPiA+ID4gU2lnbmVk
LW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8u
b3JnPgo+ID4KPiA+IFJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxp
bmFyby5vcmc+Cj4gPgo+ID4gSSBzdXBwb3NlIGl0J3MgYmVzdCBvZiBCYXJ0b3N6IGFwcGxpZXMg
dGhpcyB0byB0aGUgR1BJTyB0cmVlIHdpdGgKPiA+IHRoZSByZXN0IG9mIHRoZSBzZXJpZXM/Cj4g
Pgo+ID4gWW91cnMsCj4gPiBMaW51cyBXYWxsZWlqCj4KPiBBaCwgSSBwaWNrZWQgdXAgdGhlIEdQ
SU8gY2hhbmdlcyBzZXBhcmF0ZWx5LiBObyBwcm9ibGVtLCBJJ2xsIHBpY2sKPiB0aGlzIG9uZSB1
cCBhcyB3ZWxsLgo+Cj4gQmFydAoKTm9wZSwgSSBjYW5ub3QsIHRoaXMgZG9lc24ndCBhcHBseSB0
byB0aGUgR1BJTyB0cmVlLgoKQmFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
