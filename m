Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC24C83F0F
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 09:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yodMO8juQFW3KIn7y/b1pk8+zY8S9ktqlMsdr4jkRTE=; b=mTxb93kfIS6EX9
	NdYIhR66nFvq+Svka7AiyLU18E/oeEsUW48toRZaG2qBZrBvB01WjPiVc7ed+kZLFnHiZrqga/OVg
	DPA91RqXs8d2DTArnE9wjoQf8wcj1yrOJmoZb/+TiJXZrZxrytJEBhhFp4WNx4xWuWYS+lck2V7A/
	yPNofpwX9tqkR44vAhogLcSOMhT+L7oaO+0xgc3X09ZKarasZDd6YOHT9DlQhMuG1bf4rHrEsyv5p
	cq1Da1GzTR8TA+U+O1tnP8Sicw9do0yhyU0xX1uGG5sHfKpar2reZelw2g47A9H5KwXo/YLtY821A
	cvwLedVCIouPhYexE9SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcIG-0000000DqnL-0FUm;
	Fri, 04 Jul 2025 09:01:16 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbb6-0000000DhCv-37Le
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 08:16:41 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-553d52cb80dso641775e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 01:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751616999; x=1752221799; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGsMdWNNo7Kr4TZt6J0SFs0hAUGLXiGKCsH0gVxSZ0s=;
        b=NMJhg71HotJpOiO4r5Vrbg+1TsyJeRn8gh2kkEDsHs7tSOAd7M+q4kKkPn70Ym+mh+
         KSHFqTFM7uVCPFs3VblSP+Ptc928gtlwQuhZ/ATxMq1UlkQlz+cu49aqnLRnUxa9qgK4
         yk21rnZLQDEjVg2aphCGKfshMHT0PrCAHvSLNwR5FvE5f0ne1rqHMsPTxIJyptGnUHSa
         gegbQp3xopPr0bMuOI5cpoVIw66WDvMWZqWg6z2ZME3TKWTYaGA/ZWCUBoY83Z8wIip3
         LawxnQ6ckmXWiwXFb+eyBQIDkarrbt/FertlLEs7DT21YnMoH0uTxRWfu+Jh+KhHiVtg
         +yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616999; x=1752221799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGsMdWNNo7Kr4TZt6J0SFs0hAUGLXiGKCsH0gVxSZ0s=;
        b=kpIK3EfjpPWIuyfSfGKNLkB/3naHc7pYfX22082HlSMiNbkCdmVUeARCoqSiW8BF4x
         CFqBX8Pp9hkkRVgZfiDlwikNB2kkVOGwzegVYOaGfLJeAAb5yxQBpPvqMwWfG5dwsAmU
         PMDU29Mo3k4peB0zXjPcM7CPPZg4JISIKBSooezkJ8KxnBeTFRa8pr/faktc2B3fae+3
         n3bSo9ycrm4VCgPXWRvq/Y6CdfpUllYI5we4tutXEvZ6a2+/0dF53PlQAseuX3dplk9M
         SGlfcHh3fp9ggT+y7BeuHiGdsr0yhKPO1eBp+Lxa0dOZzUFteo/jyyY/vBt1VNjPModU
         VVXg==
X-Forwarded-Encrypted: i=1; AJvYcCVE8gIKZG83oA15CCKnXBIaUu2h7ydqfeIpqPpz6lvtzsXaTVTqWISF1YDLRK3vkaw9wzwB8mDTBW9h7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTd3qVh9Uy+L1TWr0eLh96EyRVIYHTfgOkv1cAZRKY0xjCfamW
	lYlS6ObnJSXJCrqfX8MB6i0QZ5m+tebjwJc9dTr/lkUgQtqNvH/CffuyJ/qsIdKdmeDq0gzJjc3
	1f6MRElvi1DogeqrisKq1YUrh0b4vD+YE9N++h7Clxg==
X-Gm-Gg: ASbGncsEaRBMsPx8XAkFyYXx8clfNaEQbE+UP+2BdEoQIujBhFyUnw9YsDt2bzuoOTz
	KsdheWhr8XT31IMYJZBKYnHRoZvDmYeMFv5yyR6d/ikBPa2Yru7wXLJIaSyZvvwK+rqhBSBsn8i
	AGGnysSt5oZNjLwDU5c1f+htHfoa4D/PcWj7SF7AIG2n4=
X-Google-Smtp-Source: AGHT+IEUHpxlHJAaJyUnD91z1Awdc7+mfmlcOB7ydvJEbIgyvKJk/YjEvZBui91QkwXNtGOS6lwTRVoL9chNvbUBeNA=
X-Received: by 2002:a05:6512:32d6:b0:553:cf72:45d3 with SMTP id
 2adb3069b0e04-5565840173fmr528205e87.3.1751616998945; Fri, 04 Jul 2025
 01:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250702051345.1460497-1-apatel@ventanamicro.com> <20250702051345.1460497-7-apatel@ventanamicro.com>
In-Reply-To: <20250702051345.1460497-7-apatel@ventanamicro.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:16:27 +0200
X-Gm-Features: Ac12FXzg4WuZhSIauiG8DCqEO1Wj-Rdq7FM-OMSweMcuUZLpJE_RoU4DDONVAww
Message-ID: <CACRpkdZc9EpUkd-Q3T__4U0XeqTQnxnmW2K=O0BBobgXiQna9Q@mail.gmail.com>
Subject: Re: [PATCH v7 06/24] byteorder: Add memcpy_to_le32() and memcpy_from_le32()
To: Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_011640_785680_051DF5E5 
X-CRM114-Status: UNSURE (   7.01  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdWwgMiwgMjAyNSBhdCA3OjE04oCvQU0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgoKPiBBZGQgY29tbW9uIG1lbWNweSBBUElzIGZvciBjb3B5aW5n
IHUzMiBhcnJheSB0by9mcm9tIF9fbGUzMiBhcnJheS4KPgo+IFN1Z2dlc3RlZC1ieTogQW5keSBT
aGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+CgpUaGF0IGxvb2tzIHVz
ZWZ1bC4KUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
