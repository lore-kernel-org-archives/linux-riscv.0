Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A593CC4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 16:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2boYZVYaLD2sCWjFw1Ej9UaXfgpdQ65xo2KVJVKJ2HA=; b=bamE7FpHfp8On3
	3ji9MQANz0/H4qyr3f9LTQODXJbgLAHspzkuCzFSvSTK9QZxM059+zj35ufDxvz/r4AKfB6QohOT6
	s7Ntv+7EGdlY8y3ACkZgNKl5dbpBWvSUMu4pEGwakXQ113rY5FQyceDGej4XhSTsWrDcr+k1op34j
	eREqioMSPaiVOFyi6/Na7jIPelq0epTdp7pzbbuSYhNuQrhUdGIuMylUm1COEmo6+LLguYNDeI/hw
	C82Kcd+QHL3GSFb/GNkBNrzkHW2ZmV6Cu0ClonRF2yXCsgQ4W5oAgLxx0IQHQano9rYJruiO6zmoc
	xmDQh2ckWD4Cwdlt22wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAByX-005713-1g;
	Mon, 04 Dec 2023 16:39:17 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAByS-00570E-3B
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 16:39:16 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40859dee28cso46615625e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 08:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701707951; x=1702312751; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RceQfd2kwzQmuZ7IwlKyNuRvvDqLtfY8/yof+Ma1es8=;
        b=e7rEYZ1Uhkx1OFE8CBvT86htGgYSa5RtdI21dyGEjg82yjxKderQ4XS1iEIIygDtjw
         QbI1+WaBv41yLudGHfxfZAXAUfJgwT8BDj4RpiSltnZl6LDH7aX7qNy/K8J5xNBfTFTk
         qwre1dtglFlWw+gXeSvVBe1qEVtTgBfSHd2cKNnnNRd5rBxD1DqOWlKbW9CugkoDdH6Q
         XDCASLlGF6ud1IMewGAgVhiTTNPkKyTiSAsIfoXk5uu/LWxx5Q7Fn5FMweFeGFzhq8Au
         GQEEHiQ7vwUe/I2Po0htlHZS7AXmCCA4+Uj5rd4b4G05J7EWh2fVVOzgDPL6KzxIxp/R
         l+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701707951; x=1702312751;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RceQfd2kwzQmuZ7IwlKyNuRvvDqLtfY8/yof+Ma1es8=;
        b=KS36pxGxagZBLBI2odaLmfI6BFAXU1fYss9o89ctrAI4DuNfQKee3C09hsFTqE+AYK
         cP/3t0XVdLAngJwdTO23w1o1x463OIjck9xvc6MdkaMvk0DTMR6gtWwSomQh/ucm/FSV
         07Lwqomnm0vFJOA/yxwTz5dqbDTU55S7kKA7926LRzHSR9xVeMHaZFa1QeCVsIRK9hr0
         ExMTL3Fa4t8KrWHTpCyuGVskwmDTzXXZBZXpb6OlLP55H1eJN0RT8b9osSxpnAns3P5j
         WfCWRNyp75VQYrNEhm7CEtoboyW+Jhxb5GnXKM6MswDI/ZrEwb2xQF04v42MfcahBqVg
         gInA==
X-Gm-Message-State: AOJu0YzEqwCzZI7FuZlfgJkKyOhpJrvD780GW6/dJRjgpVXioqi4Ah5b
	s7KBVBZhhySRLXL4/AvTyq8Mzg==
X-Google-Smtp-Source: AGHT+IG282oOuIH/Ryb7/0jcCnlMBSY7MmUP8+OPoXqpPn6QejmrQmjmqt9zYHtLmgplLc7jUVzusg==
X-Received: by 2002:a05:600c:1552:b0:40b:5e22:963 with SMTP id f18-20020a05600c155200b0040b5e220963mr3467493wmg.82.1701707950682;
        Mon, 04 Dec 2023 08:39:10 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:c831:1e47:2:5b96? ([2a05:6e02:1041:c10:c831:1e47:2:5b96])
        by smtp.googlemail.com with ESMTPSA id bh6-20020a05600c3d0600b0040b54335d57sm10982089wmb.17.2023.12.04.08.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 08:39:10 -0800 (PST)
Message-ID: <a1374b10-c012-4a3f-b56a-29ef4ca7e5f0@linaro.org>
Date: Mon, 4 Dec 2023 17:39:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: timer: thead,c900-aclint-mtimer:
 separate mtime and mtimecmp regs
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@outlook.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Chen Wang <unicorn_wang@outlook.com>,
 Anup Patel <anup@brainfault.org>, Samuel Holland
 <samuel.holland@sifive.com>, Guo Ren <guoren@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <IA1PR20MB4953C912FC58C0D248976564BB86A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49531ED1BCC00D6B265C2D10BB86A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20231204-germproof-venue-6874ad902323@spud>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20231204-germproof-venue-6874ad902323@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_083913_042060_F1610264 
