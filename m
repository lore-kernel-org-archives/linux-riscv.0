Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B9FC2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 21:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O7uOLvPEamX8IXSf4nhL0FApPmmdS1w+Gi3P5xWii3I=; b=GdRQP/nbnIY99p
	NKdM81ItAFAFVAQgQyWqBYjgT2dOaBiVdvU3foCQOCpzV7T5jsv2javKUCp/MDtqS+MiaWC7DRKY1
	jKG6Wj/tOCJUkJXDMuVQQPBykKRJYmpkaydnz0F81R5nJIn3yn+JhMlINbZT3ts/QVfA4eATvIW25
	a5EzWYgJ7H+YmKylOzAfuQIlFH6jDpurUqjzbsrtYJ2apeD8fieJyowpYeNVYXjJu9hCKP5VOQyxb
	rhGfR31pg/lpiG7pJ5h0+1r6ZgKp2yvS40Q2eSOQmUSNdQZFEhSXLsAFPwTWsTuYq5q2DB8K875ud
	Iwx+BkxrsMVloya+/NFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDjx-00000004Zip-3pqu;
	Tue, 25 Jun 2024 21:30:13 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDju-00000004ZiK-3xS8
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 21:30:12 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2c84df0e2f4so2313196a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 14:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1719351010; x=1719955810; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TQJM0xp8mYLkOXf0VM+GeUZ+q6CrpnIfH8/QAHHq+94=;
        b=MTzIb97C31IQIUfpIrWMVQLgAiTh7J+4utf3IBF7TqWwJHW4ALZSqQEz1cLWffgjRG
         yP5Fhp8inWEXGVVdagEI5ED7EgdMMtq0EWHzJmgmfmu5k1nFJZTeDAuRQrQRTaJ+eWWe
         cCbaDWsfDj5H2QW4inq0AcVZUGhhx84zf1x1UONVbRAqsjy+kZgpZF39NOHlv4IxA0Ld
         JihXVeR3jvHbcf3XFF61/1aektK55yV2wTIIaEzLftRcB39fskEZ/rbzrWud2PboL/0u
         +Wgsi2yAxduNF/af3DjNhR1KHmhdsuBR6lsvKCyWrmzwEBXwMbjhHN+ge26tj5Vn5XZR
         MGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719351010; x=1719955810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQJM0xp8mYLkOXf0VM+GeUZ+q6CrpnIfH8/QAHHq+94=;
        b=rk+zp4cG3c8aI55WWEu+Qt5qPnmqIeJSkpwrHQGLfxjXjgAVA/k0nhDvfoO/lBmknJ
         afdx2tBAV/364JJHMpXO1o5Hon2pETR6Ajpji4Tucz14so+c4QWJXVga3HR8uOOWOK7z
         xQACzDL4Nc7JBjoVClDn+kF/KGBNw115hyYqWexkVnGWB207aalZkf5+bHIoOQIx6zBg
         slHOQNdodXHA6KRDZSTB4GuYXdlKgrfs+85UxcYb7A5K+FAw2H+B0YNuBfg2nJW5aIVs
         3B4QS+1M/TmHPHunK9kPFTRx88jOeJ3sJ+XwuQmRfRocJuHNCEuZfEHdvSECVVKEyr/f
         mTxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDSpfIDpIMnj26D+bnAzl9+u4nnkyYcNIPGfDpKhW+X8YcGiYE8Nw5uNm5q+96IUdENc01+K2PyVVVqC7b7s4m1lcpZwYOSrIK6hk1sJq8
X-Gm-Message-State: AOJu0Yz+4p3+GaDccYPD/W6+RSk7UoBhaXPyxyIYeyBAYMTAjxnf+MCm
	/Dd7LyTZzHyVyxvIckBOIvsH+272y+7H3A4Dc+Sc+04BSZA9MpPj74u33ud5CAk=
X-Google-Smtp-Source: AGHT+IF+HNe0biV4YaXq1Ta4JFB82FlHqjmAKTErcH11CnWEB/zPBSEhSne+xVJYUXesf5Y0b6DRow==
X-Received: by 2002:a17:90a:a00c:b0:2c7:70ba:3f02 with SMTP id 98e67ed59e1d1-2c8a2357c93mr7008846a91.6.1719351009882;
        Tue, 25 Jun 2024 14:30:09 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:efe7:d185:104e:b7b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c8b8332794sm1388752a91.1.2024.06.25.14.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 14:30:09 -0700 (PDT)
Date: Tue, 25 Jun 2024 14:30:07 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Conor Dooley <conor@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/3] riscv: dts: thead: Add TH1520 I2C nodes
Message-ID: <Zns236F7vXPov4WK@x1>
References: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
 <20240618-i2c-th1520-v3-2-3042590a16b1@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240618-i2c-th1520-v3-2-3042590a16b1@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_143011_392210_CC8FFB06 
X-CRM114-Status: GOOD (  14.67  )
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

On Tue, Jun 18, 2024 at 09:42:39AM +0200, Thomas Bonnefille wrote:
> Add nodes for the six I2C on the T-Head TH1520 RISCV SoC.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 60 +++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index d88d4cade02c..f0b2b05e9bd4 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -232,6 +232,36 @@ uart3: serial@ffe7f04000 {
>  			status = "disabled";
>  		};
>  
> +		i2c0: i2c@ffe7f20000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xe7f20000 0x0 0x4000>;
> +			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk CLK_I2C0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@ffe7f24000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xe7f24000 0x0 0x4000>;
> +			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk CLK_I2C1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c4: i2c@ffe7f28000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xe7f28000 0x0 0x4000>;
> +			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk CLK_I2C4>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		gpio@ffe7f34000 {
>  			compatible = "snps,dw-apb-gpio";
>  			reg = <0xff 0xe7f34000 0x0 0x1000>;
> @@ -320,6 +350,16 @@ padctrl0_apsys: pinctrl@ffec007000 {
>  			clocks = <&clk CLK_PADCTRL0>;
>  		};
>  
> +		i2c2: i2c@ffec00c000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xec00c000 0x0 0x4000>;
> +			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk CLK_I2C2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		uart2: serial@ffec010000 {
>  			compatible = "snps,dw-apb-uart";
>  			reg = <0xff 0xec010000 0x0 0x4000>;
> @@ -331,6 +371,16 @@ uart2: serial@ffec010000 {
>  			status = "disabled";
>  		};
>  
> +		i2c3: i2c@ffec014000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xec014000 0x0 0x4000>;
> +			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk CLK_I2C3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		dmac0: dma-controller@ffefc00000 {
>  			compatible = "snps,axi-dma-1.01a";
>  			reg = <0xff 0xefc00000 0x0 0x1000>;
> @@ -405,6 +455,16 @@ uart5: serial@fff7f0c000 {
>  			status = "disabled";
>  		};
>  
> +		i2c5: i2c@fff7f2c000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xf7f2c000 0x0 0x4000>;
> +			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk CLK_I2C5>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		timer4: timer@ffffc33000 {
>  			compatible = "snps,dw-apb-timer";
>  			reg = <0xff 0xffc33000 0x0 0x14>;
> 
> -- 
> 2.45.2
> 

Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
