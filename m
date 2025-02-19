Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED74BC021B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 20:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=orGa1UxMHR9KI78TflUsEPzGVoH7UOQ+vmfdbOjsvTE=; b=2WPIClGX6dU6/e
	aNxhFyxjCAuPR+igZosPxd1wxF4CowsG5wN481Rs94WRvkATq/nsj9jU73A05fNQbt3ODfpX/qOJt
	lxw/jq1SWoqQ0J9f5AyXuy82DepCzFcqL8JJ8o7MyM+rOYjPlLU9PSRNDeKJ9t9EK/xAX/joZNJHU
	AxHZY1FFd9eH61BEgfc98YcF60+4LMxWqNm/xIcyxHIpdIDAKiH70b/x9Vlo065sFKPTCsXCdKq3o
	ZXIUwGCylw+Cw8B8TaLfHEiU88hKDLPzo2vXpwOYcYdenbiHh582BZ4wqfEqD060QzzWEm1Cunrtp
	H+s82KLYiLM3qbZ58F7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkqer-0000000EssE-2Zia;
	Wed, 19 Feb 2025 20:27:01 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkqdE-0000000EsFu-3nI9;
	Wed, 19 Feb 2025 20:25:22 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-439846bc7eeso950055e9.3;
        Wed, 19 Feb 2025 12:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739996718; x=1740601518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2Itno5XHizBUyP+XMgPT9B/6BDBul2rQNllFEnJbYc=;
        b=QunLxzbUACT21HsSEMYtkU+geukMvt6DcOrbeZQbcoYZ+EHrjZ7uqhm/rcPkbvoxD7
         IGKR6Z8K0ZjTl5EgwH3HOOBLZUeHsPIZLwmlPz4dVgavqjSR1/6KSrnN0OE1TIACOvZH
         EB9440GbNiq24t7JoEEFhBHV8vh1gZ3kASy+QDHN+tUKYtEDwT0w7MlJC6IR7Dz2hF5y
         0RFr2mxKlnsLttUP9M4KeTtKC11ZjkKw/oGyVqm/EtLiYYiBkefhuo7ZGQ4s9uYljPEr
         BBaRqUaBnemH4J1AfFvGNN7IXemjUBiIC99/hvTYpfynWOPsxIkztWgI3/GV/fry0BSB
         o9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739996718; x=1740601518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2Itno5XHizBUyP+XMgPT9B/6BDBul2rQNllFEnJbYc=;
        b=uDTNsIWMCzr9x4mKKDPhPoU3fQhbiz4a6LRaLmhgJj5a7dZbBCxJsVGwHeBQdX+K35
         icn6FfzTXx9XatsyfDnEHOEsA1ofo/y5mPoiIhF0iYL2UOawMVnaViqfdrh6ZRRdr4kr
         +EozJwqZLB3Qk6/ezT3ydwQhhmb6adiQzdJwDOEO7oYRswl+cerLlGy2NAUXbeZNDIFh
         LEpjIoePjKXSQp9yS8auV197a26Rb/rsm5xYcBgnNq1RFvHJ6pfR0K+RmuPcIDNZPHJl
         bbX/dovrQ+Nd2LNePWgHwFywYARGCk0HSMJM9dIlkgHPsSo4469AXp1dbFc1wCi7pEuc
         ue1g==
X-Forwarded-Encrypted: i=1; AJvYcCVQ691p+8v2f4yAqqCrXUO7K9C4HHO7aEmttzA6s9U3Wfrgww06txqqmE1EU+/Ef7l+PtarvTFz7j67@lists.infradead.org, AJvYcCWIWTly8tqSHZtuuigbIm0JiIaKTDCA7FI9OeogmZkcX6XiSzytDDp1VhpsnWPhIlr25eeX2lN1E1R3yCurfMy8@lists.infradead.org, AJvYcCXyUk2vYYzXpbwnMrK27JEuTouPnWQywoFA4kU28RXQ6YfHLF2LiGvkat83IiZt96f6v1aVG8EyHj8LFgA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzzCk7AJFiwLb8ZKL7cz1vjb2Tye6N9EuN8WJmn6Fv0DW0FGk0O
	+Vv+Q/rJZQkVI8hzdqwg65bwr/xWYGVjdQ01wGrcgQlL0BiDB3b0
X-Gm-Gg: ASbGnculGIhbVkKhFC71SPQ82ToQlv485nvRaGOlwS4qoOzvPtSM9uK1EjawBjo04Hg
	2DBuVsRRvvL82+D9sMI0izPl+s5EKPxq4GEQSw68a6Mc7G9RzGQwIekQjkWhtHi//NpQao2JftL
	RGvk/AgAmQ2vlcn8lnGlWC063jtrg1Nq6skHynG09Ll6e7Rao/4Xs+Amy9AYoJzMjFP+eRnF1dZ
	F04M2yRDOgw9CKzsjDb5eaKZ8M5+5E8O3tDvImOkFl/ezmdkZ3IRNeQJxlRXpJJDCrq9Zu6RtMu
	4+9XHdqgAkOAMNJXAMdpp9iiF/jrIqNBGosbYuryQNPx9Zq3lrcxFgWf94DfHRNy1rE=
X-Google-Smtp-Source: AGHT+IHf4EAn7H3CMgTwZHs2HxQi2OgH2VAHDrFSev5fKHMaDGPeUF2VlnzgRIOgA7Yc1ikIuakyZg==
X-Received: by 2002:a5d:5f8c:0:b0:38f:3e8d:dd42 with SMTP id ffacd0b85a97d-38f587f3f3emr5580525f8f.53.1739996718008;
        Wed, 19 Feb 2025 12:25:18 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f0597sm18467209f8f.42.2025.02.19.12.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 12:25:17 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 Andras Szemzo <szemzo.andras@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 08/10] phy: allwinner: add v853 usb phy compatible
Date: Wed, 19 Feb 2025 21:25:15 +0100
Message-ID: <4604743.8F6SAcFxjW@jernej-laptop>
In-Reply-To: <20250205125225.1152849-9-szemzo.andras@gmail.com>
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
 <20250205125225.1152849-9-szemzo.andras@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_122520_941519_007D6BAA 
X-CRM114-Status: UNSURE (   7.79  )
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

RG5lIHNyZWRhLCA1LiBmZWJydWFyIDIwMjUgb2IgMTM6NTI6MjMgU3JlZG5qZWV2cm9wc2tpIHN0
YW5kYXJkbmkgxI1hcyBqZSBBbmRyYXMgU3plbXpvIG5hcGlzYWwoYSk6Cj4gVjg1MyBoYXMgYSBk
dWFsIHJvbGUgVVNCIHBoeSwgc2ltaWxhciB0byBvdGhlciBBbGx3aW5uZXIgZGV2aWNlcywgYnV0
IHdpdGgKPiBvbmx5IG9uZSBwaHkuIEFkZCBhIGNvbXBhdGlibGUgZm9yIGl0Lgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJhcyBTemVtem8gPHN6ZW16by5hbmRyYXNAZ21haWwuY29tPgoKQWNrZWQt
Ynk6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+CgpCZXN0IHJlZ2Fy
ZHMsCkplcm5lagoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
