Return-Path: <SRS0=1JZA=NQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742B4C4320E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 04:45:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CF9A61374
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 04:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CF9A61374
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=9JajhCzl5wnIZIPVLVmbG9G5S/uyEQeLIqzs5N6G+zc=; b=1vWiFJB+upHgs4oNcIo6goXZNR
	Psy3f0GVGC7yk9t27id78D7iNYXCm0KzXOZJ8+gNVM6+Ceg7eQFylzVatkrYm+WsEejqKUFSry3Gg
	TI0AwVkP9N+shykcHaDDKB0eqVELty02pDYVDHEnGynrcUuuhZSvX5cxw5vuhu8GyLMldsb/FCRUT
	/px+3wuhiMlMou/bfg183qL/beJcGL0lw58Y/HZIdZ5k/tpkvkxfHWZfE7ANXz5EYKfZnFn3lVO7k
	V7q/oh7qcwY6QWgkPqn66Vbrx8czQ91E6S9Xsy2WUslo5Qj290V4w8i6/fBDogBkMtzaYs83Q03Hy
	/Inq7jhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIkmL-005UUC-Me; Wed, 25 Aug 2021 04:44:45 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIkmH-005USv-Ns
 for linux-riscv@lists.infradead.org; Wed, 25 Aug 2021 04:44:43 +0000
Received: by mail-pf1-x42d.google.com with SMTP id y190so20243276pfg.7
 for <linux-riscv@lists.infradead.org>; Tue, 24 Aug 2021 21:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=DtpgiMDdQDQ42lYOShCZSjozTn71wDq5F2+gG4jR6Mc=;
 b=0lbToYpEYOLQgZ6ilz4YoMIXEGpsubR/kTYlcrt7w3aXRixErfDBdQPwni5NYIPqXx
 MCe4cqP/zZvQDRM6fYqeLweBtHvDmuGBQTbnBTWqE+AVh8zKZiYh6e0GEyBwfqwGmVlv
 T4KUmkPDiBR60QYCYargeeujS9jdlwrd7YnrkLY72EdVE8qv/2yEfoqnhKI4JMXrRx1W
 HaqaU9g+LAj/SWct7VpLCW2Iv55cdmOjr/qPUMYeRTh/l/C5C+WZFdkWihni8dP+Fb2l
 6MKa411jZSwIFHyY9+TsSMZyKsM5dgwiJl9PbEsshPO/kTyqVRxXwW+5YppMQrHPkylw
 gd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=DtpgiMDdQDQ42lYOShCZSjozTn71wDq5F2+gG4jR6Mc=;
 b=TpLb4cgKU/T4KZMxaDfGWWmqBUGLu+KAWF+f35zQLXgZmrbT/q4/FlIkPuU9woTdye
 EfaUNncGPMnJU8wRoMpu4ojnkeozToc5iEuaEq7WcspIhmaO0PS7X6LZw3NHZNobd7/c
 WCq7nKdHIeh9nFz9G/jdjrXZf1nUcXpTg/JjMysDwpipYedNoFhCZElyRisv3TJXHGHM
 XZZaTYBGir4BOhgZGd3xMghdbms6okyEOjuMDYSkNIYhdqjhzDg7rB2mhXf4XdjSI8yZ
 QUPwKkW7HPjP7VBgtBql9lNvGXMzj1ax6b4O4cX6+hwbWbMVjcTzsHurM3ZhgbwN905/
 UWwg==
X-Gm-Message-State: AOAM530NHzOVWaJsdUzTKz7lIT3aSif+HaLqfQvG1z7fwFKWMAJ15o0W
 tRUz4EoBd4isq6sSuzMMRaCenQ==
X-Google-Smtp-Source: ABdhPJxyNMzZYjLDAg06MgzzGBD9gydeKGrikQEhiDcDIRog/SGk6EAyeKQbPoEQpWsk9AVcMwwR8w==
X-Received: by 2002:a65:44c4:: with SMTP id g4mr40319781pgs.254.1629866679411; 
 Tue, 24 Aug 2021 21:44:39 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a1sm19557309pgt.47.2021.08.24.21.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 21:44:38 -0700 (PDT)
Date: Tue, 24 Aug 2021 21:44:38 -0700 (PDT)
X-Google-Original-Date: Tue, 24 Aug 2021 20:57:42 PDT (-0700)
Subject: Re: [PATCH v2 1/2] riscv: dts: microchip: Use 'local-mac-address' for
 emac1
In-Reply-To: <20210804123015.807929-1-bmeng.cn@gmail.com>
CC: Conor.Dooley@microchip.com, Atish Patra <Atish.Patra@wdc.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 geert@linux-m68k.org, bin.meng@windriver.com, conor.dooley@microchip.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-8451ce80-2f44-40f0-945c-f2fd13a80bd7@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_214441_838454_0C435B66 
X-CRM114-Status: GOOD (  19.77  )
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

On Wed, 04 Aug 2021 05:30:14 PDT (-0700), bmeng.cn@gmail.com wrote:
> From: Bin Meng <bin.meng@windriver.com>
>
> Per the DT spec, 'local-mac-address' is used to specify MAC address
> that was assigned to the network device, while 'mac-address' is used
> to specify the MAC address that was last used by the boot program,
> and shall be used only if the value differs from 'local-mac-address'
> property value.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: conor dooley <conor.dooley@microchip.com>
> ---
>
> (no changes since v1)
>
>  arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> index 0659068b62f7..a9c558366d61 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -317,7 +317,7 @@ emac1: ethernet@20112000 {
>  			reg = <0x0 0x20112000 0x0 0x2000>;
>  			interrupt-parent = <&plic>;
>  			interrupts = <70 71 72 73>;
> -			mac-address = [00 00 00 00 00 00];
> +			local-mac-address = [00 00 00 00 00 00];
>  			clocks = <&clkcfg 5>, <&clkcfg 2>;
>  			status = "disabled";
>  			clock-names = "pclk", "hclk";

Thanks, these are on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
