Return-Path: <SRS0=7obj=FL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CCBC4361B
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 12:15:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E57F42339D
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 12:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E57F42339D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8tmKERPVxT2N6kIdpz60I85HAOYFsxWanSC+ZVQ2KJA=; b=yE9wf3LbgrjSwmVqdJk1IVX2cW
	SsV+IQM6Mh3bLbpV2UkIReMYMQP8TYZCv0sQqIMLJCSc5SvmO5zJWRjl3HAyP1cR1duXL1owFEcHW
	GwlnllcfCt+JkHHZOV0TyA1ZnpjKB4XlfEEJHRaDoOWuGl/G6PzZnJZ3r9YN2Pzgm4QF72FK2jAVq
	79RSagcWAGW/HL2PXLkNiETMuqr5Wg1aWFOlweYMosd4mRopbADhsi9zj/ZLyXkQEx2X5sYx1egqP
	d23T/3kNjm/X82cMN7sCZyBkV+mbGiyJTmWD0kPt6+ylhXamNlba3Ld6qjom96PLCPjoxQQAV4g2/
	0nJZcJ7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmFQl-0008PE-0V; Mon, 07 Dec 2020 12:15:51 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmFQi-0008Oh-NK
 for linux-riscv@lists.infradead.org; Mon, 07 Dec 2020 12:15:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607343349; x=1638879349;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=q6qR+M14sEQGT5M/G/pwCC67yLfxNrDN5aaMrQcZb60=;
 b=Uw8rDdXEEZ6AdRHB+lkdrtZXn7eHfX7eXSLA2AzCpzNmkurR2o+gQvgu
 1R5eLrs6oEbqQ39VL/ck49zLEx/PgfSwbI1OWIDTtaZ2MLMf9bHy1mVQ0
 rFOCoS5AqB+kjuGZEFHbRxdlhZztl5q0RXmca6Z29k4wtWKEgS5PhECIt
 /iAN3aT38qYZctUEm2kT0QSq+x7vnaCong7AyP6b8LYRF4x/BX43aTy2m
 Dub09HJ8o2wGiflgopPxxEYYlxp6lfxP6c11nRJH3AkHgWCRC4Obj/0wa
 5Aj8I9qKxGVjXxbw46ZcsJoAudqsvRkSuMeJeJ+oLP/ZM6Glpzg4nQ9nr w==;
IronPort-SDR: R+zNuVLp06ABWbW733aDqxBUVgaZ6DsrsjDsEp8uW8mSj0fzQLGiT1QXOz9wkAiAJ5I3IE8ALo
 6fXIPkG53nWvWzSbJmYxxm3fBRxVsrdSSSqzmXHYuI9ddYsM8t1XUrCr4YJUOGdCOl/cpsQws+
 qk5T+ln4OAyhphXM1ycOdGLDDatvJd5+oPv2WsoFFmDB3iOY0gUzqWOhEUVOlEZqEWi4VOwhNN
 86BYQWnoSrnZk28DN5VpAu64yuhAhQojrSb/ZmtkqGDGxsSBFagKmnhrchJRpooLjJbtK/Prxv
 NlQ=
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; d="scan'208";a="101191972"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2020 05:15:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 7 Dec 2020 05:15:46 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 7 Dec 2020 05:15:37 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <robh+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <linux@armlinux.org.uk>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>
Subject: [PATCH v2 0/8] net: macb: add support for sama7g5
Date: Mon, 7 Dec 2020 14:15:25 +0200
Message-ID: <1607343333-26552-1-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_071548_909178_2318F781 
X-CRM114-Status: UNSURE (   9.03  )
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
 drivers/net/ethernet/cadence/macb_main.c       | 158 +++++++++++++++++--------
 3 files changed, 122 insertions(+), 49 deletions(-)

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
