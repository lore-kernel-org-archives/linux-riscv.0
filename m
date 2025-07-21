Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1778C87FCC
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 16:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6hx44x/5F4h6ioAy8Q+Rrg+Ngta4v1/zGSJsNH3A6mc=; b=SNT//w6zvLpR3e
	ue2osRa6AqPO8uFIOnb6ECwZwSWJ+OOUswatgZVOhhDivwlSUJtPnlAKXmw9afhJBYy/q6ce01xLq
	WkhofJiJAzs2TTYUrxJFbfFizSSoyhdD7cuvlRX7lJina654vVKuzRBmwTicmQdjr7aCKZNSUE8ZB
	Xmv8EUo9EkvP8uR2A1qjarnU62zVL2HDXIWB0N9jkgwfSjauT3Bzv8cPQSrdENEDZiRuScNIi5C3J
	DddSBKsch5iV+kgpSLEHvvvHnB8dr+9fGLAbABhEGvWawgxo0AwD6VRJXnansWs/xXV4sEqyKYHYm
	NI0xzgDNbF86fvEg3psA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtnc-00000000FGl-1gsF;
	Mon, 21 Jul 2025 16:55:36 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udsn1-000000007HB-1f2R
	for linux-riscv@lists.infradead.org;
	Mon, 21 Jul 2025 15:50:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753113049; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dA5eqdqf7Q/qAr9IrapxXD1nXz14pkQsnqxOwv1IbSLcUz3eLdtEolsogx5vCSEl8d7CYJUoec063aqikO1TwrtCfiOgfgozt5YwncmvPmfzGFXhVy9yORvnh9dj2IgJo+gn7BkMZy7Ja5qMrYI5PdVTA8ijaWzfAB3FeZF5fVc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753113049; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XYcNJKtpMAOxlltRwDFwqWTLmYmscb2nfhhNfGq1EW0=; 
	b=bSh8yAtc7RbQU4gdBoNLYXkwzAKN9HGNDd1zl5aMHUN++qXQc27zhsQlOcn48uGNCUQWgDmHeXp/sKC1VKTQEFDWH3y8LpFc2cne9eHHmeQgThg+IQ2dqLq40tkP7Vnavu9NkkEPGbo0qnhBfRMRwtszVUWmEApv/OpCoHJDNn0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753113049;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=XYcNJKtpMAOxlltRwDFwqWTLmYmscb2nfhhNfGq1EW0=;
	b=HydIqtAdfJcN6f+3BUQPmzxZCcS8ae8D+k1xB4tpyGg5r9hoW9VgGOEZ/s0yZI/b
	VY1JHMGf7kqLBNL5Tf93KvIyxcS7bhblhGl9OT/YKatji/v8PSDHf5UB0ZxAm5GeJL0
	neq2ysayZn569x52YUxjV0MsRS56UfUgjqfe4FD0=
Received: by mx.zohomail.com with SMTPS id 1753113045317130.23548011092828;
	Mon, 21 Jul 2025 08:50:45 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 21 Jul 2025 23:46:09 +0800
Subject: [PATCH RFC 03/10] dt-bindings: riscv: Add Anlogic DR1V90
MIME-Version: 1.0
Message-Id: <20250721-dr1v90-basic-dt-v1-3-5740c5199c47@pigmoral.tech>
References: <20250721-dr1v90-basic-dt-v1-0-5740c5199c47@pigmoral.tech>
In-Reply-To: <20250721-dr1v90-basic-dt-v1-0-5740c5199c47@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753112991; l=1167;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=HreXRyE3WooyT3OBlj6lQxbBuWgeoeeliEaJp8Tpnew=;
 b=pOpDPuzVCGLpujyU9CePqxQrwiGOshvfUEmJB1WFpsJQSm6Ir1/1MCt6VsCL6Kj44kpp8+JA5
 3BUYRTtRV5aC26FRjmT4Ks9yHbIn/h0CPisf6PWqecz+4k5e8N18tpv
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_085055_517374_15B959AD 
X-CRM114-Status: UNSURE (   9.58  )
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

Add Anlogic DR1V90 FPSoC, which is used by the Milianke MLKPAI-FS01
board.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../devicetree/bindings/riscv/anlogic.yaml         | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/anlogic.yaml b/Documentation/devicetree/bindings/riscv/anlogic.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..91b1526c99aa3ca9cc7b0e7978861408bd017049
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/anlogic.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/anlogic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Anlogic SoC-based boards
+
+maintainers:
+  - Junhui Liu <junhui.liu@pigmoral.tech>
+
+description:
+  Anlogic SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - milianke,mlkpai-fs01
+          - const: anlogic,dr1v90
+
+additionalProperties: true
+
+...

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
