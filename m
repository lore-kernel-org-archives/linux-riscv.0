Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA60C54E49
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 08:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/zaowQSKtT/DBhDsXl10yQfzFfxwryP+A0x60pRQwsI=; b=0ZPM86C39ThHcd
	LHbL1kj7yiDWiHA0n5jSoin7Wg62LDtaCnPDPKiW7XH1LxaBkrUwH45pU8EJA14QXekllSiLqTmtx
	2ek8yzjUVe9AQOAXYL6qvcO1m4LRc0tNL71w0DEXZhitXYSdc7jSqyoR+gCPYyb4kHQur/ivienb0
	xnFkfjBBcWe+0M4jcpTnhZbiBGynkGiLyq+KRpvbCaD7g3MJsT3Ttihn+Z4MjSfN97xw1nGzexsfi
	+qRK6MkBo4pOZzM/8pwGYSBDsH5ckj/Uek24xbTiZ1YW9UuTHb53Mvdg4E71BxIpTAU6c2KXO6N+s
	Ac7ipEXznGB9dhMMkxDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdQuU-00000008TIi-0ieh;
	Fri, 23 Feb 2024 08:28:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdQuJ-00000008T6o-0bFK
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 Feb 2024 08:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qTr2+PqAnvK9X/YZnyvAos4+4N6czGUqcVm1e1lr76A=; b=SZCyGGO395HSuGiZlbkk8YXPGG
	goW5Nd4kNN9m0RrcQfXjap6accglJGTGqPwyFfMusqQi+6V04EPKOjPv39eiqtsUsDFh184ChwlT8
	PQyRamXmsnO2nrgrjAS+QsmZf4XroAmascdHW0vKjAJZr6B0OMW4/KY6DyBJSA/JKjc/PhrhLVNqb
	24Ryfg8cFaVvnq+1YHk8PntN6A4t5T7vC/vfjz7CfskfadYYT4NOyn1KWn4FqbXjOIr/4vkMsx6Fk
	xJxtdr8VzJ9v3QHkLEEyDVRmnakhXAq9/foZoK3WOcoIcg/7U08B9r7E0OLrGofYuB0zNd8RJtL6F
	J92BfjZQ==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdQuG-00000006KN6-0kRU
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 08:27:46 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2997a92e23bso468743a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 23 Feb 2024 00:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708676798; x=1709281598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTr2+PqAnvK9X/YZnyvAos4+4N6czGUqcVm1e1lr76A=;
        b=Sg/39pdRoo3pBUBqZnkR3EA26rO21P28Lk5u1FqXBELa66S7aU+zNDjQFDWgR+tdhj
         syyDY2CT3hTP/PQvly5TuNN2e5IR584F5EP0tg6rqQQddNpWM5RtlJokFvC4OQPnUDvs
         JRaJk2WBNNsxgxMDmAvBMAPGKdIIXt5MUpDaArxswsAojs6m9KTropa5bLZrtH1+vevs
         LtHScMeEPkw0Ma0D2TVBaRIWa66TU6Mgv7cmVJBHro4FXtuAl6QFtPyF+5jG7rVmxW/e
         LOAqAwV2/DCQezLVGplUV3Gh5LLEoeWTWXP/EgTiaOFzolDBHfHHXf5Xc3hHAFqhy4Mv
         IxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708676798; x=1709281598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTr2+PqAnvK9X/YZnyvAos4+4N6czGUqcVm1e1lr76A=;
        b=Si5cs4o6WEuPgfU8ZR0/HQvI6i0XIhY3PD4OtpmJ0oOrlt5i9SzUOjQsezQq3fu7Ie
         6UK0QLcgFDqs5g1gmiW0UdBcbEm0NQiQFVVKSXOTLFO4HLlb5YIbk5loPwEjJZ7s3qH+
         mHxZTgyKsJR8aAsC/heCMiVGMgJQT1rk6TuO3/bwnIyJPDD9SUk56LYE46aqoKtYw0Rf
         R8y61V2/Aq08wNwnRHMB6Li+gMVNAahNAIjQ6mW7t9rqJz/UWRMIGRUzF63II7lAwC/y
         Latk05MGy0eGrQfuswM+Kp08pdVTkmmBJ0lHPBTZUAaNZTSCLqR15OqT023PDOhUztih
         ZIJA==
