Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA942C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 10:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8k28fhmPlw3Vz97HViuNM7OLQpc+itjCYX/5KKUoq1U=; b=jAnv2ZQgOdbuUq
	qq9JVMvLgQ9S1cnpyoEaZav4aqpaIUQKIAQbaIFJo0G91DZ5dtyB+15680Qx2n5pibuMFjY0NE3sm
	8JgJYey78Yc5FS6CdNQo26dhY6OXpSVvWuptOD6FxJWCpI6I2X32Ocx/pfexY0ubX1rdnV2ItDx7+
	kfmhO+QOY0tmlUhZqLwcAVqWoL01CaKpM8oqkUzeaeMvEtpfeItLh5PZXnpM/ZcECxbOAI9Mv1vUj
	x2c2ZAryegzvy+6GeqR6fal/fJJxRjr6Sty/Dxon4Xqh8y08tGDl79JWcW/KAw8qQWhuVDkHx8MIX
	dOXKzg7pnm127CxTalsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3kr-00C7fD-Mn; Mon, 21 Nov 2022 10:10:21 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3kp-00C7e8-4M
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 10:10:20 +0000
Received: by mail-lf1-x12c.google.com with SMTP id r12so18111541lfp.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 02:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yts7SFQTOzD/Zmg+pBx8VAiiYiBWh2/r7q0385trxog=;
        b=HIPCJCLb4vItCW6ypgokSruO/dw52ZPFFUzEkKdTzelE6YiuhqCaDNssRbwZFd3h1l
         x+ubADq1KAhDDWg9+y9JMPFNdKfgUdvS16KRlY0lByvvx2lrlJPbluLfK5ya3zQP5tVW
         XfyNq1V5XpMNeblDgRBPCDMi7tmTtI7CvgGQwPVhlgewPk6yd45Fjor/djLQu9OqmdN9
         v7C2svCocSZJWJonsqcSOlsZojaRAJioHQhndmnRSRYI2YrzfUW572nUr4CfDy2CkDMh
         QaDQTzgRLr5iJx59vyQGrYP9p523iU2UyigISbU2X2QxV6CVoTveZWsFy58fCaU450sK
         5CtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yts7SFQTOzD/Zmg+pBx8VAiiYiBWh2/r7q0385trxog=;
        b=ixtDfHKFSYlrWyMoNsvcFwsbiH3lvprS1+skt/jGg3ZjOlmS2iiTk5NEsVfqqQ7Shj
         hqL1DQzIbBLLaKGkSdNlQaODWZIe1M/f3QpShJ7/QXodtoFvGOxpXwOH5AhefiScQ/W5
         ozuj2F2abduciRoJ5Bhc9A2G+xAmCWo4IvKCrOokh+DCToUD0ogeEoIMpLAecmrLGdHF
         JZEkPX8Kaw8DNQa7BEEMAkZtem/wGvJ/KccEor8qEX68ObxypgxPROE2dJx/hoCf/ZPi
         1kh123JCf129TiV/UCO0Vw9RSuvLfq68z5STiXDmQOy2vY7M/ogRJhlyuEJuRmWpccUw
         TnXg==
X-Gm-Message-State: ANoB5pmJvOQDRHX+KScJh4AJXTrRKGIlsx5FcpK8dVufAsyDgFJIDNuj
	wqLWfMpoMuOuDQ971VdZQ2efVkfJJ42vnZKe
X-Google-Smtp-Source: AA0mqf5GAJIM1z6ZAoGTvS5DKX4b9e6G7EJ/wZ8M/Mz9jOSEoYVWXxpxsOnBEgyrX2uxxAh9Fa4lZA==
X-Received: by 2002:a05:6512:708:b0:4a2:6d30:fef2 with SMTP id b8-20020a056512070800b004a26d30fef2mr367826lfs.324.1669025417695;
        Mon, 21 Nov 2022 02:10:17 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m7-20020a056512358700b004b4b69af17dsm1961156lfr.214.2022.11.21.02.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 02:10:17 -0800 (PST)
Message-ID: <a712462b-5039-dfc2-b8c2-5a447128dc56@linaro.org>
Date: Mon, 21 Nov 2022 11:10:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 6/7] riscv: dts: bouffalolab: add Sipeed M1S dock
 devicetree
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20221120082114.3030-1-jszhang@kernel.org>
 <20221120082114.3030-7-jszhang@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221120082114.3030-7-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_021019_206471_07CCE9A1 
X-CRM114-Status: GOOD (  14.68  )
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

On 20/11/2022 09:21, Jisheng Zhang wrote:
> Sipeed manufactures a M1S system-on-module and dock board, add basic
> support for them.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/boot/dts/bouffalolab/Makefile      |  2 ++
>  .../boot/dts/bouffalolab/bl808-sipeed-m1s.dts | 30 +++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/bouffalolab/Makefile
>  create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dts
> 
> diff --git a/arch/riscv/boot/dts/bouffalolab/Makefile b/arch/riscv/boot/dts/bouffalolab/Makefile
> new file mode 100644
> index 000000000000..42e17e1a97bd
> --- /dev/null
> +++ b/arch/riscv/boot/dts/bouffalolab/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_SOC_BOUFFALOLAB) += bl808-sipeed-m1s.dtb
> diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dts b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dts
> new file mode 100644
> index 000000000000..64421fb2ad67
> --- /dev/null
> +++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dts
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +/*
> + * Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "bl808.dtsi"
> +
> +/ {
> +	model = "Sipeed M1S";
> +	compatible = "sipeed,m1s", "bouffalolab,bl808";

Missing bindings.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
