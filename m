Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007E6CAC5A8
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Sep 2025 08:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pqfG9sS0w0S7gT2LMCxgfJ2fZI6ZcNuVdXSU5P44tCw=; b=OpdlpitMJ3MPTi
	jbAWcAq7BkaOb9Z3/UZW0fGakmuseoZrIE81GKH/V1+9QwAEmz9IEqE66pQOutGVYoPhwOOSQW3ZM
	u0gNWw2b1MFUACiVMN3PSlOUYkqyoVt2kb0N7EgVThDPDpPirFPQspBhXbFD+3+DE0U8GWmeWlLUT
	YP55DMNhT0WJxwSgeYXDcEf8XSNQzkk4so3hX1NyDkywN15FncYREbb44fP852ACU482uv5nJChtt
	s3eGUSr2oml2pVgrztRRSYPA8CxF0hxnbixr7jVm24psWHOJAYDajTXU+HNCPjXxlhoXhnb/moPtl
	bhY+8iHT2ZHa897rPacg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0FZM-000000077Nn-0JZ8;
	Sun, 21 Sep 2025 08:37:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0FZK-000000077Mz-3mCd
	for linux-riscv@bombadil.infradead.org;
	Sun, 21 Sep 2025 08:37:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8F+JwGCuCjf3w8Hhvlrd5/2iHdj26ikVBVJ1VKCtDTc=; b=R60x53H+0JbKREK5HKTVxxGPqI
	YHpC91hFlrl5fM+fb6NC1TPJVdXXbPoC2SuEZii7EEc59tJa+Job0NmIctPMVP5DtSwmcNXTbFSYW
	YGMSgKqKZXDf7MRjDtPCym36TFqy/xTkBCRkQ2K3C4ckTkhz6yGJFxD1XpxOSdeLCjlU3xWMPj2FM
	OL8wiyBsrHjwBF34jWFd4ZGRTi9FpMY23+KtxWXKK9eccVoAJMGvvyNVgJY5AcR5OTp3Q7VtgSAyx
	S4QAjF1Q+WWGmYclYxd8pctL6FFx2QX9zHu6/SWk/qWoDbYpzXNQBg6qhK0bK76g/vD8+Un5+E/Mp
	2wrTW4zg==;
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0FZG-000000086Gi-1CTQ
	for linux-riscv@lists.infradead.org;
	Sun, 21 Sep 2025 08:37:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758443802; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WPqPnTQbFJxbkqA+h0xKvBLHwraN98u655+A7nF/4zkMZSc1hzcGtdN2t3ZVMAzMb+lYX7wQ8Z89V7TCCmZU6oNMMUh9mhWYAGa6Jgpt0SEykMp63lxM8fqUjPUKqCJHHjwjrvolB3qdLuKR0I4K2W7OmQMP7ccZbJW6DXy2JKw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758443802; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8F+JwGCuCjf3w8Hhvlrd5/2iHdj26ikVBVJ1VKCtDTc=; 
	b=ez/QpJ2G0NowWpIB0JRmqtiU40TxoScXu+Q0Da2I0y91AQ35W9CQAJ1a2i3iX6QToLeeiySpd8XwskktfaMrIHFp2wlyWC9DoW9sIg8tI8iWA73E4dC8sDQhGfRJqbBwcFTI4uIlFXEjoAuZ8fGTQXBTuPjgcO/YR/IgwEyxnzY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758443802;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=8F+JwGCuCjf3w8Hhvlrd5/2iHdj26ikVBVJ1VKCtDTc=;
	b=BO+0t6IQ8piEQNXez8qXW7GulWVcYba1iCKdswdbNC/hengw8n+Y9clHPk5UmoRB
	qIhZzFQCjwyof/e7BssMy9Weho+GE26D54+y2MDhzAyV6kpjLUXX6+Uq+WHPGHlLaKa
	Fr8eJzzZbvslEIXbjieYhLeNcKVTczyk0s2Noq1Zlvf7DkltMwlbP3tVmmmP4VEED0T
	lMg2skohdM+mknt95nvKRxRdsjrDVmbIWdzOPRpC2/eXPbp/DXX5BMEqGG3rbHqT8IA
	KnpZngsyD7pba6jbS06LxqVxU+h4p9lZLyYImw9saPjgPTE893SJZkuPG88bq5Fqi1I
	/Y5UNO5rgg==
Received: by mx.zohomail.com with SMTPS id 1758443801039866.307085468272;
	Sun, 21 Sep 2025 01:36:41 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 6/8] riscv: dts: thead: add DPU and HDMI device tree nodes
Date: Sun, 21 Sep 2025 16:34:44 +0800
Message-ID: <20250921083446.790374-7-uwu@icenowy.me>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921083446.790374-1-uwu@icenowy.me>
References: <20250921083446.790374-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_093710_870615_D64583F2 
X-CRM114-Status: UNSURE (   8.07  )
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

T-Head TH1520 SoC contains a Verisilicon DC8200 display controller
(called DPU in manual) and a Synopsys DesignWare HDMI TX controller.

Add device tree nodes to them.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
No changes in v2.

 arch/riscv/boot/dts/thead/th1520.dtsi | 70 +++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 03f1d73190499..8cebf4eaee5e3 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -515,6 +515,76 @@ clk_vo: clock-controller@ffef528050 {
 			#clock-cells = <1>;
 		};
 
+		hdmi: hdmi@ffef540000 {
+			compatible = "thead,th1520-dw-hdmi";
+			reg = <0xff 0xef540000 0x0 0x40000>;
+			reg-io-width = <4>;
+			interrupts = <111 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_vo CLK_HDMI_PCLK>,
+				 <&clk_vo CLK_HDMI_SFR>,
+				 <&clk_vo CLK_HDMI_CEC>,
+				 <&clk_vo CLK_HDMI_PIXCLK>;
+			clock-names = "iahb", "isfr", "cec", "pix";
+			resets = <&rst TH1520_RESET_ID_HDMI>,
+				 <&rst TH1520_RESET_ID_HDMI_APB>;
+			reset-names = "main", "apb";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					hdmi_in: endpoint {
+						remote-endpoint = <&dpu_out_dp1>;
+					};
+				};
+
+				hdmi_out_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		dpu: display@ffef600000 {
+			compatible = "verisilicon,dc";
+			reg = <0xff 0xef600000 0x0 0x100000>;
+			interrupts = <93 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_vo CLK_DPU_CCLK>,
+				 <&clk_vo CLK_DPU_ACLK>,
+				 <&clk_vo CLK_DPU_HCLK>,
+				 <&clk_vo CLK_DPU_PIXELCLK0>,
+				 <&clk_vo CLK_DPU_PIXELCLK1>;
+			clock-names = "core", "axi", "ahb", "pix0", "pix1";
+			resets = <&rst TH1520_RESET_ID_DPU_CORE>,
+				 <&rst TH1520_RESET_ID_DPU_AXI>,
+				 <&rst TH1520_RESET_ID_DPU_AHB>;
+			reset-names = "core", "axi", "ahb";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dpu_port0: port@0 {
+					reg = <0>;
+				};
+
+				dpu_port1: port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					dpu_out_dp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&hdmi_in>;
+					};
+				};
+			};
+		};
+
 		dmac0: dma-controller@ffefc00000 {
 			compatible = "snps,axi-dma-1.01a";
 			reg = <0xff 0xefc00000 0x0 0x1000>;
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
