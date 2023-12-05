Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0A0C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 00:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+7rjSsofJUqO8SWh/8FVlvWeLrSrhfqyunPA7Xqbj4=; b=kyNOZPrhSed/ek
	B+wg5rQOUVkU+jgT+yg6ud58WGNYTuwznC8J6FqS9aKwYGB56sSlqZittLi0oTmIIz7ljaW9fEcFT
	5vY+aXpZJDN9Sl9NxrHSgcvG46SOD9DzdBBNyAIDWp8Hm0vRAJ0aEw/sWDS9a0UxByEJXpgaegcgd
	RRVGBVk1lOhTkrj+CpCeqjQM+wYzBfIqRRueK5+2Xo4uegn+G3lj5qKhSu0XqAS1trPhy0r4SaCvo
	Av4ZK7h9OITyypaYWW3NzYF+0D/DvyUujGtrDGqL9UUkFPhxjK2yH6+nrCDRtZbMIVQt/HRiDjYqg
	hm9aaIzvO2/cVGkDknJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAJDG-005rei-15;
	Tue, 05 Dec 2023 00:22:58 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAJDC-005rdu-30
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 00:22:56 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-58e1ddc68b2so2135565eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 16:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701735773; x=1702340573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWzi5VFScWkMe1hfBc2EXsXYdiAbd/+bGr8M1EA3Tok=;
        b=D4yo2U55m0BtF69GkWR5osVWXzt84Dv6i1q3JJ4h8E3Hu2Ia+jvMdwwOIOcqvdkkSm
         y1eGHJgz2kX/ZFMep+T0ePG1LoYX7pt+jV3XiSL2yESK5ToJWPa/58GGG6ur3bgODPbo
         Ah0XNxoBtiTOZ9OEdQIrS90c1L45kUrvZPIm071FM9TB+65QuqKS3IVrze5gIzxk6h1/
         arTOBupyX7hYD/IEyWs2bwwNsF5OpqK7otV9y/3DBztaUZuzy28++7BTa4y2XBQua7pK
         eB8NPgjuvPU0w8MBO6z7fMZnpSErWeyfKA1tO6i1K0c+qyD9L5tPeQKX3V4pqXq2iNbH
         sshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701735773; x=1702340573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWzi5VFScWkMe1hfBc2EXsXYdiAbd/+bGr8M1EA3Tok=;
        b=SAq+MpJy1Sz1+gFm3g68S3WP6m6WsylYltXOiZgmo6UzgEWTv1miv9XP0TbHAUoZYq
         e6ft3v4ZW3gpCEn3fVo5IsXtVZPjbCNESDcJFNyZyLP+dCV00200LSYg6Llpc25m5d2H
         xwaqvDfEdVs41dzcQdSfPAUAmQqekMtSCcbr++taQtgc2ktF/c2A+NzfKEELzrlgvxUz
         JgNrBk+Jvsj1VP8BSurPvZBu/KdjFJm2xWTLNt3ZbFXrIIJ0X5fCpFHWJX4ftEJu8uTH
         +CsS/kdmCGUUlUMqQLBQb7oaStcCqb72/jcBj1uaIE9ZEz3jf4MWp5hRZ7sqFGajUyWb
         5nrQ==
X-Gm-Message-State: AOJu0YwS8RbMt8avHWS9SwF4AwUKCtzh7TWFQ5jatm7XFPd8r0SJiKbH
	CujnKT5Z3HStn4yaDz1WcdI=
X-Google-Smtp-Source: AGHT+IFAs26Fa4uHzufA3+AF+TKHenR8RwzQfBCwtZcjjddNVt1By5baeF7SOpG0rzvv1tQjF8C8Gg==
X-Received: by 2002:a4a:e883:0:b0:58e:1c48:4951 with SMTP id g3-20020a4ae883000000b0058e1c484951mr3761102ooe.11.1701735772698;
        Mon, 04 Dec 2023 16:22:52 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id t67-20020a4a5446000000b0058df9ed9291sm1976915ooa.34.2023.12.04.16.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 16:22:52 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	richardcochran@gmail.com,
	robh+dt@kernel.org,
	sboyd@kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com,
	samuel.holland@sifive.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v4 1/4] dt-bindings: soc: sophgo: Add Sophgo system control module
Date: Tue,  5 Dec 2023 08:22:44 +0800
Message-Id: <d02730f0b2b531ce7f59e6569e83a57f551f72aa.1701734442.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701734442.git.unicorn_wang@outlook.com>
References: <cover.1701734442.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_162254_972241_3B9D3DFA 
X-CRM114-Status: GOOD (  11.69  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add documentation to describe Sophgo System Controller for SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../soc/sophgo/sophgo,sg2042-sysctrl.yaml     | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
new file mode 100644
index 000000000000..e50b25aaaa95
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo,sg2042-sysctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 SoC system controller
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+description:
+  The Sophgo SG2042 SoC system controller provides register information such
+  as offset, mask and shift that can be used by other modules, such as clocks.
+
+properties:
+  compatible:
+    items:
+      - const: sophgo,sg2042-sysctrl
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    system-controller@30010000 {
+        compatible = "sophgo,sg2042-sysctrl";
+        reg = <0x30010000 0x1000>;
+    };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
