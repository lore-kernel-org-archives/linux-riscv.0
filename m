Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA22CC021BB
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 16:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJHOGQWI6NRQ2z00ygNRTHyODIhLJT/n6o0QGeIVefE=; b=fvYi8Fy03O2V7m
	21SNSZi8vPU/9JgRniq8CN2vaRPfCeypfxMW2brVQnybKSl7GLMQen/w9A6Ii+aw11veP6kL/lOHG
	7RqMltqEB/AytLcFfnidmOgofi7zNIB8/4RZ2ZArUpqV9TZ7WrpCo4sBYI0X74FnHNmID8eB9mQKz
	dAVvZvfVkMXLMR8ElBum4yC/pIIbUk1uWCSL5Q8lZrXm7dNGP/PUiV7RIOT8HcLJ0VLmUinzjeIXa
	SetPoJoejb1eZHJtwUl3IVkrwxNtVyRPF0Q9NESegSn6zTA2rV/VzYsg00gtc5PChO897qxQOfR3E
	F3HfxmSWhXFWrMQeCWEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy3r-00000000Q3m-3G3Y;
	Tue, 25 Feb 2025 16:45:35 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxel-00000000C3L-1B8O
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 16:19:40 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5439a6179a7so6464732e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2025 08:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740500377; x=1741105177; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tyh+RhXcKnxQU4MXzN9oE4S19Yl573Q7D+3G4DQFujQ=;
        b=Zp0zY3/Tp+Yh/NeOjzFvAkdwQIY48yFC94qcXmGD+lQgh1O25ReUB67hPvBAhns5n/
         jaqdWHimGok3M4LbJF5RniP/Jsh6RPg6LjR1dFGyqUNG6iSQCg/T2QN7lGPdwLjK4VSI
         xYU1swhTvp3el2heS2jlD08L+0WltGvu64IkY4fxTvYrwF5WETJVBOT8AldZ2jG2hc5W
         WnpvrECGab3+ErTRYWg2ULCIcFxy8hu1Wd2+gfD8X4WUN7Z3tmuTsnhnLUUzv7Cjs5uM
         qiS0Bvc7fHN/jA5Jrm+zH2T6yPl3GlXz1fhy5LRuJE4OZToG3gQhkV0/7sW0QI5ar1vu
         R1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740500377; x=1741105177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tyh+RhXcKnxQU4MXzN9oE4S19Yl573Q7D+3G4DQFujQ=;
        b=KbJE9Vcz2WehlUYEIgLS649sMX5sMrN9CQsnZtXSGZz66d9XbR7RdKAAOtvIeDuY5u
         fkC3rh7qHkBQ82gQPiHJbCxLK//RUAmEDB/PavTJhfb/AlhT54SpfkH6YgizQ/Iuimmx
         ls9GqbXMVZGHo51evS7nI0+gt5eYwmaxDnn94LAm+bEQ6bLZjOATAa1w7SjxpInHk1uj
         qwsKMbllraBnkGVp0creavR0qF1sughzPKIRE+N8fU18X+eC2Q58TDTZGvMGbzQDRTeR
         jKRKv/sQv1sbYH2ISRj0BlmsMXLvo7QNGIO6aWLpjknLz5VzlxTeGEs+OKBwnKRMgzzd
         eqbw==
X-Forwarded-Encrypted: i=1; AJvYcCUMgt/764pghMJI88P97Rb3VAJVrEMorvRKRImoggag7PQRI3QH0QoylzU32c7pDy4dHj0oEtzcTTwvzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfsK5CZ2wNbf92X3XzRpXlePG6PPJn9o58IcjpUWgI7jFyBnj6
	GP6BxMB/23HULjk1slMj864XhV23UWNXvj5D7KT5L8fIZPCeBVk6Ecs4YYtmFdoxjHV4rpYIan7
	7nT8qcSdvplotxL0E56uVMUmP6lYTBwuNc3R6rF8BqTT8VlwbulQ=
X-Gm-Gg: ASbGnct91DGEAl4rJdbwX9OUkifv2ppq/Qvel4mwiJzLKDLquWdoKxWro23IBqrtUd/
	cX/lOv8SIHNCLDVlQsJjgIoyiUMvR+SdYqhYo77KvM82axDNXnn8Kp9N7uQnR20FjJIsi9sCBtc
	Vex+cgKHQ=
X-Google-Smtp-Source: AGHT+IFPKsmkV/8GrQlu1UecaEKHzDdnmY+GOqvsye/6W95YDRH8BC1ZvlN9fdjoiYBCyRDAZX7jrfC7MDoNbdARl/s=
X-Received: by 2002:a05:6512:2353:b0:545:240:55ba with SMTP id
 2adb3069b0e04-54838cd2edcmr5801739e87.26.1740500377437; Tue, 25 Feb 2025
 08:19:37 -0800 (PST)
MIME-Version: 1.0
References: <20250223-03-k1-gpio-v6-0-db2e4adeef1c@gentoo.org> <20250223-03-k1-gpio-v6-2-db2e4adeef1c@gentoo.org>
In-Reply-To: <20250223-03-k1-gpio-v6-2-db2e4adeef1c@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 17:19:26 +0100
X-Gm-Features: AWEUYZlYJub0FzdxL7Mpr1knr2_W3_lmRrr6Vhou8bb5JqpMdWieVnvejFVMY8M
Message-ID: <CACRpkda5=nSnYZ5XJsC_A5MhfdPHwcTndjNr4vGfSb4YJ4Bi6w@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_081939_318947_5D3761AB 
X-CRM114-Status: UNSURE (   7.78  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBGZWIgMjMsIDIwMjUgYXQgMTI6NTDigK9QTSBZaXh1biBMYW4gPGRsYW5AZ2VudG9v
Lm9yZz4gd3JvdGU6Cgo+IEltcGxlbWVudCBHUElPIGZ1bmN0aW9uYWxpdHkgd2hpY2ggY2FwYWJs
ZSBvZiBzZXR0aW5nIHBpbiBhcwo+IGlucHV0LCBvdXRwdXQuIEFsc28sIGVhY2ggcGluIGNhbiBi
ZSB1c2VkIGFzIGludGVycnVwdCB3aGljaAo+IHN1cHBvcnQgcmlzaW5nLCBmYWxsaW5nLCBvciBi
b3RoIGVkZ2UgdHlwZSB0cmlnZ2VyLgo+Cj4gU2lnbmVkLW9mZi1ieTogWWl4dW4gTGFuIDxkbGFu
QGdlbnRvby5vcmc+CgpJIHJlYWxseSBsaWtlIGhvdyB0aGlzIHR1cm5lZCBvdXQhIDopClJldmll
d2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywK
TGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
