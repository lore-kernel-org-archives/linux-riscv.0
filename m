Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC48C369CB
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 09:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=on1rLuBkRYOkOaCsZ4Vwpv9iCEHWp1jsI9RW3wdKroY=; b=vY3W0jQLPsFVFT
	6PG3i5d8jzyUaG6o7K8IJ4A+gHQhfoooizPRPE7Wv2NBBGp09pwopxxgT5VXzy1Ba4+GdyHgEDpWp
	6yyn25zCq91OrM1ewgJsgWqsr7bhfJVH/AneU4etK4StMoFluJf5OAOEyJeYgkgU49LhPtX7ExgUE
	xFAnnn1b2KK7JncsDg3XIYUYcMIpJNlZdvQY/SZQFJ3fVa6uPLI4tvkwWh6w3/D7v9cnhHPTlOTEz
	d2L8qYzLqGttNvGLgLZJ0Awx2DcWx1Y8XoxdNhAmFYgAFxS419GX46jnhj5dkcitTJXsimqmrs4LE
	kEfCIFhxorwZWUme3Uxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Wh9-0000000A3DE-1H9S;
	Wed, 23 Apr 2025 09:47:07 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Vdr-00000009n1y-1a8a
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 08:39:40 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54298ec925bso8984389e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 01:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745397577; x=1746002377; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grgPkLeDaak7FHXRcZ5Lz333Opab1u40+CL8LBRoWz4=;
        b=R9BUavLmi8bqqX3lQNs7FS48mBpFiPHRBnTfo5QDii9pz4oO3nFhyCeQXgCEC4fSYr
         uYWH1Tk/8l+248hPc8EEVpYFe3d4QuJU47/ZLv0/ojqwbuwdkdSv5YcsUhHMmKN01Xtr
         YEwiRNreKrTdMKNa0jRI6FWAmLpDD76IL1SG3NAu3Vo6iM0tyb3AqRqsqV8S2JT/wWgW
         wwJJSFPbb9m7/KwSeM6ZbnmbHeBi4CHlPiLxBDc81gt03BphVxUPSKVEF/QsZcO3VE3Q
         rv+ywbrkVyZnKLSBLnpLJZLmWH9mVnzU7CChyoDNNtb6KFL4aVlCiPLPByqoPbc9m5Cj
         MHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745397577; x=1746002377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grgPkLeDaak7FHXRcZ5Lz333Opab1u40+CL8LBRoWz4=;
        b=O/0WNXaZAcaXa72TS3xUYkuPV4bklvJ+LNH7cmFqfqi2FwnULblqaXJCrnMxwLwpae
         BafYT+nP3kmwMKbjWxWnOPkL0XC0QG1HCTIHXB/gp+2C6lYtU4jD3XM4oSRwgFqo7lD8
         HMgCeB//RZs50JnpLQOoYeDi5ZJArizeWTHU7nhjiSBrY6t4nFAkdBRVCCgYHHBg2ep1
         mRR2FEgBVtHT/Gtt6xvKlryzkyQtBuKwq/hOIvzITwVr/ZQpWbtoUam0AuZYqHe/pTPE
         cHYZkfHTfarAvvg9l7MzvevHZoX4R8sxHgCYTOoXuvSzR3hxIexx16H6f/wo0nxX+Aws
         hmXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1bGFueo9wv5YyQ9TJIxjydz9ZS+3pQMXb5QFMgKOjs4IWtnVgVtIlkuzz4qOp11qc/IjZ8lXEnJJOWA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqUUZ5ZiY8sQ1Yu15eA/wcV3MlLtk/9guWJsRt9AcdH8cPHm0c
	vpC8nAKfCk1qLSqI69RuPgxWmgk6OWw/MGXsRN38sMz+ZMsHPizELEet7KiXMDL1iOj+HNGusIX
	2SyzF+9sHPHG4yZvXWKMKDyExWOXPtt8l7Hwr8g==
X-Gm-Gg: ASbGncvmuWfl285fv1zqMWsQLEUoalfvlS6/lL9qSHb62lZfb93TmR6fm7y4OgIVWYV
	DKhN/6cEqHzlpf5yo2X9XO4SrcJNYLb2nl+Y6g/jejpLNieSMJngnUpgA94/QkTEngRn1xjuAPT
	jZaxmcqj1MAgA0zWwpLdY40Q==
X-Google-Smtp-Source: AGHT+IFZTOoQ/SIoYXTZQ5HrYq6ViTZKpu7Uh98dkIsdaRSVIhl5RakX+3hvzmtcTmlbY+w9Vf4quwvNHMW9rpoPCBY=
X-Received: by 2002:a05:6512:3d8f:b0:54b:f10:fe46 with SMTP id
 2adb3069b0e04-54d6e633c8cmr4512868e87.25.1745397577343; Wed, 23 Apr 2025
 01:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
In-Reply-To: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 10:39:25 +0200
X-Gm-Features: ATxdqUHd2AvWX21KS5yncubJtaT0PJGEz4DTRXuWL1cWY2BMp_E6mT4BPCkdw64
Message-ID: <CACRpkdZpHHvbu41xkK2n8-Hzf0euU14T6F42hXLsM277LJA29g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: spacemit: add clock/reset support
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_013939_433841_9A65ABE8 
X-CRM114-Status: GOOD (  10.24  )
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

T24gV2VkLCBBcHIgMTYsIDIwMjUgYXQgMjoxNeKAr0FNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKCj4gU3BhY2VtaVQgSzEgcGluY3RybCByZXF1aXJlcyB0d28gY2xvY2tzIGlu
IG9yZGVyIHRvIGJlIGZ1bmN0aW9uYWwsCj4gYWxzbyBvbmUgcmVzZXQgbGluZSBmcm9tIGhhcmR3
YXJlIHBlcnNlcGVjdGl2ZS4KPgo+IEluIHRoaXMgc2VyaWVzLCBhZGRpbmcgY2xvY2sgcHJvcGVy
dHkgaW4gZHQtYmluZGluZywgYW5kIGFjdGl2YXRlCj4gdGhlbSBpbiB0aGUgZHJpdmVyLiBCdXQg
Zm9yIHJlc2V0LCBtYWtpbmcgaXQgb3B0aW9uYWwgZm9yIG5vdy4KPgo+IEZvciBEVCBwYXJ0IHBh
dGNoLCBJIHBsYW4gdG8gc3VibWl0IGFmdGVyIGNsb2NrIGRyaXZlciBtZXJnZWQuCj4gVGhpcyBt
YXkgcmVzdWx0IGR0YiB3YXJuaW5ncyBpbiB0aGlzIHZlcnNpb24gZHVlIHRvIHRoZSBtaXNpbmcK
PiBjbG9jayBwcm9wZXJ0eSBpbiBwaW5jdHJsIGR0IG5vZGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZ
aXh1biBMYW4gPGRsYW5AZ2VudG9vLm9yZz4KClBhdGNoZXMgYXBwbGllZCEKCllvdXJzLApMaW51
cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
