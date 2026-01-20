Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3981ED2628A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 19:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=575eJCk1wATrplR5X/6oa3xClRW34Ep+3VetSu7bvWU=; b=fIPOIq6GWLa8aS
	1x3AwPng6GTEsdZlD9/+oEEQzevoPaiFDimWSPkJht9kuUP+cxcm+6fSe5kkWxem8uEJ77xGI+8Th
	hR4bGYTGY7qgPCQfd9WO27GQC5Jb8PnoO93Xi9oo4rX5Z+M7wmZzS6viugWqlkB+/O3G+ysOhZFZu
	9KIqL4Ta0Vh0K6z7qZG9HxqhAizcCNYGlltnnEOgpieU+cnr/lTQCCvaOs8TPzwWZCRkrggGB4OnC
	t/DRJOEMu6FdEwGQvrlW/pwCSMGARchDrG1nUa0DvBNEaUC0fOWh5fQgL/L6tb0JeHWmlcdYnkwTF
	VBRVhAqYLrrDIYhhme4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viH3m-00000004KwC-3nXy;
	Tue, 20 Jan 2026 19:06:38 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viH3Z-00000004KsG-1Ymw
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 19:06:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso47785085e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 11:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768935983; x=1769540783; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=67n3hQj7YZy5SOWtPvVJYLwDNXmEE9p7Iv/fRjacYhE=;
        b=ADkuhqyDmW038OLnYFKzGVhP8XerDR87uBB5luGZQjyA6Yht56xOhnWyl3xbQTIaXE
         yv5uWvNOSyitFb+YOfR+I19CjFBcHccdtPiacahH0hZZKU5DJ6lopq/oFRDjTCwRxQDQ
         OMpSNlCsq8LaO9sg+CQJ/6nJIx0rNdipM2Ofpo1mKn1+v347Q+ex5BVdNMPAp1/190bb
         7DRnmnSU/7u0jORWJXbq8jFw164Ksc5kPTdUzYlpTpFGoVSM4GtXAudVuobR5dxXZaAu
         dHWh4efoLEkXUrKBtfehz40oX4i6cuK9gol4ruQJIHmOFIRf5xhuV9otyjFSmnNIF916
         SCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768935983; x=1769540783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=67n3hQj7YZy5SOWtPvVJYLwDNXmEE9p7Iv/fRjacYhE=;
        b=dU0huQUj+aHk1DjWawcObTf6bTT1qsOySaKAOzpkwyeFkHlS5e5n/ELjwakSqlpuJC
         INJdhvCpdOl8NVOdmf8a34ex5ZiVa3zkAaq8UBmFq0VIz/4yR0qDqZ5UbrSxcRPI7DuY
         O+7e+JlDt7n70E1czgjRJNk4ay1Mfb8d+oviZkek81MHWxGetYLb5/MDZeiL4Z3Bfw/8
         2ijNKilLRlcxoblU7ygg2yqAjpqQxuz1/WhDnlDfaJhrBhRmOPCD0QhuyjlbFTtmBO7q
         WdJWq1pNXftsArvk/jzr/7hSzv2J1UM/K68yasGRJeI0MYvIDqVGwwMVGa/EHR3RlfvW
         0DcA==
X-Forwarded-Encrypted: i=1; AJvYcCUe2lFRznfy9RmvnZP/D9hj8HgyQTFPq4mFDStp3vAS010C8g0/3zCN8yNnJV9l+WylPIYcXx7RoFvaUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyG4HQqYj+oNWaKE2kiGvuUjadvwO6TX7Q+28BqSkmkOMM80jXj
	gEdmtSUvX63PsuBJ74I8JwNXio3zW6wNoekrWZTFPg0+ijuPGyYW8Fla
