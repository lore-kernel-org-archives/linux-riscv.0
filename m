Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51693C021B1
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 12:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eT59cmPjOHoojSrpk3Or1Bu+mwzJHMJW0tkk4dP0VbM=; b=SChAJC7dDpaaP1
	gAnq4pUHcceliydRlpvpwwdFkd//TzdZKpACvkn0U+E6EzbABRe+hQNUXjhrZhwZhJIORQzQ1tsPt
	DkIvPoFQBHsMJ17BRzyYp/fKj9dKqMphogNnYmt0r297XkqjKeNeInFooKs3nTBWC1laRNPKnul35
	iIsgUZb7+nBay5skfDGSi59M7E5X5NxgkR8knua6EgABJkwqW6xHcp4gqpME/n+KT3uz2LDsY3Spl
	b4cWNhgRNHqv4HvaZ6y4TofFFhWIYdSpTT76s0cqTzp3/Wh85icktvy6dSGBQwW7vOe12nB6JQOA6
	kpFaOOyOeeBb0nazJ0EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjXi-0000000Cm0t-1tRQ;
	Wed, 19 Feb 2025 12:51:10 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjUo-0000000CknA-47Dq
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 12:48:12 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43984e9cc90so4769515e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 04:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739969289; x=1740574089; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TuTGzKLu5tsMdHN2Wdxs+98eJFE7Ctu0kJ3iax7fM+Y=;
        b=g+IYhKBPEBiQ25M8DAwUf2duNsVrv0Lq0rR0GuiHVtPbWrMkhmGeWgfDClH1gbPJKa
         eswnwR5zMm9IudXK8uWB1C8ldg8cnr139nVylAFsRdyuE6390Y+RjMo6FRckLNIC1B8B
         wS9dOwwNJhn1jbpsG7vcnMKHz98u0FRR75gcIBQns6/RnYL+ale1HJgW28HjiUr0lOek
         pHOYkXRsv8amibGA4aByh8jGberGz+ML4OUIPTGGcXWvlSXCSmwcrizARbGF1M1iXb4W
         xLWhIwtYEtj2FGVlkyXIBkSxsRJXJ09OSfxJA8utjw0IXwtRtM5+D5w80ZTGNLeDtBe7
         M+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739969289; x=1740574089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TuTGzKLu5tsMdHN2Wdxs+98eJFE7Ctu0kJ3iax7fM+Y=;
        b=KLomFFVE+TcvnigyvDFN798QQabWW3VZaQGfIAN29JPEZ05OVoCvvKjOzrVZ2KqwdP
         JzJz2jEMIVybHBCH8ArQIFOlheIUrv7t2BflnW3L6pv02k18P6vfd7M1g631Ov/MN7om
         ZeZjyp8tZmTuExTA32PZhkG21RMIaRnKjK3OC8j4/skCQVSNYjx+Z8mWkLtxgIzgP/TS
         37xSHPBNCkLx94dejfh0eqNCLvrsesoO23UTgDTfSMK36xU+rB0y6zuzk89djqD5avl5
         hxStNOd/GOZRvFKj6MUkUvHZLBsBFE7mDPQ1JC2yNa8kQRbLCQPAKsHqG+qr30RYqTta
         ataw==
X-Forwarded-Encrypted: i=1; AJvYcCWln9k1pfyRExkt7VoJYuBTI8wbXcQNqGozz6HxgZC7zvXvultudHoX1npBV9kJqAdp+vG0AF7KkDiDAA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9kiobhd4xzEK1jgaw45VUsSDNVsxBa9uxwAUWCqdQW5P8m9PW
	63hLzv+i1Nd+OMH8Hrk/McsC/Eyt1dCBy+4ZPUhZU1DoFhkeo+JmUSrksiy9bDQ=
X-Gm-Gg: ASbGncuWcTi5kQrN/5czrlxX6oTsoKAMkopKatifcbXpY+6sRWHWbQMc3WFYspNJ29U
	fuibjDm/3jBJVaP4TST4cF352Fk/4eAXEz3K0vyZH6/j+cCI/kPryBOETF81iiMq+lXyX7SbmGr
	JdTNfkWJIdH/F4rdLc/adTpf0ZkhWj5zhf9k2E8YG+wJPCfoNCSWYMJvnhTWa1sH3BQmGcPzdyq
	tXu8kqP8UOVNTh3tgQdOtGLw2seW0U9mLgWQLyN02Xro5yfXdB4GJfB18+fqF0qFaU3Ypt4nUlN
	jtYIlJad01iK8n5q7jW5uC/aTJr0OXN/YohtdmXO5AoBiVVvVdD99OM=
X-Google-Smtp-Source: AGHT+IHKkZm1mWTjnxrw0HpjWwHwD+t1a1Q2QYShVARWCw/jMaNlFT4FqF6ALJVnKaxZoyWJrSlOlw==
X-Received: by 2002:a05:600c:19ce:b0:439:5fbd:19d2 with SMTP id 5b1f17b1804b1-43999b44505mr32310105e9.10.1739969289321;
        Wed, 19 Feb 2025 04:48:09 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38f2591513bsm17965134f8f.55.2025.02.19.04.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 04:48:08 -0800 (PST)
Message-ID: <993f6d6e-a352-4397-82df-8db05cdfc18e@linaro.org>
Date: Wed, 19 Feb 2025 13:48:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] clocksource/drivers/timer-riscv: Stop stimecmp
 when cpu hotplug
To: Nick Hu <nick.hu@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20250219114135.27764-1-nick.hu@sifive.com>
 <20250219114135.27764-3-nick.hu@sifive.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250219114135.27764-3-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_044811_020914_5E61E158 
X-CRM114-Status: UNSURE (   7.33  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTkvMDIvMjAyNSAxMjo0MSwgTmljayBIdSB3cm90ZToKPiBTdG9wIHRoZSB0aW1lciB3aGVu
IHRoZSBjcHUgaXMgZ29pbmcgdG8gYmUgb2ZmbGluZSBvdGhlcndpc2UgdGhlCj4gdGltZXIgaW50
ZXJydXB0IG1heSBiZSBwZW5kaW5nIHdoaWxlIHBlcmZvcm1pbmcgcG93ZXItZG93bi4KPiAKPiBT
dWdnZXN0ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cj4gTGluazogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI0MDgyOTAzMzkwNC40NzcyMDAtMy1uaWNrLmh1
QHNpZml2ZS5jb20vVC8jdQo+IFNpZ25lZC1vZmYtYnk6IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZl
LmNvbT4KPiBSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KPiAt
LS0KCkFja2VkLWJ5OiBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz4K
Ci0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ug
c29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJv
b2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xp
bmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBC
bG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
