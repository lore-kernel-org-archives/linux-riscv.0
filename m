Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFEDC4707B
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 14:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1s0+qcBaENvDgsA3f0YdTRpx8jpfG0apQHj6oOt2W4U=; b=zPLqRQJiPooch5
	wh6Y5uM9fCJ3ArqNBEKEimsbU7crOopdz71C2l8PAKBFVabpRHYn5kVmLmKkaTzgEa1XdgVXZDazz
	v17OjorJn8bvPRwX/d1cu2/9WAdXGEzXzwX2jkCKh9ML5kDpDdwHoFMgRO300DhoRdl78Y/+d3lle
	tfy1t8a4hxElpnPPSC5Ysm0jgKo9HBHVz6bpaF2UD+gnCigEGyKrV/FwCmiLz2nCDKTEqQ/Kp3VzE
	kUM/VNuYrYgfnH11pCfmpHnbFPbjrz7WKlrNkHfxJg+W0DpjR20kuuSF5+UImWToX/0sOGT6NrmeA
	SkW5EMG2MqO0SUsQ5MPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZI9-00CCuC-2x;
	Wed, 10 Jan 2024 14:10:49 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZI4-00CCnf-2W
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 14:10:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 43399CE1C65;
	Wed, 10 Jan 2024 14:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C4EC433F1;
	Wed, 10 Jan 2024 14:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704895840;
	bh=eY10UxSczupCveV5wCR/tuzRKmbvyyPqzGr7zHPzSe4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oRycpO1REDWemAYzGCy71bi5syZzypvnGLZFml/7L23ZdPXbJpGrpExWnEYXVnhCO
	 3QIukT2p021LLY324GJ0hpNzicFUCNt93DPJKDfrlS2EMhc/QEvtZIEZAHHnkYh/Sa
	 QfnbtplBKkJCY+DN876SM5sljL9/BzO6tzfDg0KFozNjo+86DDQ/TTJehbcVXbyWBo
	 IVx77egR2tIh6V+zn7nZL2IP1k2fHe4brbrsBL9f0PeZwTqE2xKI3mfmnwsp2YfiwA
	 puIskItzVWI6OT27l2oRmyFe+IFvFOzRa7Kd2BMlQUN4YBnEQXeSaZ+5eSekV+kAz9
	 CCHIBlaYc3TUw==
Date: Wed, 10 Jan 2024 21:57:50 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/3] riscv: dts: starfive: add Milkv Mars board device
 tree
Message-ID: <ZZ6iXsDJVs3FIrOl@xhacker>
References: <20231202153353.635-1-jszhang@kernel.org>
 <CAJM55Z-9Y=QitvAX+z=XTTMM0CGRzGMD5z0H_Bzv=Q85b49rpQ@mail.gmail.com>
 <20240110-eternal-proofing-8a33201ff727@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240110-eternal-proofing-8a33201ff727@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_061045_236867_B011F586 
X-CRM114-Status: GOOD (  28.89  )
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

On Wed, Jan 10, 2024 at 01:53:11PM +0000, Conor Dooley wrote:
> On Sat, Dec 02, 2023 at 02:07:50PM -0800, Emil Renner Berthing wrote:
> > Jisheng Zhang wrote:
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
> > > patch1 adds 'cpus' label
> > > patch2 adds "milkv,mars" board dt-binding
> > > patch3 adds the devicetree file describing the currently supported
> > > features:
> > > Namely PMIC, UART, I2C, GPIO, SD card, QSPI Flash, eMMC and Ethernet.
> > >
> > > Since v1:
> > >  - add two new patches which add "cpus" label and board dt-binding
> > >  - adopt Krzysztof's suggestions, thanks
> > >
> > > Hi Conor,
> > >
> > > I see you have sent a patch which moves the timebase-frequency property
> > > to soc dtsi, but this series doesn't rebase on that. I can update it
> > > once your patch is merged.
> > 
> > Hi Jisheng,
> > 
> > Thanks for working on this! On the JH7110 the mtime derives almost directly
> > from the external oscillator like this:
> > 
> > osc (24MHz) -> rtc_toggle (div 6) -> mtime (4MHz)
> > 
> > So to me it makes sense to define the timebase-frequency in the same file as
> > the frequency of the external oscillator.
> > 
> > In general it looks good, but if you do
> > 
> >   diff -Naur jh7110-{starfive-visionfive-2.dtsi,milkv-mars.dts}
> > 
> > you'll see that those two files are almost identical. Even external clock
> > speeds and all the pin configuration are the same. I'd strongly prefer to have
> > all that factored out in a common .dtsi so fixes don't get out of sync.
> 
> I'm gonna mark this as changes requested on patchwork because of this
> comment. LMK if you don't think this is worth another version Emil.

Yeah a new version is needed. And I think it's a bit late for this
window, so the new version will be out once v6.8-rc1 is out.

Thanks


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
