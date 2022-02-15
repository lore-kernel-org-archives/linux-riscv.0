Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635ABC43217
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 12:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UAOr+A1pXW3URX2vyX8FjOVvo68/MloyDwyTL3Dh0vE=; b=vQnrda9cx4Abhk
	iAxhx4/ZDiRNaeGhDWyvgbIdO81rb2xK1aYHkKospwu9fmEcG8y7pTy7NzsHOMJbDkhfYxbkSEz+1
	tbY6+RTd2uxkC+1ss0JpIlpcVNoR0hp23jgdPqKiGE6cwtHw9u9xNiPtyIumDol4n+dLt+ZlVmKwk
	KuamOQhZmUY+om2fzo4jK+p/OYa9jtcY4vi4SsGffJNffw2I2FP9/f6ziCvfMw05UdKy0LiJMIi0c
	Qi0tSvcuHn68Ps9z5S8J1DVfw80Z7yq/Ut9+0SpkfEcRJky6mnzrNoMCqyqThhePPP8xPjTKYnBO4
	PjZfSXTdg0GhYGvI9t7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJx9A-002hZS-8n; Tue, 15 Feb 2022 12:41:32 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJx93-002hWy-7o
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 12:41:30 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6413D407C1
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 12:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644928883;
 bh=QbUWVDT9IJnNp0UgiXgiKB5Xmj3424bun3vMscrN3aE=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=tpy08a6iZ2yTZ+yxfQwwPu96zACuqZM0SDielV0NDWZEW3sB3kEPFkvWe230pBuZQ
 VIKb/WGlIJ+Kb0rrbpDpxdae2FnfzGvi+VKCPfu0BrnI8rmMxrjTr5RnRFpzgEYxG0
 Bb6+5oLaaTv02g0bFiOohidtFwTfZjMQ9BHHUOLJDZVDTwlUH3SAN1m4XR+iTe8PRf
 /ZzWL0J+vVrUQ8CYvg8WDOWzBf+0oYnPySS4/zBRgW5GCH0fYbClXqU97mvdyhx2cK
 mOLa8waMDDboYW9Wft2jU934Z5GjEtSd4ipjwpcZVIwZeiqmkCEgWvuB9bBJ9gEyVT
 l14G9y72unw3A==
Received: by mail-wm1-f70.google.com with SMTP id
 v185-20020a1cacc2000000b0034906580813so1342611wme.1
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 04:41:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QbUWVDT9IJnNp0UgiXgiKB5Xmj3424bun3vMscrN3aE=;
 b=GUMaxZhO45lm5bY6LraPELwcxI5SD8IGb9S1GD61r1TFeoEWM7Coh/eNYZ0HVv0ne3
 Maf/2dzxfpkIuN0OtsftjJhMXBAVsUXqJvfktByYmHKBYUTTeyIQizBfn26zxOKt5d9u
 72FkrpuS2CSgjg/8IRaXGpSYA7dZ9MFlOGcLlKSt9NUiGVvfwFtUv5wDc+ynM+zEYDdA
 RSKJ/mtbbwfhapBm0C1CzR2VlBsZVK7UU1ot0r7rt0IzLs3uBQ/9ykmy728wXcaZxsKZ
 vcAC0CUynsNcKHYd6jfxvRGCnTtq0eocanVRqLlh7Xqq5unGZ/L9IxKYsF/nFCWhjr8z
 qczA==
X-Gm-Message-State: AOAM533MDmm5ZQEzF/J9xBcdgWv3xyBjNm/HqLFRE1UzjYFQWh4NwUmW
 BwBZr5EAPiaoS3DVnMWsUH9NnGe1OkJhqgwR8jvO/hzAkMvYJRieM40VA313cp1sQck4RuDWnsa
 vlWSNIzsxw5c5sGVgQLn/OAkEWNm6AHakQZvGNyxbJelLYA==
X-Received: by 2002:adf:f58f:: with SMTP id f15mr3170189wro.192.1644928882833; 
 Tue, 15 Feb 2022 04:41:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynosHfXmu54wEOehuRxyBrBBX/omTI+7jbTvJMV3zxiDGYGIyyPYwfwd8vXYZelAX0aR/OBQ==
X-Received: by 2002:adf:f58f:: with SMTP id f15mr3170158wro.192.1644928882614; 
 Tue, 15 Feb 2022 04:41:22 -0800 (PST)
