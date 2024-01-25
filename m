Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203E2C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 17:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2JiMUaDajqmwnbQVBxJ5PdPBFkVZ5HtG79kZKizSBpQ=; b=DlZy6byRFaDMV4
	2pC0d7iLlZR1PgZRmMcV1QJ8yxcNtGZFDE9TvwbStfuVXV9TvARuUviLyzLoO0MApS24x4zK0+p6E
	Zmy8opRT1bE5lmdKplgkNf1YDUE1uWx3OCfw4C4b8z8x8CWs/B/vjWU3vUXAr7P/vhYWJAC+dRKuM
	RcBN0lwUBTZoCMp9GNh5VbfOBHBYd/T2mAlHRpH+l8DntAr2nOdj/sccpJhOiFEWaiKlJUNDSk9ks
	GZQ/H+FuulCJrEtb7k726fyni6WiH8Tjlw7fgkTHaHMWXQiQb3FW+aYe6sFQwlt2jUNjqeCLZTSzB
	UYfg6srS3OZnv+rM0eKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT35e-00000001193-013M;
	Thu, 25 Jan 2024 17:00:34 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT35b-00000001148-09V9
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 17:00:32 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2cddb2c2b54so71504491fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jan 2024 09:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706202026; x=1706806826; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqouqsPzOwdJ26Qu00uuxhf3ud38wTMCNuEwNKCWK0A=;
        b=RUFYoO+Um9H5fnVFusuVVo84jEo86iDOOcyFyYTncFxaklR8CyK2fop+AgF/JcItCb
         Zw+15ta/Dcze26zGbJZTNkyaVoZ2/0Qv5+TFn7+ZYW/an5ccUvosC1GQIv/817ZT+TeB
         qOmYteQIxfoV8Op4ay1d4o8N4ghWDFtW9QQ4fotrTCA3jx+M65A+pPOKCkzdf790A5A/
         gwEz5bggys+nWKuzdI0q9J6KYa3HAip+LlOOD50A7Hf2HIEZjcR7YLx6ULHp/80Sb3Gr
         zmB+HUQucdBLz18kP20XLNSpILo9FxzWUFMvZ+Zfg125iuIWLCP1wW41rQBriyZLy7yq
         gKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706202026; x=1706806826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqouqsPzOwdJ26Qu00uuxhf3ud38wTMCNuEwNKCWK0A=;
        b=BqJ8FvJuEZbuQmxsOkq+GkXkBEu+maCrs0dTrHtDyvFsd1GBOqwsCjJI/QUs+wkbSQ
         4mun/p+ZyCiXiFJ0A0S0/QLxLtFM1flsoFiczBA8SWyYz86JhDbzozJeAj9AcPqPLxXl
         wxbG2gFEPxm80LQQEHUwAQwMo4eUq7uekmuzXHfVycg0X5LjdK1rrKsyiKJl/5V2mLcf
         Tk1/A5owbOnI78TdKJ5B0Zy16XCDh6FAFtDrpiPwkTp3VodTb6VYPq7mHQ0QRrLzYfRe
         Rh+yN6nrzgGm7UfOfI1hyi9KQnkceIrh9ordSgNLkLKwWMIvOuj1FNiv6x1SfIeLRoUu
         svJQ==
X-Gm-Message-State: AOJu0YzY4BlEs7B1FHM4FBPR6LzQ4x/0wfp/5BodrDeP2XETTO3rhwdu
	NHKaOLuK+QprarlGkx9VMYLn52zXO4ZqNGLUCe5L5Blr6RZfLeMDh7ki7UPd37aVY7DMy8ps+mG
	MdWhqDYapdoKWuttxB//nrhSeEQFEoAgCLieeyQ==
X-Google-Smtp-Source: AGHT+IHtpe9kK7qdjl9E5I4YRV61CKQ33C8xXigBPo5I26kSLhgh+jCa5+EyIWftdVIkuYTurXgpBMAeND+pfSQOMMo=
X-Received: by 2002:a2e:8887:0:b0:2cf:2fb0:978 with SMTP id
 k7-20020a2e8887000000b002cf2fb00978mr1048122lji.45.1706202025578; Thu, 25 Jan
 2024 09:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20240125165416.1987576-1-leyfoon.tan@starfivetech.com>
