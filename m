Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E284CC3DA7A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jan 2023 14:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ABFuVyAkt+OWz4X3pPLK82P1epff0v41hlwHRcNQvxY=; b=Ifre/iSnfZRy+y
	YKIAtK0O6FKsDlfjpwrH7dRBdRNKM/OMbHsyn+pdMJcF2Ii4wGy3pU8MNgNAlKY6vQPSjB3rTIVnN
	5Iz9qcXWHbtcgcClA9y5tVlxnYmmeZvwM7MV2NxXbohzLB98OkDfh9SAkuL2sSSHBLhqXXGFdbY++
	ZTCHlfnOd6r1350xt8rnXP2I/JpbAY8H0yKR0G1fGHBRaf6482eyiOvXpSGSG3qxDQLqKV7gpIy0q
	5Ha5xZV6qyeJsE+g5Nb/SGnS5pMJuwXOjGDp6XoRf8gAruLVvZRRhJkkWHMZaZimWNp9H61T19L2W
	AJc/ZzTpU29IiLLKC01A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCLQE-00BfGM-7z; Mon, 02 Jan 2023 14:04:14 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCLQ5-00BfB2-AL
	for linux-riscv@lists.infradead.org; Mon, 02 Jan 2023 14:04:06 +0000
Received: by mail-pj1-x102e.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so28267125pjj.4
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jan 2023 06:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H6LE9777qsWo/95jEEDeNuHKeoT3KBBjJhTBB9+3438=;
        b=WVZ8sTBHE3tdEtU8KINohrJE7jUeh7JY6+Cq1JATImhS+i7bSSIxL/ab6UedZOqcPV
         9SaD3eWW62O0hELZpWDIB4FYxs9NEW0si5CeTtIl0ywEI7PWDSCJKSl1gpZiqeGXnHht
         FobvPTT7miQsIRpa7tC2nUS722if4PTI2vybziRb2umWH0/5DdTjjqpeTAnz8RLQOLK+
         NdE1DHJZil38sjCgTiP4VUdlpmCiP57OEXNjP8vmViFJOCY53vmfcrdXr5vVACYzsDU0
         MxbGood60SlNhFcsOEcrjGfLfrBN9ZTMhdNWdjcpg0+ueQBzTYCQ5sbYWjDjdkzLQ7bW
         gqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H6LE9777qsWo/95jEEDeNuHKeoT3KBBjJhTBB9+3438=;
        b=BTQ6Xw4cDBq62i/goc7NfHdf5+Py0FU1kw/tFydkNqfh5394AYH9IAwvEP15o5DbYZ
         URlyqR/6xlzt8P04qd7b4xC4tYskxiFXytxsTOaQ4K36FLMLHaBO+gb8YCzK7GzoNnaC
         X6UzUo8+p6dvZiwf4vh5XDFbAyQTYygwouPSVedWh3iBQ/HDa4FLXoI0QZhHAzTnmWrJ
         dETSG3wp8FaRAgPJ+Nm8VJjz6RzBDo2UCeuiap23bhzHvpM9FugDamSe3Ak2V4cFg7yQ
         UkZ5quG0jCwEtYp9AlJh5XI6z+o/jAzoViO/9vtFodvbPhIjuWBS1ZTBTX/lVKzx/LMW
         cSQA==
X-Gm-Message-State: AFqh2kq1DioRkL4BMLygg2BXhv84oXyQszZWepZ/4gOItCO3ZQurWIBL
	J51KBuI/aFA+4H0Jqq0v4BOFlh3I6ztk8CTIYWYUFQ==
X-Google-Smtp-Source: AMrXdXvD8JA7sNYQjcYTqtzv0aBs0qREhnG3CGWGtXVKAhDWr+IAKhvXR7v2qYq2/A86epOWoS872lYqCFy/nLDsyvA=
X-Received: by 2002:a17:902:eb83:b0:189:e426:4616 with SMTP id
 q3-20020a170902eb8300b00189e4264616mr2030130plg.37.1672668238383; Mon, 02 Jan
 2023 06:03:58 -0800 (PST)
