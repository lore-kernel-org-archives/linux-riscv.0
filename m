Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCA1C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 11:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Oa914R6uSMiaRK22IPxd9OtzYBRvi8D0VsJir/y3Jg=; b=0YEtDim7TfOWm9
	YEyU9VjvnEvQc2EpNV6+hJZfiUcCFmP9zgs+zQTc1LwQB2tJMDRkHkpxm3N7ephyvYck5onGnRrqM
	9EWztr1xL+uHf18Cc2IT8z/wmWjMJaozOfyrHQ8aOHrBCbjwm8fOUSqVJPeJlgNj002+cKHUZiwRZ
	lJ5+n3HHeB3i2/9sAatS/G9b5i/tLU2gEZ3OmVESt5crd9jEo2LSx1Y2w1YjCkrT1UN6HASiHjMQn
	2c7Cf3NqNIVkx5YrUXQDJIg2LqhUL3Rt4iiX0dAYqF1NtaI3KEbcTNg7AzE2eRvMqHcL8pIt7T6K9
	fcQyO1rsnLIAJ8o3tpjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neF0g-00DpeF-1I; Tue, 12 Apr 2022 11:48:38 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neEzK-00DozU-WD
 for linux-riscv@lists.infradead.org; Tue, 12 Apr 2022 11:47:16 +0000
Received: by mail-ed1-x536.google.com with SMTP id v4so8504357edl.7
 for <linux-riscv@lists.infradead.org>; Tue, 12 Apr 2022 04:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3ZBe2UI/IslnMm4vNrYAyeJAKr/XzcUBDJoV5P5TXjU=;
 b=xkxq5K+M01SnEpi+OkJhINz4GSKGG/aUwqkC4DIdbkHMKJSDsNkfQ+mTXEm3JkkRNs
 ToP/S5th556ebhMJoQh89oOI99MBU5GenL/Ccl2Mf5tePNKjz7c7T8UJEagM+3BQkm7Q
 o9VwQQjoG3XDuR+tgiDlMhGGxheK9IJbbB/zdhrl5i5YbyIHlkiyN3eEOORUTG8jr8c+
 fQyqCxi7q9Smombr50+qnFomVnveH32fO0fhGrFLCxmP8b87yrhB2WR/UUgjzJ15e2Y1
 upE1/C3EkwqwFm/qf+uvr5wY14I84kJ/GuBEF3srrHQIbPsyHuX78oBs/KyI9SnPN2fY
 eG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3ZBe2UI/IslnMm4vNrYAyeJAKr/XzcUBDJoV5P5TXjU=;
 b=cwOzMFGn4YJUw6450hDEUFgzkJdzc8TcprkD/YYDLcR133ztkSUEGa4uNGKZ0vIoGy
 riKK0TBKooyN2Fp7uqE0yCuumAn19OcLREruLo+L1E/ExYO3qRWf1LFzWGW12oTGBlAJ
 v0wfyyIT2rDS4Z8pKwTxgjAFbv/wNsqdxet3Oz2ljafOcVctETYak63GoYCtWnf9FSKK
 Gu4g7gLL9NQxTjxhhwEUbgpSAwGApGVWt+MHu5mTc3/WGYwBGP1Jdwo6f4nkQusYIkzj
 Vw/5XYimXfT7vrGfFGtYBHCzHTDWV8ssHWYp4DMaNKxUGvFCWtIMKzzE3UXg6jdiJfci
 Uomg==
X-Gm-Message-State: AOAM532z6XZ8gVU6X2FTxSbgL/nnfyCIDX7REqDWRvsMWXDURE3g+oVJ
 Rmab/0ExqrJXMOEnobOVT1/B3A==
X-Google-Smtp-Source: ABdhPJyuM+yTwaajJ+f4BiBiRxF6twYTWCzCNDEU3R6vTPvPXkK55R8XhnK/ZwOuefqSsHqlU2ULJg==
X-Received: by 2002:a05:6402:42d4:b0:416:5cac:a9a0 with SMTP id
 i20-20020a05640242d400b004165caca9a0mr39147459edc.86.1649764033740; 
 Tue, 12 Apr 2022 04:47:13 -0700 (PDT)
Received: from [192.168.0.195] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 lb4-20020a170907784400b006e0d13f65e5sm13067104ejc.167.2022.04.12.04.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 04:47:13 -0700 (PDT)
Message-ID: <d49f38e7-5fd9-4e9a-cc20-2c839eb53712@linaro.org>
Date: Tue, 12 Apr 2022 13:47:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 5/9] dt-bindings: clk: mpfs: add defines for two new
 clocks
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 palmer@rivosinc.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 robh+dt@kernel.org, krzk+dt@kernel.org
Cc: daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220411085916.941433-1-conor.dooley@microchip.com>
 <20220411085916.941433-6-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220411085916.941433-6-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_044715_107732_CBDF1F05 
X-CRM114-Status: GOOD (  16.92  )
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

On 11/04/2022 10:59, Conor Dooley wrote:
> The RTC reference and MSSPLL were previously not documented or defined,
> as they were unused. Add their defines to the PolarFire SoC header.
> 
> Fixes: 2145bb687e3f ("dt-bindings: clk: microchip: Add Microchip PolarFire host binding")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  include/dt-bindings/clock/microchip,mpfs-clock.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/microchip,mpfs-clock.h b/include/dt-bindings/clock/microchip,mpfs-clock.h
> index 73f2a9324857..3cba46b9191f 100644
> --- a/include/dt-bindings/clock/microchip,mpfs-clock.h
> +++ b/include/dt-bindings/clock/microchip,mpfs-clock.h
> @@ -1,15 +1,18 @@
>  /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>  /*
>   * Daire McNamara,<daire.mcnamara@microchip.com>
> - * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
> + * Copyright (C) 2020-2022 Microchip Technology Inc.  All rights reserved.
>   */
>  
>  #ifndef _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
>  #define _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
>  
> +#define CLK_MSSPLL	34

You have some weird order here. Shouldn't it be under CLK_RTCREF?

> +
>  #define CLK_CPU		0
>  #define CLK_AXI		1
>  #define CLK_AHB		2
> +#define CLK_RTCREF	33
>  
>  #define CLK_ENVM	3
>  #define CLK_MAC0	4


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
