Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A77FC71157
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQ1EsEtC3i3tzlc1Uzd1XTwPPF63Y6vKbhgS2EZUW5E=; b=eDk992pj81peq0
	PPMxw1/TN0XglTUwwy9a3kJamPYl/Wq4j0oUkQc/dsJFA76vN4ETzaqsNFRqx/zmwh9E1IYJq555Y
	6oLuy+PeOqnYs2aCLC1wuvCq34JmYzaeIr4HCIqMeiYXPvfrGNt3K5tW04tCIgSL1PgVU/HYaHu73
	PmCtMFWKuuy0Xr3G1uIXyWuKfwr2QyB0Hq5fiWqWfL2FlmI19sZwpQ4/H3E5FeLEXx4ZOUmk7tPko
	6A27ZvvsqdQesfFwPi+BSk/l55LFTIFTDDybN3HqD2m3zpKOBqwe1htoXs1stKAjvD2C6xUgzChBC
	XVZIU0kY0pLdgi22wgQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsUS-0000000AE9R-3CHK;
	Wed, 18 Jun 2025 13:06:08 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRqws-00000009vs5-04Ts
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 11:27:23 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54b10594812so7023430e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 04:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750246040; x=1750850840; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hC/rxmNEx7lBs7LXqlf7wlayqnKtYiiYbKP9iLo7bEA=;
        b=pZiZPQBX8EJE7nz32SiRxA/TOBcim3s9/WCTO7cPUh8Q2MqJKj0tv38M7DRF34lx/A
         JUI2JhN9tJEOFLeP6/YP/HGiqcp6qYyVifBm8RvI5IBSburIFWvC16EMwp8cFgF60eCu
         X3EENXPsATqCG7U/fmoRJmFsHuoZEeiK3/Os28Hj5NiadA2SYQfnG1Vxi8KNsgkMEMYR
         O8ogZn3IzBeYQSBMGCq3/GjEF2aUJWJzXTw+/KQQYG56xVrexe2k9IwNEz2iveTgAdBe
         Jm+irj5tp+Zm3Sb1hSKYNF/YZMxhOc5QGHMPnuV2n+9iEBkXdixVMupsdC6lrmpnOXGU
         EO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246040; x=1750850840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hC/rxmNEx7lBs7LXqlf7wlayqnKtYiiYbKP9iLo7bEA=;
        b=NofqjlVyDIRBvJnPhSY1Qgh3z4GZhP4LV0Y1FzkNgWtuWdSf2fza5QNo7mm8kA5uas
         Hpbap3BTVEsrCK+xvkG5gSWwmLZl5U1uAUEH4auWX6g3KRcAtKhM5htglxO1Pt8vk8Ml
         m8G1ZC1EN6dF90Ai/EINvgoQIBQ0M4t1uIBkzIceDjytmJOl7+bTixxKzo6bOpTveQYT
         CJvMa8kblFaImB2k7f0nID9d0xMYNN4YC64ND9bMvFb2mehqKA4hnn4KYzYJ/VQ5PIrj
         N2J9bh3NV1aXvcRBRJb5us0GtI4wb3/CVYzB8+8Um6CaC8QbGEcSaq+ywM+qskDahgBb
         h+kg==
X-Forwarded-Encrypted: i=1; AJvYcCUvMqqe0EracDsWwybgXY5zckXF5tLNPnti1RCvP3LHzpaK/rUGCqaR1ApuJBuhIff3fociJZPfsHI7mg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbaVEItyLO6i/ArwyI9u9iyledON+1ThsEOMuxgj6gtzLzfb6O
	wH/rOql3JM6UaOMw89DL385oU6DW/njQEkkoeQPca3s+fB6nf/BiYZ7RiSTQJObSkZToZt0zt3R
	q682wZNiqhfl6GhYF+F0BGAMkUClqD8thaUJ0hEKhNw==
X-Gm-Gg: ASbGncu3IV7V9F5T4XuBrGjs66+HrqQnF7mzQlCax90RTYk8rUu0fbcKu2BouLkOQ3g
	X9sMdnLeIntOr2izcdaW8NMBROsmqvCSmVX09O6uzA8zMnGeNmgJiaeDt0fmS6zDD9Af/aEbkGA
	BxIZdLJzMO9+tyMSRoMJ52FD8oa4dDbDQh9mUQl0rQYRg=
X-Google-Smtp-Source: AGHT+IH9N3s8eV4QAoWcV3ZISC8T6rNpJ4leRaY7YHuJFlZ4bPXaxx7Hzh/4jfbIVAzp1tapzbe+4WLXZFpaeF/7BEk=
X-Received: by 2002:a05:6512:39c8:b0:553:2bf7:77ac with SMTP id
 2adb3069b0e04-553b6f15af6mr5016567e87.41.1750246040209; Wed, 18 Jun 2025
 04:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 13:27:09 +0200
X-Gm-Features: AX0GCFuhKOslIDouO5PgG3-FBiOJa3cs6VfF8AgbesblIRkK52-2f8uLA9uvwos
Message-ID: <CACRpkdb1YqS00tEeyAUTjjJ-EQQbH5wfE8QzZt-UFwQYCfNHRg@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] pinctrl: Constify pointers to 'pinctrl_desc' and more
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
	linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_042722_060971_5E6C8550 
X-CRM114-Status: GOOD (  10.04  )
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

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgODoxNOKAr0FNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IENoYW5nZXMgaW4gdjI6Cj4g
LSBBZGQgUmIgdGFncwo+IC0gUGF0Y2ggIzE6IHJlcGhyYXNlIGNvbW1pdCBtc2cgKEdlZXJ0KQo+
IC0gUGF0Y2ggIzI6IGZpeC9yZXF1aXJlIGRlcGVuZGVuY3kgb24gT0YKPiAtIExpbmsgdG8gdjE6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA1MjgtcGluY3RybC1jb25zdC1kZXNjLXYx
LTAtNzZmZTk3ODk5OTQ1QGxpbmFyby5vcmcKPgo+IERlc2NyaXB0aW9uOgo+IC0tLS0tLS0tLS0t
LQo+IEluIHNldmVyYWwgZHJpdmVycyBwb2ludGVycyB0byAnc3RydWN0IHBpbmN0cmxfZGVzYycg
aXMgbm90IG1vZGlmaWVkLCBzbwo+IHNpbmNlIGNvcmUgZG9lcyBub3QgbW9kaWZ5IGl0LCBpdCBj
YW4gYmUgbWFkZSBhcyBjb25zdC4KPgo+IERlcGVuZGVuY2llcy9tZXJnaW5nOgo+IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+IFBhdGNoICM0ICJwaW5jdHJsOiBDb25zdGlmeSBwb2ludGVycyB0byAn
cGluY3RybF9kZXNjJyIgaXMgYQo+IHByZXJlcXVpc2l0ZSBmb3IgYWxsIGZ1cnRoZXIgcGF0Y2hl
cywgaW5jbHVkaW5nIFJUQyBwYXRjaCwgdGhlcmVmb3JlCj4gcHJvYmFibHkgZXZlcnl0aGluZyBz
aG91bGQgYmUgdmlhIG1haW4gcGluY3RybCB0cmVlLgoKUGF0Y2hlcyBhcHBsaWVkIQoKWW91cnMs
CkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
