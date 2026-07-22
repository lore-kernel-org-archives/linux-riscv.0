Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFDDC44538
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 02:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9of0yvQFF48KIg9wewQ2F1oTVKCKG/eaGTaehCxEV8=; b=l/EnEf13/eB9w3
	PLM2Kf6DGKl5Sxr83tKa8LVfYk1dx7eBg/bXrxTg5z6HeRuy7BzFBW8o7Z9uyZa+iGItlZr37A4pX
	dCHMh5jdXW9p49YgEYA8cdyCJXGIc148SYKGxRMOjGUeiCtcjk1vAizjDORTz9AJkU3uQ6U/taPXq
	Htlh5AAWn2Tr2Wil7dGoMelrP7LuYXJnsKtWnaqSkbU5+ssEZMH1LCDOP7yC2bcmZcvo+cQQRl6Ux
	cQznLN8ZS9JsmVuBlZK/1jWOTVV8UfN8gY9fsqHObyPFuEYjLTiba40vZ+L+0Z1nG203vnD4i2UL/
	nguXOyBjWody5krgWbZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmMoz-0000000AlH4-0fvw;
	Wed, 22 Jul 2026 02:36:33 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmMow-0000000Al9p-02lH
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 02:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784687782;
	bh=ccX/tPMsliOTlQmj+dICa2vBwaEFrsSi28P1lesAFrI=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=wJ3x6P/neSL/ofYomSzX5bmRFAdK5tcCxezYq40iLv/qY4JMKK9S2UyNfk9tzA6Ca
	 YDrfEXAK9+6A3eCgvdbCOJyaI9hWSoll4svMuan4KGjcJKs9ev+oxcSt3/2Z8KJpb6
	 DuW0qgJkOZNS+fQ49BZN3otur6o69FghvkIEYUz8=
X-QQ-mid: zesmtpsz4t1784687780t10b780fb
X-QQ-Originating-IP: OfCdjE2/vGeRvdx3D7wLq6TTtSUMIjEd+5j7CBlmMRs=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 22 Jul 2026 10:36:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15532234414416572304
EX-QQ-RecipientCnt: 19
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 21 Jul 2026 19:35:55 -0700
Subject: [PATCH 1/3] ASoC: spacemit: rename clock inputs to match binding
MIME-Version: 1.0
Message-Id: <20260721-kx-i2s-dts-v1-1-d22cb6cfaab5@linux.spacemit.com>
References: <20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@linux.spacemit.com>
In-Reply-To: <20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2490;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=jrHvtJJjJw3mm1T9ySuHoE7AIwPO+62MWL9jFXLBJCk=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkJOjMufzjufNlfOofvx5x18UeU2gPFD38/8p7NNu71T
 amrO19c6ihlYRDjYpAVU2TpfsCzrcAnyrZAoNAXZg4rE8gQBi5OAZiIoyQjw1nrI9HXPpW9SdN1
 +jtBb7P57Oj9SWrGSyMjfjrXSOnue8Pwh+f+9KrWn5wXf7m7NtQUphh6PW5JOFcoHJrzskB2FX8
 ROwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NtKu8ZqGWm0vuJsXTKHf8doojgNBYJyNQpalh0CQvKZl/Klx9H3sVojG
	0gRVo5vMH7B9wHcTpDvQT7gLTnxRw9aKEshbuQXdL/dgCZb8ee+AChovUPJmGoEsYRXOCLc
	rjf4I8tF7M8pgynz6bGOo/r4PQRSkhH9i1BVI/+GPfUvWvX/pm6BNRzpdKh/nHQxR7V/aAm
	R1NxY0tHPahV0WbATVCQvueq+7JGHJ+/RSpUL+QxI4etNQH9BKrgBuIzvmH8fUn4KQ/t1Dr
	fdCw3k2jTEZSn2DmzqTnxIemPOB0g0lEXEhSnSePDn0cla6qfrqVImPRpyS2S8Q5RLABlKl
	HIB20taOdars2Zj4vWNZhnCtkQ3ldo6FXUBsG00J7IE83S1eyrULTXiscdluD4mJ7QlvgBh
	THZdJkRauqP+Rl4wmcN+p7yrGXr9WyI3VPGB9l2+qT2Ak2ZnpH2Fnrk2aM44Xfxfj52uAxp
	+QyO/U3dS1KDbrrOlIgJSCc9gVcauiqXuCjI4NU/P6BkMtW24bDUSGVQJnwpYRl3G65sv1U
	YaAIgXPH42RBDoJU7Lt3FgX2cE/3v3nZcDSm96bXhGlLHrj/1YG+IWIO5AnhlnFHPSPEKNL
	Z41eG0NlKOt6ws+RqiGsTrxxHIqpzIgcqrLrkuvTa3uS+J7j8QF8XZFF37lWJ9k7qlrn/KX
	iCGTJFjXwwBxrAVaRIrn6nfR1CIaP8NYLsrDdNk4pOVuIOKXkNwGLXvB9+tauBNc7zCcu9r
	bgVteq6QgPUTTzzW+GYh4+stuIpd2qreNQ7JWVPKM+gmNPLRvBO8jV/ojp6MLvgDt2CjFPD
	P/sif+TASHkxDTDqYoE4sxk9V1YVlDUJl0mdKLBl0hL7yA7jP4fUReGh71Vi7ZWaLaBP0lm
	OJGsKQ6qzhZGIw9fvjgSp/jNYcQxs4fq6kb+idRRrz3lULtiUHgGqBOlLBtfuyy9zg1qBTk
	0sc5JLEytyQpcT25HLpJcy7F7/UO9e3DXgVD3BpWWwdsqBolmWA1gTNnTOVNu8Ep4T6Bg9C
	ZDPIUFfsgGgOfIQurDIqULSDgsQLd1eBfoTj7fbCValvnCSKy+tROH0u0qOFnAjRnxYPWbL
	XqH3Rzz3sjCvHPGK8qZYpDilKJYW3cI8k7DleQAaL4bVhb8AzC+jPbfzF8M5oXRrw0GrsCd
	R6bZ9G4tGFRUMNRYlfSJW5/7pRaKqbIKIJbK
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_193630_771808_D08282C6 
X-CRM114-Status: GOOD (  13.31  )
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

