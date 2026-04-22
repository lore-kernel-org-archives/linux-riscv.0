Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EF5F94CCA
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2026 05:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YyND+T8hR1BJEz1MsD8xqXxqnsdKGFUjvnPUvrbluvA=; b=uJ/qMg3Q6Mo+bX
	8Ydkb0yXjJr+brZ0bLSp0jGo2KKgQDIlM2Wkg6jUoGoK695AXJ8VoUk/hG82L+Gxg3m7lyIWXbuWA
	rDKHDX/yMN94BCIIkvvtkGUNO5ySmOgMy7vQvJv0wcr6nm/VUczMQGQp1hFG52ZRC/6yLvmnaCK3j
	RDFAglOmGjxf9y1QdWU9qzAtKe0f6Cqb2pmU2vEcOJtrgahExdxErny7ByvNQXT1RyotswoBeiBL3
	2J9xlB+pufVJK+H1/rHyuNHg85iZoBFqJWC9wQOT9RbRCA0nmlLVf6bIolUlaD1KNnj3EduAC689T
	iH/JBIuOVoqfMPo0sWZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFQaL-00000009d7P-2LGR;
	Wed, 22 Apr 2026 05:57:17 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFQaI-00000009d73-2R0b
	for linux-riscv@lists.infradead.org;
	Wed, 22 Apr 2026 05:57:16 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b8f9568e074so858260666b.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Apr 2026 22:57:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776837432; cv=none;
        d=google.com; s=arc-20240605;
        b=aHgzGh559Dx2ZOAy70gyfKcDTYTFzN9HaPAiHhLXjCygkAOc0YcEXQti77V6fOhpAz
         kd4lNh2ojIcA15HttvV0g2hzK01uHmQEuQ1NCHoFIXiIemQwDW9oV4Wj/21zfb3CWb2a
         zYUxO5B+C/uj0N0evATUBbmYIPkHktcPBuhVreGwyC4DIhphHYeKGatUq37A48IN2Otg
         753dIpdmRUynax5d2z1HJKP7KUJCfUlNapq+Gw/3dYmmqdB+/4nEAGWr+vyXGiIrzVIx
         ZWIfOs62+ffy8oXnWgvemFN4bZ+kkxc1Swky4KhgDsTgvOxbBVTERKNrJC1zhzAxeO6s
         S6Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6mfQrHmJg8pkYiq0O9V0bit0vPU2fxUi56Y7yDGTSLA=;
        fh=IvNomY8f1dquP4AwkGuPlsYciwBO7RwS62E/JUFUd5Y=;
        b=VIi9eC9LczM4YaUU5cywULTkrrPq0y6n68ZUKM51P2MGV/6z9Tdt1CX74KfOanyHmm
         kXVId7YEXM69N9HJzjP/oUbBQAzMM7pgH8l2wRreAweeIpR2dB7nPH8prjXJ0+GC3dFr
         bEPKmY/gWFzhaI4XfbHrNOpVWRirDoZCnAqfeUop7AfWdd8A385oFg2MJZ+0bCxDv/RY
         0Vdb42dVjfxt5pAeQPGfpUONuHUIuaSnf9xw5mJ1t4hF0VC2TpfxEjUnL+CYK1TkRupT
         x23HsROlUJklz0yoFiNApr4zRNXwwvpkkn2lKtivtUwDhNXTQINovjQ+0KgaP+MkRRyK
         1MLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776837432; x=1777442232; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6mfQrHmJg8pkYiq0O9V0bit0vPU2fxUi56Y7yDGTSLA=;
        b=RCs9v7euQMaVeF2L72l4Q3mTMjCHfSf394kYN/5zBfj7Xt1sI8Z427e9djzscujU9p
         EwSI8BYJoyzlj8we3py+9iqBfrEBcXnTroFWo7FiKMvPFKtDtuk/WQJ1pyD1pPyPGJ1Z
         bznjObseFf/R8vC5aNkY7/v1deHGyA4dKZG6MEANAzVqD1T0mKnV+7EuLElpyr18FBgh
         pwg8ub5/vhRlbB87UkcJ3Is82fGBMPHt32JalqOOodVVzqTscxhXP9ekVcu5pc6UZomy
         5kz9AblGOCms10GBSkrkrK+zoyZlTc4Yz7DMH5e58OISl20WzXNFkv5Q8SIfMdCXybPf
         KMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776837432; x=1777442232;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mfQrHmJg8pkYiq0O9V0bit0vPU2fxUi56Y7yDGTSLA=;
        b=oQfmo/ooLJXP9ym1VPsvGjh35Ynh7XbSfKWKxeKp+hPUp9tClPTlr9bK38QHAS/JlL
         qJKBOU9Svsi/LEGBokt1nZ6W4fwbqXwOzNo9VCHWF1nvEl/mL+oBRFXxVRo8TpFG4t3v
         VDFN25O5IgI62L3p+KfUgqpqEYVNiZSC4iCj50fRweZ62T6F10UPeZeFCfLl8EZwgU5e
         Y6pBkb+0c86CzVs7/Bgm9t9TF7kOLO1H9CIbUd5bE3FUH+F7QnSFzMCuqJF0kVIzzxJT
         C8r0kcptbytWfWcKAdydlnac6aXEhGNSNr1l9VZkXD4FtZaStAf9h9Iw7S53qTAkEreO
         Z1Nw==
