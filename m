Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BD7C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 09:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wQzOu7k3S+isVvlZVAPiEe+fjkstVA7p/s80G96KpEM=; b=vgU7UVit0UhQL4
	9NPbmFBcs4qX3hT1YIwgOI7ecXNf2tyU1/oRimpjVohGgp5AK1adF9KLXfLj5+k1VUyP0hu74QfBN
	DnokzUhrkGEmEXDwZNxjyTo/NhTjB7iHUfq9FJpxcqneKnNIfLruhT5m0Nfeg8/OEt/nvojEq7A8s
	PYd5TUKEVHiWX6LteDqvToLC9dYA4DeiPsLSCt+OKUxIVXWQGxyXgFZ8M28CPSXJB+vPlPLtma6ix
	FacQKkDi0UjaSajv9AvuU+b9ZR7OFsmhHwuazFLWRgtC8saqBIHxMJGyLw/wYkkLFBlDXx1cRB1N0
	C6k+9+9XzCzGDUv2kIJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcNcG-00Cxg7-1B;
	Wed, 15 Mar 2023 09:40:16 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcNcC-00Cxe5-0R
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 09:40:13 +0000
Received: by mail-vs1-xe33.google.com with SMTP id v27so16411217vsa.7
        for <linux-riscv@lists.infradead.org>; Wed, 15 Mar 2023 02:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678873207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjGNv+mrNyH8c6lhNfbNFuFK8MzY9FX1DXYUqHuSxWw=;
        b=J2LhYJ7YvpbwJNXdqS+36pUrrSq52af2lf+JiUJB/V5cz7aUY+dhm9xaiuFbtGMUCA
         nr6SjUrkm4ouWIz/5VaSvt1KXbSdknTch51gmhMAVzfeFFkXp1YnjgeLmUWu+d5Ex+hm
         XYLu73IGm5k2faiK8ersCh6FWWvXDyBHePbtpvTdRIEIKcivBkq2LJleJhzN/vsez3Qx
         WJ1E+WydtKmYVp/+djZR1eHP4/aq/E2CTRLCXjVx6Ymf+PKesiDIECxGlCoFMiV7oEs9
         9DosRnAyTs72C2X4eLhCqMlno2pQTV9ZJVcw/78qckCRQi+7rCntLWNDJs1cQVsrtp8l
         aVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678873207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjGNv+mrNyH8c6lhNfbNFuFK8MzY9FX1DXYUqHuSxWw=;
        b=wR20RJk2NEa33dqTsTuWrS7oGaoWGj5M/6Xfn5oY8RgRNoX4LoHWqDC+v3gz54wqag
         cby7quDzCOlW7qosqV8RZI9Zug951MmuSP/lJvxNqQnUQxdTZ3/YCiuztT4CLkRK5NuM
         1/BmvigxT5/8TgKkTLleGWzGAzERob9AQpN5yPrpQWWqRyGRa37IrCn8hYzkGMATxoAp
         PDFtuhk4i+4e5eCtUcreZvH6342JoNA3MklZqjnPcvHGRgKIPF2usHWq1BRPeXgbQQ2A
         u0d8e8GLHJBJ0oNSk1OUuPzfx5j2wWxVaYqF2ubhjtsSloABvfvtL8Go7HuYDAgsx7ur
         Ye2g==
X-Gm-Message-State: AO0yUKVoy8yWja3MRs23pZLOPwFYQxMbQyql4OhULgIhwT0cIx/uQsm6
	k8CpiD5pPBjSQpKPzzmUx3cYiNEH0KgXYVtnxT0wEQ==
X-Google-Smtp-Source: AK7set8N8ixv8+d1/PKQNLxUKnHCkNDa+28cGujUmgSiVkwjs0AlqH77L/dPjb6d7IugkpS6VP2ztL6zFQJPCyNJo1M=
X-Received: by 2002:a05:6102:3b15:b0:425:cd22:a14e with SMTP id
 x21-20020a0561023b1500b00425cd22a14emr467264vsu.2.1678873207453; Wed, 15 Mar
 2023 02:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 15 Mar 2023 10:39:56 +0100
