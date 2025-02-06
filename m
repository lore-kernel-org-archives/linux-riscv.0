Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CB7C02196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 09:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vDEnuLurkU5OlvHkWOjrkT1Dz/rPh45OWfhSopfvIU=; b=AdpsyKXpPoKaiC
	iCsuDkeoHye8n9iXZ2NmAaCqA2MSgc2soZ2FryzwYw68YNv/ZY/zX96a2GHvFHvUJ5gwKeQ2Kz0uJ
	oYWMLQK5DSJihbgMtaDlPLo/vc7PdnWpCn6oV+ZBvsfK7kI6CkNe5cdcRG0X7cH/3A5WRK+Xoxatw
	pDNyWynmfyBc0ZlspoVFxonXVdmDwTCX/ujOihDmRE1cQiCDhD6al5QWS7OgnZRKk6SvyJa7Jy/Hh
	oCkYD8ucu9HXbtRb85GrCWjj0bVxesgyB3WE1TqHMuj3REHgdOcTjXqSbuSxvNWJz0KYyR3AqGcU7
	mbTJ5cjiEo3SC59CAJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfy2H-00000005oJj-2kfK;
	Thu, 06 Feb 2025 09:19:01 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfy1u-00000005oG5-1kGw
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 09:18:39 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53f22fd6832so779613e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Feb 2025 01:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738833516; x=1739438316; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HS761DbCjOKI8zOzLwqrjohmsBGy+dI8TpEkjZmlUBg=;
        b=E/DwfhqJUkQlC1xZE93yCxZ3jW3F36si8gGnFtbqfM4/0w4XcyHxsRXCobZXjhaaAt
         1SDnL/sAAX3Hm3ttVNXFOXZvFo5RvmUuNG0r3MAiZ9/cmZwwigg402jazjtX65W6zuYx
         eMH42IMhFtrSmsDLQqzIeqLK7+cZ8pv2bsB7JARrbC2MucP3bdBkL7BccAj2LHgWalfS
         2vQXJKilnASQ3v8cDaqEuB+cMn4sVUsMql65Z59kDT0CIhuzQT1ftc3cF0wCzlvE/Vhm
         7WQwhz+KV1cSSddQzbtcD4XrAR4nWoFdMgve7dpJ66QQT52Z/3coKki7NEiRmR2o6gbh
         bGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738833516; x=1739438316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HS761DbCjOKI8zOzLwqrjohmsBGy+dI8TpEkjZmlUBg=;
        b=vwgbXmw/MOe+S6QlSHDreaeQI7mNC73n1vCOiPvuEg3GBW1n7+vPBOZ11sRLksS6zu
         l6nDzYPSpTb1RT0mTCgqW1DfU1cMyS9VsSrHi4VsYqgOs9zOW2rn/kxuaq4LJu1idvgL
         ie21dfm2HUEK+A5uX3/fYKHfOoOXMrwkO5EnvzW+UC8WshoYYwRzrjnpbGjtz0RoHK6O
         LxWJiWowqp6xhSCQHEtyRWPDNtgm301IOesOdMaX6JiMTMl+J0AUzaFRnjISENHgBCVT
         mr+xSt3jc1h9YKiOkiIbKoiOPLy+p/AxJ6rNgAtJ/nCCzPvTdnzKULyeilF0bpLvgbaO
         mL2g==
X-Forwarded-Encrypted: i=1; AJvYcCWsTXgvhX5oaIJRXybH71d1kJz0sgFh6UZiv9CTccl4DihDxoemcNAbaiG8wtfbrXnMqKMOVmtarSL6pQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwN4krXLkf9Z/0Zsyns/lcHLauQLvOTdgdvcEpjMSARLN7pnVVK
	JXRP9ZKQ12wWHDzHh70y8ikRkyJJZY6GrONSQL1OwEQGe0/d4IYc+1TdN/owPx9f8/uX25YRxEJ
	j9bE3JyFunz7pmDk3GJBWph3BruQvg1HnJuxGPg==
X-Gm-Gg: ASbGnctZJmNctzlytOgwltOZsx3Wb6Kah5iF3YiZ/q8LU/pWVHCVqMEXzkSh1OB13kO
	Js4SyBMctPVrcwyrAKva9+OrPsZ2Zb9pq17Gg6W5kUcx9GS1ElQpiwl35RoLtydKpcOfG+5A=
X-Google-Smtp-Source: AGHT+IEv8dg+a0kP8xIC60NBrACIVsxMj8GMoXfszN3ovDIZ2UwypMSGbO57fvFIDLEN+5kpMkaUESCBViyIWEI972w=
X-Received: by 2002:a05:6512:31c1:b0:540:1fd9:b634 with SMTP id
 2adb3069b0e04-54405a4245dmr2401575e87.34.1738833516532; Thu, 06 Feb 2025
 01:18:36 -0800 (PST)
