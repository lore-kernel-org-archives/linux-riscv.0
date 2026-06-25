Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8EBCDE011
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 17:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UcMXh+CjfeVoMuld0y6aBRFumtwpv3usPOcGeVEiFag=; b=OQMCckn3qrgUgA
	hEEIZ74sC0FDyfwvkHw5yFySaOe2h6QSn84GYq/dtdf1vaItHWYoIENusJTsIxynA5oeLUrtXzdKx
	nFmYG3hN2hRO+G2y0w25NXpXPh1Cw072CdU72tGzyGy26Bk4Bt1Nuq95f3cBG4rRSkQzxR+bn0XVd
	su/WB1VbjBgav3Lbi/aAOpdVjxdYiajYae4cP/2TNWcFCiCQ7BKHWg+WwtwD/MFeLmyWSxdfvN6dC
	UUQSqN8JhTU9ZLwSgBVndP23LgQ0qvjCLxD3KVDw9r3OYMLdJ3a8QrxKJLV7F2ckp6iTJuQIREoIy
	XF9H4tbKJoepKcC3JQBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcnyA-00000009XX7-0fdP;
	Thu, 25 Jun 2026 17:34:30 +0000
Received: from mail-centralusazon11020072.outbound.protection.outlook.com ([52.101.61.72] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcny1-00000009XOd-3vzU
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 17:34:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ob6sI0HnzhAJsHodDeSTxG7DtUjTeMBazzK95QKY3ps2kkJuuU/FzCQo+3nLNjjMfBqVGLM7e1FoZ+GHeVKiOdhIJsJl2T03fICnD5668eAFjD/lgjCu05xs0uvl1A5/XQKfq1cgrqbDrVUzzINo5CqMcuCicrHOF+h3/xWH1OFLUoYsT9gMsYhtOXrdCDxuN4bjVjmQ+92Q+PB2su5sqqFeCw40Qj6zFfs7G12K+9K0zXR9z4mqkKM6Jqb2UhBNaGeBZ8wt40nHbjg4f4jysKdyZLpzVCEYyyIuV3UO4Yk058QQzUzEFJiWXeV51hmvZEcYC6yCP6YNcRVM/pG+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOSgndMwYnkoUKo8FvWaWq/sJ42rmGwZxQabTvIu6Ss=;
 b=g+4fFS9zZCW+8kPYq4/XFVl5/xCtWh9+8ScaJuLF5I4zcJ3pr+9KkEyVMqc7Lhh8x2CbRafUB0m3O1jjOofqzDauGymgi7tfCUuz3S0vVzCDKV9bqCESuBpvkGXUZfgBG3vQV8nnqBwDoaAf/RfIrYtw3HyDbv7HDbcvjs6Plq4JsoIcgMfT+c7uKyZO1SC72WlWqIzsiGtUEQQFCqymWD37Gf616XXTvFhPGUexDGmGkGni9YGtPiiUVfPmgnsuXUMTksxQhZiOwzkG9fylfGJcBW15m3S/+QwFz+solcClGrISWTtzGcmlxI6EK6GnP9NkPgTzCV8iTRrGpJklJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.86.86.210) smtp.rcpttodomain=cryptography.com smtp.mailfrom=rambus.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=rambus.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rambus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOSgndMwYnkoUKo8FvWaWq/sJ42rmGwZxQabTvIu6Ss=;
 b=rWgIro3UtCnJ1V0GWmQ6ywMzrEsVnecSQIelzWmUuIS1X2w5HYvbhWVWaCNtGtOwb9SjBLrA+QS6XS5ZSpjwvsZiVGoAPNwzdbWN3Lr1s0WyxQQnYZ+/mUFwV0FkRJ+z3uOk2rhvC1EV0qVCy9gd4TtcFP0PbWtkRxGTEFLmlbZ31FWXGHKjJxGVEHDDt5sZ1VouPa+NijH8ju1jFR8aah4mYr+R71cTIcVk2HsPrBmy+HIUdAfkXX9nMLtdmSUwqFXMn8Po5UUev/Xj6NukkcVciNvo3yfXDdNYwkvy8QoPlt/Gapvlc0B4OpU15hiB8STgjxFr6lw5EbDEGtBUKQ==
