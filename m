Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED230C19F32
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Mar 2025 19:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvF8JbLlwWkSyV9bPSpavto1bNW20MCWFFpHxZd7rVs=; b=ewL8DR7KCKhVny
	NQ9e17/ww+8xo55418M0lTRcj9/6OYOuvQ6vD/deek5YfGM/fqxb1gWTbgyEDxymK6m8l7LpR2r/S
	VpcsI/ygm45p2goZMuUJl2XXNRkONwuVE6A/nF4btCRcv8p9KC5kb8Ts1A+YazMKn8iIt/H1CYJ8y
	uMjDdQxAcAahCgRpgw/yOwLCtSYEfiHtsY/IZ4jgsCAbPcjzFZDSLYhLxcArR6M1LdOqPhn6SW3in
	Wk7h4LEl7zj5kKGOnbj/nJ0fjN7VrU6VFLiIcEIEc5dbwOGpFaAFvoyYIZDuCvjRxCivROu6DCrCw
	TXOo/mTCtyQM6/j/up6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1topMQ-0000000GbWO-29tO;
	Sun, 02 Mar 2025 19:52:26 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1topMN-0000000GbV2-0D5c
	for linux-riscv@lists.infradead.org;
	Sun, 02 Mar 2025 19:52:24 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e50de0b5easo1947194a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 02 Mar 2025 11:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740945141; x=1741549941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5c4NPufpKoLHDbbT+GlLj3VGqCkTEQTVZclMQAkqv7A=;
        b=R/EK3T+wTtGZqVQX4DJh7baCRpJVErIOVxEse4lbp9cMqezakB63lxypWN1tt16lyS
         RHveApZi8DFP75VYvXKzHWmdyO+A5bd2iIEzzkplfByW8gkIPkNDJ2vx+MYpy8gI7QTF
         1fIyBU3qC2fa+oHu3xt9XPguoQ1ogf+7T7okKdLQD4HV5bkj3qE+3t15kuxHsGNFQy6/
         KeLMB8zX+MGVB51iVgtLRl9dAs4b0ci5h9ubCoXw56fc/Rt6CcunIcUVpRoCdLtkcQ+w
         4HsSrkp0YQPVjUFN6s0mQ9q1fir4t4z8HJwLhYo3ZrrSySyYkKz7yPV8VXMNRMlIdVHd
         FjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740945141; x=1741549941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5c4NPufpKoLHDbbT+GlLj3VGqCkTEQTVZclMQAkqv7A=;
        b=qiETlh0gFYe55SUhpWTxCCW30vGr0ndr6UbqUDfbeQNHNZ00A8FHN8O9CB/GTnxhpr
         hYKHUrba5df9hzTuWuDt9qXWcZS0gCh8NCa2rBZgz4mn8rmsNiuffyQdf18TABbd3iHH
         fgvNlHIOTFLSexz0vskTkCxgeIK+Tq5tJhg7bqmdfOYvJdIeZ5eHFKMari/N+K6c1hOb
         2VQpbNxogYeuEuZtXjxIIxnXFAcPhgFnXlR0XGNr/dfAiVJELxjqiwP914SvxSIjz8X2
         8V2do+X7PgVhLtPuSJhKaIRg3zYr3ds66lzX02B4lNt9plxnMRqjp/V2F6Fk2EZWboju
         q2cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxsrNCMDib6eiiKcJnJaMcwi99hZ5jYTVGoU4GCljhxWHadpDN0wMblamM5fHRYHHfCys/EgZH2/i7pA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxM+70wJ9ryZp9yeoOTlMp7Yrlw5c0RNs1jdJ1opa7OoOpcwC8E
	4R2uZeAGm/xUxTJ0OUkSpn61JWAF/SUJnSuCY6ytKjnfNBEjWgKU
X-Gm-Gg: ASbGnct0Se+wXZSRLqdU8tIC0+pN91Sr0XwjDrkJx0AOQtxTmU9P3crH239RYTmxXEc
	Gu9uXFhLClK5QRNcRdv1jwkal2qMWVA/PjCvFrQHOQVcCj7kOmfgCI8QFMCgv3ou6xxO8F7JNud
	1c6GiukqUOPQh84iN/t+aNYgUf8zyGnHbBq+6rMJa6EtdSW0TlLidjpfk2tlOEmYQ3zBCy+s5jd
	xs0fp+WMXIb2PKdSV0neQTiHIMvsuGa3eLN8b4zghP8r7hoJlirw+PjzijC2tJuQ/q5+zLdb+uL
	PvS5hiGwZSJHy/JrBhKRw5P3eKxckb6xvAVbKJ8F78+Zkjc/qhjgQNB3EQ==
