Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2669CCA47C
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 22:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=FhNNCB8PVcG+tuNB+MRgj8uXsHLwNYQSFh643v64hsc=; b=J69JuXotuz1QmmTw8n9LflJfUZ
	hEQZaFzIOkrTvxdp4+YwxyIeT7mC6DurpFLE3KCPs1tf8GKGeCB2E8LTIyVq9Hyzxtzuju3UAok4P
	qEEL0fHrOwPWrVZVulcPy0WTAocedl7KEGlovYFQciEsS8E4KpIu7cSPP//6k38hQiiEWDVKN6c12
	1WBr3hq6oqmhcg2+NGhEuUf9UIAYmekvHyZsRUZUK/6l+Mbwk9hLauy+4prz9KMiP4MQVFReHxDjO
	1PhELvNxd41tNkB7Ox6om/pSwuQ7nHbj2atKyyA/BGqcw/6kl9fNp4z9qaYWu40aHo/EQm23VZdiP
	MnxZxR9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC6wJ-001s3X-Nj; Thu, 14 Jul 2022 22:04:07 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC6wG-001s1z-8x
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 22:04:06 +0000
Received: by mail-pj1-x1036.google.com with SMTP id i8-20020a17090a4b8800b001ef8a65bfbdso4373665pjh.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Jul 2022 15:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=KDtjlRiNkbkwbyu0K1cWU8KeaAVIJpnnNwqLxbVq1SM=;
        b=ZVwA55GEKeisOGGK59fMpJ4hYruRMbnUWD907flsikQqWcIGC9s4PaNtfzDSK9+AiM
         R4ob13YAe7zJrPTRE64X4XlhssTohU0uoCxt5DFrJLdflknyfdLqBs+jiFWw2peGBhSX
         gRk83oWFWZZbAAFqoxTR9K+Y50UdHYCSaQcyDX/ogDknUaWlFVIvvnlVMojoDkLGqaqj
         CDORZNdUuRSS6rgHiZi41QwjEjyUYScQjFC6VT+cr4XeR3f7lKEkeOywc4PmGM0Xyk0Z
         4yturnY2DIJMEnbPtDaYpgEqlBWspLGoVP2j/lbjtrv83Nm8/v4+iqJNQcYqm0E3Iaga
         TIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=KDtjlRiNkbkwbyu0K1cWU8KeaAVIJpnnNwqLxbVq1SM=;
        b=6cO0zHSPitimCPC0Nti/xRD3A7TM5KUb6mimZJ0VpOX7wzGL9AbfH455tKy3Yi6kMa
         p3F+FM2NcGxEImSSP8mEdHacjH8DsXPlJx4moHN6BN42hYZRflbu0pzXXiLOZFg0lnU9
         YCIYLabbResrr7sWZ9gsI2WTHaauaEX1ShLLKMdNOt9zWDrp0FFB2OzUW+Us1Sq00ddi
         VGuKK8hl8Nv6+V/ydLtN9HJ89+peaA+cMHTzxSduH03JrkK1ZeBst+EavQeFgafS77oQ
         uXt2ZtUCxHcr1eFCilxq34gjDt5LHdp2KVbzmDjJB+06XbqVOgUn+81R5oLT2bCbxS5D
         fH2w==
X-Gm-Message-State: AJIora/ecdmdAEZZZ3VG8UddYyqw9trDxSqQEWbndJ/AdpN7s3/v4NuX
	ofMWZJZ5YAepHh9pQmpqfTKcWg==
X-Google-Smtp-Source: AGRyM1uqiwhNrcoDyi7BO/M6oUSKAHXy3k3IByQCDQyMTQXgqTtuGVQdh9q861VVmOOyihKz1THYlA==
X-Received: by 2002:a17:902:cad1:b0:16c:9816:648a with SMTP id y17-20020a170902cad100b0016c9816648amr7997084pld.166.1657836242750;
        Thu, 14 Jul 2022 15:04:02 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id y3-20020a17090a134300b001ef82d23125sm4129123pjf.25.2022.07.14.15.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 15:03:59 -0700 (PDT)
Date: Thu, 14 Jul 2022 15:03:59 -0700 (PDT)
X-Google-Original-Date: Thu, 14 Jul 2022 14:33:22 PDT (-0700)
Subject: Re: [PATCH] riscv: dts: align gpio-key node names with dtschema
In-Reply-To: <20220624170811.66395-1-krzysztof.kozlowski@linaro.org>
CC: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, devicetree@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: krzysztof.kozlowski@linaro.org
Message-ID: <mhng-26d4c307-b754-4c87-8858-789dca71c0ae@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_150404_338240_3FA1107D 
X-CRM114-Status: GOOD (  15.13  )
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

On Fri, 24 Jun 2022 10:08:11 PDT (-0700), krzysztof.kozlowski@linaro.org wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> See: https://lore.kernel.org/all/20220616005224.18391-1-krzysztof.kozlowski@linaro.org/
> ---
>  arch/riscv/boot/dts/canaan/canaan_kd233.dts     | 2 +-
>  arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts  | 2 +-
>  arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts | 2 +-
>  arch/riscv/boot/dts/canaan/sipeed_maix_go.dts   | 6 +++---
>  arch/riscv/boot/dts/canaan/sipeed_maixduino.dts | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/canaan/canaan_kd233.dts b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
> index 039b92abf046..f72540bd14a3 100644
> --- a/arch/riscv/boot/dts/canaan/canaan_kd233.dts
> +++ b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
> @@ -35,7 +35,7 @@ led1 {
>  	gpio-keys {
>  		compatible = "gpio-keys";
>
> -		key0 {
> +		key {
>  			label = "KEY0";
>  			linux,code = <BTN_0>;
>  			gpios = <&gpio0 10 GPIO_ACTIVE_LOW>;
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> index b9e30df127fe..8abdbe26a1d0 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> @@ -47,7 +47,7 @@ led2 {
>  	gpio-keys {
>  		compatible = "gpio-keys";
>
> -		boot {
> +		key-boot {
>  			label = "BOOT";
>  			linux,code = <BTN_0>;
>  			gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
> index 8d23401b0bbb..3c6df1ecf76f 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
> @@ -52,7 +52,7 @@ led2 {
>  	gpio-keys {
>  		compatible = "gpio-keys";
>
> -		boot {
> +		key-boot {
>  			label = "BOOT";
>  			linux,code = <BTN_0>;
>  			gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
> index 24fd83b43d9d..03c9843d503e 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
> @@ -46,19 +46,19 @@ led2 {
>  	gpio-keys {
>  		compatible = "gpio-keys";
>
> -		up {
> +		key-up {
>  			label = "UP";
>  			linux,code = <BTN_1>;
>  			gpios = <&gpio1_0 7 GPIO_ACTIVE_LOW>;
>  		};
>
> -		press {
> +		key-press {
>  			label = "PRESS";
>  			linux,code = <BTN_0>;
>  			gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
>  		};
>
> -		down {
> +		key-down {
>  			label = "DOWN";
>  			linux,code = <BTN_2>;
>  			gpios = <&gpio0 1 GPIO_ACTIVE_LOW>;
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
> index 25341f38292a..7164ad063178 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
> @@ -23,7 +23,7 @@ chosen {
>  	gpio-keys {
>  		compatible = "gpio-keys";
>
> -		boot {
> +		key-boot {
>  			label = "BOOT";
>  			linux,code = <BTN_0>;
>  			gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
