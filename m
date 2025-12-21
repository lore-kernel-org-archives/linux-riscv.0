Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE341E66886
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Dec 2025 08:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIH5dNAloJZrm1pOSMFT365ZMtAdekb8yZyTID9H7jU=; b=uez9OBGV+rztQH
	E0VLP5GxlD+fXe3FvrxQF9kb2vBD6pxtjgkxvZ7qo4C1ZSWXTld2NOh/7rzRqBXiNgCFRRhtZgByY
	LbEkIa5tr0cIzhFepsvbmPaWm7ByhJy5sii5P1e1ti29uczmNkgJOs06E3HIo9kjrIf0IbFAeJQbe
	kEUO8bmMRFM4P3ZjuI75du84J66k2S7XmzZbysI0jCaodjisGPoiN7ppEDLfoslPmaaL16YvEB71O
	hkqTE6Y93vYWXVmQym3TDZyKHU4QN4bKSMke9pOZQcPJFXakLj67BVEqf/z88UKImXBCbUs1Rq8zq
	58OfCQmcNmuIF/9orq4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXEgb-0000000CFJx-48DR;
	Sun, 21 Dec 2025 08:21:05 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXEgZ-0000000CFJJ-20SM
	for linux-riscv@lists.infradead.org;
	Sun, 21 Dec 2025 08:21:04 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 65B60341083;
	Sun, 21 Dec 2025 08:20:55 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 21 Dec 2025 16:20:26 +0800
Subject: [PATCH 1/3] dt-bindings: mmc: spacemit,sdhci: add reset support
MIME-Version: 1.0
Message-Id: <20251221-07-k1-sdhci-reset-v1-1-6780af7fa6e7@gentoo.org>
References: <20251221-07-k1-sdhci-reset-v1-0-6780af7fa6e7@gentoo.org>
In-Reply-To: <20251221-07-k1-sdhci-reset-v1-0-6780af7fa6e7@gentoo.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1401; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=vEorWhnLPp7YW7ZFYoqUseTPIMHGtfA1RoynKxTuZgY=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpR63WXp1DZdTgz5ZeTce2A5ZzQyE+rrtOAkZ/u
 oLIpCmXWW6JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaUet1hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1j4Q//dmpM5t9BNfPvoXxmOFjwe8bV9ABJWEn2i9xJO3pv8ReJIhaHDtIr/
 reNUEaPgPDN+dOPwhQXxYyAfPv2MxKZcvUcjkVwomRU7y1nJSboEsBwoS0jCE3UuZecuWE76cgC
 72tNyaRzuuMVTmOH91VbDgRKolVrukvjN1nwci2l38uzWJ9zxPfmLC16ikTXZ6Yht0ieaxEnBBL
 +JqPOuX8KW3ZY2lRUmAwStJNBbXZWRTVDc++YocGE2hXZxCoM4PZM87iz6sqb87EIT7K1I2BGeZ
 LR2t5rXH14KwFJXBlc4DuQdalZKM4hZKLRj87oMgF1UO8vGVV++FADLal6k1ADWIRp+sty3hyrU
 Dp5aSqmMf5XPY4Jy6/pEbI9n421fG23lI5OD/P3kTz0oiZsfjCM3bC2zyLxsiN4MZtQ4yOEQYCw
 JuB6qVUOCKNvQ+AU8gj4ZMDiQ3XZ5CKKZfzkKeUMs+Y8ENl+yxtw4UHyjlqLQuJU7DVpQXPb4QX
 h3btfjDN22bWZ2kQ4SS+KN3PH1W/MdxGMoE9yiEQeARfor9ei5nuLKf8pL2BtE8uXblncQnnrpG
 Tax51Cpe5JdTP5sPiP5qhfmEiunzCR/Qjyf1Z62IRg+0gMwuWPRWozYXRz8ynnMoqJXHC+iNOKj
 BoZgNdOMQY2b78ts2pGflvonmG4hL8=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_002103_570036_4ED9D503 
X-CRM114-Status: UNSURE (   6.86  )
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

The SpacemiT SDHCI controller has two reset lines, one connect to AXI bus
which shared by all controllers, while another one connect to individual
controller separately.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
index 13d9382058fb..322c69b056f4 100644
--- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
@@ -32,12 +32,24 @@ properties:
       - const: core
       - const: io
 
+  resets:
+    items:
+      - description: axi reset, connect to AXI bus, shared by all controllers
+      - description: sdh reset, connect to individual controller separately
+
+  reset-names:
+    items:
+      - const: axi
+      - const: sdh
+
 required:
   - compatible
   - reg
   - interrupts
   - clocks
   - clock-names
+  - resets
+  - reset-names
 
 unevaluatedProperties: false
 
@@ -50,4 +62,6 @@ examples:
       interrupt-parent = <&plic>;
       clocks = <&clk_apmu 10>, <&clk_apmu 13>;
       clock-names = "core", "io";
+      resets = <&syscon_apmu 2>, <&syscon_apmu 5>;
+      reset-names = "axi", "sdh";
     };

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
