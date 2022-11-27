Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E574EC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 13:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ZmmFQ7qfgU4uLrrE/oZo23aG1jSFezI6VKvw7BokUs=; b=c97SaZGV9Ce6xN
	Xr4esc4YagNLoBnnHHQM4aTWwI2p0N72emTeZHr9wdF9iMYl6y/KLn7eEOFCeeoOYOo2t+B6NqIvy
	/Ma+9yXpA4HqrX/0NQ10+wwtvlUO8E5/vPMoSokzUFpPt5cwgivkaxuC/5fTE3VWjBsfcLFFlI73n
	By4fJXVIQRmy5M80CI6TPgEJtHPjN1CLSUMyzOZAbcykKgqFXaVoPo+h/EYVcZpfTOd51H4Xvi6DT
	rvsgvYt3Q88HL1hZzGaycsRizt/KEy5qwzQzOvPCApoaRp/qFscK2jmNta06qqUh3HRH719DoZoND
	xWLTEv4y/qXjuWD2scfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozHoC-00BPqQ-P1; Sun, 27 Nov 2022 13:35:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozHo9-00BPnq-3u
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 13:34:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7467D60DD7;
	Sun, 27 Nov 2022 13:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3B1C433D6;
	Sun, 27 Nov 2022 13:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669556095;
	bh=vsfhkLiCJ/68w3F/Z2fdmD7dgsK7LenaTlTpgKiTus0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WlFi7+4qvrBNTSUWn/wtTQuEOiQ8s4JGT8QOEF04LktK9zhANGrRXgt4UtKDmOrIP
	 hEQXHqEzDw4t3GoWplQ5g9usmGltjS8L9QicxYm5JbTPp8vwshdpVLd/BQmzp070/T
	 WSwgblpm5xMW+SNyEXi4LI1ZEGzUqyYZUp4iXAxaKAb2p2de951qDERF8H91qkTVIW
	 w7NTlFZxB1YxcMlySXBcmVnAYISDz3EdeVuYW7eZxOUN+Zvcp+iIUQZ12eh4pp6J0g
	 YzTXJy7W/hU8uK6/gG1GI0OiKAiGjsRCm0Oug4d6NTm3rt+DFQkNWy4n0AkVXBkojJ
	 hglbN1EQcqnig==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v2 5/9] dt-bindings: riscv: Add bouffalolab bl808 board compatibles
Date: Sun, 27 Nov 2022 21:24:44 +0800
Message-Id: <20221127132448.4034-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221127132448.4034-1-jszhang@kernel.org>
References: <20221127132448.4034-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_053457_217791_1EF05C02 
X-CRM114-Status: GOOD (  12.04  )
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

Several SoMs and boards are available that feature the Bouffalolab
bl808 SoC. Document the compatible strings.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../bindings/riscv/bouffalolab.yaml           | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/bouffalolab.yaml

diff --git a/Documentation/devicetree/bindings/riscv/bouffalolab.yaml b/Documentation/devicetree/bindings/riscv/bouffalolab.yaml
new file mode 100644
index 000000000000..91ca9dbdc798
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/bouffalolab.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/bouffalolab.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bouffalo Lab Technology SoC-based boards
+
+maintainers:
+  - Jisheng Zhang <jszhang@kernel.org>
+
+description:
+  Bouffalo Lab Technology SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: Sipeed M1s SoM:
+        items:
+          - const: sipeed,m1s
+          - const: bouffalolab,bl808
+
+      - description: Carrier boards for the Sipeed M1s SoM:
+        items:
+          - enum:
+              - sipeed,m1s-dock
+          - const: sipeed,m1s
+          - const: bouffalolab,bl808
+
+additionalProperties: true
+
+...
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
