Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCDACD1280
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 15:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DF06KHCknfqZKVIDXK2o/aPSZUWWa4wpSm22mVAEKwg=; b=0taVsUO17ox/6z
	mGQ9LHxxBfWLeuK+BmoTPquyS3JtJ64VSB5fSTdSfOHRayOEVTnAGr8tgyw+PNX3H4FfuUfGyWcV0
	tYYSQWhMsRxjFp7q4Y+8NKFAMuHK3JKKN+Rcz7NhZiWthmD/2ERFty4UcNKK3qGZmB44B/BIjIPz0
	ej7Ge3xuBpjaw7D6DuhrT1YNW/bYIkwZq62aQ5c0Q6DnOfqao6DqZwnKa5bh4qMewrjUeE+v3fmuX
	ZOAoynexGVgb463Zxquvuyp+49UygqHiE5jc1KYAw0z9Mo72iMAYr7Dn0eMZwM9jhYmki6MUkg6vM
	l0D9irRSQMVqmK+69FWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUw9-00000009hrL-45KV;
	Wed, 27 Mar 2024 15:11:33 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUw7-00000009hpH-0SB9
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 15:11:32 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3688effa61bso11729795ab.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 08:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711552289; x=1712157089; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=enmbwQt8iez2R++PImRAw04TnXUHxgzDT/qGPQRyPOw=;
        b=f7CLoDJ5abuJdCQB8NhApJP67ECxdcLF7WgSqBQIx/LN0NZeIvCE/loU2TacRjXcab
         lf2++LmRmckDqYbKJCpstP4Po3xIPFv7NcGc3l47j9zI2/4X6BwjAxw1MZS2UvQi7HAU
         7LEJHTS4WZRa9QrI+VZF4YlcXULBS+gWdG4nePH3xdkJlX6xLIrN7AG0TOOpyfc4s1y2
         zTtXJl/XfTLAOfgm8Ayv3MwsVtwOxQJOiQXr1wZTIC37vlhGqz01N9/Ju5pOjeLst/9J
         0wEyaYIiEiq7HI4UKKsBWFY92l90XcMEcL/07VPFZjqxWbWhOIDDE/XQPhwGe5QEU6Cp
         R8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711552289; x=1712157089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=enmbwQt8iez2R++PImRAw04TnXUHxgzDT/qGPQRyPOw=;
        b=M6G3QngoC19/aLeKWpBz3mw8Rw3b5G7Lwe3NArzVPCotBQ02rjy24qD18PrzJgoWJM
         p3b36D6KFaqDodidrgPfqOmxzId0DzmrRRkOrmo9YtPDY1om7ETkA9Api8eBKK59s+XJ
         C7Nvi3qq+kwn8uo3OA3b3I+7i0KVrvDwfUJLEqp4POzYDC2xnJQYztzaUso9AE2566Hz
         gZWNW3fr0mDutO6z9L9DJlJGMihhfXkopvan10uqc0dX19+u7GPMQv6XupbVDaAiazuv
         Hntpsnb8q9FvdhtFM34pa9rE9KbFhC/em9CZqZ4WCo+rmQgy9mW+sA5RHiJQS4MG4gDJ
         Ywlw==
X-Gm-Message-State: AOJu0Yw10bUomEGIehSm7s3EOsBPYZqDynetXegyuFx78R8SVjhTTAef
	+ig2CdZ2xNgFlOMJ9yBqGLShJ2e2B2TMiwHsgCH/TZthEjJijPMxR0hhWuA1gLQ=
X-Google-Smtp-Source: AGHT+IGN0kOBk5+Qq+4kRQhtbh2sJKJZj4esj2LAa5z3oPar2gagxLrLEqUx6m32iS0LEAqiUOOuhw==
X-Received: by 2002:a05:6e02:ec1:b0:368:a898:c824 with SMTP id i1-20020a056e020ec100b00368a898c824mr276546ilk.1.1711552289093;
        Wed, 27 Mar 2024 08:11:29 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.190])
        by smtp.gmail.com with ESMTPSA id y9-20020a92c989000000b0036898bfb975sm1420171iln.0.2024.03.27.08.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 08:11:28 -0700 (PDT)
