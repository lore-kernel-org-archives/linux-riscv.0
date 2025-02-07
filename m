Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E91BC0219B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 17:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7KAiPHe3DC53B0iW5Y+aP2/iDaboV0DtJWoYkRaYugw=; b=AFMghzPu4VSaJS
	fBt+k7YYHUD4Q1uUP8P6U3ph/cBg4cuBQ6DzqT2Vb0TXzF/bnSQFp7JDneI8Vo7+HF2E2uBSTNwsK
	wYCISvZvjocOpGFZs/9xWL6/LYjlXqQOiQPkouZwFzh14jOvEr6IgGmTomlyTNDohRWlxQgRLybFg
	D80QzEzbVpJ9NYyiFDfS7VyMQ3cy7S5hc3GLLy30MFMaoJaxhf8yCbzP8KSUaVsVV9kiYe9WWvLdr
	gGOfXS0ZJQ35TUIxERL4Bm7OTFYj+BtySG2z4jjtdj+cIvvoh7Ri+TUwDB+3RUPxbeXy+y/fvL9gQ
	avGqyzeD857VZrLjdFfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRpg-0000000AQZ7-2ltJ;
	Fri, 07 Feb 2025 17:08:00 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRTO-0000000ALGP-3kA0
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 16:44:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43622267b2eso22969955e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 08:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738946697; x=1739551497; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EZIYulAKvyE39mwEaJ29cg5h3kNH7aHvV9BF/VrZe24=;
        b=V0aCRSa3dA/m56zX7uocCyXBJJdqAR/G70aWqe8GD7ed9LRFbv7FizMOtul5PAXTtJ
         m/4sbPsOdyv867GeYxh0M0qihmTJfp8bgSm19qaYf3bCCTpKypJUdtBtYWjonT2Njj2F
         N9AfZjtBMSQzr0x27pRM2L69Lj5E6+vYnxS7j4EU+TTG05LmVNK9O1jgtXK3T1dNwQRL
         fuHj8BfLeXcZkNc7ZIejrBUwe6a2QKGIWlonDy70fh1XduZ5pNi7tfN+DXmDlfejmDNa
         l2oUCwiFQOuSoSxOU1z1WSYwJjy/pyDcaeVsoTpLynaac1/0y5P6acGansSX8FIpsMye
         XKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738946697; x=1739551497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EZIYulAKvyE39mwEaJ29cg5h3kNH7aHvV9BF/VrZe24=;
        b=bnFtTu1Y7pBRvzJ1wwtdVz2a++Owpxe7d4RvcukMJgL/Obw1QIp5oSW12It0EgWlCF
         xV14onJqeMDJJL6MagoO7AKrksztDu8EfsXrXTCZ0lr7Q4ETnilOY/x0ZyX21XoutWJv
         Z8UTOJYRVCzO+XRWlSatFSv2IgYoB5ZwLJTRVj6N1+L40tffkX9EYWwk+mNGYBDEBoyy
         EPcmr5Dzb/aaxfvRFfW3URk+MzzcU8gLQ/4cV08aziU/smvLJOVuodqz1T3pEh4olzRo
         7c9V2yHT9DUj6B3A2zowqqRD7MQV+VES9n4iE+ovRDNz7Vpa1B1VOVpJEW94czw5Y5rc
         1hvA==
X-Forwarded-Encrypted: i=1; AJvYcCV7Vb5V6XDHRXpmRK7BUxOj1JVxeYMSoQTKJpXs8sh2IMK+kIBVC+RI9NV1ZsG62HwyUKPfWXEY3MfFbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbE8AWMM5wdjZ8H7n2STLGh1ThCt7HI15sIqUNle+cv7UE6qJp
	rANvuEC0rJFaDcThWTWvPmkQP6otiC8Hn8TIYJe/ZYe5iXhYZ4grHMLvIwNE37A=
