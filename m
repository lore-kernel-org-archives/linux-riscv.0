Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC05C54791
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 16:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JlgWB2E5Z3++KLueaB60leP2eRxoB6bSC3TYLogz68Y=; b=1E+fzUSOiIPjcW
	8M9H+qX/5CPF/xxOFxoaaXODZ3FSov1suBy/FBP9wLGhbSOFnY065YFFNUGQ0wMLmhpisoqIj8Jti
	3VfT20HjrODu7kTyL6qlkCb99UeBrtgMnuuYjnEIdqLbQGs3dqUJftRvKprTFgeY2zsF44vRsZ9xI
	bbaU1Hga3G9ZdlmpauDv+uukrLduaFW3W/FB9XpM/w4bHZ2EtTb5tYp83Ht51N7r9MEp2Z+uR/Kxx
	eL1t2RjZnCTioNe1aqEYV5jCO0jM4EEWMMLC00x68pVD1YKyLSd2dVfwkDTlDP8g7e/q9KhDcveby
	oP3hyAq42gfVE2xeK+lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkROJ-0000000AksC-2F70;
	Wed, 13 Mar 2024 16:23:43 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkROG-0000000Akqq-0O6Q
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 16:23:41 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-690c1747c3cso832666d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Mar 2024 09:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710347018; x=1710951818; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=azgghDatY9Rxnoyec+Q+8O2UeCiS6yMjUBITF9dU9ZQ=;
        b=ajpldfGWk2S+WJR55FoHw+ADKfHFl1aj26VWKzY2c93q58diaIFtFvRUh/F6zvohMK
         /agOYNnS9esks1Bp0m19m0cE6LvFuX9pbqgPNtXdOPbyhe5l0PLoXjMsp22CdGYHySyg
         f97bPYdKBPDiKTRWGcQMA74KUfxKAuFTCf/mwU/K6vuAxChPiwRJHd0CriVlGxmarj3B
         zejVsr6C3fot3V0X7vZZn5xrfXwxmUeQCezone7I/t+GjVs4krvXg6Ov1IMFPoWD8kx9
         mWqtTgm9qsyBxDdS7l3GKNt0i/qXoEzdUBRg0CsxVJQDRRAFsBPNHOH4xbK6zxYWnVy4
         SZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710347018; x=1710951818;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=azgghDatY9Rxnoyec+Q+8O2UeCiS6yMjUBITF9dU9ZQ=;
        b=YYmxkIfBwNPpZZ+Diuo05qQsNT44Evf5cdL45Oo4H8NkB3R7xyzHbvBPaLuqMYgFWD
         l44pcyFx2PCBm0Lb+x6yV/8nyOpSyYb3MnFbzAQwfWaVcp/SgebkWkPKQ/5kwO8CZWIF
         jPDpFSmZuCG/njnIT3vuanjxP7V1CLDuj++8lOm/cJykjUxUdsmOW+KvtcRd8IUBbkUy
         2FBfXVNgttXmiVtsrcuoD4GgJUpiNbJFm1ntHk0Oeyv6TXM/9/eeNGowL2Xu0s6t7IJk
         brknKmv0J4hCZpsoiXv9sHZrv26SpRe7Mitw7QflDJSEpLLShvw5TCzChYaeO3IvcRKg
         80Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUn/yEhK1nUNDr3LHvbhL7x0wc/4uJZQroDMPhCtFB1J/KNk4eKAG6zLXfDAImMe/3bZ1yoer4OBQWK8OoNaJf8lmUst76iWAyQ/hOJmnxO
X-Gm-Message-State: AOJu0YyeoETmS6TXoPvkRgLdJQcQpFLBoUY9tld7yTFbj2xZ0vBSrwie
	PbW2ea+NcLAKLvOkkJSTPiAyly9Ab81B4jCETZzsIKtqbZcxGpsPFujhpR/uiV8=
