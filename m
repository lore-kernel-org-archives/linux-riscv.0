Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026BEC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 15:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UuXfU+d+LuiKa0M4PpfxTwIY3+9GigTW6CNhF5SZ7GQ=; b=D842layQNQ38fQ
	Tpyuth77TRQNKoCGTV/zvsi7hAbMwg3TQsXuxeqTP0v4WnyganS1HL8igS5RHDa6ptRhUtyQiIKF4
	cF+SstENkRRVlsfBYawjLfsKJoyboxAeopL0knEE3Cfe8dyx7CxsiAxMSL1MYac9Wv+k01Rc8IMQX
	v9T1BOx99ACJXOGT4gDFrRsRg43y2Zjg40W1bnSE3iHLOZgkodQC0ZRy/0xokT4+Ww+wbnKKlsfdE
	L5eNLJxV128ndN1iN9gsH3gHHRrQV3q+9OLL6nPR7iug4XhIYcXzVe9NtbPHxBB0Yz5wJZNWBqL1o
	LAj0IijVYII3NZzIiJdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD6Wa-00GCCh-GB; Thu, 27 Jan 2022 15:17:24 +0000
Received: from out28-100.mail.aliyun.com ([115.124.28.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD6WG-00GBxX-QP
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 15:17:06 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4093572|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.096465-0.000677537-0.902857;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047211; MF=icenowy@nucleisys.com; NM=1;
 PH=DS; RN=10; RT=10; SR=0; TI=SMTPD_---.Mj85Ozd_1643296619; 
Received: from ice-e5v2.lan(mailfrom:icenowy@nucleisys.com
 fp:SMTPD_---.Mj85Ozd_1643296619)
 by smtp.aliyun-inc.com(33.45.46.134); Thu, 27 Jan 2022 23:17:00 +0800
From: Icenowy Zheng <icenowy@nucleisys.com>
To: Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, Icenowy Zheng <icenowy@nucleisys.com>
Subject: [PATCH 03/12] dt-bindings: riscv: add compatible strings for Nuclei
 UX600 series
Date: Thu, 27 Jan 2022 23:16:38 +0800
Message-Id: <20220127151647.2375449-4-icenowy@nucleisys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220127151647.2375449-1-icenowy@nucleisys.com>
References: <20220127151647.2375449-1-icenowy@nucleisys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_071705_130494_2C0DEF0F 
X-CRM114-Status: UNSURE (   6.15  )
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

Nuclei UX600 series are 64-bit, MMU-equipped CPUs, which can run Linux.

Add compatible strings for these CPU cores.

Signed-off-by: Icenowy Zheng <icenowy@nucleisys.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index aa5fb64d57eb..f50f5c3dcc06 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -45,6 +45,13 @@ properties:
               - sifive,u54-mc
           - const: sifive,rocket0
           - const: riscv
+      - items:
+          - enum:
+              - nuclei,ux605
+              - nuclei,ux607
+              - nuclei,ux608
+          - const: nuclei,ux600
+          - const: riscv
       - const: riscv    # Simulator only
     description:
       Identifies that the hart uses the RISC-V instruction set
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
