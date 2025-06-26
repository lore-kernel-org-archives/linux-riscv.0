Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9086AC7EE30
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 14:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgrvdaoAMXnpD1GyPsd7WoI04eBZMFWVOkP+kB0t8YA=; b=tnNwnlXhWG9jUX
	sxm/tp/NSrqWefOXIoDuP3uzoGwv53nk8oeA+YvTPOAU1aO2n5caQfv3Db9hfMq5Sby3xPDLSTfHU
	iTWPAMfUKMW9SwvrSzOQlwMQdWE/93WOt4zKaRpkIKc3wY+Cklj6fzE8Za6+kXNs/8LOIa+6WOLNU
	vQUpiMwJVqu8J317rCptMHgCh/bpzFirwNBjgvw5grgOi5OIPUa7LWYvXhPzucHgnVsWxsokPxVcK
	vdLkLPIEAtDOh1fdq+YEisTUAcN64jnCXiwlYKtbx61y6znqOzt1yGZyOzEn8ATKvU7XFau6FjUZi
	yw4yaHPUORS9kitxHPWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUncr-0000000Bvdl-0FND;
	Thu, 26 Jun 2025 14:30:53 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnQw-0000000BtPW-2zvo
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 14:18:36 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4a7f61ea32aso12246461cf.3
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jun 2025 07:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750947514; x=1751552314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onUZmipuuggYzLIHkuYvhE+eJtHfnxxJxJfL7IX4aE0=;
        b=B4W+WMrxYVw+/XPBsuljk8ecvqy+Ja7e9sT/hnT9HcxVhkmZ34YOgmCI+0n0aoqKhF
         Y8tSHE8+SOc8cIEyEo9kvdG5wqWdsc1vqDGrMlVmmMmg0bSaiF/ko6aID23AcpdNIXHF
         334R/zCj4BiYhU5g9LkWU2jiEZwyAqSc7fUeuqA/Twc4VkzPb+2VXTTWTqlImHyN15/n
         O0eXGeC+6QjBFOjCw/OHaYqLiN53rO01yVtYJHfCe2MKOjzTg8NVDDcm6mZXbRRvEkp5
         baAuAFk0F9kZGM7tmFOFLDsmdOwd4Yv04x8aUARFi18oJEprfz86pMjF94AfTHPQLWyi
         SvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947514; x=1751552314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onUZmipuuggYzLIHkuYvhE+eJtHfnxxJxJfL7IX4aE0=;
        b=PEcZQ9rcw7RD1R+WkvD9hn+Im6P0kMdTxNFnHqmYeuva1IiLj2BZJYt8Ge4y1Gut7e
         zKeu+DuzHpVjKgd6ZiGdknKxW/PUCltkk3jV4DZJUA05DY0warCrL4LkmPAes3I+qPIa
         ZFAMNAVHYNCCEUpKTfE+Wsz1ySRRsYUn3pJXqE5SToxe3IVHXHn6HTqJutG0lNCTVw51
         rUOFYJO61XAe3zsrKCunNp/o1lMxp5a3xcU58sZyCswtTHHytP6VP3K5IA8pos91EkyF
         0ilsfyPVxKQFk6V5kqp1xJZQGNazSuYesqQ1Dqi/DPuqEFL3e3dgmenvSlWj+Ov+iy2A
         RNLA==
X-Forwarded-Encrypted: i=1; AJvYcCUvmrW81kO18h9ZOsmk8j24VpBK7qXKRef3/W3U09B/sATLZQbXTD3PXMn6/7tGOfj16Sq2q5DHKGdYtA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBNGUsiKeLgknAM5TqHdX19nXN2jFZ1FsoJ+jpkOhOZ3MVcicL
	PR0ftAs2mP20iLrJxFTxZoWa25sazqU7/H17Gt2q0ifqqz0BpK8xX7+5cE4OfMWtS/s=
X-Gm-Gg: ASbGncv/6V0/VTz1jSdypoGiid8PO9Bkqxk0o1/M2Gw+9vCL1NF5p//oBXrIUxVSpKr
	0cjcYISBEFtkKPDVwtyAmNk9ByPGlx8GvErvGaXhwrVXKElQ5JgD55Bj7fek5DhOPC41zKcIDHH
	vwZzzLwsWNBbqyJJYRPKf6P0wxk0TFXXGKjI6H/aof3k12T0A5VaOMKMvUc69wUJi95CD7Ed2PX
	NQZgvuOtY7ZJOzTVB82SzAybXNXmKFlFlu3hss9kk2Woau9bJssErdsm1XcwuyvysXmneT4JFio
	wc6FHDj5IR0q7QFih2NtNv5kXDklhPxCSQawPyT5iytT7oyZp6VUNyOpNDD7IuN7jdY262PqTQG
	fGinfAzgfa4mF08GuSUPvWt9p2TVUIhmyLwg=
X-Google-Smtp-Source: AGHT+IEWxkse5hTkmeklkGnlPmhHsuowNr5lQuTqRpNLHHlNF9sUuGIos4wTOLkkzfZbR39s8zymFw==
X-Received: by 2002:a05:622a:1914:b0:4a6:c5ea:6fc with SMTP id d75a77b69052e-4a7c0857cf0mr107432031cf.42.1750947513647;
        Thu, 26 Jun 2025 07:18:33 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d6df17sm70266101cf.30.2025.06.26.07.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:18:33 -0700 (PDT)
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
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Thu, 26 Jun 2025 09:18:20 -0500
Message-ID: <20250626141827.1140403-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250626141827.1140403-1-elder@riscstar.com>
References: <20250626141827.1140403-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_071834_746710_D79DCD50 
X-CRM114-Status: GOOD (  12.57  )
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
