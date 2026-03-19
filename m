Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB058108E1F7
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 11:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yk28p1KhJtsWi5dhM/fUbqRNSoWIJFf3ILHk6uQkG+Q=; b=TZzz3vuFDn24qw
	1GUGERlk7R9OLgr7HIf1l/ZVh4RCK77mvtqwoHyFT+/Mkb9RxMQHU+0UAaYhoeDmM8A1/E0P83zTJ
	X7Dx7SBdof6sYoUa3gP7HMEyPmNy1iJhwSi1KcdnmcGmlU4M3l2z9mWvxB6Jj+CWxU8RJq1PyCQiO
	m3pigH18+URoRHFLYxHSVd0f4NszL8TuLes13Y2goFTGIuDF8o/3y+UcXc1QX+yRlIzQOrwr5EYdR
	DTgzcKjybUdLYiti9yDjuR8bCh6rcgbXewCdKIcjuZBWGG7fsRRHiGbVoMhBlmMqnzdCGzOvpBqPH
	7WauLTVJ5pLF76XbXDKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3BmN-0000000AYhx-17LB;
	Thu, 19 Mar 2026 11:43:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3BmL-0000000AYhm-3ByV
	for linux-riscv@bombadil.infradead.org;
	Thu, 19 Mar 2026 11:43:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0iBKfs7yUmTmI3ueHYb0OvhWTjmElVxY8JUdHliSajk=; b=UZ3BdZYB+2jOc37HaxKBA5eqmb
	H+qUQQA/dWtLSmIAC1A2LWa1sww+mciBoRRt8vI7rbjoMzq+5OLuQxvq6Wee+eSowpvwAGalWKaju
	FoM2bMH0zROlg9p6pRJ4YncFPT+Ot1hFzMaG6N2s2LNLoz9jXS7qP7YtB6veeITqidWwIdl86HMLx
	+4b1V5NGuw4v+70ms5zOrGZ1R1ffgpwfrLygp6T+gm+8AIQFK0D0yztKA4OwgwgoB1RjD0tMeIgZr
	cT5ZiZHuVbsQnAoTaDhzhnEgMY9evn4cwrOif0kLx23p+p/k41I9Zy6bfoCLkQKTg0GPj0BXBhXtc
	h8pCgj+A==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3BmH-0000000DO6L-1Q3O
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 11:43:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3Bm5-0007xc-Cs; Thu, 19 Mar 2026 12:42:49 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3Bm3-0014CP-2s;
	Thu, 19 Mar 2026 12:42:47 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3Bm3-00000000Byb-3NCL;
	Thu, 19 Mar 2026 12:42:47 +0100
Message-ID: <c0a6d0346e2b766ab4dab3340445c45843f28b60.camel@pengutronix.de>
Subject: Re: [PATCH v3] reset: spacemit: k3: Decouple composite reset lines
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Junzhong Pan
 <junzhong.pan@spacemit.com>, Guodong Xu	 <guodong@riscstar.com>,
 devicetree@vger.kernel.org, 	linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, 	linux-kernel@vger.kernel.org, Inochi Amaoto
 <inochiama@gmail.com>
Date: Thu, 19 Mar 2026 12:42:47 +0100
In-Reply-To: <20260318131043-GKA488271@kernel.org>
References: <20260317-01-k3-reset-usb-pci-v3-1-e4b9a43c7d45@kernel.org>
	 <3e9022faae3dc6f5066a1e7cc3752a0193a55bc9.camel@pengutronix.de>
	 <20260318131043-GKA488271@kernel.org>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_114301_472193_FAA6E92C 
X-CRM114-Status: GOOD (  19.60  )
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

On Mi, 2026-03-18 at 21:10 +0800, Yixun Lan wrote:
> Hi Philipp,
> 
> On 13:39 Wed 18 Mar     , Philipp Zabel wrote:
> > On Di, 2026-03-17 at 02:36 +0000, Yixun Lan wrote:
> > > Instead of grouping several different reset lines into one composite
> > > reset, decouple them to individual ones which make it more aligned
> > > with underlying hardware. And for DWC USB driver, it will match well
> > > with the number of the reset property in the DT bindings.
> > > 
> > > The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
> > > PHY. The PCIe controller also has three reset lines - DBI, Slave, Master.
> > > Also three reset lines each for UCIE and RCPU block.
> > > 
> > > As an agreement with maintainer, the reset IDs has been rearranged as
> > > contiguous number and pushed as a fix for the driver, and reason is that
> > > there isn't any consumer of reset driver so far,
> > 
> > Unfortunately that does not seem to be the case for all APMU resets.
> > A lore query for all changed IDs [1] yields a patch that adds ethernet
> > device nodes using RESET_APMU_EMAC[012] [2].
> > 
> Yes, although the ethernet use this ID, but I don't think we should worry
> about that, since the ethernet patch is still under review, and ideally it
> will be merged after this reordering patch, unless you disagree? and insist
> the RESET_APMU_EMAC should not be changed?

Yes, please. Somebody might have picked up those patches from the list
and we can easily avoid the risk of breaking their ethernet with v7.0
by not reordering all resets. Let's do that.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
