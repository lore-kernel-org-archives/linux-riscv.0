Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F602C0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 13:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tRUBVNyL8PYtRpXF+ax9mDrbeJEeddT/xfeL02rwTHc=; b=jUHjdFv863pf68
	mLND1P72x4H1JQxwKV5SVOuruXhK1jCo5md1NbgSx2On/vDwXiONl2buP/I45s2XTbAN939IvPAFy
	46re7Bd9JXjsrN6YAQUXCYdkc65VccywAqV4mWg5WaKgheaDGF7lyaIAeNEPBgi35Qx+WrcWWfLk+
	vLiVBSIEE8CgaZ8uAM7aXCjDSbIRnmhXtQ7FeQbbhcFgdGmRwgpEl5wcgid2Ki8R9XchNoWC/P0hP
	vGAnDqC13T4VYe96RFYGSj+QTXrLruNHJFBYs+cH2xqe+5eN4d3QWFTUnrcqIKwuzqPmTspAzQpym
	y6cWlpo634/ExLaSkovg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJwGc-003Org-2i;
	Thu, 13 Jul 2023 13:21:58 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJwGY-003OoK-2C
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 13:21:57 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 28B443F18F
	for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 13:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689254513;
	bh=enRX6hWC2iaemXY8CE1QlIdDJtfFUqCURuPciqCUAP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=OEdLtaipPM/O8RTKSA6hczGsYGn2uGcOlBbTh3YnTMz1K6ST9o8osbhp2RK34DWVh
	 B2dO8ugmnymelt35VxGqhF1oDAH6I8B6CBxMQ+gJocSpWzjlZ3yqD0H1K9qHHFa9JN
	 EcLURzQqnTuCrUGQkGKc+eZngOfOtKOEu2vRv0con1J0uwQyetwVkua/RbfDJgmhvs
	 GnIRfIJN9h2STUK6PxKtCGCi5NwJP5NQb1SxbAa1GJPNupBODlj/ZUFxnOYaMguK+J
	 yik698ySad+GwL0+UiOsYXoJHS4j980Wf+iz86/im5VizLFCDFH84ceBa9RGXMhh2p
	 3Tq8rsnQSKsrA==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-403ba1eebedso9587101cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 06:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689254512; x=1691846512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enRX6hWC2iaemXY8CE1QlIdDJtfFUqCURuPciqCUAP8=;
        b=H5QF6AXfU5Yvzn7bZ8rCuf6oJKz8ekn5BsbG4C+5a0wpbJVIpIRYn8SYS8SIuedKj6
         eiGuB6DPjw9YKBFuHfB02RR5Yr/AV8uCuk1e22cadVzAu/geAsRYqsIjMY4yBVIs/CcY
         PL8u7OrJk3cvLOk5UDF7NT/llsVwmG8heRBaBYuMb2V0QUJtHLTkeCWGkhQFNzUVVbH/
         wVoRkQNYc0mfgmzhE22sihZ2sIQueWXE9n1U6poMJ2bGSD0IctpTBXemq33mQHlqZpV1
         VSiIF1hyUMxo7rJ24+KnTzcODtvrmBOYfmFKHn/9OUMmug3u9Jb+qE6V85YxymvZDPmQ
         2Whg==
X-Gm-Message-State: ABy/qLa7QGW+BASbJa9dnf0zxGJvb0i1ns+s+bPu9VOt+77IOfkOouK4
	kKB3os1FzUQAEBG2i0V/PNDNJyOk65QidnnaVEBNUeKi+kUBoD4qtC4HvTIe8fC1PfoacZ2ma4t
	32hoxkFozkTJuxfffWrpQLStJv7q2Q2wuGnen1RCL2SpGLN+D6yx8T0N3ZUOe2w==
X-Received: by 2002:a05:622a:104a:b0:3ec:490b:ce6e with SMTP id f10-20020a05622a104a00b003ec490bce6emr2001179qte.48.1689254512000;
        Thu, 13 Jul 2023 06:21:52 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFJMIRJnzg3ozLNbx0GZublHY6dW4PSuFNYeS/2iDDTUQp4OX+srNMRFZPrJS2XCDeDowhX2Cfv7yQDvY2KNO0=
X-Received: by 2002:a05:622a:104a:b0:3ec:490b:ce6e with SMTP id
 f10-20020a05622a104a00b003ec490bce6emr2001156qte.48.1689254511797; Thu, 13
 Jul 2023 06:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com> <20230704064610.292603-7-xingyu.wu@starfivetech.com>
In-Reply-To: <20230704064610.292603-7-xingyu.wu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 13 Jul 2023 15:21:35 +0200
Message-ID: <CAJM55Z8VequKy59P5zKrVOr7WPRbUqq4CUHrk8aDO+3qpkzm2Q@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 6/7] riscv: dts: starfive: jh7110: Add syscon nodes
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Hal Feng <hal.feng@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_062154_880933_9D7ABE7B 
X-CRM114-Status: GOOD (  14.07  )
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

On Tue, 4 Jul 2023 at 08:49, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> From: William Qiu <william.qiu@starfivetech.com>
>
> Add stg_syscon/sys_syscon/aon_syscon/PLL nodes for JH7110 SoC.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 4c5fdb905da8..11dd4c9d64b0 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -353,6 +353,11 @@ i2c2: i2c@10050000 {
>                         status = "disabled";
>                 };
>
> +               stg_syscon: syscon@10240000 {
> +                       compatible = "starfive,jh7110-stg-syscon", "syscon";
> +                       reg = <0x0 0x10240000 0x0 0x1000>;
> +               };
> +
>                 uart3: serial@12000000 {
>                         compatible = "snps,dw-apb-uart";
>                         reg = <0x0 0x12000000 0x0 0x10000>;
> @@ -457,6 +462,17 @@ syscrg: clock-controller@13020000 {
>                         #reset-cells = <1>;
>                 };
>
> +               sys_syscon: syscon@13030000 {
> +                       compatible = "starfive,jh7110-sys-syscon", "syscon", "simple-mfd";
> +                       reg = <0x0 0x13030000 0x0 0x1000>;
> +
> +                       pllclk: clock-controller {

Maybe call the handle "pll", so the references can be just <&pll 0>,
<&pll 1> and <&pll 2> if you choose to drop the JH7110_PLLCLK_PLL?_OUT
defines.

In any case:
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> +                               compatible = "starfive,jh7110-pll";
> +                               clocks = <&osc>;
> +                               #clock-cells = <1>;
> +                       };
> +               };
> +
>                 sysgpio: pinctrl@13040000 {
>                         compatible = "starfive,jh7110-sys-pinctrl";
>                         reg = <0x0 0x13040000 0x0 0x10000>;
> @@ -486,6 +502,12 @@ aoncrg: clock-controller@17000000 {
>                         #reset-cells = <1>;
>                 };
>
> +               aon_syscon: syscon@17010000 {
> +                       compatible = "starfive,jh7110-aon-syscon", "syscon";
> +                       reg = <0x0 0x17010000 0x0 0x1000>;
> +                       #power-domain-cells = <1>;
> +               };
> +
>                 aongpio: pinctrl@17020000 {
>                         compatible = "starfive,jh7110-aon-pinctrl";
>                         reg = <0x0 0x17020000 0x0 0x10000>;
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
