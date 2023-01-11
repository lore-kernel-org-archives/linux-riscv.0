Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29884C5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 13:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i3SWwquVUhJqq+BDHQijg9ohtosjxcI2yXLrDZgkWhA=; b=jZtBvOfg/VO1gH
	ceZB4l2Op/eW+m273cJ+/NPwqaDQqsgeZ8zTkSrWLozT6bcUoeYpQBFdJkWJc2nHq4bU74asj77l0
	uj63o29UcAlJSAQA91zW73pKrnSTNHkG0PAcrW9s6zy0izEWkzNEOdlVCdxxiTiKXv5d0KNCZS9oF
	+rA5UnJb6G9gYjvLgN+cp7NJC/ujVrvyK+DSBrSQpHcpj/+7Ej8/R3bHcVs+oKuGUWBy/lDvuabqS
	/1YK+M4m0AjhRECkxrfkHJEwS3vaG648pBA00875eXhUE8BRI/SuRh7savDMW7dlYfsvQ8p+F8LHb
	Gfu4Bixt1ibRQTBve9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbQV-00Bere-EL; Wed, 11 Jan 2023 13:45:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbQQ-00Beof-BT
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 13:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673444754; x=1704980754;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wIqkIRLk97mVy76bXMdNE/RNNtTIHIYTZDRNoDes7MQ=;
  b=DAFge+a9tN9ypsiMKvJ9BRIcwsn8cBRSIozlUcvMEHJeprwGWuNaVwmn
   3W+tsqPBbed/UDlLFUjYbv7OcSKhuNbI4vRimNfoxElrv0MxTVlqFvI27
   QBYqj/r5B0yjgBVrggRBCXJuHaxQH1zquotM5iC/z/76fDm1eGlamjUy2
   i+flIEAAFZUCuEe3u+ovOeFdIKDJKnqqzLyQXte4xz9UswrjeXFEbIXCc
   Rgwh6IeR+SHocpNlXa1V2yLoyUvOI57fD7GmhedAS6YT2ytRKVWf5mpQD
   wbHer0GZYoa9LSYFJjLfcnnTnspFUNso4ka+bDGpl8WJn733+9inMfKVH
   A==;
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; 
   d="scan'208";a="196212592"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jan 2023 06:45:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 06:45:49 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Wed, 11 Jan 2023 06:45:48 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/7] mailbox: mpfs: fix an incorrect mask width
Date: Wed, 11 Jan 2023 13:45:07 +0000
Message-ID: <20230111134513.2495510-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111134513.2495510-1-conor.dooley@microchip.com>
References: <20230111134513.2495510-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_054554_587394_424FB2CC 
X-CRM114-Status: GOOD (  10.73  )
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
