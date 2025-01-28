Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F02C02190
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 16:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wQOYEHk1v4GlrZtr6MNVJc/uVPy9pK7eyDwGwmZdHgw=; b=cwW+19lktGu3jO
	GB2jYyS+uostKNNDmpofkNMcHsTUOjCF9urV0L6DEnJ/lahvzCXn8ER7V/AdxYOLVzvALyBUMVfX/
	S6b5mplvuvtyzoB2RnFGYqs7INfLDfH4Dq2bTVgEtslz6QAPAUGkTitA5u+BexCYoLOn899CmIN6Q
	ddVDs4LbkxpO+Wi3peuSeqErdFOaZBqs+toN4Y+wMON2iVKO7VRe/mL8dzaKAvaVOETWRpCirY6LR
	HZwaLkI5dok8/NiDjwaKTYahoY7EZz/x2Rfy3ousjrkTnFrLoQp4QWXdAaYChDDW6aNkjunXpxyI6
	xt44oXdTfESglxMDoCIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoQ0-00000005JbW-2qlm;
	Tue, 28 Jan 2025 16:26:28 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tco3s-00000005G0V-2BBX
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 16:03:37 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54021daa6cbso6198243e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jan 2025 08:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738080215; x=1738685015; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+t8hjKCoqo6TQnZ8M8jStHab2qUU8bkeSurEQ6U78Ck=;
        b=d9b9rOICd5sc1+pUijIduOK6M/P1N4E7AiaV9ADoi4BYqHg0i4iR8inzh74plkJ9P5
         Je+bY1qyTaRpbpbxThus4FGruKMXzyrqgzumKp9u7Hg/83+xZmKX7g/d5LIjqKsZMyYf
         VgqxLVSnmHrk4XEGD+MSoo/C3+xn3ylReqbECzF8v2GNzpSbygNgnokV9ILFKWkRSHn9
         t5qhlHyfDC+xRniGIZW98/c9I24pBruUqGJIfN6bMq8KDHyGzj8uAQuCmUAJzAi8OpVu
         /1KiLg+MZ5MCW1hR4B5UjOgUbhCg8ggfD8lC4dj0dCfm21zsjclrk+CkwcBRlamx7I+8
         l6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738080215; x=1738685015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+t8hjKCoqo6TQnZ8M8jStHab2qUU8bkeSurEQ6U78Ck=;
        b=EY7UNQpttdpXwoSiiMHjFWbvzNTYVw+bNwgvnZCw41w6fIwnCghwg7G3S/tEo4+apK
         vZnWSwO31sE9URdeP/Oj/Jfpe6sbRf5aKAKoRTwiUXtlOOmx3HWw3c6q6wn7xghusNG6
         WrFJqhaqKZEjMmN+EgDC9oSZ97cH51JozqEAVqPVuBiCR4ZpHgD1NihCw4UcJm/+yVyC
         jMfa47OxetoqlEvdAaTntXpYmRzXMmEc24PNo340bGzxT3GApBXrX8CxQ+Yne2a31bTT
         eCpV8fdI14yDai37K46gmIWiDC5MKDv5JNZzQcEMbZOIzHKYLfZT6so4URyNHExWGe07
         wljA==
X-Forwarded-Encrypted: i=1; AJvYcCUg1bQm40ZqALZMxlG2Q0YuzJFthkhnr72P3jMr/13lu+ICYUsJ28K795HZ9q0bHf7PYHT6tkwBPRQgtg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPsggmRd8fL2bZzZoAihVjyehVH/mBp+/pUYPH2DrzdeFg5KGZ
	d/byPyVSrATbHHlBhIEUXS670XiBU0NSnvZZiAASlc0NK0wveTOtPOnBAU1cxB7GbuqBgdiySEs
	Hh56ULyOuNAJaHiH6sWz4vAknfrDA+r1XDGvhNA==
X-Gm-Gg: ASbGncsI2+HqqiLLHgVA+ldyfw8rUshOLDKqCw/ZDWyFM/Nrq+m0gC8CV7S02CUGjU7
	piZnMb5mtyjpLtsW0Nhchy/3IwfCb00FblulesQtzd621IALh/ZGIxym6/R2Ha30JZgve69A=
