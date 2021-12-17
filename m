Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CD3C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 15:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/s0SbcX6x1Em946Ghom/dvHZmTsmwv3yqApLx+MRqjI=; b=M1PR3SiwYAcrgx
	lhRGswS+CyRcvMxMPMZv6wpL6So3FFpBSX845owSgDNPTLOqf+epOfV534Xn2oncM4ZSYwGyD99jc
	dqRqrkS2QHvrgN0KzFERE2K2litTdeF6vVKMsuW6aZNeB91La1mIETYI0y4KsEjBBTzT17bKAtWPP
	O+aPWfTHTtdnV+ouwl527yJ/kdbCxL8d0/oDo/bPKMfq6AW1A23S4+3cxZk57Z2J/dIWCgmCfkE+q
	A+MSYlsCnJquFxs363cliDyAExaQR6COq/DXqwPoHWI+1cq5LwFWDXwpk2SKTpqSe/Iut7ukzkb7l
	ZSRHIvSXoHUvqgqcYk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myEiE-00Alin-4s; Fri, 17 Dec 2021 14:59:58 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myEi3-00Aley-51
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 14:59:48 +0000
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 009603FFD6
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 14:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1639753186;
 bh=MelU3SMHwWCoWgQGcng8T0F8tu5Ji7Wc6RArgT+BeXI=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=wCu+IukT3BeoOQOYln5UsPTBnwb/6uy0rHdqcBkSBiS+2AzFSHFWwsPy/i9xcerdB
 bgwuarwSdm1e6+Hrm7tkLJu6G8V1HvR4bTvJ2LtvsECXybEHCboMDnowzTy0VN5/77
 UCtzfnW8VZPVLlCH1/R25C89+UlWEhXjgwsAl/R504t9l/l1k9o3DZ3AAZCAKr3FTw
 VXs8ELD/qyFNDb2w2B9gCR/J+3qlhzV/lMV8VKv3MWj8UCwOqFWvDFsYMPaQkFai7N
 HRA6gVKU+KSpcQE1a5mtMNJyh/pSVwacfwVCC26MH08ekkWNt5TWOMfO/QEfwXIWlt
 GEO3hlc4tL1wg==
Received: by mail-lf1-f71.google.com with SMTP id
 o19-20020ac24c53000000b0042521e0675fso1013649lfk.12
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 06:59:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MelU3SMHwWCoWgQGcng8T0F8tu5Ji7Wc6RArgT+BeXI=;
 b=n+Mjd1qrBpB5SHr2GwRj9GN9mr3goMd36K8J8SdkQXZnbmmZgX8ySKtvEEulAPXmsl
 KVbnY78oLkO02s0YjNOuY0FZb1JBXcUtTBj657wcl7mngHy7DMS64+ern+AWu90kketZ
 /r/nDto7u/dDMMG9yK8FjbxyrkZfrHnPgOQYag22CktFMJgsM0An19sZXJx26LQsW56z
 sNXpdyPMkaRv6EHXGXINS5K4PHhczPV65nFw2fd6xXr6hHfipljlV37a1Fk+I/UXnk+0
 JutIA3keQxSjpXmo7lFAq3piMfZo67AnRslqpI1LHK2UIRpBMgutxHGTjhmKiOnwo7KA
 QnqQ==
X-Gm-Message-State: AOAM531xHP1FB+grgBV8pRXdQ3JviDSg08csgDSF2nefmxtfRY0R6RwQ
 L0RpOsHBmAtq1rOZmQQGMIQfQ7oK47qleJPGejPuM8BoIgXZkxSzpqjd98iaCl4cMHd8knRZpsy
 26Fm1Gf2mv5DCkzgYJXCc5oDF1PfG/9rSK7c0dpdGXJi/4g==
X-Received: by 2002:a05:6512:1151:: with SMTP id
 m17mr3312064lfg.414.1639753184827; 
 Fri, 17 Dec 2021 06:59:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwX3iHx/NQRikos1eLTnz73uw8eLg8t6q9e2UaRo1h3MxDjjO6FmRhNO4HZayVZ1aVIIc+2tQ==
X-Received: by 2002:a05:6512:1151:: with SMTP id
 m17mr3312038lfg.414.1639753184651; 
 Fri, 17 Dec 2021 06:59:44 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 bn17sm1751216ljb.22.2021.12.17.06.59.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 06:59:44 -0800 (PST)
Message-ID: <d5c996b7-9ac3-d7a9-4c21-307068afb84e@canonical.com>
Date: Fri, 17 Dec 2021 15:59:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 14/17] riscv: dts: microchip: add fpga fabric section
 to icicle kit
Content-Language: en-US
To: conor.dooley@microchip.com, linus.walleij@linaro.org,
 bgolaszewski@baylibre.com, robh+dt@kernel.org, jassisinghbrar@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com, broonie@kernel.org,
 gregkh@linuxfoundation.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc: geert@linux-m68k.org, bin.meng@windriver.com, heiko@sntech.de,
 lewis.hanly@microchip.com, daire.mcnamara@microchip.com,
 ivan.griffin@microchip.com, atish.patra@wdc.com
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-15-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211217093325.30612-15-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_065947_396349_2BC4F2A9 
X-CRM114-Status: GOOD (  15.64  )
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

On 17/12/2021 10:33, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Split the device tree for the Microchip MPFS into two sections by adding
> microchip-mpfs-fabric.dtsi, which contains peripherals contained in the
> FPGA fabric.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../boot/dts/microchip/microchip-mpfs-fabric.dtsi   | 13 +++++++++++++
>  .../dts/microchip/microchip-mpfs-icicle-kit.dts     |  4 ++++
>  arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi   |  1 +
>  3 files changed, 18 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
> 
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
> new file mode 100644
> index 000000000000..234c1f9bea40
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
> +
> +/ {
> +	corePWM0: pwm@41000000 {

Lowercase labels please, so could be "core_pwm0".


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
