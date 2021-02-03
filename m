Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73110C433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 12:59:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 267BC64D9D
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 12:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 267BC64D9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LE6QDv1qwjPONJmESKVBNuhzESoie/tTRGKGm4iwOmo=; b=NdCJ0IJ9N/rHzjjfz87Xz0vqF
	+O6lSfZKz+rLsrn9UOi6Pyhl7CKuZ47vYKo0T70Uxmw2tapAxUfOFIsb9sNpC0Rz340cShymOHgXe
	21yIOK3gZ167eeCctl4bV4dZ9i03O0LIgBir8JTqJXXRbsMAI4JelX2+nynM4e/CfJUQdGldpU8vk
	jx2o2yyZUcZnIOybBAnrai/9RJDqrfQO/tDibK0D2vYgGgAnZelk1Ms1TAEsinLI1K7XkgHUFEfHL
	aWVY+MM2LRuKDdaxcrLjT/RhdSQPnfnZQHeoq/okIjCvZ8PGdnexQS0dSt4KD+cs1xdJtl7hqCJBi
	T6lMvUyNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Hl7-0005pq-Hs; Wed, 03 Feb 2021 12:59:49 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Hl3-0005nO-Bt
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 12:59:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612357186; x=1643893186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HuL/RXPfYhx4XwPsZJpcViVF/tXPYXsIbvZ4bFefu0E=;
 b=HOaFQ8kzfGXV+aiyYfKlNy1CzPwRK+iz9VL1leFjmsvInFZHKXeGd3tf
 YAkUawaejD7MRxtkeD3rwsdyvVq+DAUk/d1RlPFaOOse1qRTDkhJyI2+R
 AU6Z9dIpneQy7mujadqpj0TCTgwhroLmnz6voytfwMDq9eZ2GBOhvSWYL
 vu9i6OjtSBVNbPkvvcNnW2UrAxRFIdvykY0S+Jgse2hzGKVbl1x8cZI1y
 Si55tBqyXL6Nawh/bCfK6mbmStqjJceQtw2WfN99IbDsdMVTygaTFqdNc
 1DWJiYSgCn1++4mtcBQkjde9KHJ9HAEhYB+11vVfwYTrr2BtEq96fvE08 w==;
IronPort-SDR: 6LZ+ghwIis1wdVdI/uPKw3npw4n+reAtvP/tTwQZ7lcLu18ZscKCbzl16VQ9IqgAeg2XltSzcM
 z59pHI75unSR9dsKWphb/heoJ6wFfHfpSyZV/p0QokkOKPOuepbFjRyBjpbHnkFonsqOpS2vB8
 o0JiXQhkJHfodKRKyt2SybH727npfcvZjX19D+49t5UsH5FOV/uIyY94qifjSifxHfYLxyY1V1
 AXMIRTC0cTb+Z/emZ5t5FNvPlMqLJ8F/pEhrQF7wMLwfU7zL9qLzHZeWwpZBbjwq8vSMh9CBtg
 LDs=
X-IronPort-AV: E=Sophos;i="5.79,398,1602518400"; d="scan'208";a="160202869"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Feb 2021 20:59:43 +0800
IronPort-SDR: etAhejpb/L5z53Ev7BvfaTIviKRgTaD2VgbnJUMEG2OAxBCnv0HzIXAUJCSa6zPaMsZq58GzwG
 70ZFiT3fuYFEeo4XHQmtZ5s1om+M4cES9b5S9bsCwtpJUlswUoO2AWqmt6b3fLmghcuvZx0dgM
 m2ABq9mw1Uo3aGCUltLMKeSGlGzXpsZOlI7h8y0A70yHL/JHCFeDgC5GtlQjW6YeNDsiPMvd6D
 pzrUIjfA4eyxk3fgXDzzETNFCkIFv0FKnskOf5nNrOwuuRButfmpzBU0wXEeoK/2X3sedvHJwG
 8POcpZI+xH/tedu+twCj/Sg/
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 04:43:43 -0800
IronPort-SDR: IGikk8QHZypD1jGsJsdb+5pPWh+/5WToE7Jk6xfhjobvY7bXiFuHpAKHMNcB8kupXC55/qInsW
 J8cOwaq2t0YUyjL9T1uPtsKNrNbRobcCY6XR6qzWDSZkhRalM3C+46atK9kdQCxxQXG3ROmGCV
 sLufGIdvq+W3d/r7CSSjcvn3X4+2B5qYv1B55YzbmEsv+ZOcwwHWNDiW6r09IIA9YZvPrJ0MfQ
 cDvx+NRXvdxN/qkBRyrqzNmW8aweg9CBt62jaiBeZ4GrrQOWoHMSNWkGMw9jRirFH+PkOqySNc
 IUA=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Feb 2021 04:59:41 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v15 02/16] dt-bindings: add Canaan boards compatible strings
Date: Wed,  3 Feb 2021 21:58:59 +0900
Message-Id: <20210203125913.390949-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203125913.390949-1-damien.lemoal@wdc.com>
References: <20210203125913.390949-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_075945_668512_F470219F 
X-CRM114-Status: GOOD (  13.26  )
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
