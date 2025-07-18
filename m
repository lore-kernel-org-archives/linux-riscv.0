Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19718C83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 09:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPb6YS5vYlPRtk/c3xP/CHuZpgan52RXQIsQzrdwaMg=; b=ipA7p7oFx9VFwo
	+srcsZqMyzx2hbSkIWoRx2NvXBCl3bi0i6fDb5nFxI3oMDwisSrmiXGr54k0NPa+ojbgyBiEz7DrS
	ITg9uc0PKvHEXbrayCci+WtNVIH2Y4Koqpge85ltUUP3Xp62ZGT7ELKvh1G5Vlv2AASbSLS+nfUBB
	fWGtrzOAYnn3DdltuZ7SjSz880j2Vq8CP5mztFWYLfeo4egRGZYLe1LaAhMUNteYjp77dY0rhxK8S
	ei3m+NcpiB4wDZECg3ZHJKXzAtyzz0ntTZhYpbZgsNrkj7oNHyakBQdJTWXVgUjp9ywWreGlj5/IW
	XyDnAlgp6CMcdCow2ClQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgyZ-0000000C72O-2w5S;
	Fri, 18 Jul 2025 09:01:55 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucguD-0000000C6GI-3LEZ
	for linux-riscv@lists.infradead.org;
	Fri, 18 Jul 2025 08:57:27 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C9436340EF5;
	Fri, 18 Jul 2025 08:57:23 +0000 (UTC)
Date: Fri, 18 Jul 2025 16:57:18 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	palmer@dabbelt.com, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] riscv: dts: spacemit: Add initial support for
 OrangePi RV2
Message-ID: <20250718085718-GYA695709@gentoo>
References: <20250718084339.471449-1-hendrik.hamerlinck@hammernet.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250718084339.471449-1-hendrik.hamerlinck@hammernet.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_015725_856334_3071CCD2 
X-CRM114-Status: GOOD (  14.98  )
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

Hi Hendrik,

On 10:43 Fri 18 Jul     , Hendrik Hamerlinck wrote:
> This patchset adds initial device tree support for the OrangePi RV2 board.
> 
> The OrangePi RV2 [1] is marketed as using the Ky X1 SoC.
> However, after research and testing, it is in fact identical to the 
> SpacemiT K1 [2]. This is supported by the following:
> 
> - Similar integration in the Banana Pi kernel tree [3], which uses the 
>   OrangePi RV2 and identifies it as the SpacemiT K1.
> - Comparison of the device tree code showing a match to the OrangePi RV2 
>   Linux tree [4].
> - Locally tested the OrangePi RV2 with the SpacemiT K1 device tree, 
>   confirming it boots and operates correctly.
> 
> Patch #1 documents the compatible string for the OrangePi RV2, and 
> patch #2 adds its minimal device tree. This enables booting to a serial
> console with UART output and blinking a LED, similar to other K1-based 
> boards such as the Banana Pi BPI-F3 or the Milk-V Jupiter.
> 
> Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-RV2.html [1]
> Link: https://www.spacemit.com/en/key-stone-k1 [2]
> Link: https://github.com/BPI-SINOVOIP/pi-linux/blob/linux-6.6.63-k1/arch/riscv/boot/dts/spacemit/k1-x_orangepi-rv2.dts [3]
> Link: https://github.com/orangepi-xunlong/linux-orangepi/tree/orange-pi-6.6-ky [4]
> 
> Changes in v2:
> Patch 1: no changes.
> Patch 2:
> - Added aliases section to the device tree.
> - Removed the memory section, as it is populated by the bootloader.
> - Updated copyright header.
> 
Looks good

Reviewed-by: Yixun Lan <dlan@gentoo.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