X-Gm-Gg: AY/fxX4JziMc3QV/HKnGfLO95/YtD119vXH1ZP6xWb+7z8JiN1pfpdPcwFmuJk6aNvj
	hLOP5qWnorejFQU7MWwrWbPCg3Lbzx3T3GK0go+UQ83Wr0+0+GlFdrpbGBg1aeV3f31bnLxQB2G
	3AJTX8S6T1K+/JSLgit5Er7VFLMkTD/+VKuip+++huY0IFd7DLHKpSyPHLKDBEe16+0OCuGrdnH
	x+Bogrgek5o8+DjAkKPwvCav7hKKHd+x20ATjz5qMZI4VPqzMRWVgTxsEw+P8ByyGqvFkYclrWg
	McHETljxW0NF5t25EiYXr1myiQm3poxYIWLvOwOYggbN8bTNg6o/hdVF88Hljujutx5y8P+vPxz
	h5CCpsyWJ/10AvYJqenVsRzQNiFMIcQEZbFldXGlvkrUzXysImeVjccQLz7tPF4QZvT1y7X3Enp
	5KPBGSY7X6XPUezCJVfmKYtC2DeZwPZ8xJgCXDlmo8KnLn
X-Received: by 2002:a05:600c:8108:b0:477:7975:30ea with SMTP id 5b1f17b1804b1-4803e7f0d8emr36592245e9.29.1768935982665;
        Tue, 20 Jan 2026 11:06:22 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804244c6cesm2005735e9.0.2026.01.20.11.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:06:22 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 20 Jan 2026 23:06:06 +0400
Subject: [PATCH v4 4/6] ASoC: sophgo: add CV1800B internal ADC codec driver
MIME-Version: 1.0
Message-Id: <20260120-cv1800b-i2s-driver-v4-4-6ef787dc6426@gmail.com>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
In-Reply-To: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768935966; l=11247;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=FhxRnJeE+n492blGdhTMJDOvXT2t5M+yRqAueV+wnBE=;
 b=IYTjtpETuFRBIdeOCi9W8IJWi8QAr9QuoiHSjwJm/GTcnOXHgzVVe9i9lkOOOLLRsQ0EnG0N6
 Jde6tGJ3cpoBg4m+h5C4VNYCN6MgkpnrfwERSFZ2cL0nZOu8PBEodhE
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_110625_475877_D945DFDE 
X-CRM114-Status: GOOD (  23.83  )
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

Codec DAI endpoint for RXADC + basic controls.
THe codec have basic volume control. Which is
imlemented by lookup table for simplicity.
The codec expects set_sysclk callback to
adjust internal mclk divider.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 sound/soc/sophgo/Kconfig             |  12 ++
 sound/soc/sophgo/Makefile            |   1 +
 sound/soc/sophgo/cv1800b-sound-adc.c | 322 +++++++++++++++++++++++++++++++++++
 3 files changed, 335 insertions(+)

diff --git a/sound/soc/sophgo/Kconfig b/sound/soc/sophgo/Kconfig
index 9495ab49f042..12d1a57ea308 100644
--- a/sound/soc/sophgo/Kconfig
+++ b/sound/soc/sophgo/Kconfig
@@ -22,4 +22,16 @@ config SND_SOC_CV1800B_TDM
 	  To compile the driver as a module, choose M here: the module will
 	  be called cv1800b_tdm.
 
+config SND_SOC_CV1800B_ADC_CODEC
+	tristate "Sophgo CV1800B/SG2002 internal ADC codec"
+	depends on SND_SOC
+	help
+	  This driver provides an ASoC codec DAI for capture and basic
+	  control of the RXADC registers.
+
+	  Say Y or M to build support for the Sophgo CV1800B
+	  internal analog ADC codec block (RXADC).
+	  The module will be called cv1800b-sound-adc
+
+
 endmenu
diff --git a/sound/soc/sophgo/Makefile b/sound/soc/sophgo/Makefile
index 3f9f1d07227a..c654d6059cbd 100644
--- a/sound/soc/sophgo/Makefile
+++ b/sound/soc/sophgo/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 # Sophgo Platform Support
 obj-$(CONFIG_SND_SOC_CV1800B_TDM) += cv1800b-tdm.o
