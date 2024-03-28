Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C63CC54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 10:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kAtT9N7wDAr/DNMhlXH9mywU+NJmEKvppH3dv48kDfI=; b=Q53KZYffYUKbDG
	V55mfTvIC48cHvXfst4ovlLUWAWqBhSdQtLgL0CNbNDWxeTXMEmxCdC0nWKw4kTN0Mdr6HaK4Z+jv
	TA5BKEJJsrztYvnZg/AxS03AbW6Ol5ETqfDSqIonsUn9tnJv51KgwkgtrgUI2QCL9GEqLkvihpi00
	yolMnWlkjXcAWznIBgI4IQmByve/KLk/x9ONEHB3Sx6tN8Vh2jPM3LB/GAyzJs+FkuBcS7J6QAKXy
	ODj7UlaYhnsSeidiBOtCBEqpXawFmv/Aw0zFmMTlp/Hy4rfE2qeySN0bqe/HPRmFqZ5kkyP+4iLcY
	xXnWDN/118lOxtakcybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpmtn-0000000DXiB-2A0i;
	Thu, 28 Mar 2024 10:22:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpmtl-0000000DXhL-14VC
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 10:22:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1FD561180;
	Thu, 28 Mar 2024 10:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B0EC433F1;
	Thu, 28 Mar 2024 10:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711621335;
	bh=SKKICtTKjPR9yyFA9IuYbQmFcXbc8Pa5AvB15RTwNp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DmT/LzuK8Fhxhn89z1WozrQ/vfZaBQGm57L9S0wsjaPNyYz6AQO3EqPfXp8TuADjJ
	 KnCLjXcivr/1Hr8aM3VmUtioJMSoavC1Nube1XBSrhmISzzMJg30vz7+iqmWvHBC8X
	 sxKFI1uxKzbv6cqT9PpjkYWl8Pqb1L1Uw256dz0SgFReghmPCs/XV5sBs2P1dtah75
	 GeAWD+sPu0cPRAVKf2kCsjqWBlVZtmUgDQ7ONtaa8mA10usHQd8zOIuz0HMY9Omtou
	 83F2BWfm4T2roHfl/obPuBRkV3dq3WjYeRaoBNRT5+gf47zl6zlQhf96tBmLF1t3Kz
	 QuG1Vm4/TF4Hg==
Date: Thu, 28 Mar 2024 18:08:58 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <kernel@esmil.dk>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] riscv: dts: starfive: add Milkv Mars board device
 tree
Message-ID: <ZgVBurohYRDzFjgb@xhacker>
References: <20240131132600.4067-1-jszhang@kernel.org>
 <20240131132600.4067-7-jszhang@kernel.org>
 <20240206-magma-deem-2c88e45a545a@spud>
 <20240327-cotton-fang-37f6d8fde0e5@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240327-cotton-fang-37f6d8fde0e5@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_032217_363323_0AADE577 
X-CRM114-Status: GOOD (  18.36  )
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

On Wed, Mar 27, 2024 at 06:06:58PM +0000, Conor Dooley wrote:
> Yo,
> 
> On Tue, Feb 06, 2024 at 07:13:48PM +0000, Conor Dooley wrote:
> > On Wed, Jan 31, 2024 at 09:26:00PM +0800, Jisheng Zhang wrote:
> > > The Milkv Mars is a development board based on the Starfive JH7110 SoC.
> > > The board features:
> > > 
> > > - JH7110 SoC
> > > - 1/2/4/8 GiB LPDDR4 DRAM
> > > - AXP15060 PMIC
> > > - 40 pin GPIO header
> > > - 3x USB 3.0 host port
> > > - 1x USB 2.0 host port
> > > - 1x M.2 E-Key
> > > - 1x eMMC slot
> > > - 1x MicroSD slot
> > > - 1x QSPI Flash
> > > - 1x 1Gbps Ethernet port
> > > - 1x HDMI port
> > > - 1x 2-lane DSI and 1x 4-lane DSI
> > > - 1x 2-lane CSI
> > > 
> > > Add the devicetree file describing the currently supported features,
> > > namely PMIC, UART, I2C, GPIO, SD card, QSPI Flash, eMMC and Ethernet.
> > > 
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > 
> > Got a dtbs_check issue in the patchwork CI:
> > 
> >   +arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: gmac1-rgmii-rxin-clock: 'clock-frequency' is a required property
> >   +	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
> >   +arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: gmac1-rmii-refin-clock: 'clock-frequency' is a required property
> >   +	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
> > 
> > Can you fix that please? Also, I applied some patches the other day that
> > seem to conflict quite a bit with the common board dts patch. Would you
> > please do a rebase on top of that please?
> 
> Been going through stuff on my todo list now that the merge window is
> closed. Could you please resend this with the rebase done?

Thanks for the reminding, I will rebase on 6.9-rc1 then send out the
patches.

> 
> Thanks,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
