Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8534DC98315
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 02:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZyW74QGoWv+u+whdEzQQXu+wvOxGcfuwgUtyHCwRSaA=; b=amoRjv5MrL8YQr
	o+Umme9UB+S+fGV/tlZEGF8n/UJAyn+CgYtPYjEG4PonLmw25RjrDJvk0jptQNCd0niO6G12EiUS0
	Y3Zao0nfMnXLAhZL86bamHTj02zHbilV5Qki0X+xwyRtP5kw/fiPlp3X5Za7pMWo0PHdLEt+aFhU/
	FCmwJL2t8JXTQ2FKVT85pj+U9YXKolTJ5Qozyxia/ptl/F1vP/OieiJkVXWGu5wzNNHCcDblpM4VL
	HqWmeDxWmtWivKwTLSEAsCXJsLznghcYAL3sa2NNO6EPUxytpATjtPFM+foUP8f801LwIerir0gAZ
	V+hhJZsE4AbUMJ+AHxZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhfEY-00000001Hj6-3lb3;
	Mon, 19 Jan 2026 02:43:14 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhfEV-00000001HhW-28Ln
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 02:43:13 +0000
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6FF5D340D48;
	Mon, 19 Jan 2026 02:43:06 +0000 (UTC)
Date: Mon, 19 Jan 2026 10:42:55 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: add common board dtsi for
 OrangePi
Message-ID: <20260119024255-GYC47382@gentoo.org>
References: <20260116100001.208334-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260116100001.208334-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_184311_572256_99CD53DF 
X-CRM114-Status: GOOD (  13.82  )
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

Hi Chukun,

On 18:00 Fri 16 Jan     , Chukun Pan wrote:
> The OrangePi R2S and OrangePi RV2 boards share many similarities, the
> difference being that the RV2 board has more peripherals, such as HDMI
> and Wi-Fi. Create a dtsi for shared parts to reduce duplication.
no, as I checked these two boards having too many differences that
I don't think it's worth trying to create a shared dtsi file

> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 69 +----------------
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 69 +----------------
>  arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi | 76 +++++++++++++++++++
>  3 files changed, 78 insertions(+), 136 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> index 58098c4a2aab..393270641b04 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> @@ -5,22 +5,11 @@
>  
>  /dts-v1/;
>  
> -#include "k1.dtsi"
> -#include "k1-pinctrl.dtsi"
> +#include "k1-orangepi.dtsi"
>  
>  / {
>  	model = "OrangePi R2S";
>  	compatible = "xunlong,orangepi-r2s", "spacemit,k1";
> -
> -	aliases {
> -		serial0 = &uart0;
> -		ethernet0 = &eth0;
> -		ethernet1 = &eth1;
> -	};
> -
> -	chosen {
> -		stdout-path = "serial0";
> -	};
>  };
>  

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
