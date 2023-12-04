Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D137C10DC1
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 17:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AEUkZSIav6EnR66S5cryT7fDnuA78pnnNdh5/R1Po7k=; b=b94HHeDHlBTlox
	SpVcrFggU1JJItAqG4WkD+qjS9mx1QsLGOXpK3bNfEyMkU2j1ZUtGHPYc4Ybm7U5fUWNFpJ6NNmK8
	sP5VT8XORrsYSPHs1qFTDm/g6BPClZU1hZpQ/VaCNk9VAu3GIB7+G2ZV9fo6YPefQagz5jt7lOnwH
	pkzmCnyNhIWjhtl8AoarACQb4JObGigBli7BMBxFK66mqfQGbJb9mJ1n0kNFVqgbyJjwwJDMQM55u
	4SLmWT6mxidGyM4FNYaFuqKPk96w61QHOXzVqqlHhMTl5zFWSWAoCaSBodfYYApVmMMoMzeCb7pax
	EtTcxRVhdxXOhusKtjSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rACp8-005CcU-1K;
	Mon, 04 Dec 2023 17:33:38 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rACp5-005Cb8-1g
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 17:33:37 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40c0a11a914so14023035e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 09:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701711213; x=1702316013; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sug326j4RkqoO9Ptow3nZ3kvcZ7Swug2lDF9621hV9A=;
        b=LLhIwBnF4Deo1gGxYJm5HnVfyubdKxQldDtPy4KHQMak5bvaioZvd4PrMB2uMXUUDu
         WttIQ7h9IOT4phh2+NdFHkPT24T0iCyR56fcySjOdVNwsivYXcfOVpMXk9S/yaHtiw9J
         8uItoKihZmqmXkm6Cbrk2oQfsYxVxmkk7dl8jzsI9KePvVBh3vUpkCG82JhSdsNr0qHy
         u2DKUzq/oBsTl9VFaDATPWbqsPae8l+sgJZsCeGlZ6tzoaefPAVav7kppQqzhHcYYxRT
         9E9ST4aKYMCFzP3/GE192j4VMIZ5TE2I4KZ2OqT62zmE3HU79Kl6hiox5oDzos9DkBJI
         3HoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701711213; x=1702316013;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sug326j4RkqoO9Ptow3nZ3kvcZ7Swug2lDF9621hV9A=;
        b=lDv+p248P3dmmgZ9f63HavjCQUJzpFuahWEQErHb2/d8Q1kFClFI2Qit/F9K1Umvto
         VFkzh9soaw62CoKaa0TuNwc5JrpISbg+G3yCsgUJIB6IFfXGtmtlYRRWQYgeVjgJZs2O
         WUhjx+voeTTdyJ45GUSGXNs73kuWjlD4wYYZWdwGIj56difBBCm7wEfL/3mEmV4+XVFF
         We6C3jgj9k0wviVb3SPbRVYBrIxEMCzwc4xqYEIBYW4POpF+6GyCQGdhLiGSxfoEgzAo
         v7v4LVWDVrSV5IvO9Qge2V//5gV4xA/LvbJj8/8zWljudh0Kh/XVDhzE57l7Z/lkMfHL
         bM6g==
X-Gm-Message-State: AOJu0YwMRrQOJup1qVkBpixEo38vDs56MKdxvsneLhuZcUxk4dAU0CvM
	2nrnFJkKs8owPGhbyQRXQBcX3A==
X-Google-Smtp-Source: AGHT+IEfufrDY6qwjOLalRVS7Y554Xwet3E/NEIZZ+pHinD5dFboEosniYAItYzJ7nNnf+ykmvOhMQ==
X-Received: by 2002:a05:600c:296:b0:40b:5e59:b7b0 with SMTP id 22-20020a05600c029600b0040b5e59b7b0mr2669578wmk.141.1701711212988;
        Mon, 04 Dec 2023 09:33:32 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:c831:1e47:2:5b96? ([2a05:6e02:1041:c10:c831:1e47:2:5b96])
        by smtp.googlemail.com with ESMTPSA id h9-20020a05600c314900b0040b3d8907fesm15826309wmo.29.2023.12.04.09.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 09:33:32 -0800 (PST)
Message-ID: <09b2fc2f-dde9-4f43-9704-d8053bfc85cf@linaro.org>
Date: Mon, 4 Dec 2023 18:33:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: timer: thead,c900-aclint-mtimer:
 separate mtime and mtimecmp regs
