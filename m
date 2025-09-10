Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8D7CA101F
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 07:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEOCGWCG+sTJylVewKeA0LmPFV25GRze5d+YApIbuBw=; b=3lxKi7795H7FFZ
	U5NFr9pg4pwfI4yLk54XAoYsXtIynk4iBOQZ2SbUFvhUgX8iVohSBdspY0Or2mBi4NbC75jsUU/28
	+iy1MNErP5LbmMlGOY7i8XPHaWB34wnQ4cRclIoejBo3vR8vP0YsvYrSYB9kYHtWlUOpO6WwPItjA
	X16KrgK4PEjonwWa5yaLkvglgdR489guCvgrZS6ywnP7lMPZr6pVcsq1j4p5TMM7NR7EYuSwrigHs
	+CMIsBfI1aiz3zq51i5CSbR5FALH3e8Q55YemzOUrXyYC6qAYMgse6vXcrjBJee1Gex/aY8z726Ma
	uKIEneuwwxlT3+my8mPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF7N-0000000CWAc-1uiH;
	Wed, 10 Sep 2025 07:19:49 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF7K-0000000CW94-1McJ;
	Wed, 10 Sep 2025 07:19:47 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b045d56e181so965549366b.2;
        Wed, 10 Sep 2025 00:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757488784; x=1758093584; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6G74mBlZ/fYakaHeDD39PtqJwH/riYmWWQl4lVzsu8=;
        b=nmtbOvUg3gD1j1vaKhIIJDMm4666iHdBl7BQmckBjHw/giCX67SwuN/zmAbanV+2Eg
         YNwOO6J8g3pO7nYOVhIOZYvbloC2Oh4Wk4/nvf2cGDb5NMS5GIGRaUqOrih6lOGMU5OP
         bRYnDspMA9N3lX4Re2147J8hOLuvFIiAu78j2f+sItftrCWPZiJLJxwARWvFzxu3miXf
         0tpxkm/iZhRR9lVcDfKeD97BItQshJcyQkwb5mx7rH764MrBsO8Q+cwGyEN0qETYTWwt
         Pew5WWfLxmCRTdj965lMP3sEmz92uXf6magt/zEFlAL4ZFYLdre60COHFX5PO+a7rb21
         bQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488784; x=1758093584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6G74mBlZ/fYakaHeDD39PtqJwH/riYmWWQl4lVzsu8=;
        b=XbmgZsWB7ccUp8MQEXbAyyTDm1Vgu5b2P1HswQfW/allJrMXlmj138+gsIZjv0Ykok
         ObWqMv2GtIwMNG8raawl0Pc9Q4zbdT4m8cpT0/e5kMDh1i+qOzftZiwUsYXkU8Z7QWmp
         6DxLWvCi6sh2/gAV+C2iSr9eXJ8yQ4ro8EVqwkdZUagimFzZ8ywh0hRUdk2o5YiexfRU
         uAmyU4c/a7sQySBp23YF32NvGu5w2+p8OqYq6IGBGbQKm+u6GznQQPg5Y4iRFlVbYcge
         EjMdfVqOYnHAW5eVmiPGYFo6DXnW0/daP2Pnh6pNwXP4vhFcdpxbuqPhLFVNkNUrs6fd
         Pm5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoEB6drEcS7T1eOwZuzyu6Pqp8o19H83y00PqXmDJ06sP9u1bFJG43AoSpWapcMXRgH9IbY7hgRMBNIWkt+/Yp@lists.infradead.org, AJvYcCVJr/DPqsgZL4v3rwl8BMK872uo6lHL4hpsmkEX7+k4/+s+EUTi7DbEs5LLPLeeEVf30VaEh12ApcyTwFg=@lists.infradead.org, AJvYcCXDWeFfG65KYIkLgIzyC8U7H0E2Tj3RBDzib7gn9X66woNU9PqJqCk0BZxt2LpQp8BP7FghT8NR5ECl3Xw4N3c=@lists.infradead.org
X-Gm-Message-State: AOJu0YwASzkAJMCvVAGEIOzqZyxioAKa+9U5JhnDKaQpSlYFUhx3c54x
	Qdng/ejzeRrzbFH/8v711v7DfkYzqoo3xWgdImbENy1HLyNKJ+u3mqMY5fwsoetH5LwUqavq0CM
	zmZt1+qQMTuw9FIJaHMiCtatp1K3NozE=
X-Gm-Gg: ASbGncvl+xSrr4CL0XBT8P+wmFr6kDkT1EKaEbj/KuC5Llv0ZyF4pnRcjn63r+mKAD/
	EkqJsAj+YAKJhIX+t4fsqoY6Z/XtwQ6P3Y/ByfMb5pQkhyfJ+r9VGYEQ2WP/P8lebzIC30JXp9a
	9vjAcBeXHIFU4JByNXBZZRxGjm8y+vIxu3zyMWWwXQiyYfWqmsBWQuvUzKa1xCWyAizBXGwHtx5
	yJCVXA=
X-Google-Smtp-Source: AGHT+IE9VwmF/PsukJbTlBYgmvFE+e/pACvgJIHgxZN/6gBmWKACe4q7JDxVYTbF8agSRUuPrIlTk5gxzt1ml6Re7Ok=
X-Received: by 2002:a17:907:9301:b0:b04:75fe:e88 with SMTP id
 a640c23a62f3a-b04b167e229mr1292677866b.49.1757488783973; Wed, 10 Sep 2025
 00:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org> <20250910-gpio-mmio-gpio-conv-part4-v2-13-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-13-f3d1a4c57124@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 10 Sep 2025 10:19:07 +0300
X-Gm-Features: Ac12FXyVb169fyF2MyyUio9X-rBr9gKbOxdItUjj4Nc2RkmldZAztWEoPmp-bgQ
Message-ID: <CAHp75VcczAm_=XXAjwLFqNTCF72-UJfdisPvavadDEXJR2G19A@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] gpio: sodaville: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_001946_376467_E3846C77 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgMTA6MTPigK9BTSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
cmdsQGJnZGV2LnBsPiB3cm90ZToKPgo+IENvbnZlcnQgdGhlIGRyaXZlciB0byB1c2luZyB0aGUg
bmV3IGdlbmVyaWMgR1BJTyBjaGlwIGludGVyZmFjZXMgZnJvbQo+IGxpbnV4L2dwaW8vZ2VuZXJp
Yy5oLgoKSW4gY2FzZSB5b3Ugd2FudCB0byB0YWtlIGl0ClJldmlld2VkLWJ5OiBBbmR5IFNoZXZj
aGVua28gPGFuZHlAa2VybmVsLm9yZz4KT3RoZXJ3aXNlIEkgY2FuIHRha2UgaXQgdmlhIG15IHRy
ZWUgYW5kIHRoZW4gUFIgdG8geW91LgoKCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2
Y2hlbmtvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
