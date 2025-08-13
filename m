Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F28C87FCF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 19:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jv0d2Uw8WrG8upL1/8pkoMmnNSFAtqFEHiwMuldMHno=; b=cPSxpo8syJyKt/
	nLHEVwNz4ek6V/H5PL+IWYyhY4ksXNWb9Tzl49easRM2jbk6ipuTVi4s1kHXgKks2u/3uMqMkAwRR
	i0BrYZ6XRcBo5r3Egn1f37rR9sbW6bjX5MHGKDlzWoDQLtqvv6Ngi5vMbx7+NW7K2o20IVmV/iOcs
	KVChlvqKLKAw1EsUUHZo7jUeHaIKlvJC+ErqakFhbG0ICLcNZzvfGN0DVwyX4pGg3jPSJXuSOQE5D
	0qC31txoNgdDzo5w3rFPjuQcEEwfgPoIkMTAeHIU2hKOvsHNnurPUhy4mTxUDfKkIuf223DL1Brg0
	6zDJAKHp8QJWAT9Aw+dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHQ2-0000000ErgP-3KSD;
	Wed, 13 Aug 2025 19:45:54 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umGVD-0000000EjKv-3ZVe
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 18:47:13 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3e57056daecso504635ab.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 11:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755110831; x=1755715631; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3anfg9B6GDnUStv+H7P2Qqm8t3EB0LsOUKal4iU9hMY=;
        b=Ya/kmp+OvPAOt5a/+va/dgrFwMdzF233PKYiai6cxiXT+g7djMZ50zEpwOIMRDCucC
         SgdaZMq2EjIMCJwikg2rJXtpFUL0aeSUtRXoVECTxpwenwksO0cK0OTZ7mZXzciZZ0Vi
         6+9PNh/odoOBd9UBVf1CYvO/T7W/eeVo9dW8m5txeb8I3LUi9srpR0V4QiUYrHlXOG3L
         LdMvjRRvZgqYgvWzq7tZdjqoVPutM0TDFMVvMurOsOxDFgg7khnyHgsCfVnMlDbUXv5a
         ne+PZl9TIqCUQDTeNH+q9VKfWpuho/eTDV+L1Rs6VT8iy/MHb480kkyXM1CTL/bGDVdi
         JkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755110831; x=1755715631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3anfg9B6GDnUStv+H7P2Qqm8t3EB0LsOUKal4iU9hMY=;
        b=MuWAac3jnukrGLV4s5S8Np9W31AfWpFot9lC3oQmbyLh9kk4NfQkTbaS8cbBnzpVlN
         dJLM6sCYIlowUaCAUbqffqLVyFV1iBT/q2TFVlKk9ABh56DsfOfnr+TUQx+IsrfXnaAY
         sASokRi2aUek1E6ugYGiM23DTg7rvEh/2mo+7u6IynSNGFCSXzy3ntizbbaKc9tUktrG
         +j0FPltjo4QvZYxuJTe9FL+y7aw23XfW06kMwWJwdeexjjfS8XUjfkTkNYxUdyh+cUSI
         L/pwVnYDQEitRh4SYcRuilPK3BskWFMWQtgHXHvosnBFlS/LrrWFf4VhAhuL6Iqjth34
         WldA==
X-Forwarded-Encrypted: i=1; AJvYcCUprxFMqpTDWHon2nqxgtPZvQ4mw/YEqr13Dpza0ITRlH4yVSpLzSKGb3lnqHSyG08Jq5tGARn74uMR1A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo+8PVndMYhsZ6+On52NZqyEgkKMduAL3fDgdt1uT65eU+KUdN
	rSrQ9IwEs8kRwIF0aEColb6OnsS42BKBW3kmkU0fkfZg1BBplAqd0mx4krOHwRqjw9Y=
X-Gm-Gg: ASbGncsimxHMFHZisgpU6/Al6cOLeZgT87O6MBB/WBZJ+1VRQlFwsKqWxLo8f0JxfHF
	I8TQKE3S+fAhHrmcv2u3e4jV6Ij5sr/LicxIEhenylSwICUO7qQYpqJCJWYZE0Fzgw0dv03vLqS
	VnIzcoey+2s83l2k3/LPfhVgZ/KmsDqfpd4jKhVUHi3qeNUMDnk5/jgndQTYD5CaTYuAY4GjWUW
	SiNY3jyn8ykZKjJxdg8NGzEa73sKIdfAvACXQV7qhgz68cTsTdJPskj5OwPFJc5M4U+P3NsAx2e
	H5uv0gVL06wWGxldoiJqLpf4R6bf1+M4qi1tbOMBL0bQFprxmlV3J2itlBVkMXFO6VDrwnUKovN
	6Co1xsGkCps99RHciv1u+kwtH+AFbuJp4Dg3xKNafoRSZBB04IGxerW3HgUD67hTKvmLH3MUw3f
	Rz
X-Google-Smtp-Source: AGHT+IHqcfmnRrUjdAlNWmje55A9T53WMKx9lEOXpWePQCsQDSmAhiGvxZUCa4A2bLPkAxx42qtLRg==
X-Received: by 2002:a92:c24e:0:b0:3e5:4a4c:2ed0 with SMTP id e9e14a558f8ab-3e570964fa7mr4127025ab.24.1755110830847;
        Wed, 13 Aug 2025 11:47:10 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bd89d7sm3933104173.59.2025.08.13.11.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 11:47:10 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	vkoul@kernel.org,
	kishon@kernel.org
Cc: dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	tglx@linutronix.de,
	johan+linaro@kernel.org,
	thippeswamy.havalige@amd.com,
	namcao@linutronix.de,
	mayank.rana@oss.qualcomm.com,
	shradha.t@samsung.com,
	inochiama@gmail.com,
	quic_schintav@quicinc.com,
	fan.ni@samsung.com,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: phy: spacemit: introduce PCIe PHY
Date: Wed, 13 Aug 2025 13:46:56 -0500
Message-ID: <20250813184701.2444372-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250813184701.2444372-1-elder@riscstar.com>
References: <20250813184701.2444372-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_114711_888103_B1F47B39 
X-CRM114-Status: GOOD (  13.56  )
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

Add the Device Tree binding for two PCIe PHYs present on the SpacemiT
K1 SoC.  These PHYs are dependent on a separate combo PHY, which
determines at probe time the calibration values used by the PCIe-only
PHYs.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/phy/spacemit,k1-pcie-phy.yaml    | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
new file mode 100644
index 0000000000000..b0cbd231d9378
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,k1-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 PCIe PHY
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+
+description:
+  There are two PHYs on the SpacemiT K1 SoC used for PCIe (only).
+  These PHYs must be configured using calibration values that are
+  determined by a third "combo PHY".  The combo PHY determines
+  these calibration values during probe so they can be used for
+  the two PCIe-only PHYs.
+
+  During normal operation, the PCIe port driver is responsible for
+  ensuring all clocks needed by a PHY are enabled, and all resets
+  affecting the PHY are deasserted.
+
+properties:
+  compatible:
+    const: spacemit,k1-pcie-phy
+
+  reg:
+    items:
+      - description: PHY control registers
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+    pcie1_phy: phy@c0c10000 {
+        compatible = "spacemit,k1-pcie-phy";
+        reg = <0xc0c10000 0x1000>;
+        #phy-cells = <0>;
+        status = "disabled";
+    };
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
