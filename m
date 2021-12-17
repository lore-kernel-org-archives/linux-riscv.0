Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9B8C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 09:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17aVe6CKfAX9swGIHai12QDJ1FAapnPQxioEDGrvdSI=; b=T3YmpENCm8JDvt
	ErQKWjdJSEUpvhl3MFq8l/BzDbsegI9tQZBVFF5wv7guuyZHSAjaPHox5nTrtEixfJzyQQey/mDhb
	UjYrXI3GiJfOXTT7ql5Kniz4IuERhynM18ZOMRHVGn/cx/H6Ex6or836GaxXUyU6gY8CuUI5Faykg
	xDkDJcs0TEYYut4bk3njwppa9lmJ5QowcGiQvowiM4UubPz41u55MtMKcvFTYuZfSttaf0uKJtfH+
	ylIMD8+fbQrztTBnmtPQ2JDhnQiW5YtolxfvoHFH8jEAAEH1jmeqE0H0nF+N3JzKJZn+e2mU2GH5I
	iDPaV2FkfZxPvJMz2J5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my9bf-009B2H-95; Fri, 17 Dec 2021 09:32:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my9bd-009B10-4V
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 09:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639733568; x=1671269568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fRK83uB7UBmgy7OppXNXdK4ZxB+gBwJv/ZT1t+O9sS0=;
 b=F10+gqB5y2cCuZX0ukj/BHMGxzvpO2dcBz45DpmrwAC1WCBVVOWE5ojr
 1apoIAgVSajvXV5jshL8PE4yNHgHuNWgmZ+f08SFfAL88n/EBmPfdrwcr
 JjC4T/kETrSUIKEaggV2GwjXnML2v+bozhs64Y7+57twZN8uyCaTLIvuU
 /vad6ix4VKUEP2pJkO5sv8wOSo/YodtaZCsjjxyqdGc6gWCfW1W0hLYAO
 EoMcDnnCP/Lgy+JcTqPenuDuEQtBHh4xd640RbggAAYSTFu9z2kJfPuev
 gEIQkRHwe+/9ah0XQDIwJ8dGX2gLLJu1sLvD1f+aC0a1PGXX28pz/uJUl Q==;
IronPort-SDR: CrKd4tOB+b68mUuQA2Zc6ZHToi/KHgvehYmiy4PX3pIT90VbOVR9DHCKvNXqJwwTSbeeBF8d9b
 qT/hxcMZ8ru69NqKG4oYHAcbnxezkEusLPGkbJjzooonvMjQXrGRX3OBaACKbERSZt6tjFmqGT
 CjVEPj/2sqNN0oQfkZ5tc21Z5cP8bBfVUA6+2AU70yfSMx1cbniCpQJVdr7lUxUOYa3W7OWSJU
 ms4r0BOxTvuXf6ZAkbpL9sjKttMVqmBmBPnbJYKHwM8Hvi6WDoDyiIobtpHrLDYAvxPKHrvcbe
 LM0m7AafWCeLwB16ghkWz/qX
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="140110734"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 02:32:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:32:47 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 17 Dec 2021 02:32:41 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>, <heiko@sntech.de>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <ivan.griffin@microchip.com>, <atish.patra@wdc.com>
Subject: [PATCH v2 06/17] dt-bindings: rng: add bindings for microchip mpfs rng
Date: Fri, 17 Dec 2021 09:33:14 +0000
Message-ID: <20211217093325.30612-7-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217093325.30612-1-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_013249_271536_458E5365 
X-CRM114-Status: UNSURE (   9.41  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add device tree bindings for the hardware rng device accessed via
the system services on the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/rng/microchip,mpfs-rng.yaml      | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml

diff --git a/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
new file mode 100644
index 000000000000..32cbc37c9292
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/rng/microchip,mpfs-rng.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Microchip MPFS random number generator
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description: |
+  The hardware random number generator on the Polarfire SoC is
+  accessed via the mailbox interface provided by the system controller
+
+properties:
+  compatible:
+    const: microchip,mpfs-rng
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    hwrandom: hwrandom {
+        compatible = "microchip,mpfs-rng";
+    };
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
