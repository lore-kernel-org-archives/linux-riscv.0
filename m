Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081D4C61CE7
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 02:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1at3ufdwLw2mHc7i7cqnvSw7HOto0QgB/ePUhI3O+5E=; b=WO1g1jIP837s+k
	x0mbqz+g0+TPSH5xBdHNZ5dR9yWuZxo+sAZja4ZmuwvY8Piw+V0kwrqKQL2/z/6qEB8Q25ChcG4Cb
	btQtnsY44M9og9ir1Nq2eISJdZQpCdkevG7HlccVEH4PWoPpLWqO8/zLfw+TJ6ga+vqiawyiYjHBv
	T7ltxxcYHl11dU59oDWcRsb5d3uTM6OJ1BfpinFo59fOVfHQpNUUkvPA8vYVsHmF+qpw345fVzNDT
	0FVXJtTqfYNfo498uLrEnemhyqKMkZrz4gNH/2b7oN3tsFy5UP8TpK3jwt+s3+49bFM72Al9i8xUy
	qj+B6Tc5M6BRIf9ep1qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO5x6-00000002Hrd-0eiD;
	Sun, 08 Jun 2025 02:40:04 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO5x4-00000002Hr7-0GKu
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 02:40:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749350395; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KicxdlJzQgHonlx+VKM82CsMXmpKTWXpffA9LiaeFjR+rn5gSQdev08HE96h2H8kef/O32spJ2DT4gv922PMY5Fm9Y3c0nk9VktPDLOYRQ4LOoOx6l6gsBnRPn3+DdR7FN6Yo6njXP73d+sLYIDPlE6pdRRB08WpUicxVTNEgWA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749350395; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2e3tyxIFEdlJkSr9hgbOko+0LgoyRZui+/GEBb0jcGQ=; 
	b=JW2yzB7DZveYwzXB5aDrb3pD7GqSs2d3uA8aCczm6z5xhsB5OYepmgiPciGom3bt4oC+ZGPwSiMb77JFOh23J8yub5a9m8ANwg9uheP2OLeWVfBLjXKlBlIG1z6Qvao/LxBtT9J/a9Y++3Lmkyvl5B8lzYpGZZzd79VCAKThm6M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749350394;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=2e3tyxIFEdlJkSr9hgbOko+0LgoyRZui+/GEBb0jcGQ=;
	b=LK2Xl6T0F74dJgAFBwLSOaT/Hf7Cg68K2Oya3Ve6KSkwba5Q3R6SxGs/xD3j7fvG
	nmMZpJznSwt5cqcfyB+vghRvff6neKPLNzrXicX3F2fAcTyE+NQ2O5KYqHAsCexAoPI
	jlwxs7E0A8y7MDUTXFgm8apoINUuJum9bwdS3BhA=
Received: by mx.zohomail.com with SMTPS id 1749350392696220.11054495371593;
	Sat, 7 Jun 2025 19:39:52 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sun, 08 Jun 2025 10:37:39 +0800
Subject: [PATCH 1/2] dt-bindings: remoteproc: Add C906L rproc for Sophgo
 CV1800B SoC
MIME-Version: 1.0
Message-Id: <20250608-cv1800-rproc-v1-1-57cf66cdf6a3@pigmoral.tech>
References: <20250608-cv1800-rproc-v1-0-57cf66cdf6a3@pigmoral.tech>
In-Reply-To: <20250608-cv1800-rproc-v1-0-57cf66cdf6a3@pigmoral.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749350360; l=2534;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=CZFQN0TexDJ5n/S0W8OU0fUYLQb5fAc/s4Vu1U7i8hE=;
 b=SgtU7OJVOg1Isstuqp4D37soJdLYZ+/hfxkTPFTd5DiosWcvIHuQ2q8xUgPZ5J5gvQ+D7cOyP
 9fiCmd3iSX3D7vKLQAyVJZs411pYNri30fxyCYtW/JZQa4pYJfCp814
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_194002_141947_30AF05A7 
X-CRM114-Status: GOOD (  12.53  )
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
 .../bindings/remoteproc/sophgo,cv1800b-c906l.yaml  | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..455e957dec01c16424c49ebe5ef451883b0c3d4a
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
@@ -0,0 +1,68 @@
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
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      The name of the firmware file to load for this remote processor, relative
+      to the firmware search path (typically /lib/firmware/).
+
+  memory-region:
+    description:
+      Phandle to a reserved memory region that is used to load the firmware for
+      this remote processor. The remote processor will use this memory region
+      as its execution memory.
+
+  resets:
+    maxItems: 1
+
+  sophgo,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the SEC_SYS region, used for configuration of the remote processor.
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
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        c906l_mem: region@83f40000 {
+            reg = <0x83f40000 0xc0000>;
+            no-map;
+        };
+    };
+
+    c906l-rproc {
+        compatible = "sophgo,cv1800b-c906l";
+        firmware-name = "c906l-firmware.elf";
+        memory-region = <&c906l_mem>;
+        resets = <&rst 294>;
+        sophgo,syscon = <&sec_sys>;
+    };

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