Received: from CH2PR17CA0016.namprd17.prod.outlook.com (2603:10b6:610:53::26)
 by BY5PR04MB6374.namprd04.prod.outlook.com (2603:10b6:a03:1e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 17:34:08 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::f) by CH2PR17CA0016.outlook.office365.com
 (2603:10b6:610:53::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 17:34:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.86.86.210)
 smtp.mailfrom=rambus.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=rambus.com;
Received-SPF: Pass (protection.outlook.com: domain of rambus.com designates
 192.86.86.210 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.86.86.210; helo=hqxsv-psmtppxy02.rambus.com; pr=C
Received: from hqxsv-psmtppxy02.rambus.com (192.86.86.210) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Thu, 25 Jun 2026 17:34:06 +0000
Received: from hqxsv-cmdev3-skrishnamoorthy.rambus.com (hqn-lb-int-float.rambus.com [10.12.20.20])
	by hqxsv-psmtppxy02.rambus.com (Postfix) with ESMTPS id A148F180174E;
	Thu, 25 Jun 2026 17:34:05 +0000 (UTC)
From: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
To: Albert Ou <aou@eecs.berkeley.edu>,
	Alex Ousherovitch <aousherovitch@rambus.com>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	Joel Wittenauer <Joel.Wittenauer@cryptography.com>,
	linux-api@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	sipsupport@rambus.com,
	Thi Nguyen <thin@rambus.com>
Subject: [PATCH 01/19] dt-bindings: crypto: add Rambus CryptoManager Hub
Date: Thu, 25 Jun 2026 10:33:09 -0700
Message-ID: <20260625173328.1140487-2-skrishnamoorthy@rambus.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260625173328.1140487-1-skrishnamoorthy@rambus.com>
References: <20260625173328.1140487-1-skrishnamoorthy@rambus.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|BY5PR04MB6374:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d57fc6-aa75-436e-c250-08ded2dff509
X-LD-Processed: bd0ba799-c2b9-413c-9c56-5d1731c4827c,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|23010399003|1800799024|921020|13003099007|22082099003|18002099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: mHmDWm+S2UJ0bXB7yMcWK7Qb60RGeFg6xIr/v4+d9V9/PxlXHnhoVaSWegoNv3gC9oDJbDA2wSW6Gwt69szsTsQ+mLWbsYBhihi10pTk2tGhPBGhvSv4D3wPOzQpaT6OLbQ85pvosE6igCjYIUnaOlh8los/85TttcYDGosK/YZ7hKloPPVSgjAU+N3CARtfoGxemqHuKmuwkpsxfC5/DdE9QC92aMxYRO/iYA7yxkx3UWsue/haFJqWbuc9ewpd/BN2dTJs32i7eAfIpQgMod//uXQk1rCSwRUMRAyd/2zEDAlkqxYVjYXhQb4nWaUDawS2MCAw4he920r0HalXjpSgEd7hFSHJ/ftfxje5Ns05J+XJiEsx0nrHh7p6BzkSPbq+x/m+l4/ajehfBHSf37zs1H7N7S9JGU8YJq8M/MDj9TWhQGLGH3Aai64JfVZKP69ZXcWXGXoQc/mxkaMq9hdPT6U031We9GcQVpKff3rCxEoGqv/W2WjN4ed4WlJFYG0G7zvmKb1TdzI+VxLEpuRwZ+rib/FJilVD19DXQJRhFovYtXjELZdFFFr0w4LGjYzf/WJx3JT3YC5/XB9ZXD4o7W1LjllLY4o9Hz8CqCMRUejhIDpadLgvCvAUUEtMGu8wxjdZDnhWABbUW3uO+K6xptaILKV7s2uV9fESyOup/UGhQ6YJz4yegkifaOT5
X-Forefront-Antispam-Report: CIP:192.86.86.210;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hqxsv-psmtppxy02.rambus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(23010399003)(1800799024)(921020)(13003099007)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3VhfnZodbXWgGPOxWB76BjV62sd+dpLqbPyFEU0QhWnbPpoecwo9qE/mfCUgzYN0key60IF1yZR89bJS5d8OaWXlqNqgmx5oh06nR58B+5y2e4SW5E9Y7oSOHNx/bvnOxO9QMcHiSqpuY8IUVtT0Ij8OPYQdopwAHxAxSehzGFf/QHnasCizdLp1HkdkS5n73uf0x7wv7+hXCNCZ3CsrRMpVP0shwTgUzbR0LSUgzhGpMmxaMQjWUEbPU5RgJoCOwgP8GuC9JmAJmJuNEPZgAYHshNiOCQa+SId6ByccgDUJHw+tuEZ1x/6XRavdcZn5xEhg9vvZ4pyan04u1k0DMO+gMdFMGwZi1d0JXgHnF7aAodiRjg6Xr6uZ/U+OvPKvZDkcgxLyrvU+IjiFTM1I0eNMwze/boJhOGkQQcbYSp8bquurx1bu/l3Ga8i9/vd6
X-OriginatorOrg: rambus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 17:34:06.2385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d57fc6-aa75-436e-c250-08ded2dff509
X-MS-Exchange-CrossTenant-Id: bd0ba799-c2b9-413c-9c56-5d1731c4827c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bd0ba799-c2b9-413c-9c56-5d1731c4827c;Ip=[192.86.86.210];Helo=[hqxsv-psmtppxy02.rambus.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6374
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_103422_249785_99AEEF46 
X-CRM114-Status: GOOD (  17.47  )
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

From: Alex Ousherovitch <aousherovitch@rambus.com>

Add device tree binding schema for the CRI CryptoManager Hub (CMH)
hardware crypto accelerator.  The binding covers the parent SoC-level
node with register region, interrupt, DMA properties, and per-core
child nodes identified by compatible string and unit address.

Register the 'cri' vendor prefix for Cryptography Research, Inc.

Co-developed-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
Signed-off-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
Signed-off-by: Alex Ousherovitch <aousherovitch@rambus.com>
Reviewed-by: Joel Wittenauer <Joel.Wittenauer@cryptography.com>
Reviewed-by: Thi Nguyen <thin@rambus.com>
---
 .../devicetree/bindings/crypto/cri,cmh.yaml   | 222 ++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 2 files changed, 224 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/cri,cmh.yaml

diff --git a/Documentation/devicetree/bindings/crypto/cri,cmh.yaml b/Documentation/devicetree/bindings/crypto/cri,cmh.yaml
new file mode 100644
index 000000000000..db41132e0591
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/cri,cmh.yaml
@@ -0,0 +1,222 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/cri,cmh.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CRI CryptoManager Hub (CMH) Hardware Crypto Accelerator
+
+maintainers:
+  - Alex Ousherovitch <aousherovitch@rambus.com>
+  - Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
+  - Joel Wittenauer <Joel.Wittenauer@cryptography.com>
+
+description: |
+  The CRI CryptoManager Hub (CMH) is a hardware cryptographic accelerator accessed
+  via a mailbox-based VCQ (Virtual Command Queue) interface.  The host
+  writes VCQ command sequences into per-mailbox DMA queue buffers and
+  rings a doorbell; the CMH eSW processes them and signals completion
+  via interrupt.
+
+  Supported algorithm families: SHA-2, SHA-3, SM3, AES, SM4,
+  ChaCha20-Poly1305, RSA, ECDSA, EdDSA, ECDH, SM2, ML-KEM, ML-DSA,
+  SLH-DSA, LMS, XMSS, DRBG.
+
+properties:
+  compatible:
+    const: cri,cmh
+
+  reg:
+    maxItems: 1
+    description:
+      SIC (System Interface Controller) MMIO region.  Mailbox instance
+      registers are at offsets N * 0x1000 within this region.
+
+  interrupts:
+    minItems: 1
+    maxItems: 64
+    description:
+      Per-mailbox completion/error interrupts from the CryptoManager Hub,
+      matching the real CMH ch_sys_interrupt_mbx[N-1:0] topology.
+      Entry i corresponds to MBX instance i.  The driver maps each
+      configured mailbox (cri,mbx-instances) to its DT interrupt
+      index and registers a separate threaded IRQ handler per MBX.
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 64
+    items:
+      pattern: '^mbx[0-9]+$'
+    description:
+      Names for each mailbox interrupt, matching the interrupts array.
+      Format is "mbxN" where N is the mailbox instance index.
+
+  cri,mbx-instances:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 64
+    description:
+      Array of 0-based mailbox instance indices to configure.
+      Each index N maps to register offset N * 0x1000 within the
+      SIC region.  If absent, defaults to instances 0 and 1.
+
+  cri,mbx-slots-log2:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 64
+    description:
+      Per-mailbox slot count as log2.  Valid range 1..15.
+      Array length must match cri,mbx-instances.
+      Default is 5 (32 slots).
+
+  cri,mbx-strides-log2:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 64
+    description:
+      Per-mailbox stride (bytes per slot) as log2.  Valid range 7..10.
+      Array length must match cri,mbx-instances.
+      Default is 7 (128 bytes per slot).
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^(hc|aes|sm4|sm3|hcq|qse|pke|drbg|ccp)@[0-9a-f]+$":
+    type: object
+    description:
+      Per-core-type child nodes.  Each child represents one crypto core
+      instance available in the hardware.  The driver enumerates these at
+      probe to discover which algorithm families are present.
+
+    properties:
+      reg:
+        maxItems: 1
+        description:
+          Hardware core ID for this core type (e.g. 0x02 for HC, 0x03 for AES).
+          Must match the CORE_ID_* values defined by the CMH hardware.
+
+      cri,mbx:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Pin this core instance to a specific mailbox instance index.
+          Multiple child nodes of the same core type may each specify a
+          different cri,mbx value to spread instances across mailboxes.
+          When absent, the driver auto-assigns a mailbox via round-robin
+          across the instances listed in cri,mbx-instances.
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        crypto@a4800000 {
+            compatible = "cri,cmh";
+            reg = <0x0 0xa4800000 0x0 0x41000>;
+            interrupts = <1 2>;
+            interrupt-names = "mbx0", "mbx1";
+            cri,mbx-instances = <0 1>;
+            cri,mbx-slots-log2 = <5 5>;
+            cri,mbx-strides-log2 = <7 7>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            hc@2 {
+                reg = <0x02>;
+            };
+
+            aes@3 {
+                reg = <0x03>;
+            };
+
+            sm4@4 {
+                reg = <0x04>;
+            };
+
+            sm3@5 {
+                reg = <0x05>;
+            };
+
+            hcq@8 {
+                reg = <0x08>;
+            };
+
+            qse@9 {
+                reg = <0x09>;
+            };
+
+            pke@a {
+                reg = <0x0a>;
+                cri,mbx = <1>;
+            };
+
+            drbg@f {
+                reg = <0x0f>;
+            };
+
+            ccp@18 {
+                reg = <0x18>;
+            };
+        };
+    };
+
+  - |
+    /* Multi-instance: two AES cores on separate MBXes (future eSW support) */
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        crypto@a4800000 {
+            compatible = "cri,cmh";
+            reg = <0x0 0xa4800000 0x0 0x41000>;
+            interrupts = <1 2>;
+            interrupt-names = "mbx0", "mbx1";
+            cri,mbx-instances = <0 1>;
+            cri,mbx-slots-log2 = <5 5>;
+            cri,mbx-strides-log2 = <7 7>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            hc@2 {
+                reg = <0x02>;
+            };
+
+            aes@3 {
+                reg = <0x03>;
+                cri,mbx = <0>;
+            };
+
+            /* Second AES instance at core ID 0x06, pinned to MBX 1 */
+            aes@6 {
+                reg = <0x06>;
+                cri,mbx = <1>;
+            };
+
+            pke@a {
+                reg = <0x0a>;
+                cri,mbx = <1>;
+            };
+
+            drbg@f {
+                reg = <0x0f>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..3402adba3e49 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -375,6 +375,8 @@ patternProperties:
     description: Crane Connectivity Solutions
   "^creative,.*":
     description: Creative Technology Ltd
+  "^cri,.*":
+    description: Cryptography Research, Inc.
   "^crystalfontz,.*":
     description: Crystalfontz America, Inc.
   "^csky,.*":
--
2.43.7


** This message and any attachments are for the sole use of the intended recipient(s). It may contain information that is confidential and privileged. If you are not the intended recipient of this message, you are prohibited from printing, copying, forwarding or saving it. Please delete the message and attachments and notify the sender immediately. **

Rambus Inc.<http://www.rambus.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
