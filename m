Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378C9C369C2
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 02:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pYi+5iWxux8TuLlNyMvEZjeabF6841ZGdWK0G/MuQIM=; b=onZYJllFdm1qnz
	ibMBSzFBl46Xxq0WkWviScaM3CWPreBm2LxTKF1nLwJPeGp/YBkKvNulGQbnCYIS6kb9C1l89Dw2j
	Pz29/iTdo9xXYP9rirk108H5fho8sgblRAtaI+RMQ5hmyqZMw2ai7u4/0D67l9j7rWjzROqloIZMz
	baV81gnYL9Bp8B1GM6h8SCu330bj+QPcG3M9G/Aqg+U6lyhceaBtkVF5SvhtMMgjlg8qJpIUhoxsM
	Xx3LFSeph/C6P2Wh6PYgWvlCulb6Uh5R8W70kyku7m/NewJpHLVhfZK/bDIhNU9xwNYLhLKptmKvk
	BScKymIbHtFuBqMZ8Qzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5bV3-0000000EsIZ-1zGH;
	Fri, 18 Apr 2025 02:30:41 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5bV1-0000000EsHa-1yZE
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 02:30:40 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22c33677183so18190715ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 19:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744943438; x=1745548238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhyHi9uQpRULTwQZULLja3qU3XsixSmtudhV3coPhWg=;
        b=Sj+rMepzmDblYPY5RVLoDge1VdncYPNaFZj3HTrHy//deb7yIrPj9XuUyJ37B/YU7d
         YWy5kn6bNwwRjeTGpwxtG1giTfYeTmr4t2ddF7A6Jpr1ZO5QmERbJDfzeJhP4mUFgskA
         Y4bH4p6rFkVBF8zhx7kje0/ExatYDYVjIIRU6tu7xgy3flDTt7Rc+605RZGAaPqLgRCi
         S3CBRfLk2Vl5SBsH8/AszUzF6eAy/E1/WySmdfJ3uP0QnYj5Smi786V7UZCt8fxugoGX
         Q5ot5IpnqzhJfu+jhTec3MbQnqrieF13mVSnDsQFiz08BPh9yjyNIHDnzT2RA8tmVQfV
         cc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744943438; x=1745548238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhyHi9uQpRULTwQZULLja3qU3XsixSmtudhV3coPhWg=;
        b=jD6PkJsWmPFNCT8IOCs4nRRVWbMyyZw1hrfqbR8R0Uc7MbyEZKR67a+4SF61cG0EzO
         2QcPZ8WF27NYmHCsKXycp+9pTuRt5CuJ2LuhJhj6ZABm0hTUrO6wCKbgwB2y54HA4biQ
         9QzIZYaQTjWqaSoebraF1a7lx0Vt8JHzZ5oft3i17FzrLY6awP6clZF+TjcBNmRyD0Np
         i7siQ1ysELGtIkcOj9ET/8k7xt5DdypHKVdI2KmK2a+pCfelHqagp3AWHc4THzbLZmtt
         DWaNXMRNH//k3DTm8ET9ktiNiI+DzeVViC1MRLT2P+Nr1ENdRbOsoY5jWh60I4AjVV8W
         c2EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWEOpWlwcBKwRGpk4YYarEWkLgXjf384a2dbyH+vmKB8ouRTIpjgLj4nm2q0P7B9C0HUyRQnTfe7xjlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXOxuIZGZyqGpmazHNqOdrQ8SLatE7BNxjKqaRFs6iT+quNYoG
	AF321Awe+x3IRr0RtMDp0vt57JcIlnyntI+ILoppVcyzz8YbjhLx
X-Gm-Gg: ASbGncti+kFTjbC3e5bVzdSnEieYZOwZ/NiNv9xNxFhWTch3Eui3HqL1fKerLBYkEdF
	SZuuUJ5XZzW8jcR4/+PbqoH52/trf4k8BwdEMY9/5fYAG3aYrlo8deZZl33yuiQ5W2KaBpx+34F
	prOfrVD8kwwzzUQ7sqmJ9nZ/IU3tyFlzoMnNTkGD8FAx+VVkbla8ra84wxRQeSLt9SPN/u0V8K+
	ETJdN0oGPvK5lR1qPlM2J7z4RGV1UiV6ZTjiidJpQ5g/F8xGvXghm5Z2GoYPaErS/bvz4WQ+ids
	3MCWwc/8mn2C/PAleXuB5QXIuDuzcwp+ivQ=
X-Google-Smtp-Source: AGHT+IHo/o4KQhGB66PuErDoqro0sabaeHOL40TB7KoY2oAF3V05eK3U8JRd5gLiVCzL4LU7JUlRpw==
X-Received: by 2002:a17:903:41c7:b0:215:b1a3:4701 with SMTP id d9443c01a7336-22c5359b5damr16046695ad.13.1744943438447;
        Thu, 17 Apr 2025 19:30:38 -0700 (PDT)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df0c14esm182185a91.19.2025.04.17.19.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 19:30:37 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/3] pwm: sophgo: add driver for SG2044
Date: Fri, 18 Apr 2025 10:29:46 +0800
Message-ID: <20250418022948.22853-4-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418022948.22853-1-looong.bin@gmail.com>
References: <20250418022948.22853-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_193039_510270_4D66B72B 
X-CRM114-Status: GOOD (  17.30  )
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

