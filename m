Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B217DD4660F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 19:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRvcKBqDuucrXb/hNJbsWMS3rFa1hGElrqBG/eFgIY0=; b=t2j3m2FgJCxHXg
	L61NSEMM8rJD1tpGlM3oF44kwq37FISd43KK7UDGLbpzshySoM1hw2B5ol4tDClFDRkHkhYoz+SQ8
	IGmenhHTxYM+FsnjclWmrcJWSGIG51M6oUo6OwYXP+8teAYIZWokemxuZt0ZZjFIyq1/1hN5Qi7xx
	SHrexOFEsN+LoehhZFVOK3ksN548qGxXnpCROOD/ExjEbxPKHtSb9ZJ0kfUas62o//oswmgGHSeC/
	QpfCP9SJP7C4C6u07KyEuBwD2bUSV+BGUjrkQAWyuvKOD1bnOW2pHzMVCVW2riQwlyG73/Snt7vjA
	qTcWPIuckVb4m7sqm6Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSrP-0000000D2mm-45FO;
	Thu, 15 Jan 2026 19:18:23 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSrN-0000000D2hg-49l0
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 19:18:23 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-432d2c96215so1107005f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 11:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504700; x=1769109500; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xc1juLftWyA1wDHyb+/Z3FwNIJ+75ZFh3R/kOCHvlHU=;
        b=kbcn+32vi68al0Sh9scDRg55tJr0fF0qyrZjaG5wW3QEHlSh/rgPHjeyO9I5IS/v19
         +0PeyWU5Ds3K5rozepbXcPwOXvn0ovKa9mI8RWpSCfpI5vWEVW3o5vgM2QdSbd2Op+/0
         XrpBZ0v+uOo190gNW6EcEUTYU864H5gspB5eoErQNMrhVNrA9Im8wuFq9xdvuPhzwtH/
         Lf5O53iQ0EP/sZ0yAGOirc2wFduZenyMPFkd+RE6iZClttZPx3q7QQ/DpqHL0Fe4BaU6
         xBjhSDC2DCX+pBSHKG6BOd2dazNEok3x4qzK+hLzGhNOska4IVbCq9FHLdLJENLe9o4m
         HB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504700; x=1769109500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xc1juLftWyA1wDHyb+/Z3FwNIJ+75ZFh3R/kOCHvlHU=;
        b=KCTLCI61eFn90SKnyYZLWGNkZ8Rg11jTGP2Wwbd49LRUxHDKB43j9JkL0tUTb25dHR
         7MrpZgAghU3f9io0y1qdyY7rIlz+UsYq4U1qBGHwK1DnJ15QWZK4huEntLNxxzmcACgM
         zOPtIveN0llF08jl8qcDvP6Zp4F69PGuyh8y70Pj1lE5LRdA8oy7jlm49Y61Y3xJllPM
         w4PUaEmSsESwpP38MTFUHM0GViFqnO5g+luTMZnk3GUnVskF1VEdVYOfldb/4A6ri0WV
         T/Xpi8GZxULfHNA+sw4c1EnvAXbNKvhmWBIC3H/l2mBHdE7QdKx3mIR7Um/4qSQ0G+0u
         s0JA==
X-Forwarded-Encrypted: i=1; AJvYcCUFWTI+LWibYhtCG1Bbx/XhZc0RVBKi4SkoOOjgfPg6MlTJXq6Pha1tLV1iSXLji+G9wfWWZ8YvQXlLjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBXZOwl3ueAAVmy17Mh86KKXfgDjkB5EdlENt8VTjGU/kWVvZ9
	fLuHSnZJjhAB2xK1cR+Z2mWY8ZSEOshBmlwrTkMOINjzGnc3DbFqtvpF
X-Gm-Gg: AY/fxX4gQv6hSCsZcSbEw+GowciLNp2YjfeZLYa4KQf5LkNNHYgkNcr1pi0Tklv1Wxb
	0Ja4oEwwCfn64sm5yPjueBX196AD+J6ZEGEj3NoZtNT5OCyfHuy3PImc1PzvWU5WQ6dDkf1rt7A
	JSutYVJC5Zk7VJaneoRpr7hKInalyuMAA5TCfjO0hGGd5D7rZXnW1B65UWhpr8+f6HWeWrAeOV8
	xhgF3K4l1Diq8yu/XVrIkJ2BPg3i/51bGjCMgwgKWawD6WP04R0HStFZaGPjPKX+1eGFGatV3A/
	Q61CSiBzjKpVvEsAnXsslEOhOdZ34wth+8E/FdUE8ISP3Kex9D7zxKwcK7PDnu22jlWQAwaiR+8
	UNubfNqe5BQ9+MjUdOEAmU2T7z5cSIY0UC9A7RlIxnBudj7+efvAImZ/O0Kq39D2FaB8kIF8uOO
	HpONCGe316fyyrOQ8h7yWY/wf0Hay2tl4JFs7Dd/pjG50MEecmCZRTzuk=
