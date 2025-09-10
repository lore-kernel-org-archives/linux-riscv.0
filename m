Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D81CAC582
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 02:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bc4dkKMTWLUPElngXhsK0BmePit2AoQPoDJDN5dL7j0=; b=oi0mM+beHuN5F3
	d78oTAkzu6NGWer+/ynYbSiHiExbeJsZ8cBvothIbfEzqAbb1ZWAWpyC52+BVvHt4N2b0B410kFdn
	cIwx362wJoc8cWhF90AioefxeWelt8aEIiL0vgn8I0/NbrWoVoKSVYUveYWLrTyH1iiePY1dBcPvP
	fHY+l+Wpr1EbVC64SMGe28Hmjbft73yhLzHlL/a6gtqbFjgeb2i11zLMm07htfr0dghFjlaMa8Qev
	lzcL82DS1ydt1dhGJL7N0Q55CgQyf9BuJI9nMEpB43MmSsjTc01GrYAe+4QuTiVNrttk56yui/+Vo
	QPSXx4anfmPEZdWWQbVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAFn-0000000Bb6i-2A2d;
	Wed, 10 Sep 2025 02:08:11 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAFk-0000000Bb4W-2OCz
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 02:08:09 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-7240eb21ccaso2072366d6.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 19:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757470087; x=1758074887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XFM07Z5n/PQZ1U15JfmMTCdL390KHJnWHFIuZFK96s=;
        b=QsO8TT4mMU56rbvr1egPimuaz2FlMPOi9jMIQkj3rDzZW3iE7e7wZ8q2aIUWlzIbrG
         5bH7QZkUVNRMTznRg8xc2iOQfvKdcWOE8vLWnNywIJHqvyND2kgr2h6wniRcWyHs1+rc
         FPDQpLRuqYwvJxPyg8LKcyKLqM33qRTCFPD8YRXjKuZdJHvjnT6VciUDv8w1lq7YRPb8
         0xjHSsvFQvMGwk+PP2Fj4Kh0Iv7ONxOvOaxuldpYwI5tFjmRH6gCSHmOh4Zw0hs90AV0
         u9S/DdvpxJkfladuvBxyAOOemazjLGyPNdY+iHcVtLtU7FA7tYK3NVJ8o7zWUdQLAUti
         CplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757470087; x=1758074887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0XFM07Z5n/PQZ1U15JfmMTCdL390KHJnWHFIuZFK96s=;
        b=Os73V2sYJdiEStXD6ojLROL7hT9s0MKP3xVc61wYo+eiTLoEr8yFnAEBZX6Jc5JLUS
         NfN+9XpJpz9kYW1x7lnhkz6minOQzKZwVORR3hG3Ri2KwzSBGw8g3AhmhEePWsSYno+u
         GjrHQc7RV+D3NYECKCdeauO7xB0RMDdzUDwScouIXiemYAnHsJgvFYw9D6ick8JHcp9P
         HRpQMchiNKg/b7h4dbMyCntchAF/xK6e5UbBgz1BXJzVCKOQPeHjJ7v98oPVgA5mqlba
         s06z4lqf13SNVz3RrCkzAUwN2ynjfOhnnFjE3CGNigB3CLOTMOfFQAS90MIMT3F29ixB
         Wk1g==
X-Forwarded-Encrypted: i=1; AJvYcCXVunuaA0tFntnpnpgwO0jB+Y/cGk/nY/dCw/D7YjaHPPBWzvLQ9rsG+diS9f8UVnZgRAjTNEehtveKKw==@lists.infradead.org
X-Gm-Message-State: AOJu0YymfgvN2sGvQTp8njHlyPxPnemKpmL3yslRvh4PKrWoS+1Z79yU
	D09mXvTnVLW8pX3flLY3/5c4xhKYpp6WA2xjU9IT1GO75+sucwLkHfMr
X-Gm-Gg: ASbGnct0z43k7Cor0etZ413Z3C4ZbnlVGvyigizCpzm0D0X2cUL4r1ZmYkQnBFOOqWs
	LlhuYWwhVOEs7pOaGB+5Y8/K5NgJIGjQmsW1eHKUCT9oFIAp9MhFWwT97AobEoiRVpIgscuYyd+
	lUGef5ZQbsCVD/0vCFt/q97mjDI4vNcbEqeyKY+EEzKQYolBvIkO7pzhbQ3H+FPJdz7yA84aUco
	9A6lG1B22MgkFDoMWwUPd8PPVP8bygx/8zB1myuJfTmzxp5GL0VClj1zkkHW/FoPkIckqJy0qgd
	jxL0YMjHGgZaZ8cB/hJkITGnOTNkhyWiIxzmd3nk20tMFw4DnUxBHK+zEBEGYssV/U0/IGLy88H
	hE7QU608VgVQCJGS1GsjD/fIBBfJYl3M16WSRUacaJFvfS+8YGYGzjQ==
X-Google-Smtp-Source: AGHT+IGNC8sHtACh6gI+vt2l2BTS2R0uh7vi8B+8jgdFE32SPqkIaSaf1sgwm1dD4KthnaDiWgRQyw==
X-Received: by 2002:a0c:f096:0:20b0:71f:b221:9aa9 with SMTP id 6a1803df08f44-73a3dbf58a3mr135461976d6.29.1757470087200;
        Tue, 09 Sep 2025 19:08:07 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-728d6f8b338sm119377366d6.0.2025.09.09.19.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:08:06 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: kwilczynski@kernel.org,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	arnd@arndb.de,
	bwawrzyn@cisco.com,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	18255117159@163.com,
	inochiama@gmail.com,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	tglx@linutronix.de,
	thomas.richard@bootlin.com,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	rabenda.cn@gmail.com,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH v2 1/7] dt-bindings: pci: Add Sophgo SG2042 PCIe host
Date: Wed, 10 Sep 2025 10:07:57 +0800
Message-Id: <2755f145755b6096247c26852b63671a6fea4dbf.1757467895.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757467895.git.unicorn_wang@outlook.com>
References: <cover.1757467895.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_190808_621404_8265435F 
X-CRM114-Status: GOOD (  12.06  )
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

Add binding for Sophgo SG2042 PCIe host controller.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../bindings/pci/sophgo,sg2042-pcie-host.yaml | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
new file mode 100644
index 000000000000..f8b7ca57fff1
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/sophgo,sg2042-pcie-host.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 PCIe Host (Cadence PCIe Wrapper)
+
+description:
+  Sophgo SG2042 PCIe host controller is based on the Cadence PCIe core.
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+properties:
+  compatible:
+    const: sophgo,sg2042-pcie-host
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: reg
+      - const: cfg
+
+  vendor-id:
+    const: 0x1f1c
+
+  device-id:
+    const: 0x2042
+
+  msi-parent: true
+
+allOf:
+  - $ref: cdns-pcie-host.yaml#
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pcie@62000000 {
+      compatible = "sophgo,sg2042-pcie-host";
+      device_type = "pci";
+      reg = <0x62000000  0x00800000>,
+            <0x48000000  0x00001000>;
+      reg-names = "reg", "cfg";
+      #address-cells = <3>;
+      #size-cells = <2>;
+      ranges = <0x81000000 0 0x00000000 0xde000000 0 0x00010000>,
+               <0x82000000 0 0xd0400000 0xd0400000 0 0x0d000000>;
+      bus-range = <0x00 0xff>;
+      vendor-id = <0x1f1c>;
+      device-id = <0x2042>;
+      cdns,no-bar-match-nbits = <48>;
+      msi-parent = <&msi>;
+    };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
