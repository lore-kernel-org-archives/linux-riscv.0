Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC47FF8855
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 16:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fzxjuL2AyZliUfetKVHTjtv8N2TbisHHVxV0ljRTZZE=; b=QAIFUhVnESM47s
	+dALrC+8KYMbKm42dTqN3xocNnfjHG+NUBszq6Hl08uBQ3KOYTdheaIdxO/UroE0oeF2+b/gYfe9T
	eZTwuWpzRj3X8jqloW9P6HCbEafMnOyb2T9TBBW7Pk51J8QdUoB1RpB11rD18vX0jA9pO9ie1Ub8s
	BNnkFBVGJoCyh8D1/AJbnL+Z7uZOKnUsWgEcUqsffkU+/SHT6iFi92/dWcN5yjDCQY38OfoRyVlam
	aWbzpFlof4I7+WKJJvzDNL87P84t+oUGtzxoac26scWoflnpoZd1gjHFz2oksRHWAW3UdKsU2aiMo
	g7RLT3z/Y/Q1jhv+RcOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKII3-0000000GmI1-3rYU;
	Tue, 05 May 2026 16:06:32 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKII2-0000000GmGt-0Q2k
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 16:06:31 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43d77f60944so3540829f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 May 2026 09:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997188; x=1778601988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bw/a4OrYGymLdr8R52mjU12m0LbF359cidTN+DYJNE=;
        b=LAQHD2JlrSqNYOdbETEERImyMIVe8MVAioeH7ll4jsu3XCtLDtt3OlgAxDQlSyjsxl
         j5E9a/ANyq1PVBgY1aSIyBOUiB4ZSDSMoZP1CJbJTm5nTp7oauYxPC9B/1WFttIqKIVY
         4Ri0RqTXzmn/aZAsA2fGORSlrpAdMKgnq/iR5fLsPHrSwnZcBxQtYUeoh4MOtYzVkRP2
         RT9NTt3IV7xNb+Y/rTaBI33rmyDagRlnMF4d7TLDs7xqYXLHcgsj7vgoUMyYpFbLG6jb
         5UQCObThwyGr6VjStzKZ5x59Q03vkGXxMBovNSZElu2wAaNI24JrDS/X2pYYrzm3NXC5
         d6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997188; x=1778601988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+bw/a4OrYGymLdr8R52mjU12m0LbF359cidTN+DYJNE=;
        b=gKnPU3zfOHDjCSBK4RhjHv71V/zmAUQztRymrVKI1MI6O0CgMGwqSwnuX1mYHuOh79
         JDOZ4pKZu+uU8aR4jBHpG8feAvfHp8Xw/1+vumTIfl8J0/OTCxC8jQshRGYcUdFAMFkj
         r90T7GAKN8luq2rafaEIkxQShgiuf2nHr/AfoSSu7oO+79+30rCIjN7eYCixoQkzUSzW
         RuezTBvo7qOY7uzJEtTpq8/Vc6pynAwvFE/XGx6FzXEMlLxDhByd0s89K8vyOoGAdPUw
         U0En+htydQzn+3fUmIFnwQ49nWiJ3gA4YZ7+hSjtbnFwTu9M2i896446Aryrxrx0yk4e
         7eIw==
X-Forwarded-Encrypted: i=1; AFNElJ/0yJi9ojJLhDN2aMfRf/T2KE/jl6odlbOtKiin+qzhFocLMYeKTWpRFBQg3yvT08Tdx0qG4SoVt3QBDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyme17Ghbf4kTwPRX839MIbh40cBYIwjZfdmW2qDYQWwYNqoIJC
	yQ0+qW+9vqqClDn9B/O+5PmVNOvSY3Gu83PLBqB6ltGS3xCWtMr8tx2H
