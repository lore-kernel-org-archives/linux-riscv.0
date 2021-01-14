Return-Path: <SRS0=X6bA=GR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3B1C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 23:32:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2753723A6C
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 23:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2753723A6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=pbVBB5uqBOdNfTrH23hyzKo8c/DRe9+/QLK9CBQJE4I=; b=SUlaBedVs7JIg+1X8FPv2TzZS
	/lmOy35gLUGLCqEUkgICStXQQCdKgJ0F9UwCAaWx31jmeZjzRuLw3LeeiCfNNlBWSKBH1M6DnmO6/
	ZSx2Do5CUuVhblEYVvUYJvBciVS4yqI/jJQrpdlO8k1t/60BYZEdhdjQE8X5YS9ZljeNhbWYUNf6L
	NYI+ROF/aa+Uh+TCmkKQTjK8rU1bCw2DWd7yRqCVgR9NBrxCl//FwjfVpp17Oxi9NRpIqn7nGgjil
	pa+vW4AaxJF/WpCdbrL0tacU+yKHbWDVcbMSnm3ZDk05+hLn/hrszYp6b4jpAwu3kdqdgesO6l5kd
	1U8OGmuEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0C6A-0005xS-Pq; Thu, 14 Jan 2021 23:32:14 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0C68-0005x0-Dz
 for linux-riscv@lists.infradead.org; Thu, 14 Jan 2021 23:32:13 +0000
Received: by mail-pf1-x42b.google.com with SMTP id a188so4304996pfa.11
 for <linux-riscv@lists.infradead.org>; Thu, 14 Jan 2021 15:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=7edFqwpuoKbaJteL6dL/Wqcwefo+5j+5YYz4rE4hOdc=;
 b=mOPp61ga4vwNus19G1FYHbjWASPCXlPXAEwLormqWoB5yO/YDjCbAuMinob+5J5i2c
 XlSC+3yeGEKZ3GPtZCeDzCiO4yXlK++KTGaqX+Q+7kHZ8U7HXNltm2DwJ1XSt4KnmWZz
 7Jdn2FJXm4yFTfk5v6VRirupQjoNIlYW4FRwmK08ZYIOj7GMYynWBlSvnKxOK+ESMbey
 cgofQaWaPvaVv6YBypd7tqeBQEcN+sYL36FMnrILajUYe1i21kIu4DL2GAtdkSkiVcDA
 NzkaCUGgfw1AT7ycBXppovWLOZpHwAnrRhpH5banyvMIHzwwzvSox91qBVAH2y/WJQ/6
 rR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=7edFqwpuoKbaJteL6dL/Wqcwefo+5j+5YYz4rE4hOdc=;
 b=LWvg3gyiK7y86dncdTodeLeSrwGXSqnPwISuMz79cTLo5IborpkiDccY7ppRz0Pfdz
 Dy88uxohtDhbq9OzHuKA0U2bgVUCHMx4EsxwA5ObKGKHo2qL0LvnQqynb5G/j9t57sTk
 3tzXJhufD1HTiqaUazqn+Wq6DKLNvijxOyujEGHnghBBz0lpt1K/uBqbBNkOs1IecO6u
 N6kXWSXC732iydim6YqorpysmJdldwIG3qh+o9vUdCKC9ZharggMvK/6NOGMRDpvIdjr
 H0IhvHbRI5vf1fUEZbMsKDQuIE21fkOW6V/IvKFcTNE76FMhMnOCpKOauNMknqfDwnMV
 fiYQ==
X-Gm-Message-State: AOAM530Qe/dk5gUOoObqSDjzC84QA8m1FChKNBeflNUHCg93+peDjCU4
 blUyqKTzaxUZXspUJzIGJkpGUjAYwYmT4g==
X-Google-Smtp-Source: ABdhPJyS1pM7CMQDM4oXYsm04LQnitWyWMl8WA7ojgcSfa9N1KsOcDRDdu1o7be8OyaoKFkC9DKskA==
X-Received: by 2002:a63:105e:: with SMTP id 30mr9655263pgq.24.1610667129965;
 Thu, 14 Jan 2021 15:32:09 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z3sm6197028pfq.89.2021.01.14.15.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 15:32:08 -0800 (PST)
Date: Thu, 14 Jan 2021 15:32:08 -0800 (PST)
X-Google-Original-Date: Thu, 14 Jan 2021 15:20:36 PST (-0800)
Subject: Re: [PATCH v11 03/10] riscv: Update Canaan Kendryte K210 device tree
In-Reply-To: <20210112005848.199951-4-damien.lemoal@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-b30be63a-5293-4d18-85cb-fb2c62b3188e@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_183212_511329_DAFC919C 
X-CRM114-Status: GOOD (  21.78  )
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
Cc: linux-riscv@lists.infradead.org, seanga2@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 11 Jan 2021 16:58:41 PST (-0800), Damien Le Moal wrote:
> Update the Canaan Kendryte K210 base device tree k210.dtsi to define
> all peripherals of the SoC, their clocks and reset lines. The device
> tree file k210.dts is renamed to k210_generic.dts and becomes the
> default value selection of the SOC_CANAAN_K210_DTB_BUILTIN_SOURCE
> configuration option. No device beside the serial console is defined by
> this device tree. This makes this generic device tree suitable for use
> with a builtin initramfs with all known K210 based boards.
>
> These changes result in the K210_CLK_ACLK clock ID to be unused and
> removed from the dt-bindings k210-clk.h header file.
>
> Most updates to the k210.dtsi file come from Sean Anderson's work on
> U-Boot support for the K210.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
>  arch/riscv/Kconfig.socs                     |   2 +-
>  arch/riscv/boot/dts/canaan/k210.dts         |  23 -
>  arch/riscv/boot/dts/canaan/k210.dtsi        | 551 +++++++++++++++++++-
>  arch/riscv/boot/dts/canaan/k210_generic.dts |  46 ++
>  include/dt-bindings/clock/k210-clk.h        |   1 -
>  5 files changed, 573 insertions(+), 50 deletions(-)
>  delete mode 100644 arch/riscv/boot/dts/canaan/k210.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts

[Snipping this to the relevant bits, in case you missed it before.]

> @@ -81,40 +107,515 @@ in0: oscillator {
>  	soc {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> -		compatible = "kendryte,k210-soc", "simple-bus";
> +		compatible = "canaan,k210-soc", "simple-bus";
>  		ranges;
>  		interrupt-parent = <&plic0>;
>
> -		sysctl: sysctl@50440000 {
> -			compatible = "kendryte,k210-sysctl", "simple-mfd";
> -			reg = <0x50440000 0x1000>;
> -			#clock-cells = <1>;
> +		debug0: debug@0 {
> +			compatible = "canaan,k210-debug", "riscv,debug";

I'm still getting lots of warnings about undocumented DT compatible strings
from checpatch.  Some of them might be in flight, but I don't see many of them
(including both of these debug ones) having been defined anywhere.  We went
through a whole process to sort out the SiFive DT naming conventions, I don't
want to just circumvent that for the Canaan stuff by merging it as-is.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
