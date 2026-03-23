Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CEBEC01CC
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 11:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9DTprMPfzyPhelY6b6/mMSVcj5mvdoryaEO/UEdS3Ms=; b=sjyV6chDIg7hIy
	hEprz0Be6RmJnSKsSVCrBQKdsrBL6RmtVtWIRY8t6S/E33lazYJ+zmIwTFx95Lqd+gJuJC0EBzONs
	BmMRJa4dpvlBH/L9uabkqI3F2iWMb0ql05BDT9LNIp4s0WKhITT+vLQJeSwIrGlh1IMMAmHhUVybP
	Uf4YDb2izG93N1xO2tZUBQ/KwD44/cwORLnjXCrToih283CeyJCrNgpj1MPXGouj7pNOiBeWoAYMC
	y8Je3L/hkEOgESRf8WpHy6Au6gZ/ykFbBXTB4s8xluad8JBg8hH0TXyRWaSkxvoZpUfRJOj20sFmx
	OL/+xTjswGXsanfG2gVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dal-0000000GdNB-2aMj;
	Mon, 23 Mar 2026 11:37:07 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4daj-0000000GdMR-0NOI
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 11:37:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w4daX-0000Ls-Sg; Mon, 23 Mar 2026 12:36:53 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w4daX-001ie6-2D;
	Mon, 23 Mar 2026 12:36:53 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w4daX-000000007eB-2SFH;
	Mon, 23 Mar 2026 12:36:53 +0100
Message-ID: <b3fa66f776ddf5bd8b289d5780df40de13de8434.camel@pengutronix.de>
Subject: Re: [PATCH v5] reset: spacemit: k3: Decouple composite reset lines
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Junzhong Pan	 <junzhong.pan@spacemit.com>, Guodong Xu
 <guodong@riscstar.com>, 	devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Mar 2026 12:36:53 +0100
In-Reply-To: <20260320-starlit-isolation-40c3c80e77a4@spud>
References: <20260320-01-k3-reset-usb-pci-v5-1-07f4a5ddd728@kernel.org>
	 <272ed19e2c0d8c9f53b6e621c01dc09f0635bf9d.camel@pengutronix.de>
	 <20260320-starlit-isolation-40c3c80e77a4@spud>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_043705_188646_B545F7D2 
X-CRM114-Status: GOOD (  23.29  )
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

On Fr, 2026-03-20 at 17:57 +0000, Conor Dooley wrote:
> On Fri, Mar 20, 2026 at 01:02:04PM +0100, Philipp Zabel wrote:
> > On Fr, 2026-03-20 at 11:06 +0000, Yixun Lan wrote:
> > > Instead of grouping several different reset lines into one composite
> > > reset, decouple them to individual ones which make it more aligned
> > > with underlying hardware. And for DWC USB driver, it will match well
> > > with the number of the reset property in the DT bindings.
> > > 
> > > The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
> > > PHY. The PCIe controller also has three reset lines - DBI, Slave, Master.
> > > Also three reset lines each for UCIE and RCPU block.
> > 
> > Although I can't validate correctness of the id-to-bit assignments, the
> > changes look consistent.
> > 
> > I trust that the reason for the grouped reset lines was just
> > convenience, and not some hardware limitation that requires them to be
> > controlled at the same time.
> > 
> > There are no patches using the USB/UCIE/RCPU/PCIE resets found on lore,
> > so this is not an ABI break.
> > 
> 
> Eh, I think it's an ABI break either way, but it is being done fast
> enough that there's no users since this is new as of -rc1.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Just be careful Yixun that U-Boot doesn't import and starting using it,
> I forget if they use -rc1 or released kernels as their import point.

Thank you, I'll look out for that. The previous dts/upstream updates
all use final release tags, so this should be safe for U-Boot.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
