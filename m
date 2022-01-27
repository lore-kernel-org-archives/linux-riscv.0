Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE2AC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 07:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1dGgITj3q5KB3yi8moy8Vl9tam1MeHyn1nIIuZREjc=; b=QS/WJZ6cWMQFkW
	SRyFVL6hxsSxkO+zZ990Bzu143anVDxZ7d/ApTx308cq4gfD3BdfiAid4GlgN7VKnBSv3TKablNQ7
	O5IKDe2gHehvnQH6+rxn2YvMO/1Y/OidgTh9a6D9XO0bVc5pTYEUfHEdJCnX+9HXkho8HMoqqOl6V
	nKNRQgTBlhHIzr2chUNrWsjVNQcahvDbeoNB3aQLXB2Ageqq3kPyN8wd1am6rXPTv3SYjqYfpL03P
	S9ovumNaVRQ3ngcHbJeZ3xMjt0tGSilWlPekd1HN41SKOHPWtNyYV4qDfrkbUZWAAcLHiryP3bX0s
	37ZZp/X56P5dRLkPZ2jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCyp5-00EbMS-BX; Thu, 27 Jan 2022 07:03:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCyp2-00EbLt-5u
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 07:03:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BBE8F6195D;
 Thu, 27 Jan 2022 07:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8A5C340E4;
 Thu, 27 Jan 2022 07:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643267035;
 bh=rVD0fNy0bHKOsHsV7IPqLXUyMJvfQuj7ygoyxxP4qC4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tCmpCcLYDfjiMMy+DuRgqx6vluJdfbhMOZkWMtUHfQ1FPyflbWdzAYwYQWiSxFzep
 ULw4GEZj5JOHfY/XmsnxZsFakYlEW4ByaZhGtYqvFInM8PMgoNQkV6IO5IxIbKUjDm
 MGgBYPmJC+SOO9D3af7LVwSR86dkb9Ebxx+9oyE7kczukhUJNJoY0wuKhVG69wQdaW
 MK9wvVwwxePncyTbhAUz3IdUZ8m0/TpEUgLx4D02EtMjigTeHOxVOdhWjYpolA/CLd
 T44UAR1q/xJ2osHtf61kWFdC+Ge0SbazJl8Ae9ZRJGSS7nbCKE1myB7NhgWgYpSCBd
 Ttg7qF9ql7nSA==
Date: Thu, 27 Jan 2022 12:33:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Zong Li <zong.li@sifive.com>
Cc: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org,
 bin.meng@windriver.com, green.wan@sifive.com,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] riscv: dts: Add dma-channels property in dma node
Message-ID: <YfJD11wlgkzuE+Sp@matsya>
References: <cover.1642383007.git.zong.li@sifive.com>
 <163a2cf11b2aceee2a1b8dc83251576d2371d4a6.1642383007.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <163a2cf11b2aceee2a1b8dc83251576d2371d4a6.1642383007.git.zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_230356_294531_A9CFDDC3 
X-CRM114-Status: GOOD (  14.59  )
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

On 17-01-22, 09:35, Zong Li wrote:
> Add dma-channels property, then we can determine how many channels there
> by device tree.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 1 +
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi        | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> index c9f6d205d2ba..3c48f2d7a4a4 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -188,6 +188,7 @@ dma@3000000 {

Unrelated but the node name should be dma-controller@...

>  			reg = <0x0 0x3000000 0x0 0x8000>;
>  			interrupt-parent = <&plic>;
>  			interrupts = <23 24 25 26 27 28 29 30>;
> +			dma-channels = <4>;
>  			#dma-cells = <1>;
>  		};
>  
> diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> index 0655b5c4201d..2bdfe7f06e4b 100644
> --- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> +++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> @@ -171,6 +171,7 @@ dma: dma@3000000 {
>  			reg = <0x0 0x3000000 0x0 0x8000>;
>  			interrupt-parent = <&plic0>;
>  			interrupts = <23 24 25 26 27 28 29 30>;
> +			dma-channels = <4>;
>  			#dma-cells = <1>;
>  		};
>  		uart1: serial@10011000 {
> -- 
> 2.31.1

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
