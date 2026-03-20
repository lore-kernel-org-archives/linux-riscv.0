Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9D5108B90B
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 12:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dNmaMmjqztNGDWITKP5NxCZsbydGwyBIXyRXnrbTxh4=; b=oz2TYQn/1pzZfJ
	LVVdsvNFi8GHPzVKvFddg1mkzZETJOH7irmUZmW8XberKl2wrB7hSIS3y3KNMR9lFAJaZV7S8YgsM
	XlZRCZoI/jL7IX2QDEqcYHyWbWoiUVqRnkDpHJtwax68d91Kv03HXMcOR86YrNUn3sgj89SG9mjKl
	yJbw0jkT4OyDhHK5SaWmJEL4tBsZ6Xln1Ag/x6zxFtsvDfJ56i/CwQsm3UrjLNcHlk3IgWmmcY1XN
	IIvO/IYtuFjR9L2jpbnYfNGXUiKfHxC1PSb0jqe3efyAF4bBQBw/B3xF8vVdW6ckoF42X0DkDE0h4
	PDEJuOlSlXooYFDLBLhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YYU-0000000CjAb-01v9;
	Fri, 20 Mar 2026 12:02:18 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YYR-0000000CjAG-3AVw
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 12:02:16 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3YYH-0004n9-Uq; Fri, 20 Mar 2026 13:02:05 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3YYG-001Ecl-2s;
	Fri, 20 Mar 2026 13:02:04 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3YYG-0000000085A-3NA2;
	Fri, 20 Mar 2026 13:02:04 +0100
Message-ID: <272ed19e2c0d8c9f53b6e621c01dc09f0635bf9d.camel@pengutronix.de>
Subject: Re: [PATCH v5] reset: spacemit: k3: Decouple composite reset lines
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Junzhong Pan <junzhong.pan@spacemit.com>, Guodong Xu
 <guodong@riscstar.com>, 	devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Fri, 20 Mar 2026 13:02:04 +0100
In-Reply-To: <20260320-01-k3-reset-usb-pci-v5-1-07f4a5ddd728@kernel.org>
References: <20260320-01-k3-reset-usb-pci-v5-1-07f4a5ddd728@kernel.org>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_050215_796941_09EFAC1A 
X-CRM114-Status: GOOD (  12.37  )
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

On Fr, 2026-03-20 at 11:06 +0000, Yixun Lan wrote:
> Instead of grouping several different reset lines into one composite
> reset, decouple them to individual ones which make it more aligned
> with underlying hardware. And for DWC USB driver, it will match well
> with the number of the reset property in the DT bindings.
> 
> The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
> PHY. The PCIe controller also has three reset lines - DBI, Slave, Master.
> Also three reset lines each for UCIE and RCPU block.

Although I can't validate correctness of the id-to-bit assignments, the
changes look consistent.

I trust that the reason for the grouped reset lines was just
convenience, and not some hardware limitation that requires them to be
controlled at the same time.

There are no patches using the USB/UCIE/RCPU/PCIE resets found on lore,
so this is not an ABI break.

> As an agreement with maintainer, the reset IDs has been rearranged as
> contiguous number but keep most part unchanged to avoid break patches
> which already sent to mailing list. The changes of DT binding header file
> and reset driver are merged together as one single commit to avoid
> git-bisect breakage.
> 
> Fixes: 938ce3b16582 ("reset: spacemit: Add SpacemiT K3 reset driver")
> Fixes: 216e0a5e98e5 ("dt-bindings: soc: spacemit: Add K3 reset support and IDs")
> Signed-off-by: Yixun Lan <dlan@kernel.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

If there are no objections, I'll pick this up into reset/fixes for
v7.0-rc6.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
