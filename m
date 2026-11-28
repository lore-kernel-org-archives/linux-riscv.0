Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B6F606A31E
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Nov 2026 00:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UmpIlMKT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=olVwFCRq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Mq4exySBDVOkyA5FdriOlotaPJvX3vCjJNN/kzMN1O0=; b=UmpIlMKTdzla23LLQovMlfpzbL
	qjN58Dt4dbcrNU5kUq3nMR7UJ2gdNap0QPXeSrn9MZhISHpHD6p4qhzPxf/bq5e1zjks2JVJtv4uY
	LwOKgjKxyvf6pb++YLRB2m7Tl9Cjx+48b2a2BhDuQNRxNF0ppnXgnBdBL0msfbuvgk4esttUUhJ2l
	yr6201xB5lsdu8IMeZTV/8vT/JmWTvnctqG7JYtfLZ7R0KbbcGTlQZ6uYg/4HcjskAuzCRlk0bMwf
	6m8GEhZ55rSt75FaG+WIwsthyRqnyRQo1XqnKDPl9wtoKW2XHE6BV62KVKIJeE12ZAiP9OLURCRXi
	HGdNfx9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX6dt-00000000F9g-0FIE;
	Sat, 28 Nov 2026 00:50:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX6dr-00000000F8z-1Wag
	for linux-riscv@lists.infradead.org;
	Sat, 28 Nov 2026 00:50:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B5BD4140F;
	Sat, 28 Nov 2026 00:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD9E1F000C1;
	Sat, 28 Nov 2026 00:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795827014;
	bh=YJ1mNVMyZabp1br/F4JAZ2tJtuCT1244HZFw9YvsAww=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=olVwFCRqhRTJg2lrpCukx0WQ4JAGouiWfRqiXwzXLw+J4GcHCJ4kRNa4NWBCBFKFp
	 mNSRhZHoO+No61GFg8SAL359yFWBxB9dw+xdxoB/23LSHtQCG9GTsmbu4o9l1B6bDQ
	 CaeZEHFKiEO7E8X1kWcdE6ttritBwpoEEx66vkT4TJM9j8K3CzDCj4ByUVXKQfkAY9
	 k3jpegbRvZStiOPmD5/XqOysB4S/2jWlaJzWnO08tnm/blhg2cwugmflKVmHvkXeES
	 zX3A3qu8VcDxvhRR1ZUyWyt5f4tb7/tAlSQ5plPppAMkj4C71fQ84ImIR91YTx2LBU
	 QWA0C5+Gytx/A==
From: Yixun Lan <dlan@kernel.org>
Date: Sat, 28 Nov 2026 00:49:51 +0000
Subject: [PATCH v9 1/2] scsi: ufs: spacemit: dt-bindings: Add UFS
 controller for K3 SoC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261128-08-k3-ufs-support-v9-1-d27deb096d1e@kernel.org>
References: <20261128-08-k3-ufs-support-v9-0-d27deb096d1e@kernel.org>
In-Reply-To: <20261128-08-k3-ufs-support-v9-0-d27deb096d1e@kernel.org>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <mkp@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, 
 Jennifer Berringer <jberring@redhat.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2684; i=dlan@kernel.org;
 h=from:subject:message-id; bh=lq7HN+yl+xEkMLtEEKnMH3G+5GAH8dyxymmhnH9G6cI=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBrCiU0hjUIAFbpVvZpk+qXHDnaAaLEcaGndiTng
 FqSMjQ+yW6JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCawolNBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3EIw//deFDCCmcIdKMaItaBsjR2qdaLQkpqsyqSDgEM5bqPR2zJafQ5Vcem
 SZ/g8Q9wzDAOtkJjZzfR0a0MYJU65VVl0QSQzK6sqMta42k6KTuPY5MclPEG81Q/jih2i0D2k2p
 l8fvYOeXaTDpWlwY6Yf7qGyzcuCDle3a57jh84LDRzMKlyTdDqHv7R59XkAAfJfyvprBSfGnB/k
 UZZ/qTUjUvXDe9p9DHKlaMVzvQg+Sbmuv/+I7PZvfP6Lg2nEZBlEsWAGxbwlRgTm152VIQiUlou
 DIxuQ+II5PiMjO3bngVTM4O70LksiRLGmZyvGA1f/JSsNZ5L0Nmr3r2EBPW37HckAdbTfezkFZI
 Mnos/tmd9rHCqy9Nmvqsf46l1OEthvdsIAL6tY33k91lv2gt+M8cwGXPAc0zFKGcEgXWDmgIwj2
 uUuxuDI2oPFa/eQB4Q5mtZwcVVNlZcPWWhzuq9hCQ2QR+SzKtJrJrhmJdWS1/HEaHNNOK5ixPNu
 QRF+IEofDpxk99l790XxJwrkDKcMva/yL/z7O3qghVbVdvskHEr2S56RCUVfFsUYps+nWm39GHL
 GqVOTGIJq48w0p/63IDlOQ5vlsiEC9bqHrbD+XVVLRysclkrDxF23e1Z6Ti08oC1NvRvUG2koSd
 c6VSWqINXDi426LLZ4VUOosiUwCS1Q=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the compatible for UFS (Universal Flash Storage) Host Controller
which found in SpacemiT K3 SoC chip. Its features are listed below:

- Compliant with MIPI UniPro v1.61 specification.
- Compliant with M-PHY v3.0 specification.
- Compliant with UFS HCI v2.1 specification.
- Supports up to 2 Tx and 2 Rx lanes, up to HS-GEAR3 5.8 Gbps per lane.
- Supports standard low-power hibernate to reduce power consumption.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yixun Lan <dlan@kernel.org>

---
Changes in v8:
- rename to "ref_clk" clock
  UFS core will search specific "ref_clk" clock, retrieve the frequency,
  and then set bRefClkFreq, see ufshcd_parse_dev_ref_clk_freq() and
  ufshcd_set_dev_ref_clk(). It will also set keep_link_active feature.

  to Krzysztof, please note, I've kept the Reviewed-by in this version
even with clk name change, let me know if you have any objection.
---
 .../devicetree/bindings/ufs/spacemit,k3-ufshc.yaml | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/spacemit,k3-ufshc.yaml b/Documentation/devicetree/bindings/ufs/spacemit,k3-ufshc.yaml
new file mode 100644
index 000000000000..2d1b066b4187
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/spacemit,k3-ufshc.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ufs/spacemit,k3-ufshc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 SoC UFS Host Controller
+
+maintainers:
+  - Yixun Lan <dlan@kernel.org>
+
+properties:
+  compatible:
+    const: spacemit,k3-ufshc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: axi
+      - const: ref_clk
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+
+allOf:
+  - $ref: ufs-common.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k3-clocks.h>
+    #include <dt-bindings/reset/spacemit,k3-resets.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    ufs@c0e00000 {
+        compatible = "spacemit,k3-ufshc";
+        reg = <0xc0e00000 0x40000>;
+        clocks = <&syscon_apmu CLK_APMU_UFS_ACLK>,
+                 <&syscon_apmu CLK_APMU_UFS_REFCLK>;
+        clock-names = "axi", "ref_clk";
+        resets = <&syscon_apmu RESET_APMU_UFS_ACLK>;
+        interrupts = <135 IRQ_TYPE_LEVEL_HIGH>;
+        lanes-per-direction = <2>;
+    };

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