X-Forwarded-Encrypted: i=1; AFNElJ/jV+VTe7LmPSaCD0db5MjdTokfeRLXHMy66xE83jEx2g3dCIsrBKflOlObjfXfhiDAtEIQzMLIjelAQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUIxgtghAYQEanz2NFVSid2bAuO6rBfef+lfuVjY5o6ei4/BrW
	EcRSXMVZ9/GKI59C3mz/i0mtBqmlND9DGBZgdnOo2u57A2VXSeihBMDk6Y47rprmQjktBXuE5a+
	bT/w9B4h8kIZwuR0orVsKiHN6phiR2kU=
X-Gm-Gg: AeBDietSYCyA8JKHfZW51gzDZYqfgRMG4B8ybRKNFZDpWP35EfxVzDWmVdo2jn1D7gL
	Jc6MZBnOy3pU4G21jfBGAwtxk3ne0h5eQfF/2oDTHk+nW+yAeR+zTyVhtDo8OJeYVinS836Psjv
	frmUF+tpq92tiCyZUz7f6pCAGL1iF5j8+ts5esQ7GUd7TVFSJ+e86TKIPDg6pSkUlRI0tsdAUAX
	uDoeMPXt2GqwvMgY+nREd0njeZZInHbclPn+UVOX6oMWpY7cOxNLpWmO12Hb311Dc8uZnfFQUAp
	dhj73HLMY6i9nJw=
X-Received: by 2002:a17:907:d09:b0:ba7:7a1f:1096 with SMTP id
 a640c23a62f3a-ba77a1f52a9mr604591266b.19.1776837432114; Tue, 21 Apr 2026
 22:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260119-patchv2-k1-thermal-v3-0-3d82c9ebe8a4@163.com> <20260119-patchv2-k1-thermal-v3-3-3d82c9ebe8a4@163.com>
In-Reply-To: <20260119-patchv2-k1-thermal-v3-3-3d82c9ebe8a4@163.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 22 Apr 2026 11:26:56 +0530
X-Gm-Features: AQROBzAs7FAeBD4enf-d2fMmvL5o4M1AgFGifNPyDM3Z4riMQcMNULcXuvp1c4I
Message-ID: <CANAwSgTOmbb+Vzhck1riVaFM89zYLdMe3dn6DRHrc7p+rkR2DQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: Add thermal sensor for K1 SoC
To: Shuwei Wu <shuweiwoo@163.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_225714_659268_6FEBFCE6 
X-CRM114-Status: GOOD (  20.92  )
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

