Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544F7C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 02:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Qs+BZu0g8yeg2xiZ/lT7qeyePRkRaRlcypXRR8k7Ww=; b=ams1KxeFPi+Bsi
	t4r0nXEVg7Y1bEFGkt+4ygC3/TAhXjrwbQbO0Fm8AoQKz7188p3kzFTSzjw77JRQ0a7TAkFkjVKmZ
	YocpeuNNwVLSFprMnPW31OQdJzGNtALvv+uT/1MdlKdVY0RSrHoRsaMiw6BWbElCMhMxuOdC/VKJy
	XifDEm2eS/nYOQxhyDjfobHRVC6Z6QEpxqUaD6VVOYpae1EWg3uWNGACMGuebC0i6dxgI5mpPeoM6
	dCHYPDM0oUmqY4ABarQnraQZsjEqAeSvqQc+XiIIWO4prmyXpeDzXcJiBWHQTAmZeKJcxweAjCSap
	k3KWLIAP5S8+aEcnXbWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi0w8-00000003xNn-3px4;
	Fri, 10 Jul 2026 02:25:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi0w7-00000003xNe-16a5
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 02:25:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 103886001A;
	Fri, 10 Jul 2026 02:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB331F000E9;
	Fri, 10 Jul 2026 02:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783650353;
	bh=IWdxRNQcvqbzwNQ55npFJS3Ygeq6C+SURBr82oQYTf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cOQ5DQaF2aj4ylcwfgro0w5oCT1iPh+MqmXKEZFaUUyAu2Ch0zdFr7I1Xzio4Np9o
	 9PLtwD2OpLN6BOl6eOnBFNQYs6544331Uic2udXo9SFNPI+OL7qGUN5oh9awiBfF12
	 LaHpIorJRpXLzl82beq17UYT22qv4SlhHlrMVR3Sbf4RF3F0gUPbgis765BCh2/Ggq
	 M7Q7ZFmSvcxvttCQ/R+pnSYhJbR9JyFMAJ3TSFS+4rTwhIoL1iiip/Qc/M+pU0BNnJ
	 kMTm2uirzZ27LVOtNm2hh5DwnFERPAOs1Dnn0MgSkOrBMTIl4bHSK39XSrRf+uYJ/+
	 mcp0hqoB3+csg==
Date: Fri, 10 Jul 2026 02:25:51 +0000
From: Yixun Lan <dlan@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Andrew Rembrandt <kernel@rembrandt.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3-pico-itx: Fix non-functional
 ethernet TX timing
Message-ID: <20260710022551-GKA106000@kernel.org>
References: <20260608182358.170489-1-kernel@rembrandt.dev>
 <aiemGajqcQeY9avz@inochi.infowork>
 <aihYftGNcpUd4UUR@mcmanus>
 <aiid4Y6x6Dbbwszf@inochi.infowork>
 <aikmOfazxdrhpty7@mcmanus>
 <77a48b81-7906-4e18-9229-48643a67f402@freeshell.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <77a48b81-7906-4e18-9229-48643a67f402@freeshell.de>
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

Hi E Shattow,

On 00:29 Thu 11 Jun     , E Shattow wrote:
> Hi Andrew,
> 
> On 6/10/26 02:05, Andrew Rembrandt wrote:
> > On Wed, Jun 10, 2026 at 07:14:56 am Inochi Amaoto wrote:
> >> Do not do this, just leave the rx-internal-delay-ps untouched.
> > 
> > Sounds good, I'll leave v1 as-is. Many thanks for the review.
> > 
> > Regards,
> > 
> > Andrew
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> I do not notice any difference with or without this property present,
> tested Linux -next with U-Boot modification to devicetree:
> 
> load usb 0:1 $fdt_addr_r /dtb/spacemit/k3-pico-itx.dtb
> fdt addr $fdt_addr_r
> fdt resize
> fdt header get filesize totalsize
> fdt set /soc/ethernet@cac80000 tx-internal-delay-ps <400>
> load usb 0:1 $kernel_addr_r /EFI/BOOT/BOOTRISCV64.EFI
> # throwaway use of ping is workaround for broken vendor U-Boot
> ping 127.0.0.1; bootefi $kernel_addr_r $fdt_addr_r
> 
> Aside, there is still some problem with the driver which does cause it
> to fail. This can be reproduced by unloading the module and then loading
> the module; built from -next with 'olddefconfig' of debian Kconfig for
> kernel 7.1, no patches.
> 
> # modprobe -r dwmac_spacemit
> # modprobe dwmac_spacemit
> [   61.469745] spacemit-dwmac cac80000.ethernet end0: cannot attach to
> PHY (error: -ENODEV)
> 
> [   91.544646] spacemit-dwmac cac80000.ethernet end0: cannot attach to
> PHY (error: -ENODEV)
> 
The problem is unrelated to this patch itself, but I can actually confirm here

> If not reloading the module then I don't see any difference, traffic
> passes (ping 1.1.1.1) with or without your suggested
> tx-internal-delay-ps property. Is there a specific test to run to
> observe expected difference?
> 

Although I haven't narrowed down to the root cause, but it's kind of
something wrong with the reset procedure, remove it from phy node will fix
this issue..

+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -232,9 +232,6 @@ mdio {
                phy0: phy@1 {
                        compatible = "ethernet-phy-ieee802.3-c22";
                        reg = <1>;
-                       reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
-                       reset-assert-us = <10000>;
-                       reset-deassert-us = <10000>;


-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
