Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AE6C8303C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 14:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nGuit1/dDykW2oX+xd+JnFKQwxHKYC9q2x6s49jyL14=; b=U2ZRbHgmqHmxOM
	0b/f7PvrhYcIgsm29E1slQ2P08Fk7fIWPU8q2CXEBH5bOnBpn+7oyYK0NMPg0wVmPI1mdV0SlivW4
	J6sb5nEzATSt/+v/GEA6OBYZpOFgL6r002A9dqoi8xi8YgbZ3QQ86sKeRxzauOFx8WbqsN8czuDxP
	bHS4oS92m/re9r4VLo1nWMtdZda84tzGYC6kRoUE3fUJBxHFlXVjnraJm/kAW814wVHpfKttoWPSM
	DCuIeMwkCS11VZXJAdDwG6RW4006U310OyUJ6rBIjvCe6B1FQ9Cj1fgAdGsz+3xA5R75wi0mCGQmr
	4+H99xdD8fdkMaBLXliw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYmzy-00000002jXb-02qy;
	Mon, 07 Jul 2025 14:39:14 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYmpy-00000002htl-2gpR
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 14:28:55 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 18ED2341E79;
	Mon, 07 Jul 2025 14:28:52 +0000 (UTC)
Date: Mon, 7 Jul 2025 14:28:46 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, heylenay@4d2.org,
	inochiama@outlook.com, guodong@riscstar.com,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: spacemit: mark K1 pll1_d8 as critical
Message-ID: <20250707142846-GYB408198@gentoo>
References: <20250612224856.1105924-1-elder@riscstar.com>
 <7bdbef20-da43-4b23-9ae2-a0cf077fec92@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7bdbef20-da43-4b23-9ae2-a0cf077fec92@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_072854_702128_F2613561 
X-CRM114-Status: GOOD (  18.54  )
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

Hi Alex,

On 07:19 Mon 07 Jul     , Alex Elder wrote:
> On 6/12/25 5:48 PM, Alex Elder wrote:
> > The pll1_d8 clock is enabled by the boot loader, and is ultimately a
> > parent for numerous clocks, including those used by APB and AXI buses.
> > Guodong Xu discovered that this clock got disabled while responding to
> > getting -EPROBE_DEFER when requesting a reset controller.
> > 
> > The needed clock (CLK_DMA, along with its parents) had already been
> > enabled.  To respond to the probe deferral return, the CLK_DMA clock
> > was disabled, and this led to parent clocks also reducing their enable
> > count.  When the enable count for pll1_d8 was decremented it became 0,
> > which caused it to be disabled.  This led to a system hang.
> > 
> > Marking that clock critical resolves this by preventing it from being
> > disabled.
> > 
> > Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
> > be supplied for a CCU_FACTOR_GATE clock.
> 
> Is there any reason this bug fix cannot be merged?  It was
> first posted a month ago, and although there was some initial
> discussion that led to revisions, this version has been waiting
> for over three weeks.
> 
Ok, let me explain..

I've queued it at for-next but haven't sent out the "Applied" reply email,
it should be eventually merged for version v6.17 if things goes well.. 

the reason that I haven't pushed it hard for fixes branch is that only DMA 
is affected for now, but DMA isn't fully activated in current mainline
(No DT, No config merged), so I think it's fine if we target for-next..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