Received: from [192.168.0.106] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id u15sm37548631wrs.18.2022.02.15.04.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 04:41:21 -0800 (PST)
Message-ID: <d042abb2-e5df-42b9-824a-6fc3b9c6df6c@canonical.com>
Date: Tue, 15 Feb 2022 13:41:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 00/15] pwm: dt-bindings: Include generic pwm schema
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-pwm@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Lee Jones <lee.jones@linaro.org>, linux-riscv@lists.infradead.org,
 Vignesh R <vigneshr@ti.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-rockchip@lists.infradead.org, Rahul Tanwar <rtanwar@maxlinear.com>,
 bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>,
 Jeff LaBundy <jeff@labundy.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
 <20220215074030.3nugwproxjh3lwhl@pengutronix.de>
 <CA+Eumj42Hojp1m4deuWnqMOaaNaupTSkzPaNbL_0eyBL-aDi_g@mail.gmail.com>
 <7df71f8d-cdc3-4b2e-cf0a-7112eff28142@canonical.com>
 <20220215094106.k35pmoxt2nk44dsj@pengutronix.de>
 <20220215104952.3z7y2t5udwab64kh@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220215104952.3z7y2t5udwab64kh@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_044125_512916_0A0C4B06 
X-CRM114-Status: GOOD (  19.89  )
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

