Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CB2C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 13:04:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36D6323B45
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 13:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36D6323B45
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xqaYfPXtt9G7/ZttMqdR3oihd5R/x/7LvpYfYItXMiE=; b=HHI8rT6DZVf084OCstpoeMe4wH
	zSX5SXCioilGZe2MEj49Fo9q3FVzV45gdwHpT2jAe3JbW4dXA4y5cw8mHNhZ0H35a33oqowU9S4fF
	/KySc7IoSFySZrlgHiK03MgRPoin/31L3Ej6yrFmzVh/rklP2869d7GTZt8O1frj3I/MXmN22RyM/
	f9aKdVnbyQVnQU8jL0WYIvjOdhym1WXr9jH0lCKOWi21aCj6zmU8i8Ye8V2bqX6cef5ik9NQR4aha
	UFo6yf5afLtN0Vofl5DwFFvXRVcApYGPbbM9PrOWJ4OdrqwT+pTO4Fi2nVOBjocqwSKvq3+msKxqZ
	DgiKadIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmz8T-0001PX-6P; Wed, 09 Dec 2020 13:04:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmz8N-0001Nu-DJ
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 13:03:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607519035; x=1639055035;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=3VEArB5XibEoHcgKryL5dGKaMkyVbmz94yJ+wDtew58=;
 b=ACDewhMFR4XOd4hYb4cnQO1qJXGk4HeJUR8/WPY4gDDSyZcTF9j2gLWC
 iSe2TzC9hDnYxP20/S1IBWIHzaqdc5czpnCiZHzgoDp2w47hAwE2rXXbL
 uTFV0CZf871YILqLfRSbg0Rm2fFdA3mWeVlDlb8sHxglCsLuEbFr6FMO4
 1uA+tEwsgfU67QqYDI0+8DrIo8x0yNjwkNS0FjapNSMkRzZdbUOMBHoVQ
 LRGt8vkf2tcHKIsM2l25hFTsWd8SruEoI+eEdf8EhzkwTR2ggMe3PwQZ9
 yKCMPZJGvodEILT2YFmDrxhYSrFW26lC/elGR1IDaA5WvDkIwGWjBBN7j A==;
IronPort-SDR: Wb3mz58QsGLlyO+n8Tfn+3uH/qd/+27a1Wmk46njoyUg7qfNEHTuQExbcDBADE08JOAVYc1Fdh
 I5zunxGPGffVEd1DJR+u1iJRTwXNg2X1C9z26KUrhkMxVANvWwg2esPGkATW2RkiNb9luuK8eZ
 lqyxYjtvXohowwBHWcCyQgba9raXLYhzt1Jns/MMjDc7d+KSIh73AY3Tyq8TxSmQ034k4+rxWf
 YGNFefzji9rMOaIiJfbsaAPwkyymMjL4BSvyXbTnuRdPsqCIMjIXjb1zPL6YiieDFUGnCEYkTA
 2Go=
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="96475062"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Dec 2020 06:03:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 9 Dec 2020 06:03:47 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 9 Dec 2020 06:03:41 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <robh+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <linux@armlinux.org.uk>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <natechancellor@gmail.com>, 
 <ndesaulniers@google.com>
Subject: [PATCH v3 0/8] net: macb: add support for sama7g5
Date: Wed, 9 Dec 2020 15:03:31 +0200
Message-ID: <1607519019-19103-1-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_080355_653630_30CD5704 
X-CRM114-Status: GOOD (  10.39  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 yash.shah@sifive.com, linux-riscv@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

This series adds support for SAMA7G5 Ethernet interfaces: one 10/100Mbps
and one 1Gbps interfaces.

Along with it I also included a fix to disable clocks for SiFive FU540-C000
on failure path of fu540_c000_clk_init().

Thank you,
Claudiu Beznea

Changed in v3:
- use clk_bulk_disable_unprepare in patch 3/8
- corrected clang compilation warning in patch 3/8
- revert changes in macb_clk_init() in patch 3/8

Changes in v2:
- introduced patch "net: macb: add function to disable all macb clocks" and
  update patch "net: macb: unprepare clocks in case of failure" accordingly
- collected tags

Claudiu Beznea (8):
  net: macb: add userio bits as platform configuration
  net: macb: add capability to not set the clock rate
  net: macb: add function to disable all macb clocks
  net: macb: unprepare clocks in case of failure
  dt-bindings: add documentation for sama7g5 ethernet interface
  dt-bindings: add documentation for sama7g5 gigabit ethernet interface
  net: macb: add support for sama7g5 gem interface
  net: macb: add support for sama7g5 emac interface

 Documentation/devicetree/bindings/net/macb.txt |   2 +
 drivers/net/ethernet/cadence/macb.h            |  11 ++
 drivers/net/ethernet/cadence/macb_main.c       | 134 ++++++++++++++++++-------
 3 files changed, 111 insertions(+), 36 deletions(-)

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
