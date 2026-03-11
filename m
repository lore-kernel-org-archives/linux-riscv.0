Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890611125865
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 18:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zc1j+y88e6sFNXWrsxsezOM09wmqC32FwWaPFFz8ces=; b=Y9/obaYgHEDJLp
	oNIS/tjBlu0KrCf+LxixfkSYC0+8kwjz58xZKTlf1cGu1SmMhAN16B+4IiE6YugW+fN46Mx/XmuDD
	4KZVTUPnRr3iVfvalW+3YxY0qNWxaaS3M35B43xQe3G/ni5kYRfx9ejTlx062EtECcXyx8yc2FbRr
	9Duzb1fuvzjLNwlEEfBNFEydwPr2rGuyqahlLBJ/4HZaYh2QvSYx+p9foCPHFZiAA9GdSWXkUHNP2
	MX7WB+qE3bYwbLq/sW1eJ3RcuCga4PkXFarwCpXI7oMAkAisdPuKyBdlWknnPsWS7ezYG6RI3fLrn
	iAwr7MousOTSYo1wKPMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0OHh-0000000CB0W-2wDC;
	Wed, 11 Mar 2026 18:27:53 +0000
Received: from mail-qt1-f170.google.com ([209.85.160.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0OHd-0000000CAzP-2o19
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 18:27:51 +0000
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50934b8ab60so13328391cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 11:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773253667; x=1773858467; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C4T3EYxVrqjxWDRGqLWvtRoRBBjnZaG3jGkRoHcrE0E=;
        b=ZYh3rhSp6G+mrjYAdRdg6cwl0/89/xzus3LzW/9dt60QOtByNihQ2pnH1cY5LuOZAc
         +k5PjRdpniCy0mgsPhdF6MhCvyOVu80UVvAM5f9uZUbj4xLchSwjklmiBYMwiJRV9heW
         vBTFu3q90THULb7MjANLglSf1jG65+UwbNt679bn7RJJ6ymw5VE2BqUqtoOFl6w4nghE
         JaGLImR3qD4B9amxRZSVlHg32CubtslaJqMPRoW7bB8KXzSVGL4mC5xy7fXEn8u7iIU0
         MzJ2IbnYPtg8aqfyWcatpSTHRKut68f8XSzptuq5pbTy8VOlY7lSIWL0jyeMM9nkBV/W
         oO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773253667; x=1773858467;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C4T3EYxVrqjxWDRGqLWvtRoRBBjnZaG3jGkRoHcrE0E=;
        b=NCVuPq+Cc5UApTKCjSt4yP3LleHuzxmJ6RYAiVy8NyILTdzoxNV6UALWv0ziSo99r+
         IwrKkzqxe5xguC+YGNMAtdDlA2PBFtD99zhrFGZEsUnUIhgeCrPVXG2U8k4XyEGYo5Gh
         j4aHAA9dHNfGSaNgEIMKpmgprJYPWYdcbAOFXKhAY8/z+tJtnAiQ0QitJMv8zdMtut4I
         4PwTrs4fNnAIORDwOU/pwGngb5zzuUjWbnAEOyufvxqQ79Zd0JiL0l/Sod5/BDcVSjHq
         8F6ZPWGqWlnnIBFLNkRX/f8Pa9I5NCMEbRJiYk3u7Z6N3BK+oDy11Eg1JQe9p+SngQGN
         Ne/g==
X-Forwarded-Encrypted: i=1; AJvYcCXTUF1wT/v1unPjFlzxCrgEN6AATFmrTjRCKM4cbVw5j5DOff9FNYGAF1QmLPvvcXzI+aFstcdXZGawdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiJWQ63H0Yu169OiDszyDYuGW3V1q5JKpZkK60svFJucMY12o7
	UMtsUVKg1+4Y62snM4dIyyoyr+lbsUMnj8zEC3e4HhOjqsB2auk/T4awLQ45djaWaRg=
X-Gm-Gg: ATEYQzxaWhWrC4a27t/0Ws0oroN4CSXWU1hSiODfIG0SnwIDzoTYOefVTROxU5IyRtZ
	KqKrAuYgWJmRNactgf38+LwTo4jJDjUK/vQBZ/pxPK3JKaieblcyu23LaotW34aKkhTyBFC9W7R
	dcXUCPUh8sKr8Aqkd/B58Gxsn4Rb54WJlJbzcpoL1IjmOOfH9sOmx+e2bjzc6vflfYlPON1FWcU
	L0J+IlINJ+yx7bjqYwxCUYnMtzRrHzJYnDrUa63kczfj4AqJhjn4e4R+grDIYziFkTNt1ZmL5bW
	XSCknSar1S8rBCSC/jZ5dOL+8pCipRi1+R0oVHWn5lviMBYpacgtoxhYAoLo9mMp3Oko4DstfWC
	JBTJbhuBfhMj6qUuZ1ncgv1XN+1WI6JYimxgV3QmfM+O79fLkuM+nQ+HxYCIz88Wf+ZO53jDv88
	k3BQA7l8cWEddevN30JU9yvgch1UFaDr+BIYDidaemQmc1xwg5RAV438sFb8d2QBbOJquOSviRg
	O9lRzbU0j/oj5o=
X-Received: by 2002:ac8:7d91:0:b0:509:214a:e521 with SMTP id d75a77b69052e-509471aa41emr7984991cf.10.1773253667086;
        Wed, 11 Mar 2026 11:27:47 -0700 (PDT)
Received: from ?IPV6:2001:1970:3847:e000:4c82:63a9:39e9:5c17? ([2001:1970:3847:e000:4c82:63a9:39e9:5c17])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65beb4b3sm19327296d6.14.2026.03.11.11.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 11:27:46 -0700 (PDT)
Message-ID: <8e91c86d-ea41-4535-a7cd-5b602c546cb7@baylibre.com>
Date: Wed, 11 Mar 2026 14:27:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Trevor Gamblin <tgamblin@baylibre.com>
Subject: Re: [PATCH v2 6/7] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC
 and power infrastructure
To: Iker Pedrosa <ikerpedrosam@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
 <20260309-orangepi-sd-card-uhs-v2-6-5bb2b574df5d@gmail.com>
Content-Language: en-US
In-Reply-To: <20260309-orangepi-sd-card-uhs-v2-6-5bb2b574df5d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_112749_970676_32E795DC 
X-CRM114-Status: GOOD (  13.90  )
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

Hi,

On 2026-03-09 07:40, Iker Pedrosa wrote:
> Add Spacemit P1 PMIC configuration and board power infrastructure for
> voltage regulation support.
>
> - Add board power regulators (12V input, 4V rail)
> - Enable I2C8 for PMIC communication
> - Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
> - Set up regulator constraints for SD card operation
>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 7b7331cb3c726f11d597f81917f3a3f5fc21e1b9..414b03f5e6480f05f5d7eeaaa0afb4e86425ae36 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -19,6 +19,25 @@ aliases {
>   		ethernet1 = &eth1;
>   	};
>   
> +	reg_dc_in: dc-in-12v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dc_in_12v";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
Is this the correct voltage? I don't see a 12V rail in the RV2's 
datasheet, and the board's specifications only indicate a 5V USB-C input.
> +	reg_vcc_4v: vcc-4v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_4v";
> +		regulator-min-microvolt = <4000000>;
> +		regulator-max-microvolt = <4000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		vin-supply = <&reg_dc_in>;
> +	};
> +
>   	chosen {
>   		stdout-path = "serial0";
>   	};
> @@ -92,3 +111,32 @@ &uart0 {
>   	pinctrl-0 = <&uart0_2_cfg>;
>   	status = "okay";
>   };
> +
> +&i2c8 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c8_cfg>;
> +	status = "okay";
> +
> +	pmic@41 {
> +		compatible = "spacemit,p1";
> +		reg = <0x41>;
> +		interrupts = <64>;
> +		vin-supply = <&reg_vcc_4v>;
> +
> +		regulators {
> +			sd_vmmc: buck4 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-ramp-delay = <5000>;
> +				regulator-always-on;
> +			};
> +
> +			sd_vqmmc: aldo1 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +		};
> +	};
> +};
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
