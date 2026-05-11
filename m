Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FFCCD37B5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 11:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/hEeinzA+0RP6VUGEBWAWHmWikC3HU5SsKs91kFr3T0=; b=eeeto0Q5p7gan3
	cvppTmZQAzhoZD+r0CHpsf3gc1CA81y8OGqWnzIIaQy0bdr9e775Z0JZd8wXwcDPzsKbVfsSKfYTZ
	rA8FuB5tAn+GiNJJS7//BWOSLNvh08cI0FfB7jwRsn833E4CPZA1T7ZLGxTQH3mxvF/Blc4D8MKvI
	ruJEq9Iwv46F/08t0LKbo87oWpFdjsYU1R8Rcl2SGyvkQxPc3j8epEMeKtKs9Wyx1NeDHem9ULw/n
	j0Ti5/zbcE3hqEWHX0WmDUltR61Qtnjj7yksno5VEA0GLnwtV/9MM6fFlWIE89aTT3WB/9X1k7QST
	KZOm/CaQQlxFVDC8NTUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXm-0000000DEwh-47qE;
	Mon, 11 May 2026 11:11:27 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXk-0000000DEqu-02Nt
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 11:11:25 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so41286545e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 04:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778497882; x=1779102682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+BDkQR0yOyma2a6dWvMQJlddEtkYzccD9yu5cOlZj8=;
        b=JgkXM8+MQMAVQ6jIzsdZsGN8ho9nh2CAXkfHNKnZ6TzMqLaD3Nay5zohYc4ebjxtLu
         g4kjCatdMkmvmYsSMgbrek3EJLeLMqpwMJQ7WaU7yECO+xr/RXlXmsNNe1+OwTkelCNQ
         m7mV3YdtketbrxFXOnXCLb/RmG7CWI+IilRMyNuFynjSDU0Jta4Fei3dHDZc6W3qQ36c
         StkCqSxiQGzrNcjsysfCVw+6w2OC+wH6GlmLqpfKIm+6fCYp06EYQPIlPHiYU4c3qqk8
         CXauV2YWRrCAiPLSzjWR26T1QNfFuJ2ig1GUr0w1iRS4Jk59v7hrnzD/Q0Ri/BtiOwtS
         dEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497882; x=1779102682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V+BDkQR0yOyma2a6dWvMQJlddEtkYzccD9yu5cOlZj8=;
        b=nujcqQl+YY/ZIMKgqh6cf8UyvmjpTVjLZU0PxOlbzTzHbZtK9o+XvQ1YxExisejiDr
         I/ZtTUJdOCSktKlqF2X6fsJ+oDoXUoh5DMsi3tvsZK6nHulK9i1Xq045Ix24anhajUE5
         mHTF33IhS87jrOkp81IxdRn2IXB6wwx0/83ReqjUNIO3x4/I3r/fD047geZ2zZJnPLTO
         17reMb7KgKNdwymIxMDU4aGtFbjISiYypYee+p63u5ivOg2Esn43fQwWqOL+ef6WyfoN
         ztwpXu837cqBZSvgKh1RuMadfjb4ofgAoXgrVT3zPR9rkI9B8Krbv5y20mcAw0x8MdnL
         vBsA==
X-Forwarded-Encrypted: i=1; AFNElJ82KiG1BWXlYhTI8lI1MgaMQEqU96WgUAi9uJRFVE4zBiqKXPoxLfCn5hpMfjtg826UHevrjDxBo+zM+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPNCBKCdXp/D4yvvvhXs9u4KNmZddbAVxtN85nzqBODAtzbgA3
	Sqk/56JH7vOKOx+TNR9wC1jaAFVNIdSyaWjI2/0AVrHLUNwW5ApqkwTL
X-Gm-Gg: Acq92OE07kbBXf7xe6NBwDCBvG2oUDknS2mLw4gh1brgnDkZCRoQOcysv9bKcbeNb4f
	XznP3Wecl/jmJKohWb1vHKRoac900ANadsvppRt3o1Uiwm537KGAKakgKbaZjIhkYgJh4iC8dPU
	jgmdRb9BMI1pEd0Rlyc++AFpBUiWVN1MrMsSwfPc2sRuIx+oh/w/8hIsF3Iyjd4jRo9KMOTmg+n
	qb+vmjbVxVbxSujuHwVEunGj0qgBH4oGYCAGCn9V1l9kBBr+I6Diu0bPgALC5Iba4PwEQ+wJcNq
	K2bCdSgLu1HWGQARC7R7lBvNG/yaQtexZOA+C6O9UO5DbJIm6seBGRcckpqrqYWLcEW7QaDC8u7
	fwPISrcBAw0TqSmVIrezW1Zbbr2y/P6D29lt1WE6jp4QwrM1ujBRwe/kcKpjLlHvkFYZMy6x2/p
	cHJM9Q+ev9MwEDDI735i2+umNrv6ccAQWW8vmTW73pIbnDrg/+6H6j6WUf8G73h8RERg==
X-Received: by 2002:a05:600c:3e05:b0:488:9ed3:1492 with SMTP id 5b1f17b1804b1-48e51f2a997mr407079165e9.10.1778497881912;
        Mon, 11 May 2026 04:11:21 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm175077375e9.5.2026.05.11.04.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:11:21 -0700 (PDT)
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
Subject: [PATCH v2 2/6] riscv: dts: spacemit: k1-musepi-pro: add 24c04 eeprom
Date: Mon, 11 May 2026 13:11:09 +0200
Message-ID: <20260511111116.1109643-3-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511111116.1109643-1-a.heider@gmail.com>
References: <20260511111116.1109643-1-a.heider@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_041124_109232_77CAC11D 
X-CRM114-Status: GOOD (  10.05  )
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
index 88c35ad1ef2ae..79415d760f162 100644
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
