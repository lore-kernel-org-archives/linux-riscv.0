Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D338CD1284
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 02:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QpIMKiMneJ+C5PiMJAyV8ALcemkDWne1WFCQ99SZGQ4=; b=mVYILNb0r3U8Ma
	GGoJbAJ6/B+CQKm4vTg7qdNFmrV6vHg4yPuF40NtVHz1yXbT7H1E906o0J2eBI6yVO/SDPorqI9wj
	zwI36r+qB21KQlql+48yFRR6p1YB1T8kwItjWhP1nzGk4ODx+pLGNgOgLyFNvqTN5YlDluaZFSvYa
	qHwV2pxvEDe5SfP6UMMYZo0OUANYDDrT8KSBg02OIBKUnmevr4ayuhGSb+HG9kdaYYc4VskULaVBu
	41SrmI3skkPxcv1vX2Sc59eJOKPAo0CNY9bLlgW8lxb/FjPJibFjZKj/trIJ/MtI6WAh4z9lqpbCn
	tlO37bPX3o4X51O/7xrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq2Fj-0000000GZu7-3Y7H;
	Fri, 29 Mar 2024 02:45:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq2Fg-0000000GZsu-1XN3
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 02:45:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 805CBCE2C25;
	Fri, 29 Mar 2024 02:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F0FC433C7;
	Fri, 29 Mar 2024 02:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711680351;
	bh=j1YUfVQ6ICunpsAc5+qQcNo3yWuaSiK42DIxxNqCOBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fxK43KrPlx5P5kYFjlxotb1ClA1QKLmPe1CgdbhWdn+kUd1XZFBmiTR6tk7h2kV13
	 ACtIZgwAJEYjzSY1deB/KdG0t6nt5vdJHimhlZ6FGXathzYqs/S9Dojkc3F9NJSC20
	 ByEZ85yNoKT8/66OxG6BYd/WFtPCyoXBXQAFt1LXOmDaBmXnwoUiodCVP15W3Zq44b
	 /Jg4dS4+NhoBorWqwDY36hORNRXOXraMBIsh8bvfBFa3ICsCJIPhMuoSD+LKXC+xZW
	 Scu/xvIsuHtgEfntHASzxx/MZBWIPiSE7ych6jW4UHw/V0iwqiIIAOE2XpfvEmpgTw
	 wYjbQPvlhuTQg==
Date: Fri, 29 Mar 2024 10:32:34 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <kernel@esmil.dk>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] riscv: dts: starfive: add Milkv Mars board device
 tree
Message-ID: <ZgYoQnn6ef29F7xt@xhacker>
References: <20240131132600.4067-1-jszhang@kernel.org>
 <20240131132600.4067-7-jszhang@kernel.org>
 <20240206-magma-deem-2c88e45a545a@spud>
 <20240327-cotton-fang-37f6d8fde0e5@spud>
 <ZgVBurohYRDzFjgb@xhacker>
 <CAJM55Z8O20qjYmbjwOOE2CDCrWhCDGJ-jXY9TsR2hMSn-gEFtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z8O20qjYmbjwOOE2CDCrWhCDGJ-jXY9TsR2hMSn-gEFtQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_194556_772891_E490E21B 
X-CRM114-Status: GOOD (  24.97  )
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

On Thu, Mar 28, 2024 at 05:45:21AM -0700, Emil Renner Berthing wrote:
> Jisheng Zhang wrote:
> > On Wed, Mar 27, 2024 at 06:06:58PM +0000, Conor Dooley wrote:
> > > Yo,
> > >
> > > On Tue, Feb 06, 2024 at 07:13:48PM +0000, Conor Dooley wrote:
> > > > On Wed, Jan 31, 2024 at 09:26:00PM +0800, Jisheng Zhang wrote:
> > > > > The Milkv Mars is a development board based on the Starfive JH7110 SoC.
> > > > > The board features:
> > > > >
> > > > > - JH7110 SoC
> > > > > - 1/2/4/8 GiB LPDDR4 DRAM
> > > > > - AXP15060 PMIC
> > > > > - 40 pin GPIO header
> > > > > - 3x USB 3.0 host port
> > > > > - 1x USB 2.0 host port
> > > > > - 1x M.2 E-Key
> > > > > - 1x eMMC slot
> > > > > - 1x MicroSD slot
> > > > > - 1x QSPI Flash
> > > > > - 1x 1Gbps Ethernet port
> > > > > - 1x HDMI port
> > > > > - 1x 2-lane DSI and 1x 4-lane DSI
> > > > > - 1x 2-lane CSI
> > > > >
> > > > > Add the devicetree file describing the currently supported features,
> > > > > namely PMIC, UART, I2C, GPIO, SD card, QSPI Flash, eMMC and Ethernet.
> > > > >
> > > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > >
> > > > Got a dtbs_check issue in the patchwork CI:
> > > >
> > > >   +arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: gmac1-rgmii-rxin-clock: 'clock-frequency' is a required property
> > > >   +	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
> > > >   +arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: gmac1-rmii-refin-clock: 'clock-frequency' is a required property
> > > >   +	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
> > > >
> > > > Can you fix that please? Also, I applied some patches the other day that
> > > > seem to conflict quite a bit with the common board dts patch. Would you
> > > > please do a rebase on top of that please?
> > >
> > > Been going through stuff on my todo list now that the merge window is
> > > closed. Could you please resend this with the rebase done?
> >
> > Thanks for the reminding, I will rebase on 6.9-rc1 then send out the
> > patches.
> 
> Hi Jisheng,

Hi,

> 
> A rebase would be great. It looks good to me, but could you maybe call the
> common .dtsi something more generic like jh7110-common.dtsi like the
> jh7100-common.dtsi. If we'll see other boards based on the jh7110 upstreamed

make sense, will do in v4 series.

> (eg. Star64) I suspect they'll also be heavily based on^M^M^M similar to the
> VF2 schematics.
> 
> /Emil
> 
> >
> > >
> > > Thanks,
> > > Conor.
> >
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
