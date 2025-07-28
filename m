Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D00EC87FCB
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 11:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ViCIfHDE93/SrrnWF9rfPEgYtcNKT7dldwEMI83zm1I=; b=PnJxp0QcR/1W/p
	Bvhg027dkTIlnUjjiE8oBuK2YmTjWftOn6ycsdn4mND9C+mihfk5Q5R8a2O0tDV07An/ry/kCWNWM
	YjSg4tApv2jlJlmQ+onc93mWGkaAPAlVM6Tt4rYX7bOfcQNxSzckntz8LJKM3nTdcfN7CCoHsZqDU
	83wzYYynCG8+1nUbBpQNdy2ZMtTt3ulrZz5tXvG9EpCPljGmtlQ/qhUCCdxVUiNdMjahPjRaJhvwX
	nPKGeV3WXXRjXlI4JwMnrDDZ+sfmZeB9f0bQYiUF8kKvOYQrHqO7E6KzrrtJM3U2gT6rizEYbQ4WU
	lAzJur7+E3MeT2c9VHww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugLfm-0000000EJWn-2TQd;
	Mon, 28 Jul 2025 11:05:38 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugLfV-0000000EJSM-0AV2
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 11:05:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753700710; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mxskvzESCpWwoLAeDYWZI0TwuTKd5v/58ddOerjCl+sDXuVJf6DoXzsrPVgfDaLTszQiOP9izDotiOey7G5tkc6R9I+JngFNDgacf3FFqgsS/hNu+K2TOYw1MqWROptomK6cWLL+HdBYfKnr0AKeQHgkA3Bu9sXKksvzZQ8+2w8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753700710; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8OPHGzrnmIEbRwrRDOKg+uuw/TuQkj1sMVpcX08/ceY=; 
	b=DxEl9+QRX3JnHh6ZGsaf3br6fgQYejewB8JyRBCpvV3enshVCVDZS+hOCp90TSXdtaUGiFCykDRrbmoMugPvPSVrevveKQLRdccw98m8ROmsgPH7rBoPSrBw6aPoA1CFBpUJH1PCDtiPbljaWPGoxDNS272r5DyCCaXDxMjJS/k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753700710;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=8OPHGzrnmIEbRwrRDOKg+uuw/TuQkj1sMVpcX08/ceY=;
	b=D9j8J2fFD1G9GPRcjThSVVcuEpX6xRNN2EC42xaZGy/mKS9KpDrz6Pgi8yFkUzbJ
	zEt0DIyUG43P6Fs/U25xJwbXTaKkq1z/0iiGtM2fVJqpKZcx3no71IlOs6JttiRREnW
	FfciMttAgpyUdPEIXwYUi0DXSrVr+qXmhWupxB8A=
Received: by mx.zohomail.com with SMTPS id 1753700707146593.1713743889961;
	Mon, 28 Jul 2025 04:05:07 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 28 Jul 2025 19:03:23 +0800
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: Add C906L rproc for Sophgo
 CV1800B SoC
MIME-Version: 1.0
Message-Id: <20250728-cv1800-rproc-v2-1-5bbee4abe9dc@pigmoral.tech>
References: <20250728-cv1800-rproc-v2-0-5bbee4abe9dc@pigmoral.tech>
In-Reply-To: <20250728-cv1800-rproc-v2-0-5bbee4abe9dc@pigmoral.tech>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Junhui Liu <junhui.liu@pigmoral.tech>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753700654; l=2951;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=ZB4kDHCFaJuzwRA42VaNOLuvt1FPSFTas3nAGCakyvE=;
 b=faLLUs7vY3n9i8AlYkzR4JQtjNeppyGSbX+6HcHu7fQIXCQ9vOjrM9ZSsxZDYMwUO3xFHnbIP
 Dy5H05xAIa4DW++sIkEk/oA3p0RXDleANvR/sOWCZJOanlphVki/YX9
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_040521_114135_3CF4E959 
X-CRM114-Status: GOOD (  12.61  )
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

Add C906L remote processor for CV1800B SoC, which is an asymmetric
processor typically running RTOS.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../bindings/remoteproc/sophgo,cv1800b-c906l.yaml  | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2061c2fd6ba343c09b1a91700ea4a695d2b57f81
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/sophgo,cv1800b-c906l.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo C906L remote processor controller for CV1800B SoC
+
+maintainers:
+  - Junhui Liu <junhui.liu@pigmoral.tech>
+
+description:
+  Document the bindings for the C906L remoteproc component that loads and boots
+  firmwares on the CV1800B SoC.
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-c906l
+
+  firmware-name:
+    maxItems: 1
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  mboxes:
+    description:
+      This property is required only if the rpmsg/virtio functionality is used.
+      (see mailbox/sophgo,cv1800b-mailbox.yaml)
+    items:
+      - description: mailbox channel to send data to C906L
+      - description: mailbox channel to receive data from C906L
+
+  memory-region:
+    description:
+      List of phandles to reserved memory regions used by the remote processor.
+      The first region is required and provides the firmware region for the
+      remote processor. The following regions (vdev buffer, vrings) are optional
+      and are only required if rpmsg/virtio functionality is used.
+    minItems: 1
+    items:
+      - description: firmware region
+      - description: vdev buffer
+      - description: vring0
+      - description: vring1
+    additionalItems: true
+
+  resets:
+    maxItems: 1
+
+  sophgo,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the SEC_SYS region, used for configuration of the remote
+      processor.
+
+required:
+  - compatible
+  - firmware-name
+  - memory-region
+  - resets
+  - sophgo,syscon
+
+additionalProperties: false
+
+examples:
+  - |
+    c906l-rproc {
+        compatible = "sophgo,cv1800b-c906l";
+        firmware-name = "c906l-firmware.elf";
+        mbox-names = "tx", "rx";
+        mboxes = <&mbox 0 2>, <&mbox 1 1>;
+        memory-region = <&c906l_mem>, <&vdev0buffer>,
+                        <&vdev0vring0>, <&vdev0vring1>;
+        resets = <&rst 294>;
+        sophgo,syscon = <&sec_sys>;
+    };

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