MIME-Version: 1.0
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org> <Z5FPJLzAEVXGWJnE@chonkvm.lixom.net>
 <20250123113042-GYA38135@gentoo> <Z5LOdh-4UxRtteOy@chonkvm.lixom.net>
 <20250127181726.GA538260-robh@kernel.org> <20250128031712-GYB47737@gentoo> <CACRpkdYbSOHD9UH5=+qjztxS3Cq_rxaoOT9tFtD8ZWm9zQGnPw@mail.gmail.com>
In-Reply-To: <CACRpkdYbSOHD9UH5=+qjztxS3Cq_rxaoOT9tFtD8ZWm9zQGnPw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 10:18:25 +0100
X-Gm-Features: AWEUYZmhuWaqVp2p5Akrm0LPyHUBdTfoHVJqdr20LL5qcm6uyZRtLyGHjoX2YmM
Message-ID: <CACRpkdZa887vx4Lmxk1U_8w5n7AxMnyzGexeYzhsxNGT-DTYcQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_011838_456827_C71B50B5 
X-CRM114-Status: GOOD (  17.56  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Olof Johansson <olof@lixom.net>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgWWl4dW4sCgpPbiBUdWUsIEphbiAyOCwgMjAyNSBhdCA1OjAz4oCvUE0gTGludXMgV2FsbGVp
aiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiB3cm90ZToKPiBPbiBUdWUsIEphbiAyOCwgMjAy
NSBhdCA0OjE34oCvQU0gWWl4dW4gTGFuIDxkbGFuQGdlbnRvby5vcmc+IHdyb3RlOgo+Cj4gPiBb
Um9iXQo+ID4gPiBJZiBMaW51eCBjYW4ndCBoYW5kbGUgMSBub2RlIGZvciBOIGdwaW9fY2hpcCdz
LCB0aGVuIHRoYXQncyBhIExpbnV4Cj4gPiA+IHByb2JsZW0uIE1heWJlIGl0IGNhbiwgSURLLgo+
ID4KPiA+IEkgaGF2ZW4ndCBzZWVuIHNvbXRoaW5nIGxpa2UgdGhpcyB0byByZWdpc3RlciAxIG5v
ZGUgZm9yIG11bHRpIGdwaW9fY2hpcHMuLgo+ID4gVG8gZ3Bpby9waW5jdHJsIG1haW50YWluZXIg
KExpbnVzIFdhbGxlaWopLCBkbyB5b3UgaGF2ZSBzdWdnZXN0aW9uIG9uIHRoaXM/Cj4KPiBGb3Ig
TGludXggd2UgY2FuIGNhbGwgYmdwaW9faW5pdCgpIHRocmVlIHRpbWVzIGFuZAo+IGRldm1fZ3Bp
b2NoaXBfYWRkX2RhdGEoKSB0aHJlZSB0aW1lcyBvbiB0aGUgcmVzdWx0IGFuZCBpZiB3ZSB1c2Ug
dGhlCj4gYXBwcm9hY2ggd2l0aCB0aHJlZSBjZWxscyAod2hlcmUgdGhlIHNlY29uZCBpcyBpbnN0
YW5jZSAwLDEsMiBhbmQgdGhlCj4gbGFzdCBvbmUgdGhlIG9mZnNldCAwLi4zMSkgdGhlbiBpdCB3
aWxsIHdvcmsgYWxsIGp1c3QgdGhlIHNhbWUgSSBndWVzcz8KPgo+IGZvby1ncGlvcyA8JmdwaW8g
MiA3IEdQSU9fQUNUSVZFX0xPVz47Cj4KPiBmb3Igb2Zmc2V0IDcgb24gYmxvY2sgMiBmb3IgZXhh
bXBsZS4KPgo+IFdlIG5lZWQgYSBjdXN0b20geGxhdGUgZnVuY3Rpb24gSSBzdXBwb3NlLgo+Cj4g
SXQganVzdCBoYXMgbm90IGJlZW4gZG9uZSB0aGF0IHdheSBiZWZvcmUsIGV2ZXJ5Ym9keSBqdXN0
IGRpZAo+IDItY2VsbCBHUElPcy4KCmRvZXMgdGhpcyBhcHByb2FjaCB3b3JrIGZvciB5b3U/IEkg
dGhpbmsgaXQncyB0aGUgbW9zdCBkaXBsb21hdGljLgoKSSdtIHNvcnJ5IGFib3V0IHRoZSBob3Bl
bGVzcyBiYWNrLWFuZC1mb3J0aCB3aXRoIHRoZSBiaW5kaW5ncywgYWxzbwpmb3IgY29udHJpYnV0
aW5nIHRvIHRoZSBtZXNzeSBkZWJhdGUuIEkgZG8gd2FudCBkZXZlbG9wZXJzIHRvIGZlZWwKZW5j
b3VyYWdlZCB0byBjb250cmlidXRlIGFuZCBub3QgZ2V0IHN0dWNrIGluIHRvbyBsb25nIGRlYmF0
ZXMuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