Hi Shuwei,

On Mon, 19 Jan 2026 at 08:13, Shuwei Wu <shuweiwoo@163.com> wrote:
>
> Include the Thermal Sensor node in the SpacemiT K1 dtsi
> with definitions for registers, clocks, and interrupts.
> Additionally, configure thermal zones for the soc, package, gpu, and
> clusters to enable temperature monitoring via the thermal framework.
>
> Signed-off-by: Shuwei Wu <shuweiwoo@163.com>
> ---
> Changes in v2:
> - Update compatible to "spacemit,k1-tsensor"
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 101 +++++++++++++++++++++++++++++++++++
>  1 file changed, 101 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 7818ca4979b6..0fe7396ea6e4 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -338,6 +338,96 @@ osc_32k: clock-32k {
>                 };
>         };
>
I feel the thermal zones appear to be configured at significantly
higher temperatures
compared to the thresholds typically used in commercial-grade and
industrial-grade device
test environments 1.2 Test Environment

[1] https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k1/k1_hw/avl_veri_sop.md

Thermal zones should be defined as part of the SBC board design,
with the option to integrate PWM-controlled fan support in the future.

Thanks
-Anand
> +       thermal-zones {
> +               soc-thermal {
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
> +                       thermal-sensors = <&thermal 0>;
> +
> +                       trips {
> +                               soc-crit {
> +                                       temperature = <115000>;
> +                                       hysteresis = <0>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               package-thermal {
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
> +                       thermal-sensors = <&thermal 1>;
> +
> +                       trips {
> +                               package-crit {
> +                                       temperature = <115000>;
> +                                       hysteresis = <0>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               gpu-thermal {
> +                       polling-delay-passive = <100>;
> +                       polling-delay = <0>;
> +                       thermal-sensors = <&thermal 2>;
> +
> +                       trips {
> +                               gpu-alert {
> +                                       temperature = <85000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               gpu-crit {
> +                                       temperature = <115000>;
> +                                       hysteresis = <0>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               cluster0-thermal {
> +                       polling-delay-passive = <100>;
> +                       polling-delay = <0>;
> +                       thermal-sensors = <&thermal 3>;
> +
> +                       trips {
> +                               cluster0-alert {
> +                                       temperature = <85000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cluster0-crit {
> +                                       temperature = <115000>;
> +                                       hysteresis = <0>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               cluster1-thermal {
> +                       polling-delay-passive = <100>;
> +                       polling-delay = <0>;
> +                       thermal-sensors = <&thermal 4>;
> +
> +                       trips {
> +                               cluster1-alert {
> +                                       temperature = <85000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cluster1-crit {
> +                                       temperature = <115000>;
> +                                       hysteresis = <0>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +       };
> +
>         soc {
>                 compatible = "simple-bus";
>                 interrupt-parent = <&plic>;
> @@ -434,6 +524,17 @@ syscon_apbc: system-controller@d4015000 {
>                         #reset-cells = <1>;
>                 };
>
> +               thermal: thermal@d4018000 {
> +                       compatible = "spacemit,k1-tsensor";
> +                       reg = <0x0 0xd4018000 0x0 0x100>;
> +                       clocks = <&syscon_apbc CLK_TSEN>,
> +                                <&syscon_apbc CLK_TSEN_BUS>;
> +                       clock-names = "core", "bus";
> +                       interrupts = <61>;
> +                       resets = <&syscon_apbc RESET_TSEN>;
> +                       #thermal-sensor-cells = <1>;
> +               };
> +
>                 i2c6: i2c@d4018800 {
>                         compatible = "spacemit,k1-i2c";
>                         reg = <0x0 0xd4018800 0x0 0x38>;
>
> --
> 2.52.0
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
