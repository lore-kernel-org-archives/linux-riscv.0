Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24B1D262AD
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 00:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hx2IlDg/amvAgzXw1rMMyVtjEIEoCgzw3BbNIcCE6TU=; b=ZCBihEI1YPD798
	JXwLtVZ4vP7rEXjQkPwNU0Xpnr9wAaA7TahxlEpsTk4e0WuoweLx3960RU1VxVRPIWAtihJS3q/oq
	mZslqFubcZeOeZRR73pjNxyizF2OOQ5VYGvqcy9gbiHay1JFX2MPqiKJoGjY05tub8f46PV//PGjd
	yQhbMrnL+fIX1hI9d9LXrwpxNMlQrvJ9LqnzHgJkcmUzL8vMi6C+qG4bO48SE/Sy2tpTBxM6rlfAw
	njrlXzvNfL/7UXk9FAQziJz10HCUKcNgklTWtJXn14tAuCMyHyb02exgv6eoJptefHsbS6PXyJnbp
	62DkJcTF/ZmxksCDdFZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viMQB-00000004g6b-2Vvr;
	Wed, 21 Jan 2026 00:50:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viMQA-00000004g6U-1hUk
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 00:50:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78E9360010;
	Wed, 21 Jan 2026 00:50:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0BE7C16AAE;
	Wed, 21 Jan 2026 00:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768956605;
	bh=CrwiPhrrePlnWr+/pU7wM0Ao6MmtP3GAWFek3sVv3oQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oTFoNRpPAa0qgH4Fq5zG8CfEnQZlyyDc39ssKk6FLKNFIpMeN85Nhd15fXqLT97Bn
	 LOPAY0jLtWG4zvb6CQL79xJAbqbuU4yQSj1JGpqFkzLevIcX/oUQt43VmBP9/E1O4T
	 7if+oBiV1e4sm+5WQAnntfMK/NixdR7M+smSES4m4NGcf6GN8T7dqd1F7JB211559z
	 cwRllHESDEsg+ca8Yw10IUZqn7kXNi93ov/nTZCY5/fPAk0npomuWZw6R84HzMkREH
	 z7VK5wusSkyjEy7KBFVKj5j5RiUwMpQJO6znLMy8l1HdAp8VXr6QWvtVTwtuRTsBtz
	 y8d4FrnPayRUA==
Date: Wed, 21 Jan 2026 08:50:02 +0800
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: Disable ETH PHY sleep mode for
 OrangePi
Message-ID: <20260121005002-GKA61591@kernel.org>
References: <20260120100001.1285624-1-amadeus@jmu.edu.cn>
 <20260120100001.1285624-2-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120100001.1285624-2-amadeus@jmu.edu.cn>
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

Hi  Chukun,

On 18:00 Tue 20 Jan     , Chukun Pan wrote:
> On the SpacemiT K1 platform, the MAC can't read statistics when the PHY
> clock stops. Disable Link Down Power Saving Mode for the YT8531C PHY on
> OrangePi R2S and RV2 boards to avoid reading statistics timeout logs.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Looks good to me

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts | 2 ++
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> index 58098c4a2aab..de75f6aac740 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> @@ -52,6 +52,7 @@ mdio-bus {
>  
>  		rgmii0: phy@1 {
>  			reg = <0x1>;
> +			motorcomm,auto-sleep-disabled;
>  		};
>  	};
>  };
> @@ -75,6 +76,7 @@ mdio-bus {
>  
>  		rgmii1: phy@1 {
>  			reg = <0x1>;
> +			motorcomm,auto-sleep-disabled;
>  		};
>  	};
>  };
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 41dc8e35e6eb..7b7331cb3c72 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -54,6 +54,7 @@ mdio-bus {
>  
>  		rgmii0: phy@1 {
>  			reg = <0x1>;
> +			motorcomm,auto-sleep-disabled;
>  		};
>  	};
>  };
> @@ -77,6 +78,7 @@ mdio-bus {
>  
>  		rgmii1: phy@1 {
>  			reg = <0x1>;
> +			motorcomm,auto-sleep-disabled;
>  		};
>  	};
>  };
> -- 
> 2.25.1
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
