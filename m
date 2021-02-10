Return-Path: <SRS0=bbt8=HM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EABC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 05:02:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0EB164DA5
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 05:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0EB164DA5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TAiGY+Yusu2VXndGzKJnwPBCwOLROgrrXSF/XF0sykQ=; b=ZIXdJ6EtItRIvMX7+lyhhIOv4
	oqWLi5iOmsZz6tR0ZvLxuLs85XIEvpz/4nsNA95l7oUJ2Qag5Jp0SNUyGZU740mRKI0vi9H4rXnNT
	DRB6o8SbLCO8apb87aCLg3ei0jbEUMkpeohT9kaV6ZARkpbe3a9Xf2CivgXZQL4fulIiy1z8tYTYC
	h8gVsJfwxCBB4YlBAfzKBWKP6WnmiirVpV5aY3udyCZ2OYeaPUjI/0eyhh/B6W8D2Iu+DuI8vRGkK
	YMtgA8pyGjcJIuRXi9ZWO/1DMAjVd11yxoocwDR+LZH11nO0ZkuHWrApL4A5uekoFgfLa5QtT9DJ8
	pVzbCx4Hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9heI-0003IB-Uh; Wed, 10 Feb 2021 05:02:46 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9heF-0003GM-Av
 for linux-riscv@lists.infradead.org; Wed, 10 Feb 2021 05:02:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612933363; x=1644469363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U5RPnx9naL44L8pODbHMwPFT+udQFeaq9RcnNssxEXo=;
 b=O7nOCpq1186D8pPxdy3kOsCQ5YTvcI+8BVQv7iEulc/atzemURCuwJm9
 UcAL5dRRNqNOi5NReOMcjacgdRxL9G/qnRT2OCGL6bS6H8Ia/8zKL/C+i
 CabfVa6sBM7GMHqdzmorKXeKP0M5X7FDA/gfpCwREeon1GC6A4u7zssTb
 nA4f8Ke7GeVKE274L3VUMXgMW91YuRi9bKajKmrjCcA5P8KlB5ZldiWZ4
 rh4ZCpirs44JgIayTFKqkQRhis5wNwUm0zk0XGzU/rnx9DnR9DVHxKDKb
 iTgyY3RRSj/DY+zW4WlYaHgtfH2rfnyppt7TM0BMnaPi9AZysUU0bkzq6 g==;
IronPort-SDR: ehvnFzKQ2pDiRJ3oaCsCHJ8G23V2PfkNVwwAkZwDLgwelB3ny/g6qL9Hq8f7hGg5bwKJIfoefO
 nZRO7ADWxfDVUMupc2ygpsWFfWQCquYNSZUCIc0Z5tPEwI58xLMjK8aCDVS7Be8lxFjYTnA844
 pzi2hEJVmAKSOVH2DnC5hsFljxA+B5izKGrl/rQxK8K38JoRAM/7tAXT4QAOMmGX2eDxCEi+Dy
 KEjWfbLYbH4DzoCjuVLbWW6akO6VH7SIUvPiQudwkdxONzGeFgzsgrgpD/jcrkkzTITPxwS7wA
 Z7U=
X-IronPort-AV: E=Sophos;i="5.81,167,1610380800"; d="scan'208";a="159592664"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Feb 2021 13:02:43 +0800
IronPort-SDR: YD98MLfSbNQMDRR/uSO7WTvPltmynrOwnehq4x9zbcnaC0tgDEmEl946S36PxSmHZyjnJSIzvl
 xeUJ6qf8wIKe9wtJgp06EwG+U27lgEQbbmqTcjsZBU9Phtma7QV0sXngKKvGvQBlnsbckpiZli
 lWt1mN6iCfIcECtuZwxsDkPcUEKb8h+tqOUErGI8Z33IkWXgKsswr2IL6wzXo3qwKYcIP4M4S2
 W0ykSauT4VmwNVPQPgYClRKFppAFl/m503dxMVBsr4zoRIAJCEhEQVDCPOu5RrkxbsR/emartN
 oQD62rd/Jmgz7ZoXO6psZv1G
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 20:46:26 -0800
IronPort-SDR: 3rAW0T5oSh2Evimxpvw/oa1Q9wE/nHcWdhmfSlPLQfT4cH96Msjg3wTS/JTP/MUuldA0EXkz1l
 GlVCyJrlyx4PpcRH6WD36QEY0LIu2VBmd6VY272FX1v3iWmvhYrlSBP8DNTS6L48kwSfFpu0Yj
 ayLyk47Fk/q93AozckM4jJjRXhbHATP7q0GuXc565El+phbYy21EZs8d743+W9h0wl/clVt58t
 46/udT3tVFt1OjohFE0BV+KHCfoOLids/IFsOBdvkBduX0OOIu1vyBrc9C3gJaPzM1cPa1jAgs
 w6c=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.72])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Feb 2021 21:02:42 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v19 03/17] dt-bindings: add Canaan boards compatible strings
Date: Wed, 10 Feb 2021 14:02:16 +0900
Message-Id: <20210210050230.131281-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210050230.131281-1-damien.lemoal@wdc.com>
References: <20210210050230.131281-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_000243_529962_A79A4EE2 
X-CRM114-Status: GOOD (  11.98  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Atish Patra <atish.patra@wdc.com>, devicetree@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
 Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Introduce the file riscv/canaan.yaml to document compatible strings
related to the Canaan Kendryte K210 SoC. The compatible string
"canaan,kendryte-k210" used to indicate the use of this SoC to the
early SoC init code is added. This new file also defines the compatible
strings of all supported boards based on this SoC.

Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/riscv/canaan.yaml     | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/canaan.yaml

diff --git a/Documentation/devicetree/bindings/riscv/canaan.yaml b/Documentation/devicetree/bindings/riscv/canaan.yaml
new file mode 100644
index 000000000000..f8f3f286bd55
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/canaan.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/canaan.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan SoC-based boards
+
+maintainers:
+  - Damien Le Moal <damien.lemoal@wdc.com>
+
+description:
+  Canaan Kendryte K210 SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - const: sipeed,maix-bit
+          - const: sipeed,maix-bitm
+          - const: canaan,kendryte-k210
+
+      - items:
+          - const: sipeed,maix-go
+          - const: canaan,kendryte-k210
+
+      - items:
+          - const: sipeed,maix-dock-m1
+          - const: sipeed,maix-dock-m1w
+          - const: canaan,kendryte-k210
+
+      - items:
+          - const: sipeed,maixduino
+          - const: canaan,kendryte-k210
+
+      - items:
+          - const: canaan,kendryte-kd233
+          - const: canaan,kendryte-k210
+
+      - items:
+          - const: canaan,kendryte-k210
+
+additionalProperties: true
+
+...
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
