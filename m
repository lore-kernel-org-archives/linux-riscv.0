Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8041AC5DF8C
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Aug 2026 02:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=usvvBaQ0S6YzdMJqwdk6CLfw1+KTZ2Hdv3iTMgKg6ac=; b=Ry7oY2mBcpkdt5
	/HRS5F4rkzpycPs8cPAbEkXBDqd4teaoW+KHyK7NPG2ok9nYNzqfiNIGXVJdTE/Kx682qjId/X5ge
	FF2C8jhNF8W2erw3QS0xRFJm2KCrPV2B7iAb653FTjLgffIBXnArWWgQWRpHMJEc/XVMfMgBp7Z8C
	q2ikjk9XF5+2bQrlKfN2UgmZdngTO/dGipqmXbtwXoXbGLGPMrIcUwh5omLryV2EtzLFZnOPZBJ9G
	euLL3E7/aLo3SOUBdE0XkuHXgAV+kDWFvkPmQD+M4YgK1yWlqzaZR9A8jyswcsjvZsBHB3mj1dq3d
	Uim29M5GFyDZJQ5kes2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxbIS-0000000EFDd-0JjX;
	Sat, 22 Aug 2026 02:17:24 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxbIP-0000000EFD9-2BJy
	for linux-riscv@lists.infradead.org;
	Sat, 22 Aug 2026 02:17:22 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38e347638adso1508695a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 19:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787365040; x=1787969840; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/PxFsvPnSSLfiQZIwj6VRATAaTC/AW3c6fVX+c2YbXM=;
        b=ersfHoj5ukyQU+HLe7tC9CcwmQjuHqyr6E5Mw2rk+tnnLrvIm2PgFZh66mDlD6rTte
         uxfjt1A/g0cDKlfMfL3wFaG2uojC4C+leXAYRPllHFZkkovqPdzs2CRrkTA8p3o5qcaV
         mCH48isR521jrL1wuyHUJlg+vyqKjp9RqU9aVVCC+iU7+B8p/1d03abKPlbeHYnhs/IB
         rX2zhMSigvKNtfVRThOZzjgLR5Mg/nw+prFh043CBG5XXWYhnHUHhihER8yuGi2limpv
         vJ7FAshBf6BHM/PLaWgO0nm05h2XTSk5OscRHLlDdQmgYhjipE0jPj/LCIw4ivOW12VS
         GqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787365040; x=1787969840;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PxFsvPnSSLfiQZIwj6VRATAaTC/AW3c6fVX+c2YbXM=;
        b=tXdpGmXthWr0//MhdZK+z85KW6LdinKL+/CNFgfkmbiDlYuHITCH8Xn7h8NVqxlTH5
         89Fxlim5n5SR3snOdSQ7liEHDMQ8P8UwF4flNKIJG1oL/5X69TED/QwHdVI+m/sGcfJe
         D2ajCl+7Q6sSxBIQYIGAwCXC6InHkb2XHpu1EbC+tzTqe+YDPSC08VwQZ+6KlS2Z2Q97
         XB9a9fvimWuVrVn3PP6BtU8wBTKaKVc1XZnM7/N5LI6tv768ifEs0TnCHNaLVCD0++50
         2/ZxBwh3GaL5gZZUrURK6sz1Np41DYcHq0VMje5kOFg3X8jWSoIwGwzR5PqxL6waq8P4
         WxLw==
X-Forwarded-Encrypted: i=1; AHgh+Rqe7lUUiVnUcxpUGjS0IaL0vtWOxU/5yrXdzWX8niuB7kcSRK9cRNrX3/cR7i4+H9gIQHgku4iMJ9jm5Q==@lists.infradead.org
X-Gm-Message-State: AFuF++keKpl/CvOU97d/JhXYKeuwfBEUbb8U9NkInJsNyfJ9MuWcDupx
	qZSOfU6sg0QQZvIC/SfM7e4LvdTdTyCmXacEVINaGz/bQVp6XwWdfK07