X-Google-Smtp-Source: AGHT+IGYIV8uYoqL4auSgQDqWaM2t72bdF5Dhxc8OhmTtRKW7l5mFr43UTUD1LQJuVrbO1IN0YIrrQ==
X-Received: by 2002:a05:6214:1650:b0:690:9e6d:efe9 with SMTP id f16-20020a056214165000b006909e6defe9mr553361qvw.27.1710347018666;
        Wed, 13 Mar 2024 09:23:38 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.176])
        by smtp.gmail.com with ESMTPSA id jh18-20020a0562141fd200b0068ff8d75a90sm4900672qvb.19.2024.03.13.09.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 09:23:38 -0700 (PDT)
Message-ID: <3e0a75a8-2c3d-478a-9e16-f6252cae3367@sifive.com>
Date: Wed, 13 Mar 2024 11:23:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/timer-sun4i: Partially convert to a
 platform driver
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <apatel@ventanamicro.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240312192519.1602493-1-samuel.holland@sifive.com>
 <d68fd8a7-8889-472e-86db-b62855eebfba@linaro.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <d68fd8a7-8889-472e-86db-b62855eebfba@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_092340_195361_1A057D15 
X-CRM114-Status: GOOD (  15.43  )
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

T24gMjAyNC0wMy0xMyAxMDoyOSBBTSwgRGFuaWVsIExlemNhbm8gd3JvdGU6Cj4gT24gMTIvMDMv
MjAyNCAyMDoyNSwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4+IENvbW1pdCA4ZWM5OWIwMzMxNDcg
KCJpcnFjaGlwL3NpZml2ZS1wbGljOiBDb252ZXJ0IFBMSUMgZHJpdmVyIGludG8gYQo+PiBwbGF0
Zm9ybSBkcml2ZXIiKSBicm9rZSB0aGUgTU1JTyB0aW1lciBvbiB0aGUgQWxsd2lubmVyIEQxIFNv
QyBiZWNhdXNlCj4+IHRoZSBJUlEgZG9tYWluIGlzIG5vIGxvbmdlciBhdmFpbGFibGUgd2hlbiB0
aW1lcl9wcm9iZSgpIGlzIGNhbGxlZDoKPj4KPj4gwqDCoCBbwqDCoMKgIDAuMDAwMDAwXSBpcnE6
IG5vIGlycSBkb21haW4gZm91bmQgZm9yIGludGVycnVwdC1jb250cm9sbGVyQDEwMDAwMDAwICEK
Pj4gwqDCoCBbwqDCoMKgIDAuMDAwMDAwXSBGYWlsZWQgdG8gbWFwIGludGVycnVwdCBmb3IgL3Nv
Yy90aW1lckAyMDUwMDAwCj4+IMKgwqAgW8KgwqDCoCAwLjAwMDAwMF0gRmFpbGVkIHRvIGluaXRp
YWxpemUgJy9zb2MvdGltZXJAMjA1MDAwMCc6IC0yMgo+Pgo+PiBGaXggdGhpcyBieSB3cmFwcGlu
ZyB0aGUgdGltZXIgaW5pdGlhbGl6YXRpb24gaW4gYSBwbGF0Zm9ybSBkcml2ZXIuCj4+IGJ1aWx0
aW5fcGxhdGZvcm1fZHJpdmVyX3Byb2JlKCkgbXVzdCBiZSB1c2VkIGJlY2F1c2UgdGhlIGRyaXZl
ciB1c2VzCj4+IHRpbWVyX29mX2luaXQoKSwgd2hpY2ggaXMgbWFya2VkIGFzIF9faW5pdC4gT25s
eSBjb252ZXJ0IHRoZSBzdW44aQo+PiB2YXJpYW50cyBvZiB0aGUgaGFyZHdhcmUsIGJlY2F1c2Ug
c29tZSBvbGRlciBTb0NzIHN0aWxsIG5lZWQgdGhlIHRpbWVyCj4+IHByb2JlZCBlYXJseSBmb3Ig
c2NoZWRfY2xvY2soKS4KPj4KPj4gRml4ZXM6IDhlYzk5YjAzMzE0NyAoImlycWNoaXAvc2lmaXZl
LXBsaWM6IENvbnZlcnQgUExJQyBkcml2ZXIgaW50byBhIHBsYXRmb3JtCj4+IGRyaXZlciIpCj4+
IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29t
Pgo+IAo+IFdoeSBFUFJPQkVfREVGRVIgaW4gdGhlcm1hbC1vZiBjYW4gbm90IGZpeCB0aGUgaXNz
dWU/Cj4gCj4gSSBtZWFuIGNhbid0IHdlIGNoZWNrIGlmIG9mX2lycV9nZXRfYnluYW1lKCkgcmV0
dXJucyBFUFJPQkVfREVGRVIgYW5kIHRoZW4KPiByZXR1cm4gdGhpcyB2YWx1ZT8KCkVQUk9CRV9E
RUZFUiB3b3VsZCBub3QgaGVscCBlaXRoZXIgYmVmb3JlIG9yIGFmdGVyIHRoaXMgcGF0Y2guCgpC
ZWZvcmUgdGhpcyBwYXRjaCwgdGhlIGRyaXZlciB1c2VzIFRJTUVSX09GX0RFQ0xBUkUsIHdoaWNo
IG1lYW5zIHRoZSB0aW1lciBnZXRzCmluaXRpYWxpemVkIGZyb20gdGhlIGxvb3AgaW4gdGltZXJf
cHJvYmUoKS4gVGhhdCBmdW5jdGlvbiBkb2VzIG5vdCByZXRyeSBpZiB0aGUKaW5pdGlhbGl6YXRp
b24gZnVuY3Rpb24gcmV0dXJucyBFUFJPQkVfREVGRVIuIEFuZCB0aW1lcl9wcm9iZSgpIGlzIG9u
bHkgbWVhbnQgdG8KYmUgY2FsbGVkIG9uY2UsIGJlZm9yZSBhbnkgcGxhdGZvcm0gZHJpdmVycyBh
cmUgcmVnaXN0ZXJlZC4KCkl0IGRvZXMgbm90IGhlbHAgYWZ0ZXIgdGhpcyBwYXRjaCBlaXRoZXIs
IGJlY2F1c2UgX19wbGF0Zm9ybV9kcml2ZXJfcHJvYmUoKSBhbHNvCnJlcXVpcmVzIHRoZSBwcm9i
ZSB0byBzdWNjZWVkIHRoZSBmaXJzdCB0aW1lLiBUaGlzIGlzIG5lZWRlZCB0byBlbnN1cmUgdGhl
IHByb2JlCmZ1bmN0aW9uIHJ1bnMgYmVmb3JlIF9faW5pdCBtZW1vcnkgaXMgZGlzY2FyZGVkLiAo
VG8gc3VwcG9ydCBkZWZlcnJlZCBwcm9iaW5nIGluCnRpbWVyLW9mLCBub25lIG9mIHRoZSBmdW5j
dGlvbnMgY291bGQgYmUgbWFya2VkIGFzIF9faW5pdC4pCgpCdXQgdGhhdCBpcyBva2F5LCBiZWNh
dXNlIGlmIGJvdGggdGhlIGlycWNoaXAgYW5kIHRoZSB0aW1lciB1c2UgcGxhdGZvcm0KZHJpdmVy
cywgZndfZGV2bGluayBlbnN1cmVzIHRoZXkgYXJlIHByb2JlZCBpbiB0aGUgcmlnaHQgb3JkZXIu
IFNvIHRoaXMgcGF0Y2gKcmVsaWFibHkgYWxsb3dzIHRoZSB0aW1lciB0byBwcm9iZSBzdWNjZXNz
ZnVsbHkuCgpSZWdhcmRzLApTYW11ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
