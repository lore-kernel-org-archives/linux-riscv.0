Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F529EA4E1F
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 15:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g4dym64d+0BSIUq0O/V4huzdsfvI4tYJINuSMRC0M1U=; b=ChYDzpxWZ2ODXz
	/t/bDOxVi1b4DAAcmEmOSg1R9WSZA/Pp7twdzQBgXdcbFExD7C+UEoaxoNfPoaNtRSS0pUrx3cbBL
	E6NJgFNMe6Hdr2laM2zcLhW8FZGx1wZzWXt5zUSGqSVeeLh34vb1+EdGMzQOckBi0nh5JMg5xDktR
	ZiTNvy1frkS3TQ707Sw30MAR8oPXRRly7Aa+mmzSiIZOOcpUQOQPJCwSiiEuiADt3ziXTzZlx7TvR
	e4CQwvc7V1e2kKoMLm85ZdJsbRiMKvHVMSY9S50DdDjjgCyG7ltt90AYFRHBC6FebvWxcKPc5rVwV
	VMGjUEMXIFQSr6FFT6Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4yC-0000000DK7X-06Fr;
	Mon, 02 Mar 2026 15:14:04 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4y9-0000000DK3q-1UnZ
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 15:14:02 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4837634de51so18968475e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 07:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464439; x=1773069239; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sI0ZXWmHjNvtD6IpJHMeOdxd2SjR4noe2NBQlRy+ENQ=;
        b=fvxDfZoM1Z3F37zEtYdn9C6GHNN+6uNjWhNwdXur99OAaBImT979y0bpVeDWyCeh7E
         sZZ4cdM7e758+HaVrSLo+uE7IkMFNp/HiKl43xa49ZwHZ67UOMXZonU8ERp4NLPhQ2Ix
         6WvyPgwDv80LSrB8k5M9VvGUgYGTX90xR4HjEvaXjLWHM1gqPVheIsD9ZzmZA2djG/zq
         vy8Zcscf9zC5iki/gL/yiR3pojUHKzys73lYiKYNAnfkw0W561Y08PzciwxcBcxEyqRJ
         r361Qdw8OALM6FbKXNiesqn0huEuIJRMu+LhHlbRPsMvD3Xs8HSCm3CPVQTQ9HauaaWz
         b96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464439; x=1773069239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sI0ZXWmHjNvtD6IpJHMeOdxd2SjR4noe2NBQlRy+ENQ=;
        b=sYEfFE0ncV1Ux0m8pclt8C0CUnMfY/0E30uDkNx+nsMxFmwS6OrysBCI2TrjoVBK8h
         IUlBsqMK4BuryGaB3AfiB5Yv40VBr/ndt/funhR5aOfhdHa/0LotHsD+oVE52min+71p
         aqIpZYj2wTdASMIrS6tXQ9/Ad6xICTVoDWdx0kqPfRdxTsZc8gvWItPt87bEWB8f9wha
         YD2gRT38Ka0wDg7KoH08MtgfdDlaUC1kv840+UV1P8VYjWG4YbzD9kkO9hxbsRcYMFHF
         IPJWrvAJxUaUUirFzJAmM69X7TdHYSapAwTtW9qUZoKlAj3FE+lgGK9aSwOpoq81l8i0
         7fKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf0W12amoclKKoIJsut2ynpvzXS08aFrFmV/pKm1XCgMX8h6vZ1diGq3DvDl+eSHwv1+C0p8CYME7LdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzbd9ViDQCPlB0MdorBQV0Fr3FEjT3N2UFe2fFFj+IX7lOIjBmP
	K1ztcgyWvVlUvgQvz3yXfNpyLsbB3Mbg+z8zWwujn/BaTAmMMPpR/HS/
X-Gm-Gg: ATEYQzxbg5TkCco8/Z84eMGaYvSY3+j7wxrgs2TEqzR1NnBssCP5C5Xlma2hS5/yhcP
	bp0oQj7DglDx89X7JmQCGN47iJJS/RuweX4NDwNr9yN2fkaoGO3pO/u1DZmpRb2pbML/551+z4T
	zC5SLlIT6dA+YpKkYcYwmaC/DDhCzM4Auynjh4zqsL/TYIUh1bMUXH6UQsDnUo09UXKrvOSO7uo
	//zlznBlOcXqWrFJKzYQFWyqBl7NQTGC8+ZYD1gYO8RTG2RXmTNAN4I//QOmS82qFdSSdYgZARm
	JqxCHVTJvMBOPeHLAgNmOyBZXGDMkngxryyQDRiLimRYBrnAeBbgGb2DQzX+5NWhYo3fGFzOxrQ
	03u8tn2NCXhSqSGkJW1/luercEG6Hl/s+JfwrKeFIzZsy779GzbO36atJxwMCdUZrdQ7IacBRZ5
	NLuGKCNg99ADDWoBFu791kEW15QJVqbEZjM1GNexi2Z9Cz5wXofRK31WJjUJDqAEVZuQ==
X-Received: by 2002:a05:600c:5395:b0:483:709e:f22d with SMTP id 5b1f17b1804b1-483c9c24797mr190414855e9.27.1772464439170;
        Mon, 02 Mar 2026 07:13:59 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm437240265e9.7.2026.03.02.07.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:13:58 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 02 Mar 2026 16:13:27 +0100
Subject: [PATCH 06/10] mmc: sdhci-of-k1: add SDR tuning infrastructure
MIME-Version: 1.0
Message-Id: <20260302-orangepi-sd-card-uhs-v1-6-89c219973c0c@gmail.com>
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
In-Reply-To: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_071401_427439_A64763C3 
X-CRM114-Status: GOOD (  11.27  )
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
 drivers/mmc/host/sdhci-of-k1.c | 62 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 9425bde6a72541bd628997e91f957072a6266c25..34a1b9c359193be7dd5f07d1f3d6565b5f40e7ff 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -72,6 +72,23 @@
 #define  AKEY_ASFAR			0xBABA
 #define  AKEY_ASSAR			0xEB10
 
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
@@ -102,6 +119,50 @@ static inline void spacemit_sdhci_clrsetbits(struct sdhci_host *host, u32 clr, u
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
@@ -335,6 +396,7 @@ static const struct sdhci_ops spacemit_sdhci_ops = {
 	.set_bus_width		= sdhci_set_bus_width,
 	.set_clock		= spacemit_sdhci_set_clock,
 	.set_uhs_signaling	= spacemit_sdhci_set_uhs_signaling,
+	.platform_execute_tuning = spacemit_sdhci_execute_tuning,
 };
 
 static const struct sdhci_pltfm_data spacemit_sdhci_k1_pdata = {

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