Message-ID: <CAMRc=Mc61nWCa-a6cG6Q2eVwyaS63VwO59W5tQ7gWigtJkafjA@mail.gmail.com>
Subject: Re: [PATCH 1/8] gpio: ftgpio010: drop of_match_ptr for ID table
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mun Yew Tham <mun.yew.tham@intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Florian Fainelli <f.fainelli@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Nandor Han <nandor.han@ge.com>, 
	Semi Malinen <semi.malinen@ge.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_024012_176793_6432EA1F 
X-CRM114-Status: GOOD (  18.51  )
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

T24gU2F0LCBNYXIgMTEsIDIwMjMgYXQgMTI6MTPigK9QTSBLcnp5c3p0b2YgS296bG93c2tpCjxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gVGhlIGRyaXZlciBjYW4g
bWF0Y2ggb25seSB2aWEgdGhlIERUIHRhYmxlIHNvIHRoZSB0YWJsZSBzaG91bGQgYmUgYWx3YXlz
Cj4gdXNlZCBhbmQgdGhlIG9mX21hdGNoX3B0ciBkb2VzIG5vdCBoYXZlIGFueSBzZW5zZSAodGhp
cyBhbHNvIGFsbG93cyBBQ1BJCj4gbWF0Y2hpbmcgdmlhIFBSUDAwMDEsIGV2ZW4gdGhvdWdoIGl0
IG1pZ2h0IG5vdCBiZSByZWxldmFudCBoZXJlKS4KPgo+ICAgZHJpdmVycy9ncGlvL2dwaW8tZnRn
cGlvMDEwLmM6MzM2OjM0OiBlcnJvcjog4oCYZnRncGlvX2dwaW9fb2ZfbWF0Y2jigJkgZGVmaW5l
ZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPgo+IFNpZ25l
ZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJv
Lm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncGlvL2dwaW8tZnRncGlvMDEwLmMgfCAyICstCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3Bpby9ncGlvLWZ0Z3BpbzAxMC5jIGIvZHJpdmVycy9ncGlvL2dwaW8tZnRn
cGlvMDEwLmMKPiBpbmRleCAyNzI4NjcyZWY5ZjguLjMxZTI2MDcyZjZhZSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwaW8vZ3Bpby1mdGdwaW8wMTAuYwo+ICsrKyBiL2RyaXZlcnMvZ3Bpby9ncGlv
LWZ0Z3BpbzAxMC5jCj4gQEAgLTM0OSw3ICszNDksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZCBmdGdwaW9fZ3Bpb19vZl9tYXRjaFtdID0gewo+ICBzdGF0aWMgc3RydWN0IHBs
YXRmb3JtX2RyaXZlciBmdGdwaW9fZ3Bpb19kcml2ZXIgPSB7Cj4gICAgICAgICAuZHJpdmVyID0g
ewo+ICAgICAgICAgICAgICAgICAubmFtZSAgICAgICAgICAgPSAiZnRncGlvMDEwLWdwaW8iLAo+
IC0gICAgICAgICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9wdHIoZnRncGlvX2dw
aW9fb2ZfbWF0Y2gpLAo+ICsgICAgICAgICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBmdGdwaW9f
Z3Bpb19vZl9tYXRjaCwKPiAgICAgICAgIH0sCj4gICAgICAgICAucHJvYmUgPSBmdGdwaW9fZ3Bp
b19wcm9iZSwKPiAgICAgICAgIC5yZW1vdmUgPSBmdGdwaW9fZ3Bpb19yZW1vdmUsCj4gLS0KPiAy
LjM0LjEKPgoKQXBwbGllZCB0aGUgc2VyaWVzLgoKQmFydAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
