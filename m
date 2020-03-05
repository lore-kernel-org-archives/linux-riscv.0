Return-Path: <SRS0=aH+X=4W=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C14EC3F2D1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2020 20:29:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FF4B207FD
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2020 20:29:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JYb80z6c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="WnwAb5d1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FF4B207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=HmV0FbbTWHLNbEk18HRKmUQTmdvAb4GvXJNWIO8inpU=; b=JYb80z6cBizADH
	BBDgZ4ZEpUupPUODbjT5gdcoDUwgXvnd5RXiYV0c4vxkILN3E0lxhxEamaj+W5BtTkQsaXfR6+MUf
	jufs5+sizEGqjJVfFTMEC1X0Utp02OX/p07kwVzbKQhlfpUWqYSnJfJE+2DQDCbOtf1zoTjmQ5bM1
	V1BfhQjDQHV0MbmL4CBc1Y3kUsQ1PigaGceVyuwkKtpKcDK6+W4/gvOQiIwewdFbkf0yshuWIfhQE
	OB2AL8xEYPSey6pAP2UBvkiusCFExr6Ves5A212u2gCyMRL0WIxSAaLlX3BkmrlR4j5JtdIvPDUHw
	VsDbIScKb1KSr6yUjGQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9x79-0007D9-Oh; Thu, 05 Mar 2020 20:29:03 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9x77-0007CS-CY
 for linux-riscv@lists.infradead.org; Thu, 05 Mar 2020 20:29:02 +0000
Received: by mail-pg1-x543.google.com with SMTP id h8so3281892pgs.9
 for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2020 12:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=HmV0FbbTWHLNbEk18HRKmUQTmdvAb4GvXJNWIO8inpU=;
 b=WnwAb5d1RStcMvL3G6qv4iE1QY1aQtZjztVhcUwHLiYbgE5zZ0JXszDfD3lwrVqyEu
 Kdm5SRwXEzXdgyWsmnnf2qpUZv8e9Pp3337mPcRc+FO/qa61nUpE5JNAeC3uIl6Sk7aZ
 zEScB88mw8C1wc8IlERsLazES/1iiv6dwlrGBRDCwRAihk9DCNz/UKEVMAc/KIeo8bCg
 X5vvpK01hbb4iaXxC+iHsO9iPBxBtQwUjk/WduX/3jJiXiIYFEiS7Ymakdm2kpN+svRh
 NPnjd+56lWMHdDiscVAMwx4SjrFfc6nX8RgUgJyoNS0YwDdRICHgGGuRnUlaq9IHgGUE
 sPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=HmV0FbbTWHLNbEk18HRKmUQTmdvAb4GvXJNWIO8inpU=;
 b=UIM5SNycMqddgfyg+v40SuTlCNwJxJO4T4mlYuXPvEkNTF1s/9a58JjeuNie/xDgNX
 60nndFS9T2MEsmMS/RhermURLI3pesXS0MFfetFjpTE54M4KfnlI/eJmjSs/MyCai8Br
 v6oJV/6sYyROBXS9t84S5u1l0bVB16Oc71y4Bz/4cZ+uBQCHNJn2jGB64azYctmPgztQ
 gxWNqqBtZLfpQWxYcH8NNEHJE90O1WNpaAxHKkeBkfIbcapF95V8EURXZehLSPDpHWtx
 KnN3I1VxA1qrT5OV1dblGypF7AtbieyRSbRc5vQl7Oxc29rZ524YWHX+sE/Nlz6J/ksR
 YYbA==
X-Gm-Message-State: ANhLgQ0w4nBRh2qDz9osC9if8GXIaWVuxn0B3ObQFJOAJmcxMeUUPlP4
 PUZgf1i/LdiAbCsRA/9PX3l35w==
X-Google-Smtp-Source: ADFU+vuDn2wW8R29ceg7yGU4g1TMD8aF53aa5zyxzy79BYqzrEg5t0wg3/ksTytImORhH9AfXvij9w==
X-Received: by 2002:a62:25c3:: with SMTP id l186mr151830pfl.52.1583440135288; 
 Thu, 05 Mar 2020 12:28:55 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id y5sm33080681pfr.169.2020.03.05.12.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 12:28:54 -0800 (PST)
Date: Thu, 05 Mar 2020 12:28:54 -0800 (PST)
X-Google-Original-Date: Thu, 05 Mar 2020 12:28:24 PST (-0800)
Subject: Re: [PATCH] riscv: dts: Add GPIO reboot method to HiFive Unleashed
 DTS file
In-Reply-To: <1582084147-24516-1-git-send-email-yash.shah@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: yash.shah@sifive.com
Message-ID: <mhng-96dfac99-10d0-466f-8119-fbca6a67fa22@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_122901_426490_8C22745B 
X-CRM114-Status: GOOD (  15.55  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 yash.shah@sifive.com, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 18 Feb 2020 19:49:07 PST (-0800), yash.shah@sifive.com wrote:
> Add the ability to reboot the HiFive Unleashed board via GPIO.
>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> index 609198c..4a2729f 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> @@ -2,6 +2,7 @@
>  /* Copyright (c) 2018-2019 SiFive, Inc */
>
>  #include "fu540-c000.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>
>  /* Clock frequency (in Hz) of the PCB crystal for rtcclk */
>  #define RTCCLK_FREQ		1000000
> @@ -41,6 +42,10 @@
>  		clock-frequency = <RTCCLK_FREQ>;
>  		clock-output-names = "rtcclk";
>  	};
> +	gpio-restart {
> +		compatible = "gpio-restart";
> +		gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
> +	};
>  };
>
>  &uart0 {

Thanks, this is on fixes -- I figure that given it's just a DT change there's
no reason to delay it.