X-Gm-Gg: ASbGncte+p6MIQFFRIUvjVLgrj+TE4gc38t/SdXs4NAFqNAiXQQnyu5u+FexG2nMBLM
	k0Zn2xPhpdKrVspdQkrUXNgNDA4+9ydzUVasn+ST7esfxNqdUET2zGRh/SoTQoK9mrD1kvFc7C8
	8MXwzRsLBVlFo5whpAF/rLLjEaI8duOBuaH3TRbsJH6bF56KVzpAoGb1Qzdu5zXscf+o7+A2x+p
	jKTjQjgtOGINg+RNGJ/KXsxUGV0TBYc1TxH8JMmFI+qrdsxTk8mwZpBVgUfLyIgM/wYUPMAwkFW
	OdlmY9QHTUifEesN7H4pafOS/bx6YwRWruTv51gn89GGhlInqV84CWR6tTTn
X-Google-Smtp-Source: AGHT+IGQB1zu4BTh1IXtztuQ6/swkcvzjhEnqBbnVm3ESnobwl8EqdLDpJndofoHvNQtTE4qA8de7Q==
X-Received: by 2002:a05:600c:5026:b0:434:e9ee:c2d with SMTP id 5b1f17b1804b1-439249c6eeamr30934385e9.26.1738946696980;
        Fri, 07 Feb 2025 08:44:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dca004esm59185385e9.13.2025.02.07.08.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 08:44:56 -0800 (PST)
Message-ID: <b69b46a8-a37f-4d1b-94fc-0838c6ca24a9@rivosinc.com>
Date: Fri, 7 Feb 2025 17:44:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] riscv: Fix set up of cpu hotplug callbacks
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com,
 Anup Patel <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-16-ajones@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250207161939.46139-16-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_084458_928427_4E8F5971 
X-CRM114-Status: GOOD (  14.86  )
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