In-Reply-To: <20240125165416.1987576-1-leyfoon.tan@starfivetech.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 25 Jan 2024 22:30:13 +0530
Message-ID: <CAK9=C2VKiSBX4349jRL0m+XAtT27KSW3GGH+xhaM4ZQoEsAgzg@mail.gmail.com>
Subject: Re: [PATCH] clocksource: timer-riscv: Clear timer interrupt on timer initialization
To: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, atishp@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ley Foon Tan <lftan.linux@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_090031_135574_388AD17E 
X-CRM114-Status: GOOD (  15.64  )
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

T24gVGh1LCBKYW4gMjUsIDIwMjQgYXQgMTA6MjXigK9QTSBMZXkgRm9vbiBUYW4KPGxleWZvb24u
dGFuQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+Cj4gSW4gdGhlIFJJU0MtViBzcGVjaWZpY2F0
aW9uLCB0aGUgc3RpbWVjbXAgcmVnaXN0ZXIgZG9lc24ndCBoYXZlIGEgZGVmYXVsdAo+IHZhbHVl
LiBUbyBwcmV2ZW50IHRoZSB0aW1lciBpbnRlcnJ1cHQgZnJvbSBiZWluZyB0cmlnZ2VyZWQgZHVy
aW5nIHRpbWVyCj4gaW5pdGlhbGl6YXRpb24sIGNsZWFyIHRoZSB0aW1lciBpbnRlcnJ1cHQgYnkg
d3JpdGluZyBzdGltZWNtcCB3aXRoIGEKPiBtYXhpbXVtIHZhbHVlLgo+Cj4gU2lnbmVkLW9mZi1i
eTogTGV5IEZvb24gVGFuIDxsZXlmb29uLnRhbkBzdGFyZml2ZXRlY2guY29tPgo+IC0tLQo+ICBk
cml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbG9ja3NvdXJjZS90
aW1lci1yaXNjdi5jIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jCj4gaW5kZXgg
ZTY2ZGNiZDY2NTY2Li5hNzVhNzQ2NDczNDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbG9ja3Nv
dXJjZS90aW1lci1yaXNjdi5jCj4gKysrIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNj
di5jCj4gQEAgLTE3Miw2ICsxNzIsOSBAQCBzdGF0aWMgaW50IF9faW5pdCByaXNjdl90aW1lcl9p
bml0X2NvbW1vbih2b2lkKQo+Cj4gICAgICAgICBzY2hlZF9jbG9ja19yZWdpc3RlcihyaXNjdl9z
Y2hlZF9jbG9jaywgNjQsIHJpc2N2X3RpbWViYXNlKTsKPgo+ICsgICAgICAgLyogQ2xlYXIgdGlt
ZXIgaW50ZXJydXB0ICovCj4gKyAgICAgICByaXNjdl9jbG9ja19ldmVudF9zdG9wKCk7Cj4gKwoK
VGhlIHJpc2N2X3RpbWVyX2luaXRfY29tbW9uKCkgaXMgY2FsbGVkIG9ubHkgb24gYm9vdCBIQVJU
LgoKSSBzdWdnZXN0IGRvaW5nIHJpc2N2X2Nsb2NrX2V2ZW50X3N0b3AoKSBpbiByaXNjdl90aW1l
cl9zdGFydGluZ19jcHUoKQpqdXN0IGJlZm9yZSBlbmFibGVfcGVyY3B1X2lycSgpLgoKSSBhbHNv
IHN1Z2dlc3QgYWRkaW5nIGFuIGFwcHJvcHJpYXRlIEZpeGVzIHRhZyBpbiB0aGUgY29tbWl0IGRl
c2NyaXB0aW9uLgoKUmVnYXJkcywKQW51cAoKPiAgICAgICAgIGVycm9yID0gcmVxdWVzdF9wZXJj
cHVfaXJxKHJpc2N2X2Nsb2NrX2V2ZW50X2lycSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByaXNjdl90aW1lcl9pbnRlcnJ1cHQsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgInJpc2N2LXRpbWVyIiwgJnJpc2N2X2Nsb2NrX2V2ZW50KTsKPiAtLQo+
IDIuNDMuMAo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
