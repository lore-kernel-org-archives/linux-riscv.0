Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EDCC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 08:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3UIILAK4jqGuMSWei/H48sQaclG0M5GwnJZ43XluY8=; b=lpiqjRptUoxjMz
	ebnI8hCJfNaQzHWQAKzBKzympB7G4bjeO1yJQOOFT0V1OfXfplO4jgoLTWtMtJ8Wo/0Jv6dXPOqKW
	c8yxx6sdvf8GfD7S2+8GeeC5o2lt3q6TGKk6nvj+2SX0YPCpUAhxwfJ1qLGn1+pGZWa3OpBBAbNUi
	TxFnVXxMsv9UHj+dUkvneFDqa6ohgyhsWQfijvw/KwCNh3UPcVnlfSLyjAh+mx9HznrG5YOwGSnJ4
	0lt+P7ezjz6sD//FOqGl+EZh4cuM0pGxS/qYuFuakk33neZghDq2m8H06cQMLtLSBv/8NW1f95RXS
	20Vzad3n1WqfmRmhzWSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJsl4-001Rpl-6R; Tue, 15 Feb 2022 08:00:22 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJsl0-001Rlq-Bq
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 08:00:20 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5A5E940338
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 08:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644912016;
 bh=WKmF3ofcPXNkDjn7YKxiUvOekr6rsM7Z5lgS0lqXT8w=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=cqiD1ptVOu3EZrIk3tjLcQJViDfjtdtpG6WiM1LtdI4tP6eqTBxH9OQz63WiMGNjJ
 BQtSC32whCrxINOk/BitByk0nAXRjGZyyQ3R5v5OnGHSOgA52K1iFtRic/nVUZIEt+
 JVeC7nbUov/SWyo8J52OU3Pfd2GVMxnHcnr40+bwRPni01ZOYLjhuykHImCRlvxvKp
 iQPNPG7dVZ3A31YPY36+Rxw9cWRIs247D+mkt9OgtQCQGnTW7r1/nH71foCGRjjR6F
 NzOv3X+++AJpeoB1j7LmtBLUcF3211PpBW5snTo9iwM3OCFqZIawzmjZ1Y5WViO1y4
 byOUo4emGVFWA==
Received: by mail-lf1-f70.google.com with SMTP id
 o25-20020a05651205d900b0043e6c10892bso5925030lfo.14
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 00:00:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WKmF3ofcPXNkDjn7YKxiUvOekr6rsM7Z5lgS0lqXT8w=;
 b=excpa0aq6/JErQ0WZ/I6XghqB19GO+Bar8VmACNw+VmTd4jko/KaiLPBJ0apvq/XUP
 9yyNE6aIlgqwyNiD1BnuPNqOK4ZrYnAI51rrxD+WM2LGUGsWW8Gm8f/6fGiszMiW7e+A
 3JB3NnXUWvO8GdvqcA8/Ob1zQRfLlSacmZUP5kfoIVGAVNFsKfoIcHjboWWv3lq81ssB
 aVF4GQZErBAzaLKdMi0A6Q+y7ziCIfj+zkKFejo5DrqcLGAyNWAUPA2KVnezdVhQ9qxH
 9mefj4NgYopZznrQWM4YC3weTDNkDZvRM9ryKETTGJ8Aq/i0UoVvmKZSOsR0jb+RdsKO
 jgrA==
X-Gm-Message-State: AOAM532L0tu4ffMpGXwG2Rv2TpA/OsALXM3y+xDdDCQp+fL35J+IqcTg
 Hlg7HP2Bcore9YxmIJt6Iml6hO5XXFTQX3cYvSy4AzpJkPQAVHMNOQhh2KrF+kvfvW225Shp/no
 RpldZKN8KVSZbjIBB5BUEboah7li2qUpEGYgRpZ6FzMptfOENJzF6LHJqXj3nsw==
X-Received: by 2002:a17:907:1c01:: with SMTP id
 nc1mr2010495ejc.659.1644912003592; 
 Tue, 15 Feb 2022 00:00:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuZ4VRaFsrBt53zgXGJrUAfN8tOgQwKpQDCWWN0b0yuET7r2Bc26aSK/euYsuMQ1hH/V9RfLx8GOJpFFdq8EM=
X-Received: by 2002:a17:907:1c01:: with SMTP id
 nc1mr2010457ejc.659.1644912003335; 
 Tue, 15 Feb 2022 00:00:03 -0800 (PST)
MIME-Version: 1.0
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
 <20220215074030.3nugwproxjh3lwhl@pengutronix.de>
In-Reply-To: <20220215074030.3nugwproxjh3lwhl@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Tue, 15 Feb 2022 08:59:52 +0100
Message-ID: <CA+Eumj42Hojp1m4deuWnqMOaaNaupTSkzPaNbL_0eyBL-aDi_g@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] pwm: dt-bindings: Include generic pwm schema
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, 
 bcm-kernel-feedback-list@broadcom.com, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Heiko Stuebner <heiko@sntech.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
 Rahul Tanwar <rtanwar@maxlinear.com>, 
 Jeff LaBundy <jeff@labundy.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Vignesh R <vigneshr@ti.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-pwm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_000018_614849_A36455A5 
X-CRM114-Status: GOOD (  17.76  )
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

