Return-Path: <SRS0=GwCz=SY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85307C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2019 13:40:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5552B20652
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2019 13:40:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uhrSwGjr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="My2PGPbk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5552B20652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4aslyCC90jUJyXZAjE4PWHqfhyiT6OjUxzDbsJh1ST8=; b=uhrSwGjrudnMQA
	n5r6DZNA2kKyIYdjqebBZlyWNiMqPeKCB6rJgFgY8iRwp50Js8mSxisoa/rFAUUx+g157iBFJlu8m
	5NBaPz4IfWMgTLSWRlwkaMFkaZWTGkohp+98cAuWE4GkCQOqyozmEVOtWo1PJ/zJOWhsHGG3Xktzt
	rCmEtTNYsPMHetlbV5Oh0gI9aqKK0H8Lda7dfzRu1pEBBssk9Ay1jQ6F3yMZTHgOTGdfh73Zy4JrG
	JY0r7JvJ10Zx7bJH3LY+Oepe12pmbejzIzbcsqc5LumzqRSS+myv/hNLpNqOfCgqfxaonWNb4Gcmh
	wnAGok7iIwKm6f8SvXNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIZBG-0004rC-6e; Mon, 22 Apr 2019 13:40:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIZB3-0004cn-BV; Mon, 22 Apr 2019 13:40:10 +0000
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72ED620881;
 Mon, 22 Apr 2019 13:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555940408;
 bh=bELYdU20kXQtDdCJx2stGpStz6flReMe7DNfqabCDSw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=My2PGPbkXCN4LcbRO+ur4ALNmcWs7R/0sVpBLZ6fg+7oDi1f1mW+2PTVxD8BrYShp
 YdAI4c8CC1gQvI9vug0zovFU92nZk3gBO4EL14lxzGAEIEIaaqMOMxfM45N2wR4YkD
 gK9nFJa9y/6ioF8BQDA/6oacjKjrESdTub0RNWLU=
Received: by mail-qt1-f170.google.com with SMTP id k2so12084700qtm.1;
 Mon, 22 Apr 2019 06:40:08 -0700 (PDT)
X-Gm-Message-State: APjAAAVYdGb9c0Bkn73zDg4bGjJPGXAaaVdxW+OdosG+FM48Vl4sTTd9
 xS4J7ezq4xQfCc/eSC9cp7yo0TnLwM84YuwsZA==
X-Google-Smtp-Source: APXvYqwKjV1O7na+j0LqP55p9ndz4b1/75v+MoEkHCD9LkbBe5OX/XaNqaKC4DAJuhhamDRIPnBAv8kHguPSsvhIkqs=
X-Received: by 2002:ac8:610f:: with SMTP id a15mr7923908qtm.257.1555940407602; 
 Mon, 22 Apr 2019 06:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190417165514.18689-1-angus@akkea.ca>
 <20190417165514.18689-2-angus@akkea.ca>
 <20190418151350.GC32345@bogus> <79d43377285d6897847ac1452afbb18a@www.akkea.ca>
In-Reply-To: <79d43377285d6897847ac1452afbb18a@www.akkea.ca>
From: Rob Herring <robh@kernel.org>
Date: Mon, 22 Apr 2019 08:39:55 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLZwUWrLO-m4BC6vXjBVDyY7hf8LE-amyDNgaJz3-=n0g@mail.gmail.com>
Message-ID: <CAL_JsqLZwUWrLO-m4BC6vXjBVDyY7hf8LE-amyDNgaJz3-=n0g@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] arm64: dts: fsl: librem5: Add a device tree for
 the Librem5 devkit
To: Angus Ainslie <angus@akkea.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_064009_430250_B0D16B65 
X-CRM114-Status: GOOD (  26.69  )
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
 Marco Felsch <m.felsch@pengutronix.de>, Guo Ren <guoren@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Thierry Reding <treding@nvidia.com>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, angus.ainslie@puri.sm,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 18, 2019 at 12:44 PM Angus Ainslie <angus@akkea.ca> wrote:
