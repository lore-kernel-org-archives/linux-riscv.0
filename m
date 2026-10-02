Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BA7CA5FDD
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 16:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5uVChY7bLMumt94EdGo1BeonRpf2dZ5SuK/GneY1lQI=; b=Wdvpm5r1yuqc1y
	ykIMOh/9QpcJZ9AYZDXVjQPUgWVliS6H1PX67ujaxpyC2f2l5jRp3srL5axinYKI263o1V1wR/Rlx
	ntF6jtuWJFONMipxWhnfAO0BEUbMEaq/yy64M9EgLBnCoGUux7EclL1RVmHzMhWgbJIccDfpt3LG8
	ONCHhOPR2gu9dDgcDMUj/B6U72p0hxezhj/WBok6W8maLVLaVyu1nfkjWYkeOm7tUQBVEFZhahxPr
	agsx/E1KvrAcbfMu/RjfqxtLl3LAZ6MV1VWgYzTvzjbCiKoyYXm7FkoNjkZD1JwMRSbRyWo9K0uJ7
	BQdvfhmetxmgwixXtpfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCg8Q-0000000C1wc-1M3D;
	Fri, 02 Oct 2026 16:29:22 +0000
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCg8N-0000000C1vm-1uUI
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 16:29:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790958553; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h9R36u9Pj7FF/r94eaCvJ2dvqQfWXhxOVJ9LBuMFxqNDcrxS0mIRPLwqpyfMD9Cyt+cHw6Hr5Q5TbXSgBFuxJxyYzL78Lxyp+siZL65kfGdJwMa3utXjPVzbtcQPFKZvqcUyhTsQWEzkV110VAIybElyhayX/CxNV1nIeqDbUao=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790958553; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AaHauvbdnLQTxnC3eeCEYPDWEgFEPt9mYjYfgUaLDiI=; 
	b=ajadwwyWYp+3S3k+qMjap1Haz2jS1vGAyGpLddJOKM9LGpABg7M0gKJvlgbdVltxM9gzt9KJS1tWBbHQMaZMkFZjlipx0lWGeJN8gFc0FKDLHOt78WGtd5NfavfRIPGQAgWZ172QK4jNbZJfHubADElpSIPJVWNBZWIUOzJwr5Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790958553;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=AaHauvbdnLQTxnC3eeCEYPDWEgFEPt9mYjYfgUaLDiI=;
	b=Pd01FfIXr54yyXe2VTufzf7qmkMd5/eYSgLkCT3Wfg9U7K4stzPY4p0g+qI2IGlG
	Q46PWcrXnxORlBPvGAdfrzK6nb6cziIgWRUYIBzXEq2rEbKmJNjIANiW41fdBXOPrqz
	ztoQojYcXsbdAwY+/pKIjBSa1j8YVoY9rTjZ5vLE=
Received: by smtp.zohomail.com with SMTPS id 1790958551948520.1332953923302;
	Fri, 2 Oct 2026 09:29:11 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sat, 03 Oct 2026 00:28:39 +0800
Subject: [PATCH v2 1/2] dt-bindings: clock: anlogic,dr1v90-cru: make
 external clocks optional
MIME-Version: 1.0
Message-Id: <20261003-dr1v90-cru-dt-fix-v2-1-6e7d96612ac0@pigmoral.tech>
References: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
In-Reply-To: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Brian Masney <bmasney@redhat.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=3EPl1xrEnKTuVwPppRjtajlmBRE4FwU0CRLU2+g2M5I=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLL23z6gueP06tQ3jmnLzsZpXWF0i0susnN/+Tng/f8uR
 rU6jXWzO0pZGMS4GGTFFFm4/MX/WevwfDsi0HofZg4rE8gQBi5OAZhIkC0jw/MrTNxnTvx0+TRl
 Lds9bVlnK/013xTzxLlCPPqcZj24uZDhf+G6JWccfN1SFCWmbRedY1t5grG6UPjF4TNTyjald85
 SZwYA
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_092919_554180_99E5597D 
X-CRM114-Status: UNSURE (   8.77  )
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

The main oscillator is the only required input clock for the CRU, while
the external CAN and WDT clocks are optional board-level inputs. The
binding currently requires all three clocks, forcing device trees for
boards without these external inputs to add stub fixed-clock nodes for
which no meaningful clock-frequency can be specified.

Allow the clocks and clock-names properties to contain just "osc",
optionally followed by either or both of "can_ext" and "wdt_ext".

Fixes: 155d900e4c7d ("dt-bindings: clock: add Anlogic DR1V90 CRU")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../devicetree/bindings/clock/anlogic,dr1v90-cru.yaml        | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml b/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
index 11a92588e494..482640bcf644 100644
--- a/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
+++ b/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
@@ -17,15 +17,17 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Main oscillator
-      - description: External CAN clock
-      - description: External WDT clock
+    minItems: 1
+    maxItems: 3
+    description:
+      The main oscillator is always required. Either or both of the external CAN
+      and WDT clocks may also be provided if the board routes them to the SoC.
 
   clock-names:
+    minItems: 1
     items:
       - const: osc
-      - const: can_ext
+      - enum: [can_ext, wdt_ext]
       - const: wdt_ext
 
   "#clock-cells":

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