T24gVHVlLCAxNSBGZWIgMjAyMiBhdCAwODo0MCwgVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IFtkcm9wcGVkIEFu
c29uIEh1YW5nIGFuZCBZYXNoIFNoYWggZnJvbSBDYzogd2hpY2ggd2VyZSBub3QgcmVhY2hhYmxl
IGZvcgo+IG15IGxhc3QgbWFpbF0KPgo+IE9uIE1vbiwgRmViIDE0LCAyMDIyIGF0IDEwOjIxOjM5
UE0gKzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPiBDaGFu
Z2VzIHNpbmNlIHYxOgo+ID4gMS4gQWRkIHRhZ3MuCj4gPiAyLiBBZGp1c3Qgc3ViamVjdCAoVXdl
KS4KPgo+IEhvd2V2ZXIgeW91IG9ubHkgdG9vayBhIHBhcnQgb2YgbXkgc3VnZ2VzdGlvbiAuLi4K
Pgo+ID4gS3J6eXN6dG9mIEtvemxvd3NraSAoMTUpOgo+ID4gICBkdC1iaW5kaW5nczogcHdtOiBh
bGx3aW5uZXIsc3VuNGktYTEwOiBJbmNsdWRlIGdlbmVyaWMgcHdtIHNjaGVtYQo+ID4gICBkdC1i
aW5kaW5nczogcHdtOiBpbXg6IEluY2x1ZGUgZ2VuZXJpYyBwd20gc2NoZW1hCj4gPiAgIGR0LWJp
bmRpbmdzOiBwd206IGludGVsLGxnbTogSW5jbHVkZSBnZW5lcmljIHB3bSBzY2hlbWEKPiA+ICAg
ZHQtYmluZGluZ3M6IHB3bTogaXFzNjIwYTogSW5jbHVkZSBnZW5lcmljIHB3bSBzY2hlbWEKPiA+
ICAgZHQtYmluZGluZ3M6IHB3bTogbXhzOiBJbmNsdWRlIGdlbmVyaWMgcHdtIHNjaGVtYQo+ID4g
ICBkdC1iaW5kaW5nczogcHdtOiByb2NrY2hpcDogSW5jbHVkZSBnZW5lcmljIHB3bSBzY2hlbWEK
PiA+ICAgZHQtYmluZGluZ3M6IHB3bTogc2lmaXZlOiBJbmNsdWRlIGdlbmVyaWMgcHdtIHNjaGVt
YQo+ID4gICBkdC1iaW5kaW5nczogcHdtOiByZW5lc2FzLHB3bTogSW5jbHVkZSBnZW5lcmljIHB3
bSBzY2hlbWEKPiA+ICAgZHQtYmluZGluZ3M6IHB3bTogdG9zaGliYSx2aXNjb250aTogSW5jbHVk
ZSBnZW5lcmljIHB3bSBzY2hlbWEKPiA+ICAgZHQtYmluZGluZ3M6IHB3bTogYnJjbSxiY203MDM4
OiBEbyBub3QgcmVxdWlyZSBwd20tY2VsbHMgdHdpY2UKPiA+ICAgZHQtYmluZGluZ3M6IHB3bTog
aW50ZWwsa2VlbWJheTogRG8gbm90IHJlcXVpcmUgcHdtLWNlbGxzIHR3aWNlCj4KPiAuLi4gVGhl
IGFjdHVhbCBwYXRjaCBoYXMgYSBzcGFjZSBhZnRlciB0aGUgY29tbWEsIEkgbGlrZSB0aGlzIHZh
cmlhbnQKPiB3aXRob3V0IGNvbW1hIGJldHRlciBhcyB0aGlzIGlzIGEgY29tcGF0aWJsZSBzdHJp
bmcuCgpJIGFtIGNvbmZ1c2VkLiBNeSBwYXRjaCBkb2VzIG5vdCBoYXZlIGNvbW1hIGFmdGVyIHNw
YWNlLiBZb3VyIHJlcGx5CmhhZCBzdWNoIGluIHRoZSBzdWJqZWN0LCBidXQgbm90IGluIHRoZSBw
cm9wb3NlZCBuZXcgc3ViamVjdCB5b3Ugd3JvdGUKaW4gbXNnLCBzbyBJIGxlZnQgaXQgYXMgaXMu
IFdpdGhvdXQgY29tbWEuIElmIHlvdSBzdGlsbCBzZWUgY29tbWEsIGl0CmlzIHNvbWV0aGluZyB3
aXRoIHlvdXIgbWFpbCBjbGllbnQuCgpTZWU6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LWRldmljZXRyZWUvMjAyMjAyMTQyMTIxNTQuODg1My0xMi1rcnp5c3p0b2Yua296bG93c2tpQGNh
bm9uaWNhbC5jb20vVC8jdQoKQWxzbyByZXBseSBmcm9tIFZpamF5YWthbm5hbiBkb2VzIG5vdCBo
YXZlIGNvbW1hOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1kZXZpY2V0cmVlLzIwMjIw
MjE0MDgxNjA1LjE2MTM5NC0xMS1rcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb20vVC8j
bTgwYWY2OTVmMmM3NTEzNDFiYzk3MTExNGFlZmEwMGNjYzkyOWEzZWMKCj4gQWxzbyBhICMgYmVm
b3JlCj4gcHdtLWNlbGxzIHdvdWxkIGJlIG5pY2UuCgpJIGNhbiBhZGQgdGhpcy4KCkJlc3QgcmVn
YXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
