Return-Path: <SRS0=pb0J=OH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A39FC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 28 Nov 2018 10:11:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0E6C20660
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 28 Nov 2018 10:11:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UP1DfnEy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0E6C20660
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dv9TQTELHTO0MouedTTZviO579ivgPE+7mYQxfzo5fc=; b=UP1DfnEyIPNZ0U
	dk504hhN8IOleVNs3ayNaaWPWpV+GFXzzNs4oPm53A9uCs/ZE77bO2UKsDs+kXAN/1ZC8izQoMPVf
	i4RvqSn6l1xph4iMu0nJIIYZcy14jM/ig8m/qHzsiypTfGxMTdzdsbby4FQdmlFJ09tIEWS7ZuF9+
	RXtP3eZ+pMX3QU52O3IvUXwbAOmvX6s6auuEXTNQfFESE6eIuPGtFQQDwUjgLPC9qUyfKRyMA7c7Y
	X07zLy//S5U6oiBEyGVB4mDXhnnt9bjSJPAlw4T1HXGnvgvVgiFqn6p4NcBl7AQEzR2yLLfL8y3N6
	LJBlAF+qyvTfOSPqZ1Tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gRwoH-0007oB-5n; Wed, 28 Nov 2018 10:11:09 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRwoD-0007nA-0j
 for linux-riscv@lists.infradead.org; Wed, 28 Nov 2018 10:11:07 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3E0F3AEFA;
 Wed, 28 Nov 2018 10:10:51 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: macb: probe of 10090000.ethernet failed with error -110
X-Yow: Here is my refrigerator full of FLANK STEAK...and over there is my
 UPHOLSTERED CANOE...I don't know WHY I OWN them!!
Date: Wed, 28 Nov 2018 11:10:50 +0100
Message-ID: <mvmefb5fr6d.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181128_021105_202730_4B1CA2F8 
X-CRM114-Status: UNSURE (   6.65  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181128101050.wh7X3vYSlzg1VOIr4JsL42ZF3oiKe38fSgt0fSwDoYY@z>

The PHY probing of the macb driver appears to be rather unreliable.
Most of the time it doesn't work the first time, I have to reload the
module several times to let it succeed.

[   40.530000] macb: GEM doesn't support hardware ptp.
[   40.530000] libphy: MACB_mii_bus: probed
[   41.450000] macb 10090000.ethernet (unnamed net_device) (uninitialized): Could not attach to PHY
[   41.510000] macb: probe of 10090000.ethernet failed with error -110
[ 1354.400000] macb: GEM doesn't support hardware ptp.
[ 1354.410000] libphy: MACB_mii_bus: probed
[ 1355.260000] macb 10090000.ethernet (unnamed net_device) (uninitialized): Could not attach to PHY
[ 1355.300000] macb: probe of 10090000.ethernet failed with error -110
[ 1358.100000] macb: GEM doesn't support hardware ptp.
[ 1358.110000] libphy: MACB_mii_bus: probed
[ 1358.310000] Microsemi VSC8541 SyncE 10090000.ethernet-ffffffff:00: attached PHY driver [Microsemi VSC8541 SyncE] (mii_bus:phy_addr=10090000.ethernet-ffffffff:00, irq=POLL)
[ 1358.320000] macb 10090000.ethernet eth0: Cadence GEM rev 0x10070109 at 0x10090000 irq 12 (70:b3:d5:92:f1:07)

This is 4.20-rc4 on a HiFive-U.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
