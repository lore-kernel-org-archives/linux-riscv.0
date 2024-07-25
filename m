Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C626C49EA1
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 13:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x75LfJZMxEboJw4D8jGHUWFflyaAypFmvapNqESJv4o=; b=m/diMPYJOAoVu4
	eHsI7rXJIVIyarRUA+9i2RsVqPWeoGIUn4Qdj5RMyWz+0FDv/fwztZ+/jOx4R2K3oDa9OaDjvYPOg
	OWA5C41pH25Id1oI6tB0o1vbRmuGHi6nAfyMWazeqoMds77iLNGkuuuRFTIVZqcOlD+PnokZp+Znl
	CA8JgR2xaAt4cIuno9hh5bI1RAouPfdyeaq6IwNK3di4LByiRkzDawVXZAt0UFdXi+Nxgyj4ZWo1l
	ZbwtzmrhH6HHHBQpdmAnBs2DYEqPAZOwG1m8/1hwSaIh+Tk1DWM26MxlVvLCjHFjX6tqSFITwYAoG
	tcb+p3K9xfiDFNzwNWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyYT-000000015gl-2WM1;
	Thu, 25 Jul 2024 13:30:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWxOn-00000000sKw-3cIw
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jul 2024 12:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gGafArm1uqiC0k9bYEwdMQ98iKtgmUW1zpOhu6ynPLg=; b=kcZ/K/Bus9YufTRGVS+YzD9sqh
	sNdyxF1jKX/j6yfQM6MggwzqZBr6yaAihc/o1nU/dvg+hqf60dABkVQ7q8xXz+6dr+MtF3vnGfZbF
	raAbBLCV0zUSunPqYf48ceB+BSJt9r080DJu7vXLLaaZTH3er0/+rn1NCxvirPzC3CSUEPPN/gIhK
	x8S1Lzpyu+CPuBtXw8d9Imq3QJMVcoLU+9fN8Pg40oKvOJpK2/ZIry1tO11o1BHKitRLZQPvRKw/O
	Y0f26S7FGmJsoA1ePGbWrHk+I2PDUc8wSBVzAKHbCpw/uzaZYD1KFKI9rbIgTw6HXK/OgXS9IMgAC
	uDpWYGEg==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWxOd-00000003zy9-1jho
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 12:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721909796; x=1753445796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XzjG9bHDj2XGvDX2rSYcXKaSRCzWvkUE4SOtIiB8c3U=;
  b=q7UDUpFC9zxwCz+ycxggrpN+dEiap1Ybn0IfR5q3gsjQbvjF3Ih2q5Z3
   bFjMzQF1Hg0DxAbzIZzkUHpkRGgR7nYoXpPrz/c0tfGwP/oS9zz30wUiE
   vVFwNAEKzA+fJA0mm9a6ktDj9mKDlGLrbHSfxuxjvCFqY91fNAanQjQJR
   7B2g9stjRhautOGXusnoR9yh0ExUOvwr7kIRGi/93X33p+E23Ne2Xg3XJ
   ALFwjSGyc1S1uDVtxCP0MyyLQ2jWB9XlSAo3eszShkiSsOQzHdBbZr6hh
   5dfm/LKvQFh5YZaB4H2IeunuNmf5CeS1CD2bP8oyqNg3KjDFBTtUUnBtM
   g==;
X-CSE-ConnectionGUID: 8P89o1u9RvODQlJQJtKtAA==
X-CSE-MsgGUID: 4/2QY4n7RbqixZCSIDOEhw==
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="29678852"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jul 2024 05:16:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jul 2024 05:16:22 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jul 2024 05:16:20 -0700
From: <pierre-henry.moussay@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Jassi Brar <jassisinghbrar@gmail.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH 03/17] dt-bindings: mbox: add PIC64GX mailbox compatibility to MPFS mailbox
Date: Thu, 25 Jul 2024 13:15:55 +0100
Message-ID: <20240725121609.13101-4-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_131636_260467_BB3C0316 
X-CRM114-Status: UNSURE (   8.29  )
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

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

PIC64GX mailbox is compatible with MPFS mailbox driver

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 .../devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
index 404477910f02..9e45112e185a 100644
--- a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
@@ -11,7 +11,11 @@ maintainers:
 
 properties:
   compatible:
-    const: microchip,mpfs-mailbox
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-mailbox
+          - const: microchip,mpfs-mailbox
+      - const: microchip,mpfs-mailbox
 
   reg:
     oneOf:
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
