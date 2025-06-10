Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04261C61DB2
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 22:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/cM4SlH8aAVWZEVfyU/99HdwbYaoqcNd6mBqGPgs3/4=; b=qK4jGtpAy4BiR4
	pmj+75aAVhFGfXltC8F9jPEpp0GfSiF5asOZY1tpVNW1UFpGuVxDVcftMY9Bl5eJakQ2xoouWljFv
	UhDEDOOFLIIE7sgCXPiBY+ulq9zJbhVHhgAJRq24BsnKW1V8QmqVO2c9OOjgGBCj/riO5H7k7CfLB
	WzDIZCg/8VYQijBpao9vigOSEa/GyUeswnwGp6jUGAkzhy8HC3cXMvuHYQi/n0IOVcaNtcy6NDA1v
	d863BKyPayP4BEdgwqKYI/4NKlJkjiAWKn6hlOOAzrmxhV/7v8qCfrXHqv0mCQ4JxkO/egQt5vkZo
	N00QnxAIoQtvTiFC9vZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7ne-00000008Iur-3e2V;
	Tue, 10 Jun 2025 22:50:34 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP6Ki-000000085sY-2uYG
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 21:16:55 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-32934448e8bso51538611fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 14:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749590195; x=1750194995; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=eTm4qJu+M8u9TpwMBjgiz0tGV2Vt2ciX9LPQJRZSCLzxvKckQBCd7IWBwHKMwGrhf5
         ajKBera2bUThTzpJh23EhH+i2cINaQEFRPWR7U1vymQXshAhN7OsDxlFekp9bw8n8LK3
         Es5fv1gMezfc+IrFNn1FVK2+vpoTX+rmXUxHn4TEr6ot1GEe/f6muKyJq8TczWcjeZ7K
         WU7qJOU72DbNJRgYGlAZXYz7bMNLoAl6fvyiIYL3H+xvNr13YZ84TLS4GqoPw2XyiWFs
         96YNYiIl3tfg9YdJw/0nC38vBr7SiZ/EZJsQpoKn4hSrsD60agveS/ULN8LQBGUFn4Fy
         ORcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749590195; x=1750194995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=n5VhiFr/K6uYXEDaJSgGG+iWLxmDfl2shB9iw3kBzJjNK/P5HyRfH1mOJOxf/OQ1W6
         b/YYD7oS6wP3jdSjiEmWXTvyrya2+gHFNzNsjLKS8Q4Q49JD+r+PBa/uxBCJCyb5tr4P
         eKN7xlnQgp96WU/PIt3sgK4zTHNau1InhtrFPuTXB1S/G+egSyOwtCxif1pMhSPWKylN
         Xww+afCKj5wveStZ2m8JTn+0slMuNQEuCY+JFhNAAKlqZwFGZxOdV+sdYSihZUtux7qW
         pxdUYpD9jl2+wSkeUwB+1NM8BQkrZbjnRV8w6b8kABmQV1PTPf77u1E1FMO07iMKj0l3
         9EzA==
X-Forwarded-Encrypted: i=1; AJvYcCVV1mZoFMP2GxKuNcoibdfu2HP9gzZY3xOwvQWylA6LSk33/XqVeJtaUnXb5BpuxfXvpD3tPMQm5gTAOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyM9UwscNHSJ35K3z2DEhA2Bg1jOBh0EM31Gd2uBLhKghi7ZV3U
	UPjD61AjBgmw2xITADydFRDQf1OGL/u5Y6nUaVExV1KLu9jH+QjyzwMc3geoqjKOojre0IJE/uF
	6AmxEzRQCzt/QAp/43VQ0Ui94Hd0HLtrbusx6VA6sPw==
X-Gm-Gg: ASbGnctJirGW9seT7QiMe4Pp7ELe6B0TQS5c+W9V/4VHFLX2tBERbBOy5fOq3CeynIk
	UrSf47ubvfyVC1lmYIW0VwwTZYaFYcYQw5mUoAJIG/baEDAyK5OIZPs640o6mpyZQI+gSs1+6pm
	N6qMBtievGv8ugqcEt2SW924j9tDip1EZuyS5VSlHAnCk=
X-Google-Smtp-Source: AGHT+IFjB38ga64es1q/x9Xln0eJ4c1gLnvGRBRN0i0PTR13a813fBLuiycDGURGtRbChXkECB+ZBVHqj34ThqQMqbk=
X-Received: by 2002:a05:651c:1a0a:b0:32a:6aa0:217c with SMTP id
 38308e7fff4ca-32b21e99d3bmr1744231fa.34.1749590194721; Tue, 10 Jun 2025
 14:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 23:16:23 +0200
X-Gm-Features: AX0GCFuXsSEbKJPPrZYl0t_vGXohg5ZS4zY2cQAKwzq1fVBy4N3FSGLwpMM1OkY
Message-ID: <CACRpkdYrnmi2a8iL0tA7zNDfhMRN3F-NEfTntxXgC54t-LZA4w@mail.gmail.com>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_141636_736665_7B63D461 
X-CRM114-Status: UNSURE (   7.98  )
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

T24gVHVlLCBKdW4gMTAsIDIwMjUgYXQgMjozM+KAr1BNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+IHdyb3RlOgoKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6
LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4KPiBzdHJ1Y3QgZ3Bpb19jaGlwIG5vdyBoYXMgY2Fs
bGJhY2tzIGZvciBzZXR0aW5nIGxpbmUgdmFsdWVzIHRoYXQgcmV0dXJuCj4gYW4gaW50ZWdlciwg
YWxsb3dpbmcgdG8gaW5kaWNhdGUgZmFpbHVyZXMuIENvbnZlcnQgdGhlIGRyaXZlciB0byB1c2lu
Zwo+IHRoZW0uCj4KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6
LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+CgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGlu
dXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
