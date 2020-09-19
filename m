Return-Path: <SRS0=zSrB=C4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253F0C43463
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2020 04:47:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A434221EC
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2020 04:47:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mr0ficA+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="oF0Q6peB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A434221EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=arfXt1X+jFlgv82+s6UJuZVt7xSnUff/GVpxGQYorf4=; b=mr0ficA+9e6yyhOCjC2S4NhR7
	yahA/Ygjaewak/vY3jONIq2qJ8BQhciqDjNj9Eyz3LM7jGKzVPFo8sTYdImASjGj1EKeY0kj9U1NO
	3Z+zMViPCiIOCfR4EpGb7f9Qlu9o5O5BkH+oYR3AVg7Ql+TcAvyYDHuq4TWVblr6DJUOAETUP/dI3
	9fvHYfzyPibGuDACc/vPXtG1thR2ZIYvg4pcxoXWBo8b7J03M7TMXraO8ueHRNBeER1aInvubROBW
	GJyjTLi3gUkbUDlvgHUyNGVkgHJ5YZ56eh4rA5Bm+AsrSgKQm1Qodtqjnnidw8WkgLegnVgw1Stmp
	7EnaRBdqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJUly-0003pF-Is; Sat, 19 Sep 2020 04:46:54 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJUls-0003ow-O7
 for linux-riscv@lists.infradead.org; Sat, 19 Sep 2020 04:46:49 +0000
Received: by mail-pg1-x542.google.com with SMTP id d13so4661565pgl.6
 for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2020 21:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=6LI7u2O9Q0gk4eMdB3jlsutlep6CX00GUtRa6Z+/hGA=;
 b=oF0Q6peBYbHyZWR2ZDPLtCsA8RSM44d1OQFUIlGZnsfhWLiTL6WrtfHvXm6LPzNA5/
 bSTLF7z0QbiggzhXIteJdhMhQPDaobGIRwX/K2bJ4JDlemUJH2IvVNWlehuC3Ns92qzZ
 zuxYk6bOyZo4JX450UPn/FeSbiw7QRV+/LenxBDuBo8pi6hrm5zVCh2c8aMIhYfCTzLT
 GKuKWw3xCc964efUuisWrYMFH/b5Hz5wIA43DRnCGX9d30awBMechpctgGdBGRDpFqwm
 eAz8W1e3bvSbHZ4ypixazrpUm9EkLJdBInykkyxSSnZFtbcwm8iMiBH7X4l4aJc7yLcr
 Gw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=6LI7u2O9Q0gk4eMdB3jlsutlep6CX00GUtRa6Z+/hGA=;
 b=PKrIF6xaHVpAQYymWZABI+fm/FRS+66vTFM7Fd7TJmW5bhTtB+6+TmX5YO1hLj764C
 HInY4tfHim2ZOUihx3FnI8OGbsqfsr/3WHPJNwP8r0ztcfTh8T6Bu/v76R6v8zoItzY2
 aG1eoRYPJ4cqWqTMaSy3Wp0BD7M6JnoB01yeKBUtE9hARiqrtiWL8XsyMvrSyHnJHMxw
 MGDQ3aynyjAXagcwEPaAe7dF7ifDfZ366iPsadAL7P1ogpila+rBy2WpiS4f2Cb8c0we
 c7fJUkPnueWYABBfYXd3s8uQL6P81a1VKKyAvIegefulYoVIo+mKYNhL6x2g+8rA7MUN
 YT6Q==
X-Gm-Message-State: AOAM531uUPhaYwuzFaL3Tpe6IvPGWstdBSEGSeOpcnQO6EoEb70+5PQv
 xozzWR3aCP6O++1D99uBBgxs/yif8bu3tg8k
X-Google-Smtp-Source: ABdhPJwI8WCoWg5rmlY1+s3hZzhRhgT1+ebomRYTk4v6XQbEixX+qbIIN3xEkfZGTVIbmhZYKmNnyw==
X-Received: by 2002:a63:f752:: with SMTP id f18mr27983435pgk.94.1600490805238; 
 Fri, 18 Sep 2020 21:46:45 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id o5sm4259428pjs.13.2020.09.18.21.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 21:46:44 -0700 (PDT)
Date: Fri, 18 Sep 2020 21:46:44 -0700 (PDT)
X-Google-Original-Date: Fri, 18 Sep 2020 21:46:42 PDT (-0700)
Subject: Re: [PATCH v2] riscv: Fix Kendryte K210 device tree
In-Reply-To: <20200916075941.32311-1-damien.lemoal@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-969b15bd-8ed2-45ee-b164-062b16ce3e2f@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_004648_802097_DD4D3CFA 
X-CRM114-Status: GOOD (  21.31  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Anup Patel <Anup.Patel@wdc.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 16 Sep 2020 00:59:41 PDT (-0700), Damien Le Moal wrote:
> The Kendryte K210 SoC CLINT is compatible with Sifive clint v0
> (sifive,clint0). Fix the Kendryte K210 device tree clint entry to be
> inline with the sifive timer definition documented in
> Documentation/devicetree/bindings/timer/sifive,clint.yaml.
> The device tree clint entry is renamed similarly to u-boot device tree
> definition to improve compatibility with u-boot defined device tree.
> To ensure correct initialization, the interrup-cells attribute is added
> and the interrupt-extended attribute definition fixed.
>
> This fixes boot failures with Kendryte K210 SoC boards.
>
> Note that the clock referenced is kept as K210_CLK_ACLK, which does not
> necessarilly match the clint MTIME increment rate. This however does not
> seem to cause any problem for now.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  arch/riscv/boot/dts/kendryte/k210.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/kendryte/k210.dtsi b/arch/riscv/boot/dts/kendryte/k210.dtsi
> index c1df56ccb8d5..d2d0ff645632 100644
> --- a/arch/riscv/boot/dts/kendryte/k210.dtsi
> +++ b/arch/riscv/boot/dts/kendryte/k210.dtsi
> @@ -95,10 +95,12 @@ sysctl: sysctl@50440000 {
>  			#clock-cells = <1>;
>  		};
>
> -		clint0: interrupt-controller@2000000 {
> +		clint0: clint@2000000 {
> +			#interrupt-cells = <1>;
>  			compatible = "riscv,clint0";
>  			reg = <0x2000000 0xC000>;
> -			interrupts-extended = <&cpu0_intc 3>,  <&cpu1_intc 3>;
> +			interrupts-extended =  <&cpu0_intc 3 &cpu0_intc 7
> +						&cpu1_intc 3 &cpu1_intc 7>;
>  			clocks = <&sysctl K210_CLK_ACLK>;
>  		};

This is on fixes.  Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
