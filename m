Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4C5C36008
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 21:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2AAU7RQbbg1ox83cdFFn2NUqERuc87f3PEHCbjZkdBY=; b=ngAkxm/0CqhECK
	Ex1+Ah+css3s99dm9GkCdL/bEoAFuMg09A9razJIqfk7eU/GZIvsq0i6fPTmqI2ZB3I9LPFFiYuGM
	quo8NOevQuYynNgni64Kji6p/oSreHDrlChjR02PK1Za6wTWjkgyMEvm5WIDkQsl09/dXwmST7Cu4
	SmYu9FLF7Jn/3Sbf//fa609/cV+0POkK41Am8yTrQV3wKCHIsS2JtxhYmXerkMtHNyrzAfZB+SYbU
	6MdhuEttEl4gcx6HP/CsjphZ9JPTcqIvjm1uXJnOyctSr7/NQ4k8O90GnVgUcxwIHLo51rrIhCrft
	nEjhtqflmo13Hjw1Vcvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txBgZ-000000072qW-1Nwh;
	Tue, 25 Mar 2025 21:19:47 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txBgW-000000072q0-1I4q
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 21:19:45 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-85e15dc801aso510908239f.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Mar 2025 14:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1742937583; x=1743542383; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mKG8KtS1PtfoFoAQY05FHNouuuEBpDMQ8ANK42hHsEk=;
        b=XGRmu/Rtd6oAoNT9fcjECofm5mb8G3LFBk7mLzhz9qBGQoTZAoqudKPuzgrAE3GQbE
         JJ9a6lYvISOmsjm9MQrvERGGzLIOCkgM7jTDnIkCLtVCWbRaPvXACEqXt+j5DOxi6loq
         3ZCPF6wtNVPHI0RnYzwoe86PLgL9VSFvjbTyLmC1I/iGERNbcSddS8Ualm5zLd55jOvQ
         B2S5ZN2gByeE2uUKge0RPAJsBJbw7uVpjU4LBRBij8oEjhHxmqkCaONKco8BP5IhmUgy
         pp2U8WA/OLY06VT8No4a5xVgX1syANFgKM7Ef7wqxZzjRN8tqnbOZE8PSxebRtzVm714
         RH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742937583; x=1743542383;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mKG8KtS1PtfoFoAQY05FHNouuuEBpDMQ8ANK42hHsEk=;
        b=kA58vQXpdTxb49GHtrbPwJn85P/HQ4PLvG1gm432ynXufFFUCqaM1I4w2I5/rXzOiJ
         JSwVzBbaHTqQzDOjcp6tyvbtpZOrLsn+nm4qtLXHwzTXUlMnXm5rk+C6vAU7p2pzqOMC
         2Kyk2xIa2CRlCJQMymlMrSSAWV2X4OoBLLBcgn88qN6GtZ1hF78t6AwZaLpEdx+BwNy/
         LK9tdUrTUK4AwlH84HCfTuwI2JBsvDA68sWqI8dL/VqlM/uNK23wv+Ug3IOMpf/90zd4
         quzVSSYLYYrIP6XDNvWpC/LhREF1OGyodjFjvgD65K8g9/nCYEOAE62k6ruc5xE+P5ss
         noxA==
X-Forwarded-Encrypted: i=1; AJvYcCXxFqKVLZgIcQLqP0CXykqcd8BG6DSebojnFXBm453fvGuOXJwcAphjtcIQbWAT85v4Lu+Wvm80jVC9lw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyB2GUwh0GlfiuHFLVgd7/Khx7wmNjFRBZkKltgfJZjLciOmlG9
	83/CfiktmQLRwIp2h09dgkXOK/bzbSSlterUrxz8Wqv5ntDmUYn5n1hh134gT1k=
X-Gm-Gg: ASbGncvni/iOhn+b2yFBuP5nHNi0vv8+cLDKX+a0D4rnzgcp9jreY8DbH4ymUoOoytb
	H8DX9L7VCDeKsInC/478/UWa0mdDsfCBCTmS1OPtVh73c9QR1UE8AFqRMwsLU/1pE1He2N2F0v8
	Q8YgNZ2u4c013nxNhWP6YcmnXDIZFB3fZ4Uz8tqkIAAtOs6eGPKx02JTQ+f2ohHCRmZCWzppR1P
	M7pmeHE7uM+0w12ULBVE9RPr14XcTHH/wnAq3aaRZ/pivaKzuoZ3Bgq8xdpSC72atLQTQOwj3GZ
	jxQzIKOpRjMob2irCu97jevWcFtgip6PZmJvK/wRCbRNwiz8lAVCe/0ex1a9Gg==
