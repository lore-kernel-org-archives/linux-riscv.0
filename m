Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDF8C6FD1F
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 21:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHkEbEUSGK+jXwkkAmmbKXPqqDQCChEr86XF8ZtmUhg=; b=YzKL+uisHzLggP
	TQFVTMbbnTZriJNh7SZt5AODqgyUhwsmi4XUq+KGtiKy10r3dJlaHKORayt4Q6yU/XyKbWdwO8bLB
	ylUo/cDT6MBM7jvg8Lc1t+RZ45/qF2sxgok1VsV1WWTKx+tG39d7xxhjPp6LcyVyvvlLAlCLPx70o
	/c7ZmhTD2ejPfBQVUkykXhyQ/O80N7y5s/WRkbKgAkzK6yXBg4p0jWaSa2FJPUSO/jWcNZ/RRhyst
	2Jxj9ToAU7Fp8myluVOyATsl5hGokC87NXpw9AjuHjBviKeQqwYgRv+pNHIrplQuBVq93kdfsQ3wb
	FWEfLgxCA01VPGss7RJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb73X-001JNc-Lq; Sat, 11 Mar 2023 21:47:11 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb73M-001JIl-Q3
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 21:47:03 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5418c2b8ef2so1945427b3.5
        for <linux-riscv@lists.infradead.org>; Sat, 11 Mar 2023 13:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678571219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3BGxsLL0P2xeumMB7bEdeq9RgCc5RJW60xab3JcWmM=;
        b=kwcJYojGXc7i5Cw4eiPmBcGY3cxrIlbNQQuF6G9c99eUWkl5qqoYCwNnSqw0mqLRBI
         E/DVYL9cPcBC0CNafj1hr4JbY7lTGwoD9B42QqaNhXpCiryP9MJitp6OT5ytjBg4C1aI
         8Zu53YMGAzAcEjN6by7I88ZsMxSGApOOH1tsSPOib8iyg8YpURdD2zNKNspwyKDqe06w
         cVavHO/PktwawT7QB/Oztvt1lGhdQewMchl1Afz8uTrmOCaUOJvY30mTiPYc4VaRtT2a
         R69AbyqOPKwkwNNoFVg4GosB4ks5HTaG4jb8AlEsmG2yW/2IW1zgk92UjVyo9EY4fiN6
         s3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678571219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3BGxsLL0P2xeumMB7bEdeq9RgCc5RJW60xab3JcWmM=;
        b=HY+bH0weTjJA1rVN4f2KaY9HKTaFchoMnaMj7cV9NxrjSfcfhwVs16myvkXz0KmL/F
         8Crc/QZowuDvLHs7+tyHRo52GyaBVeNwYJuMc8Z+H1Z5CuHLKIwkaDX6/8DIU5lRQU6v
         xDbyAJoZKUjnepOBL4Ga2rtyt2qvyu3H50fMCn+uvCSv2IydMnO6g4h8QxPh+wD+sX7Y
         k4berRCG0mjJKfqT6B8N1Wo1mL0nopSH1ZrDuPnXmJUumb1KZq8DtsKrPKgPtg7EPguK
         +V471HenRIjfBacurXeEuomEvbnoWa6j4UGFswNf7VHHfvWF6NsjeG1Fy6R9ViXsU5T1
         NeGA==
X-Gm-Message-State: AO0yUKUG6J0LscVkBiEPZ8IHenlheDDgj6YEWJni9VlAb2k+EcsbeoXs
	MIKrp+JL5gQdO2XzfFaUPzmLbrGoNiZjK1RWwmvUVw==
X-Google-Smtp-Source: AK7set/ivVF6AzD/O9ePnVc9AKWYerfOeZb4FLMTiJT/IwrTK7biY9sqp7oNVh/B77dfc4ZuIA+xnYP7wi7zrZS3v3I=
X-Received: by 2002:a81:ae61:0:b0:541:822f:af40 with SMTP id
 g33-20020a81ae61000000b00541822faf40mr964887ywk.10.1678571218976; Sat, 11 Mar
 2023 13:46:58 -0800 (PST)
MIME-Version: 1.0
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 11 Mar 2023 22:46:48 +0100
Message-ID: <CACRpkdav4Uas6UKOyz6iV9hzgSELvU+224Ewyy+o0w8tYCoaJA@mail.gmail.com>
Subject: Re: [PATCH 1/8] gpio: ftgpio010: drop of_match_ptr for ID table
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mun Yew Tham <mun.yew.tham@intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Florian Fainelli <f.fainelli@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Nandor Han <nandor.han@ge.com>, 
	Semi Malinen <semi.malinen@ge.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_134700_889202_9D65339E 
X-CRM114-Status: UNSURE (   8.06  )
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

T24gU2F0LCBNYXIgMTEsIDIwMjMgYXQgMTI6MTPigK9QTSBLcnp5c3p0b2YgS296bG93c2tpCjxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBUaGUgZHJpdmVyIGNhbiBt
YXRjaCBvbmx5IHZpYSB0aGUgRFQgdGFibGUgc28gdGhlIHRhYmxlIHNob3VsZCBiZSBhbHdheXMK
PiB1c2VkIGFuZCB0aGUgb2ZfbWF0Y2hfcHRyIGRvZXMgbm90IGhhdmUgYW55IHNlbnNlICh0aGlz
IGFsc28gYWxsb3dzIEFDUEkKPiBtYXRjaGluZyB2aWEgUFJQMDAwMSwgZXZlbiB0aG91Z2ggaXQg
bWlnaHQgbm90IGJlIHJlbGV2YW50IGhlcmUpLgo+Cj4gICBkcml2ZXJzL2dwaW8vZ3Bpby1mdGdw
aW8wMTAuYzozMzY6MzQ6IGVycm9yOiDigJhmdGdwaW9fZ3Bpb19vZl9tYXRjaOKAmSBkZWZpbmVk
IGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+Cj4gU2lnbmVk
LW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8u
b3JnPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
