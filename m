Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F33C30653
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 11:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V4MQ974KtugwMUuNUeDtcDIRLJL8E9T7CaE5vb3L+b0=; b=XpY9PjIH6fgcIC
	T7E9lgOWfVFTsLZgdO7YqBhIDDoRFYxNO2QZyMoIh+WK3hS+Gq2oo1EVy9amHeQClebnAVEKhQiii
	J5WvmDAMSoSTOtDPvZ8rgGBuuGuxay9XBFvWMlOEqyzPwcf4H3VKG/CWYLsHySEZ1rWpAZKQZGfQK
	Qf3p8VjIJv5M7bqHYM/1T1ArvrC3jtpjGbThsETBlQIo30r/X0a1Yvui9+2CFMVfVWsLS1vZr5wZ8
	7Gb/1GtrD88V5gcRHGEFiX+oIZ0R1dNzqxvigzSBThdczBIDP7+PN3yANccerqX7X/9I5zAyHLI39
	y/p/e8ye9z4EjCzbNXVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOyFV-0000000A1oi-2IxO;
	Wed, 03 Jul 2024 11:34:09 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOyFS-0000000A1o2-1GaI
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 11:34:08 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-52caebc6137so4817648e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jul 2024 04:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720006444; x=1720611244; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGjQIIef8f4D8V2nNTqkl2FTePoqDGpILu519rNKT2M=;
        b=lZUmYbJDv+STutDrg7IaO4Z5ZZ9z89uX0EdmLslNtQbcXAOP0R90lE5dMljCdoAtrU
         PqaMz6jL0AAsT291I8N2gwZ0bGGH6lrDRJTFssNdrcggnSVBurxLGudnp5xiyRvBWHaC
         No1o1jyfLlG2aFuBqOTexjFMQJN2w4hNYK2SpG5rYfz1IZ/nn60JM1P7uPZMSS2yklbO
         J/2Pp1yQFXgiiN3aL4uKG8gdlU1/BOW5OjED9mIyEYdJey+Vn+uJiNHrMW7kNq9lTM/z
         TZFWyaYiBRTWrrETK4/zl1pZQLLyjGY51fdKZBQksnkR/ffsgya4LEOIaaF0vEHpBEJZ
         gbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720006444; x=1720611244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGjQIIef8f4D8V2nNTqkl2FTePoqDGpILu519rNKT2M=;
        b=sWwgXlHL3nyydg/lzfawXm3mVQOyj0RFQZEnRtQ7f5oZg8940P3SoA20ZyHGb1fGtZ
         ssbpJzy/6Lp6tU7C+1J6IzR2QUawK6HkApmt+mBK8awHCfIvz/DEgPmuXqmCi0Y7lKJF
         LhRXdASk1Ewq+3Gt50fEcVmdIU4EpCYVuE83WVWaqZ4QNuIX03+WKit2woiDTz1U0qgY
         XMjDcXxhRCU2LdewGG2bo7IDmY4lfM+98qfF1WmUcjal3ltkFiD/5AswH8C8GA1G6hjZ
         rJJEnd3lBvsT1RW25zg3XUXf0SDplxb4BxSWpUPmLLkeMZaqPmgfTCgi5DuwCG4zBHd9
         SECQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/eflo1uqOV4NHLBqO97cY9gE4dB/514eE2yBSjJ/KeCWrj3nLwVp2yHGDDhbJGgGKxMKnmkGTpNod+19/X+LRuRoNKaEe33gL7ZCYQnoc
X-Gm-Message-State: AOJu0YwLo/b+6YbHBb7Swosln2HwYee+K930OUHFCRIRhNJr4pcLoVjr
	phiaSO4W+lSbdYQzPmMbZGJlffACZDBJbbutx16JO2iHMCn29DCeIElk8ikSe8JJrwLljSFsTMh
	TYB0Zcs+Bb3AFZQ4RmR72kZZLcIhhuPJlCq2guQ==
X-Google-Smtp-Source: AGHT+IHvYQvlnz9xSSjxxA0C9+ARDlWBymS0Nc+4OcDhYKcJABqlW19CRkZVdGMg0Rc503nQzevZwF7mryFVzLHp4+k=
X-Received: by 2002:ac2:4e09:0:b0:52c:d8e9:5d8b with SMTP id
 2adb3069b0e04-52e826678a3mr7597242e87.25.1720006444010; Wed, 03 Jul 2024
 04:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com> <20240703-of_property_for_each_u32-v1-9-42c1fc0b82aa@bootlin.com>