Message-ID: <8bff47cf-659e-4344-b235-72b17ed0f37a@sifive.com>
Date: Wed, 27 Mar 2024 10:11:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] riscv: Simplify text patching loops
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240212025529.1971876-1-samuel.holland@sifive.com>
 <20240212025529.1971876-5-samuel.holland@sifive.com>
 <874je4fvxl.fsf@all.your.base.are.belong.to.us>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <874je4fvxl.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_081131_172752_46E85430 
X-CRM114-Status: GOOD (  15.12  )
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

SGkgQmrDtnJuLAoKT24gMjAyNC0wMi0xOSA3OjAzIEFNLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+
IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cml0ZXM6Cj4gCj4+
IFRoaXMgcmVkdWNlcyB0aGUgbnVtYmVyIG9mIHZhcmlhYmxlcyBhbmQgbWFrZXMgdGhlIGNvZGUg
ZWFzaWVyIHRvIHBhcnNlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2Ft
dWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPj4gLS0tCj4+Cj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9w
YXRjaC5jIHwgMjEgKysrKysrKysrKystLS0tLS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMTEg
aW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC9wYXRjaC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwo+PiBpbmRleCBi
Y2NkOWVkMDRhMDUuLjdmMDMwYjQ2ZWFlNSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvcGF0Y2guYwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jCj4+IEBAIC0xNTUs
NyArMTU1LDYgQEAgTk9LUFJPQkVfU1lNQk9MKF9fcGF0Y2hfaW5zbl93cml0ZSk7Cj4+ICAKPj4g
IHN0YXRpYyBpbnQgcGF0Y2hfaW5zbl9zZXQodm9pZCAqYWRkciwgdTggYywgc2l6ZV90IGxlbikK
Pj4gIHsKPj4gLQlzaXplX3QgcGF0Y2hlZCA9IDA7Cj4+ICAJc2l6ZV90IHNpemU7Cj4+ICAJaW50
IHJldCA9IDA7Cj4+ICAKPj4gQEAgLTE2MywxMSArMTYyLDEyIEBAIHN0YXRpYyBpbnQgcGF0Y2hf
aW5zbl9zZXQodm9pZCAqYWRkciwgdTggYywgc2l6ZV90IGxlbikKPj4gIAkgKiBfX3BhdGNoX2lu
c25fc2V0KCkgY2FuIG9ubHkgd29yayBvbiAyIHBhZ2VzIGF0IGEgdGltZSBzbyBjYWxsIGl0IGlu
IGEKPj4gIAkgKiBsb29wIHdpdGggbGVuIDw9IDIgKiBQQUdFX1NJWkUuCj4+ICAJICovCj4+IC0J
d2hpbGUgKHBhdGNoZWQgPCBsZW4gJiYgIXJldCkgewo+PiAtCQlzaXplID0gbWluX3Qoc2l6ZV90
LCBQQUdFX1NJWkUgKiAyIC0gb2Zmc2V0X2luX3BhZ2UoYWRkciArIHBhdGNoZWQpLCBsZW4gLSBw
YXRjaGVkKTsKPj4gLQkJcmV0ID0gX19wYXRjaF9pbnNuX3NldChhZGRyICsgcGF0Y2hlZCwgYywg
c2l6ZSk7Cj4+ICsJd2hpbGUgKGxlbiAmJiAhcmV0KSB7Cj4+ICsJCXNpemUgPSBtaW5fdChzaXpl
X3QsIFBBR0VfU0laRSAqIDIgLSBvZmZzZXRfaW5fcGFnZShhZGRyKSwgbGVuKTsKPj4gKwkJcmV0
ID0gX19wYXRjaF9pbnNuX3NldChhZGRyLCBjLCBzaXplKTsKPiAKPiBXaGlsZSB5b3UncmUgYXQg
aXQsIGRvOgo+ICAgcmV0ID0gX19wYXRjaF9pbnNuX3NldChhZGRyLCBjLCBzaXplKTsKPiAgIGlm
IChyZXQpCj4gICAgICAgICAgIHJldHVybiByZXQ7Cj4gICAuLi4KPiByZXR1cm4gMDsKPiB9Cj4g
Cj4gYW5kIHNpbXBsaWZ5IHRoZSB3aGlsZS1sb29wIHByZWRpY2F0ZT8KClllcywgdGhpcyBsb29r
cyBiZXR0ZXIgYW5kIHJlZHVjZXMgdGhlIGNvZGUgc2l6ZSBhcyB3ZWxsLiBJJ2xsIG1ha2UgdGhp
cyBjaGFuZ2UKaW4gdjIuCgpSZWdhcmRzLApTYW11ZWwKCj4+ICAKPj4gLQkJcGF0Y2hlZCArPSBz
aXplOwo+PiArCQlhZGRyICs9IHNpemU7Cj4+ICsJCWxlbiAtPSBzaXplOwo+PiAgCX0KPj4gIAo+
PiAgCXJldHVybiByZXQ7Cj4+IEBAIC0xOTAsNyArMTkwLDYgQEAgTk9LUFJPQkVfU1lNQk9MKHBh
dGNoX3RleHRfc2V0X25vc3luYyk7Cj4+ICAKPj4gIGludCBwYXRjaF9pbnNuX3dyaXRlKHZvaWQg
KmFkZHIsIGNvbnN0IHZvaWQgKmluc24sIHNpemVfdCBsZW4pCj4+ICB7Cj4+IC0Jc2l6ZV90IHBh
dGNoZWQgPSAwOwo+PiAgCXNpemVfdCBzaXplOwo+PiAgCWludCByZXQgPSAwOwo+PiAgCj4+IEBA
IC0xOTgsMTEgKzE5NywxMyBAQCBpbnQgcGF0Y2hfaW5zbl93cml0ZSh2b2lkICphZGRyLCBjb25z
dCB2b2lkICppbnNuLCBzaXplX3QgbGVuKQo+PiAgCSAqIENvcHkgdGhlIGluc3RydWN0aW9ucyB0
byB0aGUgZGVzdGluYXRpb24gYWRkcmVzcywgdHdvIHBhZ2VzIGF0IGEgdGltZQo+PiAgCSAqIGJl
Y2F1c2UgX19wYXRjaF9pbnNuX3dyaXRlKCkgY2FuIG9ubHkgaGFuZGxlIGxlbiA8PSAyICogUEFH
RV9TSVpFLgo+PiAgCSAqLwo+PiAtCXdoaWxlIChwYXRjaGVkIDwgbGVuICYmICFyZXQpIHsKPj4g
LQkJc2l6ZSA9IG1pbl90KHNpemVfdCwgUEFHRV9TSVpFICogMiAtIG9mZnNldF9pbl9wYWdlKGFk
ZHIgKyBwYXRjaGVkKSwgbGVuIC0gcGF0Y2hlZCk7Cj4+IC0JCXJldCA9IF9fcGF0Y2hfaW5zbl93
cml0ZShhZGRyICsgcGF0Y2hlZCwgaW5zbiArIHBhdGNoZWQsIHNpemUpOwo+PiArCXdoaWxlIChs
ZW4gJiYgIXJldCkgewo+PiArCQlzaXplID0gbWluX3Qoc2l6ZV90LCBQQUdFX1NJWkUgKiAyIC0g
b2Zmc2V0X2luX3BhZ2UoYWRkciksIGxlbik7Cj4+ICsJCXJldCA9IF9fcGF0Y2hfaW5zbl93cml0
ZShhZGRyLCBpbnNuLCBzaXplKTsKPiAKPiBTYW1lIGNvbW1lbnQgYXMgYWJvdmUuCj4gCj4gCj4g
QmrDtnJuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
