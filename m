Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B84AE8FDD1
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 07:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G7eggfLGhlwDwMG+R4ZIJs0wxQTe1DsFnVyNjGRLCVQ=; b=r1hf7f+ZhJTMmZ
	oIa1TCCxEzrfgHWK8pLIrRlldGishuwMidiOMBigH9IcUz9cGs4CsJCnalJJUhtrlLXUAu9BgIGQH
	YU3odkRU+9QkAs6cKkvw+6T6mznTu2mq6KyPwXhbxB3giew3J5w2/BadZr3UbWw37G3PgMo2Z1a7+
	uPoPln7M5CuRhnhhOT4NzIxz9Xqk+34SQdrDMHlqFtNfz0ZNHdiOXkcTROPi3KyomNtn3A3kI5/Jt
	xAkv2c1MjhlSZ2zZ8cJaIaOArlvO2kcDyvOvtWrYxmxIrHG0ErsM1MRfw1UDkW1OiNNCdeoHejNRN
	vFHW06F5eOaMBRdmK72A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnwlJ-00GiDB-14;
	Wed, 04 Oct 2023 07:57:41 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnwlG-00GiCL-1x
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 07:57:40 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9b2a3fd5764so317419966b.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 00:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696406256; x=1697011056; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ay5Vsk+ralU3n0O47rCc8tQOr+v7R/FfrmtlL/DaMB0=;
        b=Luiwg8gCoXowcfJD7q46ysMidZGox82JSSyJy10WxexmFx6zeT17XNB+suxbO7hngk
         RUoBqFzSuCUZcClfpZlXQDMbFpEVDqOuTBnUsrPQh4T5gCXkdYIrhWQQ/0QIuzMqlv4Z
         H+cUAZShjcZ7JiYI1GFYlaXx00J/sIw5Qy/3DtC7Ph42XbE40xUwuN0XvtCgrhJHAhPn
         tsUk4eWLlRAjNbXBPx9D8t536tCbcZ3mjMIoFUqVKezG+0BOiJfNAV/arGu0dUdtfTY5
         jxlCuJHIJI+kh4AwM7euD956ilhND88aU/90/5S+SNrMauA1BNLhttCAbjaJJ1wnUThO
         95sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696406256; x=1697011056;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ay5Vsk+ralU3n0O47rCc8tQOr+v7R/FfrmtlL/DaMB0=;
        b=RphTJXS+yVnUa9je2VUh689YIYYBBy8kXjgJSDvGvcRMK7vwruA8IIIDyj/kkedScM
         ce3Ug7ZCTzuF2Wdqu+gRovaImz9zV2q66IzIXW71GY5FyNjTYdHV+JQdh6nBxZJSesY+
         WgxtoePInz5RV3GknP9VTYe098fIOnvQztEKKuf9JyfaiJjaQCsm3fqpUCXie56aN35L
         G9CIotXv+br04usOkHUpMTBRUxhQd0+cz6jqfSC+6dZp2Lz39Yr76BWNxXvd9dsJwWrS
         U4g2ImZsZuG6ivJpm3uFzYvXZGUpkVdxCekKZGDz+X3r4trkCj8gJQewpgY5InbBhOXA
         eY9w==
X-Gm-Message-State: AOJu0Yyode/+JOH4Qy/nHO9M90oU2nGxRLgzKXThyNoJ5JChQebJ0VOZ
	5lLlZ2wWqt2NaTCSW19Cyw5cSw==
X-Google-Smtp-Source: AGHT+IExVkG9sutLmv2CCXRkGqFp0eb0ufokjcEUXnRDnQiLLWYXIXB4c/UKg9ZAA39UsmVzRmv4+w==
X-Received: by 2002:a17:906:4496:b0:9b2:babd:cd51 with SMTP id y22-20020a170906449600b009b2babdcd51mr1192483ejo.5.1696406256379;
        Wed, 04 Oct 2023 00:57:36 -0700 (PDT)
Received: from [192.168.1.197] (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id s3-20020aa7d783000000b0053404772535sm1975565edq.81.2023.10.04.00.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 00:57:35 -0700 (PDT)
Message-ID: <37021ef8-55e2-4116-8201-2ab7df9e0fc1@linaro.org>
Date: Wed, 4 Oct 2023 09:57:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] riscv: dts: sophgo: add initial CV1800B SoC device
 tree
Content-Language: en-US
To: Chen Wang <unicorn_wang@outlook.com>, Jisheng Zhang <jszhang@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel <anup@brainfault.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Inochi Amaoto <inochiama@outlook.com>,
 chao.wei@sophgo.com, xiaoguang.xing@sophgo.com