>
> Hi Rob,
>
>
> On 2019-04-18 08:13, Rob Herring wrote:
> > On Wed, Apr 17, 2019 at 09:55:12AM -0700, Angus Ainslie (Purism) wrote:
> >> This is the development kit board for the Librem 5. The current level
> >> of
> >> support yields a working console and is able to boot userspace from
> >> the
> >> Network or eMMC.
> >>
> >> Additional subsystems that are active :
> >>
> >> - Both USB ports
> >> - SD card socket
> >> - WiFi usdhc
> >> - WWAN modem
> >> - GNSS
> >> - GPIO keys
> >> - LEDs
> >> - gyro
> >> - magnetometer
> >> - touchscreen
> >> - pwm
> >> - backlight
> >> - haptic motor
> >>
> >> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
> >> ---
> >>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> >>  .../dts/freescale/imx8mq-librem5-devkit.dts   | 833
> >> ++++++++++++++++++
> >>  2 files changed, 834 insertions(+)
> >>  create mode 100644
> >> arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> >>
> >> diff --git a/arch/arm64/boot/dts/freescale/Makefile
> >> b/arch/arm64/boot/dts/freescale/Makefile
> >> index 0bd122f60549..c043aca66572 100644
> >> --- a/arch/arm64/boot/dts/freescale/Makefile
> >> +++ b/arch/arm64/boot/dts/freescale/Makefile
> >> @@ -22,6 +22,7 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-rdb.dtb
> >>
> >>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk.dtb
> >>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
> >> +dtb-$(CONFIG_ARCH_MXC) += imx8mq-librem5-devkit.dtb
> >>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-rmb3.dtb
> >>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-zest.dtb
> >>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
> >> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> >> b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> >> new file mode 100644
> >> index 000000000000..846a72dc7640
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> >
> >> +&usb3_phy0 {
> >> +    #address-cells = <1>;
> >> +    #size-cells = <0>;
> >> +    status = "okay";
> >> +
> >> +    port@0 {
> >> +            reg = <0>;
> >> +
> >> +            typec_hs: endpoint {
> >> +                    remote-endpoint = <&usb_con_hs>;
> >> +            };
> >> +    };
> >> +
> >> +    port@1 {
> >> +            reg = <1>;
> >> +
> >> +            typec_ss: endpoint {
> >> +                    remote-endpoint = <&usb_con_ss>;
> >> +            };
> >> +    };
> >
> > This is wrong. The graph should be between the USB controller and the
> > connector. The phy is not involved.
> >
> >> +};
> >> +
> >> +&usb3_phy1 {
> >> +    status = "okay";
> >> +};
> >> +
> >> +&usb_dwc3_0 {
> >> +    extcon = <&typec_ptn5100>;
> >
> > extcon is deprecated and you should only have the usb-connector
> > binding.
> > From the controller, you can walk the graph to the connector.
> >
>
> I not sure that I'm clear on what you mean. Here's what I think you want
> it changed to.

Yes, this looks correct.

>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> index 846a72dc7640..7b8770fdc5fb 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> @@ -755,51 +755,50 @@
>   };
>
>   &uart4 { /* BT */
>          pinctrl-names = "default";
>          pinctrl-0 = <&pinctrl_uart4>, <&pinctrl_bt>;
>          uart-has-rtscts;
>          status = "okay";
>   };
>
>   &usb3_phy0 {
> +       status = "okay";
> +};
> +
> +&usb3_phy1 {
> +       status = "okay";
> +};
> +
> +&usb_dwc3_0 {
>          #address-cells = <1>;
>          #size-cells = <0>;
> +       dr_mode = "otg";
>          status = "okay";
>
>          port@0 {
>                  reg = <0>;
>
>                  typec_hs: endpoint {
>                          remote-endpoint = <&usb_con_hs>;
>                  };
>          };
>
>          port@1 {
>                  reg = <1>;
>
>                  typec_ss: endpoint {
>                          remote-endpoint = <&usb_con_ss>;
>                  };
>          };
>   };
>
> -&usb3_phy1 {
> -       status = "okay";
> -};
> -
> -&usb_dwc3_0 {
> -       extcon = <&typec_ptn5100>;
> -       dr_mode = "otg";
> -       status = "okay";
> -};
> -
>   &usb_dwc3_1 {
>          dr_mode = "host";
>          status = "okay";
>   };
>
>
>
> Thanks
> Angus
>
> >> +    dr_mode = "otg";
> >> +    status = "okay";
> >> +};
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
