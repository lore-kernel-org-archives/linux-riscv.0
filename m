Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594B2C38145
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 07:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NUg0D5plCY6QI7sxkAJxsZd9gnCAMQTkXZSx7pFY6PU=; b=xiVkC12jZg7Eca
	tUjeFqOQgWmxk/KxSsRQBCdtuYKnJotXWzxNGmXCMOTElQszskw0cYpS0zI9Og+g5dokA0bYfH03y
	VyMiSzIKyU855H/fs4IoZfyAfpJXbvrQ1sp5DIReNIyiRGR621K3Jgl53V8FqN5J9wS0pQC/mGPIN
	zNIIk7+tNUhl9wBENkY8GfFOi3MZMmzUoTxyA2FRTdELObQzb+OGhkZisCAmqlqf7gfxk7ozwAOLN
	/2kuFP25VVbZCc72EVXOo8jUYYODmwPhqXgjrdrjOd9yrkL2BqUuGzxWGhUqkNrHrHXmvBsd1VXm9
	eWLMiKuvVp5LrcwJBjAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQkVN-00B3wg-B5; Wed, 24 Aug 2022 07:08:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQkVK-00B3tW-3C
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 07:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661324926; x=1692860926;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=00HIFvltqoK2q6RN6iEVaq/z31zM0MweFlDQWbq1aXU=;
  b=ME7dxaRD34xEGEqx6VfciUK0786tcQjbfSPs5lVtmO3UamovGcnSwVl7
   kgDYZG7txtxR276RXrTzloKdVyA2Em3XUmOAgeLKj2hb6VTGA/TtLfdg+
   +SUTQcyzNtst6RQq/qAWBjUQ0wGWzsojjO3x3Tosn50XpuXeE2w5AMfSV
   W20vbmREw+TcjVUvcb4SqZ0P9DEtjkUNSrpLm6UQpv6MdllSBK1AUdLNM
   3MVAbcKIwZ4j9TdMLQJrEXl5HEu3T30vbd1g7gP83JNYCWtx11qRjnK+m
   iC1+7K0MWVD1HnxDO65sm3LtCqnA4hpgwFSrnfkbJZRcZ4pGi45sDC+JT
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="170677322"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Aug 2022 00:08:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 24 Aug 2022 00:08:45 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Wed, 24 Aug 2022 00:08:43 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v2 3/3] mailbox: mpfs: account for mbox offsets while sending
Date: Wed, 24 Aug 2022 08:08:12 +0100
Message-ID: <20220824070810.52219-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220824070810.52219-1-conor.dooley@microchip.com>
References: <20220824070810.52219-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_000846_229726_8D5E2FA3 
X-CRM114-Status: GOOD (  13.98  )
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
