Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC540E7718B
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Dec 2024 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E5Juy4jnoi/iWJ5AA+6+lB3LZDDkct09oCbRYDviqvk=; b=1dddTcla/48HWB
	DCVuUCgZ+QHaLmW6++ehUt/bXTT74p3POsUY60pqSxBcsZtSe1rUMndTfg0iC0AUjjSoEfg0ah4n/
	ZjZNVuq/gAqC8pg2d2Fg46TwSRPCaV7RIZ5GBdHKEoTfh2X4NoHGFiaOk/mx31eBMDMlkny5qWGs8
	dGc3GJfhasvTmTTZVIOng+IUT+Ferv3K2IpMbLVxx2+MdHz+BgOmmDd85QCp+E5+trv6yh/pHvTHK
	uGmtSm20bA+KiD5Cebs0Fjsf/I00A1zAgyfAJb7QRLgHAGXB9A3XkfD7YPOjZWQd6PvIRJOdTs0bm
	Qao9MS5e4/YR0dfmU5Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRD4M-00000000ba0-2qyV;
	Fri, 27 Dec 2024 16:20:10 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRD4J-00000000bZO-2VBN
	for linux-riscv@lists.infradead.org;
	Fri, 27 Dec 2024 16:20:08 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53e3a90336eso8181693e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 27 Dec 2024 08:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735316405; x=1735921205; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVbJnWxc3HnzjcWyW35ORpkVisHz4yDO0pY2qTzfLWw=;
        b=jl7rsoF7GST+4J2l416njz2fK44N+84BjBqW/RqSCy2SB6QOMERQn0vxM5sK6+k2o6
         Wxt9v6oAValYNIfCpJJdMiJ5D69H6BeQe4EweyEOCDdqwn2glOLzJHxADht97bdLpIYm
         LoTp2l9o73Ja7vVoZnenEgZpXRR+cHzzNy6DHevfQ3msTA/0dKC56QNsviDlYFFm+DoR
         YS27cMWUWs6jSDkycTBrd8xKeZiK1yu2B6MJjvtbl6r0GBaORhQM3KSKDEYET63ezUzz
         7NU8w/a73bV8h33lvQhAEReDO08wf1Ooh2xQPNDZVVPvSflwhXMnq+E4jNv1/K0Z4h0i
         3XSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735316405; x=1735921205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVbJnWxc3HnzjcWyW35ORpkVisHz4yDO0pY2qTzfLWw=;
        b=dHmhx1McvkB9GprJ73ZHQz24/tevkcuxn3S11+bQF4pUth3uGKPjYtru/UhzfD9d34
         /KqE35NjOC+oXpgxSJ6zE+uIv/fHSyTilpyfUpQOUXYbC9dV+x5g1znd//LaaVMcG9gk
         JeEnQ8uEzxDle8PH2sUgPbp6kdW+SNC3Znohpefhd9Lk5hkAmYf1h9DbL0rZXekMckcw
         JlaFUHOJaIbZCEELDa5LX+SXz6h4nF7aOCzzJsp9qshnQUrE3NFBPnnl0ah9+Azjk3QS
         we1HGwrQu5f8m9oUFH6Y3BW7j6fp0qkIdMQn+/QVX9a7PD0Fx1UUSeod2HXS1Lmt/du5
         n13g==
X-Forwarded-Encrypted: i=1; AJvYcCW9ylafln7TwFkRHHP7nrr8Mcj+WfgPsD5xeBcupmMjR0Id77JZbvR6p2AnVgSbQkEMHUqBLPD505++aA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqWyXjgmdTMK/VvDZUc/mtzjzKLF6Oc1N+AG3sjtsxmGG6VdPs
	8EcizddbXz+rFmaPg6Vy9+wA9rWD03QsG9oNQv7RrRCiSv+/UrMJhv1Kbq/mpVSLokKZ3f4Uldu
	0ho6+iLbiSXKypdma9YiSVbj8bbZY07p8rIocNQ==
X-Gm-Gg: ASbGncu1bQRt2aJOVACEjVYhJyT4uLG/rWRPScXbvdNDAXPrMlnvDraCZVRGBaxTJhT
	Rwf8VYaTc808M4P3X+W9rVuzU0pdiHYXqfMlv
X-Google-Smtp-Source: AGHT+IGzU50N1k0rPMwqZpnXSnDmhN5kfnjoTXOA295CNUdTOPpbZYikYnMIW1JDcYAohNmURREOlGqv+1OZ3EkcwG4=
X-Received: by 2002:a05:6512:2395:b0:540:17ac:b371 with SMTP id
 2adb3069b0e04-542295860a7mr8568562e87.56.1735316405411; Fri, 27 Dec 2024
 08:20:05 -0800 (PST)
MIME-Version: 1.0
References: <20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org> <20241225-03-k1-gpio-v3-1-27bb7b441d62@gentoo.org>
In-Reply-To: <20241225-03-k1-gpio-v3-1-27bb7b441d62@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 17:19:54 +0100
Message-ID: <CACRpkdbiaT8UwfJZNuVExdJY8g_K-akt9ftuLzsCDXamK4nK+A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_082007_650414_5AC8CBEE 
X-CRM114-Status: UNSURE (   7.99  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBEZWMgMjUsIDIwMjQgYXQgMTozM+KAr0FNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKCj4gVGhlIEdQSU8gY29udHJvbGxlciBvZiBLMSBzdXBwb3J0IGJhc2ljIGZ1
bmN0aW9ucyBhcyBpbnB1dC9vdXRwdXQsCj4gYWxsIHBpbnMgY2FuIGJlIHVzZWQgYXMgaW50ZXJy
dXB0IHdoaWNoIHJvdXRlIHRvIG9uZSBJUlEgbGluZSwKPiB0cmlnZ2VyIHR5cGUgY2FuIGJlIHNl
bGVjdCBiZXR3ZWVuIHJpc2luZyBlZGdlLCBmYWlsaW5nIGVkZ2UsIG9yIGJvdGguCj4gVGhlcmUg
YXJlIGZvdXIgR1BJTyBiYW5rcywgZWFjaCBjb25zaXN0aW5nIG9mIDMyIHBpbnMuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBZaXh1biBMYW4gPGRsYW5AZ2VudG9vLm9yZz4KCkxvb2tzIGdvb2QgdG8gbWU6
ClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZ
b3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
