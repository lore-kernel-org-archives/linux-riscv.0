Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6861CCD4F35
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 07:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDsOKpZHlcP1Ods+yXq5i4VY9VDdJbm9hE9eIy+Vk7c=; b=FJ7jRC3kkMR1b1
	bjkFZoJIEMcZ3Olfcmnd+R+LbUbcuirHVhvSNlTVTYd+LdDrGFx0UOA8hQOaQLwmXlj0upmY1HODi
	csmksoDBUjbMj0UH6Glpamd3t7gjzjfqc7yWqnaYhTBmKEb5obgeSgfpRPZnKuerODCkscj/PweY9
	JlaPden+JW8SNRmNEaK/5Z+2WJBccF0nPxQ5AaAMXWw2abaAAksCTU0NVw/eNVxN4Jx8jdxYM/qXX
	lMEYuoXjvLzSF52oGFrs403xQl+Sz9oRl6oIdAixCs8VnQMEpgty2VDO3q2Z1DXIAMtE7nwW/I9Ab
	0P4JDjmCwcwYZAoMqt4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3t3-00000001XmX-3Vee;
	Wed, 13 May 2026 07:20:09 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3sz-00000001Xk6-3pso
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 07:20:07 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-44a5174670eso3554494f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 00:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656804; x=1779261604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8ZnL1WlOqvrL+zZckD/oAptqRT3baQKqP00mGe80OY=;
        b=oI8KfuKBK4GrFjuNX/Zxtk8wK85oGnIcjD07hqXpH17GXGKQart/oR+HAX5Z00dpsS
         UedkQvVhNlJD7ZM8yNB9bjmelA4K6gFUpVmR0KRs0rlX0jCv5oTVkQAt+zb3Jz5skmZ5
         u2YT/HtFmSuTJQ4xFlbUDNbvCH1b0LaNmXPWkYS9jHi9Zm6xsM6kZsZA9pVPWldWlL1g
         AQPJ2Q5qnNCVAuhhwiU/6ZTvYZOmeNU8v7L/14PLn6+LRgImchmm6gaQPSBFqajE3hwV
         EkadhvcRbWjwG+s6PPRlT9u4IZiXY1VaZFsDcWPp6BoV4k0G8leRBWQjf2WTZSv90ZIp
         Avvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656804; x=1779261604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p8ZnL1WlOqvrL+zZckD/oAptqRT3baQKqP00mGe80OY=;
        b=U4IX11BmNQ6gfzI+gcMR0CXmLicpyGgpSEwnafG97d2ZMEdx+cCw7E8zp46x5jQNHm
         c9rb0PkVazJG/sgQEXBo69XwQ8hlVnNDTYHeDLIMiXjHvkAojVoji1vA79L2vy4RGYsF
         uqrAxsbfD1/rMvy7Kbx7uzvyRfNTaFCsgumbwryFBnkKPj871/3skBTh3BftfR3dqQuB
         readiXXCFdvsdSX0fjUfgCgNXmW2rdIm8ibjfTqdHgyZxkTWROJK4h4m+vzkb6cdyuaw
         bqE9VKt8YXtq4ibmn1ryq0ca/O7DFJWS4YHWU4L4XgNsLCze/4Hb9VQBBXAnEfTBm9VU
         VG1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/nvccBX9PBCQXm1EO66ukbUS3WCzl8I0CZne2Iyo1YTxPppeMWipHNOrxcik65fcFwFloQp0KizkoAZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWfaJOTcgwGOJ9yDCF3ZZUdK5CVJWLcE1/NbfVpLbE9KmJRwMr
	DlVhnlafkaPlE009dyRM8zTFo55gFrd9vnANkgZ6hXu/R4P5BHDN+5FP
X-Gm-Gg: Acq92OFdUZX5EbMsuNIDK39Fk5877SjQOdAp9yG7e0C3l947srXR0uEwcT9f29XYowc
	k4wXFUL0h7bbBF+lmpZoMUkRlM8njrXCryFqHXakT+5TWq7AFqfBqGF6JS1PCTTQUK3/yc1v0BP
	ZxN0wfzrSvBFzzBRxHra2A7zoesotKf8FzgzNzsHjz9RtYFrbN19Pr84eXETo9B2wfmHd4qZ9Zs
	ZID5Rp7zMKz7QBZUaWr8R+5tnL6PZdFz9QcOevU+/ayVAotQ6QalU7GVKm2pv+TnmRpSXRB/MC0
	k6zr2/+zxq0pYD3NSFjsTPjyt80fpkwY4W1UpEdS0AtuUHmjRTnCrJsYU+WJpGlk2WieMO1ouLU
	A2BaWyXySqq9PrCkc/hkRH+F+dS/34jaXPpwc4ZpQFIUuI/f7az1kY9RsoM6b3uPkNTGYsXB62f
	Q1Y5r8cPgbDMuTTSwrjUAj8ffEpiGtJ/+NXOqbxkdWa0zkfPUX9MFtsfR/8T8oR/VgHA==
X-Received: by 2002:a05:600c:a11b:b0:485:364e:9328 with SMTP id 5b1f17b1804b1-48fce9eacb7mr12437505e9.16.1778656803757;
        Wed, 13 May 2026 00:20:03 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d62422sm58498115e9.11.2026.05.13.00.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:20:03 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] riscv: dts: spacemit: k1-musepi-pro: add 24c02 eeprom
Date: Wed, 13 May 2026 09:19:50 +0200
Message-ID: <20260513071958.29574-3-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513071958.29574-1-a.heider@gmail.com>
References: <20260513071958.29574-1-a.heider@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_002005_971472_35DFF728 
X-CRM114-Status: UNSURE (   9.07  )
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

Enable i2c2 and add the connected GT24C02B EEPROM.

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
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index e0b585c50014b..41d7d6d20a797 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -17,6 +17,7 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		serial0 = &uart0;
+		i2c2 = &i2c2;
 		i2c8 = &i2c8;
 	};
 
@@ -82,6 +83,38 @@ &pdma {
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
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