In-Reply-To: <20240703-of_property_for_each_u32-v1-9-42c1fc0b82aa@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Jul 2024 13:33:52 +0200
Message-ID: <CAMRc=MfjdCxbQfthWXcgz2tC+2_owfx73DBq9LqN_4wFvWwgqA@mail.gmail.com>
Subject: Re: [PATCH 09/20] gpio: brcmstb: convert to of_property_for_each_u32_new()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Bjorn Andersson <andersson@kernel.org>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Richard Leitner <richard.leitner@linux.dev>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Damien Le Moal <dlemoal@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_043406_583230_52D797F8 
X-CRM114-Status: GOOD (  17.01  )
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

T24gV2VkLCBKdWwgMywgMjAyNCBhdCAxMjozOOKAr1BNIEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2Vy
ZXNvbGlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gU2ltcGxpZnkgY29kZSB1c2luZyBvZl9wcm9w
ZXJ0eV9mb3JfZWFjaF91MzJfbmV3KCkgYXMgdGhlIHR3byBhZGRpdGlvbmFsCj4gcGFyYW1ldGVy
cyBpbiBvZl9wcm9wZXJ0eV9mb3JfZWFjaF91MzIoKSBhcmUgbm90IHVzZWQgaGVyZS4KPgo+IFNp
Z25lZC1vZmYtYnk6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3Bpby9ncGlvLWJyY21zdGIuYyB8IDUgKy0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3Bpby9ncGlvLWJyY21zdGIuYyBiL2RyaXZlcnMvZ3Bpby9ncGlvLWJyY21zdGIuYwo+
IGluZGV4IDhkY2U3OGVhNzEzOS4uNzc1NTdiYzU5NmNkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3Bpby9ncGlvLWJyY21zdGIuYwo+ICsrKyBiL2RyaXZlcnMvZ3Bpby9ncGlvLWJyY21zdGIuYwo+
IEBAIC01OTEsOCArNTkxLDYgQEAgc3RhdGljIGludCBicmNtc3RiX2dwaW9fcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgICAgICAgIHZvaWQgX19pb21lbSAqcmVnX2Jhc2U7
Cj4gICAgICAgICBzdHJ1Y3QgYnJjbXN0Yl9ncGlvX3ByaXYgKnByaXY7Cj4gICAgICAgICBzdHJ1
Y3QgcmVzb3VyY2UgKnJlczsKPiAtICAgICAgIHN0cnVjdCBwcm9wZXJ0eSAqcHJvcDsKPiAtICAg
ICAgIGNvbnN0IF9fYmUzMiAqcDsKPiAgICAgICAgIHUzMiBiYW5rX3dpZHRoOwo+ICAgICAgICAg
aW50IG51bV9iYW5rcyA9IDA7Cj4gICAgICAgICBpbnQgbnVtX2dwaW9zID0gMDsKPiBAQCAtNjM2
LDggKzYzNCw3IEBAIHN0YXRpYyBpbnQgYnJjbXN0Yl9ncGlvX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICBmbGFncyA9IEJHUElPRl9CSUdfRU5ESUFOX0JZVEVf
T1JERVI7Cj4gICNlbmRpZgo+Cj4gLSAgICAgICBvZl9wcm9wZXJ0eV9mb3JfZWFjaF91MzIobnAs
ICJicmNtLGdwaW8tYmFuay13aWR0aHMiLCBwcm9wLCBwLAo+IC0gICAgICAgICAgICAgICAgICAg
ICAgIGJhbmtfd2lkdGgpIHsKPiArICAgICAgIG9mX3Byb3BlcnR5X2Zvcl9lYWNoX3UzMl9uZXco
bnAsICJicmNtLGdwaW8tYmFuay13aWR0aHMiLCBiYW5rX3dpZHRoKSB7Cj4gICAgICAgICAgICAg
ICAgIHN0cnVjdCBicmNtc3RiX2dwaW9fYmFuayAqYmFuazsKPiAgICAgICAgICAgICAgICAgc3Ry
dWN0IGdwaW9fY2hpcCAqZ2M7Cj4KPgo+IC0tCj4gMi4zNC4xCj4KCkFja2VkLWJ5OiBCYXJ0b3N6
IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
