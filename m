Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001EECA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 15:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MToxRO4ON03vSna5G2YGkTwPFvJnDqmEX1JvAxq745A=; b=XOWIcfmkREFzhZ
	hAifAG3cnfT3WMTbJ9P5oiJrpEpFLMvPdSSKvCKsKuzhN0SWMq77HdLaOQdK94VtPjlawVM1R1E2k
	9keDuCsTmR03brZ+qlpZCdWh6KNqVR52GvO4Ji59SeCNhvg0IO+WgfDtQ1q/Qq8o6wo+8Xz/FYUXX
	VSQxjKRmhF2AK2hQkyXp6CnhvD+fZgtDZ62SQJL8FeD5FOJjTKnZLDPrb9JU4Ao3b+mexQHc2WDrc
	6XbJBbY91/Pw6cEssO71Kl5cFhrNP59974+GK9YbkFhGIVfvcfapCtm1vLHZwWduzoGnVQ/WnayHn
	6bhg5CaztC3b7hqnFPGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUkw-00000008G1V-2TpP;
	Mon, 11 Aug 2025 15:48:14 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulT9n-00000007wjH-0Qua
	for linux-riscv@lists.infradead.org;
	Mon, 11 Aug 2025 14:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1754921088;
	bh=wb4h/OzfiqKCugrfopSTO9j+qCnAteCd8FPyFMBUIrg=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=C6mJcCBpgXhjJjyD2l5zTKkJ1QL0C2txMWf9zGGJwiraEgwYNnpghZ/KWWeqx5pnc
	 P3UhowpGvBN14kOcRR8eAOF8POfZCINEQy+umomZrpV6xVuzOaEN2wTul6IB9Y6jbb
	 ifKJj8sLDATW7hOort+U3gtTuGP1ND4DwzxVYpZU=
X-QQ-mid: zesmtpip3t1754921086t50d3704e
X-QQ-Originating-IP: JMkenniBoL8H4OuTkxR7yA/i0LlRFQMennh9ZMVZn1g=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 11 Aug 2025 22:04:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14415561950656257543
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 11 Aug 2025 22:04:29 +0800
Subject: [PATCH v2 3/4] clk: spacemit: introduce factor for div clock
MIME-Version: 1.0
Message-Id: <20250811-k1-clk-i2s-generation-v2-3-e4d3ec268b7a@linux.spacemit.com>
References: <20250811-k1-clk-i2s-generation-v2-0-e4d3ec268b7a@linux.spacemit.com>
In-Reply-To: <20250811-k1-clk-i2s-generation-v2-0-e4d3ec268b7a@linux.spacemit.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 Inochi Amaoto <inochiama@outlook.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754921074; l=2765;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=i8wU+l87tRxkjkfc5X201U4kzijJu18Cxdb+J92Erc8=;
 b=5bYOJwOIPnJ/yb9gowQbTXUnpNhSF41jaer7Ec5uqwQ4SUs2RhfWuZYmkUBZV0RJlUF22yTdI
 f9QrHsd/QeiAx6X4tRJQwIKyGruc31IuNhBS+tahC7EoeXzknkZDTIm
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NyuFfSM9ChgrT1yIuhWvS+M6+ZlcO9tYdYhngS7topZInATBONkLl/2+
	utsX4K1Mz1ibQMRRDXWvsWO2eOPGrbG3mxaBKCYgMrN7FEJqkmsS+MRMVgK2J1he6lB8e/R
	on6OC2HuYqKhZRK3koQPW/nnGpoC201LZTcpQ2YUWXS5qP/C/wM2t7knIfwjo5oLiTf/ZvC
	y47wcohxkIt6gnKZ4PyL6lG+YI1/uI2LhQ8EO61DeqV00S3zKlym0DIM9LDLDNPY8wV87IQ
	j304ek7cQh5zeQthgzbURj3CkqPWqCSF/e/5KvrsfIbbaMiQ5hpAI67/RC1VrwMQO4w6kph
	+F/0U9BabljqX1jhEu48WzSP2ULIp8FM6M9bukDClBqBlAD/bdC+EoY/xAaZYUfmTrLapC5
	ew0nctPUNWB6g5QhQtjj9nIWmVgxV+QNNKnEM99rBQ3QYWeXB+cJ7OZRkvFBF3IXT5GwJLY
	xjeUkt76F6DoxeWyZCNVVOW9PxyL9XSy3YjUme+CuL96v6bhc+AgBLa1XbR0nv7txQsqVD0
	9lLt4/ao7bpXfOU68RReuORYUbfOZpLR2wsnDCyW2mH9+F3zvQWSiSW1/ddYjAu4DMdKja/
	dCEGYifZB5QbtSBBebYKvEmckJhCCI9Sgl9iJ5LJQ5O4wM+fT9uDqX+VDAmjFMn0OWLodPG
	hKI0Qyttcmo/ttqIAdpgRBM+1vLt3AXodg7PTWW5oAe3ma4oMogMFflRp24kA4i5Vyxi22S
	ndwALjvKNAm3d7BN7SEWqMhg3emwIRUayGpCdXLEpdktmYgL7TH4L0Ln/RtDRtY5B+giZfG
	qO5r8HADEic0zS3kdc0XeZ6xgfLQTleGrHGJGFLrSwb4r4DM5p39cwDUyH6xOGAIgWcAZA5
	99JOBUSSuZOs+4mwn+fMPgHWhJJGwtxsSOIVqjTf3j8zpBPjcUOVnUEEN2lTfMElErFFdCN
	CDrcSiA3wLq8kcq+tm/a0r+RHBwyKZykeoR0sd3t8JHHnx3hJ1LQ0LwdRIJ9MRsN5yqvKPD
	YBSiO8zD6JfHdg63FckjFryAThsTYoZidBrQbOTspysUuTralZrpWlYWhfKKWqJ3T3CEn+L
	NR1/JmqF5J0qARim2mZk7XU+uO0i2ZLPME2OFUS6xn7EjaqpWdzJz1EnsgM9oXTUQ==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_070547_410879_546019BD 