X-Google-Smtp-Source: AGHT+IHzEustcu/b8mVV+IGZGzcJdRDgXEhBHXrVJD8zlFDPDv79N0T8FHjBdECXZ69pHyAUFPzDWK0nx6iJEXfxEmY=
X-Received: by 2002:a05:6512:124e:b0:540:2549:b5ad with SMTP id
 2adb3069b0e04-5439c246d35mr15256733e87.22.1738080214692; Tue, 28 Jan 2025
 08:03:34 -0800 (PST)
MIME-Version: 1.0
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org> <Z5FPJLzAEVXGWJnE@chonkvm.lixom.net>
 <20250123113042-GYA38135@gentoo> <Z5LOdh-4UxRtteOy@chonkvm.lixom.net>
 <20250127181726.GA538260-robh@kernel.org> <20250128031712-GYB47737@gentoo>
In-Reply-To: <20250128031712-GYB47737@gentoo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Jan 2025 17:03:23 +0100
X-Gm-Features: AWEUYZn1ZQkjXChIgaJ6psXXGwkFFB-eH9nO-EAMkzADocFTLmeDtVOyD7Nrf64
Message-ID: <CACRpkdYbSOHD9UH5=+qjztxS3Cq_rxaoOT9tFtD8ZWm9zQGnPw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_080336_598489_FB20BEEE 
X-CRM114-Status: GOOD (  11.17  )
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

T24gVHVlLCBKYW4gMjgsIDIwMjUgYXQgNDoxN+KAr0FNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKCj4gW1JvYl0KPiA+IElmIExpbnV4IGNhbid0IGhhbmRsZSAxIG5vZGUgZm9y
IE4gZ3Bpb19jaGlwJ3MsIHRoZW4gdGhhdCdzIGEgTGludXgKPiA+IHByb2JsZW0uIE1heWJlIGl0
IGNhbiwgSURLLgo+Cj4gSSBoYXZlbid0IHNlZW4gc29tdGhpbmcgbGlrZSB0aGlzIHRvIHJlZ2lz
dGVyIDEgbm9kZSBmb3IgbXVsdGkgZ3Bpb19jaGlwcy4uCj4gVG8gZ3Bpby9waW5jdHJsIG1haW50
YWluZXIgKExpbnVzIFdhbGxlaWopLCBkbyB5b3UgaGF2ZSBzdWdnZXN0aW9uIG9uIHRoaXM/CgpG
b3IgTGludXggd2UgY2FuIGNhbGwgYmdwaW9faW5pdCgpIHRocmVlIHRpbWVzIGFuZApkZXZtX2dw
aW9jaGlwX2FkZF9kYXRhKCkgdGhyZWUgdGltZXMgb24gdGhlIHJlc3VsdCBhbmQgaWYgd2UgdXNl
IHRoZQphcHByb2FjaCB3aXRoIHRocmVlIGNlbGxzICh3aGVyZSB0aGUgc2Vjb25kIGlzIGluc3Rh
bmNlIDAsMSwyIGFuZCB0aGUKbGFzdCBvbmUgdGhlIG9mZnNldCAwLi4zMSkgdGhlbiBpdCB3aWxs
IHdvcmsgYWxsIGp1c3QgdGhlIHNhbWUgSSBndWVzcz8KCmZvby1ncGlvcyA8JmdwaW8gMiA3IEdQ
SU9fQUNUSVZFX0xPVz47Cgpmb3Igb2Zmc2V0IDcgb24gYmxvY2sgMiBmb3IgZXhhbXBsZS4KCldl
IG5lZWQgYSBjdXN0b20geGxhdGUgZnVuY3Rpb24gSSBzdXBwb3NlLgoKSXQganVzdCBoYXMgbm90
IGJlZW4gZG9uZSB0aGF0IHdheSBiZWZvcmUsIGV2ZXJ5Ym9keSBqdXN0IGRpZAoyLWNlbGwgR1BJ
T3MuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
