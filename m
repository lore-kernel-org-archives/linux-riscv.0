Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446DEC25B4E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 14:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i3SWwquVUhJqq+BDHQijg9ohtosjxcI2yXLrDZgkWhA=; b=m4FdqFipXn6APq
	7s3gPHCEmdjEIssTsOWKB7/+5XNzQxlchClQ+jEaaEe8lv30BoTkCa+hROWMywmpbXrt4iIqCFMEV
	PWUOb5/YI0ixZ6yE/DBXlCFv0laDAmBmxaF1wHQgSunaI9QGtN9jwme9OMt3tARYt0VRFO2xUDv2Q
	TwctuNeF88unVyaXlE8vtZTokRXhK1AhN7w3XpPPYGcKV+hB79BgEyyDKaNDQI2ck5BrZZKFeWq80
	JgOURhxsu9uzUlqrQtSiS+lRvk4mAgfWvCgeFXOadplg1qGxRqAgMtHuHc2AC2veCZBdRg4hVuUi2
	5v9sJDUsYSczeBOQijbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsXe-00Akf0-5i; Fri, 20 Jan 2023 14:38:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsX1-00AkNR-2g
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 14:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674225494; x=1705761494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wIqkIRLk97mVy76bXMdNE/RNNtTIHIYTZDRNoDes7MQ=;
  b=w5T9+8jHRRTNIxVun7TVPNf4rEbzRJiwg/X114VpKiPvS7U3eyc5XAUc
   Asw+geA6mosNG2lEa+aoc07Z9++WQkhpQxetVhuGjzQx0NjnhoSJHf44T
   +Ur/u59+yKKqAozpOjfvWjqWXZW2KRbGYluwS7ogB4pTw2bJ7MJx5Uyyd
   EEJH1nEw3aM06pbiuIj00NZlGFxW2X+ES0+0O3AI64paLSIMVlmr784sv
   HLZ7nVdftN/mtIaDTynNNyJJRIFY6T0o72J9O/gx6BNVk04eKJtX1ZIk0
   /Vg9/PZsnLhndGwirEBdtUXcM8qRU3LXWDPKL3NRYf0WfJx8eZPPiFkRt
   A==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669100400"; 
   d="scan'208";a="197471514"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jan 2023 07:38:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 07:38:11 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 20 Jan 2023 07:38:10 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/7] mailbox: mpfs: fix an incorrect mask width
Date: Fri, 20 Jan 2023 14:37:29 +0000
Message-ID: <20230120143734.3438755-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120143734.3438755-1-conor.dooley@microchip.com>
References: <20230120143734.3438755-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_063815_165712_D1C76868 
X-CRM114-Status: GOOD (  10.01  )
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

The system controller registers on PolarFire SoC are 32 bits wide, so
16 + 16 as the first input to GENMASK_ULL() gives a 33 bit wide mask.
It probably should have been immediately obvious when it was pointed
out during review that the width required using GENMASK_ULL() - but I
scarcely knew what I was doing at the time and missed it.
The mistake ends up being moot as it is a mask after all, but it is
incorrect and should be fixed.

No functional change intended.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/mailbox/mailbox-mpfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
index 853901acaeec..d37560e91116 100644
--- a/drivers/mailbox/mailbox-mpfs.c
+++ b/drivers/mailbox/mailbox-mpfs.c
@@ -39,7 +39,7 @@
 #define SCB_CTRL_NOTIFY_MASK BIT(SCB_CTRL_NOTIFY)
 
 #define SCB_CTRL_POS (16)
-#define SCB_CTRL_MASK GENMASK_ULL(SCB_CTRL_POS + SCB_MASK_WIDTH, SCB_CTRL_POS)
+#define SCB_CTRL_MASK GENMASK(SCB_CTRL_POS + SCB_MASK_WIDTH - 1, SCB_CTRL_POS)
 
 /* SCBCTRL service status register */
 
@@ -118,6 +118,7 @@ static int mpfs_mbox_send_data(struct mbox_chan *chan, void *data)
 	}
 
 	opt_sel = ((msg->mbox_offset << 7u) | (msg->cmd_opcode & 0x7fu));
+
 	tx_trigger = (opt_sel << SCB_CTRL_POS) & SCB_CTRL_MASK;
 	tx_trigger |= SCB_CTRL_REQ_MASK | SCB_STATUS_NOTIFY_MASK;
 	writel_relaxed(tx_trigger, mbox->ctrl_base + SERVICES_CR_OFFSET);
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
