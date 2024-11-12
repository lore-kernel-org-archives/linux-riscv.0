Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA75D41D46
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 03:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TFaWUIPxYqps9gdp5INgj216L/6+RpZL4CAYqN6bfKo=; b=WmyiXWuo7FErjS
	EkzNoRRs5A5Md/whVCWqmX5XztQ2Du4FEEgFvZL5UeV4tbJBPe38CQ8Q9WlDXJbY0MzgZ1AizzMMm
	ZiXTG1BZzUOr8N65a/bLhu7yD/MA+qy4IQ/9AVG74nOvdYEGqE+mI26y2V12HEkRkhburDxsAGZf7
	EEf+M4IDRLhL71qWVeRCWOE2KllY+dQ8k0KUAnNrHtqACRhb96lGli+vjKLffOmn6Wa5JlH6ni9jG
	HNrRgIKRnqgotQdcrGI2Vcg5v5pCCjEwOwQraBcd9WilOKHkvH6iDnXhyAB2aSvk4YMh8Luk/KeCX
	O2u+8K7pjjvrEwQR4YVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAhHH-000000022Hx-1Yn4;
	Tue, 12 Nov 2024 03:09:15 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAhHE-000000022HB-1beN
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 03:09:13 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-71e625b00bcso4188324b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Nov 2024 19:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731380951; x=1731985751; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=teIMfE7F8k76UXttPluaXL0JVOEyX6VLC8jFeSsriJQ=;
        b=L1fBocDn88yEgrRUJK86Sd2W+C++OmaTD/kCPSgukXTSKSYqya0V3zR9MUwGIE4TqV
         iIJJtGaVpXgR/tEabPgNliFhEPN/2MnUWCDNbZnsckvn3nlNT+vNVuc9rdXNkKDH2QEz
         KPGTFOY9XXM9Cr3F03FaD1V2OZ7DMlKqtxBFd5mVZlAwNYPRehMb1A/BYLT6iCkriUXX
         yLQQPzNazTlgeXNqGIoOgAAGYmxaNRXo1c95jaHr3eXutZzkGCYPPZkA/+Xdz9YFBLSO
         Mj/8BGBtrPm/Jl3ciJiZ3tEGpFVwXJ2heXCMocbVQfJPtS+yDP6Yd5h73909OH5Jbjka
         /9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731380951; x=1731985751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teIMfE7F8k76UXttPluaXL0JVOEyX6VLC8jFeSsriJQ=;
        b=qvzluQtaBGsFUhJnyQznAExzydeCsb1P1i2JAeoYhNXeVs91XT2BnsvszRS6bC9wms
         pfSD3X7mXzlmuOS0DEvHy68Q/7vbJKwe9COlQ9j7luXkbWYmh9AOUCXeuxpRDYZHM1YM
         UghX6AN+2HFr0nUmOSiZRqo9wZrhZqJCvX2WeOvQbyZtW3wOU7iKCiaQxeJAqaB9FJsT
         ZHybPG5sywP25ZUdP+KCGg+HT73qFAxY8hmmsaZsxUj8o4Aw8tFjBNoXVnC0v9HHtgGO
         aUC73wnbnp2qauQidR4v8FkkBVRT65fmRTof2+LfUQ3vc1rGMeTadObgp+tn9/SWLrmQ
         VwtA==
X-Gm-Message-State: AOJu0Yz222DvscoUM+6D42UuO4mR/JX9BSR1Dk/EQYH/A2RZp3oYTXRE
	VwCPyHUJeMwaDdrrY8tYgW2CM+pExtCErIjfmiFMbjm+7d/l87m0ZxgaIpxMmHWlAg==
X-Google-Smtp-Source: AGHT+IGh437lETvXJiDMcfleA8zJ1r+cu0YN+Jk1elR9u+DnqP5mY42588SgR1t41x9A6cwmCmh9KQ==
X-Received: by 2002:a05:6a00:234b:b0:71e:4fe4:354d with SMTP id d2e1a72fcca58-724133510cbmr21071538b3a.18.1731380951155;
        Mon, 11 Nov 2024 19:09:11 -0800 (PST)
Received: from [127.0.1.1] ([120.211.145.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724079a3a9csm9873447b3a.110.2024.11.11.19.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 19:09:10 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <TroyMitchell988@gmail.com>
Date: Tue, 12 Nov 2024 11:07:39 +0800
Subject: [PATCH v3 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
MIME-Version: 1.0
Message-Id: <20241112-k1-i2c-master-v3-1-5005b70dc208@gmail.com>
References: <20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com>
In-Reply-To: <20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731380939; l=1669;
 i=TroyMitchell988@gmail.com; h=from:subject:message-id;
 bh=0TSA8J0dv++gwSGf4gyY25LsOYWNi3V+nwVFt1LG5fk=;
 b=YzEU1We52rRN2kGTzJ1lmFndHmt8GOvgFfdwPQsiMnpgmLvsomIH8q/ofhcLMZjk2GuTB1je/
 QTmH2swAHfIC335BmJe/w8l0mp+JiGBsEsv4igsDJzLk4I8bevzN56C
X-Developer-Key: i=TroyMitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_190912_465319_A46CB56E 
X-CRM114-Status: GOOD (  10.62  )
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

From: Troy Mitchell <troymitchell988@gmail.com>

The I2C of K1 supports fast-speed-mode and high-speed-mode,
and supports FIFO transmission.

Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
---
 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
new file mode 100644
index 000000000000..e8cce360bf03
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2C controller embedded in SpacemiT's K1 SoC
+
+maintainers:
+  - Troy Mitchell <troymitchell988@gmail.com>
+
+properties:
+  compatible:
+    const: spacemit,k1-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    description:
+      Desired I2C bus clock frequency in Hz.
+      K1 supports standard, fast, high-speed modes, from 1 to 3300000.
+    default: 100000
+    minimum: 1
+    maximum: 3300000
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@d4010800 {
+        compatible = "spacemit,k1-i2c";
+        reg = <0xd4010800 0x38>;
+        interrupt-parent = <&plic>;
+        interrupts = <36>;
+        clocks = <&ccu 90>;
+        clock-frequency = <100000>;
+    };
+
+...

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
