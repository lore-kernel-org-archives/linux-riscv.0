Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D31C4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Apr 2024 07:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RIjkSchNruT3WXIFMxC+Dbtjz6RD2vqExNkC87yw2Ng=; b=qKx+8nniqy6Ous
	OQngGlOAQ2R+/wMHwEajCq9R9ypR4H6OH+kINyGY5gXCoTIchXxxk+AeePL8UZIdA1XVPePSv+cpR
	x8XWC23L82Jmtd/3P9l7Xc0e/ijKW8LznSaOPOsYyKLEMvnrtEJa7uhkhd42fC549g5zX9ng1SIbq
	Aknlv2RE4yqdMlpFsuNg3O3KfWwRDY3XoVqvnOxzTquLlo0CFwkU/PGqvmOkReltvf+CKEEbi9KjJ
	F67pfURJZlPQFfDxlnbL1g6ifrF7nzz/MoEkZTLfAMfGyEzr1p2/7m+GeruptzoFTVAk5gIwQhjPX
	ZAKkItxczMDcU1WTOoGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0ctN-0000000F69T-2DSQ;
	Sat, 27 Apr 2024 07:54:41 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0ctK-0000000F675-2Hln
	for linux-riscv@lists.infradead.org;
	Sat, 27 Apr 2024 07:54:40 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1eb66b6953cso1202085ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 27 Apr 2024 00:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714204474; x=1714809274; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzdiJIiSal23hNM9VSVNjie8VPHI8CKcECBGEHkYuNw=;
        b=M6mUrwRMJkIxIP+H3yFKAhHcn8KDAfG57Ae6DQIiEPv058r+vz4t2xG8RSz+ATZwN8
         W1XHllL8vKbLzGbcGyW6YLjXlUaEzI/NZHz7+nvviqUvMll2Zpn2acR0tBTps979CTVT
         kz542AbuU3xhxzU3WNgkVgNxqB1GD1ZpnS0o9MLDN5uxLOSdKJwdXqsqBoPeCLJpsqIb
         WqnZhfA3HjV9b4kIJnbteFoHzL8LbIT8VT8bfbsqNoQmf9qP5c/RoCFn/8x32hUdUvy8
         ezyyXbmBNDTZFIl3qNTraZ+PSt0gOsknvPuBNbYfYkt3NXYkgSw1qFc0Ca/bTHv6l9RY
         2C3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714204474; x=1714809274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzdiJIiSal23hNM9VSVNjie8VPHI8CKcECBGEHkYuNw=;
        b=RmUUwsMBSCCDoBUG8YPnajQSNnQ6DRCCMztjontbqYsE0r1PF3kYE8jtKsHOR2sEXV
         DTI6I9x7ZU4b0KZLAOi3VbWU4gu8UFIWB3Tz0aIMJxbO8DUpv45s2pf5THrhyjirtmAE
         6K+Tky5rpyAT9uQbD2U8OGy2ijarVB3Tvm0c9AHGHPQdrzCTW/fKVPD33g03QyrsLfyh
         p71D4zmOZhXMrLwUS80c66xzGj/4iUmyny5VbkXbrP+lG8atee31Z6jXHd9eAK5Jqa6y
         yWEuZ1TS3ab8FZHAvlHpSzz6GpQuArQ5OZuVP5ehrhtO7MjxpHs634NpToAKXXgQQMs0
         HBzg==
X-Forwarded-Encrypted: i=1; AJvYcCVURJmSZI8trO4N78Ceihhz5wG/7c9QPp1PP9Vw2Qk+dxo9ZFCpjc9HQ+pdeelnMRhbFu0/q+4+UBUlsac0FHY/BFIJS3vwiJrYrGqTMGfO
X-Gm-Message-State: AOJu0YzABRApmtz3Erg4IjLWQethzmu5u2IoIdFwfFoI2iHJeoePi5G6
	nkfIVwwuGTIPkzPGHh3R0wxpLshIeg+L4RlcKbimH8s+iQISQQUp
X-Google-Smtp-Source: AGHT+IEyqjcg0xf4O9f1j/+f7E+JPMyHXCWdgAqqIjfIROMh98X5xxCFrGvuOUcw3+Xnj7X0FWBBHQ==
X-Received: by 2002:a17:903:2342:b0:1eb:4c98:8b15 with SMTP id c2-20020a170903234200b001eb4c988b15mr1753750plh.61.1714204474253;
        Sat, 27 Apr 2024 00:54:34 -0700 (PDT)
Received: from localhost ([46.3.240.103])
        by smtp.gmail.com with ESMTPSA id j12-20020a170903024c00b001db66f3748fsm16595189plh.182.2024.04.27.00.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 00:54:34 -0700 (PDT)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: dlan@gentoo.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: mtd: add sophgo spi-nor-controller
Date: Sat, 27 Apr 2024 15:54:25 +0800
Message-Id: <20240427075426.662671-2-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240427075426.662671-1-qiujingbao.dlmu@gmail.com>
References: <20240427075426.662671-1-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_005438_663349_5B8B1E16 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

Add YAML bindings for cv1800 spi nor controller.

Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
---
 .../bindings/spi/sophgo,spi-cv1800-nor.yaml   | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/sophgo,spi-cv1800-nor.yaml

diff --git a/Documentation/devicetree/bindings/spi/sophgo,spi-cv1800-nor.yaml b/Documentation/devicetree/bindings/spi/sophgo,spi-cv1800-nor.yaml
new file mode 100644
index 000000000000..121a80fbf2d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/sophgo,spi-cv1800-nor.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/sophgo,spi-cv1800-nor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SPI controller for Sophgo RISC-V SoCs
+
+maintainers:
+  - Jingbao Qiu <qiujingbao.dlmu@gmail.com>
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-nor
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi@10000000 {
+      compatible = "sophgo,cv1800b-nor";
+      reg = <0x10000000 0x10000000>;
+    };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
