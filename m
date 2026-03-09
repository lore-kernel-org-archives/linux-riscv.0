Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5489EEFCD9A
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 11:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=//SZ9vhth1gQKbj1DvGRL4y4oE8JcJjBtJ8+iAh3chA=; b=cvaMjoDAw9nB55
	Fa+24WQLS0SmZ8xTdx9V6WASV4Kt0KDYba0qrecZbyefFyoCf42CtrMfQxcrmCw6y2bcc1ss7rx5E
	ixfOWeeV2mtG87Nars2ipFfm3sMomRVVMpAPmrImrZzhfp4GFudVGPeQB5OslrIuB1j35IPKJITaK
	KwGqVBPYB6XECBqyjDUVUOrRAs/Ad9LCCLyW3Wp4kOY7FMI+vF2JEYGwHJzIVJSob9PNnzR8UBVWO
	+N3S8DnCN78nZ3ZVV7LCyHkl1uIPmngG65kOx20AcCeYzHyRuQhijWTd2WOUm25aXYcw9mlPGLPkt
	sPMACWuJ8i6ymjS32r/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYyT-00000007CtN-2MJH;
	Mon, 09 Mar 2026 11:40:37 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYyR-00000007Crb-12wf
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 11:40:36 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-439bcec8613so5920250f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 04:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773056433; x=1773661233; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0YpjhzcIYcSxtAdjQVzNzPM/tyjIJ5Q1jULtAL2eLJs=;
        b=BBT8F//4cwTbr6mPmfa9ZwxOjnzF+l57bWHZECzBxUggfuLkC84Qx11/i1JkPKQLIT
         zOeXnRra+paZMjor/6fu13gpvzY88/oVZagRjfFnKwDlTV5icOwYkbzJpm32X1B43gZN
         N0b3FRrarXJKY/YF6QlDDjaQv/JBfU5YLcIWtcjq3ny4FLpybNQAcCEoiCsWPAM8YmIu
         2bD1u8oZGO6bzhmkdaTABQZYXROz6R2v1oJOImBT3656Mn7cs9bLah3SAB0aOJAufV7X
         G0e8zqxyZ1/2m40TkVdosv0e7JBC64I8WpmVtKzodUNmWLdt5RIlMZi4EzH9J2MpnNCE
         au1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773056433; x=1773661233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0YpjhzcIYcSxtAdjQVzNzPM/tyjIJ5Q1jULtAL2eLJs=;
        b=LX95iOi0QEBOyNe7cClif6yFnkhwoQVnFk0fdGfiY8o4UHkrKhPZJZOaNkj2pD2K3S
         jIem16iZziqm0eV1r/lj3RcSr4orVKrUPAL8HZSDOCKDO6LnnNsLkf6Jr74PKUeKAQCn
         vmUp9g/BZE999eAWTBIDt3AUYW6FFchc2/dWzm+MifQ+caK+cj2ctRmMl88WYZF4vX4X
         5w3nrFNnq2CkzJDTyX2Njz91Wxeul4xQAvdMhmVXO2VBqELaRziXOU6oeOcgndQviWrJ
         LOMgUMTGC+RZP9y+0ajEYhy5WJa/Sf0WWzcnP+qKoip9hFD3knXu9XdPPJ1RpS4mg549
         jw/g==
X-Forwarded-Encrypted: i=1; AJvYcCVvTLlJqpAgYMGLdxHvLGYvH8r+TOHxOqU7AEBTFwWr1JGLe7yv0bhHJtcFF3pszU9mXYwwqaUtT4tV7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOtuCvRhwGP20G2ZrFWrFnKbsNJKlYp3oNoEYe5MDmxjlHuAYJ
	ZvdEtwT1CTNs8PhSwaq73uUeIOcmqvMqZ8Cm+6pndaqQ6dvyu0V1m5Q+
X-Gm-Gg: ATEYQzyFai2cwTdq4gyN3B2+K8sLAWwytroxcOfs/oExlPSvyvHgw4T7n5mQlmG3ZU4
	WgXSjwix0OpX+ZciTbJEVdxNDPuIptzUUG8j5a1sj8LWL0Dt646+PFcYmbmklIQG0MSMGQ/gyG4
	ha+dspVqzd3Jn6+V0Zx41v2hBSO9eEGSquN+0yksbB9cJMt66ed6qm/MX7jnWN5Y5CviK0AgjTf
	yjM6MRJ2kxIIclvqBp/poO4BMMbka7eZ7o567aWDRdDibIN1pQs90YGN/cb7z7UJldYB66jvrNN
	0hU42F6DZxjaSedwOlt+MKXeVMBYTxYpwXC2U5aalRmELOwQ4l9ZaPggnV8i/FD4oTn5Bij6r07
	rs+KKo+8I2ZbU5J9bJfzLYQfxVeoKGUDbK+Er1p6G5HExv9ejOfx/0owWo68H4vVjf4ViEOruj+
	d/2WTA9KORLRzZCWjLr+N8P7hVtNG6i4qGLkrqTEBByNJtAE/kqqrxdifPvuGtuFuT
X-Received: by 2002:a05:6000:3112:b0:439:d242:e8fe with SMTP id ffacd0b85a97d-439da348327mr18838818f8f.11.1773056433101;
        Mon, 09 Mar 2026 04:40:33 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.236.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm28471699f8f.5.2026.03.09.04.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:40:32 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 09 Mar 2026 12:40:13 +0100