+obj-$(CONFIG_SND_SOC_CV1800B_ADC_CODEC) += cv1800b-sound-adc.o
diff --git a/sound/soc/sophgo/cv1800b-sound-adc.c b/sound/soc/sophgo/cv1800b-sound-adc.c
new file mode 100644
index 000000000000..794030b713e9
--- /dev/null
+++ b/sound/soc/sophgo/cv1800b-sound-adc.c
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Internal adc codec for cv1800b compatible SoC
+ *
+ */
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <sound/soc.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <sound/tlv.h>
+#include <sound/soc-component.h>
+#include <sound/control.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/bitops.h>
+
+#define CV1800B_RXADC_WORD_LEN 16
+#define CV1800B_RXADC_CHANNELS 2
+
+#define CV1800B_RXADC_CTRL0    0x00
+#define CV1800B_RXADCC_CTRL1   0x04
+#define CV1800B_RXADC_STATUS   0x08
+#define CV1800B_RXADC_CLK      0x0c
+#define CV1800B_RXADC_ANA0     0x10
+#define CV1800B_RXADC_ANA1     0x14
+#define CV1800B_RXADC_ANA2     0x18
+#define CV1800B_RXADC_ANA3     0x1c
+#define CV1800B_RXADC_ANA4     0x20
+
+/* CV1800B_RXADC_CTRL0 */
+#define REG_RXADC_EN                   GENMASK(0, 0)
+#define REG_I2S_TX_EN                  GENMASK(1, 1)
+
+/* CV1800B_RXADCC_CTRL1 */
+#define REG_RXADC_CIC_OPT              GENMASK(1, 0)
+#define REG_RXADC_IGR_INIT             GENMASK(8, 8)
+
+/* CV1800B_RXADC_ANA0 */
+#define REG_GSTEPL_RXPGA               GENMASK(12, 0)
+#define REG_G6DBL_RXPGA                GENMASK(13, 13)
+#define REG_GAINL_RXADC                GENMASK(15, 14)
+#define REG_GSTEPR_RXPGA               GENMASK(28, 16)
+#define REG_G6DBR_RXPGA                GENMASK(29, 29)
+#define REG_GAINR_RXADC                GENMASK(31, 30)
+#define REG_COMB_LEFT_VOLUME           GENMASK(15, 0)
+#define REG_COMB_RIGHT_VOLUME          GENMASK(31, 16)
+
+/* CV1800B_RXADC_ANA2 */
+#define REG_MUTEL_RXPGA                GENMASK(0, 0)
+#define REG_MUTER_RXPGA                GENMASK(1, 1)
+
+/* CV1800B_RXADC_CLK */
+#define REG_RXADC_CLK_INV              GENMASK(0, 0)
+#define REG_RXADC_SCK_DIV              GENMASK(15, 8)
+#define REG_RXADC_DLYEN                GENMASK(23, 16)
+
+enum decimation_values {
+	DECIMATION_64 = 0,
+	DECIMATION_128,
+	DECIMATION_256,
+	DECIMATION_512,
+};
+
+static const u32 cv1800b_gains[] = {
+	0x0001, /* 0dB */
+	0x0002, /* 2dB */
+	0x0004, /* 4dB */
+	0x0008, /* 6dB */
+	0x0010, /* 8dB */
+	0x0020, /* 10dB */
+	0x0040, /* 12dB */
+	0x0080, /* 14dB */
+	0x0100, /* 16dB */
+	0x0200, /* 18dB */
+	0x0400, /* 20dB */
+	0x0800, /* 22dB */
+	0x1000, /* 24dB */
+	0x2400, /* 26dB */
+	0x2800, /* 28dB */
+	0x3000, /* 30dB */
+	0x6400, /* 32dB */
+	0x6800, /* 34dB */
+	0x7000, /* 36dB */
+	0xA400, /* 38dB */
+	0xA800, /* 40dB */
+	0xB000, /* 42dB */
+	0xE400, /* 44dB */
+	0xE800, /* 46dB */
+	0xF000, /* 48dB */
+};
+
+struct cv1800b_priv {
+	void __iomem *regs;
+	struct device *dev;
+	unsigned int mclk_rate;
+};
+
+static int cv1800b_adc_setbclk_div(struct cv1800b_priv *priv, unsigned int rate)
+{
+	u32 val;
+	u32 bclk_div;
+	u64 tmp;
+
+	if (!priv->mclk_rate || !rate)
+		return -EINVAL;
+
+	tmp = priv->mclk_rate;
+	tmp /= CV1800B_RXADC_WORD_LEN;
+	tmp /= CV1800B_RXADC_CHANNELS;
+	tmp /= rate;
+	tmp /= 2;
+
+	if (!tmp) {
+		dev_err(priv->dev, "computed BCLK divider is zero\n");
+		return -EINVAL;
+	}
+
+	if (tmp > 256) {
+		dev_err(priv->dev, "BCLK divider %llu out of range\n", tmp);
+		return -EINVAL;
+	}
+
+	bclk_div = tmp - 1;
+	val = readl(priv->regs + CV1800B_RXADC_CLK);
+	val = u32_replace_bits(val, bclk_div, REG_RXADC_SCK_DIV);
+	/* Vendor value for 48kHz, tested on SG2000/SG2002 */
+	val = u32_replace_bits(val, 0x19, REG_RXADC_DLYEN);
+	writel(val, priv->regs + CV1800B_RXADC_CLK);
+
+	return 0;
+}
+
+static void cv1800b_adc_enable(struct cv1800b_priv *priv, bool enable)
+{
+	u32 val;
+
+	val = readl(priv->regs + CV1800B_RXADC_CTRL0);
+	val = u32_replace_bits(val, enable, REG_RXADC_EN);
+	val = u32_replace_bits(val, enable, REG_I2S_TX_EN);
+	writel(val, priv->regs + CV1800B_RXADC_CTRL0);
+}
+
+static unsigned int cv1800b_adc_calc_db(u32 ana0, bool right)
+{
+	u32 step_mask = right ? FIELD_GET(REG_GSTEPR_RXPGA, ana0) :
+				FIELD_GET(REG_GSTEPL_RXPGA, ana0);
+	u32 coarse = right ? FIELD_GET(REG_GAINR_RXADC, ana0) :
+			     FIELD_GET(REG_GAINL_RXADC, ana0);
+	bool g6db = right ? FIELD_GET(REG_G6DBR_RXPGA, ana0) :
+			    FIELD_GET(REG_G6DBL_RXPGA, ana0);
+
+	u32 step = step_mask ? __ffs(step_mask) : 0;
+
+	step = min(step, 12U);
+	coarse = min(coarse, 3U);
+
+	return 2 * step + 6 * coarse + (g6db ? 6 : 0);
+}
+
+static int cv1800b_adc_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *dai)
+{
+	struct cv1800b_priv *priv = snd_soc_dai_get_drvdata(dai);
+	unsigned int rate = params_rate(params);
+	u32 val;
+	int ret;
+
+	ret = cv1800b_adc_setbclk_div(priv, rate);
+	if (ret) {
+		dev_err(priv->dev,
+			"could not set rate, check DT node for fixed clock\n");
+		return ret;
+	}
+
+	/* init adc */
+	val = readl(priv->regs + CV1800B_RXADCC_CTRL1);
+	val = u32_replace_bits(val, 1, REG_RXADC_IGR_INIT);
+	val = u32_replace_bits(val, DECIMATION_64, REG_RXADC_CIC_OPT);
+	writel(val, priv->regs + CV1800B_RXADCC_CTRL1);
+	return 0;
+}
+
+static int cv1800b_adc_dai_trigger(struct snd_pcm_substream *substream, int cmd,
+				   struct snd_soc_dai *dai)
+{
+	struct cv1800b_priv *priv = snd_soc_dai_get_drvdata(dai);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		cv1800b_adc_enable(priv, true);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		cv1800b_adc_enable(priv, false);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int cv1800b_adc_dai_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+				      unsigned int freq, int dir)
+{
+	struct cv1800b_priv *priv = snd_soc_dai_get_drvdata(dai);
+
+	priv->mclk_rate = freq;
+	dev_dbg(priv->dev, "mclk is set to %u\n", freq);
+	return 0;
+}
+
+static const struct snd_soc_dai_ops cv1800b_adc_dai_ops = {
+	.hw_params = cv1800b_adc_hw_params,
+	.set_sysclk = cv1800b_adc_dai_set_sysclk,
+	.trigger = cv1800b_adc_dai_trigger,
+};
+
+static struct snd_soc_dai_driver cv1800b_adc_dai = {
+	.name = "adc-hifi",
+	.capture = { .stream_name = "ADC Capture",
+		     .channels_min = 1,
+		     .channels_max = 2,
+		     .rates = SNDRV_PCM_RATE_48000,
+		     .formats = SNDRV_PCM_FMTBIT_S16_LE },
+	.ops = &cv1800b_adc_dai_ops,
+};
+
+static int cv1800b_adc_volume_get(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct cv1800b_priv *priv = snd_soc_component_get_drvdata(component);
+	u32 ana0 = readl(priv->regs + CV1800B_RXADC_ANA0);
+
+	unsigned int left = cv1800b_adc_calc_db(ana0, false);
+	unsigned int right = cv1800b_adc_calc_db(ana0, true);
+
+	ucontrol->value.integer.value[0] = min(left / 2, 24U);
+	ucontrol->value.integer.value[1] = min(right / 2, 24U);
+	return 0;
+}
+
+static int cv1800b_adc_volume_set(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct cv1800b_priv *priv = snd_soc_component_get_drvdata(component);
+
+	u32 v_left = clamp_t(u32, ucontrol->value.integer.value[0], 0, 24);
+	u32 v_right = clamp_t(u32, ucontrol->value.integer.value[1], 0, 24);
+	u32 val;
+
+	val = readl(priv->regs + CV1800B_RXADC_ANA0);
+	val = u32_replace_bits(val, cv1800b_gains[v_left],
+			       REG_COMB_LEFT_VOLUME);
+	val = u32_replace_bits(val, cv1800b_gains[v_right],
+			       REG_COMB_RIGHT_VOLUME);
+	writel(val, priv->regs + CV1800B_RXADC_ANA0);
+
+	return 0;
+}
+
+static DECLARE_TLV_DB_SCALE(cv1800b_volume_tlv, 0, 200, 0);
+
+static const struct snd_kcontrol_new cv1800b_adc_controls[] = {
+	SOC_DOUBLE_EXT_TLV("Internal I2S Capture Volume", SND_SOC_NOPM, 0, 16, 24, false,
+			   cv1800b_adc_volume_get, cv1800b_adc_volume_set,
+			   cv1800b_volume_tlv),
+};
+
+static const struct snd_soc_component_driver cv1800b_adc_component = {
+	.name = "cv1800b-adc-codec",
+	.controls = cv1800b_adc_controls,
+	.num_controls = ARRAY_SIZE(cv1800b_adc_controls),
+};
+
+static int cv1800b_adc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cv1800b_priv *priv;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->regs))
+		return PTR_ERR(priv->regs);
+
+	platform_set_drvdata(pdev, priv);
+	return devm_snd_soc_register_component(&pdev->dev,
+					       &cv1800b_adc_component,
+					       &cv1800b_adc_dai, 1);
+}
+
+static const struct of_device_id cv1800b_adc_of_match[] = {
+	{ .compatible = "sophgo,cv1800b-sound-adc" },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, cv1800b_adc_of_match);
+
+static struct platform_driver cv1800b_adc_driver = {
+	.probe = cv1800b_adc_probe,
+	.driver = {
+		.name = "cv1800b-sound-adc",
+		.of_match_table = cv1800b_adc_of_match,
+	},
+};
+
+module_platform_driver(cv1800b_adc_driver);
+
+MODULE_DESCRIPTION("ADC codec for CV1800B");
+MODULE_AUTHOR("Anton D. Stavinskii <stavinsky@gmail.com>");
+MODULE_LICENSE("GPL");

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
