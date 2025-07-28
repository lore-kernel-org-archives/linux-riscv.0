Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F22C87FC9
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 14:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ratYZZbu5uG/m/sBriBo6QuadvMOs8Nap8PAY35Vnk=; b=g94YZcctbAjjjb
	2verfMvL0wqxnEXvLbHK7JdmulE/6mVw24GKSTGkcKSLI/RCMuWIrtgnmvgabxO8PWGnFbRPdn501
	afGgXi1lL/Qan5+7rK0HmrU0srN8ZnF9wNI6AmJYsEqlQ1LLVOwAUD7AP1G3yEmR8DanJI3LEYbaH
	1nNhE++bMUtxFhWEdw5w4KRIP9Tnu5GitVb+q0LGAOP5/4RFaOZHHiLzI0H1X4ARCzxaGeI+8AKTa
	8S3xsIelJnCWKKSA/RMFO369WhkTHDIF83pj0Io4iw78zJ1lusRfkOT3kU3TZNIuxFT+edn3VsfpV
	iY4xNAWJ8jvxWKFzuaPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOpQ-0000000Efrz-3MB4;
	Mon, 28 Jul 2025 14:27:48 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOik-0000000Eexf-1hRa
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 14:20:55 +0000
Received: by mail-qt1-x843.google.com with SMTP id d75a77b69052e-4ab82eb33f9so75875161cf.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 07:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753712453; x=1754317253; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwpHZPpXI0p0rDKtDHDqYa7tblu6wTfxnrUTp9ZaScY=;
        b=ZsQ1eLzsPYy5UEVITpAPk+y8PqcRCMdogsHEOSn1KOB9leA5zmkqBh4sQoHnWCIDR2
         mIOmwaC9tqnt6oYNGTTccg0WU2GrDCtVTGUVp8ueg7mOJHaTjhIcn3ns9jg7GzMq3vq9
         HdUlUqpULC53ot1H8PopTPnZDrZQNHHHQw2nWctjjN7S9OPKuzMe9Z15/ln8jWvS+EFD
         97Yboiwk9VldlU7cIql8tffsiaO+f2y1BkjAFBVu/zOdMg2TT+nW1KO07GUaqHFQuLvZ
         WHhEpSM5NKrVBlI83wt7CSUTi9x9ef8d+og5ykW1qskx0jOPQ/VzKzjiV6yVd/Dc+QjO
         473Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753712453; x=1754317253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwpHZPpXI0p0rDKtDHDqYa7tblu6wTfxnrUTp9ZaScY=;
        b=DPFcAm8W+BO1GNQkaAmS6ecWkZIM17nbOVGHQs+ooqcPBqmXCjyCtA9BS0B3w/okYD
         jV8txdaHWbDFnsvARVi6VAel77U9ereM6JEULsaR1+vMeVEZUmm+rYq7R2scRx+u9bT4
         6rMMvZ4Vf/QSsiLQ+qJiDllW6jDCKdXK0dxCzU/9/wRP2armUS8kob8RyR8JyY67HIJS
         iJA3MwQYAwtYyYR2HJWvN2BIJS98fxpwrYawfTpx+MAfFBl5+mSUo5of/BA1bBU2mvYk
         21lO991gEhP8rem6p91n4U5nyDoKQCrK2awESwwPjJl5samoiIck8on8SJXqPUbyK6PH
         re5g==
X-Forwarded-Encrypted: i=1; AJvYcCWtaaRDql2/tp1kMMOUt6XHQzpod8Q/rCYJELn6dfSKQSzwX3JwH4Gq4agxM76J9ElR6yVU+QzAiO2gEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTs2W3wHOg7mFSKPAEMEFpL6uQHP+DnEvuS9BVbyYYlEelxLap
	b+hNcpNO/J1bXoP8zASrkc8bi2i4z9pY6E2x5BkZGVfrKpT8Bc3+DeocK6c91R/nnF6p0w==
X-Gm-Gg: ASbGnct+/kHRAlODkbVU+66tt8v248KWNJv+mIwN9VE5qOrJAUgrRzzu9IPFWyatgVO
	8b02cPLa/VXn3gIeMuBferdIokv2SR6Fd1MJLRYpir0y0G6ce6nzEv6QOIY1CzFQ3mgXUUf/0Zc
	OAgubPoAMx9bTThvJpAKSRPWbiWUWnuiI//SED5WlVRxqAnnOJtejSn6V0AWx0PWYhBE5LdZk2x
	OJA88SpZZp4JUQrWPAKnD0NcXjeMtLQyKuvW+a5XNi+FbUTb1mgkfMLitu9tI41zTrdypVd/om4
	bN9kmuFgf/lpOPmKcjiJWcvNjkKmrXXchKmw7M9dNpSTig1Dv+gVlr9TfbM66h0+XS1AHEGbpOP
	GKfNxeDsLssJfcEuRkENUDUBYYiLIZtWJ
X-Google-Smtp-Source: AGHT+IGNkNTYdf6BLasYK8+uoS65PqFGHaWC/DpiGuyNp2KNVMbN6+x1bh6pNoVy9S9XOmC8dksPIw==
X-Received: by 2002:a05:6a00:1a8c:b0:746:24c9:c92e with SMTP id d2e1a72fcca58-76332b4ffe8mr20182948b3a.8.1753712440665;
        Mon, 28 Jul 2025 07:20:40 -0700 (PDT)
