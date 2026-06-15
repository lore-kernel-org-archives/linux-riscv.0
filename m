Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A1ECD98DA
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 12:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Dw7bPRxdxQ9I9YXNWwVRqiad4az804L8ETjV2+Df9k=; b=Y73dWPVRbt3I4v
	0m6vgNEJopqFdmn+An5/qETq2dbcFnD9uR9ULfikkmDFL7Bdfw5wEMOVgKENVqxlauG8Lbd+U+5GM
	hpVY3Ou+c6Th2uvzzSZ2S1YpW9kay/CuDgivTq1gTqksUwL2yZVx//y6yHq7/E9uhOAontsXdlUJ4
	H8p5vxalxQVaikLfNAVmxwqXaDlg9BF9j+13nQiGjkc1ZoQKNCUt+9BVSLMlOdfFOi4SP9t8sC05W
	gXcvP5uJXHCLQozrGAoIcMuQ2Cm1R+iZAnGA4BxXNsH0wIY7LDFvnCEWAzYYwfURdLcojWSUTeGnS
	EHSedOpag3rU9X+DP9Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ633-0000000E8h8-3QFz;
	Mon, 15 Jun 2026 12:04:13 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ631-0000000E8go-3YGu
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 12:04:12 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-517b1f2c668so36624801cf.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jun 2026 05:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781525050; x=1782129850; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRwZTT2w4p8NYfNQ0Ipiacgsycn8UzShxm+qaAwvLsw=;
        b=j6OjI4fLyxDt3TquQREvnF3woqARoc2fVOkWj2KqqdmprwsIZPiNLOh//hS6AeU1fN
         dJdy0lIeoeK12NlI0ClOV/YWS62L4CdPhK9OOMEVKyIdTvC5ypkonnBTgioDd5EjycvF
         41ra17To99uoIhpzKoaMCfDaYwvlck8176cPCTT6oEDQ3Mmcjal05A1+t4UDrIeRFNW2
         wRKSVAZwaCUnqbBIreV/AeT0CAmzsmjNmM5X9Bqe98rZ2FkTvQF/fPVt7BTW4vI8NgkQ
         CtLm6SnaZgo/+HcTsNjdhennU40wtYob44cbBB8wfHNnyYBRUqx3mO2e/dXcaLtUbYbm
         cmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525050; x=1782129850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gRwZTT2w4p8NYfNQ0Ipiacgsycn8UzShxm+qaAwvLsw=;
        b=SUQRPqZBuNKl+zUSbB2CKVbtVOPzJy6puLjU+hwGppXF9ior3mdQ6xT+oLs6faEJ7X
         yIGfzzmQ3oBXOCCGHhN+/aF9DrIBBe86map2NFRDUz53GwQk3XWaeGPQrzDxfWSUw3IA
         d3CcPNXSvheBIroY25lCct9aXTF5p4CyQxYv9lTbgO3kPOcyfvTmPD2uY21+KSNsBVMT
         kCphGCvz2WKR+GFUqQyky/t47DJ/GKOEQlVNNoJOZFG83/vxQ5c7pKTQJr0FXQjlbg/A
         XrP034zulxAymGewCN+C84yGkDEG20046haiEmDOmjZP8EmfyhaMHNpXptYDMOgi0aGC
         NnmA==
X-Forwarded-Encrypted: i=1; AFNElJ/3tPPWQVK+7eZwxbIj3nCk6c/GgcfRmk7NdPDhsoVXMSXB+UhOXHFm/967dYaEo9yRLUyy1ctDFYq5VQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwG6MQALSFgqrG0pQXCfG9GFP1zoYcthF/oZ1q6dVPvOnx3MLs6
	osP0f2lmyCtZqa8ORiwZDz4N67Rzv2ZtPdYRGdm/je7Y/aB5CeJ7ZhaX
X-Gm-Gg: Acq92OFqSt6yScUWP1e85fIzFCiGkLPzAkfZ9NaKDOVl90VvfSFg88HYYELSv9dZ9nt
	mjRz5Wh3fYPOh40/mWTRZdIkq7g5gs5jUEuTTw1wBn34h8H8ofYupBlfu5NptVD71OROWki3xFC
	YsIMN8a4HYD7WMBsftANzGMmxCRfXyZkikn6JWywtmi8Hbmq7TG0H721biJC5Ei73JSaxlN4iFE
	pxzh9YuQbzNCfqVWaQ6NLulgJJkAp6+rl2JSUrNEmxqU7nKx4ctQDaxVxHluK5TcF/J5VLO4hRe
	iG5g+k+MfbWIbLoYzf8tdMF0EmFZeqRxLarTsidfKWhQNiwBQAYfPOML57Ne/qA8mutQR3mpbGY
	Gf3JS56/A6+4cLUKNWoSiDRdlpyS/B0Z6GBxc4jcdtC05EdK6UNH+MWZwmzweIKbn6W/9Hae0U7
	pawrCsWZlce7KJ3q6e1g6jenfNVBTyzyiEMj+Wzkb+mL+JKUw508KzoW2r
X-Received: by 2002:a05:622a:1191:b0:517:5b2c:6aae with SMTP id d75a77b69052e-517fe1de684mr198345971cf.13.1781525050315;
        Mon, 15 Jun 2026 05:04:10 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51975955956sm25184311cf.17.2026.06.15.05.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:04:10 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	chen.wang@linux.dev,
	inochiama@gmail.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	hanguidong02@gmail.com
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v6 2/3] riscv64: dts: sophgo: add SG2000 dtsi
Date: Mon, 15 Jun 2026 08:03:23 -0400
Message-ID: <20260615120324.1527881-3-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615120324.1527881-1-josh.milas@gmail.com>
References: <20260615120324.1527881-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_050411_897276_A2C48252 
X-CRM114-Status: GOOD (  10.03  )
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

Adds sg2000.dtsi on the RISCV side.

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
Tested-by: Gui-Dong Han <hanguidong02@gmail.com>
Reviewed-by: Gui-Dong Han <hanguidong02@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2000.dtsi | 53 ++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/riscv/boot/dts/sophgo/sg2000.dtsi b/arch/riscv/boot/dts/sophgo/sg2000.dtsi
new file mode 100644
index 000000000000..38462769574f
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2000.dtsi
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "cv180x-cpus.dtsi"
+#include "cv180x.dtsi"
+#include "cv181x.dtsi"
+
+/ {
+	compatible = "sophgo,sg2000";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	soc {
+		interrupt-parent = <&plic>;
+		dma-noncoherent;
+
+		pinctrl: pinctrl@3001000 {
+			compatible = "sophgo,sg2000-pinctrl";
+			reg = <0x03001000 0x1000>,
+			      <0x05027000 0x1000>;
+			reg-names = "sys", "rtc";
+		};
+
+		clk: clock-controller@3002000 {
+			compatible = "sophgo,sg2000-clk";
+			reg = <0x03002000 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
+		plic: interrupt-controller@70000000 {
+			compatible = "sophgo,sg2000-plic", "thead,c900-plic";
+			reg = <0x70000000 0x4000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <101>;
+		};
+
+		clint: timer@74000000 {
+			compatible = "sophgo,sg2000-clint", "thead,c900-clint";
+			reg = <0x74000000 0x10000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+		};
+	};
+};
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
