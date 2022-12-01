Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCD8C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 19:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4HwHP5gRRa1Hg9m4XQKTfk7TOhai5FliBK7XtxMEyZ0=; b=O+tHVCAulwVYVQ
	E3La/nmhY+0nygzbiJ+6UqhudLcM0uLj73ul5uiBX2susN7ISzcNDtzT2+3NMGLnE8TgvsQ6ugBI6
	i3ztKtvpx9807GcEpNgISV5YL2T1vjCBBZdS8t1y5uDN78nIjyVesoIZRtiD5BXs/SSngASoeOaCY
	IjxZ+xEKMq9ziBigxNt9zGQWRpSCj6YSv969yC1TD4SD7UB1qgCQtfGcaTG4ZpkZjeGOv4/IL+2el
	tkuUxhW54P7VgzEY69/WVOE8Vgre2Fj+eolLMOY3ZxpPcBhReImUCsXPMc/5QOwt2vrmP/66jnyy/
	H01FmQO7JUG8SIfAV6MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0pWA-00AdKl-Oa; Thu, 01 Dec 2022 19:46:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0pS7-00AXoV-2S
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 19:42:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qHbGOUcw32092wDitkDdj/NcFV0kIbthIjQW9oIXmWU=; b=lebdUAMMbR6wv/+txOdgsXeA7U
	4TR4n6bN4En6BtjDtifGT/jC4Jvz8O/7se6Fv58sfVBmNfYQLzdVlJTvj/tAtIdY+MiIOFdxZLNK+
	OdCqIrxJgG0DHIieV12z+1GboXk0JEpAlwBuqjZYtTtiuRGlpBE065kNMCnr/lfBK5Rk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1p0pS3-0045jA-0Z; Thu, 01 Dec 2022 20:42:31 +0100
Date: Thu, 1 Dec 2022 20:42:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Conor Dooley <conor@kernel.org>
Cc: Yanhong Wang <yanhong.wang@starfivetech.com>,
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH v1 7/7] riscv: dts: starfive: visionfive-v2: Add phy
 delay_chain configuration
Message-ID: <Y4kDppmVnL3BV44Z@lunn.ch>
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
 <20221201090242.2381-8-yanhong.wang@starfivetech.com>
 <Y4jpDvXo/uj9ygLR@spud>
 <Y4kAyAhBseNmmDo8@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y4kAyAhBseNmmDo8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_114235_156168_83F8B5DA 
X-CRM114-Status: GOOD (  10.86  )
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

On Thu, Dec 01, 2022 at 07:30:16PM +0000, Conor Dooley wrote:
> On Thu, Dec 01, 2022 at 05:49:08PM +0000, Conor Dooley wrote:
> > On Thu, Dec 01, 2022 at 05:02:42PM +0800, Yanhong Wang wrote:
> > > riscv: dts: starfive: visionfive-v2: Add phy delay_chain configuration
> > > 
> > > Add phy delay_chain configuration to support motorcomm phy driver for
> > > StarFive VisionFive 2 board.
> 
> nit: please re-word this commit next time around to actually say what
> you're doing here. I didn't notice it initially, but this patch is doing
> a lot more than adding `delay_chain` configuration. To my dwmac unaware
> brain, there's nothing hits for that term outside of the changelog :(

Hi Conor

I suspect once we see the documentation of the binding, it will get
rejected and implemented differently. So i would not worry too much
about this at the moment.

      Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
