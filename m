Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5B8CA0EE0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 08:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67pxmOQwEwKPaa8NoKY85ik4ISHWG63OQAl5oSl+Ofo=; b=GVAPiP/adEAPiU
	4oHs8vFwbXdaddaRzByDRc9LDb+3/TDiva7umxfHQ7kbaR9HsAyn0Wti4zZdd6VGKIOdgHjObXl2v
	wekaAh93N4wVbGouib0YLGoKRdp7EWLeho2XiN/n3HOKfQm7BwAHzZmaU64wLwqQ7ojTHfXcIT0yr
	SXSWVa7+PXdDo1guTD51+YdBT2aPO94MDbvNd7Kp9ID/oP4aNrGkL+KwLxAvNSHgeTbM8esfvjITS
	CsYRO3tNu02AaZgCVmFr5FqgLnkuFnAnKJadJI9raHEoKQv3vL/G/r1cg0QndMNStleM47LhqrDP0
	2/qpUxndf/99UHFkAQ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6jg-0000000D5E8-1Oiy;
	Wed, 13 Aug 2025 08:21:28 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6gt-0000000D4Kx-02Kh
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 08:18:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755073110; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Em3ZSXtvhAnqwNgp1nuh5YcQhLbSwpjOoJikabPBmjDxbBxa/P/2+wRrDDMVM7pg6Q03CH13WMKcuPO4tTJgW/hjkFl6947VgXw/p6dtKsDjNm2pDemjWNYrWG6g2pxZf0mI7nLhOocKViV5zxLajBvp6HHz4gfmU1yQQW2mEY0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755073110; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tc17qmFHa/GPucvOeBviX5DuJp7Go3v2kqed9wv4nmw=; 
	b=XC5O1fqmCvPqUV9wFxt5RZWMSwYN4eoLsDcPJfV2xD5AG0TtSka0YE+BKPuxxD+Db9V6KuIrwedXPunbHvDpVLu6HHFQPr8/dK/m1mgK5BAZjPeuQAs9m4+OglQcpXwyj54ZMsjhrmcn0SxbrjGee+eOxres7WcP1mvTn/VuaDI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755073110;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tc17qmFHa/GPucvOeBviX5DuJp7Go3v2kqed9wv4nmw=;
	b=J4hMFpAaApTL34SWwxQ2/0XGBYXSxmedo0XTsbwDWNiRPRIsmFFManX6T/paRRFf
	pcWhibDGjzAZQoQzRb6mu97YUn+vXMzn3ETugbleZqoi/SkeSPrWyLw1SEOaLI+OUb1
	Y43GExumkIr6HAAq95PRFi57ZK3knnA3WxytRVtnIuTwJMCckQHAjilQtM3i43yuY14
	UGbLQRxBwlC6OaLAWob/FGz746otpPIDOfcHDGTpvKYlykp8bUNlYfirObFd0/2rskr
	c0oybIn7T8EmFmyPPks5ksyClzeoWMtSu+86fUJATjKYiigXEIBYcpKdmSkdP91PUIN
	nnCOAUX7YQ==
Received: by mx.zohomail.com with SMTPS id 1755073107397444.5758861641673;
	Wed, 13 Aug 2025 01:18:27 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>,
	Yao Zi <ziyao@disroot.org>,
	Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 2/2] reset: th1520: add resets for display pipeline
Date: Wed, 13 Aug 2025 16:17:16 +0800
Message-ID: <20250813081716.2181843-3-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813081716.2181843-1-uwu@icenowy.me>
References: <20250813081716.2181843-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_011835_113278_EA1D5149 
X-CRM114-Status: GOOD (  11.13  )
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

The VO subsystem of TH1520 contains a few resets for the display
pipeline -- display, MIPI DSI and HDMI controllers.

Add support for them to the reset-th1520 driver.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/reset/reset-th1520.c | 40 +++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th1520.c
index 7874f0693e1b4..06e5dff7c524d 100644
--- a/drivers/reset/reset-th1520.c
+++ b/drivers/reset/reset-th1520.c
@@ -14,10 +14,20 @@
  /* register offset in VOSYS_REGMAP */
 #define TH1520_GPU_RST_CFG		0x0
 #define TH1520_GPU_RST_CFG_MASK		GENMASK(1, 0)
+#define TH1520_DPU_RST_CFG		0x4
+#define TH1520_DSI0_RST_CFG		0x8
+#define TH1520_DSI1_RST_CFG		0xc
+#define TH1520_HDMI_RST_CFG		0x14
 
 /* register values */
 #define TH1520_GPU_SW_GPU_RST		BIT(0)
 #define TH1520_GPU_SW_CLKGEN_RST	BIT(1)
+#define TH1520_DPU_SW_DPU_HRST		BIT(0)
+#define TH1520_DPU_SW_DPU_ARST		BIT(1)
+#define TH1520_DPU_SW_DPU_CRST		BIT(2)
+#define TH1520_DSI_SW_DSI_PRST		BIT(0)
+#define TH1520_HDMI_SW_MAIN_RST		BIT(0)
+#define TH1520_HDMI_SW_PRST		BIT(1)
 
 struct th1520_reset_priv {
 	struct reset_controller_dev rcdev;
@@ -37,7 +47,35 @@ static const struct th1520_reset_map th1520_resets[] = {
 	[TH1520_RESET_ID_GPU_CLKGEN] = {
 		.bit = TH1520_GPU_SW_CLKGEN_RST,
 		.reg = TH1520_GPU_RST_CFG,
-	}
+	},
+	[TH1520_RESET_ID_DPU_AHB] = {
+		.bit = TH1520_DPU_SW_DPU_HRST,
+		.reg = TH1520_DPU_RST_CFG,
+	},
+	[TH1520_RESET_ID_DPU_AXI] = {
+		.bit = TH1520_DPU_SW_DPU_ARST,
+		.reg = TH1520_DPU_RST_CFG,
+	},
+	[TH1520_RESET_ID_DPU_CORE] = {
+		.bit = TH1520_DPU_SW_DPU_CRST,
+		.reg = TH1520_DPU_RST_CFG,
+	},
+	[TH1520_RESET_ID_DSI0_APB] = {
+		.bit = TH1520_DSI_SW_DSI_PRST,
+		.reg = TH1520_DSI0_RST_CFG,
+	},
+	[TH1520_RESET_ID_DSI1_APB] = {
+		.bit = TH1520_DSI_SW_DSI_PRST,
+		.reg = TH1520_DSI1_RST_CFG,
+	},
+	[TH1520_RESET_ID_HDMI] = {
+		.bit = TH1520_HDMI_SW_MAIN_RST,
+		.reg = TH1520_HDMI_RST_CFG,
+	},
+	[TH1520_RESET_ID_HDMI_APB] = {
+		.bit = TH1520_HDMI_SW_PRST,
+		.reg = TH1520_HDMI_RST_CFG,
+	},
 };
 
 static inline struct th1520_reset_priv *
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
