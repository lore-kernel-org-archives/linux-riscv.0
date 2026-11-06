Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCA7606A330
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 17:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NqzrzrTa;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Oq6bCtf1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ebAuFfSq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Wg5urVSHIVauUs5cSEXBi6DUFkseV53WMS7M46n1r7g=; b=NqzrzrTazWVJy7310jRIf2okbw
	LQAFKqBtV+M8coXC+vBaTK2QYaMu7TZDIWOdICBt2/RIWV+dsHyLk3N/cDla+seyY3EeDqfqyYENg
	toGX4BOVg0cOfK5FQLVl8yRyANyrmpfTtwS+KiNJDeMP90gDPB7LvOiiv6KJpKFvpMfBvT4LG1YjV
	yi7JINjcH+ZSKUhVJP5Lu9yZrKhM8I/s2zszS0erT1rJsDN7BGBbZ5qDZUo7Rf4kDt4biiLFopicf
	dDldVwodAyl3MrQwN6u4Qxi1oHNAApBiiCNUqgq5Fc/ccjbrakWOW7W+PiAlxSJxh/Ya01PwYpkwJ
	Otdh3jQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOAf-0000000DJhR-1FCT;
	Fri, 06 Nov 2026 17:56:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOAd-0000000DJfj-0xTY
	for linux-riscv@bombadil.infradead.org;
	Fri, 06 Nov 2026 17:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RjB3LwZzxEuGJFQm9nKda7FlL6d4DBHlBEZNuNA4128=; b=Oq6bCtf1EFPou/KE7DGsfZfIZ7
	Vcfz6MbgbSxuX8TpFeq2ewjH1Wy9P9vMZFtat271CwYpM9U766ROQhS+uBigkltvjwe2GUErWPx4b
	u7Lf7nXYfvzckYUVq0sdNU0lOjGArg0S+iBmHnfE+NktiWEYVVGg7kcJHrOESez3YJnAnHCHWXa0U
	a6OXaO28K6kZC+WEcsj8ScnGKDkukDidHiiH72hDUPAE8DffSIWhZC4EcWDSec/ShZYQb9g3Cw7NU
	FOR+KyW50ix71F/n3W6BfZgYfRWwxpll2FEreKGJysibf4LZh0/L84rQORaAZklJLFgMjW/pmp8Az
	jXuSj/Rw==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOAa-00000004Y5N-1xtW
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 17:56:10 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-491846221ffso817001f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 09:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793987766; x=1794592566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjB3LwZzxEuGJFQm9nKda7FlL6d4DBHlBEZNuNA4128=;
        b=ebAuFfSqhJkBgn6F82h0AolhwxCvPM7y2f/dU9E2nNPBHUDL5chLh6d1H22PNOjNsS
         2PmGAtNLG+NV4w4Xx60ezNMY5EbbA60svQJcwaMI//jsoKxWxYSpfVV7F4Mx/HSbJVmK
         8prIaMfQ7JcWQcKbBkcbg4WDk+54AGKd4sm/M03PS+pd8ZnUHWciw/S2LkP413RUyLYg
         C/LWS3te0ijtnkcMFlvHcgNiTYUYgjDZeNzTSU6ks2H15WVQtecgcOZyaeZRRu2JQvNq
         2LLqXAizgIylDnILfP7672bXqOBiygHgkr7GYAHumN/oN4PrZGhwmUi+z8XjwVkajSnB
         bo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987766; x=1794592566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjB3LwZzxEuGJFQm9nKda7FlL6d4DBHlBEZNuNA4128=;
        b=yNCfEPnHS/DPDSrAZLfip8pWjxJ7WgCSUygomfg2sOUMiEQsP2xC9YNppPtKW+1eZO
         pmImWYBxGy3PD2RWxqYvxSM+7ws1TdA9BkyaXSq6pnfAbieg+hSOhVqTjXYxUBgGxwTA
         ssF/KEEzvi2ar+YWXDlXxWw496PyC3UBgoY8GKAOJUDFbJs1DfMzt6RsOE1glatZ8XbI
         FFpqS9RX5XlTUNN1O1l+c85Cpt1i5NaTDQ73Ry2gHSTm0yUBvTsJgwTEEVdjf/S5ul8Q
         CAmRpWanaw2IZOmL3PGWS6iSyqIkgt+mTM30iwXQs4pKovLy7/fQJ2uuwzp4/0hDYcoy
         OdPA==
