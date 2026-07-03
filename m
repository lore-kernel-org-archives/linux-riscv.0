Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210D6C43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 02:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tvd5Das6XUIcfTFxzSNnvEdUSU8i1u/b6VZm+0GiX/w=; b=MXb+4WCg7WhXav
	/yxFXaONdwVLDDtYGe+L3Ra4oNx4Ia9VNhjnFnQSTC7Rxxd4OB2eVSl1PeD4EaqY1lqu+pLEgogFr
	fhU3PHVJy6/yktsmuI2+egS7kI1wGN9+Rqx97+IR+DWWTqzzoTfJvktnjtaVAhoQtc45sPRFokIdz
	dsxa654B7xhZ4dU+T6acOkXKsI/OriGrDUZd8bBBOb33q2WMMLR8kCr/1THMaibxyUX2PVSuDe2JG
	T/gumRDa4/dTf/zormoeus9RMSCaT8v5+2a90iVmqfHIGdosWHZQMAbAQ2pt7llTMSvF6yV/3WMnI
	IhqhH11H59sT/2kfLYCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfTMt-00000005s6N-0BDc;
	Fri, 03 Jul 2026 02:11:03 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfTMq-00000005s56-2sYk
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 02:11:01 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-37d46e0d246so65144a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 19:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783044660; x=1783649460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLtOt0nYZtjUYJXDOkZT3LzWT/GyJY005mggTmWgITg=;
        b=F7W0iRxZ9sRYZkSIUyyrZ40T8L4gnDGAn4E/Wpg5hW3LZ4EQtjQ8GGi8lDECywLDFf
         JkIeow9FyTfqbSJOQNiMUe5k6I3YVr1n/K/H/p9A/nD5wonGOrYSwqUN35Tz0yd/AFXJ
         MStM3dMMbkMdZ0jJ6dM1xaTJroFfIMXY2zM2vSOBiZiMuOuXzBVXM705GPjkxWX3MQI0
         Q8LKLkC5GzwygEZBwyUFXowe9kDEWYpBy0fUQEs4NSygQ1RNgsH2gtNDrafQkQ9eusW/
         94Z2x/qSs6n7HZN79whhF3QYJsfWTNyGhToa+IIEIHZDY8xZhIaix3wAC0pY948eD6uS
         /qLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783044660; x=1783649460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fLtOt0nYZtjUYJXDOkZT3LzWT/GyJY005mggTmWgITg=;
        b=oSRKXm3aiQCAwXBdi4bSZug+kEQz6UMaLkj7p6TIVA4sEqipWBm9PxPyFY2knlC/06
         NdDdGZxYWiEM+nPgj2gUxUNf0cARSmcU9PRSMhEgUaBfRJqyIs31xhEeLFbXqS/fbDC2
         RB/luk6xOTP5amrB5dFck8LpXnJmziMfTLkltB/XG9V4ocmQLdBNOYIl2PzauslndOEA
         qBkonotFnPTfzslx90WDSlH25hBZQx+toRSz9a9fDyldnRqiL1e0UpmuZSaZpOzG9GWq
         P9d5nqm0RAdGIRRzadR9AsP5vIG9Cy+kxYPosLvIyhVZ3A2YPP6k6sEVgoK+RIOKPpN+
         REAw==
X-Forwarded-Encrypted: i=1; AHgh+RpLhZZx3XZuOGQmpID1nj5qgRmhJ3ZORg9XXQIkQTfhV/mjrtoAP4KSLwS+dPoP0DXTv+d+XLO42R3HrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkkU2odd0AOmyyjxdOx4Dt94h8ouP1s9vDtii9Kdtt90jZdzDt
	t8uWvtClX1RrZ/Mz3xi95cCuzywD9kb+he8BIGq2p6jzcz3DXcgERYwY
X-Gm-Gg: AfdE7cm3qkeLTb8v89prebmJXf80xEgnX0tlC5JbPjyYJBFHas1rQp4jXMUnI3xK2Mf
	H7bhnTyndIBHrpDQH5pijIphrFEjaOeGSedGAn6FAKwg4458aRqLDwznCgV4pEQ/nW0ZhKwaSRd
	CVjrZWR07vVB+jnLARODtoYPm853LzU9AcIH/AgEaFbWYHxyWinhR9xvPUPAwPOGJ2ndTvOHw1g
	48gy5v46QpQExGAiCahXjbISwrJShYObGVe3p8xBltYdEfy8pb/jStknZk0B8gquQceHypDGogh
	oT22rjVjpCd59Y1GLRrgxlF+tJpZ9nxHtt76iPL6xuBgCVIOXrB2wnmI75ZYL9YjDEXOie/aZjH
	7ftykjcAPbp/1cg2weUhNvTvZozQFr0DVGMn3PsopEaFQCOkyAD74Z3jfCZ3zXAei3S8p5NJVse
	aUyhksQbjtJnk=
X-Received: by 2002:a17:90b:4d88:b0:37f:bfd6:8b40 with SMTP id 98e67ed59e1d1-380aa0952c0mr8804402a91.5.1783044659714;
        Thu, 02 Jul 2026 19:10:59 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38128174885sm194920a91.16.2026.07.02.19.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:10:59 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Ze Huang <huang.ze@linux.dev>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: phy: Add Spacemit K3 USB3/PCIe comb phy support
Date: Fri,  3 Jul 2026 10:10:22 +0800
Message-ID: <20260703021024.495433-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703021024.495433-1-inochiama@gmail.com>
References: <20260703021024.495433-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_191100_733061_C89906BA 
X-CRM114-Status: GOOD (  14.29  )
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

The USB3/PCIe comb PHY on the K3 is a complex PHY group that
can provide multiple phy for both PCIe and USB controller.
Its mux configuration is controlled by the APMU syscon device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/phy/spacemit,k3-combo-phy.yaml   | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k3-combo-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k3-combo-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k3-combo-phy.yaml
new file mode 100644
index 000000000000..ed820cf697b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k3-combo-phy.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,k3-combo-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Spacemit K3 PCIE/USB3 Comb PHY
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+properties:
+  compatible:
+    const: spacemit,k3-combo-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 2
+    description:
+      The first one is phy id, the second one is phy type. This
+      only supports types are PCIe and USB .
+
+  spacemit,apb-spare:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to APB SPARE system controller interface, used for
+      PHY calibration.
+
+  spacemit,apmu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle of APMU syscon
+          - description: configuration of the PHY lanes
+    description: |
+      Phandle to control PHY mux configuration. The configuration
+      is described as follows:
+      bit 4: 0 - PCIe A x8 mode, 1 - PCIe lane share mode
+      bit 3: 0 - PCIe A x4 mode, 1 - PCIe A x2 and PCIe B x2 mode
+      bit 2: 0 - PCIe C lane 0 is PCIe mode , 1 - USB mode
+      bit 1: 0 - PCIe C lane 1 is PCIe mode , 1 - USB mode
+      bit 0: 0 - PCIe D lane is PCIe mode , 1 - USB mode
+
+      The bit[3:0] is only valid when bit 4 is 1.
+
+      This mux control does not affect the PHY for PCIe E, it is always
+      in PCIe mode.
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - spacemit,apb-spare
+  - spacemit,apmu
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@81d00000 {
+      compatible = "spacemit,k3-combo-phy";
+      reg = <0x81d00000 0x600000>;
+      #phy-cells = <2>;
+      spacemit,apb-spare = <&apb_spare>;
+      spacemit,apmu = <&apmu 0x00>;
+    };
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
