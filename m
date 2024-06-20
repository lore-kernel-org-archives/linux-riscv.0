Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F30AC2BA18
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 23:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJZ9+Jke4Pm0onOoPlAjiLZtAjgaju588JdvoYyT8/8=; b=2l9sj+GDxmauZB
	mVHKFi3kz5OH9xVXHxG5MybZo2K6Zq6Wcd2HUFjTFSG2Zfr4ABud0LgJkv607WWJZCo5kEvphVeMu
	HnHWUnQ48nck8nP2yBzmK9ZXYvGWlz5Te1tEgrxTGfT2/RwMQYr0CAGGQ0DZyW3Tckcdk0WP1ebZe
	fB9w5yGfV3nFCm09H+o8c5TPT8dHjJo2roH8XuN/xkE4r9ewkKR/g0m4SzC6g/redFNpx5zXxc316
	1ArlTRSFwrmwlTsdIGPQlP0bmdZUmhLwwK5GHMpZRB06FC2lMz7VBqtRm5yYY/yOONJ91XzFreyTs
	c4ki2iE3aPSbigCS8hKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKQye-000000075AP-28WJ;
	Thu, 20 Jun 2024 23:14:00 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKQyY-0000000753j-3b0j
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 23:13:57 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 71E5E3FE19
	for <linux-riscv@lists.infradead.org>; Thu, 20 Jun 2024 23:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1718925229;
	bh=t0kBjJJclVeFv5sCLu7ZlbOalZQki6cx+luI1vzwY9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=Ktu5iUuBKr0TvUOSXtqAvCaBi9Nu/kau9hRK8gu5ictjQ61kiWzy7/ZIFwRs4AJRJ
	 ARjXaEQUfwF9mQ9+ilu/TwD8jajOwJW5r5kM/SYh5+AW7veeXMWr++XtkkUsWIgmvd
	 ePXu97sCY94AAbRCPI+KCK/tcuNWv6qg+kSF8OsdNSOUdIfeLC77vOVB7q85Oz8At6
	 sCbfW9YwBMIwFTGhqz4JE07IwG/oNSS17dktVg2rAZ7Td4xSwwVbHaYbSpzOHgOgG7
	 5rwQgU4rtqRaCoUIOTStpcmbprg09ZuJ+1VhmkNcPdaX8lR5yzOxfk3hx5dKlcFR4Q
	 pHXYjN9Md1dzg==
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-421179fd82bso10118545e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jun 2024 16:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718925229; x=1719530029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t0kBjJJclVeFv5sCLu7ZlbOalZQki6cx+luI1vzwY9Y=;
        b=lbM0fZyraA+OUN1qS8jyR3xvtpXP6as9ONh035tKgL5H/maW6WXCW6Sa+5B73RurC0
         bDgQgkbYQ9WQ9l751sJ4xr9YMcOAT80kHcXPfmIGe0cU9PJ/6eC37w1MBsarTO6ZQV9Y
         rYX/CVKXj9prDWh85zHa9kf/4Wy1Xoo8bwbPuD3KG4eLir6Q3g6TYNlW7ju6M3oyw1io
         1JiavWH2/eKyfCqjmlMlXWGcKuX19yTZNp1qnmGIpUOY/M+TXH/VM8dH5qrRvx4FG6/E
         T7cJAtyLS1AUuCyHJE00P9i40a/Q6Rvqf89bci4zpvafeUqmPuaR1Stnms+VCaycQROn
         zikQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT451JhskcST84wX/Buk7J0R8Wvyv+20qfQPRFztxmTC4aS/uvHRV9BQ9x3HmLUQAGo5v5GrbFBtP7Q3P8RpH0i6LhPces+q/tsECkQoXc
X-Gm-Message-State: AOJu0YxgyBUh02aH+ytpwB4w9v+oknu14mqPupRAgWHafS/Zb0RZELgB
	E3aKOY8KFFuA5zkHNv0/pGNjsbNrDsOYbvunM+z3jDAV/gfoU408EWwmxrQ0U2nKetFfq1cx0G6
	mZXAGebf4a/py31cg94C1s3Wo+WYUHZeN2clq6PQWLe1E8956kl6BBWLDZPFs8d/rrfoGn526QD
	z77hx18zai4MmViA==
X-Received: by 2002:a05:600c:5583:b0:422:720a:1bef with SMTP id 5b1f17b1804b1-42475184751mr47390955e9.24.1718925229085;
        Thu, 20 Jun 2024 16:13:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/szjKS05yNUuwLBXEoegmRaYcN/BTF+XSyE2bm4gfonOSPp8TsNZ8tNgl/4SdQCUw8GatIA==
X-Received: by 2002:a05:600c:5583:b0:422:720a:1bef with SMTP id 5b1f17b1804b1-42475184751mr47390865e9.24.1718925228659;
        Thu, 20 Jun 2024 16:13:48 -0700 (PDT)
Received: from [192.168.123.161] (ip-178-202-041-025.um47.pools.vodafone-ip.de. [178.202.41.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248179d3afsm7127015e9.5.2024.06.20.16.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 16:13:48 -0700 (PDT)
Message-ID: <8ceef5c1-03b3-4468-96e3-d86db5434e82@canonical.com>
Date: Fri, 21 Jun 2024 01:13:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: dts: starfive: enable heartbeat LED for Milk-V
 Mars
To: FUKAUMI Naoki <naoki@milkv.io>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, kernel@esmil.dk
References: <20240613024827.36512-1-naoki@milkv.io>
 <20240613024827.36512-2-naoki@milkv.io>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20240613024827.36512-2-naoki@milkv.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_161355_404306_C8AF970F 
X-CRM114-Status: GOOD (  13.64  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 6/13/24 04:48, FUKAUMI Naoki wrote:
> Milk-V Mars has a green LED to show system load. This patch enables
> a green LED as a heartbeat LED.
> 
> Signed-off-by: FUKAUMI Naoki <naoki@milkv.io>
> ---
>   arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> index fa0eac78e0ba..4f4bbf64dbe4 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> @@ -4,11 +4,24 @@
>    */
>   
>   /dts-v1/;
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
>   #include "jh7110-common.dtsi"
>   
>   / {
>   	model = "Milk-V Mars";
>   	compatible = "milkv,mars", "starfive,jh7110";
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			gpios = <&aongpio 3 GPIO_ACTIVE_HIGH>;
> +			color = <LED_COLOR_ID_GREEN>;
> +			linux,default-trigger = "heartbeat";
> +			function = LED_FUNCTION_HEARTBEAT;

According to the schematics the StarFive VisionFive 2 board like the 
Mars board has RGPIO3 connected to a green LED to display the power 
status. Shouldn't we consider both boards?

Best regards

Heinrich

> +		};
> +	};
>   };
>   
>   &gmac0 {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