References: <20230930123937.1551-1-jszhang@kernel.org>
 <20230930123937.1551-5-jszhang@kernel.org>
 <MA0P287MB033277186E21A09127407452FECBA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <MA0P287MB033277186E21A09127407452FECBA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_005738_654942_9C9191D3 
X-CRM114-Status: GOOD (  13.94  )
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

T24gMDQvMTAvMjAyMyAwOToyMywgQ2hlbiBXYW5nIHdyb3RlOgo+IAo+IOWcqCAyMDIzLzkvMzAg
MjA6MzksIEppc2hlbmcgWmhhbmcg5YaZ6YGTOgo+PiBBZGQgaW5pdGlhbCBkZXZpY2UgdHJlZSBm
b3IgdGhlIENWMTgwMEIgUklTQy1WIFNvQyBieSBTT1BIR08uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPj4gLS0tCj4+ICAgYXJjaC9yaXNj
di9ib290L2R0cy9zb3BoZ28vY3YxODAwYi5kdHNpIHwgMTE3ICsrKysrKysrKysrKysrKysrKysr
KysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMTcgaW5zZXJ0aW9ucygrKQo+PiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MDBiLmR0c2kKPiAKPiBI
aSwgSmlzaGVuZywgYXMgZmFyIGFzIEkga25vdywgc2cyMDQyIGFuZCBjdjE4MHggYXJlIG5vdyB0
cmFja2VkIGJ5IAo+IGRpZmZlcmVudCBwZW9wbGUgYW5kIGV2ZW4gaW4gc29waGdvLCB0aGV5IGFy
ZSB0d28gaW5kZXBlbmRlbnQgCj4gcHJvamVjdHMoc2cyMDQyIGlzIHRhcmdldCBmb3IgSFBDIGFu
ZCBjdjE4MHggaXMgdGFyZ2V0IGZvciBlbWJlZGVkIAo+IGRldmljZSkuIFRvIGZhY2lsaXRhdGUg
ZnV0dXJlIG1hbmFnZW1lbnQgYW5kIHJldmlldywgSSByZWNvbW1lbmQgCj4gcmVnaXN0ZXJpbmcg
dGhlIG1haW50YWluZXIgaW5mb3JtYXRpb24gaW4gdHdvIGVudHJpZXMgaW4gTUFJTlRBSU5FUlMu
IAo+IFRoZSBleGFtcGxlIGlzIGFzIGZvbGxvd3M6Cj4gCj4gYGBgCj4gCj4gU09QSEdPIENWMTgw
WCBERVZJQ0VUUkVFUwo+IE06wqAgSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+
IEY6wqAgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODAwYi1taWxrdi1kdW8uZHRzCj4g
RjrCoCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MDBiLmR0c2kKPiAKPiBTT1BIR08g
U0cyMDQyIERFVklDRVRSRUVTCj4gTTrCoCBDaGFvIFdlaSA8Y2hhby53ZWlAc29waGdvLmNvbT4K
PiBNOsKgIENoZW4gV2FuZyA8dW5pY29ybnh3QGdtYWlsLmNvbT4KPiBTOsKgIE1haW50YWluZWQK
PiBGOsKgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL01ha2VmaWxlCj4gRjrCoCBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDItY3B1cy5kdHNpCj4gRjrCoCBhcmNoL3Jpc2N2L2Jv
b3QvZHRzL3NvcGhnby9zZzIwNDItbWlsa3YtcGlvbmVlci5kdHMKPiBGOsKgIGFyY2gvcmlzY3Yv
Ym9vdC9kdHMvc29waGdvL3NnMjA0Mi5kdHNpCj4gRjrCoCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmlzY3Yvc29waGdvLnlhbWwKPiBgYGAKPiAKPiBGb3IgTWFrZWZpbGUgYW5k
IHNvcGhnby55YW1sIHN1Y2ggY29tbW9uIGZpbGVzLCBqdXN0IGtlZXAgaW4gc2cyMDQyIAo+IGVu
dHJ5IHNob3VsZCBiZSBmaW5lLgo+IAo+IEBDb25vciwgd2hhdCBkbyB5b3UgdGhpbms/CgpXZSBk
byBubyBoYXZlIHVzdWFsbHkgcGVyLWJvYXJkIG1haW50YWluZXIgZW50cmllcyAod2l0aCBmZXcK
ZXhjZXB0aW9ucykuIEkgc3Ryb25nbHkgcHJlZmVyIHRoaXMgb25lIGluc3RlYWQ6CgpodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvODI5YjEyMmRhNTI0ODI3MDdiNzgzZGMzZDkzZDNmZjAxNzlj
YjBjYS5jYW1lbEBwZXJjaGVzLmNvbS8KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
