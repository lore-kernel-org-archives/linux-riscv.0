Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1811C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 13:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LGa+JXjnYcuaNfRfmfqWpFFWhYxz57OsJw582PjEIiw=; b=d0JwDcjE+W6v/Az49KSdQsTR7b
	puXl1aR4FMBFpkUFzUPis7K1TLeALP2/3SAWS2vfQwsbbmqe1Iv7+VESsBr/FSHb0NRVc5izy9a2C
	YROoXHRL7Vy3I+/W7bHMhFv6XWIamYAOBeRUco6xi98pHS/c/8HUD33drD+lCysGoRXSDRxoIMjE4
	Gsu+cx6RhcB/JGe7/7VutlDJAdsa2EcKwrqe4Ad7BtOyEsSMdEO/XrezZSY3PassHBDwkn2CCRpoO
	iCOgyngmun7Tw1LglwhOge+lyGBtTF3AnJK4H2npRzUzvonrISIcEXc007Iz0lw3bWZPjIdJ2GUYE
	YG7PfmjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAVv5-007YEM-1J;
	Tue, 05 Dec 2023 13:57:03 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAVv2-007YDw-0U
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 13:57:01 +0000
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4213F40C55
	for <linux-riscv@lists.infradead.org>; Tue,  5 Dec 2023 13:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701784616;
	bh=IiRXF4n/93v5Ug5hjoOSvZlervZ246QbgRyu0qVcQa4=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=a6lbRkIL85HyTMX4ah6v0+WPNEH3DSlKOsftq1C6xOd/L0WlHBqYFUODkzGXSwAwt
	 YUO8Spt8L2B1mDPdB6I/Y+O37F4e77gZH1jJObr1n9gSOSCM5QaTjpFLpNtQG0jYiV
	 rD7YbPbF9jFV8z7c9EArC03TIZa+fBK+hniQUq3hRkHGs4i8V6/u0SsJwlebOieIak
	 yzLyz/7dhD+IvneyfrpgnqvvvKHW3u4ZwdL6sITFv0bmn8kq9lCnRcE+MuWv0zFHzn
	 Y8p0whDNI+jWVKTwkllYiWbBWtbl4WUWX1DZ/X2SnkDQyL1E4dM/1z1zXhSZg93kps
	 6EbaF7+803gpA==
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-77dcbd6edb0so901416785a.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 05:56:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701784615; x=1702389415;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IiRXF4n/93v5Ug5hjoOSvZlervZ246QbgRyu0qVcQa4=;
        b=qzszmO0apEmdnIRqRIdoJu+0QLaFuGvgd8nxfzQh5TNUptXJep1Qdi4VY09FKp2rND
         PnLTvs4U1p2V/aEYOG/A7mRC2ch95o+n87g0+1EFkMCnBXsNqknd2NPGxuVR2T0QUIMP
         NG5BNbqqf8W63bn27reaUbdaFly2W3m/QHBNyK8OnRxQAzo4QsKFFx9OpiCtyNmc56LV
         3vuyFRI6kuk+g5NKCANcY74yeZDVnCqVljkBCtVtV7CA5K+DUU7nA9q9NSw38LXQ8to7
         a/Iylhaxmnq/10u6+Hp6SL4tUZtrB1kknRc+W1NktLmmptx51dFX57tzR/uRrpGnhZJy
         sIJw==
X-Gm-Message-State: AOJu0YzW+T5G73XCiVLbzd06bqCakYP44guLUTKDhfrR5u5S8T2J3qWh
	cl+oQkJWyynuG506kVHdUfcABe7GHU+KwACGGLkHCzSGRdcsdvLSvmbo/bbPg39e/bvPcL3t7Hq
	z6mFpYsPWpcr4HwGE1/CnWYtrpKReHigZpc6qzdNnYGABtXrpDxhxwABO6SPgxzLURe2bhySS
X-Received: by 2002:ad4:4486:0:b0:67a:a721:f30f with SMTP id m6-20020ad44486000000b0067aa721f30fmr1465507qvt.79.1701784615266;
        Tue, 05 Dec 2023 05:56:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErR1wXH/GabDZKXesdKBFPnJz7SeypeN/oGzxkp5WIwT9bEBYm1KaRkIO2O9CcQbAKZYRddKnzH6OnMewqq8I=
X-Received: by 2002:ad4:4486:0:b0:67a:a721:f30f with SMTP id
 m6-20020ad44486000000b0067aa721f30fmr1465497qvt.79.1701784615073; Tue, 05 Dec
 2023 05:56:55 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Dec 2023 05:56:54 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <IA1PR20MB4953EBF14C9CA436760B2A58BB85A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49532E1A3D8BA71FDBB444BCBB85A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953EBF14C9CA436760B2A58BB85A@IA1PR20MB4953.namprd20.prod.outlook.com>
Mime-Version: 1.0
Date: Tue, 5 Dec 2023 05:56:54 -0800
Message-ID: <CAJM55Z8DU_OPJOYqT28wtH9EGFj=y9VVPcawOnYjY=U75pt2vg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: dts: sophgo: add uart clock for Sophgo
 CV1800 series SoC
To: Inochi Amaoto <inochiama@outlook.com>, Chao Wei <chao.wei@sophgo.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>, qiujingbao.dlmu@gmail.com, dlan@gentoo.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_055700_538506_71CFA473 
X-CRM114-Status: GOOD (  12.02  )
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

Inochi Amaoto wrote:
> Add missing clocks of uart node for CV1800B and CV1812H.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> index c5642dd7cbbd..3f290a515011 100644
> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> @@ -5,6 +5,7 @@
>   */
>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/clock/sophgo,cv1800.h>
>
>  / {
>  	#address-cells = <1>;
> @@ -136,7 +137,9 @@ uart0: serial@4140000 {
>  			compatible = "snps,dw-apb-uart";
>  			reg = <0x04140000 0x100>;
>  			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&osc>;
> +			clock-frequency = <25000000>;
> +			clocks = <&clk CLK_UART0>, <&clk CLK_APB_UART0>;
> +			clock-names = "baudclk", "apb_pclk";
>  			reg-shift = <2>;
>  			reg-io-width = <4>;
>  			status = "disabled";

Hi Inochi,

When there is a proper "baudclk" defined the driver should get the rate
(frequency) from that and the manually defined clock-frequency should not be
needed.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
