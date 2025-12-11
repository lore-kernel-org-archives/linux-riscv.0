Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48069D3E787
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Dec 2025 01:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a4NsvhI+oD+6S4PkEv942cvu6/OFfDJ/OjdHLTH0oaI=; b=DgHvYchlDqrBFl
	9/ZkjBRp1o4DCoMuLE3tlCMFGs3NBEauI0Yl0eOIOjsW41eCUg6dN4XaecU9dgcD3drGnGcDkOipx
	0oMda2XDQ9hXU+T5pBs9Ke6AXnIFf3+j+fqOn+hWmoc3zCMr8PbOTS4IM9KtkCpQ1i+Q+JKk2Yqns
	NRMxEPCz87We0tEUexAxSXJiti49kClMOV5ZqlAzKc2lHvh1BeciQCaJzS19a4b+oj/yMthD9acZa
	uuSwISB8hHPvjGNj8FLeWxhP2fqm0vS6S8K+pPdgRwCQ6EvvGmkDKG4eY89YkF0klwgPSpihCU4qc
	mbEFnsP1ieOsyKSAIqcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVMQ-0000000G3ar-0h80;
	Thu, 11 Dec 2025 01:20:50 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVMO-0000000G3Zo-0mgv
	for linux-riscv@lists.infradead.org;
	Thu, 11 Dec 2025 01:20:49 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id DE442340D4A;
	Thu, 11 Dec 2025 01:20:42 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 11 Dec 2025 09:19:42 +0800
Subject: [PATCH RFC 2/4] clk: spacemit: ccu_mix: add inverted enable gate
 clock
MIME-Version: 1.0
Message-Id: <20251211-k3-clk-v1-2-8ee47c70c5bc@gentoo.org>
References: <20251211-k3-clk-v1-0-8ee47c70c5bc@gentoo.org>
In-Reply-To: <20251211-k3-clk-v1-0-8ee47c70c5bc@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Haylen Chu <heylenay@4d2.org>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3259; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=z0ZgybaynQikg009OHl+uzvyamuWc/NqSoIjZV4jmnI=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpOhxY8P9XtfuKZFnfAmWEln3d3oL1AMPO+pGyW
 RWDCyiz7e+JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaTocWBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3Ygw/8C8l2Q2t/zWgnPHCYvRyse+6XhTdzqmpPDqgX3VpKpz+BbDaDP5aUA
 6W9OZ0qQDkgp+3nKD2LDr5Ov1MYjaActhTSF7HNbzaJlNN5zqttZtrbdJTyMvXd7SxfVWOfvyS3
 6Q0Gn2jZgtt3My111ahdeBHn8Mdn0YCPAvk8vjqUo+kDBkipG6N0nfacbnWZK36kZPX9C21u+C4
 5j/zkfIjglDNN+I5rh7zA913YDzxQAeDFjd+3HalvG9Lns/SlXbnqarevxKc6sMM2hiYc7ocexW
 eGLaEHwUT+3Q4/N7ADmVAb4tXUOj9qVewFAgW19yTtCgul7RrkUJ4NyWsGhG1qM88q+IFkgLGWS
 4JOTJFxpOlMB97bxebcIfZf/ufdK8WrWgihsirElShnaf+USljwUCrNVxZZfs1KOnpAn+jtyFsj
 WQYE6vQZfRJz6nSfq8KpCRbfEY6idrmpv7/TzEJ0ovM2lHE886g1T5ubTkCpczXuZupnH28lFJs
 z9/dAK5C/A/lfNpJlBaJctjHixcGvjc3lONFjbsvymQSG0qth4bgQzj6K9eXMibs/syT+HT4xwS
 DNEqN3uwlVD/+k0x9w/IdCfB5k61AqjTExWYnYt1ONgh3+pATROOFjPDq/y1TIoThejaeKteZTq
 fdaboaP3ZBn1zQngI61MBW0XkHBLWg=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_172048_262853_97930B56 
