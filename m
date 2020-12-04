Return-Path: <SRS0=IlQS=FI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80EDC433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 12:34:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 606D622AAC
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 12:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 606D622AAC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eFhQWpNkn01fFqqWP8q64jYnKOjzD6k8ok16j8/wms8=; b=qjgmbiF+V0l1+j0SdYpONayicm
	z4ML4kK1yLRyiZx3lpMxzdTFwv4gGmMf8kBwkj2XS+KtsEYLlt/DKK2+vUzOOtP2PvzmmlKXbEFQa
	DqmWCVcxqXZHg4TcwH6mCsLPsIYg+sL0bVuT1as0qofXVhqly68uDWLAFSjWyKYJO/x99VAljPLKS
	4qNgzxMfto8ET3BM06tExUt1E7OuKTqX1fXRFeIoh9iOxKbUUErLKsCZlOZTR0m3fKcG3dDyZ6Pm0
	FkDUcdByrowdhKqQAsjW182trNV0aDCsS7Xn8z3YnRxDL4W9VdmoX3/C8Tvz0S+/smF15ycAjgvxR
	OCa4hJzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klAIM-0000LY-P6; Fri, 04 Dec 2020 12:34:42 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klAIJ-0000Kr-5x
 for linux-riscv@lists.infradead.org; Fri, 04 Dec 2020 12:34:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607085279; x=1638621279;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=ooxPzxrzwJw3JgGledQM6x16vHXhUYhY2vlKUJL6gCk=;
 b=HKXt7tcaGe5m8vaJVE74bVd8DIkUZ5GZk+dBDHfQpZBIVROYLlpoiEBo
 GSYewzcwamw7Lq6wuMGJkc1wU8kdFcsqqzZxT1KxbruoLIYzkZDpqmGmP
 MVKoU5oAY7RSaySt3YIlT7pXPQEuskcu5lFIhU3b6ozAiUiOy0TabX3MY
 7RssCgdjU5f+E1aa8yBZahZ6Z6qgJzvrnHBMZ7pmgP+qjGjr2li3R5KXi
 AOQTj5HJJMpmTy0mgM0dBfU5V4mnUZOc91hwg61zmCYFASdcBEG+VXPey
 3hM6FqsCth+PGQz/xFvkDD9Y+4agFCmKNzqDhf0MdoHG0nZCE2uZ3ZTEz w==;
IronPort-SDR: 57QSs6qZ726gYyaXo9KxbpR4x9GrQ93MizO4GCVFjdkN6YFGjOZ4V8dDigRo/cf1Zw6ZslNPix
 iS0usEXSoGLVIFq9KgdE1lI+Cza+W8TRoXqMEtl8VcKg6JYo7C3HFUg2NOPyhcFsrH6KdAdL/f
 6EN4nqCoMjFFRQsksbi0r8MuPkPwrOSaKL0i72titbTwGxxgQKU5nZBol+18O6keRcvJZqC0Fa
 rTKa4fxlAJBT7btlnk3JVBWx7P9lAWBK7Sxn+zR1Moxu9uFP3pryS2SwzxfmV2Mk6EZlLOEmoU
 zzI=
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; d="scan'208";a="36119956"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Dec 2020 05:34:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 4 Dec 2020 05:34:35 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 4 Dec 2020 05:34:29 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <robh+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <linux@armlinux.org.uk>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>
Subject: [PATCH 0/7] net: macb: add support for sama7g5
Date: Fri, 4 Dec 2020 14:34:14 +0200
Message-ID: <1607085261-25255-1-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_073439_436860_4F76B0A6 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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
 linux-kernel@vger.kernel.org, yash.shah@sifive.com,
 linux-riscv@lists.infradead.org, Claudiu Beznea <claudiu.beznea@microchip.com>
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

Claudiu Beznea (7):
  net: macb: add userio bits as platform configuration
  net: macb: add capability to not set the clock rate
  net: macb: unprepare clocks in case of failure
  dt-bindings: add documentation for sama7g5 ethernet interface
  dt-bindings: add documentation for sama7g5 gigabit ethernet interface
  net: macb: add support for sama7g5 gem interface
  net: macb: add support for sama7g5 emac interface

 Documentation/devicetree/bindings/net/macb.txt |  2 +
 drivers/net/ethernet/cadence/macb.h            | 11 +++
 drivers/net/ethernet/cadence/macb_main.c       | 99 +++++++++++++++++++++-----
 3 files changed, 93 insertions(+), 19 deletions(-)

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
