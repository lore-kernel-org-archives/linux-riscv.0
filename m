Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759A4C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 08:43:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B76D61208
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 08:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B76D61208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKDIquoLY7vctsX1z8NehTpVkbUw1wlG6AH4kG8MTZc=; b=IQCao3jVXM/ENx
	EtSuBFA1ayoHs9jwK+5ATYwt/fIxxL7eKdAgoy4IlWYLfnqezvwiqmpXuA+tmc4x39RmiCgjeqCD6
	lQvU41ysu2zEBECDCHCXjIKFTQgO4nyjIJ4U1uU9sK+32gItbCLo9ZLbsDacKqkFPH/wsmVqYektN
	UjMMG+WIHhcP++uR4PcGG12oNf9nYCjlv2NGeG3HyTq9ProueM6qelNIKz8gdcbbyRKroowQe7+KA
	oAAc9yd2gDpZWBBKHbpB1pffWvaqz6x6uSK50CBU5mCTTNhsIxBYtNIPC0HkbSqfHoFup+BKXVSOl
	HFErJs5Y/M48UHIT32mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkMjC-0014J2-BA; Tue, 09 Nov 2021 08:43:38 +0000
Received: from mail-pg1-f179.google.com ([209.85.215.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMj8-0014HR-8X
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 08:43:35 +0000
Received: by mail-pg1-f179.google.com with SMTP id r80so7531352pgr.9
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 00:43:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a20XwW+ywquM0TvSLc4Uu7eUmVwNDFrP9cILSrmfGU4=;
 b=v6bEaxeAKDF//sRtbGm+LR29HS+RklZec5c5Xhe2FbKQngGWZw/r//BdHUd8PtlXjD
 T+xKxDLzwCFhJUjJTwFOsF2Abcnjl0ydWb5ZnFly6S0uHgAWkBlg0BUhPy7FwOB1HpbD
 N97rT8UPhOKUFthAyaO60Zc/HT/0Saeq1JNHhAzKBRYl1dtc1mWkFbURNjv3P8xAHw82
 +ermdFE+lPRlFNFTZJ+9ap5GmkX4vlCnObhMsaENfJz7ufGZq6PuVznY7bXhtwNnuSlh
 gzrDV1H39/dy3gPFBzEz+vUTUQF8XKnLgMP9hYfjXBpMN0Gp9/PhYPQuK7rFBzv8nCea
 VuyA==
X-Gm-Message-State: AOAM532a9OXsWuvzcUtJVKYdin+FIomJsOIqIQjNGB5jNM4HYBT85f1f
 3NpICVE4buX+snpUlwZPgoufNjHL7HmRmZG5
X-Google-Smtp-Source: ABdhPJwqiqrwuFA8ldPfTA4eLi6WWCwdFj3miRhMphKLzJx0RidwCQ/YSHY1KpEnHBleD2cSIPo+5g==
X-Received: by 2002:a63:2a88:: with SMTP id q130mr4543808pgq.169.1636447412035; 
 Tue, 09 Nov 2021 00:43:32 -0800 (PST)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com.
 [209.85.214.180])
 by smtp.gmail.com with ESMTPSA id m15sm1804604pjf.49.2021.11.09.00.43.31
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 00:43:31 -0800 (PST)
Received: by mail-pl1-f180.google.com with SMTP id v20so19653609plo.7
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 00:43:31 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id
 cz16mr48697933vsb.9.1636447051587; 
 Tue, 09 Nov 2021 00:37:31 -0800 (PST)
MIME-Version: 1.0
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-7-conor.dooley@microchip.com>
In-Reply-To: <20211108150554.4457-7-conor.dooley@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Nov 2021 09:37:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWWzQE7Pq8Qo=Vt3ey-ODhnP9B5+r==fsoK0miDv7-arA@mail.gmail.com>
Message-ID: <CAMuHMdWWzQE7Pq8Qo=Vt3ey-ODhnP9B5+r==fsoK0miDv7-arA@mail.gmail.com>
Subject: Re: [PATCH 06/13] dt-bindings: rng: add bindings for microchip mpfs
 rng
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Mark Brown <broonie@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
 Lewis Hanly <lewis.hanly@microchip.com>, daire.mcnamara@microchip.com, 
 Atish Patra <atish.patra@wdc.com>, ivan.griffin@microchip.com, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-rtc@vger.kernel.org, 
 linux-spi <linux-spi@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Bin Meng <bin.meng@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_004334_342315_5A183531 
X-CRM114-Status: GOOD (  25.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Conor,

On Mon, Nov 8, 2021 at 4:07 PM <conor.dooley@microchip.com> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Add device tree bindings for the hardware rng device accessed via
> the system services on the Microchip PolarFire SoC.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> ---
>  .../bindings/rng/microchip,mpfs-rng.yaml      | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>
> diff --git a/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> new file mode 100644
> index 000000000000..e8ecb3538a86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> @@ -0,0 +1,31 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/rng/microchip,mpfs-rng.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Microchip MPFS random number generator
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +properties:
> +  compatible:
> +    const: microchip,polarfire-soc-rng

"microchip,mpfs-rng", for consistency with other bindings?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