X-Forwarded-Encrypted: i=1; AJvYcCUu9DaJaX4kMtatUbUGVAdeGduqUCDOug66gy5S8DGGrMJHU+yNCThSVxc59BjCbB/+ZAQ3WOvw5AN29BrnJseeAyvhkKbq9DC/RN5haNg0
X-Gm-Message-State: AOJu0YzeRgUiBz8NBv5ERTFQH8rYPcRqeJL04yZEK4xQN7Gyid6DVmBx
	u5z6oYZ2WXJ2GG3rERlaQv97gvqtLTayiJEG8MAPB5kx8urY2Dzn
X-Google-Smtp-Source: AGHT+IFoFoCXFLU/CwtPl83Yd2UtmThoMh16Aj8GM17nwA3naAxiuJDHV7fUqyodGNmSdsRJLxThrQ==
X-Received: by 2002:a17:90a:90f:b0:29a:6d06:6253 with SMTP id n15-20020a17090a090f00b0029a6d066253mr909056pjn.41.1708676797422;
        Fri, 23 Feb 2024 00:26:37 -0800 (PST)
Received: from localhost ([46.3.240.105])
        by smtp.gmail.com with ESMTPSA id n5-20020a17090a928500b0029967638141sm829131pjo.37.2024.02.23.00.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 00:26:37 -0800 (PST)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: u.kleine-koenig@pengutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dlan@gentoo.org,
	inochiama@outlook.com,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Subject: [PATCH v3 2/2] pwm: sophgo: add pwm support for Sophgo CV1800 SoC
Date: Fri, 23 Feb 2024 16:26:32 +0800
Message-Id: <20240223082632.109767-1-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240223082014.109385-1-qiujingbao.dlmu@gmail.com>
References: <20240223082014.109385-1-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_082744_231796_D375E595 
X-CRM114-Status: GOOD (  25.50  )
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

Implement the PWM driver for CV1800.

Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
---
 drivers/pwm/Kconfig      |  10 ++
 drivers/pwm/Makefile     |   1 +
 drivers/pwm/pwm-cv1800.c | 259 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 270 insertions(+)
 create mode 100644 drivers/pwm/pwm-cv1800.c

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 4b956d661755..455f07af94f7 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -186,6 +186,16 @@ config PWM_CROS_EC
 	  PWM driver for exposing a PWM attached to the ChromeOS Embedded
 	  Controller.
 
+config PWM_CV1800
+	tristate "Sophgo CV1800 PWM driver"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	help
+	  Generic PWM framework driver for the Sophgo CV1800 series
+	  SoCs.
+
+	  To compile this driver as a module, build the dependecies
+	  as modules, this will be called pwm-cv1800.
+
 config PWM_DWC_CORE
 	tristate
 	depends on HAS_IOMEM
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index c5ec9e168ee7..6c3c4a07a316 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_PWM_CLK)		+= pwm-clk.o
 obj-$(CONFIG_PWM_CLPS711X)	+= pwm-clps711x.o
 obj-$(CONFIG_PWM_CRC)		+= pwm-crc.o
 obj-$(CONFIG_PWM_CROS_EC)	+= pwm-cros-ec.o
+obj-$(CONFIG_PWM_CV1800)	+= pwm-cv1800.o
 obj-$(CONFIG_PWM_DWC_CORE)	+= pwm-dwc-core.o
 obj-$(CONFIG_PWM_DWC)		+= pwm-dwc.o
 obj-$(CONFIG_PWM_EP93XX)	+= pwm-ep93xx.o
