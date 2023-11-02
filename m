Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA50EC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 14:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=03+gbTCoclr5uyDsDmBc4ZvrGypCw+SLPWUk9BaT4cw=; b=vTAXkfMNC0UVId
	QA/lhj3wPLSk9/t2e8ior1/Q1nbTwasEDCUSVATjyLTJpTathwRh2N48ze7IdKC6IVXGz8kWJ1B9g
	iny4711TuCxlTSwVI/6DOwnOud37S9y2j56mw3WX9pJ9li5omYQdlCjmZ86elHq4CvFkzd9EGLRkw
	qci79Nf5OevTg646WkqKINDimFA8k6+Wo/Kj2FaSJu6AS4ak2OO1XjWjmTxZz0PN1ijkmui8jtDwX
	PMNkOxZV/JPQaExzDPom433aJtZuVn0mYb70XGtVX53z/cSAEw8Uqy30Hb9YV4GJb5shIScjJgKeG
	1m7io3raeoICHJTGub9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyYhf-009e4i-1f;
	Thu, 02 Nov 2023 14:29:47 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyYha-009e3s-0Z
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 14:29:45 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-32faea0fa1fso368270f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 07:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698935379; x=1699540179; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+zTIXrfkswX74UPgsg79qK4Ca7pyfesNXn6v+dgCKc8=;
        b=sdd/642AbfpEF06ddxovSHrCrxLoBxA4oO8W8pFK+/nmZ7cRC15j9HZNREJp3Oj3BV
         6oU7ZoeD7Wb6oJ2I8R6jrEfp+zzq2FuKfG59yzuJ0GkeVLbLqCuHjTPj5C9UyRrXOn+0
         xpDK1uwEvsoLWkmkk8gSnBtyYdrbcCIls5A7p+jFK3mRFZqBWadlY9B84wGvZDHi6v+M
         9irw0x4HdZ/1cMinxwmtBMb/LokUiQ2D0f+8Z0grho6ZSYqvULcxrFdwi6o7EADbfXJY
         mLYcTxpzvFAXX8/HZUr1kMalUTvYQ9bsTXyaZZEoYxljayst/CqFBy7fz6x9CII5BBQu
         fxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698935379; x=1699540179;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+zTIXrfkswX74UPgsg79qK4Ca7pyfesNXn6v+dgCKc8=;
        b=v1jbT/51FVvJu7o5UN+Wl9NvHU8Zd928MGgzuIRg75Ryjuuj217szmGud1mLAmDjre
         Pto/2xJUHi0CVbCwrSNlt3ohTAbCPI+qPxWL2LLeWcXIXCLWeeF8nCWF1p48c0grMSKi
         Q7WX6k5IiC886z8Iuhk9QnO48SRDUsv1yQ62lXBN0BDf22ncYerAn2BC1cgc7exnAZV2
         3XRCJ62rx8se02uld+Yqe/I7okPA+HtzDByFZgu9XaZ8dAAbC2qigYu1MGLWY11pv/iS
         StCyjQkuka8PDWOMMusKd4RfT1PUsfC7fQqEH5PuPvvs8OUzO6DwPlCZk4fttNH8CTxG
         kqHw==
X-Gm-Message-State: AOJu0Yy9UXDSwgVdyCjCZDfAIiPqo6wjFUimtVKiAmWD4b4+9u/u2v+Y
	jIoS0dznSoMIzv5FV2muq1Y04Q==
X-Google-Smtp-Source: AGHT+IGgX2MJYo2ApjloC6Zm/yknBo7VGdemxbW/96ZkWLnzIPO1lx+Et0ljnlBeTIuHOQiRVzEAWA==
X-Received: by 2002:a5d:4a0c:0:b0:32f:922a:fc49 with SMTP id m12-20020a5d4a0c000000b0032f922afc49mr7100033wrq.21.1698935378579;
        Thu, 02 Nov 2023 07:29:38 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:bd6b:8105:85a4:1102? ([2a05:6e02:1041:c10:bd6b:8105:85a4:1102])
        by smtp.googlemail.com with ESMTPSA id w11-20020adfcd0b000000b00326f0ca3566sm2594397wrm.50.2023.11.02.07.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 07:29:38 -0700 (PDT)