X-Forwarded-Encrypted: i=1; AL+hErH7ieAx7xZ49Z7cQ48RP8a8mv08ts/uOt2NqGtsmhCi/GwcvbYlRZlDB0feMy/gnmUO9vmme4WiifC1Fg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9wstIZ/K3njsIZChXk3DZifiDe8C5VYyp+0hxEe9qfybahObut
	QK2DWr6LBd8cvCjcA0H5np85hjtwzP/R7Ss3fWeVT9KLsPDMdzC3Lf9l
X-Gm-Gg: AYBFou0liiV9gU0vBZk6CePBuUt3YK3mXUK/cUGPnOoP/OBvO2wqWMCpoCNhxvTar3h
	MXpJ0A3XpDaWU/szMgmFifMKPUhqyJEcVEGFqEamkz6LBhvLqZRwfAH3/klDkNGu5CuMXcXF1qP
	EhBN95HcxW7fsmdIo4QSEULfMHioAKmbQyTjI2nMWc4m6wQzBx44QqbmOjpSxNta2jgNfW4a3i8
	E1/X/S/mlKFS7I6BYlIAslFfeN2Eb2QuI2hocX0+0LUJwLJXp/NiK1IbozIZESLU1tcjmxkLOcP
	MIUL8Yrena5m4kLj68lJcLLHVv5ukzk6h0LRziFehgzGhrcC2iowf4omNFSGiCNrF5MZiqLl4j+
	eOfxiEf8nfN7b73lihOMMy4ViX/VToSUHCjjwI0dU9wwbQNr5tLJqtDC9/xW3v9dbEN3gzy6/RU
	vTobgjSRK8imcfdJuM5rsXlnhqt+BuxsV0mi64w1SiTvJ/bZsBaR0HrAYVUry/aFG93UvZrD3FL
	H0A38tl5ovN5hUhK+vciqYDNIsLtMwPJuaGG0tXLmCpX/bVm0ZtfnzqKv83NU28hLLUD0Q22NIs
	1vTVcFVM+NFpufDYV6qtnoeLuyjdfUI=
X-Received: by 2002:a05:6000:144c:b0:490:88e5:92d6 with SMTP id ffacd0b85a97d-49277f881e8mr7918178f8f.49.1793987766143;
        Fri, 06 Nov 2026 09:56:06 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723283dsm4649612f8f.23.2026.11.06.09.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:56:05 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH 1/3] dt-bindings: rtc: Add StarFive JH7110 RTC
Date: Fri,  6 Nov 2026 17:55:58 +0000
Message-ID: <20261106175600.3877614-2-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106175600.3877614-1-oo.hehir@gmail.com>
References: <20261106175600.3877614-1-oo.hehir@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_175608_368533_AFDC3AC3 
X-CRM114-Status: GOOD (  12.95  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the RTC in the always-on domain of the StarFive JH7110 SoC.

Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 .../bindings/rtc/starfive,jh7110-rtc.yaml     | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml b/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
new file mode 100644
index 000000000..95edddea1
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/starfive,jh7110-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Real Time Clock
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+description:
+  The RTC in the always-on domain of the StarFive JH7110 SoC. It counts BCD
+  time and date from a 32.768 kHz clock and has an alarm, a frequency offset
+  adjustment and millisecond and one-second pulse outputs.
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: starfive,jh7110-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Millisecond pulse
+      - description: One-second pulse
+      - description: Alarm and calibration events
+
+  interrupt-names:
+    items:
+      - const: ms-pulse
+      - const: sec-pulse
+      - const: rtc
+
+  clocks:
+    items:
+      - description: APB bus clock
+      - description: Calibration reference clock
+      - description: 32.768 kHz counter clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: cal
+      - const: 32k
+
+  resets:
+    items:
+      - description: 32.768 kHz counter domain reset
+      - description: APB bus reset
+      - description: Calibration reset
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+
+    rtc@17040000 {
+        compatible = "starfive,jh7110-rtc";
+        reg = <0x17040000 0x10000>;
+        interrupts = <10>, <11>, <12>;
+        interrupt-names = "ms-pulse", "sec-pulse", "rtc";
+        clocks = <&aoncrg JH7110_AONCLK_RTC_APB>,
+                 <&aoncrg JH7110_AONCLK_RTC_CAL>,
+                 <&aoncrg JH7110_AONCLK_RTC_32K>;
+        clock-names = "apb", "cal", "32k";
+        resets = <&aoncrg JH7110_AONRST_RTC_32K>,
+                 <&aoncrg JH7110_AONRST_RTC_APB>,
+                 <&aoncrg JH7110_AONRST_RTC_CAL>;
+    };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
