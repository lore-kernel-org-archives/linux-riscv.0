Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962F1C88E64
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 08:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rY6wc8kH/Og0B/u0wGSptAeN2s41++mkubVb2dupeNs=; b=ZI0MM1ke8s3uUG
	bbvzi1c0XYwRRWE9S4ZDM3xgMhn6TKBp+VuRJFLjVtDtNewheKj2NMbvDMxNa8nHsgAko/K4HBBOl
	ZHmJ5ZGgGqQpBPE4BbpTjxaRo2gTnGLeVwGAL9bAL4NAQ5rsma2NzTPhavRoverWhMfQXZvaEyT/s
	z6WDiURR9scK0avoHYDiDuHk1fo05fbOib+dTJw/InJbHcSdHENrzcExUTxpaZ2jzD4U9U5D50F4g
	9L3pUJfHAFpTnoPG9QwA9z34XUUFnQ0t7tacymr6hPIlo5vXB4LlP9DSb1wzNsZHLbTbdyk56Ze7V
	2gMYE3puYSwMSxnK+tfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61v3-00000002hoq-2bt1;
	Mon, 14 Sep 2026 08:20:05 +0000
Received: from out-21.mta0.migadu.com ([2001:41d0:1004:224b::15] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61uy-00000002hne-3s9x
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 08:20:03 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=U7vTt2iELlQ0EEFdakKRfkx0wSobYgfSFzBqINVEnHs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789373998; v=1; x=1789978798;
 b=UK7DmuMDV0VPrT5MmKknXCqLYrMAI/3rY1tOmAtZZL5XIAOpbl7EE374D19gQGnOPXE4LDgv
 k2Um6ED2NATlrru+MbYUXcGbZXWmtV+f7di7ZqQ2yq5HRFNxc317ZO30E23i79Ks0cePx8El0No
 AqMVoFOZDQSWY5YN844+v+L4=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id 85b6144fd9a19aa4;
	Mon, 14 Sep 2026 08:19:58 +0000
X-Mizu-Trace-ID: 85b6144fd9a19aa4
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Mon, 14 Sep 2026 16:18:03 +0800
Subject: [PATCH v5 3/6] dt-bindings: hwmon: Add Sensylink CTF2301
MIME-Version: 1.0
Message-Id: <20260914-ctl2301-v5-3-522def70acb4@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
In-Reply-To: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1686;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=U7vTt2iELlQ0EEFdakKRfkx0wSobYgfSFzBqINVEnHs=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnL1x76eWbBXPl7F+xPi/5g/Tg77+OZHetkKg7IdR5t6
 xb8IHrIsqOUhUGMi0FWTJGl+wHPtgKfKNsCgUJfmDmsTCBDGLg4BWAiJy8y/GRMuGXty6XuH9Lj
 l1CYWmXifsWjbZ64w4c5n+eXKc85fIKRYV76CZb9U913eTW3f6nbbRjNZHAsTkhQ5u5be+9lVud
 2MgEA
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_012001_122150_A4B873A8 
X-CRM114-Status: UNSURE (   8.68  )
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

Add the Sensylink CTF2301 temperature sensor and fan controller to the
LM63 family binding. The chip follows the LM63 register model and can
provide a thermal cooling device when #cooling-cells is present.

Do not provide a national,lm63 fallback because the CTF2301 is not fully
compatible with LM63. It uses different conversion-rate encodings,
extended local-temperature registers, additional fan lookup table
entries, and device-specific PWM and ALERT/TACH configuration. An older
LM63 driver would therefore not operate the device correctly.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 Documentation/devicetree/bindings/hwmon/national,lm63.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
index f2e0993cfbef3..4c8d0a15fbd12 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
@@ -12,7 +12,8 @@ maintainers:
 description: |
   The LM63 family provides local and remote temperature monitoring together
   with fan speed monitoring and PWM fan control. Supported devices include
-  the National Semiconductor LM63, LM64 and LM96163.
+  the National Semiconductor LM63, LM64 and LM96163, and the Sensylink
+  CTF2301.
 
 allOf:
   - $ref: hwmon-common.yaml#
@@ -23,6 +24,7 @@ properties:
       - national,lm63
       - national,lm64
       - national,lm96163
+      - sensylink,ctf2301
 
   reg:
     maxItems: 1

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
