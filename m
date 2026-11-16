Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9998606A331
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 03:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I+0XRAtZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kly64OCI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Mq4exySBDVOkyA5FdriOlotaPJvX3vCjJNN/kzMN1O0=; b=I+0XRAtZ0fJuVyH03oqZ3lmvT5
	ELYoUgcOJyzJ2FtO3OGNs1nEzfQdmlRqmXZI5nMRq6q0OcaSLI3/gBu3yLg8srAWRPkhQ+37sYfO6
	X25M7N6vbfSZG68wP2s7BJ9hFtjOmkd7JuBS6hZoj1sj9rNvil3rgYO6UEmNKg9kIij1mxEU4szZr
	/W5fCeTWEhSheT4hcsqIWsCqHR9pG7zSVe5NjsYWc0YS5+02y0TyLboVXKnUYjwbna224QQy6aDgS
	/D9gUCJXOatGL1AA78gdQ9CSLKShaoNYa1SOi/eQ50JXYrfh3gw2h9oiCjUianZP0XmYAFbtflGQg
	hKvaK+lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSng6-000000014RK-3qRr;
	Mon, 16 Nov 2026 03:46:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSng5-000000014Qs-43bz
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 03:46:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8990440A35;
	Mon, 16 Nov 2026 03:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8589E1F000D4;
	Mon, 16 Nov 2026 03:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794800805;
	bh=YJ1mNVMyZabp1br/F4JAZ2tJtuCT1244HZFw9YvsAww=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Kly64OCI8u0YOzfJ3KkFUjzjY9/oCCgvs7Qro7mZZqYKTHKpnoC5uGX1Rpwhd+SXf
	 HH1w2qOaZ0hpzL6+qIACz88XVTlmWNI2D7SxKEFXNNyUYgKlxwn1vRMh9lDV8qbjd1
	 WxOI2VSw+JnjDB8nR/RygHvMuGG6Ck6AOZc3f9p28nlOYeTgROpryqfniTAowxI+0c
	 460ZcnvzWcehLit5AZOi9qt86BOPDlMP3YpfZVR3OGii6sq9tvfZ2+bRaYBo3DBAAD
	 Axn27+l7+7ktiBfgk15e98LEXUmWWAp7I+pEgSiLlOZ+MrXeaydJiSNwj6n+hB6hP6
	 rTm4T8YnK1DYQ==
From: Yixun Lan <dlan@kernel.org>
Date: Mon, 16 Nov 2026 03:46:21 +0000
Subject: [PATCH v8 1/2] scsi: ufs: spacemit: dt-bindings: Add UFS
 controller for K3 SoC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261116-08-k3-ufs-support-v8-1-e3b256972dd4@kernel.org>
References: <20261116-08-k3-ufs-support-v8-0-e3b256972dd4@kernel.org>
In-Reply-To: <20261116-08-k3-ufs-support-v8-0-e3b256972dd4@kernel.org>
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
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBq+nyT7EcJCAZomdNFEpBFIh5+sKoiEI/dOwtd0
 3hUHV9Bre+JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCavp8kxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2a2w//UliqU4JD81DH5VKfrYO2TAaExY2y94lNVWcBZ2STG2SfncFIeet0k
 YRAPb9BlkTz57uluVIJu+NoJMsgjm5U6c8Xlgpvxgif11VRRcMsoSsmNUWgyuu0QgmoQI0W26Nh
 gF4AJIukGct/3kuA9PEFu8Jmolf5dtdBqzcouMZyoyNnyWBn1E3FR2pMFjj/97EE8FpKUyVDBpd
 5GEid2sPRf+tVr0mk0FlUYpNA7sMRjIhKJZwsc3KWjy3vDIbuBJNa+4t9LCLz2okVdLBuDvHJjG
 EffZwh90z8TmZek4/zcvbcIaqClhXH0TUXOBSn/SFGbSxrBLQlkXJ3JNK9CREykfLuzpTUDrnZA
 pjsdKTUbc4gtBZ7iWsJC9ahs8b/ibVbR000eMHWvg3ERgiZHteYP9oIbiq35oDHyoqYvEEKTEOa
 cEczPbApLoc4zZPmCRceFKkBNCwFVz1AI3shdcKzXMjtfmK/KD/HB7FvIWTUukEBjhgRbAMzTnw
 hISNTXDxmv0AXcotpR1QRGY0zFI/li77JKvT9OSHsWC51789esOmexI/fJrpaS9XHy0xSes8WRt
 jRDAJeZpj7DN/pHcBifrtQ8Y71Zt0agS40gC3W8AWshVnfkQuwctmuvjNEaaqWKtBrIP2EWsbJ+
 NY1NIKvmEU+aaxccMhXVNTxhUJWD8A=
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
