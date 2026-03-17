Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4404FFD7099
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 20:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FshqxyPs7pDymcdS8ZtCaJdZAhnl3ZXMTt7ZSnWBaQ8=; b=kIDAsdwq+8ocF+
	s4k6wxNkUcgkp2ldP5OKl2as4cxznrDTTFUGF5+IErf7xuxkLPAnggAGG437LqC0zL41I69jHe4Pq
	kXhDpbkeK6DBUvo0RMLrTa+fPis46wG8FEiConcVKK51UH6bGo9eTnix+37BeelaR86kATDOFMi1G
	r1wADnMOSEpS06AAieJkPuuMi3c5auZmRvWDkyBVIUhnvDbokattrIeivVcFmPHbRCR1uVm83jv0d
	3T35QIYK/GWCrwWEDkILo9xnBK9lcUtULw9YaHRCTG2aLGgMlZEGtwJODW9N6PprQ54NBIM+WIdih
	J3lsr6Ci9PAFSkEKVkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2axw-00000007CHk-1KQ2;
	Tue, 17 Mar 2026 20:24:36 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2axt-00000007CHI-1I7y
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 20:24:34 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-505a1789a27so32341351cf.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Mar 2026 13:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773779072; x=1774383872; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mH049RaW0O4+GDFr4LRnFBkAFDmCy+4RM4isbdlqWYE=;
        b=OdSMgpSCIW0fU6ZYKPDDJDaPi1ef2rhWMryARkObM6cn8U65Qta7mdI9Blai16/ilE
         QZrC/0yl6n02LaI4ILVzzWTKccDMZBBj73E65b2Lcd3Tv+nRIID8cFymG+ezg2SJk2LU
         54VGYt1myPT7Fd1oT0yv+puBg3HJukwpJYG1lDTSix2bG7RmgDWbRI8TDxPabRs1cbzr
         ZXHBi24/KJCDI1q5fFi1dOLXBIn01wsQ3T0O7ZxgiLbygbEZG51Gigc2gao2Se73Q7G3
         IXZKWZiA8UHlQYYR+UXNpaR/p2rq8TqkB6SKmc/TWORB1rAZr48KEcCHQT8K0Y0aBNtD
         ncQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779072; x=1774383872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mH049RaW0O4+GDFr4LRnFBkAFDmCy+4RM4isbdlqWYE=;
        b=IDZa5hL3kibMaW19F2qiDZE9wdb5XfGPVrazT/N63fj/ZX9bSPuCXSxMmjQwy+zJyE
         YWsvN+Fmhpxaz/gX3/QzQDIRidRu8UgoXGQpO8hBUzzXfPRkyoEPHpuv7Mg6YhOftKSx
         fUakOqCx1zsbcohNtnxhDFhlatM1MXxC9eEJPICoxUn8F6Jw32y17W7WOddkpnx5LYJC
         oFmBzWZRKVTrWYJdPOX8Pg9nEbeitXSd26S28h5kykcX+e7IWbi6tAaMEn9x0siD+Eh3
         HiNjZOEJ0q0yjjfcoAavSWbYJhWbc6dRWPSRkR7I6IAAD4xoXB1JK3fStJhBHL0hr4v7
         DvLA==
X-Forwarded-Encrypted: i=1; AJvYcCVyP8/cQrSie2z7FdUnbDrB02WZmKuFgoRYb+yauTdaCm62w5w0bnuo71BvcmExcOUXAJqYM0yqWGIWUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBHvYdTHN/WdR5+aunHiGlAFCMdAyA+3bc3qUlkft9sQD3AOIA
	zn/hDeteXc5TYsp1oaG8YQ+CJ1bbZ2iK/U3wxWSL8Z1W1GaukzRQRZ+cRU96E9f84mU=
X-Gm-Gg: ATEYQzxLRmOarnFEFKWWtYIlb5LO9bXAVW/o4pi4VdQOuqYEcxn6jrqIGife4KllrH8
	epQhI2EGR+nxZlvcxD3SRsWRnxosmcqvrYvFujLF23vnM3ToPpLd/kWhULvavvcuTHmOVSLaS9Y
	9MmDoT22g5TvAcx4aHhWTXmG0Twg0ypcgBQk63mOY1HjAFiuNPNd27mzkiXF2FuLjvf22muwIlj
	eX0c55eROMel/rgTUXvkirBq3ZWDa66Z2ZxX7039f7MGeeqihM0X9dkuCNu4DHtBeZmp4f/9lIS
	Co6Gjd1FfUc/tNK0uHquJtv4uEpMln4OIa6DJzgTqC8sxaOSW7GTV2hMkvj26oQ3kKW5gBAPGUd
	aMRS70NojaD0be4BoL6+3lW/92ZsHAf+JH8Iwu8juao80FU0qu+irT5XFFL4s1Dds8plWTtKkPW
	VvAkVuVAtom8/uS8lZ1kAwWuzt+Zbzjj4Ebjm38KW+twcr6dgGyculP12n6d+CaFzIv+K1yJ/vn
	t1E
X-Received: by 2002:a05:622a:41:b0:509:372e:35f5 with SMTP id d75a77b69052e-50b14887949mr8987231cf.55.1773779071676;
        Tue, 17 Mar 2026 13:24:31 -0700 (PDT)
Received: from ?IPV6:2001:1970:3847:e000:4c82:63a9:39e9:5c17? ([2001:1970:3847:e000:4c82:63a9:39e9:5c17])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b135b7e50sm6479901cf.22.2026.03.17.13.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 13:24:31 -0700 (PDT)
Message-ID: <6635a48f-e7b6-4f5d-8285-cb1149754cd1@baylibre.com>
Date: Tue, 17 Mar 2026 16:24:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC
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
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Anand Moon <linux.amoon@gmail.com>
References: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
 <20260316-orangepi-sd-card-uhs-v3-5-aefd3b7832df@gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20260316-orangepi-sd-card-uhs-v3-5-aefd3b7832df@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_132433_366650_A6EF3DF6 
X-CRM114-Status: GOOD (  14.54  )
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


On 2026-03-16 10:03, Iker Pedrosa wrote:
> Add Spacemit P1 PMIC configuration and board power infrastructure for
> voltage regulation support.
>
> - Add board power regulators (12V input, 4V rail)
> - Enable I2C8 for PMIC communication
> - Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
> - Set up regulator constraints for SD card operation
>
> Tested-by: Anand Moon <linux.amoon@gmail.com>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 7b7331cb3c726f11d597f81917f3a3f5fc21e1b9..f1533c99881dbf38e16cff5e91e33253cfa7a56d 100644
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

Hi,

This still shows 12V instead of the 5V connector listed in the board's spec.

I was able to test it without issue, but this should be fixed up.

> +
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
> +			buck4: buck4 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-ramp-delay = <5000>;
> +				regulator-always-on;
> +			};
> +
> +			aldo1: aldo1 {
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
