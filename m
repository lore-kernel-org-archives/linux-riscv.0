Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A41C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 00:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NefJeqnRjb4Q4O0xlnblWHvUmiieKN3uDuG59H6HMPs=; b=OXN1pHk7NEuEBV
	HwrC45ZB+G3WqZ7K535RX6+YuLgcT8z+ScHd+3oZj3r432D8vhcrQT0KQQI1huwwAHNexFBFPfiiz
	IJ9q921FY6PhXjggJv19Gn5PDTchLofpzCEQtegbc9/C6oNXEdDT9NJtGwr0EiBQ7Li0YEPCvo7bV
	P4fPmihZEswCnXWKyXRFzO3wpO7GkKayfpDwQlcTC8VUH8T72QWdQMBpZjFkkWLke18WKc3FzVwFS
	ntJ8L/fPnhOUv+Ewu0aBcO+8Kcu2S56P/YlLfS7VAhdjdHnUsxts8eEKHAasNaUpN3GvnHYNiv2DA
	JsNei0SoDf6dBkHlyBng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj4zC-00000007tHo-1z24;
	Mon, 13 Jul 2026 00:57:30 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj4z9-00000007tHQ-3SFj
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 00:57:28 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cad8076b01so30513895ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jul 2026 17:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783904247; x=1784509047; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rcAmTvO8VZf1EU8sxDKdiXNrU6FxGa8pq7WzxSsB/Lc=;
        b=XtMdxdXJPPo3vPBjlpZ7fRA2EqNnUHsV153+tVr2KE8vKk1TTzeErFOL9ICykEVuGm
         DKyQTsVuR0kdi5ort9e6wKSjskxGBp5UHpFO/YdVMJM8UqZERibfzwpCvgZ2vtjTsr7+
         sUP6Mon3qyDRmja5H91dqmZB7wfJByv44eV87Zua7wZlgUwAnxVBw+biJCUDIm9KqKc4
         /K0B2vvvCXkVScWYEWpjxMOGNd9rABJyc+lRQUzfq/CiCtld0vS6AwK28qSAtGTTB/OR
         a5HQRA4ZmYR7WY4k1xJpPClipUFgbKOQHqVMI2u+pcnXYYN2q2SPvYffdZOS9v1ywzOl
         oq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783904247; x=1784509047;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcAmTvO8VZf1EU8sxDKdiXNrU6FxGa8pq7WzxSsB/Lc=;
        b=jqQEShZt5VfOIBPDlXvH3307sk36GU4dsCDIhnSV8IrHdVr9ughnIjRpMmLtkUCrER
         sxFvRwLzyEy+CUBmqx2HleWEnBIn8Ze2rA8xHvL1XK9kKuhNrRa8epxqj+8Ll79oI2as
         LFZaEYAP7djAYsJe9BVGL1Cu9OYim0R86mbkWwt2iIR8c65Yd62eE9ni+YehLgtHuSOq
         NAmE0umPySw829uzvDLklZnZkvCf4jRcrHQKAQMJZtygLXtNlfzlKHw9ZqdjO0HUP72x
         178JTRl0+nLjfmFi1sguPalJhEu98b2ieDM335mccohTKsbrUvlGvQzswEnOXWohEL/t
         uBUQ==
X-Forwarded-Encrypted: i=1; AHgh+RqxvQVugORmoTf3/XaG+ypQi19vtEMx/5jHY4CaROJJLIR83VRdWxjBWnQR+g1/l/Iy56g996Sw0/4U8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaGPhPorvOFg/kWfRzwNhVRAQ/WDzFZiSryxswQa3QEFjWYRA3
	aoHQR7ZMQYwymjYsiVJQYnQ+BKOHDR0vbVf4/EFUBvbmsa7D4D9grejc
X-Gm-Gg: AfdE7cmPeLt4XgK1y4nC6mcZ85opcdlXllIDlQwYQdgJHcnRfKVwT0qwoIp36cJveI6
	cieoJEGX1lYQmjGgmifAxhD8piySRJpPIr7Obb2P46hb0NTGHZWN05DmTmxJlCH6WO3h94Q1Ffr
	jSMyKD4m1omsLfSus69Ld9jUn/GT/N/Ry2CseFQC/2rKnSnTRVxJe0Sv3FR4XASkrBnK5imwswj
	w1tDfo0P1WxFqBmFzWKyL3uD1Dom/00CSLyGAVVUY3XiHovskCL61kNhGDu6VUbVjYid8pWnmzH
	5LHPFmpuSr8NOcBzMnzx4iK0V5kM6UoxF0wleEp0TElT13aN5Ka/37ValI4g6SbTdDQEpFSgeh1
	/kko8ciupOnJU0GEdY0np7GBEHqFv2xBz8RzFqCDQeIhaUsF2XZJL+OwLnRfTycEt
X-Received: by 2002:a17:902:d2c8:b0:2ca:ecfa:1308 with SMTP id d9443c01a7336-2ce9ead153emr69863775ad.20.1783904246723;
        Sun, 12 Jul 2026 17:57:26 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf92bfsm90539215ad.28.2026.07.12.17.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 17:57:26 -0700 (PDT)
Date: Mon, 13 Jul 2026 08:56:41 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] riscv: dts: sophgo: cv180x: Add PWR_GPIO
 controller
Message-ID: <alQ3mqUPItCP2CVT@inochi.infowork>
References: <20260710075917.159969-1-chenyou910331@gmail.com>
 <20260710075917.159969-3-chenyou910331@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260710075917.159969-3-chenyou910331@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_175727_889902_9620D173 
X-CRM114-Status: GOOD (  17.06  )
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

On Fri, Jul 10, 2026 at 03:59:16PM +0800, Chen-Yu Yeh wrote:
> The CV180x/CV181x family has an additional DesignWare APB GPIO
> controller (PWR_GPIO) located in the always-on power domain at
> 0x5021000. Add the node so that boards can reference GPIOs in this
> bank, such as status LEDs.
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
> The base address and interrupt number match the vendor SDK device
> tree (cv181x_base_riscv.dtsi: gpio@05021000, PLIC interrupt 70,
> i.e. SOC_PERIPHERAL_IRQ(54)). Verified on Milk-V Duo 256M hardware
> via the onboard status LED on porte 2.
> 
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> index 06b0ce5a2db7..25ad2bd265d7 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -160,6 +160,24 @@ portd: gpio-controller@0 {
>  			};
>  		};
>  
> +		gpio4: gpio@5021000 {
> +			compatible = "snps,dw-apb-gpio";
> +			reg = <0x5021000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			porte: gpio-controller@0 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				ngpios = <32>;
> +				reg = <0>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				interrupts = <SOC_PERIPHERAL_IRQ(54) IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};
> +

You should follow the device address order. not by the device name.

>  		saradc: adc@30f0000 {
>  			compatible = "sophgo,cv1800b-saradc";
>  			reg = <0x030f0000 0x1000>;
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
