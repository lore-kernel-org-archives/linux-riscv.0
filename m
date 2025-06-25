Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E78BC7EE31
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 20:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgrvdaoAMXnpD1GyPsd7WoI04eBZMFWVOkP+kB0t8YA=; b=5CLEYps6ijnQwM
	bnGkpVzgKJLYvL0VOkknwZkeLxltkHz65C5pYolN8WBiyzS1zfpx54TtIhYj0ckyDcwnYM9cN8VLP
	rno53+7ydGN980Ov+KNkM3IpHpBLYr8gUOE/JepiAXkOv0J2Yr/TPIw1AKExC72oVLxqcDnIJ1uJ4
	qlIFt1kjqRr7w/f6vFar3QU08vZXkERdKY+ENiqNMum15aOvfZqYJorhiYjOo1HLYy030CEy33CQi
	Fab7WJOtMZrxR5FfJKRqdMGpJv3/pff4WKQcfWUemKdyKFPC2ysN6lvH2dkwONtCuXQndnMtOAgjE
	s+DZ4uhWVwinaJGYTnog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWpV-00000009qxA-2TXG;
	Wed, 25 Jun 2025 20:34:49 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUTBe-00000009Kth-0xEH
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 16:41:27 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6face367320so1306286d6.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 09:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750869685; x=1751474485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onUZmipuuggYzLIHkuYvhE+eJtHfnxxJxJfL7IX4aE0=;
        b=BJqJhOfwjwoUa5xxvbUPB5C98IIoEdabK+6qd40MeLrr0IodGsCckKLyAesI6iVY+z
         fuChbjqDhoYh8CKzkWmbdVegim/kGAtBb9OwDbZSen6ZQDWZCQr/TUpUIz5uVW6xejIQ
         cpBo6KR1YxNvUgE1b1WvCteS9OklgJvnljIDvrQhx3SoPFhZBi/myWoSLRv4C5mbjocb
         qwplWvdhmenlrMRhZL6JmP+ptE8NRCWykXPjHO7z1TD18dtRFE5LoJf7RPGpmXKuqgvl
         i5mZdfVZbbFk/8VIH/BdFZcLw39RwU+9v3eUO6ux9HZTZ8pzVNf2WNPFm+4VklbSiHgW
         m8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869685; x=1751474485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onUZmipuuggYzLIHkuYvhE+eJtHfnxxJxJfL7IX4aE0=;
        b=T7A2S720uD0BlIoISeUdM3MWI+AaU2f1xrkBjgIzA1s9DBLhuaplGqCoe/Sr2UQEQm
         UbR1d6EVKzOy8oQarEvRuclihhsmsY4avxKzAXEz9RciPdmYbm2FMRx2ZoiaGya1rOTx
         onypAFo/eFQWPXdjufLn5QJWxsk5Se+y2dyhcovZLNR45DqZvTsaKQmGzm1I9S9w2ROW
         BszkGu2fdCA0e8DemhNmdB7eWoyCiqMoBi/5VD0ukrfv2/YIWcvj2kRxSg2cfo5z/q89
         91CA3F8YA2jAK7JepYxbXNkYAznCsft/hm9GfKvS95IZ0EHOVktdkB19CU7cT/QM8QA8
         jyFA==
X-Forwarded-Encrypted: i=1; AJvYcCVhCDk21UK4gCYttJIhVcmIR63jf3KNrAF+aCPq8qHDLr5RWwiA+ZIVIN+7w9GvCzOPYrk0RPKENoqnTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZLUzIA0Q8esxmFO1kF+jV3l7DEzwoNTiLdqkJyHW7qNd5Vefx
	Hl65KLgE8Xtx60I+HLfBDUglq0FM/rgIu71+TFJ7Lvr1He2pSCQ37jsnmGxkqu7Ogj8=
X-Gm-Gg: ASbGnctdKv0ioK92qcBIE96xCUkc8sRmaCFEvnz3Lj0ibGSCVXBQ3sdkq9tevt20Ioa
	Nvq0tddj7bVVWF83DeryN6832a+CP733uNm+XSDkYkKpDEkysUaggXdApmd6zFIv4D8TsmxToLc
	0twpp1fu0/nJr/AgJ4dNdHrsi4KAA7PsewBWRAk6W/c4BnZ9samQuxaUJcdTuFntmzcI9gm47I/
	uMZ4cAlCXMkv5o6KS4V/U+ElRzeWPEi1cVt/PL8+OFWU9rcEY666/naGrqLDNDy1xweTDZn9uxp
	leFEDx9mmFY+c9PSULs6NBPqAOmvdyGb27TBp3AOoZ0CMR2HF6sTXt94mB3AL/YuJeovS47/5qE
	hvxJdXdUhLzO4v4gUOTxzPwO3FvHIkuxHdIGE+0Pu9QhTHw==
X-Google-Smtp-Source: AGHT+IEJjH8bQjuNwdtdMHcIqr7TaeXw94sA8Sz7we5uKf6oSd/0mHR3v6BiNGUMN+0Ha8bqXVo/yg==
X-Received: by 2002:a05:6214:dad:b0:6fa:fcb0:b88d with SMTP id 6a1803df08f44-6fd5efab193mr58692036d6.28.1750869684773;
        Wed, 25 Jun 2025 09:41:24 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3ffdb190esm576783085a.86.2025.06.25.09.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:41:24 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Wed, 25 Jun 2025 11:41:12 -0500
Message-ID: <20250625164119.1068842-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250625164119.1068842-1-elder@riscstar.com>
References: <20250625164119.1068842-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_094126_375729_7E743194 
X-CRM114-Status: GOOD (  12.95  )
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

Enable the SpacemiT P1, which is an I2C-controlled PMIC.  Initially
only the RTC and regulators will be supported.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../devicetree/bindings/mfd/spacemit,p1.yaml  | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml

diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
new file mode 100644
index 0000000000000..5cc34d4934b54
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/spacemit,p1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT P1 Power Management Integrated Circuit
+
+maintainers:
+  - Troy Mitchell <troymitchell988@gmail.com>
+
+description:
+  P1 is an I2C-controlled PMIC produced by SpacemiT.  It implements six
+  constant-on-time buck converters and twelve low-dropout regulators.
+  It also contains a load switch, watchdog timer, real-time clock, eight
+  12-bit ADC channels, and six GPIOs.  Additional details are available
+  in the "Power Stone/P1" section at the following link.
+    https://developer.spacemit.com/documentation
+
+properties:
+  compatible:
+    const: spacemit,p1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vin-supply:
+    description: Input supply phandle.
+
+  regulators:
+    type: object
+
+    patternProperties:
+      "^(buck[1-6]|aldo[1-4]|dldo[1-7])$":
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@41 {
+            compatible = "spacemit,p1";
+            reg = <0x41>;
+            interrupts = <64>;
+
+            regulators {
+                buck1 {
+                    regulator-name = "buck1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3450000>;
+                    regulator-ramp-delay = <5000>;
+                    regulator-always-on;
+                };
+
+                aldo1 {
+                    regulator-name = "aldo1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3400000>;
+                    regulator-boot-on;
+                };
+
+                dldo1 {
+                    regulator-name = "dldo1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3400000>;
+                    regulator-boot-on;
+                };
+            };
+        };
+    };
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