T24gMTUvMDIvMjAyMiAxMTo0OSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gT24gVHVlLCBG
ZWIgMTUsIDIwMjIgYXQgMTA6NDE6MDZBTSArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6
Cj4+IE9uIFR1ZSwgRmViIDE1LCAyMDIyIGF0IDA5OjAyOjI1QU0gKzAxMDAsIEtyenlzenRvZiBL
b3psb3dza2kgd3JvdGU6Cj4+PiBPbiAxNS8wMi8yMDIyIDA4OjU5LCBLcnp5c3p0b2YgS296bG93
c2tpIHdyb3RlOgo+Pj4+IE9uIFR1ZSwgMTUgRmViIDIwMjIgYXQgMDg6NDAsIFV3ZSBLbGVpbmUt
S8O2bmlnCj4+Pj4gPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4+Pj4+
Cj4+Pj4+IEhlbGxvLAo+Pj4+Pgo+Pj4+PiBbZHJvcHBlZCBBbnNvbiBIdWFuZyBhbmQgWWFzaCBT
aGFoIGZyb20gQ2M6IHdoaWNoIHdlcmUgbm90IHJlYWNoYWJsZSBmb3IKPj4+Pj4gbXkgbGFzdCBt
YWlsXQo+Pj4+Pgo+Pj4+PiBPbiBNb24sIEZlYiAxNCwgMjAyMiBhdCAxMDoyMTozOVBNICswMTAw
LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+Pj4+Pj4gSGksCj4+Pj4+Pgo+Pj4+Pj4gQ2hh
bmdlcyBzaW5jZSB2MToKPj4+Pj4+IDEuIEFkZCB0YWdzLgo+Pj4+Pj4gMi4gQWRqdXN0IHN1Ympl
Y3QgKFV3ZSkuCj4+Pj4+Cj4+Pj4+IEhvd2V2ZXIgeW91IG9ubHkgdG9vayBhIHBhcnQgb2YgbXkg
c3VnZ2VzdGlvbiAuLi4KPj4+Pj4KPj4+Pj4+IEtyenlzenRvZiBLb3psb3dza2kgKDE1KToKPj4+
Pj4+ICAgZHQtYmluZGluZ3M6IHB3bTogYWxsd2lubmVyLHN1bjRpLWExMDogSW5jbHVkZSBnZW5l
cmljIHB3bSBzY2hlbWEKPj4+Pj4+ICAgZHQtYmluZGluZ3M6IHB3bTogaW14OiBJbmNsdWRlIGdl
bmVyaWMgcHdtIHNjaGVtYQo+Pj4+Pj4gICBkdC1iaW5kaW5nczogcHdtOiBpbnRlbCxsZ206IElu
Y2x1ZGUgZ2VuZXJpYyBwd20gc2NoZW1hCj4+Pj4+PiAgIGR0LWJpbmRpbmdzOiBwd206IGlxczYy
MGE6IEluY2x1ZGUgZ2VuZXJpYyBwd20gc2NoZW1hCj4+Pj4+PiAgIGR0LWJpbmRpbmdzOiBwd206
IG14czogSW5jbHVkZSBnZW5lcmljIHB3bSBzY2hlbWEKPj4+Pj4+ICAgZHQtYmluZGluZ3M6IHB3
bTogcm9ja2NoaXA6IEluY2x1ZGUgZ2VuZXJpYyBwd20gc2NoZW1hCj4+Pj4+PiAgIGR0LWJpbmRp
bmdzOiBwd206IHNpZml2ZTogSW5jbHVkZSBnZW5lcmljIHB3bSBzY2hlbWEKPj4+Pj4+ICAgZHQt
YmluZGluZ3M6IHB3bTogcmVuZXNhcyxwd206IEluY2x1ZGUgZ2VuZXJpYyBwd20gc2NoZW1hCj4+
Pj4+PiAgIGR0LWJpbmRpbmdzOiBwd206IHRvc2hpYmEsdmlzY29udGk6IEluY2x1ZGUgZ2VuZXJp
YyBwd20gc2NoZW1hCj4+Pj4+PiAgIGR0LWJpbmRpbmdzOiBwd206IGJyY20sYmNtNzAzODogRG8g
bm90IHJlcXVpcmUgcHdtLWNlbGxzIHR3aWNlCj4+Pj4+PiAgIGR0LWJpbmRpbmdzOiBwd206IGlu
dGVsLGtlZW1iYXk6IERvIG5vdCByZXF1aXJlIHB3bS1jZWxscyB0d2ljZQo+Pj4+Pgo+Pj4+PiAu
Li4gVGhlIGFjdHVhbCBwYXRjaCBoYXMgYSBzcGFjZSBhZnRlciB0aGUgY29tbWEsIEkgbGlrZSB0
aGlzIHZhcmlhbnQKPj4+Pj4gd2l0aG91dCBjb21tYSBiZXR0ZXIgYXMgdGhpcyBpcyBhIGNvbXBh
dGlibGUgc3RyaW5nLgo+Pj4+Cj4+Pj4gSSBhbSBjb25mdXNlZC4gTXkgcGF0Y2ggZG9lcyBub3Qg
aGF2ZSBjb21tYSBhZnRlciBzcGFjZS4gWW91ciByZXBseQo+Pj4+IGhhZCBzdWNoIGluIHRoZSBz
dWJqZWN0LCBidXQgbm90IGluIHRoZSBwcm9wb3NlZCBuZXcgc3ViamVjdCB5b3Ugd3JvdGUKPj4+
PiBpbiBtc2csIHNvIEkgbGVmdCBpdCBhcyBpcy4gV2l0aG91dCBjb21tYS4gSWYgeW91IHN0aWxs
IHNlZSBjb21tYSwgaXQKPj4+PiBpcyBzb21ldGhpbmcgd2l0aCB5b3VyIG1haWwgY2xpZW50Lgo+
Pj4+Cj4+Pj4gU2VlOgo+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWRldmljZXRy
ZWUvMjAyMjAyMTQyMTIxNTQuODg1My0xMi1rcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNhbC5j
b20vVC8jdQo+Pj4+Cj4+Pj4gQWxzbyByZXBseSBmcm9tIFZpamF5YWthbm5hbiBkb2VzIG5vdCBo
YXZlIGNvbW1hOgo+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWRldmljZXRyZWUv
MjAyMjAyMTQwODE2MDUuMTYxMzk0LTExLWtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNv
bS9ULyNtODBhZjY5NWYyYzc1MTM0MWJjOTcxMTE0YWVmYTAwY2NjOTI5YTNlYwo+Pgo+PiBTdHJh
bmdlOiBJIGhhdmUgdGhpcyBtYWlsIGZvdXIgdGltZXMgaW4gbXkgbWFpbGJveGVzICh2aWEKPj4g
bGludXgtYXJtLWtlcm5lbCwgbGludXgtcHdtLCBrZXJuZWxAcGVuZ3V0cm9uaXguZGUgYW5kIGRp
cmVjdGx5KS4gSW4gdGhlCj4+IHR3byBsYXR0ZXIgdGhlIFN1YmplY3QgbGluZSBpcyBicm9rZW4g
aW4gdHdvOgo+IAo+IEkgd2FzIHdyb25nLiBUaGUgb25lcyB0byBrZXJuZWxAcGVuZ3V0cm9uaXgu
ZGUgYW5kIHRoZSBsaW51eC1hcm0ta2VybmVsCj4gb25lIGFyZSB0aGUgb25lcyB3aXRoIHRoZSBs
aW5lYnJlYWsuCj4gCj4gSG1tLAo+IAo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVy
bWFpbC9saW51eC1hcm0ta2VybmVsLzIwMjItRmVicnVhcnkvNzE3MzEwLmh0bWwKPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGludXgtYXJtLWtlcm5lbC8yMDIyLUZlYnJ1
YXJ5LzcxNzMwNC5odG1sCj4gCj4gaGFzIHRoZSBsaW5lYnJlYWtzLCB0b28uIFN0aWxsIEkgd29u
ZGVyIHdoYXQgaXMgZGlmZmVyZW50IGJldHdlZW4KPiBrZXJuZWxAcGVuZ3V0cm9uaXguZGUgYW5k
IHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZS4KCk90aGVyIHRocmVhZHMgLSBub3Qgb25s
eSBtaW5lIC0gYXJlIGFsc28gYWZmZWN0ZWQ6Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3Bp
cGVybWFpbC9saW51eC1hcm0ta2VybmVsLzIwMjItRmVicnVhcnkvNzE0MzExLmh0bWwKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LWFybS1rZXJuZWwvMjAyMi1GZWJy
dWFyeS83MTQzMTYuaHRtbApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGlu
dXgtYXJtLWtlcm5lbC8yMDIyLUZlYnJ1YXJ5LzcxNDM2NC5odG1sCgoKQmVzdCByZWdhcmRzLApL
cnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