X-CRM114-Status: GOOD (  11.87  )
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

K3 SoC has the clock IP which support to write value 0 for enabling the
clock, while write 1 for disabling it, thus the enable BIT is inverted.
So, introduce a flag to support the inverted gate clock.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/clk/spacemit/ccu_mix.c | 12 ++++++++----
 drivers/clk/spacemit/ccu_mix.h | 12 ++++++++++++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
index 7b7990875372..14fbf7048c89 100644
--- a/drivers/clk/spacemit/ccu_mix.c
+++ b/drivers/clk/spacemit/ccu_mix.c
@@ -16,17 +16,19 @@
 static void ccu_gate_disable(struct clk_hw *hw)
 {
 	struct ccu_mix *mix = hw_to_ccu_mix(hw);
+	struct ccu_gate_config *gate = &mix->gate;
+	u32 val = gate->inverted ? gate->mask : 0;
 
-	ccu_update(&mix->common, ctrl, mix->gate.mask, 0);
+	ccu_update(&mix->common, ctrl, gate->mask, val);
 }
 
 static int ccu_gate_enable(struct clk_hw *hw)
 {
 	struct ccu_mix *mix = hw_to_ccu_mix(hw);
 	struct ccu_gate_config *gate = &mix->gate;
+	u32 val = gate->inverted ? 0 : gate->mask;
 
-	ccu_update(&mix->common, ctrl, gate->mask, gate->mask);
-
+	ccu_update(&mix->common, ctrl, gate->mask, val);
 	return 0;
 }
 
@@ -34,8 +36,10 @@ static int ccu_gate_is_enabled(struct clk_hw *hw)
 {
 	struct ccu_mix *mix = hw_to_ccu_mix(hw);
 	struct ccu_gate_config *gate = &mix->gate;
+	u32 tmp = ccu_read(&mix->common, ctrl) & gate->mask;
+	u32 val = gate->inverted ? 0 : gate->mask;
 
-	return (ccu_read(&mix->common, ctrl) & gate->mask) == gate->mask;
+	return !!(tmp == val);
 }
 
 static unsigned long ccu_factor_recalc_rate(struct clk_hw *hw,
diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
index 54d40cd39b27..8a70cf151461 100644
--- a/drivers/clk/spacemit/ccu_mix.h
+++ b/drivers/clk/spacemit/ccu_mix.h
@@ -16,9 +16,11 @@
  *
  * @mask:	Mask to enable the gate. Some clocks may have more than one bit
  *		set in this field.
+ * @inverted:	Enable bit is inverted, 1 - disable clock, 0 - enable clock
  */
 struct ccu_gate_config {
 	u32 mask;
+	bool inverted;
 };
 
 struct ccu_factor_config {
@@ -48,6 +50,7 @@ struct ccu_mix {
 #define CCU_FACTOR_INIT(_div, _mul)	{ .div = _div, .mul = _mul }
 #define CCU_MUX_INIT(_shift, _width)	{ .shift = _shift, .width = _width }
 #define CCU_DIV_INIT(_shift, _width)	{ .shift = _shift, .width = _width }
+#define CCU_GATE_FLAGS_INIT(_mask, _inverted)	{ .mask = _mask, .inverted = _inverted }
 
 #define CCU_PARENT_HW(_parent)		{ .hw = &_parent.common.hw }
 #define CCU_PARENT_NAME(_name)		{ .fw_name = #_name }
@@ -101,6 +104,15 @@ static struct ccu_mix _name = {							\
 	}									\
 }
 
+#define CCU_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _inverted, _flags)		\
+static struct ccu_mix _name = {							\
+	.gate	= CCU_GATE_FLAGS_INIT(_mask_gate, _inverted),			\
+	.common	= {								\
+		.reg_ctrl	= _reg_ctrl,					\
+		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_gate_ops, _flags),	\
+	}									\
+}
+
 #define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
 			       _mul, _flags)					\
 static struct ccu_mix _name = {							\

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
