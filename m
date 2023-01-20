Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994EFC25B4E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 14:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J3X2TD8KPKq9DNBw1R+LLXslWk/KoBWF+RWAfgT+IYE=; b=Dw2L/IErJaKFgP
	7Yxps9HoIpxJA04YwvX9ffIYE++pQntMfhVdYNsfCgLeeQImh7s9f/ighrU83G/xgiNDJStMoSCN2
	JW+Gx2GFyFDmkEECV6TCwaeE2F20zK9xvY4uPwZNZ3rTZ13iLEXPRT1NNs+xqfYN7L/5YDDMg7U68
	1kQWVKFaDLlkgdOmrlKKD8lwo7BX3HHqoIpW/Sp5w987oMehqjvv0kZSUoIr4tueJwvZHT2ZU8gZZ
	1vxgQGIPm24sobFX7f4YIje2oILzV9IvBKyvJ37hLdGGGKAHo7LJVVRT+mJEl99F1lT7Aiadi1ICc
	Q16FeRCgecSRe3u9M8Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsZP-00AloG-BG; Fri, 20 Jan 2023 14:40:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsXV-00Akau-O5
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 14:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674225525; x=1705761525;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D44+KU7ZiM3CE8om7qWz+e12D8GVZHQeVAMd689yP1o=;
  b=hO/1hFtizMk9mCbdoiKG0KoxFZ1kBB+17rWHLJF9eN+xo1iR3W7lpSha
   bxMXX6dmq/XugtxsfRTYYx5NL0itsHIR+IB/SMcuBjJemoBZIoxIJyZjt
   v63FbmsdYQoUjPCwQe8hDgHvjiwIabKHxLDUiDjktAEPvIv1b2CG2/tpK
   P4wXffSn/5QuaO21IUz80dAzNRmcgXN38rPE/bvTujtcD+0JLDLux3yiq
   SLez7E0IDOqbcoxAn//aAKSSqBONs8TYQKG20KvHjd5X86qwIkUJT4iI0
   6hqEmprDEJmNoEMPVriPtntt5yXvjl3qb1IwbRWZGH8iBWODpruKZvWfh
   g==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669100400"; 
   d="scan'208";a="208646907"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jan 2023 07:38:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 07:38:15 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 20 Jan 2023 07:38:14 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/7] soc: microchip: mpfs: fix some horrible alignment
Date: Fri, 20 Jan 2023 14:37:32 +0000
Message-ID: <20230120143734.3438755-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120143734.3438755-1-conor.dooley@microchip.com>
References: <20230120143734.3438755-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_063846_570545_C90113B9 
X-CRM114-Status: UNSURE (   9.30  )
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

mpfs_sys_controller_delete() has some horrible alignment that upsets my
OCD... Move the RHS of the assignment to a new line for greater
satifaction.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 6e20207b5756..12039cb38b33 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -66,8 +66,8 @@ static void rx_callback(struct mbox_client *client, void *msg)
 
 static void mpfs_sys_controller_delete(struct kref *kref)
 {
-	struct mpfs_sys_controller *sys_controller = container_of(kref, struct mpfs_sys_controller,
-					       consumers);
+	struct mpfs_sys_controller *sys_controller =
+		container_of(kref, struct mpfs_sys_controller, consumers);
 
 	mbox_free_channel(sys_controller->chan);
 	kfree(sys_controller);
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