Content-Language: en-US
To: Inochi Amaoto <inochiama@outlook.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Chen Wang <unicorn_wang@outlook.com>
Cc: Anup Patel <anup@brainfault.org>,
 Samuel Holland <samuel.holland@sifive.com>, Guo Ren <guoren@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <IA1PR20MB4953C912FC58C0D248976564BB86A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49531ED1BCC00D6B265C2D10BB86A@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <IA1PR20MB49531ED1BCC00D6B265C2D10BB86A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_093335_570176_A0CE51F7 
X-CRM114-Status: GOOD (  14.14  )
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

T24gMDQvMTIvMjAyMyAxMDo1MSwgSW5vY2hpIEFtYW90byB3cm90ZToKPiBUaGUgdGltZXIgcmVn
aXN0ZXJzIG9mIGFjbGludCBkb24ndCBmb2xsb3cgdGhlIGNsaW50IGxheW91dCBhbmQgY2FuCj4g
YmUgbWFwcGVkIG9uIGFueSBkaWZmZXJlbnQgb2Zmc2V0LiBBcyBzZzIwNDIgdXNlcyBzZXBhcmF0
ZWQgdGltZXIKPiBhbmQgbXN3aSBmb3IgaXRzIGNsaW50LCBpdCBzaG91bGQgZm9sbG93IHRoZSBh
Y2xpbnQgc3BlYyBhbmQgaGF2ZQo+IHNlcGFyYXRlZCByZWdpc3RlcnMuCj4gCj4gVGhlIHByZXZp
b3VzIHBhdGNoIGludHJvZHVjZWQgYSBuZXcgdHlwZSBvZiBULUhFQUQgYWNsaW50IHRpbWVyIHdo
aWNoCj4gaGFzIGNsaW50IHRpbWVyIGxheW91dC4gQWx0aG91Z2ggaXQgaGFzIHRoZSBjbGludCB0
aW1lciBsYXlvdXQsIGl0Cj4gc2hvdWxkIGZvbGxvdyB0aGUgYWNsaW50IHNwZWMgYW5kIHVzZXMg
dGhlIHNlcGFyYXRlZCBtdGltZSBhbmQgbXRpbWVjbXAKPiByZWdzLiBTbyBhIEFCSSBjaGFuZ2Ug
aXMgbmVlZGVkIHRvIG1ha2UgdGhlIHRpbWVyIGZpdCB0aGUgYWNsaW50IHNwZWMuCj4gCj4gVG8g
bWFrZSBULUhFQUQgYWNsaW50IHRpbWVyIG1vcmUgY2xvc2VyIHRvIHRoZSBhY2xpbnQgc3BlYywg
dXNlCj4gcmVncy1uYW1lcyB0byByZXByZXNlbnQgdGhlIG10aW1lY21wIHJlZ2lzdGVyLCB3aGlj
aCBjYW4gYXZvaWQgaGFjawo+IGZvciB1bnN1cHBvcnQgbXRpbWUgcmVnaXN0ZXIgb2YgVC1IRUFE
IGFjbGludCB0aW1lci4KPiAKPiBBbHNvLCBhcyBULUhFQUQgYWNsaW50IG9ubHkgc3VwcG9ydHMg
bXRpbWVjbXAsIGl0IGlzIHVubmVjZXNzYXJ5IHRvCj4gaW1wbGVtZW50IHRoZSB3aG9sZSBhY2xp
bnQgc3BlYy4gVG8gbWFrZSB0aGlzIGJpbmRpbmcgVC1IRUFEIHNwZWNpZmljLAo+IG9ubHkgYWRk
IHJlZy1uYW1lIGZvciBleGlzdGVkIHJlZ2lzdGVyLiBGb3IgZGV0YWlscywgc2VlIHRoZSBkaXNj
dXNzaW9uCj4gaW4gdGhlIGxhc3QgbGluay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1h
b3RvIDxpbm9jaGlhbWFAb3V0bG9vay5jb20+Cj4gRml4ZXM6IDQ3MzQ0NDlmNzMxMSAoImR0LWJp
bmRpbmdzOiB0aW1lcjogQWRkIFNvcGhnbyBzZzIwNDIgQ0xJTlQgdGltZXIiKQo+IExpbms6IGh0
dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvb3BlbnNiaS8yMDIzLU9jdG9iZXIv
MDA1NjkzLmh0bWwKPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtYWNsaW50
L2Jsb2IvbWFpbi9yaXNjdi1hY2xpbnQuYWRvYwo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC9JQTFQUjIwTUI0OTUzRjlENzdGRkM3NkE5RDIzNjkyMkRCQkI2QUBJQTFQUjIwTUI0
OTUzLm5hbXByZDIwLnByb2Qub3V0bG9vay5jb20vCj4gLS0tCgpBcHBsaWVkIDEvMiwgdGhhbmtz
CgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJj
ZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNl
Ym9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEv
bGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+
IEJsb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
