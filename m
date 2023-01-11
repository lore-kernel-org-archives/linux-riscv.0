Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9912DC5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 13:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J3X2TD8KPKq9DNBw1R+LLXslWk/KoBWF+RWAfgT+IYE=; b=V1LFvX4/70GCt1
	EifxaCW27ZXcRhawGRcWSjDxu45M542si9wX48ZZBTst5dHYN+4qpB+N1C6GNhYCRTA77iX26SDAU
	N8I1aCoTB0wWr63Hr3CrpkMeFxdQ67eqlrX+KFmSjmsJ7mEWSLD/r+khSs1bZPs2ojrjI5BrI67v0
	Xh7wUYZmZt9rflq8bXA9qlZDd7mVX0fgdtdwFbfk9D2zmgaVwS3PHY3joDxHsfcAgGB4vbu0bGocD
	AG01UT1mJ8kAtJGFWff7LnVAgcMCZizfDiJg6DXhK/a9K65uPq5mcEXqoYgz55JBZpincwezWR45V
	Y3pFgmeg/F4i5VNQ+sig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbQf-00BexN-Ol; Wed, 11 Jan 2023 13:46:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbQa-00Beu9-VC
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 13:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673444764; x=1704980764;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D44+KU7ZiM3CE8om7qWz+e12D8GVZHQeVAMd689yP1o=;
  b=RFHsWiBdVrCyjBWuonZxAvAbjb0OCofdIajISmCWTEkv0AgElBJ6HJHT
   fmEHVsT6ZNIVR5l7Zf3gfA+lYWP8rTm61NUWTrJrFURMcoehJebQo6w0A
   6hb4V5BzBrtWYvDlfqa5Jcd9gn/SoOqq0Zd/4ZhcctqRwNlEGDVt4SQX3
   lbpoBZFY38kx+7g9iYgrGqz7h9JU5pvRtmaIZQrajeNj6+WNgPt5AGoE+
   QzpgRivdnt4nZ4uQLfLMWQGYWdUnPuApCdBVeFJ3WTdKy9+MBzJGFLjlm
   xM60CGxoOXdi56R1qNIPBJr0Orl4yapkidwGmjWMRAsCULauLnI4mD3sj
   A==;
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; 
   d="scan'208";a="131834651"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jan 2023 06:45:55 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 06:45:53 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Wed, 11 Jan 2023 06:45:52 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 4/7] soc: microchip: mpfs: fix some horrible alignment
Date: Wed, 11 Jan 2023 13:45:10 +0000
Message-ID: <20230111134513.2495510-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111134513.2495510-1-conor.dooley@microchip.com>
References: <20230111134513.2495510-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_054605_082522_51A29D59 
X-CRM114-Status: GOOD (  10.21  )
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