MIME-Version: 1.0
References: <20221227122227.460921-1-william.qiu@starfivetech.com> <20221227122227.460921-4-william.qiu@starfivetech.com>
In-Reply-To: <20221227122227.460921-4-william.qiu@starfivetech.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Jan 2023 15:03:22 +0100
Message-ID: <CAPDyKFqziA+PB__v8nJzgkTuM9ZszW8X2U-akvRFv0_qwZ22OA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: starfive: Add mmc node
To: William Qiu <william.qiu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_060405_442238_E0008B37 
X-CRM114-Status: GOOD (  16.90  )
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

On Tue, 27 Dec 2022 at 13:22, William Qiu <william.qiu@starfivetech.com> wrote:
>
> This adds the mmc node for the StarFive JH7110 SoC.
> Set sdioo node to emmc and set sdio1 node to sd.
>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-v2.dts         | 25 ++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 38 +++++++++++++++++++
>  2 files changed, 63 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> index c8946cf3a268..d8244fd1f5a0 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> @@ -47,6 +47,31 @@ &clk_rtc {
>         clock-frequency = <32768>;
>  };
>
> +&mmc0 {
> +       max-frequency = <100000000>;
> +       card-detect-delay = <300>;

Nitpick:  This seems redundant for a non-removable card!?

> +       bus-width = <8>;
> +       cap-mmc-highspeed;
> +       mmc-ddr-1_8v;
> +       mmc-hs200-1_8v;
> +       non-removable;
> +       cap-mmc-hw-reset;
> +       post-power-on-delay-ms = <200>;
> +       status = "okay";
> +};
> +
> +&mmc1 {
> +       max-frequency = <100000000>;
> +       card-detect-delay = <300>;

Nitpick: This looks redundant for polling based card detection
(broken-cd is set a few lines below).

> +       bus-width = <4>;
> +       no-sdio;
> +       no-mmc;
> +       broken-cd;
> +       cap-sd-highspeed;
> +       post-power-on-delay-ms = <200>;
> +       status = "okay";
> +};
> +
>  &gmac0_rmii_refin {
>         clock-frequency = <50000000>;
>  };
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index c22e8f1d2640..08a780d2c0f4 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -331,6 +331,11 @@ aoncrg: clock-controller@17000000 {
>                         #reset-cells = <1>;
>                 };
>
> +               syscon: syscon@13030000 {
> +                       compatible = "starfive,syscon", "syscon";
> +                       reg = <0x0 0x13030000 0x0 0x1000>;
> +               };
> +
>                 gpio: gpio@13040000 {
>                         compatible = "starfive,jh7110-sys-pinctrl";
>                         reg = <0x0 0x13040000 0x0 0x10000>;
> @@ -433,5 +438,38 @@ uart5: serial@12020000 {
>                         reg-shift = <2>;
>                         status = "disabled";
>                 };
> +
> +               /* unremovable emmc as mmcblk0 */

Don't confuse the mmc0 node name with mmcblk0. There is no guarantee
that this is true, unless you also specify an alias.

> +               mmc0: mmc@16010000 {
> +                       compatible = "starfive,jh7110-mmc";
> +                       reg = <0x0 0x16010000 0x0 0x10000>;
> +                       clocks = <&syscrg JH7110_SYSCLK_SDIO0_AHB>,
> +                                <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;
> +                       clock-names = "biu","ciu";
> +                       resets = <&syscrg JH7110_SYSRST_SDIO0_AHB>;
> +                       reset-names = "reset";
> +                       interrupts = <74>;
> +                       fifo-depth = <32>;
> +                       fifo-watermark-aligned;
> +                       data-addr = <0>;
> +                       starfive,syscon = <&syscon 0x14 0x1a 0x7c000000>;
> +                       status = "disabled";
> +               };
> +
> +               mmc1: mmc@16020000 {
> +                       compatible = "starfive,jh7110-mmc";
> +                       reg = <0x0 0x16020000 0x0 0x10000>;
> +                       clocks = <&syscrg JH7110_SYSCLK_SDIO1_AHB>,
> +                                <&syscrg JH7110_SYSCLK_SDIO1_SDCARD>;
> +                       clock-names = "biu","ciu";
> +                       resets = <&syscrg JH7110_SYSRST_SDIO1_AHB>;
> +                       reset-names = "reset";
> +                       interrupts = <75>;
> +                       fifo-depth = <32>;
> +                       fifo-watermark-aligned;
> +                       data-addr = <0>;
> +                       starfive,syscon = <&syscon 0x9c 0x1 0x3e>;
> +                       status = "disabled";
> +               };
>         };
>  };

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