X-Google-Smtp-Source: AGHT+IHMRWSeokwzGm9sYVxt6NEktsQseTTVLAH9cmQzwWOcNzWx1ZDznjFLVkWHDK9J21xpb4xkkQ==
X-Received: by 2002:a05:6402:528a:b0:5e5:437c:1daf with SMTP id 4fb4d7f45d1cf-5e5437c22a7mr3296240a12.16.1740945140979;
        Sun, 02 Mar 2025 11:52:20 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a5acdsm5809705a12.77.2025.03.02.11.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 11:52:20 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	dlan@gentoo.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	sophgo@lists.linux.dev,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [PATCH v12 1/3] dt-bindings: mfd: sophgo: add RTC support for Sophgo CV1800 series SoC
Date: Sun,  2 Mar 2025 20:51:54 +0100
Message-ID: <20250302195205.3183174-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250302195205.3183174-1-alexander.sverdlin@gmail.com>
References: <20250302195205.3183174-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_115223_092438_A5E6921A 
X-CRM114-Status: GOOD (  15.14  )
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

From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>

Add RTC devicetree binding for Sophgo CV1800 series SoC. The device is
called RTC, but contains control registers of other HW blocks in its
address space, most notably of Power-on-Reset (PoR) module, DW8051 IP
(MCU core), accompanying SRAM, hence putting it in MFD subsystem.

Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v12:
- maintainer Jingbao Qiu <qiujingbao.dlmu@gmail.com> -> sophgo@lists.linux.dev
- dropped Reviewed-by: Krzysztof Kozlowski
- link to TRM
- mentioned 8051 core in the description
- binding is now MFD, not RTC
- added "syscon" compatible
- added "interrupt-names", "clock-names" (because of added PM/remoteproc)
- main compatible "sophgo,cv1800-rtc" -> "sophgo,cv1800b-rtc"

 .../bindings/mfd/sophgo,cv1800b-rtc.yaml      | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtc.yaml

diff --git a/Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtc.yaml b/Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtc.yaml
new file mode 100644
index 000000000000..b80d68502c48
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtc.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/sophgo,cv1800b-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Real Time Clock of the Sophgo CV1800 SoC
+
+description:
+  The RTC (Real Time Clock) is an independently powered module in the chip. It
+  contains a 32KHz oscillator and a Power-On-Reset (POR) sub-module, which can
+  be used for time display and scheduled alarm produce. In addition, the
+  hardware state machine provides triggering and timing control for chip
+  power-on, power-off and reset.
+
+  Furthermore, the 8051 subsystem is located within RTCSYS and is independently
+  powered. System software can use the 8051 to manage wake conditions and wake
+  the system while the system is asleep, and communicate with external devices
+  through peripheral controllers.
+
+  Technical Reference Manual available at
+    https://github.com/sophgo/sophgo-doc/tree/main/SG200X/TRM
+
+maintainers:
+  - sophgo@lists.linux.dev
+
+allOf:
+  - $ref: /schemas/rtc/rtc.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: sophgo,cv1800b-rtc
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: RTC Alarm
+      - description: RTC Longpress
+      - description: VBAT DET
+
+  interrupt-names:
+    items:
+      - const: alarm
+      - const: longpress
+      - const: vbat
+
+  clocks:
+    items:
+      - description: RTC clock source
+      - description: DW8051 MCU clock source
+
+  clock-names:
+    items:
+      - const: rtc
+      - const: mcu
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sophgo,cv1800.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc@5025000 {
+        compatible = "sophgo,cv1800b-rtc", "syscon";
+        reg = <0x5025000 0x2000>;
+        interrupts = <17 IRQ_TYPE_LEVEL_HIGH>,
+                     <18 IRQ_TYPE_LEVEL_HIGH>,
+                     <19 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "alarm", "longpress", "vbat";
+        clocks = <&clk CLK_RTC_25M>,
+                 <&clk CLK_SRC_RTC_SYS_0>;
+        clock-names = "rtc", "mcu";
+    };
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
