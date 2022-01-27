Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C67C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 15:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UNOIDPaIHfCUil2EjM02LkP0Vj5OMno0FiXjAopkmNs=; b=Yt6YiyB+JINbfn
	AKB7Umn68TyRcBMSv0J9Xh1e7cpU+S/xUyZXR2dqsX86W1FAIjJhHBQPhN5TXoci+KE38cEEGpJBI
	zuXmkHMCHRz9JwlLch+dYvvTs10gxuqg0M5qYI+R/S1kPPviPC/hBGqUzy5yVgp2MHms5jZPfRsX7
	glmxl1xbMadEm0R061W05vpREAY7W/m7rSgZ+sBmdAh6eF1P0onJMMs34X0fS0w5dKJgEIf0tA0Yn
	7xSe6QgRFuqrCtbsesytG1WgH1JjTBSZD6cQNresoc863MzZywqqnlF/x5VpP0JK0bFy8oLiGJWp5
	XpXgBClGNIrbxEcLvFiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD6Wh-00GCIZ-JQ; Thu, 27 Jan 2022 15:17:31 +0000
Received: from out28-148.mail.aliyun.com ([115.124.28.148])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD6WM-00GC11-DN
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 15:17:12 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.5467414|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.023987-0.000137044-0.975876;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=icenowy@nucleisys.com; NM=1;
 PH=DS; RN=10; RT=10; SR=0; TI=SMTPD_---.Mj85P-f_1643296625; 
Received: from ice-e5v2.lan(mailfrom:icenowy@nucleisys.com
 fp:SMTPD_---.Mj85P-f_1643296625)
 by smtp.aliyun-inc.com(33.45.46.134); Thu, 27 Jan 2022 23:17:06 +0800
From: Icenowy Zheng <icenowy@nucleisys.com>
To: Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, Icenowy Zheng <icenowy@nucleisys.com>
Subject: [PATCH 06/12] dt-bindings: serial: add compatible string for Nuclei
 DemoSoC UART
Date: Thu, 27 Jan 2022 23:16:41 +0800
Message-Id: <20220127151647.2375449-7-icenowy@nucleisys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220127151647.2375449-1-icenowy@nucleisys.com>
References: <20220127151647.2375449-1-icenowy@nucleisys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_071710_732824_E9BB0A69 
X-CRM114-Status: UNSURE (   6.16  )
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

Nuclei DemoSoC design integrates the UART controller from SiFive.

Add a compatible string for it.

Signed-off-by: Icenowy Zheng <icenowy@nucleisys.com>
---
 Documentation/devicetree/bindings/serial/sifive-serial.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.yaml b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
index 09aae43f65a7..329341a3648f 100644
--- a/Documentation/devicetree/bindings/serial/sifive-serial.yaml
+++ b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
@@ -21,6 +21,7 @@ properties:
           - sifive,fu540-c000-uart
           - sifive,fu740-c000-uart
           - canaan,k210-uarths
+          - nuclei,demosoc-uart
       - const: sifive,uart0
 
     description:
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
