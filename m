Return-Path: <SRS0=igOf=LS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630A9C49EA6
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jun 2021 15:02:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 336EE613C0
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jun 2021 15:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 336EE613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gK3IHqA1ui4q28M/69BRx41cVKKu39O7W1M7zTuRbNw=; b=bW0JB4SJXJQpuC
	UF/SX9oVZ7x8ERMoaoWJfy22Dh614O8TcEu4J+F2lUerJUIXLOtGH4ryGuYqKJNrq36piD0ZwAD2a
	b6ODk075qB9U2HrLwN41cQ/0oWJmEA+ZZb9ECddT7KnaK+VUfflofutd2OAibH5oD3id7jPeT4suT
	V5sHJ+k3DMcWHx3IH/miWJbOFfVLNpL5H9DyYJWDkgBLUtsESWwzh9b9oqBwR+gFf0KV3EEP6zAiJ
	2icjSEWejco0ykOCVpm6LPASGjxsMXXBC2Bw1WgOdC3vk4wbJXAJUXPqN5Z9fkiac7XUkCprJvMVj
	HFF6rgmxlDZHwrjv+uPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwQs1-00FAII-QL; Thu, 24 Jun 2021 15:02:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwQrw-00FAEa-W3
 for linux-riscv@lists.infradead.org; Thu, 24 Jun 2021 15:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1624546936; x=1656082936;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4nksVGJc59kKQoPCASmg1lsIewXyAyJELl1qHWXP4GA=;
 b=ztqKDwc8YtyDqNDU2hBxtyLg+uxSVQO+DhHMT0hIVEGe719uZ/bakYIc
 DGsrGM4WKbmI+n69cTqJ7etSWtPvNbpkXz/9PlfSULzraTzBtRNuNZm7z
 7JXeiVe2hT3uM4sQx4AFM3fY2mjIZoeKGd1oRKcP1HgIUn3Eg2aNsstXV
 ngfCkbIWakXpz0FG6M6hah6y5hZnpk5JPolqYAFFktxHEy8SZMY0Yl1PV
 1SS9xgoArDeGnEHsUyYkm+yOeshU/m8KePfkrI2k5ddFm/m8YieT5yV5B
 2mz0mAApVNBEanOB27ZeMQg1K4hpQwuGTILzVYD7sdk7oo8i4BgpxhSL2 A==;
IronPort-SDR: JQg4eJwB3AFpdM+Sl6Mxpb+DyL/xwgOk0ZVF2B6yYzhQnEvKUWz9Jt8bC7XGhUXqgk2/0bjvmY
 AB9HaQ3cHAfnQWb964ryfFTmlQrREgdfttA7LRQHAZC5Cg9FIiMuH6hyMwieo2kkz8oo/xkKBX
 hUIHWfXnDVOWpYacCYL1W8FmR9nc1aqwwFQ6acj++DK8mcCdNNh4wd3vCtpPbt/MG22E7AIgBU
 ymwmJmKQIcJkJ4TU9RzZn/xjgUG7K7ImyEyHDFc6o2JlwYESE6cNWjzTuxsZXH7o/yC6LWsS0N
 9zc=
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="60084290"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Jun 2021 08:01:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 24 Jun 2021 08:01:55 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 24 Jun 2021 08:01:52 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>, <sfr@canb.auug.org.au>
CC: <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 5/5] MAINTAINERS: add entry for polarfire soc mailbox
Date: Thu, 24 Jun 2021 16:01:52 +0100
Message-ID: <20210624150152.11666-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_080217_130173_1758C9B4 
X-CRM114-Status: UNSURE (   5.49  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add Lewis Hanly as a maintainer for the Microchip SoC
directory and the system services mailbox driver

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8c5ee008301a..dc549a60fddc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15705,6 +15705,14 @@ F:	arch/riscv/
 N:	riscv
 K:	riscv
 
+RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
+M:	Lewis Hanly <lewis.hanly@microchip.com>
+L:	linux-riscv@lists.infradead.org
+S:	Supported
+F:	drivers/mailbox/mailbox-mpfs.c
+F:	drivers/soc/microchip/
+F:	include/soc/microchip/mpfs.h
+
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
