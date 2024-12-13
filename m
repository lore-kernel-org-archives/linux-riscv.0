Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D56E7717F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 00:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQ1yP/ermMXPu+K92no+JNa2sWO7EIkJGwKWZnQi9uc=; b=mleTY93xjz98na
	O8+95u00laP48sd26pAaQz66nVsyQr2vmyrHBpwSy0gJc6EATsUzWaAvtBsJhzkziN4ziyT1OVROc
	jzijWxJ0BlulZr/NA2N+krT3s4TE/cpYt+WJVMs/A9LdfjdDJHaKr8VwURnZN4ZPINOz3B4yWzRY9
	dtF2KNeunrMXPMGJo01Id9L8XuNB0KGWasPv5LgLAQ/KmZF4K1vh1hBpQ2y//lEIxyMsoTvBkhub5
	C3NEVVRfX9l31mWep0Ijb4bY40X+M9wHjVhNxt4xIM/XElYVQKrOZy2SGJQQiHybpjnuWw7LQL+tu
	LDRKnDOtElTUtcDJ8kkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtL6-00000002GXl-0mW6;
	Fri, 13 Dec 2024 00:15:28 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtL4-00000002GXI-2GVU
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 00:15:27 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-30219437e63so24766561fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Dec 2024 16:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734048924; x=1734653724; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQLAAHrNu8HAwhOxh+FkpsYtnnkpXPTL3VdKn+y7R2k=;
        b=j2DmfT0fDb28GpHjGsNzjvZEnECbYToTqtbD477VTxuYIIb7wMLiyMa+FGPWxMRqgc
         x61OyLkIR910gapM2CyWySE4errcGfNTg0sr92ptQV0MP1VBviHrPhNwG8uvv39/agOP
         ai3PWeGcbbMIM8hyif1GJhmv8AZpVrlGscMMzG2qPGVJF0YdEisc2yRCliQazztKS1SW
         lOTg8PSlmNdcXY6DnIgSr/XLYv9HREliA7hMUCctpqPh5GXLePbUI1SkDc/nQ0eg+xit
         j9wgVE6n4RmYr4M9OgsK02EGgCo+9iGcQkTwJ399kxvLhJG3hwPrDGhGHqE44AjjK/35
         /61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734048924; x=1734653724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQLAAHrNu8HAwhOxh+FkpsYtnnkpXPTL3VdKn+y7R2k=;
        b=JApJqpiDF7o4PcFdyrVkBJ1vSLBRxL6uaz4cxK9dnXXHbu5sR1oGQX1yyhr5N+4+pa
         WcuOoB9b9u1nk7oCNFNOTRaI6+1LAkfqstYcGu+9lThEosFQQCvp0mzWzJvO7DOM1apt
         NfwOjh0FNEzZqcrjlzzqhsRnkTA6YMX6/UCg8q+XnZB0JTEN/qCkBuyhV00y46YJFcmS
         ZM7wiWe3qNrI6Q/srTNqak8WdeICoONu2zrAcONxk5tKE0szcn05sCte+m0hdsYZPooq
         1o0t13h/0vOETjeRaejo++itGSvoIS+7m9ENL4dVQ97GeZAimxoYp3XyoLIxxKAJc8sx
         bYiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhHJOGWg+T1YmdlhcmWPezNBOEEZkqZw/g+cyqv76q9K6UcvM3COXVF20rpGNk9mawpxalgfKSH4CDeg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yypsa/hyhFAxXDsfRcqpXCiQxyhw2uUBDGueyPwPsDEuQJY4j/Y
	ATf4Nuqwn10gTUrF0Qhz/qwGLlJXrzE+jctfS2erO/UTo9EFl5NTp9bUhwoZKHGLNQEZ4yIYSSr
	92Y4uwCC0zQysHXWFZJNVrNqdfZJe1LBS48we+Q==
X-Gm-Gg: ASbGncvtuH/v8mRsTGVDdsmFoWSrnfxtPD+fLTBxvx6rI73z8BjhCg2NJbIFOzKTLid
	6Hjl2XHolb/5EBgKH9MFtNlZhj973oAA35BqY
X-Google-Smtp-Source: AGHT+IGto+HqauyF8o2vgmuC7GK7AZOSBMmGgSe13yKc4BaTYV1aQRpsIlQvUoBUfr6hPCD6cUt2MwGevF3QkBLKPeE=
X-Received: by 2002:a05:6512:2396:b0:540:2de0:c363 with SMTP id
 2adb3069b0e04-54034260c67mr627269e87.13.1734048924079; Thu, 12 Dec 2024
 16:15:24 -0800 (PST)
MIME-Version: 1.0
References: <20241029012312.3448287-1-unicornxw@gmail.com> <173395639623.1729195.12285623767079173929.git-patchwork-notify@kernel.org>
In-Reply-To: <173395639623.1729195.12285623767079173929.git-patchwork-notify@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 13 Dec 2024 01:15:13 +0100
Message-ID: <CACRpkdZTrb-CYtP7Mbdon-BdVWxtByJP2M0CegV_ikodJ-dXSg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: correct typo of description for cv1800
To: patchwork-bot+linux-riscv@kernel.org
Cc: Chen Wang <unicornxw@gmail.com>, linux-riscv@lists.infradead.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, inochiama@outlook.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, unicorn_wang@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_161526_589208_8298D965 
X-CRM114-Status: UNSURE (   6.21  )
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

T24gV2VkLCBEZWMgMTEsIDIwMjQgYXQgMTE6MzPigK9QTSA8cGF0Y2h3b3JrLWJvdCtsaW51eC1y
aXNjdkBrZXJuZWwub3JnPiB3cm90ZToKCj4gVGhpcyBwYXRjaCB3YXMgYXBwbGllZCB0byByaXNj
di9saW51eC5naXQgKGZpeGVzKQo+IGJ5IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz46CgpJbnRlcmVzdGluZywgSSBkaWRuJ3QgaGVhciBhYm91dCBtZSBkb2luZyB0aGF0
IG9yIGV2ZW4gYmVpbmcKYWJsZSB0by4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
