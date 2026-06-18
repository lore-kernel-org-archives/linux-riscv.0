Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E53CD98F2
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 10:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQF5bD9MkOdAC/tjzPqXId32Gi+MC4Y+KPzRaEZ010I=; b=ePAzGGofg3oxEB
	Rvv78kRq21hjYqsW3e7HNGKJ9OUek4MvmPMLahNdZSXFkC+ijLXCR2InOrkE86TWZc63JxzNNqNpq
	6/gAApRQePud2ODPYgsaod6PpbcqIc7p1f1Wo+KHyXQSyst8eJG8Gi/onLhtO7a8Fdzh/zi1cEzym
	i04zgBdCARR7kcoo/F8rFogKlMpV5TiHAIffENMYHgm3C6hPpMCSX6wVn9ObO0PXdQBt6tkoZ0/VL
	E2XbCgFf4Ha+aNVoJUWqMRFGOy8OfDO2N+TUidjcujZmOSr51JUjFbmuCARAMwZGznGZmvmVvdbyb
	Ma3higz7/9AyVlMIH+kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9l6-000000014c3-3UPT;
	Thu, 18 Jun 2026 10:14:04 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9l3-000000014bC-400X
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 10:14:03 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5C4C4200275;
	Thu, 18 Jun 2026 12:14:00 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa9l2-003QAw-0x;
	Thu, 18 Jun 2026 12:14:00 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa9l2-000000006Aa-0sWM;
	Thu, 18 Jun 2026 12:14:00 +0200
Message-ID: <8882bc976c1d6e1de253780a4102a3a5cd5df7bf.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] reset: spacemit: k3: fix USB2 ahb reset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Junzhong Pan
	 <panjunzhong@linux.spacemit.com>
Date: Thu, 18 Jun 2026 12:14:00 +0200
In-Reply-To: <20260526132335-GKB3748271@kernel.org>
References: <20260518-06-clk-reset-usb-fix-v1-0-14fc235e692b@kernel.org>
	 <20260518-06-clk-reset-usb-fix-v1-2-14fc235e692b@kernel.org>
	 <20260526132335-GKB3748271@kernel.org>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_031402_144313_52A7538B 
X-CRM114-Status: UNSURE (   7.72  )
X-CRM114-Notice: Please train this message.
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

On Di, 2026-05-26 at 13:23 +0000, Yixun Lan wrote:
> Hi Philipp Zabel,
> 
> On 02:58 Mon 18 May     , Yixun Lan wrote:
> > According to SpacemiT K3's updated docs, the USB2 ahb reset and USB2 bus
> > clock enable bit was wrongly swapped, the correct one should be:
> > 
> > Register : APMU_USB_CLK_RES_CTRL
> > bit[1]   : usb2_port_bus_clk_en
> > bit[0]   : usb2_port_ahb_rstn
> > 
> > Fixes: a0e0c2f8c5f3 ("reset: spacemit: k3: Decouple composite reset lines")
> > Reported-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> 
> Would be it ok from your side to queue this patch for v7.2 cycle?

Yes, I'll queue it for v7.2.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
