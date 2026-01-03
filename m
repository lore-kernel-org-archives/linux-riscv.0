Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0890CFC6176
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 07:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HLc+cuQeOWIXWT+4VDUmW2vyJzGihAc/vPViUHAhCeY=; b=WQ/Sd4rdyf1PUh
	v9imS4e2oKfd6ps3zsOoUzoyEnuC7jT+O7qvzYfo+iWGL/IAFM8Z/uYQDrlbs89jVJrbTFHDC/dvh
	1Cuacjpcaww/huiFRsjp2K4mMxInMRrEONRoUMzS5Tf6F8nIRIdxVTnx2s+VxFOu/Dr+I4H89uy27
	QvxOQti3cv3PfUOn9sIMAzzE9lVRjQ4xYDoYUYNP+kqajDOzNq9z+/vwvN5jMMFybq2ir0xRwocnO
	AyqYCUbH1fPWdUaDrHixZiOPXrTjYKUFhO7q0xILiU8QcLEF8vPeBnfEp11Ydw7FTJ1iehsApmm06
	CahX+r8vQI4stUyTK/XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbwKS-000000094IA-3W3A;
	Sat, 03 Jan 2026 07:45:40 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbwKQ-000000094Hl-2REB
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 07:45:39 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 744C93410B9;
	Sat, 03 Jan 2026 07:45:31 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 03 Jan 2026 15:44:17 +0800
Subject: [PATCH v4 2/5] clk: spacemit: ccu_mix: add inverted enable gate
 clock
MIME-Version: 1.0
Message-Id: <20260103-k3-clk-v4-2-4cccba2360f0@gentoo.org>
References: <20260103-k3-clk-v4-0-4cccba2360f0@gentoo.org>
In-Reply-To: <20260103-k3-clk-v4-0-4cccba2360f0@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Haylen Chu <heylenay@4d2.org>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3259; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=ipL2B/NzInRqtMt2AU3bNhpY6GimKKXFXudISgvQy5c=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpWMkCC51BegXxeL4pfgn0B+4VTkn1GAXxLCDyv
 QI+vaPL+DeJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVjJAhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2QWw//Zq1tgDWX0cyN1zVp+4+M3qAN3sjCpEM66y1aBwL3XspW0Y44yJKA+
 7eRKq4baIX1nNFJotTknmt2gEWeSl4UpOfBRGR4HU0sZms2Fg7+fZ36fyR9znOjs9mO4zkkPCLr
 Kg9eO8kLxtQ8ViqrOLTqX/B0VWP2jWZSvBbLef+4fM9j6doPKRxNsqKvkfkD3NAQJI1fE7iArvs
 sE8x2NQxgtj8D2vY7f76oPx4XMrPLehQEr5eD69KojQHkv08ABFSl9UBTlaPg/hwQjj02f57m1y
 TYgy2glJ6i1nU0Hk1C+YHCWWyqibuC3j3BYvijETwQBlOcP+bDMH4ZdEvQ0O8/Iy/A4vk56GMaP
 Af582JlzjYVTJAzBbPIGzD2ifUt4Q0Hutp+rshQsuzHSiVyx6MqRBpRvYtfVYaOZ9SSTvio68uM
 Q402KHklwgIQ7UiqiHwcd83aOwYmIUf0yLF+4zk7Yvl04CvdAo7tg9tpmGH4QnVE5Q79rH7giCH
 Pqr0DPerjd0UZJ2ruvFJiL+bppO46ObffCsRSJDOGgDX+WiTKPGZ4XzrOP5VStTRWMic613OpED
 4YcmdPNt2p/tbEKy3slof/tOtr/2eT0b9WeKncSsCovlgjUDEOWWROEqNSQfBycGVLL1QqKpqQj
 AMLyAfQXpSP6DiFkpaJZ7zovj1H4/U=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_234538_745049_3DA26618 
X-CRM114-Status: GOOD (  12.20  )
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
index 67f8b12b4f5b..9578366e9746 100644
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
index c406508e3504..dbba9bf49b3b 100644
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
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
