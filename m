Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4413CE7718B
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Dec 2024 16:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZtWH4DEnBIBSvzK+EqCFPOOlBghxeONMAnMy+QUit3Y=; b=OM0h/6pFTShKkI
	yF7IU+mK5fALFyaZR2PG1qgmO1/+R28G2EGT76i0RYTg2IZV4noqoOqKlxx1EINIZRLXqo9WN8r22
	onnSPbI4p1Rl9DuxufifmP3+PyDNkeLXDIR6g24i0WOXVB2+sIeNRtUOgPw84MntKNcUWthap0a2z
	8ahlMrxvKVp2emSwPbcPwpye+S+MmCQGQezCGs/JfzZgd+LKNZyipsiDOIHMtdarA4iNftZqs01g9
	gh4xlOO06jHzsrrmMjZxtZPyrjmvDSVLhgdL6yvilsvA9e1uHbzp/jG3dW4O9G5R+VYUHJUdktwja
	6VpuAQ5O9ShHuMYKsI2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDIa-00000000caw-0aWG;
	Fri, 27 Dec 2024 16:34:52 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDIX-00000000caU-3Uoz
	for linux-riscv@lists.infradead.org;
	Fri, 27 Dec 2024 16:34:51 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so8024811e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 27 Dec 2024 08:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735317288; x=1735922088; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8slS+fVOfiBLyjC+6dHOYmEDiQMdL34iQQiuNik54ZE=;
        b=KVsoidC7cUPFGCFnxUGBq2Qm1ITnjTxR/XMUetyjpBc7Pf+iz/1j6xVmepF7y9pMsX
         e1axAaNGxLWyT0d8RX/xEK1VEOU++l7Zo4Mo8yA76htT1uXGo0CgKOcFli3PowfVoOf0
         krifveAqwgvdq8s4bZhOThdmgsqiCGzDu2Gaw6f+SzqBrd+KDL9D5d/1YzlYSNRTY4qv
         0Bn42q1YPddNV4xRLl4NfJ85727OyNDXLJnwfj51/yEmkW4A9odwxxLDmDWCsWvnudRu
         HbfBK62NhIPu4ytzolY5JwSYyBbZat8fz7Wnz9Zz8Jl8zyvchXT6wZMreY7a05HszJ0/
         3Psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735317288; x=1735922088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8slS+fVOfiBLyjC+6dHOYmEDiQMdL34iQQiuNik54ZE=;
        b=kDc4/DKh9WRk+KCJroJAzteCXB90crrgSIg0Byd+zsfosXM/NIvIu4gBQz3a6JAZ3s
         qBAJOsaoK6NVvVpDbn3zERDKrvcjNPjy9VR3Q19g7MKoITSEJpSM2QvDeW3Ac3kXyE06
         yU8yT8HEPJNiZqSt5dk5+OHF5wgLA8rh2tXb0h3jaBLfmdHP4eo7ZaAvq8u9vVa5daCZ
         976h6ynmYyEgmkP8H90ani5T+3okgO0Bri6BdiC/v9ADz/41VHybv1oDqmQXpWL48IFd
         wpX9imfSDTrMdpIF2NbmBLoHX3iJgVyeHflJOOYT385FsJFvgtuW0NqWO2BW0BbR9w6c
         HTQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmJ43VrP0Xerj7KjH0w119vK8+fu98mD0i2WfOf7jP8pK+vDeJmLRFaLUAgKB/EnNDbkSxJ1BX7QRpyg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjf23w7Ow7l0I38WiQc7ZKz52Q0xmxXNZxxX4jQT/gtReyUxMZ
	E7ox/0xVGDIfo2BKdSgP4J76V4CV1QULxPxXD+vqFjD9RQI+DhCv5R68jAfktn+o+2fJOs4xJfB
	uRA3AsS1BsNcQzwrrGSLw+Q9pkWMgyQLk23VHAQ==
X-Gm-Gg: ASbGncs/r8E9ZaHHXKt+EPnROfy+O6n9SGC49jA73hNvFIuoTo+n8zKRBcW8i/InP6N
	lrEHRxali5jPIVDlA7OuFhcdhSB/NVFKZ8sh0
X-Google-Smtp-Source: AGHT+IFKcJ0e6+Y7yFc5JdvYtyFElA1kRTbxJ9s2rI8zNUXsWpTXr/ByNHm3P2n/+XL7rUtIOMimAHQYo2dLityB/nk=
X-Received: by 2002:a05:6512:6512:b0:542:297f:4f68 with SMTP id
 2adb3069b0e04-542297f4fcdmr5265487e87.0.1735317288016; Fri, 27 Dec 2024
 08:34:48 -0800 (PST)