The driver requests the per-controller SSPA bus and functional clocks
as "sspa_bus" and "sspa", but the device tree binding (spacemit,k1-i2s)
specifies them as "bus" and "func". As a result, any DT written against
the published binding fails to probe.

There are currently no in-tree DT users referencing these names, so
rename the clock inputs in the driver to match the binding rather than
changing the binding. While at it, rename the matching struct member
sspa_clk to func_clk for consistency with the new clock-names.

Fixes: fce217449075 ("ASoC: spacemit: add i2s support for K1 SoC")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 sound/soc/spacemit/k1_i2s.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 8871fc15b29c..4247d8d3a637 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -52,7 +52,7 @@ struct spacemit_i2s_dev {
 
 	struct clk *sysclk;
 	struct clk *bclk;
-	struct clk *sspa_clk;
+	struct clk *func_clk;
 	struct clk *sysclk_div;
 	struct clk *c_sysclk;
 	struct clk *c_bclk;
@@ -221,7 +221,7 @@ static int spacemit_i2s_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		return ret;
 
-	return clk_set_rate(i2s->sspa_clk, bclk_rate);
+	return clk_set_rate(i2s->func_clk, bclk_rate);
 }
 
 static int spacemit_i2s_set_sysclk(struct snd_soc_dai *cpu_dai, int clk_id,
@@ -445,14 +445,14 @@ static int spacemit_i2s_probe(struct platform_device *pdev)
 	if (IS_ERR(i2s->bclk))
 		return dev_err_probe(i2s->dev, PTR_ERR(i2s->bclk), "failed to enable bit clock\n");
 
-	clk = devm_clk_get_enabled(i2s->dev, "sspa_bus");
+	clk = devm_clk_get_enabled(i2s->dev, "bus");
 	if (IS_ERR(clk))
-		return dev_err_probe(i2s->dev, PTR_ERR(clk), "failed to enable sspa_bus clock\n");
+		return dev_err_probe(i2s->dev, PTR_ERR(clk), "failed to enable bus clock\n");
 
-	i2s->sspa_clk = devm_clk_get_enabled(i2s->dev, "sspa");
-	if (IS_ERR(i2s->sspa_clk))
-		return dev_err_probe(i2s->dev, PTR_ERR(i2s->sspa_clk),
-				     "failed to enable sspa clock\n");
+	i2s->func_clk = devm_clk_get_enabled(i2s->dev, "func");
+	if (IS_ERR(i2s->func_clk))
+		return dev_err_probe(i2s->dev, PTR_ERR(i2s->func_clk),
+				     "failed to enable func clock\n");
 
 	i2s->sysclk_div = devm_clk_get_optional_enabled(i2s->dev, "sysclk_div");
 	if (IS_ERR(i2s->sysclk_div))

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