X-Received: by 2002:a05:6000:4383:b0:431:9dd:2cca with SMTP id ffacd0b85a97d-4356997f0c2mr532115f8f.7.1768504699943;
        Thu, 15 Jan 2026 11:18:19 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm692734f8f.9.2026.01.15.11.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:18:19 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Thu, 15 Jan 2026 23:17:43 +0400
Subject: [PATCH 6/8] ASoC: sophgo: add CV1800B internal DAC codec driver
MIME-Version: 1.0
Message-Id: <20260115-cv1800b-i2s-driver-v1-6-e8b22b8578ab@gmail.com>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
In-Reply-To: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768504677; l=7294;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=KrPmfmoDlhB5aHZakfTJ0DcCmCsvnj5DBdRQf3ocXWI=;
 b=4iVlJNPj0IUBoHXVhipUHhAxzzbmClMq/SoiDq3Kf5XuqRc/D9PKwiTGGrS3BrHRfQoKSjKT8
 HMjs7tQ0MBlCjw0HAcwo6edhkYtDhD1Quk2VjVYpIA0XHaza4Tzeetw
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_111822_085828_2AEAFB58 
X-CRM114-Status: GOOD (  22.10  )
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

Codec DAI endpoint for TXDAC + basic controls.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 sound/soc/sophgo/Kconfig             |  11 +-
 sound/soc/sophgo/Makefile            |   1 +
 sound/soc/sophgo/cv1800b-sound-dac.c | 204 +++++++++++++++++++++++++++++++++++
 3 files changed, 215 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sophgo/Kconfig b/sound/soc/sophgo/Kconfig
index 813ab30d6da3..e7c617b44db6 100644
--- a/sound/soc/sophgo/Kconfig
+++ b/sound/soc/sophgo/Kconfig
@@ -23,10 +23,19 @@ config SND_SOC_CV1800B_ADC_CODEC
 	help
 	  This driver provides an ASoC codec DAI for capture and basic
 	  control of the RXADC registers.
-
 	  Say Y or M to build support for the Sophgo CV1800B
 	  internal analog ADC codec block (RXADC).
 	  The module will be called cv1800b-sound-adc
 
+config SND_SOC_CV1800B_DAC_CODEC
+	tristate "Sophgo CV1800B/SG2002 internal DAC codec"
+	depends on SND_SOC
+	help
+	  This driver provides an ASoC codec DAI for playback and basic
+	  control of the TXDAC registers.
+
+	  Say Y or M to build support for the Sophgo CV1800B
+	  internal analog DAC codec block (TXDAC).
+	  The module will be called cv1800b-sound-dac
 
 endmenu
diff --git a/sound/soc/sophgo/Makefile b/sound/soc/sophgo/Makefile
index c654d6059cbd..ec8dd31efddd 100644
--- a/sound/soc/sophgo/Makefile
+++ b/sound/soc/sophgo/Makefile
@@ -2,3 +2,4 @@
 # Sophgo Platform Support
 obj-$(CONFIG_SND_SOC_CV1800B_TDM) += cv1800b-tdm.o
 obj-$(CONFIG_SND_SOC_CV1800B_ADC_CODEC) += cv1800b-sound-adc.o
