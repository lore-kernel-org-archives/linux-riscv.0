Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B8FC25B06
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 12:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NUg0D5plCY6QI7sxkAJxsZd9gnCAMQTkXZSx7pFY6PU=; b=KCZR7vPQzGWQ6b
	kqNmfgsBIOavXnlXI9koKsEV6UNDkZY/FGFqx7lu4rkNHpyS/rKT0qT7xZCO1Ea2vmncyIKUbkG6a
	QTKrkw8QL1M5W80rc0vzA09Wy/3yMQ9zRmGdCaERujkIkUn6t20Ol2IoDKDRCG9axVgUQYjL0rUnm
	BL/JpaxEe8iD+0Beocr5DqO9J5tSMHiongLAc9C10d2PwpRadHcrFd19EgDxbdE9w5zp/lf+b5XI/
	B7F642aIX+/mm4/4I0KbJdMn8Sl/zdDyfae47IUMt0oPIFKjb4zctMERO1BEJwd+EqfxS9473xPn+
	e7GCxIO4Z+I3lYdHK9Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJwtb-00FCH9-Km; Fri, 05 Aug 2022 12:57:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJwrz-00FB0a-1k
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 12:56:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659704162; x=1691240162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=00HIFvltqoK2q6RN6iEVaq/z31zM0MweFlDQWbq1aXU=;
  b=mGW/lio7d8dIkpH8AQ8iaRC+wQIILFnk+VedArcysDN2SDA8ykHLwZU5
   voB+k1MlG1PTuGaV0/QLvmtI6i36zxByQvU+I8DHiOyIico+aBG9dcB2P
   UgG3/oo1g5TiBpqcf6/G9Z8PVfENlhuHd1jmOMBh3KHcXtfkz+PMzq5PV
   tQJ0j/yk+vMl+mMYi/Xh3y93Ff1yAcMzW8er1OzM+jICYsHaY/CB6SNgN
   pHUfdDo+vIYhqgHD4lH0Jyu6EZZGuNUP79szbyFCDFPUMnsHeynJElzhy
   /hOjfsyFOIfVe0oYIA7vrlJ4Sgeky0ZRjT1JYdzKjHIuUDmogPwmAinCu
   w==;
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="175226525"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Aug 2022 05:55:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 5 Aug 2022 05:55:57 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 5 Aug 2022 05:55:56 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH 3/3] mailbox: mpfs: account for mbox offsets while sending
Date: Fri, 5 Aug 2022 13:56:19 +0100
Message-ID: <20220805125618.733628-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805125618.733628-1-conor.dooley@microchip.com>
References: <20220805125618.733628-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_055603_213524_506AC135 
X-CRM114-Status: GOOD (  12.71  )
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

The mailbox offset is not only used for receiving messages, but it is
also used by messages sent to the system controller by Linux that have a
payload, such as the "digital signature service". It is also overloaded
by certain other services (reprogramming of the FPGA fabric, see Link:)
to have a meaning other than the offset the system controller should
read from.
When the driver was written, no such services of the latter type were
in use & those of the former used an offset of zero so this has gone
un-noticed.

Link: https://www.microsemi.com/document-portal/doc_download/1245815-polarfire-fpga-and-polarfire-soc-fpga-system-services-user-guide # Section 5.2
Fixes: 83d7b1560810 ("mbox: add polarfire soc system controller mailbox")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/mailbox/mailbox-mpfs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
index e432a8f0d148..cfacb3f320a6 100644
--- a/drivers/mailbox/mailbox-mpfs.c
+++ b/drivers/mailbox/mailbox-mpfs.c
@@ -100,21 +100,20 @@ static int mpfs_mbox_send_data(struct mbox_chan *chan, void *data)
 
 		for (index = 0; index < (msg->cmd_data_size / 4); index++)
 			writel_relaxed(word_buf[index],
-				       mbox->mbox_base + index * 0x4);
+				       mbox->mbox_base + msg->mbox_offset + index * 0x4);
 		if (extra_bits) {
 			u8 i;
 			u8 byte_off = ALIGN_DOWN(msg->cmd_data_size, 4);
 			u8 *byte_buf = msg->cmd_data + byte_off;
 
-			val = readl_relaxed(mbox->mbox_base + index * 0x4);
+			val = readl_relaxed(mbox->mbox_base + msg->mbox_offset + index * 0x4);
 
 			for (i = 0u; i < extra_bits; i++) {
 				val &= ~(0xffu << (i * 8u));
 				val |= (byte_buf[i] << (i * 8u));
 			}
 
-			writel_relaxed(val,
-				       mbox->mbox_base + index * 0x4);
+			writel_relaxed(val, mbox->mbox_base + msg->mbox_offset + index * 0x4);
 		}
 	}
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