MIME-Version: 1.0
References: <20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org> <20241225-03-k1-gpio-v3-1-27bb7b441d62@gentoo.org>
In-Reply-To: <20241225-03-k1-gpio-v3-1-27bb7b441d62@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 17:34:36 +0100
Message-ID: <CACRpkdZPD2C2iPwOX_kW1Ug8jVkdHhhc7iFycHtzj5LQ0XWNgQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_083449_925622_8A629A3C 
X-CRM114-Status: GOOD (  13.82  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBEZWMgMjUsIDIwMjQgYXQgMTozM+KAr0FNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKCj4gVGhlIEdQSU8gY29udHJvbGxlciBvZiBLMSBzdXBwb3J0IGJhc2ljIGZ1
bmN0aW9ucyBhcyBpbnB1dC9vdXRwdXQsCj4gYWxsIHBpbnMgY2FuIGJlIHVzZWQgYXMgaW50ZXJy
dXB0IHdoaWNoIHJvdXRlIHRvIG9uZSBJUlEgbGluZSwKPiB0cmlnZ2VyIHR5cGUgY2FuIGJlIHNl
bGVjdCBiZXR3ZWVuIHJpc2luZyBlZGdlLCBmYWlsaW5nIGVkZ2UsIG9yIGJvdGguCj4gVGhlcmUg
YXJlIGZvdXIgR1BJTyBiYW5rcywgZWFjaCBjb25zaXN0aW5nIG9mIDMyIHBpbnMuCiguLi4pCj4g
K2Rlc2NyaXB0aW9uOgo+ICsgIFRoZSBjb250cm9sbGVyJ3MgcmVnaXN0ZXJzIGFyZSBvcmdhbml6
ZWQgYXMgc2V0cyBvZiBlaWdodCAzMi1iaXQKPiArICByZWdpc3RlcnMgd2l0aCBlYWNoIHNldCBj
b250cm9sbGluZyBhIGJhbmsgb2YgdXAgdG8gMzIgcGlucy4gIEEgc2luZ2xlCj4gKyAgaW50ZXJy
dXB0IGlzIHNoYXJlZCBmb3IgYWxsIG9mIHRoZSBiYW5rcyBoYW5kbGVkIGJ5IHRoZSBjb250cm9s
bGVyLgoKSSBsb29rZWQgYXQgdGhlIGRyaXZlciBhbmQgY2FtZSB0byB0aGUgY29uY2x1c2lvbiB0
aGF0IGl0J3MgYmV0dGVyIHRvIHVzZQo0IGRpZmZlcmVudCBpbnN0YW5jZXMgb2YgdGhlIGNoaXAs
IG9uZSBmb3IgZWFjaCBzZXQgb2YgMzJiaXQgcmVnaXN0ZXJzLApzbyB0aGVzZSA0IEdQSU8gY29u
dHJvbGxlcnMgYXJlIGluc3RhbnRpYXRlZCBzZXBhcmF0ZWx5LgoKVGhlIG9wZXJhdGluZyBzeXN0
ZW0gY2FuIGhhbmRsZSB0aGUgc2hhcmVkIGludGVycnVwdCwgdGhlcmUgaXMgbm8KbmVlZCB0byB1
c2UgYSBzaW5nbGUgZGV2aWNlIGluc3RhbmNlIGp1c3QgYmVjYXVzZSB0aGUgaW50ZXJydXB0IGlz
CnNoYXJlZC4KCkRUIGJpbmRpbmdzIGFyZSBvcGVyYXRpbmcgc3lzdGVtIG5ldXRyYWwsIGJ1dCBm
b3IgZXhhbXBsZSBpbiBMaW51eAooaWYgd2UgcHJldGVuZCB0aGlzIGlzIGp1c3Qgb25lIHBvc3Np
YmxlIGV4YW1wbGUpIHRoZW4gYSBkcml2ZXIKaGFuZGxpbmcgYSBzaGFyZWQgSVJRIGNhbiBiZSBy
ZXF1ZXN0ZWQgd2l0aCB0aGUgZmxhZyBJUlFGX1NIQVJFRAphbmQgdGhlIGRyaXZlciBjYW4ganVz
dCByZXR1cm4gSVJRX0hBTkRMRUQgaWYgaXQgaGFuZGxlZCBhbiBJUlEKb3IgSVJRX05PTkUgaWYg
aXQgZGlkbid0IGhhbmRsZSB0aGUgaXJxIChzbyBvdGhlciBpbnN0YW5jZXMgY2FuCmhhbmRsZSBp
dCkuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