Add PWM controller for SG2044 on base of SG2042.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 drivers/pwm/pwm-sophgo-sg2042.c | 89 ++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg2042.c
index 23a83843ba53..26147ec596c9 100644
--- a/drivers/pwm/pwm-sophgo-sg2042.c
+++ b/drivers/pwm/pwm-sophgo-sg2042.c
@@ -13,6 +13,9 @@
  *   the running period.
  * - When PERIOD and HLPERIOD is set to 0, the PWM wave output will
  *   be stopped and the output is pulled to high.
+ * - SG2044 support polarity while SG2042 does not. When PWMSTART is
+ *   false, POLARITY being NORMAL will make output being low,
+ *   POLARITY being INVERSED will make output being high.
  * See the datasheet [1] for more details.
  * [1]:https://github.com/sophgo/sophgo-doc/tree/main/SG2042/TRM
  */
@@ -26,6 +29,10 @@
 #include <linux/pwm.h>
 #include <linux/reset.h>

+#define SG2044_REG_POLARITY		0x40
+#define SG2044_REG_PWMSTART		0x44
+#define SG2044_REG_PWM_OE		0xD0
+
 #define SG2042_PWM_HLPERIOD(chan) ((chan) * 8 + 0)
 #define SG2042_PWM_PERIOD(chan) ((chan) * 8 + 4)

@@ -72,8 +79,8 @@ static void pwm_set_dutycycle(struct pwm_chip *chip, struct pwm_device *pwm,
 	period_ticks = min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->period, NSEC_PER_SEC), U32_MAX);
 	hlperiod_ticks = min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->duty_cycle, NSEC_PER_SEC), U32_MAX);

-	dev_dbg(pwmchip_parent(chip), "chan[%u]: PERIOD=%u, HLPERIOD=%u\n",
-		pwm->hwpwm, period_ticks, hlperiod_ticks);
+	dev_dbg(pwmchip_parent(chip), "chan[%u]: ENABLE=%u, PERIOD=%u, HLPERIOD=%u, POLARITY=%u\n",
+		pwm->hwpwm, state->enabled, period_ticks, hlperiod_ticks, state->polarity);

 	pwm_sg2042_config(ddata, pwm->hwpwm, period_ticks, hlperiod_ticks);
 }
@@ -123,6 +130,74 @@ static int pwm_sg2042_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }

+static void pwm_sg2044_set_start(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				 bool enabled)
+{
+	u32 pwm_value;
+
+	pwm_value = readl(ddata->base + SG2044_REG_PWMSTART);
+
+	if (enabled)
+		pwm_value |= BIT(pwm->hwpwm);
+	else
+		pwm_value &= ~BIT(pwm->hwpwm);
+
+	writel(pwm_value, ddata->base + SG2044_REG_PWMSTART);
+}
+
+static void pwm_sg2044_set_outputdir(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				     bool enabled)
+{
+	u32 pwm_value;
+
+	pwm_value = readl(ddata->base + SG2044_REG_PWM_OE);
+
+	if (enabled)
+		pwm_value |= BIT(pwm->hwpwm);
+	else
+		pwm_value &= ~BIT(pwm->hwpwm);
+
+	writel(pwm_value, ddata->base + SG2044_REG_PWM_OE);
+}
+
+static void pwm_sg2044_set_polarity(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				    const struct pwm_state *state)
+{
+	u32 pwm_value;
+
+	pwm_value = readl(ddata->base + SG2044_REG_POLARITY);
+
+	if (state->polarity == PWM_POLARITY_NORMAL)
+		pwm_value &= ~BIT(pwm->hwpwm);
+	else
+		pwm_value |= BIT(pwm->hwpwm);
+
+	writel(pwm_value, ddata->base + SG2044_REG_POLARITY);
+}
+
+static int pwm_sg2044_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			    const struct pwm_state *state)
+{
+	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
+
+	pwm_sg2044_set_polarity(ddata, pwm, state);
+
+	pwm_set_dutycycle(chip, pwm, state);
+
+	/*
+	 * re-enable PWMSTART to refresh the register period
+	 */
+	pwm_sg2044_set_start(ddata, pwm, false);
+
+	if (!state->enabled)
+		return 0;
+
+	pwm_sg2044_set_outputdir(ddata, pwm, true);
+	pwm_sg2044_set_start(ddata, pwm, true);
+
+	return 0;
+}
+
 static const struct sg2042_chip_data sg2042_chip_data = {
 	.ops = {
 		.apply = pwm_sg2042_apply,
@@ -130,9 +205,18 @@ static const struct sg2042_chip_data sg2042_chip_data = {
 	}
 };

+static const struct sg2042_chip_data sg2044_chip_data = {
+	.ops = {
+		.apply = pwm_sg2044_apply,
+		.get_state = pwm_sg2042_get_state,
+	}
+};
+
 static const struct of_device_id sg2042_pwm_ids[] = {
 	{ .compatible = "sophgo,sg2042-pwm",
 	  .data = &sg2042_chip_data },
+	{ .compatible = "sophgo,sg2044-pwm",
+	  .data = &sg2044_chip_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sg2042_pwm_ids);
@@ -198,5 +282,6 @@ static struct platform_driver pwm_sg2042_driver = {
 module_platform_driver(pwm_sg2042_driver);

 MODULE_AUTHOR("Chen Wang");
+MODULE_AUTHOR("Longbin Li <looong.bin@gmail.com>");
 MODULE_DESCRIPTION("Sophgo SG2042 PWM driver");
 MODULE_LICENSE("GPL");
--
2.49.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