Received: from localhost ([2408:8256:2284:4127:de49:6dc9:a446:157a])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-768faf4bb9asm893691b3a.132.2025.07.28.07.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 07:20:40 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 28 Jul 2025 22:20:16 +0800
Subject: [PATCH v3 2/2] clk: spacemit: fix sspax_clk
MIME-Version: 1.0
Message-Id: <20250728-k1-clk-i2s-v3-2-5d7579f02227@linux.spacemit.com>
References: <20250728-k1-clk-i2s-v3-0-5d7579f02227@linux.spacemit.com>
In-Reply-To: <20250728-k1-clk-i2s-v3-0-5d7579f02227@linux.spacemit.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Yao Zi <ziyao@disroot.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753712415; l=2875;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=uvU3LuSqoqO9vOKX5HTH0ipYicugJ67Oj+k5+VRnS3M=;
 b=RwJKdnLixQKy07JYdGH7iFd0nnjBb6RbhYTaUrhC1Qraje6WyuilaOhHmgkWSnYvZDzbRCoeZ
 d8+uAlhTgKBAJoi9L54Y7Y3XNDmjaIt5i8vUIYspoyyyo0431qObHps
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_072054_448553_10A8E3CE 
X-CRM114-Status: GOOD (  10.57  )
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

Hardware Requirement:
When FNCLKSEL in APBC_SSPAX_CLK_RST is set to 7 (3'b111),
BIT3 must be set to 1 for the SSPAx parent clock to be I2S_BCLK.

This patch introduces SSPAx_I2S_BCLK as a virtual gate to enable BIT3.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Suggested-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/spacemit/ccu-k1.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index cdde37a0523537c2f436e481ae8d6ec5a581b87e..24a561499a7c11b6a661c026f0bd2fac28fe7b04 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -349,7 +349,10 @@ CCU_GATE_DEFINE(aib_clk, CCU_PARENT_NAME(vctcxo_24m), APBC_AIB_CLK_RST, BIT(1),
 
 CCU_GATE_DEFINE(onewire_clk, CCU_PARENT_NAME(vctcxo_24m), APBC_ONEWIRE_CLK_RST, BIT(1), 0);
 
-static const struct clk_parent_data sspa_parents[] = {
+CCU_GATE_DEFINE(sspa0_i2s_bclk, CCU_PARENT_HW(i2s_bclk), APBC_SSPA0_CLK_RST, BIT(3), 0);
+CCU_GATE_DEFINE(sspa1_i2s_bclk, CCU_PARENT_HW(i2s_bclk), APBC_SSPA1_CLK_RST, BIT(3), 0);
+
+static const struct clk_parent_data sspa0_parents[] = {
 	CCU_PARENT_HW(pll1_d384_6p4),
 	CCU_PARENT_HW(pll1_d192_12p8),
 	CCU_PARENT_HW(pll1_d96_25p6),
@@ -357,10 +360,22 @@ static const struct clk_parent_data sspa_parents[] = {
 	CCU_PARENT_HW(pll1_d768_3p2),
 	CCU_PARENT_HW(pll1_d1536_1p6),
 	CCU_PARENT_HW(pll1_d3072_0p8),
-	CCU_PARENT_HW(i2s_bclk),
+	CCU_PARENT_HW(sspa0_i2s_bclk),
 };
-CCU_MUX_GATE_DEFINE(sspa0_clk, sspa_parents, APBC_SSPA0_CLK_RST, 4, 3, BIT(1), 0);
-CCU_MUX_GATE_DEFINE(sspa1_clk, sspa_parents, APBC_SSPA1_CLK_RST, 4, 3, BIT(1), 0);
+CCU_MUX_GATE_DEFINE(sspa0_clk, sspa0_parents, APBC_SSPA0_CLK_RST, 4, 3, BIT(1), 0);
+
+static const struct clk_parent_data sspa1_parents[] = {
+	CCU_PARENT_HW(pll1_d384_6p4),
+	CCU_PARENT_HW(pll1_d192_12p8),
+	CCU_PARENT_HW(pll1_d96_25p6),
+	CCU_PARENT_HW(pll1_d48_51p2),
+	CCU_PARENT_HW(pll1_d768_3p2),
+	CCU_PARENT_HW(pll1_d1536_1p6),
+	CCU_PARENT_HW(pll1_d3072_0p8),
+	CCU_PARENT_HW(sspa1_i2s_bclk),
+};
+CCU_MUX_GATE_DEFINE(sspa1_clk, sspa1_parents, APBC_SSPA1_CLK_RST, 4, 3, BIT(1), 0);
+
 CCU_GATE_DEFINE(dro_clk, CCU_PARENT_HW(apb_clk), APBC_DRO_CLK_RST, BIT(1), 0);
 CCU_GATE_DEFINE(ir_clk, CCU_PARENT_HW(apb_clk), APBC_IR_CLK_RST, BIT(1), 0);
 CCU_GATE_DEFINE(tsen_clk, CCU_PARENT_HW(apb_clk), APBC_TSEN_CLK_RST, BIT(1), 0);
@@ -965,6 +980,8 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 	[CLK_SSPA1_BUS]		= &sspa1_bus_clk.common.hw,
 	[CLK_TSEN_BUS]		= &tsen_bus_clk.common.hw,
 	[CLK_IPC_AP2AUD_BUS]	= &ipc_ap2aud_bus_clk.common.hw,
+	[CLK_SSPA0_I2S_BCLK]	= &sspa0_i2s_bclk.common.hw,
+	[CLK_SSPA1_I2S_BCLK]	= &sspa1_i2s_bclk.common.hw,
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {

-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
