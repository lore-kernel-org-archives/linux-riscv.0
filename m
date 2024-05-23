Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA77C25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 20:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wCfAnuv/8E76z/3+PAQUVT8ypAHHJsGYdeImSF/GWno=; b=luzY2YCWFIQkUA
	NXJU5mWQDvrTj8OV3JgTt5sFm8XJWWGq6lArKfTmAKDHXj3y20yIB4ThBDl70y98AoTL7Bt+yAsTo
	POY+Y08LRAkb9a4Rnl7DWSbvADsu4ci/bosDiBwplIOwtxbbnA34zeVztgPkQncjrn/XYYeQhnjsQ
	rVb4AfbIXLJaCn1vIZhATKf5F0TFbf3ilqH0Zwyv+DXyTx7tI6Mh5uxjMLAWL+NGrZVqgVGIjgAxp
	RBN0LXTupOlg4JRMxVUkwER6B6m6nxYRJapgRlQxKKzVqWgRb5IjLZ2BIkPUJOCk7Vps+ZeXKDB6b
	tPRP8WTA9RHudp5bVpdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAF2K-00000007Fdx-3K8M;
	Thu, 23 May 2024 20:27:40 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAF2H-00000007FdF-49lF
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 20:27:39 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-354f8a0cd08so1525847f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 May 2024 13:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716496052; x=1717100852; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4mCYQOucXHkzPzuxeSXoj7RNoEsjBU+3ZqxpnS0/TLs=;
        b=G7IHyFP54sBP7/hmOu77UizPdgaNhaqFCIKVm6GZCeyjFRf+fT7RhFe2A2htTxofEz
         8IY/AtKSiHmxIsVbO+GunbkgtZ5E7riNEbQQM37TaH3hPwymKrDxH/zyXyz4tlLp9p3r
         xf2agnqXqhsO5Lz4OCL7cti6WDhfkknfUEM3VWbPZa2jvZRW9dpPd9PhUO5LFmc/Nmyy
         d9EuA/Zpsb0C4twgSy8eRv56za9Zw4wA8t9Qeg5B5QQQ/rtpHoGVP6ZJG6LdPL6Yxu0C
         56ZWECDBbQCsI65C+ZL0L9dGDlHxaOpbnEHtb69bwQt4XfTSsHcipK+NwYDgaBUrC3nc
         nQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716496052; x=1717100852;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4mCYQOucXHkzPzuxeSXoj7RNoEsjBU+3ZqxpnS0/TLs=;
        b=tK4BzCare37ZBKWnBvTy31R8QFQMHBHZlx3MuVGW1OGQi4UHT7na3U/ZEwX31SCbct
         lwT/kOajNKbBBaRn7ZV4MeV55lallA1W2ZE7f8Gvz2gG+zwW8QtZ3cs/ppyi8zAO9agG
         1aEwdYNVfURZ/ozeVEF2cqDIPF7e4izijmFbqt5DxfwoBE+PRSu1TECx1aaseMAuv163
         wp6CamFGgPytenSkw7R4z7e6vRlSziy0IZcTzaI7dlZNsQ6Cb8ehsd5dMHx7yet+vMAz
         tlGG7BxmgxGReUrpsqQjb33qgWaUOSMsTtEbXa9aawib+bLHAJczyMFV67+GHmdwfVb3
         ROOg==
X-Forwarded-Encrypted: i=1; AJvYcCVMGW3zySjXDrWmWjW/waeaYuWSteOnWGvw/WsjQGnMITqpdf06I+CiIYiTEhc/IN5BMuTH35ertZPmW/PZ75zltMAxNS4mWrMpVP2/rkzs
X-Gm-Message-State: AOJu0YzmH8jtoPsO7QPubPbwesNBK0WzlW7AlyPOdBP07B3zHt/B1glm
	rAXyvBYSx9Udgw9RPW4UYn61jnB/+4Hz+L44vU13qc3qXEde++DVXRGma19ju9g=
X-Google-Smtp-Source: AGHT+IHkQxdVhHRUF2A3htjJRXvtthNPCjIjURm8kPBRBUe1GbHeUrZg7uMBl5UoYMDjslbgpN7p3w==
X-Received: by 2002:a7b:c40e:0:b0:41e:1bc1:36de with SMTP id 5b1f17b1804b1-42108a03095mr1484915e9.26.1716496052347;
        Thu, 23 May 2024 13:27:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c817974sm6629166b.25.2024.05.23.13.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 13:27:31 -0700 (PDT)
Message-ID: <0ccbc35a-434a-47cd-b54c-02fec2cd9ccb@linaro.org>
Date: Thu, 23 May 2024 22:27:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: add Star64 board devicetree
To: H Bell <dmoo_dv@protonmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <IPHlm5mOKUzYfwGy0auyufx-oPkSrtQjUjiQLbtvspD69UPX9O98iB8P2mqM8ahNaerz0yUa009f4XABRniq7aj2PUp83hbRVVhhKmqT0Ss=@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <IPHlm5mOKUzYfwGy0auyufx-oPkSrtQjUjiQLbtvspD69UPX9O98iB8P2mqM8ahNaerz0yUa009f4XABRniq7aj2PUp83hbRVVhhKmqT0Ss=@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_132738_131963_D8632D36 
X-CRM114-Status: GOOD (  16.71  )
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

On 23/05/2024 21:06, H Bell wrote:
> The Pine64 Star64 is a development board based on the Starfive JH7110 SoC.
> The board features:
> 
> - JH7110 SoC
> - 4/8 GiB LPDDR4 DRAM
> - AXP15060 PMIC
> - 40 pin GPIO header
> - 1x USB 3.0 host port
> - 3x USB 2.0 host port
> - 1x eMMC slot
> - 1x MicroSD slot
> - 1x QSPI Flash
> - 2x 1Gbps Ethernet port
> - 1x HDMI port
> - 1x 4-lane DSI
> - 1x 2-lane CSI
> - 1x PCIe 2.0 x1 lane
> 
> Signed-off-by: Henry Bell <dmoo_dv@protonmail.com>
> Cc: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/starfive/Makefile         |  1 +
>  .../dts/starfive/jh7110-pine64-star64.dts     | 62 +++++++++++++++++++
>  2 files changed, 63 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> 
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
> index 2fa0cd7f31c3..7a163a7d6ba3 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -9,5 +9,6 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-beaglev-starlight.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
>  
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-mars.dtb
> +dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-pine64-star64.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> new file mode 100644
> index 000000000000..c70fffd51181
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> +* Copyright (C) 2022 StarFive Technology Co., Ltd.
> +* Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> +*/
> +
> +/dts-v1/;
> +#include "jh7110-common.dtsi"
> +
> +/ {
> +	model = "Pine64 Star64";
> +	compatible = "pine64,star64", "starfive,jh7110";

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run `scripts/checkpatch.pl --strict` and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

> +		aliases {
> +				ethernet1 = &gmac1;
> +		};

Messed indentation.


> +};
> +
> +&gmac0 {
> +	starfive,tx-use-rgmii-clk;
> +	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
> +	assigned-clock-parents = <&aoncrg JH7110_AONCLK_GMAC0_RMII_RTX>;
> +};
> +
> +&gmac1 {
> +	phy-handle = <&phy1>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";

Status is the last property. Please read DTS coding style.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