diff --git a/drivers/pwm/pwm-cv1800.c b/drivers/pwm/pwm-cv1800.c
new file mode 100644
index 000000000000..da1309dc0091
--- /dev/null
+++ b/drivers/pwm/pwm-cv1800.c
@@ -0,0 +1,259 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * pwm-cv1800.c: PWM driver for Sophgo cv1800
+ *
+ * Author: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
+ *
+ * Limitations:
+ * - It output low when PWM channel disabled.
+ * - This pwm device supports dynamic loading of PWM parameters. When PWMSTART
+ *   is written from 0 to 1, the register value (HLPERIODn, PERIODn) will be
+ *   temporarily stored inside the PWM. If you want to dynamically change the
+ *   waveform during PWM output, after writing the new value to HLPERIODn and
+ *   PERIODn, write 1 and then 0 to PWMUPDATE[n] to make the new value effective.
+ * - Supports up to Rate/2 output, and the lowest is about Rate/(2^30-1).
+ * - By setting HLPERIODn to 0, can produce 100% duty cycle.
+ */
+
+#include <linux/clk.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/regmap.h>
+
+#define PWM_CV1800_HLPERIOD_BASE 0x00
+#define PWM_CV1800_PERIOD_BASE 0x04
+#define PWM_CV1800_PWM_CV1800_POLARITY 0x40
+#define PWM_CV1800_START 0x44
+#define PWM_CV1800_DONE 0x48
+#define PWM_CV1800_UPDATE 0x4c
+#define PWM_CV1800_OE 0xd0
+
+#define PWM_CV1800_HLPERIOD(n) (PWM_CV1800_HLPERIOD_BASE + ((n) * 0x08))
+#define PWM_CV1800_PERIOD(n) (PWM_CV1800_PERIOD_BASE + ((n) * 0x08))
+
+#define PWM_CV1800_UPDATE_MASK(n) (BIT(0) << (n))
+#define PWM_CV1800_OE_MASK(n) (BIT(0) << (n))
+#define PWM_CV1800_START_MASK(n) (BIT(0) << (n))
+
+#define PWM_CV1800_MAXPERIOD (BIT(30) - 1)
+#define PWM_CV1800_MINPERIOD BIT(1)
+#define PWM_CV1800_MINHLPERIOD BIT(0)
+#define PWM_CV1800_PERIOD_RESET BIT(1)
+#define PWM_CV1800_HLPERIOD_RESET BIT(0)
+#define PWM_CV1800_REG_DISABLE 0x0U
+#define PWM_CV1800_REG_ENABLE(n) (BIT(0) << (n))
+
+struct cv1800_pwm {
+	struct regmap *map;
+	struct clk *clk;
+	unsigned long clk_rate;
+};
+
+static inline struct cv1800_pwm *to_cv1800_pwm_dev(struct pwm_chip *chip)
+{
+	return pwmchip_get_drvdata(chip);
+}
+
+static const struct regmap_config cv1800_pwm_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int cv1800_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm,
+			     bool enable)
+{
+	struct cv1800_pwm *priv = to_cv1800_pwm_dev(chip);
+	u32 pwm_enable;
+
+	regmap_read(priv->map, PWM_CV1800_START, &pwm_enable);
+	pwm_enable &= PWM_CV1800_START_MASK(pwm->hwpwm);
+
+	/*
+	 * If the parameters are changed during runtime, Register needs
+	 * to be updated to take effect.
+	 */
+	if (pwm_enable && enable) {
+		regmap_update_bits(priv->map, PWM_CV1800_UPDATE,
+				   PWM_CV1800_UPDATE_MASK(pwm->hwpwm),
+				   PWM_CV1800_REG_ENABLE(pwm->hwpwm));
+		regmap_update_bits(priv->map, PWM_CV1800_UPDATE,
+				   PWM_CV1800_UPDATE_MASK(pwm->hwpwm),
+				   PWM_CV1800_REG_DISABLE);
+	} else if (!pwm_enable && enable) {
+		regmap_update_bits(priv->map, PWM_CV1800_OE,
+				   PWM_CV1800_OE_MASK(pwm->hwpwm),
+				   PWM_CV1800_REG_ENABLE(pwm->hwpwm));
+		regmap_update_bits(priv->map, PWM_CV1800_START,
+				   PWM_CV1800_START_MASK(pwm->hwpwm),
+				   PWM_CV1800_REG_ENABLE(pwm->hwpwm));
+	} else if (pwm_enable && !enable) {
+		regmap_update_bits(priv->map, PWM_CV1800_OE,
+				   PWM_CV1800_OE_MASK(pwm->hwpwm),
+				   PWM_CV1800_REG_DISABLE);
+		regmap_update_bits(priv->map, PWM_CV1800_START,
+				   PWM_CV1800_START_MASK(pwm->hwpwm),
+				   PWM_CV1800_REG_DISABLE);
+	}
+
+	return 0;
+}
+
+static int cv1800_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			    const struct pwm_state *state)
+{
+	struct cv1800_pwm *priv = to_cv1800_pwm_dev(chip);
+	u32 period_val, hlperiod_val;
+	u64 tem;
+
+	if (state->polarity != PWM_POLARITY_NORMAL)
+		return -EINVAL;
+
+	/*
+	 * This hardware use PERIOD and HLPERIOD registers to represent PWM waves.
+	 *
+	 * The meaning of PERIOD is how many clock cycles (from the clock source)
+	 * are used to represent PWM waves.
+	 * PERIOD = rate(MHz) / target(MHz)
+	 * PERIOD = period(ns) * rate(Hz) / NSEC_PER_SEC
+	 * The meaning of HLPERIOD is the number of low-level cycles in PERIOD.
+	 * HLPERIOD = PERIOD - rate(MHz) / duty(MHz)
+	 * HLPERIOD = PERIOD - (duty(ns) * rate(Hz) / NSEC_PER_SEC)
+	 */
+	tem = mul_u64_u64_div_u64(state->period, priv->clk_rate, NSEC_PER_SEC);
+	if (tem < PWM_CV1800_MINPERIOD)
+		return -EINVAL;
+
+	if (tem > PWM_CV1800_MAXPERIOD)
+		tem = PWM_CV1800_MAXPERIOD;
+
+	period_val = (u32)tem;
+
+	tem = mul_u64_u64_div_u64(state->duty_cycle, priv->clk_rate,
+				  NSEC_PER_SEC);
+	if (tem > period_val)
+		return -EINVAL;
+	hlperiod_val = period_val - (u32)tem;
+
+	regmap_write(priv->map, PWM_CV1800_PERIOD(pwm->hwpwm), period_val);
+	regmap_write(priv->map, PWM_CV1800_HLPERIOD(pwm->hwpwm), hlperiod_val);
+
+	cv1800_pwm_enable(chip, pwm, state->enabled);
+
+	return 0;
+}
+
+static int cv1800_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				struct pwm_state *state)
+{
+	struct cv1800_pwm *priv = to_cv1800_pwm_dev(chip);
+	u32 period_val, hlperiod_val;
+	u64 period_ns = 0;
+	u64 duty_ns = 0;
+	u32 enable = 0;
+
+	regmap_read(priv->map, PWM_CV1800_PERIOD(pwm->hwpwm), &period_val);
+	regmap_read(priv->map, PWM_CV1800_HLPERIOD(pwm->hwpwm), &hlperiod_val);
+
+	if (period_val != PWM_CV1800_PERIOD_RESET ||
+	    hlperiod_val != PWM_CV1800_HLPERIOD_RESET) {
+		period_ns = DIV_ROUND_UP_ULL(period_val * NSEC_PER_SEC, priv->clk_rate);
+		duty_ns = DIV_ROUND_UP_ULL(hlperiod_val * period_ns, period_val);
+
+		regmap_read(priv->map, PWM_CV1800_START, &enable);
+
+		enable &= PWM_CV1800_START_MASK(pwm->hwpwm);
+	}
+
+	state->period = period_ns;
+	state->duty_cycle = duty_ns;
+	state->enabled = enable;
+	state->polarity = PWM_POLARITY_NORMAL;
+
+	return 0;
+}
+
+static const struct pwm_ops cv1800_pwm_ops = {
+	.apply = cv1800_pwm_apply,
+	.get_state = cv1800_pwm_get_state,
+};
+
+static void devm_clk_rate_exclusive_put(void *data)
+{
+	struct clk *clk = data;
+
+	clk_rate_exclusive_put(clk);
+}
+
+static int cv1800_pwm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cv1800_pwm *priv;
+	struct pwm_chip *chip;
+	void __iomem *base;
+	int ret;
+
+	chip = devm_pwmchip_alloc(dev, 4, sizeof(*priv));
+	if (!chip)
+		return PTR_ERR(chip);
+
+	priv = to_cv1800_pwm_dev(chip);
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	priv->map = devm_regmap_init_mmio(&pdev->dev, base,
+					  &cv1800_pwm_regmap_config);
+	if (IS_ERR(priv->map))
+		return PTR_ERR(priv->map);
+
+	priv->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk),
+				     "clk not found\n");
+
+	ret = clk_rate_exclusive_get(priv->clk);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to get exclusive rate\n");
+
+	ret = devm_add_action_or_reset(&pdev->dev, devm_clk_rate_exclusive_put,
+				       priv->clk);
+	if (ret) {
+		clk_rate_exclusive_put(priv->clk);
+		return ret;
+	}
+
+	priv->clk_rate = clk_get_rate(priv->clk);
+	if (!priv->clk_rate)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "Invalid clock rate: %lu\n",
+				     priv->clk_rate);
+
+	chip->ops = &cv1800_pwm_ops;
+
+	return devm_pwmchip_add(dev, chip);
+}
+
+static const struct of_device_id cv1800_pwm_dt_ids[] = {
+	{ .compatible = "sophgo,cv1800-pwm" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, cv1800_pwm_dt_ids);
+
+static struct platform_driver cv1800_pwm_driver = {
+	.driver = {
+		.name = "cv1800-pwm",
+		.of_match_table = cv1800_pwm_dt_ids,
+	},
+	.probe = cv1800_pwm_probe,
+};
+module_platform_driver(cv1800_pwm_driver);
+
+MODULE_AUTHOR("Jingbao Qiu");
+MODULE_DESCRIPTION("Sophgo cv1800 PWM Driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
