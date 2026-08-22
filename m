Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00D0C5DF8C
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Aug 2026 02:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPo5WzXDD6ZZfAkOTVJvhkf8dOmxcZcUsJ/RlrVGJVs=; b=Ym1D2lqM3eIdo1
	QhOgJXo5/I608k8j331fFEPNh2Q1pTtE6tjPIF/LRORhXve+7+kS7K6IZ150qaKS0hcRRrzQVW4aJ
	gOSSFznSjDzHkm6ezpjZuhDp2TJxn+/hKTC0zKtRt4GmsGjTbaLKKJH3OTq/Y2IUuSg2Zj/50sH4M
	no3ifUC/wnHiGQi1MNyBuqP8UBFCHhaHIYqvurRCROCooujox3/21ZjiMKHTQcITp0USb4T6OaCDi
	NCwvSDwIztWpesKUVZONV1j2vRGQGOy2q14qDqSEEuxXZZUorkmPejW933AWl/7+IZyz3Tq8ipuZP
	lgmh73zUrPy/8ZGhLvMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxbEr-0000000EEvx-2MCx;
	Sat, 22 Aug 2026 02:13:41 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxbEo-0000000EEvZ-2mMh
	for linux-riscv@lists.infradead.org;
	Sat, 22 Aug 2026 02:13:39 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-38e347638adso1507167a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 19:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787364817; x=1787969617; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u+kJNsMh7lbuSLTH19NsCfuQgNIbC7xznYYNfdfSxlo=;
        b=sX8JfW5mNftTZaJbuzy7e53tCVbghoJdsg1B5J2bNNopL4ftyyrvTWoUvdo8J+FHg4
         4KWjCSVy6KPMpSQ9OjP38631IIbi/yHf6vmxNWJJhL1BcUl8Tv5hgRyXVrZ59Sqf10WT
         1dR/MQEFZv67h6yEBBPGS9v1IYTOn7x2ZlAy90h7HT+WqrAu2EPPHLdwVsBte3SZA2Rf
         69wvDCNHQG1VgEyqTQNUYuwFs10vRTbdIx+rGQ2MFGeSD/V6bhDcENybniqWJ+ozIJCy
         qnVjlb+Qyj6U8HeRyBtnlAJbCRXwQGEQ9MvJefDf+cuVv1JmVNCdOY5T8YO9F0k1WULC
         QQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787364817; x=1787969617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+kJNsMh7lbuSLTH19NsCfuQgNIbC7xznYYNfdfSxlo=;
        b=k/RYA5fsWqbeJ/vQigWkxjqUYuhNB+Wh41dnyi70CgJ8pHcE2rCCGapG2HVJTOPr2c
         5xLaJIPTZz7IKOSnVhQ/Um9Hajv74hXvZN8xp1euyB9WM9jLTsugOJKB51AqBPTawXrZ
         lmEZA5fjGwXNydMymvaiK4l0ZIKluwTXRM2mZYV4LEHAhGcH2gfcauIm/9FW30MIPWVG
         LqIBalXfhx/8T5881T8BhjzKtTkHk3Ks1WaUEK8vDjIMtqHaPSM5VjX4M9JqyNyKMPTz
         pCYtrmhUeWPttDfenF7eSRQOV0+5mZUzIQ1JooCB6aPwEFBQ7XAbie30zeADV4hCRaxt
         X9Qw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8e44eO5mhkXrtajRCOPRDy1K87cZhwjLvbQcnf+QboWC/GC4TVbeG/IOnHgAMWkvMHpD3HTVz39dd7A==@lists.infradead.org
X-Gm-Message-State: AFuF++mup5zT/o9lCSvvCbleTgb8OP6OZqMgOcRTGIXbgaQ0IMvdohuI
	+7WA5RTmhsd/k3RVP4pV06gijHGPpyogR/yuPDqK/NtPBZQ7OaMgTw+B
X-Gm-Gg: AR+sD11x2WsUUjT9fyjIm/ef9rc5FpioFMaP4WmMnl9TTnBeMqX26hXNTXRO19Hj+h6
	NUCYObdQVp7tvPbSOmLCfFs3kTqYxbYHQMS+Rlm6BPqcSFj1DrnjV5sYX2IKKiH/eWHm7wmu7e1
	w/YpM6yoZ8JdIyFCnQU8FvAjAjiumHmodL2WmX7x9O7T5TqwmkxNHr6c+M1Aehxa3Trrb0JHwCD
	M4hcTBUHw46evusJuZDdWVrsfSZgBKmY9SBi66ON/69OoaDe2h6OXJSLfad7eW99Iys6OdNChi9
	naggoA08OP4RE6IfXv0EFscbqMlxzheG/ZE/BWMA53uBZI8UVb35F6hkCiqsYgBrrxz5l6wfaFH
	CFOTalh1w3y//P1huAGpt1lTplLG6gQxejOgXSUHxdNtNKCN451HFvQLBNamRQ0KhjyhgtYSrql
	5V9zl2GulNiXh7Rm54yEof+jKsnzAlipBaNBvNZlLKOutD002yTleSzKzL2F8=
X-Received: by 2002:a17:90b:4a82:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-395dee5610fmr4115491a91.2.1787364817123;
        Fri, 21 Aug 2026 19:13:37 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c91348e2sm1571108a91.2.2026.08.21.19.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 19:13:36 -0700 (PDT)
Date: Sat, 22 Aug 2026 10:13:34 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, chen.wang@linux.dev, 
	inochiama@gmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Longbin Li <looong.bin@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Enable ethernet for Milk-V Duo
 256M
Message-ID: <aokFbP7wArV58T9E@inochi.infowork>
References: <20260803163323.74414-1-chenyou910331@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260803163323.74414-1-chenyou910331@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_191338_708904_57384C78 
X-CRM114-Status: GOOD (  18.45  )
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

On Tue, Aug 04, 2026 at 12:33:18AM +0800, Chen-Yu Yeh wrote:
> The SG2002 has an internal ethernet PHY, but on the Milk-V Duo 256M the
> ethernet signals are only routed to the RJ45 connector of the optional
> IO board.
> 
> Enable the GMAC and the MDIO multiplexer so that the interface is usable
> when such a board is attached.
> 
> Tested on actual Milk-V Duo 256M hardware: the GMAC probes, the MDIO
> multiplexer selects the internal bus and the internal EPHY is detected
> at address 1:
> 
>   eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY]
> 

> Link-up was not verified for lack of the IO board.
> 

This is not acceptable, I agree with something like DT overlay for
support external IO board to enable this. But you should not enable
this by default. As other may want to use this as GPIO.

Regards,
Inochi

> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> index a2797c0bd767..1462a96a1c12 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> @@ -49,6 +49,14 @@ coprocessor_rtos: region@8fe00000 {
>  	};
>  };
>  
> +&gmac0 {
> +	status = "okay";
> +};
> +
> +&mdio {
> +	status = "okay";
> +};
> +
>  &osc {
>  	clock-frequency = <25000000>;
>  };
> 
> base-commit: 11881041b745b444e4f6c87a2748f1951cf02742
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