CgpPbiAwNy8wMi8yMDI1IDE3OjE5LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gQ1BVIGhvdHBsdWcg
Y2FsbGJhY2tzIHNob3VsZCBiZSBzZXQgdXAgZXZlbiBpZiB3ZSBkZXRlY3RlZCBhbGwKPiBjdXJy
ZW50IGNwdXMgZW11bGF0ZSBtaXNhbGlnbmVkIGFjY2Vzc2VzLCBzaW5jZSB3ZSB3YW50IHRvCj4g
ZW5zdXJlIG91ciBleHBlY3RhdGlvbnMgb2YgYWxsIGNwdXMgZW11bGF0aW5nIGlzIG1haW50YWlu
ZWQuCj4gCj4gRml4ZXM6IDZlNWNlN2YyZWFlMyAoInJpc2N2OiBEZWNvdXBsZSBlbXVsYXRlZCB1
bmFsaWduZWQgYWNjZXNzZXMgZnJvbSBhY2Nlc3Mgc3BlZWQiKQo+IEZpeGVzOiBlN2M5ZDY2ZTMx
M2IgKCJSSVNDLVY6IFJlcG9ydCB2ZWN0b3IgdW5hbGlnbmVkIGFjY2VzcyBzcGVlZCBod3Byb2Jl
IikKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29t
Pgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMgfCAy
NyArKysrKysrKysrKy0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25z
KCspLCAxNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
dW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2Fj
Y2Vzc19zcGVlZC5jCj4gaW5kZXggNzgwZjFjNWY1MTJhLi5jOWQzMjM3NjQ5YmIgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jCj4gKysrIGIv
YXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jCj4gQEAgLTI0NywxMyAr
MjQ3LDYgQEAgc3RhdGljIHZvaWQgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWRf
YWxsX2NwdXModm9pZCkKPiAgCS8qIENoZWNrIGNvcmUgMC4gKi8KPiAgCXNtcF9jYWxsX29uX2Nw
dSgwLCBjaGVja191bmFsaWduZWRfYWNjZXNzLCBidWZzWzBdLCB0cnVlKTsKPiAgCj4gLQkvKgo+
IC0JICogU2V0dXAgaG90cGx1ZyBjYWxsYmFja3MgZm9yIGFueSBuZXcgQ1BVcyB0aGF0IGNvbWUg
b25saW5lIG9yIGdvCj4gLQkgKiBvZmZsaW5lLgo+IC0JICovCj4gLQljcHVocF9zZXR1cF9zdGF0
ZV9ub2NhbGxzKENQVUhQX0FQX09OTElORV9EWU4sICJyaXNjdjpvbmxpbmUiLAo+IC0JCQkJICBy
aXNjdl9vbmxpbmVfY3B1LCByaXNjdl9vZmZsaW5lX2NwdSk7Cj4gLQo+ICBvdXQ6Cj4gIAlmb3Jf
ZWFjaF9jcHUoY3B1LCBjcHVfb25saW5lX21hc2spIHsKPiAgCQlpZiAoYnVmc1tjcHVdKQo+IEBA
IC0zODMsMTMgKzM3Niw2IEBAIHN0YXRpYyBpbnQgX19pbml0IHZlY19jaGVja191bmFsaWduZWRf
YWNjZXNzX3NwZWVkX2FsbF9jcHVzKHZvaWQgKnVudXNlZCBfX2Fsd2F5Cj4gIHsKPiAgCXNjaGVk
dWxlX29uX2VhY2hfY3B1KGNoZWNrX3ZlY3Rvcl91bmFsaWduZWRfYWNjZXNzKTsKPiAgCj4gLQkv
Kgo+IC0JICogU2V0dXAgaG90cGx1ZyBjYWxsYmFja3MgZm9yIGFueSBuZXcgQ1BVcyB0aGF0IGNv
bWUgb25saW5lIG9yIGdvCj4gLQkgKiBvZmZsaW5lLgo+IC0JICovCj4gLQljcHVocF9zZXR1cF9z
dGF0ZV9ub2NhbGxzKENQVUhQX0FQX09OTElORV9EWU4sICJyaXNjdjpvbmxpbmUiLAo+IC0JCQkJ
ICByaXNjdl9vbmxpbmVfY3B1X3ZlYywgTlVMTCk7Cj4gLQo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAg
I2Vsc2UgLyogQ09ORklHX1JJU0NWX1BST0JFX1ZFQ1RPUl9VTkFMSUdORURfQUNDRVNTICovCj4g
QEAgLTQxNSw2ICs0MDEsMTkgQEAgc3RhdGljIGludCBfX2luaXQgY2hlY2tfdW5hbGlnbmVkX2Fj
Y2Vzc19hbGxfY3B1cyh2b2lkKQo+ICAJCQkgICAgTlVMTCwgInZlY19jaGVja191bmFsaWduZWRf
YWNjZXNzX3NwZWVkX2FsbF9jcHVzIik7Cj4gIAl9Cj4gIAo+ICsJLyoKPiArCSAqIFNldHVwIGhv
dHBsdWcgY2FsbGJhY2tzIGZvciBhbnkgbmV3IENQVXMgdGhhdCBjb21lIG9ubGluZSBvciBnbwo+
ICsJICogb2ZmbGluZS4KPiArCSAqLwo+ICsjaWZkZWYgQ09ORklHX1JJU0NWX1BST0JFX1VOQUxJ
R05FRF9BQ0NFU1MKPiArCWNwdWhwX3NldHVwX3N0YXRlX25vY2FsbHMoQ1BVSFBfQVBfT05MSU5F
X0RZTiwgInJpc2N2Om9ubGluZSIsCj4gKwkJCQkgIHJpc2N2X29ubGluZV9jcHUsIHJpc2N2X29m
ZmxpbmVfY3B1KTsKPiArI2VuZGlmCj4gKyNpZmRlZiBDT05GSUdfUklTQ1ZfUFJPQkVfVkVDVE9S
X1VOQUxJR05FRF9BQ0NFU1MKPiArCWNwdWhwX3NldHVwX3N0YXRlX25vY2FsbHMoQ1BVSFBfQVBf
T05MSU5FX0RZTiwgInJpc2N2Om9ubGluZSIsCj4gKwkJCQkgIHJpc2N2X29ubGluZV9jcHVfdmVj
LCBOVUxMKTsKPiArI2VuZGlmCj4gKwo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCgpIaSBBbmRyZXcs
CgpSZXZpZXdlZC1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKVGhh
bmtzLAoKQ2zDqW1lbnQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