X-CRM114-Status: GOOD (  13.13  )
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

From the definition of register, The i2s_bclk is a non-linear,
discrete divider clock.

The following table shows the correspondence between index
and frequency division coefficients:

| index |  div  |
|-------|-------|
|   0   |   2   |
|   1   |   4   |
|   2   |   6   |
|   3   |   8   |

But from a software perspective and this table, dividing the
actual div value by 2 is sufficient to obtain a continuous
divider clock.

Rather than introducing a new clock type to handle this case,
a factor parameter has been added to CCU_DIV_GATE_DEFINE.

Suggested-by: Haylen Chu <heylenay@4d2.org>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu_mix.c | 7 ++++++-
 drivers/clk/spacemit/ccu_mix.h | 4 +++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
index 9b852aa61f78aed5256bfe6fc3b01932d6db6256..dbd2cf234bf81d8e110b19868ff9af7373e2ab55 100644
--- a/drivers/clk/spacemit/ccu_mix.c
+++ b/drivers/clk/spacemit/ccu_mix.c
@@ -56,7 +56,10 @@ static unsigned long ccu_div_recalc_rate(struct clk_hw *hw,
 	val = ccu_read(&mix->common, ctrl) >> div->shift;
 	val &= (1 << div->width) - 1;
 
-	return divider_recalc_rate(hw, parent_rate, val, NULL, 0, div->width);
+	if (!div->factor)
+		return divider_recalc_rate(hw, parent_rate, val, NULL, 0, div->width);
+
+	return divider_recalc_rate(hw, parent_rate, val, NULL, 0, div->width) / div->factor;
 }
 
 /*
@@ -115,6 +118,8 @@ ccu_mix_calc_best_rate(struct clk_hw *hw, unsigned long rate,
 
 		for (int j = 1; j <= div_max; j++) {
 			unsigned long tmp = DIV_ROUND_CLOSEST_ULL(parent_rate, j);
+			if (mix->div.factor)
+				tmp /= mix->div.factor;
 
 			if (abs(tmp - rate) < abs(best_rate - rate)) {
 				best_rate = tmp;
diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
index 54d40cd39b2752260f57d2a96eb8d3eed8116ecd..7dd00d24ec4b1dab70663b9cb7b9ebb02abeaecb 100644
--- a/drivers/clk/spacemit/ccu_mix.h
+++ b/drivers/clk/spacemit/ccu_mix.h
@@ -34,6 +34,7 @@ struct ccu_mux_config {
 struct ccu_div_config {
 	u8 shift;
 	u8 width;
+	unsigned int factor;
 };
 
 struct ccu_mix {
@@ -130,10 +131,11 @@ static struct ccu_mix _name = {							\
 }
 
 #define CCU_DIV_GATE_DEFINE(_name, _parent, _reg_ctrl, _shift, _width,		\
-			    _mask_gate,	_flags)					\
+			    _mask_gate,	_factor, _flags)			\
 static struct ccu_mix _name = {							\
 	.gate	= CCU_GATE_INIT(_mask_gate),					\
 	.div	= CCU_DIV_INIT(_shift, _width),					\
+	.div.factor = _factor,						\
 	.common = {								\
 		.reg_ctrl	= _reg_ctrl,					\
 		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_div_gate_ops,	\

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