+obj-$(CONFIG_SND_SOC_CV1800B_DAC_CODEC) += cv1800b-sound-dac.o
diff --git a/sound/soc/sophgo/cv1800b-sound-dac.c b/sound/soc/sophgo/cv1800b-sound-dac.c
new file mode 100644
index 000000000000..ccf386174639
--- /dev/null
+++ b/sound/soc/sophgo/cv1800b-sound-dac.c
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Internal DAC codec for cv1800b based CPUs
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <sound/soc.h>
+#include <linux/io.h>
+
+#define CV1800B_TXDAC_CTRL0   0x00
+#define CV1800B_TXDAC_CTRL1   0x04
+#define CV1800B_TXDAC_STATUS  0x08
+#define CV1800B_TXDAC_AFE0    0x0c
+#define CV1800B_TXDAC_AFE1    0x10
+#define CV1800B_TXDAC_ANA0    0x20
+#define CV1800B_TXDAC_ANA1    0x24
+#define CV1800B_TXDAC_ANA2    0x28
+
+/* cv1800b_TXDAC_CTRL0 */
+#define REG_TXDAC_EN GENMASK(0, 0)
+#define REG_I2S_RX_EN GENMASK(1, 1)
+
+/* cv1800b_TXDAC_CTRL1 */
+#define REG_TXDAC_CIC_OPT GENMASK(1, 0)
+
+/* cv1800b_TXDAC_AFE0 */
+#define REG_TXDAC_INIT_DLY_CNT GENMASK(5, 0)
+
+/* cv1800b_TXDAC_ANA2 */
+#define TXDAC_OW_VAL_L_MASK GENMASK(7, 0)
+#define TXDAC_OW_VAL_R_MASK GENMASK(15, 8)
+#define TXDAC_OW_EN_L_MASK GENMASK(16, 16)
+#define TXDAC_OW_EN_R_MASK GENMASK(17, 17)
+
+struct cv1800b_priv {
+	void __iomem *regs;
+	struct device *dev;
+};
+
+enum decimation_values {
+	DECIMATION_64 = 0,
+	DECIMATION_128,
+	DECIMATION_256,
+	DECIMATION_512,
+};
+
+static void cv1800b_dac_enable(struct cv1800b_priv *priv, bool enable)
+{
+	u32 val;
+
+	val = readl(priv->regs + CV1800B_TXDAC_CTRL0);
+	val = u32_replace_bits(val, enable, REG_TXDAC_EN);
+	val = u32_replace_bits(val, enable, REG_I2S_RX_EN);
+	writel(val, priv->regs + CV1800B_TXDAC_CTRL0);
+}
+
+static void cv1800b_dac_mute(struct cv1800b_priv *priv, bool enable)
+{
+	u32 val;
+
+	val = readl(priv->regs + CV1800B_TXDAC_ANA2);
+	val = u32_replace_bits(val, enable, TXDAC_OW_EN_L_MASK);
+	val = u32_replace_bits(val, enable, TXDAC_OW_EN_R_MASK);
+	writel(val, priv->regs + CV1800B_TXDAC_ANA2);
+}
+
+static int cv1800b_dac_decimation(struct cv1800b_priv *priv, u8 dec)
+{
+	u32 val;
+
+	if (dec > 3)
+		return -EINVAL;
+
+	val = readl(priv->regs + CV1800B_TXDAC_CTRL1);
+	val = u32_replace_bits(val, dec, REG_TXDAC_CIC_OPT);
+	writel(val, priv->regs + CV1800B_TXDAC_CTRL1);
+	return 0;
+}
+
+static int cv1800b_dac_dly(struct cv1800b_priv *priv, u32 dly)
+{
+	u32 val;
+
+	if (dly > 63)
+		return -EINVAL;
+
+	val = readl(priv->regs + CV1800B_TXDAC_AFE0);
+	val = u32_replace_bits(val, dly, REG_TXDAC_INIT_DLY_CNT);
+	writel(val, priv->regs + CV1800B_TXDAC_AFE0);
+	return 0;
+}
+
+static int cv1800b_dac_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *dai)
+{
+	struct cv1800b_priv *priv = snd_soc_dai_get_drvdata(dai);
+	int ret;
+	unsigned int rate = params_rate(params);
+
+	if (rate != 48000) {
+		dev_err(priv->dev, "rate %u is not supported\n", rate);
+		return -EINVAL;
+	}
+
+	cv1800b_dac_mute(priv, false);
+	/* minimal decimation for 48kHz is 64*/
+	ret = cv1800b_dac_decimation(priv, DECIMATION_64);
+	if (ret)
+		return ret;
+
+	/* value is taken from vendors driver 48kHz
+	 * tested on sg2000 and sg2002.
+	 */
+	ret = cv1800b_dac_dly(priv, 0x19);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int cv1800b_dac_dai_trigger(struct snd_pcm_substream *substream, int cmd,
+				   struct snd_soc_dai *dai)
+{
+	struct cv1800b_priv *priv = snd_soc_dai_get_drvdata(dai);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		cv1800b_dac_enable(priv, true);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		cv1800b_dac_enable(priv, false);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops cv1800b_dac_dai_ops = {
+	.hw_params = cv1800b_dac_hw_params,
+	.trigger = cv1800b_dac_dai_trigger,
+};
+
+static struct snd_soc_dai_driver cv1800b_dac_dai = {
+	.name = "dac-hifi",
+	.playback = { .stream_name = "DAC Playback",
+		      .channels_min = 2,
+		      .channels_max = 2,
+		      .rates = SNDRV_PCM_RATE_48000,
+		      .formats = SNDRV_PCM_FMTBIT_S16_LE },
+	.ops = &cv1800b_dac_dai_ops,
+};
+
+static const struct snd_soc_component_driver cv1800b_dac_component = {
+	.name = "cv1800b-dac-codec",
+};
+
+static int cv1800b_dac_probe(struct platform_device *pdev)
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
+					       &cv1800b_dac_component,
+					       &cv1800b_dac_dai, 1);
+}
+
+static const struct of_device_id cv1800b_dac_of_match[] = {
+	{ .compatible = "sophgo,cv1800b-sound-dac" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cv1800b_dac_of_match);
+
+static struct platform_driver cv1800b_dac_driver = {
+	.probe = cv1800b_dac_probe,
+	.driver = {
+		.name = "cv1800b-dac-codec",
+		.of_match_table = cv1800b_dac_of_match,
+	},
+};
+module_platform_driver(cv1800b_dac_driver);
+
+MODULE_DESCRIPTION("DAC codec for CV1800B");
+MODULE_AUTHOR("Anton D. Stavinskii <stavinsky@gmail.com>");
+MODULE_LICENSE("GPL");

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
