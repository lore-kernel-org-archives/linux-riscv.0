Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68778C64EC4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 18:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EyKjVztdhynWGhvQxi7EI/jp1J6sFwbVotF5M4ZmwWM=; b=1MgZ6t+ZHYrDbK
	N8G37E6BS+QSw952bNZ3J+Hl4Ma3KlXUix/NxPToqGoxqSCT4zS8We2DbTd0FdAGby77Bp9OxV1fe
	6o/oYg9XDoz0FQZjGilsi02csIk9yeLemAruHPgl+CSYWEj3ZgP2ygnYJw1oDRndfJW35edOCDbWz
	ngvQoIkmWjDniOs9UTk9/ko8dGxJRANsRrKW1MaXGGIpfyfcPKdwZhKVNOUNHTHZyTakU9rYydEc3
	zMTAd2wViStveIEuAX6HUL9X8h5PF5Q398sUqM22/BDmMhIhQqjBvX415T8zplZcySWTYkCVFmqYP
	iJ5GlR9K0wemUMWJUfcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZFdn-00ENnN-IE; Mon, 06 Mar 2023 18:32:55 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZFdj-00ENmb-PT
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 18:32:54 +0000
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8E19F3F22C
	for <linux-riscv@lists.infradead.org>; Mon,  6 Mar 2023 18:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1678127564;
	bh=uRuGhhJh0B5paspR70yM6+MkAzhmoYmbibaOB25WZSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=LhlKGEJvC/j917zRsSYTrNXw1ryQMQW/oeOJ21V6PGtdMpL+nlFKwqhy/g9MvAKY8
	 TcKy7OIEneVDD/xyRQHzUro9vtKXxcVOPfWDWr8YmkSF1UIHtGLOe9BQ5HZo+dT6sX
	 BZkHvzAhhKfwaxaVpZLkqYCpGGEYlAeUODTMfzJrCFlTOqiA0uDZer8NgmSFNRJE5F
	 VEgOjVhxN5D/h9po1LSp9EDNOgnT8L9+y6tGMzYjEe1+2oyOp8nFyfMfiybOfsx9Ep
	 q0E1Jfq24QD5VF/lkTpA4nLxDTPlBQKdCcfyMh5ObY6MIW7u79hz3Tgo93U+3Savpj
	 qtHvhT6NeodXA==
Received: by mail-qv1-f71.google.com with SMTP id pp11-20020a056214138b00b0056c228fa15cso5980707qvb.4
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 10:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678127563;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRuGhhJh0B5paspR70yM6+MkAzhmoYmbibaOB25WZSU=;
        b=L0cwYkHWkJoiTsUF7qD+2I39y58Uncg3IIwXeTsRDxRUfnTPV+JND64U2j4VRebfi1
         4I+ct0z3DUcwg7+9H5oBbzQrELJSyQrRMpxTmQK82j6kmhqe4HxjR9H871j1V8fXjBLK
         QwzmEMT1MCdrfhYgK3KxWtyTpx9hoy8h6y32Nca31jwBIoNG0pj1pjQSEOajCHnQPs5g
         ME5/vs6kqTTjOg2vw/GmtdYtNsb4f1r1CbAFnzEk5X3cHcyl83VLFtVyhnBiuBX+bzpa
         49zTEB1x5JC9yVGNtK4VPlTNVy8EhwvJp4pmsT3TqC+sCVp6mYg25s7ef2igiKWZnN6w
         DCcQ==
X-Gm-Message-State: AO0yUKV1nlXifTOhHadS7toP3+ZwL+wIuLm7WjNWVrdn+K3Y9K2qrur8
	YPp8gC6TCgTZbqBzyEo0+cwRoPFfbzCgC8PX1J0uDyc7J+wgNDdH14hyR3p8n+Bw1RbDIvwlVz2
	9xWz7tG1xP350gYVLoZsOaliEAI6RDu4l4KkD4OF+EmfdLJGlryBVLGCWaL76jA==
X-Received: by 2002:a05:620a:5373:b0:742:876c:7786 with SMTP id op51-20020a05620a537300b00742876c7786mr2547913qkn.7.1678127563545;
        Mon, 06 Mar 2023 10:32:43 -0800 (PST)