X-Gm-Gg: AR+sD1274UBlsukbJuS0klA4b3G42BHjeEJTcjY4VWx1AyyBhnNgrO6q+eb7ZxhJn+z
	adiU0h587eI/eyFIu+MA+fCigj/K+BOXqZGfdvkqBu3hwObA+k67OWZOSFK7DtE+54rLOM6iEeL
	Mob2r6AOwAcw0pTYfOJKVBeE9rRsR1JJxINNV59/0bsikTXjxT9vTbC5A82Dbu2gjtcQg0WGCQm
	BWafcVbPBqcYgDBcO37lr7hwOeOUqF7+9Fezkjv+b09GojTD8fMcng3/d8MP29C9u3rwbf4/yox
	ljceGn1TXa8KB22zfIdECeyLAnEBtAcSBJSvU6k/4fSDTMGuG47qx0oXpOPjnVAWW+GO/Lc9b4k
	LwEflkExW4v52tf+v/yEbdxltCS9CmfAaoj+uDQu6b/y2BB8S1ANs1jbCW1S3npe1TxP3APxXlE
	et9lyb4joGsxUfNHZJBDUTRYiaSWC8oW4pVxBu/AtKI6mh8XbDWShch5ij7IFbEOD4Nk2kng==
X-Received: by 2002:a17:90b:5790:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-395deecf08fmr5441511a91.7.1787365040304;
        Fri, 21 Aug 2026 19:17:20 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e49b406bsm961123a91.8.2026.08.21.19.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 19:17:19 -0700 (PDT)
Date: Sat, 22 Aug 2026 10:17:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v3 1/5] riscv: dts: spacemit: k3: move USB3 phy to board
 level
Message-ID: <aokGbT7XTCbxUQzl@inochi.infowork>
References: <20260819162115.2252812-1-aurelien@aurel32.net>
 <20260819162115.2252812-2-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260819162115.2252812-2-aurelien@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_191721_561165_8811040E 
X-CRM114-Status: GOOD (  22.26  )
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

On Wed, Aug 19, 2026 at 06:15:42PM +0200, Aurelien Jarno wrote:
> On the SpacemiT K3 SoC, the combo phy provides 8 lines that can
> either be used for PCIe or USB3, depending on its configuration
> (spacemit,apmu). This configuration is defined at the board level, and
> assigning a phy line to a USB3 controller while it is configured as PCIe
> results in an "Invalid PHY mode" error.
> 
> Move the USB3 phy at the board level, the as it is done for the
> submitted PCIe controller [1]. Keep the USB2 phy at the SoC level as
> there is one phy per USB controller.
> 
> [1] https://lore.kernel.org/20260727094726.890179-3-inochiama@gmail.com/
> 
> Fixes: 46380e4b1534c1626cecd7f4d0abb5e0cce09af6 ("riscv: dts: spacemit: k3: add USB controller and USB phy support")
> Cc: Inochi Amaoto <inochiama@gmail.com>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 +++
>  arch/riscv/boot/dts/spacemit/k3.dtsi         | 5 ++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index b084a35aa00e..171bd2f40aa6 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -328,5 +328,8 @@ &usb3d_u2phy {
>  };
>  
>  &usb3d {
> +	phys = <&usb3d_u2phy>,
> +	       <&combophy 4 PHY_TYPE_USB3>;
> +	phy-names = "usb2-phy", "usb3-phy";
>  	status = "okay";
>  };
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index c3f2dce0969c..3e24054d2084 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -452,9 +452,8 @@ usb3d: usb@81a00000 {
>  				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
>  				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
>  			reset-names = "ahb", "vcc", "phy";

> -			phys = <&usb3d_u2phy>,
> -			       <&combophy 4 PHY_TYPE_USB3>;
> -			phy-names = "usb2-phy", "usb3-phy";
> +			phys = <&usb3d_u2phy>;
> +			phy-names = "usb2-phy";

I suggest removing this completely as we can not determine the
phy we used. I think it is suitable for setting this in board
file only

Regards,
Inochi

>  			phy_type = "utmi";
>  			snps,dis_enblslpm_quirk;
>  			snps,dis_u2_susphy_quirk;
> -- 
> 2.53.0
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
