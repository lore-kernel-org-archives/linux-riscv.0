Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCFCC433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 10:36:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6162E64EDA
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 10:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6162E64EDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uO1ZhrW3kyGlfEoBIZuvsLgq8Wph9021hyjAumaugoQ=; b=OmlySHMSlrUPB/AdP5aezfZjY
	ZfMSj3c8t1IZPMSgfkoQR/WaYA25g+xuWZdw7m+5OY2UBNq5ZiqMoySBUuq7taNg8S7K3M3g1lLpK
	SnKcs3grzlK/Im33o2aScxtmiv3G6Uehv+4M/9I1JJGSFi93uc/0bID4pWbALw5+OpXn2vSzDpGsZ
	zpgsEDN7yUrlIp9lyoH6fUtmHe97N4eN6Kqvz+3+brwGfVXMOD43U1ZcALhyWVNgsOF7SsQvoEO2v
	CRhauYtDI1ijI7rsdaRgtq4VddzXSOsyJZ/hEjZAaKfQReTen5agrmvq/R9Vn/H5Ikb2LW5EgJdBz
	CKLmg0QPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6t32-000886-UI; Tue, 02 Feb 2021 10:36:40 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6t30-00086e-RH
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 10:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612262198; x=1643798198;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OxZeZALk6A0U48gWNj8ztjhQy+hUu803QWSi9piqU7E=;
 b=kTwL4FCRbe+b/Xz7gLC6+DmIIXEU83a8h6KmDR32eB88I65W06keZqkf
 JsZv9VI/HtmB5+O49ybsT+KMZLtjnY+DsjO7v20RntCcGEzMKSwfFwerG
 Y4lItCSdIIaatirEOFCSlU6JUHLiGSsmjcSOHm6H7VMFTu3LT1hiHbi3C
 ItoRYKR+V0c9+ZCU0zwvfPRS0HCJpJNWjmt9cgBMGEVPypq6kZnaeTSHl
 gGn6Q/djXqEUKa/VXaaY3tUv/atkyG7slm21w9IfVQhktLThsqjPxsn7v
 utxjiKTrCij58+Y/eR89q0Tl/8ZCAIjihNemew6Bl36NSgpccFKb7w0OS A==;
IronPort-SDR: T25eY6YQpwjBPdYT6kJwGWRrE23/OLxUkObtGWGujvZJdiXaPewM8ieI9YWUVDRvRXFYXZVxtA
 RD0TVExjzXxqvj6irOD7fwreR3ALDUW1hRSHbveLdtXZaHrRuxeP4Tv5XZw7W4KKq68YgFb4vj
 c9OhFXEy7gCJj2VGMQGHijZcKE4bDweh46xWYYwIPeYtLvzPG47diGd6aBW5Okj32m4fd/FIdf
 8RZx6fEVfAt9ErFA3saZ5/OEo7qr1I7ZD1LTT9K/0ZxgvJ0GMJp+DfCuVgnfVJPz6PI3km6eGs
 NYE=
X-IronPort-AV: E=Sophos;i="5.79,394,1602518400"; d="scan'208";a="163357052"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Feb 2021 18:36:38 +0800
IronPort-SDR: LoOB4AeU9cBkjDf+zMHSR3Gt8G8lWnvHUaoDmYzzKlBeGMt48Ulci6U7uKQKka3+nQgSy/Gm5c
 5k7PhLTIdgjegFLFzN7yfc7vTHIHNSoKrW+Iv58UNTFlcUSjVKu5ljq0pCbKXYeRQCCYThkB/x
 EIrmTb8n5OfsuI6uc74cj9i2QD9WZe17YgoF8wqYaMd6cKss94rlfNFNVGFGvJtRxUwhyxyL3U
 sEKpheOeCCLfQiqBhW0BXQ+Uo62nSnOlusKMoNUI+uQeM5+X/Rr4KaYyB6r+WokfyTXrSJmtOR
 /1VEJI4U/TcKUvruprjaCVUh
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 02:20:47 -0800
IronPort-SDR: +twt1L5tXiUWw7VjY2nh5ICdjFgLQGgZo982MMaU/CZ8pWIXHLgFYlaBH+ncAHEPPEyYicXEno
 fiYoCldAj39t7BD13owyJKTDZdAOpYQv1Dn8vLEDgn6OIBiw3kXmIsKLtp587mpT4/iKm20Hg1
 1JSvlMIJFz7fKZNERXkoIGmVlwTDyFCdqJiQnXS2A5GV8q8GMxoHTGZMnBVA2PfD2+cCMzskmm
 BX03aVBF4KGRoyNFX4uodbNDZi4uwn4yQG6+cBD1v68Fz1Rrnozt8SOBEEFB8ZpaGPczRjMJxH
 3r8=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Feb 2021 02:36:38 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v14 02/16] dt-bindings: add Canaan boards compatible strings
Date: Tue,  2 Feb 2021 19:36:09 +0900
Message-Id: <20210202103623.200809-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202103623.200809-1-damien.lemoal@wdc.com>
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_053639_171983_03E2661C 
X-CRM114-Status: GOOD (  11.82  )
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