X-Google-Smtp-Source: AGHT+IFJ9ei+dbxpqumX89NY7ke1+osmRH5g+C2Bjhwac4EqYyI6bFrpBXPDDYMUEUIaTXB7SW5t8w==
X-Received: by 2002:a6b:6806:0:b0:85e:2e53:ed27 with SMTP id ca18e2360f4ac-85e2e53f5e9mr1462507639f.3.1742937582760;
        Tue, 25 Mar 2025 14:19:42 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.166])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbed215asm2531270173.136.2025.03.25.14.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 14:19:42 -0700 (PDT)
Message-ID: <4a45df45-b2b1-4da9-b829-c5310cf32b5f@sifive.com>
Date: Tue, 25 Mar 2025 16:19:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/4] ESWIN EIC7700 pinctrl driver
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>,
 Min Lin <linmin@eswincomputing.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, =?UTF-8?B?6bKB546J5p6X?=
 <luyulin@eswincomputing.com>, =?UTF-8?B?5a6B5a6H?=
 <ningyu@eswincomputing.com>, Lin Feng <fenglin@eswincomputing.com>
References: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_141944_364293_C0724B0F 
X-CRM114-Status: GOOD (  16.74  )
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

Hi Emil,

On 2025-03-25 9:13 AM, Emil Renner Berthing wrote:
> Hi Pinkesh et. al
> 
> It's great to see you've begun upstreaming support for the EIC7700. I
> read some of the data sheet for the SoC and noticed the pinctrl is quite
> simple and could benefit from using the same model as the TH1520 pinctrl
> driver. This version should do the same as the vendor driver, but in
> less than 2/3 the code.
> 
> I hope you'll consider switching to this version once the basic
> support[1] lands. This patchset also depends on that series.

Thanks for your efforts here. We are working with ESWIN (CCed) to simplify and
prepare their driver for upstreaming, and we have ended up with something
similar to what you include here. We were hoping to send out a first version of
the driver soon. There are still some differences between the two drivers, so
ideally we can coordinate on which series to move forward with.

Regards,
Samuel

> [1]: https://lore.kernel.org/all/20250320105449.2094192-1-pinkesh.vaghela@einfochips.com/
> 
> Emil Renner Berthing (4):
>   dt-bindings: pinctrl: Add eswin,eic7700-pinctrl binding
>   pinctrl: Add driver for the ESWIN EIC7700 RISC-V SoC
>   riscv: dts: Add EIC7700 pin controller node
>   riscv: dts: eswin: Add HiFive Premier UART pin control
> 
>  .../pinctrl/eswin,eic7700-pinctrl.yaml        | 141 +++
>  .../dts/eswin/eic7700-hifive-premier-p550.dts |  46 +
>  arch/riscv/boot/dts/eswin/eic7700.dtsi        |  17 +
>  drivers/pinctrl/Kconfig                       |  14 +
>  drivers/pinctrl/Makefile                      |   1 +
>  drivers/pinctrl/pinctrl-eic7700.c             | 802 ++++++++++++++++++
>  6 files changed, 1021 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml
>  create mode 100644 drivers/pinctrl/pinctrl-eic7700.c
> 
> 
> base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
> prerequisite-patch-id: 2e5cc67f66a8cfe463ec73b98cd17130d4094a86
> prerequisite-patch-id: e39d6867f89c605fd1e3621937c8c91a6cfbe7c8
> prerequisite-patch-id: 5d2232bb3ce3d7d4e23477c2ad3db30424fee33c
> prerequisite-patch-id: 946719f43a0cc23ffe82e996e076de2221dcd8db
> prerequisite-patch-id: c2c2bc1b676b1e15165e107515b380318e9ca941
> prerequisite-patch-id: aa4a955dd99d0796973fedb78bea269ebab73b6b
> prerequisite-patch-id: 1cd27ddae721cc1e6c52723f8b360b09b5e712c7
> prerequisite-patch-id: 237813218e54e0c7cbed8d72e30eb649ffd9ecd4
> prerequisite-patch-id: 8e687755e898e71c80b0294b90deac71fe05c421
> prerequisite-patch-id: 05622d10a27ba9cba36b3d194e51a2d8d7b7b783


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