X-Google-Smtp-Source: AK7set/FfxFW58rFA6xFcPm17xJiOXzf0oBhBPlJuQ5UtvxTnCOcg0VVjMp7xYxNF99d8TYTZOlrLJlDuuTmLbNvTyw=
X-Received: by 2002:a05:620a:5373:b0:742:876c:7786 with SMTP id
 op51-20020a05620a537300b00742876c7786mr2547902qkn.7.1678127563187; Mon, 06
 Mar 2023 10:32:43 -0800 (PST)
MIME-Version: 1.0
References: <20230306095408.26057-1-minda.chen@starfivetech.com>
In-Reply-To: <20230306095408.26057-1-minda.chen@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 6 Mar 2023 19:32:26 +0100
Message-ID: <CAJM55Z_kUPYOXwccDOaGk2DoRd9sNrGdpKKMyRUijh5SoPnJ4w@mail.gmail.com>
Subject: Re: [PATCH 3/3] dts: usb: add StarFive JH7110 USB dts configuration.
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_103252_252574_FB3145F0 
X-CRM114-Status: GOOD (  16.30  )
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

On Mon, 6 Mar 2023 at 10:55, Minda Chen <minda.chen@starfivetech.com> wrote:
>
> USB phy dts configuration. Also includes Cadence USB
> subnode configuration.
>
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         |  6 +++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 39 +++++++++++++++++++
>  2 files changed, 45 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index e8b8f4346fdd..2a9ed8b9ee25 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -244,3 +244,9 @@
>                 };
>         };
>  };
> +
> +&usb0 {
> +       starfive,usb2-only;
> +       dr_mode = "peripheral";
> +       status = "okay";
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index be180f23963e..ee665cdc3510 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -628,5 +628,44 @@
>                         starfive,sysreg = <&sys_syscon 0x9c 0x1 0x3e>;
>                         status = "disabled";
>                 };
> +
> +               usb0: usbphy@10200000 {

Please keep the nodes sorted by the address after @

> +                       compatible = "starfive,jh7110-usb";
> +                       reg = <0x0 0x10210000 0x0 0x1000>,
> +                             <0x0 0x10200000 0x0 0x1000>;
> +                       reg-names = "usb3", "usb2";
> +                       clocks = <&syscrg JH7110_SYSCLK_USB_125M>,
> +                                <&stgcrg JH7110_STGCLK_USB0_APP_125>,
> +                                <&stgcrg JH7110_STGCLK_USB0_LPM>,
> +                                <&stgcrg JH7110_STGCLK_USB0_STB>,
> +                                <&stgcrg JH7110_STGCLK_USB0_APB>,
> +                                <&stgcrg JH7110_STGCLK_USB0_AXI>,
> +                                <&stgcrg JH7110_STGCLK_USB0_UTMI_APB>;
> +                       clock-names = "usb_125m", "usb0_app_125", "usb0_lpm",
> +                               "usb0_stb", "usb0_apb", "usb0_axi", "usb0_utmi_apb";
> +                       resets = <&stgcrg JH7110_STGRST_USB0_PWRUP>,
> +                                <&stgcrg JH7110_STGRST_USB0_APB>,
> +                                <&stgcrg JH7110_STGRST_USB0_AXI>,
> +                                <&stgcrg JH7110_STGRST_USB0_UTMI_APB>;
> +                       starfive,stg-syscon = <&stg_syscon 0x4 0xc4 0x148 0x1f4>;
> +                       starfive,sys-syscon = <&sys_syscon 0x18>;
> +                       status = "disabled";
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +                       #interrupt-cells = <1>;
> +                       #phy-cells = <0>;
> +                       ranges;

Please add an empty line here.

> +                       usbdrd_cdns3: usb@10100000 {
> +                               compatible = "cdns,usb3";
> +                               reg = <0x0 0x10100000 0x0 0x10000>,
> +                                     <0x0 0x10110000 0x0 0x10000>,
> +                                     <0x0 0x10120000 0x0 0x10000>;
> +                               reg-names = "otg", "xhci", "dev";
> +                               interrupts = <100>, <108>, <110>;
> +                               interrupt-names = "host", "peripheral", "otg";
> +                               phy-names = "cdns3,usb3-phy", "cnds3,usb2-phy";
> +                               maximum-speed = "super-speed";
> +                       };
> +               };
>         };
>  };
> --
> 2.17.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
