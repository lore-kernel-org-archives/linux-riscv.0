Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61E3CC6B27
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 07:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vBzWrwoCfkt9DcaVaMzjaAaPhGsWXqxbIMaruBkVh7I=; b=Z6XFynKpigJ2be
	7HUHCxI77OyHoxFgDusOTRxchrGJCHDF2rvy864CMv9qeh42j+2FlbwFkvVuTH1bmG9STSnYqZhSL
	3mC4cysrhMuR4dVXyAEmk0LGzAM+ieBCUvbQFhv1LaQVKKKUHlJbqXwwnqS6SfiCpWpkQvAOaK7NQ
	JrlD84Xjh6zjBaXfu0SYNbYij/asSMFbU3/73f/VmJgelDWgBkMBAVVAlmbAIOmPw90fw7Ddbu3a5
	vytFwlhVAr3Y/9W4Jyo647nlHN9oVbTdmz0v1Ihf+7tBkIB6FsC175Vrgy0Qz0UfXS2EDA5kWzdcC
	w4feUwVZj+6uXqAoYJTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtgV-0000000EnJA-1NNb;
	Wed, 14 Oct 2026 07:45:59 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtgS-0000000EnIP-34Ke
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 07:45:58 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-890d52c7c7bso3119588b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 00:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791963956; x=1792568756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/Mwahr2z9hW7MyIWREn6uWQ3XJrmLHNA2tUduWF5gQ=;
        b=lu2WoDWlbPMqvnCaLimBFantuzlrSW4Z654O3qiZzS4vzwh52d27WFTYvEoGbAW7q2
         +nbvotzfLC2wouregrYbmZjB7U7yodM4WGjDyKQbmEAxIthJ7I7CavgX8ivHeAY9V2yT
         bgnhjvCmdvy4e9EDJkS3oVm4hyQOctBmz/QDWLxeGpeRvpQJSRUZVVeVMmWHMiBsLoNT
         KSE/hF7/9bYtq8gXx4r5E/4vjunZgv4ceiTaYH9VA9ZXC25si+siIAeSgYttp3gY9VqD
         h9F3JH9HWCr92ewka8h5TpfyfkTJWnuWsAbc0dhWonqEhvYRH70cU9t/Nb8LSf2vfFT9
         Td/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963956; x=1792568756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p/Mwahr2z9hW7MyIWREn6uWQ3XJrmLHNA2tUduWF5gQ=;
        b=Bw0knp/qMrXLfkZblVlvGxXNfvSWy9gDXDXdma+B9zF5wN2zgmU8Y1fkVX6lF2ACU5
         KJ2QSZZh6HGMv6B27JxOoLILRtWzLo7hG3Wfw3Jgm3FZg4WYvky2dly5ApuWu8dIasVN
         8FLg57ysbOXneHXMQvyxmLhCC4hF847AF2Kgqmv0V6MKY6eV+SJSYZnOUC3XZ0jK1O27
         EoRrT5ACVYKJnihAoUPj5syPwVBRf1oDmzFoMG7/urY7xy/9t6J1gA78xec5TxsXDNFW
         boEodKGTr4Dd1vXJ2EFWLvPzorbi5a7r+GDfIhHVmddvsXpi+hHHVSflgCOdTmt2JeIM
         HXIw==
X-Forwarded-Encrypted: i=1; AKwUvByBqVe1Qi3bwfBENJ/W3QbuOmqzEZ1v6CsWsAcJS3ZcKFj1wjSJ6/FtlLXYhwrg1+V3UQmSM76oh7UMtg==@lists.infradead.org
X-Gm-Message-State: AFq9FYI3QF+nEg2lvNNlawk+326jdoEZg77OD8VycYw8w46T3F4Qof6d
	CRhHC4x0L2p1tOZw7Ch+2fWKb//iiUG4tWJfAPQgTAb4r29DxPezh+xE
X-Gm-Gg: AYBFou2du5ucB5xm4FQTgzBlkRdLLSVNtMT4TC452ZWy7rZAT3hrIXbQYFg0vZUo80+
	5SQ3n9sAhe3m3I6/9b08ndJtrA8xoRFt4+06Y7qjhaajuijg5RffQhazB2xeO97n1lACnzDvrNi
	uVi2YtZjSMsyrkq6PNiXr/Pr1pwDaYOtFAWlGsk3g9M4AjiJSXRdpND+gaO8q5mrnIZT5U2P844
	Nb3sDOBNWqa6XvnufbCPMw43BLs68l3KXZvinWUu0NQ+Nuz9M4qpUjWYbVDTK3eNIYzegUn1AaG
	UPi6YxQ0jExzd2TohJFVLLisqpN/UoMMFpWxpoFPlW+oPTseGJLuxDEShOkmizpgeZM/BaWMaw6
	aYNPQFI/uOc+GsHaaa9jj+JzVemCl3raz8ovAxJ4QXIDMmePlnAJ00sl6NAdx7S5tll9FoRTyqK
	SxkSWnG86SZTw5IzI5KGNrKMwJ8R/aho2a6tQ7Ds/ceGFF9D7I842UuANY0qo5e/ShFAcj
X-Received: by 2002:a05:6a00:3d4b:b0:89d:e946:8c64 with SMTP id d2e1a72fcca58-89de9468d0cmr338050b3a.57.1791963955830;
        Wed, 14 Oct 2026 00:45:55 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f518b74sm797660b3a.4.2026.10.14.00.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:45:55 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/3] dt-bindings: nvmem: Add SG2044 eFuse controller
Date: Wed, 14 Oct 2026 15:45:13 +0800
Message-ID: <20261014074516.240247-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014074516.240247-1-inochiama@gmail.com>
References: <20261014074516.240247-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_004557_027516_D73639AA 
X-CRM114-Status: GOOD (  11.75  )
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

Sophgo SG2044 uses eFuses used to store factory-programmed data
such as ROM patch, public keys and other factory information.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/nvmem/sophgo,efuse.yaml          | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml b/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
new file mode 100644
index 000000000000..d4bffe2724ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/sophgo,efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SoC eFuse-based NVMEM
+
+description:
+  Sophgo SoCs contain factory-programmed eFuses used to store ROM patch,
+  public key and other factory information.
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    enum:
+      - sophgo,sg2044-efuse
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: Core clock
+      - description: APB clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: apb
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    efuse@40000000 {
+        compatible = "sophgo,sg2044-efuse";
+        reg = <0x40000000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        clocks = <&clk 0>,
+                 <&clk 1>;
+        clock-names = "core", "apb";
+    };
+
+...
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