X-Gm-Gg: AeBDiesWJHZ8TEfSW55WRlMwYOr8ILNxxq8M9asQJqdHEC3P7xowWDsdI9yRYuKJUEd
	tQQpl9wD+tQFGEhOj66XAVsrlST2KzwdkK72WLQ1mzlzpZrqDsity+drWwi+iAyOPv7vWkXqS5j
	jF+xQ4mYQfr89QI/ACyYrp8fNwcCh0Sf1qCTm/rHuBkbDHu5FtKZeSVSKxbQQV/D5X/tqhQHXgq
	VRhBc8Kx0+g0Va+yKBKuRhTMPuCd0jNJJFug+n97b9eVWWoUmNoZammhUUbObTzA8PCxSjL6Vqj
	RWw0CURNdKTm345UYMNAofNim9ByIoECHtUDL7IyBDLCGSV81ykXwim7orADEr+yWZx1eBeoqo/
	UCVigZpsd9v9BnSizwtquRum9wPcsf2QPwnMzWColBSFmpmBdQIapAekqPQB5EfVVrCRWcaVbOT
	G0K3J+p1ur9oNsCcEgTJB23VlHKvk16sqeieYEwH6tjxl9NsvqWHiqfm0uQVlPj+b8QKl38tmr7
	iOUSfo=
X-Received: by 2002:a05:6000:1acf:b0:43f:ea25:c965 with SMTP id ffacd0b85a97d-44bb6205eb6mr24336002f8f.32.1777997188159;
        Tue, 05 May 2026 09:06:28 -0700 (PDT)
Received: from mamamia.internal (a89-182-137-143.net-htp.de. [89.182.137.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm5398891f8f.32.2026.05.05.09.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:06:27 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] riscv: dts: spacemit: k1-musepi-pro: add 24c04 eeprom
Date: Tue,  5 May 2026 18:06:16 +0200
Message-ID: <20260505160623.1369347-3-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505160623.1369347-1-a.heider@gmail.com>
References: <20260505160623.1369347-1-a.heider@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_090630_151613_B5786B4D 
X-CRM114-Status: GOOD (  10.43  )
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

Enable i2c2 and add the connected 24c04 EEPROM.

It contains an ONIE TLV table:
=> tlv_eeprom
TLV: 0
[  12.162] TlvInfo Header:
[  12.162]    Id String:    TlvInfo
[  12.165]    Version:      1
[  12.168]    Total Length: 58
[  12.171] TLV Name             Code Len Value
[  12.175] -------------------- ---- --- -----
[  12.179] Product Name         0x21  16 k1-x_MUSE-Pi-Pro
[  12.184] Serial Number        0x23  17 BPMIMXXXXXXXXXXXX
[  12.189] Unknown              0x41   1  0x02
[  12.194] Base MAC Address     0x24   6 FE:FE:FE:XX:XX:XX
[  12.199] MAC Addresses        0x2A   2 2
[  12.203] CRC-32               0xFE   4 0x395ECD34
[  12.207] Checksum is valid.

(With 0x41 as TLV_CODE_DDR_CSNUM)

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 07eef3274192c..8bb85b5ba1943 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -17,6 +17,7 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		serial0 = &uart0;
+		i2c2 = &i2c2;
 		i2c8 = &i2c8;
 	};
 
@@ -92,6 +93,38 @@ &pdma {
 	status = "okay";
 };
 
+&i2c2 {
+	pinctrl-0 = <&i2c2_0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
+		pagesize = <8>;
+		read-only;
+		size = <256>;
+
+		nvmem-layout {
+			compatible = "onie,tlv-layout";
+
+			product-name {
+			};
+
+			serial-number {
+			};
+
+			mac-address {
+				#nvmem-cell-cells = <1>;
+			};
+
+			num-macs {
+			};
+		};
+	};
+};
+
 &i2c8 {
 	pinctrl-0 = <&i2c8_cfg>;
 	pinctrl-names = "default";
@@ -126,7 +159,7 @@ buck2 {
 				regulator-always-on;
 			};
 
-			buck3 {
+			buck3_1v8: buck3 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
