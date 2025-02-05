Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22202C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 07:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQXmdffnXhdC33DOxcOtsY3s/FN5L4YZx3V//PBt3S4=; b=lbT6KWhoKGWqBj
	TZghoiIDeEzPirXL1PVZkEAQwrJppp+sjap82rp5nBTeoH/ZCfDp8F8GyHWyC3SaP6rZwE58GT3lq
	jeCbge3wJdl5RMkJJwL7koAhSVeOr0vNZxOBn+68f5brgR2LC9+HpJGUgvp5z5Q5dopsDHWXVpPFX
	sNJ0dPx6PPAgb2XIHusjvDtXgCprw5EvDiK4dSvcfCun81qAVPwBBwMNw8vCUuay0x6lZYtDUN67n
	K+DIfFFjbd7sJYV4LZ9AXKnd1iU72KR7vWNv/y2hWFD6L5IKDZplGpTdVgbHOjZWm+XDjXt3c7VUy
	xKFjTQorwn2WXYPHXw3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfaJ0-00000002WyX-03NA;
	Wed, 05 Feb 2025 07:58:42 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfaIw-00000002Wxx-3qnD
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 07:58:41 +0000
X-QQ-mid: bizesmtpsz8t1738742253t7hgm8u
X-QQ-Originating-IP: LhoYFQ+iWEQs6p+Ju1KUL8CfXjPMNyGFDkrdyseJg5Y=
Received: from [192.168.125.117] ( [113.72.145.41])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 05 Feb 2025 15:57:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4618514360899873354
Message-ID: <25B3D8909DBCC21B+43663a76-4afa-44ae-95e2-3a8792de614c@linux.starfivetech.com>
Date: Wed, 5 Feb 2025 15:57:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] riscv: dts: starfive: jh7110-common:
 bootph-pre-ram hinting needed by boot loader
Content-Language: en-US
To: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-6-e@freeshell.de>
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <20250203013730.269558-6-e@freeshell.de>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:linux.starfivetech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: Nng40AJHpBv6Fu2aJymXzS0AhJjJLn2lphaWOVuVC6W/CsVvoOiX1tHc
	KcOwYveyuzl0rtd/49/7st8AVqv8vL1UJUVoTwuRRxv79NydJlNlDPxXy5rySkAuVyA4nb9
	UmIjxpLgonvHAEA89X2g9/SxDTicC0tMJxZ7qKrx/5JdnvMSmxb6Etnxdtten/yR0LYwzeG
	0Zp7Q7gvf8xEIpCvTQ8yrr+omv5Q8ixUGINFCWifrhNmvCpsDR24J8bjT2JgyhYTM+BMDD6
	zXeiyQI80EZXZktVbEqqh/71McBeK9+MyNn4W5GNChWsADUYBOhM0noxpnseG2BXL6Eegy7
	8ROtqpx4WxASxeXNOiqkyYvl/8E9XZCVOrQHQr3l1Hv3cVGmv4/hskaLEfSHl+7N3T3snEk
	F1IcTT5oiVzcwC1JMtXN1FojK3baRDnL0CC9U+REPf42eMDlOQK/p+ORdgnuVOyYLFuY9jL
	ZkGgleDe2aYQN4BxoacXiB+a8012yn9LS2q48YgzsBq+hbnED1Irq4w9y7UYLpd1JHfv31I
	hJr1ZXMre4GdCMjMr1qpRqJTusoytFg+PQrBwmXfTNj86L6bno0wMqKC6cvnWlv6KFQmYNt
	wLSzJqRRkxRUAMa8T6M7JVRiAVK40MVWhXA2Wp+oT22bjlKRz9nPlWOK6M/ydcix5KAOTm0
	Xgg6nMkG5WsjoV+EK+uVHx8n+RxGgwTEVqhMclezGmw1414aIEp0J/PEBSGsrKRIrr7QeN1
	RBo00h6lhJY1YG9WohfhNDUBxYrRtkQQQmB0GZa+Vo8AxhLscjsSM2MJBQKaxqjfKiYvvye
	/2/1NxLqGmqsLxHh1/JkKp3LkZGYpJHzNm7hY3mfFrCJwFRGjFg61t/6VXm3f/apY8RBfRt
	bh5utTd+mFjptQl8kPH7FvEeddYEeovhixfz4fVaJvNr9kz60Dei2TpJpxziQhH17+kEMBG
	Jk+zO3nsmr/k6Nw1UFWmZnH928AUo1W7LfUnFSzIqYGKl8xTb69lKiQNdCDH+j6f3Il8=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_235839_391641_D34B14DD 
X-CRM114-Status: GOOD (  12.80  )
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

On 2/3/2025 9:37 AM, E Shattow wrote:
> Add bootph-pre-ram hinting to jh7110-common.dtsi:
>   - i2c5_pins and i2c-pins subnode for connection to eeprom
>   - eeprom node
>   - qspi flash configuration subnode
>   - memory node
>   - uart0 for serial console
> 
>   With this the U-Boot SPL secondary program loader may drop such
>   overrides when using dt-rebasing with JH7110 OF_UPSTREAM board targets.
> 
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 30c5f3487c8b..c9e7ae59ee7c 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -28,6 +28,7 @@ chosen {
>  	memory@40000000 {
>  		device_type = "memory";
>  		reg = <0x0 0x40000000 0x1 0x0>;
> +		bootph-pre-ram;
>  	};
>  
>  	gpio-restart {
> @@ -247,6 +248,7 @@ emmc_vdd: aldo4 {
>  	};
>  
>  	eeprom@50 {
> +		bootph-pre-ram;
>  		compatible = "atmel,24c04";
>  		reg = <0x50>;
>  		pagesize = <16>;
> @@ -323,6 +325,7 @@ &qspi {
>  	nor_flash: flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
> +		bootph-pre-ram;
>  		cdns,read-delay = <2>;
>  		spi-max-frequency = <100000000>;
>  		cdns,tshsl-ns = <1>;
> @@ -405,6 +408,7 @@ GPOEN_SYS_I2C2_DATA,
>  	};
>  
>  	i2c5_pins: i2c5-0 {
> +		bootph-pre-ram;
>  		i2c-pins {
>  			pinmux = <GPIOMUX(19, GPOUT_LOW,
>  					      GPOEN_SYS_I2C5_CLK,
> @@ -413,6 +417,7 @@ GPI_SYS_I2C5_CLK)>,
>  					      GPOEN_SYS_I2C5_DATA,
>  					      GPI_SYS_I2C5_DATA)>;
>  			bias-disable; /* external pull-up */
> +			bootph-pre-ram;
>  			input-enable;
>  			input-schmitt-enable;
>  		};
> @@ -641,6 +646,7 @@ GPOEN_DISABLE,
>  };
>  
>  &uart0 {
> +	bootph-pre-ram;
>  	clock-frequency = <24000000>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_pins>;

What about &mmc0, &mmc1, &qspi, &sysgpio, &mmc0_pins, &mmc1_pins, &i2c5?
Why not add "bootph-pre-ram;" for them?

Best regards,
Hal


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
