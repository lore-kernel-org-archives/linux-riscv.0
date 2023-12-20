Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257CCC46CD3
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 13:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3STEcT2DA7oU5P6HPxbIj5hlYsMOQBQJ7lYuXAB1E+M=; b=jAVVuwhGbgc22akmf5wD/wMiJR
	jv1Ag+CAnK8qAuMFeUTF14Ek5ETKTMsJb2A0byxQjdZ0GEW1MBa5j4YjAwKjQBKt8//VIWaG0tzDO
	lv7OOzbd/nVj78JDL2hZbGzYcR3RvKrFg7dd8eC6tDUViqgYG1D64QLmbaMuaIJk/p8bKLdGrl39G
	yVRIgIe5Tcw8oWrVTBN++pTlmn8NW/dmJL/k3LhoD8hGgofdGEjn7H5FnhGPw0zEEXnMKGkz0tcxw
	djVS6hsHn0qRtVo7X8oKwE7uTj1rJy1Y4ep6gJI/QF5H/4xEdcEI8he4BieBlMAHai+PpRCA6Oo6I
	KzJsU+YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFww4-00HZDb-0F;
	Wed, 20 Dec 2023 13:48:32 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFww0-00HZBS-1h
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 13:48:30 +0000
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com [209.85.219.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D73123F45F
	for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 13:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1703080106;
	bh=cLKk4FLFKZPRJCthkwAAXukNGNTHJtGoc9bArlIgi7E=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=qxxP/xo7cvOnM1juZZr26+NntHIMVegsp4Wq31JF5Tu8muRM8t5aG9NOB8T1pMvEK
	 70u6nh/3MeyurL9bqrQbdxzV/+XFI9z8S1Mhw+HwCaiz+zj6B2yp/gIFvbJEz9Ml23
	 pZaYcYU4+9gXsSYACFm3gCZPmZWiMNtuHTVy4fKWHYjvfVzs5+oenAmGXdpxseKw81
	 WHt67g/tCXIR8KXG/bS0q4wgeHMCY9iZXPbVC1i+Yrnl2rCziTNbdb9D80O0mTn6Ch
	 zMX2I8YtEG06yxXBxIrRy0VvGWEmkGVKqsz2jesbjg3P1AccwZiRdiSRseGBKvPlx6
	 YfYow+OdLG55w==
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-dbdaec8fa3fso639831276.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 05:48:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703080105; x=1703684905;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cLKk4FLFKZPRJCthkwAAXukNGNTHJtGoc9bArlIgi7E=;
        b=gDqJxYsD77F8vIu/4u4FBeVg7Ke99nLGgnqMSjF0+XvyqaLEqKsAPgch5uYI1TjG92
         DdZOSv/AOzDw1Tu0NyRtB9w1aJpvIpv4FPGFlJ++sjLKu5WArT6QPnJ2hRUUIRkS4RtO
         8HXrfbA9JZ/2hBHFn0SEXu3A0R4+/ZdP/8exvF9YIjXHzdzO72Phz0pwRTLnhb5v1IkG
         qL7GHSxRvq/RSitn3IXopWLuqaDHXwq+NVzhEdv5JH+AiWFe8GuRd6pDRzQCD/zTSsUC
         95bjAdKBRt4CdfHm6ax3ess4Y8zylqaLZ8DCo7S3GcXJHMPr2ViQ1NFw07PA/iFjEqeJ
         kJ2Q==
X-Gm-Message-State: AOJu0YyddXUmAGRoOLzN1O25K2Qq3F2vMpTYfGQ7x4ijMVV6qiAvyfHC
	QN3HspzeVg7kyH6k6OCQlwAOuzvK8Arhno5Dg0NqqdWlEhWMJNhE0XRklBoDU6b1ULVgQPy83V4
	nIIHSJWbKnKi8xjOpvmU5AnQLqO1qrpIZT8hHIXd0Y7ZOxpjO4MEc0Pnw63Rm4fv7lpXP3Q==
X-Received: by 2002:a25:903:0:b0:dbc:dbc2:16bd with SMTP id 3-20020a250903000000b00dbcdbc216bdmr7636390ybj.62.1703080105359;
        Wed, 20 Dec 2023 05:48:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAc0XaKPCbNpSMKwITz2F/kdmz4jNbuavgxZb/kvZBD55MIEy+1R3WMm9C61a7/L2w9ih86rzWOb3+xyezKOI=
X-Received: by 2002:a25:903:0:b0:dbc:dbc2:16bd with SMTP id
 3-20020a250903000000b00dbcdbc216bdmr7636383ybj.62.1703080105113; Wed, 20 Dec
 2023 05:48:25 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 Dec 2023 05:48:24 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231220004638.2463643-5-cristian.ciocaltea@collabora.com>
References: <20231220004638.2463643-1-cristian.ciocaltea@collabora.com> <20231220004638.2463643-5-cristian.ciocaltea@collabora.com>
Mime-Version: 1.0
Date: Wed, 20 Dec 2023 05:48:24 -0800
Message-ID: <CAJM55Z-+2RY+owdd9YJM_CihKqDtAgykSDZN0tLZAGRTRGQhBA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] riscv: dts: starfive: beaglev-starlight: Setup phy
 reset gpio
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Jacob Keller <jacob.e.keller@intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kernel@collabora.com, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_054828_687382_4639C36C 
X-CRM114-Status: GOOD (  10.30  )
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

Cristian Ciocaltea wrote:
> The BeagleV Starlight SBC uses a Microchip KSZ9031RNXCA PHY supporting
> RGMII-ID which doesn't require any particular setup, other than defining
> a reset gpio, as opposed to VisionFive V1 for which the RX internal
> delay had to be adjusted.
>
> Co-developed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> ---
>  .../boot/dts/starfive/jh7100-beaglev-starlight.dts    | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> index 7cda3a89020a..b79426935bfd 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> @@ -11,3 +11,14 @@ / {
>  	model = "BeagleV Starlight Beta";
>  	compatible = "beagle,beaglev-starlight-jh7100-r0", "starfive,jh7100";
>  };
> +
> +&mdio {
> +	phy: ethernet-phy@7 {
> +		reg = <7>;
> +		reset-gpios = <&gpio 63 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&gmac {
> +	phy-handle = <&phy>;
> +};

..and here.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
