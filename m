Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8B7EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 11:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HhMWDJEJU76mbgPn9BCNoPP9Q0/Wo1fihsr1scT5MM0=; b=T8MjYBE0c27o/1
	U6B9kBRLxAMzlNY2iJw0dZpsnzKs+hzQVuv9RQNJG7ArJCbwwRmMAe6N7fH2Q4Al6aaC9tjn7ceQk
	YYjLRxHDgZJMOej7GS+5ExDaJtqKNJdIkt5LDkFPHB4ty9hPaYMnZEhIAHy0r1RQGgaWKbsHhzVtL
	O1dhFAy5KqOLbuv3y5c98vQTjfDzRVSiKP2PfKN16GQtB6SC9GhCWHx2ndKa+VbImuvhn4UZ/+ATW
	ENQNBOgyMxsfT6i1/QeLE31Rc/ul+ismmTyMu4f+7JE32i55Pi4kt3ZeFeY1tZIjmEssKJi2m0Rwq
	KXfd3UeXVTyNGKik505w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDk6Y-00A2Ll-0N;
	Mon, 26 Jun 2023 11:09:58 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDk6Q-00A2EI-0H
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 11:09:54 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id C230524DEC3;
	Mon, 26 Jun 2023 19:09:12 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 26 Jun
 2023 19:09:12 +0800
Received: from ubuntu.localdomain (113.72.146.167) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 26 Jun
 2023 19:09:11 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Walker
 Chen" <walker.chen@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Hal Feng
	<hal.feng@starfivetech.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/5] ASoC: codecs: Add StarFive JH7110 dummy PWM-DAC transmitter driver
Date: Mon, 26 Jun 2023 19:09:06 +0800
Message-ID: <20230626110909.38718-3-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230626110909.38718-1-hal.feng@starfivetech.com>
References: <20230626110909.38718-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.146.167]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_040951_183575_2EFC8A60 
X-CRM114-Status: GOOD (  15.29  )
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

Add a dummy transmitter driver for StarFive JH7110 PWM-DAC module.
StarFive JH7110 PWM-DAC controller uses this driver.

Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 sound/soc/codecs/Kconfig                     |  4 ++
 sound/soc/codecs/Makefile                    |  2 +
 sound/soc/codecs/jh7110_pwmdac_transmitter.c | 74 ++++++++++++++++++++
 3 files changed, 80 insertions(+)
 create mode 100644 sound/soc/codecs/jh7110_pwmdac_transmitter.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 8020097d4e4c..f2cd8f999649 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -115,6 +115,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_IDT821034
 	imply SND_SOC_INNO_RK3036
 	imply SND_SOC_ISABELLE
+	imply SND_SOC_JH7110_PWMDAC_DIT
 	imply SND_SOC_JZ4740_CODEC
 	imply SND_SOC_JZ4725B_CODEC
 	imply SND_SOC_JZ4760_CODEC
@@ -903,6 +904,9 @@ config SND_SOC_CX2072X
 	help
 	  Enable support for Conexant CX20721 and CX20723 codec chips.
 
+config SND_SOC_JH7110_PWMDAC_DIT
+	tristate "StarFive JH7110 dummy PWM-DAC transmitter"
+
 config SND_SOC_JZ4740_CODEC
 	depends on MACH_INGENIC || COMPILE_TEST
 	depends on OF
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 5cdbae88e6e3..8e0e12d7b959 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -122,6 +122,7 @@ snd-soc-ics43432-objs := ics43432.o
 snd-soc-idt821034-objs := idt821034.o
 snd-soc-inno-rk3036-objs := inno_rk3036.o
 snd-soc-isabelle-objs := isabelle.o
+snd-soc-jh7110-pwmdac-dit-objs := jh7110_pwmdac_transmitter.o
 snd-soc-jz4740-codec-objs := jz4740.o
 snd-soc-jz4725b-codec-objs := jz4725b.o
 snd-soc-jz4760-codec-objs := jz4760.o
@@ -496,6 +497,7 @@ obj-$(CONFIG_SND_SOC_ICS43432)	+= snd-soc-ics43432.o
 obj-$(CONFIG_SND_SOC_IDT821034)	+= snd-soc-idt821034.o
 obj-$(CONFIG_SND_SOC_INNO_RK3036)	+= snd-soc-inno-rk3036.o
 obj-$(CONFIG_SND_SOC_ISABELLE)	+= snd-soc-isabelle.o
+obj-$(CONFIG_SND_SOC_JH7110_PWMDAC_DIT)	+= snd-soc-jh7110-pwmdac-dit.o
 obj-$(CONFIG_SND_SOC_JZ4740_CODEC)	+= snd-soc-jz4740-codec.o
 obj-$(CONFIG_SND_SOC_JZ4725B_CODEC)	+= snd-soc-jz4725b-codec.o
 obj-$(CONFIG_SND_SOC_JZ4760_CODEC)      += snd-soc-jz4760-codec.o
diff --git a/sound/soc/codecs/jh7110_pwmdac_transmitter.c b/sound/soc/codecs/jh7110_pwmdac_transmitter.c
new file mode 100644
index 000000000000..69077be840c7
--- /dev/null
+++ b/sound/soc/codecs/jh7110_pwmdac_transmitter.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Dummy PWM-DAC transmitter driver for the StarFive JH7110 SoC
+ *
+ * Copyright (C) 2021-2023 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <sound/initval.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
+
+#define DRV_NAME "pwmdac-dit"
+
+static const struct snd_soc_dapm_widget dit_widgets[] = {
+	SND_SOC_DAPM_OUTPUT("pwmdac-out"),
+};
+
+static const struct snd_soc_dapm_route dit_routes[] = {
+	{ "pwmdac-out", NULL, "Playback" },
+};
+
+static const struct snd_soc_component_driver soc_codec_pwmdac_dit = {
+	.dapm_widgets		= dit_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(dit_widgets),
+	.dapm_routes		= dit_routes,
+	.num_dapm_routes	= ARRAY_SIZE(dit_routes),
+	.idle_bias_on		= 1,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+};
+
+static struct snd_soc_dai_driver dit_stub_dai = {
+	.name		= "pwmdac-dit-hifi",
+	.playback	= {
+		.stream_name	= "Playback",
+		.channels_min	= 1,
+		.channels_max	= 384,
+		.rates		= SNDRV_PCM_RATE_8000_48000,
+		.formats	= SNDRV_PCM_FMTBIT_S16_LE,
+	},
+};
+
+static int pwmdac_dit_probe(struct platform_device *pdev)
+{
+	return devm_snd_soc_register_component(&pdev->dev,
+					       &soc_codec_pwmdac_dit,
+					       &dit_stub_dai, 1);
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id pwmdac_dit_dt_ids[] = {
+	{ .compatible = "starfive,jh7110-pwmdac-dit", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pwmdac_dit_dt_ids);
+#endif
+
+static struct platform_driver pwmdac_dit_driver = {
+	.probe		= pwmdac_dit_probe,
+	.driver		= {
+		.name	= DRV_NAME,
+		.of_match_table = of_match_ptr(pwmdac_dit_dt_ids),
+	},
+};
+
+module_platform_driver(pwmdac_dit_driver);
+
+MODULE_DESCRIPTION("StarFive JH7110 dummy PWM-DAC transmitter driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