X-CRM114-Status: GOOD (  14.22  )
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

T24gMDQvMTIvMjAyMyAxNzoxOCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIE1vbiwgRGVjIDA0
LCAyMDIzIGF0IDA1OjUxOjA4UE0gKzA4MDAsIElub2NoaSBBbWFvdG8gd3JvdGU6Cj4+IFRoZSB0
aW1lciByZWdpc3RlcnMgb2YgYWNsaW50IGRvbid0IGZvbGxvdyB0aGUgY2xpbnQgbGF5b3V0IGFu
ZCBjYW4KPj4gYmUgbWFwcGVkIG9uIGFueSBkaWZmZXJlbnQgb2Zmc2V0LiBBcyBzZzIwNDIgdXNl
cyBzZXBhcmF0ZWQgdGltZXIKPj4gYW5kIG1zd2kgZm9yIGl0cyBjbGludCwgaXQgc2hvdWxkIGZv
bGxvdyB0aGUgYWNsaW50IHNwZWMgYW5kIGhhdmUKPj4gc2VwYXJhdGVkIHJlZ2lzdGVycy4KPj4K
Pj4gVGhlIHByZXZpb3VzIHBhdGNoIGludHJvZHVjZWQgYSBuZXcgdHlwZSBvZiBULUhFQUQgYWNs
aW50IHRpbWVyIHdoaWNoCj4+IGhhcyBjbGludCB0aW1lciBsYXlvdXQuIEFsdGhvdWdoIGl0IGhh
cyB0aGUgY2xpbnQgdGltZXIgbGF5b3V0LCBpdAo+PiBzaG91bGQgZm9sbG93IHRoZSBhY2xpbnQg
c3BlYyBhbmQgdXNlcyB0aGUgc2VwYXJhdGVkIG10aW1lIGFuZCBtdGltZWNtcAo+PiByZWdzLiBT
byBhIEFCSSBjaGFuZ2UgaXMgbmVlZGVkIHRvIG1ha2UgdGhlIHRpbWVyIGZpdCB0aGUgYWNsaW50
IHNwZWMuCj4+Cj4+IFRvIG1ha2UgVC1IRUFEIGFjbGludCB0aW1lciBtb3JlIGNsb3NlciB0byB0
aGUgYWNsaW50IHNwZWMsIHVzZQo+PiByZWdzLW5hbWVzIHRvIHJlcHJlc2VudCB0aGUgbXRpbWVj
bXAgcmVnaXN0ZXIsIHdoaWNoIGNhbiBhdm9pZCBoYWNrCj4+IGZvciB1bnN1cHBvcnQgbXRpbWUg
cmVnaXN0ZXIgb2YgVC1IRUFEIGFjbGludCB0aW1lci4KPj4KPj4gQWxzbywgYXMgVC1IRUFEIGFj
bGludCBvbmx5IHN1cHBvcnRzIG10aW1lY21wLCBpdCBpcyB1bm5lY2Vzc2FyeSB0bwo+PiBpbXBs
ZW1lbnQgdGhlIHdob2xlIGFjbGludCBzcGVjLiBUbyBtYWtlIHRoaXMgYmluZGluZyBULUhFQUQg
c3BlY2lmaWMsCj4+IG9ubHkgYWRkIHJlZy1uYW1lIGZvciBleGlzdGVkIHJlZ2lzdGVyLiBGb3Ig
ZGV0YWlscywgc2VlIHRoZSBkaXNjdXNzaW9uCj4+IGluIHRoZSBsYXN0IGxpbmsuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBvdXRsb29rLmNvbT4KPj4gRml4
ZXM6IDQ3MzQ0NDlmNzMxMSAoImR0LWJpbmRpbmdzOiB0aW1lcjogQWRkIFNvcGhnbyBzZzIwNDIg
Q0xJTlQgdGltZXIiKQo+PiBMaW5rOiBodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJt
YWlsL29wZW5zYmkvMjAyMy1PY3RvYmVyLzAwNTY5My5odG1sCj4+IExpbms6IGh0dHBzOi8vZ2l0
aHViLmNvbS9yaXNjdi9yaXNjdi1hY2xpbnQvYmxvYi9tYWluL3Jpc2N2LWFjbGludC5hZG9jCj4+
IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9JQTFQUjIwTUI0OTUzRjlENzdGRkM3
NkE5RDIzNjkyMkRCQkI2QUBJQTFQUjIwTUI0OTUzLm5hbXByZDIwLnByb2Qub3V0bG9vay5jb20v
Cj4gCj4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+
Cj4gCj4gQWx0aG91Z2gsIEkgZmlndXJlIGl0IGlzIGdvaW5nIHRvIGJlIG1lIHRoYXQgZW5kcyB1
cCB0YWtpbmcgaXQuCgpObywgSSBzaG91bGQgdGFrZSBpdAoKCi0tIAo8aHR0cDovL3d3dy5saW5h
cm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0Nz
CgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4g
RmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8Cjxo
dHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
