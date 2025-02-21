Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D86C021B2
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 02:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:To:Mime-Version:Subject:From
	:Date:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hZRfpwrc+jF8fn4PpmzprkmBu6UQaP10SRn0RMB54FA=; b=g4ELIAdmCsQ7uI
	VLz/NDHZDJ/mxuvBVnBWAmcBRavA8kRN6cd7xIex/1yuscyCuaDlow4sByWcWcz3nXld15ZwrmjvN
	ajaO0Bdl0y45Ff608zLDpiFHTcdmUiAOqsZFYM/d/dkpfmtwN3jqRAcJODrWtrF+e2AyJDJyiRzS3
	TBGRLITAooVBFm0pFj9bh+saV0V/2LOMPKnbHgxXPDRU+dMfau80em6a63Jt2olxn0GVIMbHULAze
	9+36yQ3gz2hSfTvGmbx4mzmDgs2ogGxMPS71tDnVHOI3O2vJ5AN96Yy0J1gWMZthzd9CE54ywzXpN
	srwSVmmDGn7/W5bBHeSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlIXf-00000003ogY-169H;
	Fri, 21 Feb 2025 02:13:27 +0000
Received: from va-2-31.ptr.blmpb.com ([209.127.231.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlIXb-00000003oez-0uOk
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 02:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1740103985;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=252guJ30wHEGOM0mF3VIvyLsmSRltl8PT5yIko8TGpg=;
 b=U1GWQHhI0ARL5PG7Xgie+/CNClhTdeO2ve7wCOp7Kf//AaUNKmfAEbW341E2xagS6CjjHf
 gfmbLo8lKQCyfZjs/UpYDYgQFunmpc1gLZcxUd3iiZRyXH9na638QDhVe8r/AGXlpUecj5
 NWHrIUntkxUY5+Y768xql8QgdBice+o5V4VAT66+RK7d4NQX3VyFl9l1pqKEREwMPbDIyY
 2r2vLKbE85N3L2XEQtoYZf5t8rEtiJ5xyDFAk/bYM6fboEEKF1rwfOHupi01RmeUeYhWc4
 CJ9tHfQmAdYzj3tPRSoxZqB6GKAHlNLjvQ+mFnETvtmaAaCQvBImSyzqKB976g==
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>, 
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<sandie.cao@deepcomputing.io>
Date: Fri, 21 Feb 2025 10:12:15 +0800
X-Lms-Return-Path: <lba+267b7e12f+293d8a+lists.infradead.org+sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH] riscv: dts: starfive: fml13v01: enable USB 3.0 port
Mime-Version: 1.0
To: "Emil Renner Berthing" <kernel@esmil.dk>, 
	"Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Received: from roma-MacBookPro.. ([113.110.143.117]) by smtp.feishu.cn with ESMTPS; Fri, 21 Feb 2025 10:13:02 +0800
X-Mailer: git-send-email 2.34.1
Message-Id: <20250221021215.407988-1-sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_181324_041753_4BF24720 
X-CRM114-Status: UNSURE (   4.83  )
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

Add usb_cdns3 configuration to support super speed USB device on the
FML13V01 board.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
index 8d9ce8b69a71..221c91696ffd 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
@@ -49,3 +49,9 @@ &usb0 {
 	dr_mode = "host";
 	status = "okay";
 };
+
+&usb_cdns3 {
+       phys = <&usbphy0>, <&pciephy0>;
+       phy-names = "cdns3,usb2-phy", "cdns3,usb3-phy";
+};
+

base-commit: 38818f7c9c179351334b1faffc4d40bd28cc9c72
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
