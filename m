Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C720C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 14:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q4UOmovhJMOWtui0LpFtzjNaX1Q8JeKtxRxHNNCWPvE=; b=Hp0wxl9nP/5UyZ
	CVd13/4poDAyE1OZ2UZs4WwitnX5YOGAv0CSwaok7BXc89A7en50xPa1rMXSJZOX/FnIikGClBfKr
	StzoPLvcaaRl5oyFUikxeVTLqDlYaJzzzPqIX9wIVWVWlAsOlfvPdfNfdmzpTC7RyMM+nRC/kdChw
	LCytIX7EI+budLPzm/zOql/hIH6rZ2L5xSCepIt0cvb9CN938abaPYs0KF0vPOc/iqdpX7LpEJSOe
	i4oW+Kr35HEKp2dARB/UvxmkVorTLjw8gHFkf2PgDUV/DJYZeT4oNLgAaZbSONFLnWSzHTZoj7Yhl
	6dgC2VnDhMV09trHnAnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFxqE-0007VQ-2G;
	Wed, 20 Dec 2023 14:46:34 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFxqB-0007Tv-2W
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 14:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703083590;
	bh=/9ZkXTPBAbpS5HHi1uX2hV2E8187O/n+9qHuDOsquXs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dYHIEosQMzFCxEwKxk9ybMdZvjawnoTjbsUieYfYSEuoY+2U7pumu+hDFpU4bHWQM
	 imn5P9bVsOmFMSu+kgW300Lz+++WwaqRQhapkgU1K8bojQcIOvAkUt9emxa7z1V/JB
	 j63+cl1q3k42I9b3E/lVGF+fsrEkcmxCxVloKv6AfQAVuIHEXvHFULcHL6XUPQZsrc
	 zBxJAQF1X0l/AWo93E50i9+WAsR5vjpm8+1jI5SaaOKbEMVkXDZm/+bV06yZnY2mvD
	 /iZIeqb5IYnrEQaSRWS2pyV7UULp1YVXL4gzZgylTpcOUnoHL0gohPqG7unjADNSFc
	 MgodlqrdUfaEg==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2D9C93781478;
	Wed, 20 Dec 2023 14:46:29 +0000 (UTC)
Message-ID: <73dc7954-f005-4806-b7c0-a4d8a267de7b@collabora.com>
Date: Wed, 20 Dec 2023 16:46:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] riscv: dts: starfive: visionfive-v1: Setup
 ethernet phy
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Jacob Keller <jacob.e.keller@intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kernel@collabora.com
References: <20231220004638.2463643-1-cristian.ciocaltea@collabora.com>
 <20231220004638.2463643-4-cristian.ciocaltea@collabora.com>
 <CAJM55Z-CWHs1XMOYLOYQmB8qjZ=a3fhyGv3hJAN7bbbDQdEy0g@mail.gmail.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAJM55Z-CWHs1XMOYLOYQmB8qjZ=a3fhyGv3hJAN7bbbDQdEy0g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_064631_947563_F6020C3F 
X-CRM114-Status: GOOD (  16.24  )
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

On 12/20/23 15:48, Emil Renner Berthing wrote:
> Cristian Ciocaltea wrote:
>> The StarFive VisionFive V1 SBC uses a Motorcomm YT8521 PHY supporting
>> RGMII-ID, but requires manual adjustment of the RX internal delay to
>> work properly.
>>
>> The default RX delay provided by the driver is 1.95 ns, which proves to
>> be too high. Applying a 50% reduction seems to mitigate the issue.
>>
>> Also note this adjustment is not necessary on BeagleV Starlight SBC,
>> which uses a Microchip PHY.  Hence, there is no indication of a
>> misbehaviour on the GMAC side, but most likely the issue stems from
>> the Motorcomm PHY.
>>
>> While at it, drop the redundant gpio include, which is already provided
>> by jh7100-common.dtsi.
>>
>> Co-developed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>> ---
>>  .../jh7100-starfive-visionfive-v1.dts         | 22 ++++++++++++++++++-
>>  1 file changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts b/arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts
>> index e82af72f1aaf..4e396f820660 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts
>> +++ b/arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts
>> @@ -6,7 +6,6 @@
>>
>>  /dts-v1/;
>>  #include "jh7100-common.dtsi"
>> -#include <dt-bindings/gpio/gpio.h>
>>
>>  / {
>>  	model = "StarFive VisionFive V1";
>> @@ -18,3 +17,24 @@ gpio-restart {
>>  		priority = <224>;
>>  	};
>>  };
>> +
>> +/*
>> + * The board uses a Motorcomm YT8521 PHY supporting RGMII-ID, but requires
>> + * manual adjustment of the RX internal delay to work properly.  The default
>> + * RX delay provided by the driver (1.95ns) is too high, but applying a 50%
>> + * reduction seems to mitigate the issue.
>> + *
>> + * It is worth noting the adjustment is not necessary on BeagleV Starlight SBC,
>> + * which uses a Microchip PHY.  Hence, most likely the Motorcomm PHY is the one
>> + * responsible for the misbehaviour, not the GMAC.
>> + */
>> +&mdio {
>> +	phy: ethernet-phy@0 {
>> +		reg = <0>;
>> +		rx-internal-delay-ps = <900>;
>> +	};
>> +};
>> +
>> +&gmac {
>> +	phy-handle = <&phy>;
>> +};
> 
> Alphabetical ordering here, please.

Yeah, I wasn't sure if the ordering is more important than having the
referenced nodes added before.  I suppose there's a need for v6. :-)

> /Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