Message-ID: <a8f0011c-5689-4071-b5e0-90bd6b7c66bc@linaro.org>
Date: Thu, 2 Nov 2023 15:29:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] clocksource: Add JH7110 timer driver
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Walker Chen <walker.chen@starfivetech.com>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>
References: <20231019053501.46899-1-xingyu.wu@starfivetech.com>
 <20231019053501.46899-3-xingyu.wu@starfivetech.com>
 <3f76f965-7c7b-109e-2ee0-3033e332e84b@linaro.org>
 <bb819333-52d3-49fc-9bb9-1a227bd5ca8f@starfivetech.com>
 <d0e70434-e273-4799-c5ec-bbee1b3f5cc7@linaro.org>
 <540136d4-6f8f-49a6-80ff-cc621f2f462b@starfivetech.com>
 <65c38717-3e0c-46d3-a124-29cae48f1a2e@linaro.org>
 <72ad5029-42b2-481a-887f-8f6079d8859b@starfivetech.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <72ad5029-42b2-481a-887f-8f6079d8859b@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_072942_213696_FBD14807 
X-CRM114-Status: GOOD (  24.45  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CkhpIFhpbmd5dSwKCk9uIDAyLzExLzIwMjMgMTQ6MTUsIFhpbmd5dSBXdSB3cm90ZToKClsgLi4u
IF0KCj4+Pj4+Pj4gK3N0cnVjdCBqaDcxMTBfY2xrZXZ0IHsgKyAgICBzdHJ1Y3QgY2xvY2tfZXZl
bnRfZGV2aWNlCj4+Pj4+Pj4gZXZ0OyArIHN0cnVjdCBjbG9ja3NvdXJjZSBjczsgKyAgICBib29s
IGNzX2lzX3ZhbGlkOyArCj4+Pj4+Pj4gc3RydWN0IGNsayAqY2xrOyArICAgIHN0cnVjdCByZXNl
dF9jb250cm9sICpyc3Q7ICsgICAgdTMyCj4+Pj4+Pj4gcmF0ZTsgKyAgICB1MzIgcmVsb2FkX3Zh
bDsgKyAgICB2b2lkIF9faW9tZW0gKmJhc2U7ICsKPj4+Pj4+PiBjaGFyIG5hbWVbc2l6ZW9mKCJq
aDcxMTAtdGltZXIuY2hYIildOyArfTsgKyArc3RydWN0IAo+Pj4+Pj4+IGpoNzExMF90aW1lcl9w
cml2IHsgKyAgICBzdHJ1Y3QgY2xrICpwY2xrOyArICAgIHN0cnVjdCAKPj4+Pj4+PiByZXNldF9j
b250cm9sICpwcnN0OyArICAgIHN0cnVjdCBqaDcxMTBfY2xrZXZ0IAo+Pj4+Pj4+IGNsa2V2dFtK
SDcxMTBfVElNRVJfQ0hfTUFYXTsKPj4+Pj4+IAo+Pj4+Pj4gV2h5IGRvIHlvdSBuZWVkIHNldmVy
YWwgY2xvY2sgZXZlbnRzIGFuZCBjbG9jayBzb3VyY2VzID8KPj4+Pj4gCj4+Pj4+IFRoaXMgdGlt
ZXIgaGFzIGZvdXIgY291bnRlcnMgKGNoYW5uZWxzKSB3aGljaCBydW4KPj4+Pj4gaW5kZXBlbmRl
bnRseS4gU28gZWFjaCBjb3VudGVyIGNhbiBoYXZlIGl0cyBvd24gY2xvY2sgZXZlbnQKPj4+Pj4g
YW5kIGNsb2NrIHNvdXJjZSB0byBjb25maWd1cmUgZGlmZmVyZW50IHNldHRpbmdzLgo+Pj4+IAo+
Pj4+IFRoZSBrZXJuZWwgb25seSBuZWVkcyBvbmUgY2xvY2tzb3VyY2UuIFVzdWFsbHkgbXVsdGlw
bGUKPj4+PiBjbG9ja2V2ZW50cyBhcmUgcGVyLWNwdSBiYXNlZCBzeXN0ZW0uCj4+Pj4gCj4+Pj4g
VGhlIGRyaXZlciBkb2VzIG5vdCBzZWVtIHRvIGhhdmUgYSBwZXIgY3B1IHRpbWVyIGJ1dCBqdXN0
IAo+Pj4+IGluaXRpYWxpemluZyBtdWx0aXBsZSBjbG9ja2V2ZW50cyB3aGljaCB3aWxsIGVuZCB1
cCB1bnVzZWQsCj4+Pj4gd2FzdGluZyBlbmVyZ3kuCj4+Pj4gCj4+Pj4gCj4+PiAKPj4+IFRoZSBi
b2FyZCBvZiB0aGUgU3RhckZpdmUgSkg3MTEwIFNvQyBoYXMgdHdvIHR5cGVzIG9mIHRpbWVyIDog
Cj4+PiByaXNjdi10aW1lciBhbmQgamg3MTEwLXRpbWVyLiBJdCBib290cyBieQo+Pj4gcmlzY3Yt
dGltZXIoY2xvY2tzb3VyY2UpIGFuZCB0aGUgamg3MTEwLXRpbWVyIGlzIG9wdGlvbmFsIGFuZAo+
Pj4gYWRkaXRpb25hbC4gSSB0aGluayBJIHNob3VsZCBpbml0aWFsaXplIHRoZSBmb3VyIGNoYW5u
ZWxzIG9mCj4+PiBqaDcxMTAtdGltZXIgYXMgY2xvY2tldmVudHMgbm90IGNsb2Nrc291cmNlIHBy
ZS1jcHUuCj4+IAo+PiBJZiBubyBjbG9ja3NvdXJjZSBpcyBuZWVkZWQgb24gdGhpcyBTb0MgYmVj
YXVzZSByaXNjdiB0aW1lcnMgYXJlCj4+IHVzZWQsIHRoZW4gaXQgaXMgbm90IHVzZWZ1bCB0byBy
ZWdpc3RlciBhIGNsb2Nrc291cmNlIGZvciB0aGlzCj4+IHRpbWVyIGFuZCB0aGUgY29ycmVzcG9u
ZGluZyBjb2RlIGNhbiBnbyBhd2F5Lgo+PiAKPj4gSWYgdGhlIGNsb2NrZXZlbnQgaXMgb3B0aW9u
YWwgd2h5IGRvIHlvdSBuZWVkIHRoaXMgZHJpdmVyIGF0IGFsbD8KPj4gCj4+IAo+PiAKPiAKPiBI
aSBEYW5pZWwsCj4gCj4gU29ycnksIG1heWJlIEkgZGlkbid0IGV4cHJlc3MgaXQgY2xlYXJseSBl
bm91Z2guIEkgdXNlIHRoaXMKPiBqaDcxMTAtdGltZXIgYXMgYSBnbG9iYWwgdGltZXIgb24gdGhl
IFNvQyBhbmQgcmlzY3YtdGltZXIgYXMgY3B1Cj4gbG9jYWwgdGltZXIuIFNvIHRoZXNlIGFyZSBz
b21ldGhpbmcgZGlmZmVyZW50Lgo+IAo+IFRoZXNlIGZvdXIgY291bnRlcnMgaW4gdGhpcyBqaDcx
MTAtdGltZXIgYXJlIGV4YWN0bHkgdGhlIHNhbWUgYW5kCj4gaW5kZXBlbmRlbnQgb2YgZWFjaCBv
dGhlci4gSWYgdGhpcyB0aW1lciBpcyB1c2VkIGFzIGEgZ2xvYmFsIHRpbWVyLAo+IGRvIEkgdXNl
IG9ubHkgb25lIG9yIGFsbCBvZiB0aGUgY291bnRlcnMgdG8gcmVnaXN0ZXIgY2xvY2tzb3VyY2Ug
YW5kCj4gY2xvY2tldmVudD8KClllcy4KClRoZSBnbG9iYWwgdGltZXIgaXMgb25seSB0aGVyZSB3
aGVuIHRoZSBDUFUgaXMgcG93ZXJlZCBkb3duIGF0IGlkbGUgCnRpbWUsIHNvIHRoZSB0aW1lIGZy
YW1ld29yayB3aWxsIHN3aXRjaCB0byB0aGUgYnJvYWRjYXN0IHRpbWVyIGFuZCB0aGVyZSAKY2Fu
IGJlIG9ubHkgb25lIGluc3RhbmNlLgoKSWYgeW91IHJlZ2lzdGVyIGFsbCB0aGUgY291bnRlcnMs
IG9ubHkgb25lIHdpbGwgYmUgdXNlZCBieSB0aGUga2VybmVsLCAKc28gaXQgcG9pbnRsZXNzIHRv
IGFkZCB0aGVtIGFsbC4KCk9uIHRoZSBjbG9ja3NvdXJjZSBzaWRlLCB5b3UgbWF5IHdhbnQgdG8g
cXVlc3Rpb24gaWYgaXQgaXMgcmVhbGx5IAp1c2VmdWwuIFRoZSByaXNjdiBoYXMgYSBjbG9ja3Nv
dXJjZSB3aXRoIGEgaGlnaGVyIHJhdGUgYW5kIGZsYWdnZWQgYXMgCmNvbnRpbnVvdXMgWzFdLiBT
byBpZiB0aGUgSkg3MTEwIGNsb2Nrc291cmNlIGlzIHJlZ2lzdGVyZWQsIGl0IHdvbid0IGJlIAp1
c2VkIHRvby4KCkhvcGUgdGhhdCBoZWxwcwoKICAgLS0gRGFuaWVsCgpbMV0gCmh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RoZXJtYWwvbGludXguZ2l0L3Ry
ZWUvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jI242OAoKLS0gCjxodHRwOi8vd3d3
LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJN
IFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGlu
YXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVy
IHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