Subject: [PATCH v2 3/7] mmc: sdhci-of-k1: add SDR tuning infrastructure
MIME-Version: 1.0
Message-Id: <20260309-orangepi-sd-card-uhs-v2-3-5bb2b574df5d@gmail.com>
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
In-Reply-To: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_044035_323407_B73732C4 
X-CRM114-Status: GOOD (  10.38  )
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

Add register definitions and delay line control functions to prepare for
SDR50/SDR104 tuning support:

- Add tuning register definitions (RX_CFG, DLINE_CTRL, DLINE_CFG)
- Add delay line control helper functions
- Add tuning preparation function

This infrastructure prepares for implementing the SDR tuning algorithm
while maintaining all existing functionality.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 61 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 8af117a8e271c04a80d8dc7bb5ce12075652dd7a..79cb7c8d0b6d9c4206bf01721651c8efe8a173c9 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -68,6 +68,23 @@
 #define  SDHC_PHY_DRIVE_SEL		GENMASK(2, 0)
 #define  SDHC_RX_BIAS_CTRL		BIT(5)
 
+#define SPACEMIT_SDHC_RX_CFG_REG        0x118
+#define  SDHC_RX_SDCLK_SEL0_MASK        GENMASK(1, 0)
+#define  SDHC_RX_SDCLK_SEL1_MASK        GENMASK(3, 2)
+#define  SDHC_RX_SDCLK_SEL1             FIELD_PREP(SDHC_RX_SDCLK_SEL1_MASK, 1)
+
+#define SPACEMIT_SDHC_DLINE_CTRL_REG    0x130
+#define  SDHC_DLINE_PU                  BIT(0)
+#define  SDHC_RX_DLINE_CODE_MASK        GENMASK(23, 16)
+#define  SDHC_TX_DLINE_CODE_MASK        GENMASK(31, 24)
+
+#define SPACEMIT_SDHC_DLINE_CFG_REG     0x134
+#define  SDHC_RX_DLINE_REG_MASK         GENMASK(7, 0)
+#define  SDHC_RX_DLINE_GAIN             BIT(8)
+#define  SDHC_TX_DLINE_REG_MASK         GENMASK(23, 16)
+
+#define SPACEMIT_RX_DLINE_REG		9
+
 struct spacemit_sdhci_host {
 	struct clk *clk_core;
 	struct clk *clk_io;
@@ -95,6 +112,50 @@ static inline void spacemit_sdhci_clrsetbits(struct sdhci_host *host, u32 clr, u
 	sdhci_writel(host, val, reg);
 }
 
+static void spacemit_sdhci_set_rx_delay(struct sdhci_host *host, u8 delay)
+{
+	spacemit_sdhci_clrsetbits(host, SDHC_RX_DLINE_CODE_MASK,
+				  FIELD_PREP(SDHC_RX_DLINE_CODE_MASK, delay),
+				  SPACEMIT_SDHC_DLINE_CTRL_REG);
+}
+
+static void spacemit_sdhci_set_tx_delay(struct sdhci_host *host, u8 delay)
+{
+	spacemit_sdhci_clrsetbits(host, SDHC_TX_DLINE_CODE_MASK,
+				  FIELD_PREP(SDHC_TX_DLINE_CODE_MASK, delay),
+				  SPACEMIT_SDHC_DLINE_CTRL_REG);
+}
+
+static void spacemit_sdhci_set_tx_dline_reg(struct sdhci_host *host, u8 dline_reg)
+{
+	spacemit_sdhci_clrsetbits(host, SDHC_TX_DLINE_REG_MASK,
+				  FIELD_PREP(SDHC_TX_DLINE_REG_MASK, dline_reg),
+				  SPACEMIT_SDHC_DLINE_CFG_REG);
+}
+
+static void spacemit_sdhci_tx_tuning_prepare(struct sdhci_host *host)
+{
+	spacemit_sdhci_setbits(host, SDHC_TX_MUX_SEL, SPACEMIT_SDHC_TX_CFG_REG);
+	spacemit_sdhci_setbits(host, SDHC_DLINE_PU, SPACEMIT_SDHC_DLINE_CTRL_REG);
+	udelay(5);
+}
+
+static void spacemit_sdhci_prepare_tuning(struct sdhci_host *host)
+{
+	spacemit_sdhci_clrsetbits(host, SDHC_RX_DLINE_REG_MASK,
+				  FIELD_PREP(SDHC_RX_DLINE_REG_MASK, SPACEMIT_RX_DLINE_REG),
+				  SPACEMIT_SDHC_DLINE_CFG_REG);
+
+	spacemit_sdhci_setbits(host, SDHC_DLINE_PU, SPACEMIT_SDHC_DLINE_CTRL_REG);
+	udelay(5);
+
+	spacemit_sdhci_clrsetbits(host, SDHC_RX_SDCLK_SEL1_MASK, SDHC_RX_SDCLK_SEL1,
+				  SPACEMIT_SDHC_RX_CFG_REG);
+
+	if (host->mmc->ios.timing == MMC_TIMING_MMC_HS200)
+		spacemit_sdhci_setbits(host, SDHC_HS200_USE_RFIFO, SPACEMIT_SDHC_PHY_FUNC_REG);
+}
+
 static void spacemit_sdhci_reset(struct sdhci_host *host, u8 mask)
 {
 	sdhci_reset(host, mask);

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
