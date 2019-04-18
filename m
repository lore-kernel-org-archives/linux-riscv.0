Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F27C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 15:14:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02484205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 15:14:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l/Dvd7e4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02484205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4c/tBeIb5+6UZhrKW88nZ/yIfKI18ffy2HDZdh3GGk8=; b=l/Dvd7e46W35zO
	Q324atakhdKesHatXnGURVv6ctI14a9nFTpp94orQ82jJ64YaOqIgix/Nt23Z237X4Fe5FM7sK1sQ
	aq2v5I7SMD57pQrJP59iDwFy/jzQy7FMX+QA5Ktdw5LS05duqs5NcNWSAOQB5KfIgoSMJhi+tJWZX
	bApqUMgya2PTF1Ng3jD7Azdr2bTdjYzk3CtfP7Ut9FGPRnnxR0EF5Dsg9+mJFxQ/54mnO98X3YmF5
	AD1/0Inh8GbqeBXbSFuolunjD0N283618L/B8fV01Z5iVfIMg9Lb6OTZ1bQ3IYj+5ueaAgyVPHjiL
	0Uc1N9tj6ddUmQTqYR+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH8jg-0003YQ-So; Thu, 18 Apr 2019 15:14:00 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH8jY-0003Qb-Tk; Thu, 18 Apr 2019 15:13:54 +0000
Received: by mail-oi1-f196.google.com with SMTP id j132so1897691oib.2;
 Thu, 18 Apr 2019 08:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=57cZv0GFINjsjL8/kTD208X0YWPfWCuS73Z4VQYZBu4=;
 b=PfzBhPDRoW72vyrTN4wMoqBZkU2ArVABcP60TpHkbJ7Mbq/X7pgo3ioNQN8pSRwS3B
 +jNX7Jh0tMPUGsYY17bRA+PblihH9fuUGVOVU6thMNEbAJ64ighUId/0OYEJuwnklx4f
 tlc9/bkMgWC5qfKCYMH8Hz6OdL/YCxH1n+WAWd0POr6eYfHqDrGew/7yV0FfVSbhD0kA
 7yOPC7Q8HuT7mUvHKEdCGODcIYwW7E3Q9p05itdRjn1cZVfSwadt9JTDFZPO97g8S7Y3
 vuLsNvQxUGYkPY/3dvholoXZERdYfD7nM7QVKPlfBEBMa0DwK4ZBpyHyugLj3sI1ezs9
 Wggg==
X-Gm-Message-State: APjAAAVhwS4hmvzIJ60yrp7Tr/pdV5LxgzL9TnxVJucAElYZy/EDlbBC
 6qyaEMtf+dqiIkCGjvywwQ==
X-Google-Smtp-Source: APXvYqzFZClK1vNKk4T6avmyuJPkz3DuMp8EXTHWML2zHX3a3oLa/rwYbPNetMtF9KCAwLIRuC8lFQ==
X-Received: by 2002:aca:c7d3:: with SMTP id x202mr2119620oif.48.1555600431909; 
 Thu, 18 Apr 2019 08:13:51 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 66sm1054406otc.25.2019.04.18.08.13.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Apr 2019 08:13:51 -0700 (PDT)
Date: Thu, 18 Apr 2019 10:13:50 -0500
From: Rob Herring <robh@kernel.org>
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: Re: [PATCH v5 1/3] arm64: dts: fsl: librem5: Add a device tree for
 the Librem5 devkit
Message-ID: <20190418151350.GC32345@bogus>
References: <20190417165514.18689-1-angus@akkea.ca>
 <20190417165514.18689-2-angus@akkea.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190417165514.18689-2-angus@akkea.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_081352_958725_665EBDB1 
X-CRM114-Status: GOOD (  19.35  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Jacky Bai <ping.bai@nxp.com>,
 Palmer Dabbelt <palmer@sifive.com>, Bruno Thomsen <bruno.thomsen@gmail.com>,
 m.felsch@pengutronix.de, Guo Ren <guoren@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Thierry Reding <treding@nvidia.com>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Aisheng Dong <aisheng.dong@nxp.com>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 angus.ainslie@puri.sm, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 17, 2019 at 09:55:12AM -0700, Angus Ainslie (Purism) wrote:
> This is the development kit board for the Librem 5. The current level of
> support yields a working console and is able to boot userspace from the
> Network or eMMC.
> 
> Additional subsystems that are active :
> 
> - Both USB ports
> - SD card socket
> - WiFi usdhc
> - WWAN modem
> - GNSS
> - GPIO keys
> - LEDs
> - gyro
> - magnetometer
> - touchscreen
> - pwm
> - backlight
> - haptic motor
> 
> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../dts/freescale/imx8mq-librem5-devkit.dts   | 833 ++++++++++++++++++
>  2 files changed, 834 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 0bd122f60549..c043aca66572 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -22,6 +22,7 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-rdb.dtb
>  
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mq-librem5-devkit.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-rmb3.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-zest.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> new file mode 100644
> index 000000000000..846a72dc7640
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts

> +&usb3_phy0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	port@0 {
> +		reg = <0>;
> +
> +		typec_hs: endpoint {
> +			remote-endpoint = <&usb_con_hs>;
> +		};
> +	};
> +
> +	port@1 {
> +		reg = <1>;
> +
> +		typec_ss: endpoint {
> +			remote-endpoint = <&usb_con_ss>;
> +		};
> +	};

This is wrong. The graph should be between the USB controller and the 
connector. The phy is not involved.

> +};
> +
> +&usb3_phy1 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_0 {
> +	extcon = <&typec_ptn5100>;

extcon is deprecated and you should only have the usb-connector binding. 
From the controller, you can walk the graph to the connector.

> +	dr_mode = "otg";
> +	status = "okay";
> +};

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
