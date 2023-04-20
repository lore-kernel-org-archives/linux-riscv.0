Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D71C77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 09:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7epVNFHhl9O86TnhNPCMECj7T7W/KQzuuQ0maWLhPIM=; b=elRrQA0YY6xzhJ
	S5So4ki4t5GKhEEXcyFm8NGrT+BD40iE+UUYIoirkaEFe/LHP9XWppwWt1lOHdUORIxsaUZMnphfe
	QS61tAYzNOwO3Pjmt7afZPgA85DiW4so8UO/8ur5xWBcrIIErCkislfTEPaNWWtSPQmjtcAiHy2WR
	JQglJW8g2o01QWkmNKh2kjXdSBuPffT2DwepR3202U9zwbNd2y0z6/erSwRZdEnTZFIb4Hll1o5W/
	msUeeIjjuXgZQ9DyWhi00dBX5/soe3SlCs6d5ESum03HyPvU7tDzd0zV5ro4A6mjc8Ob2ExMTgrk2
	I0aU2Ubxa4J59S1JPwEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQhE-007Y3M-0B;
	Thu, 20 Apr 2023 09:35:20 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQhA-007Y2C-2i
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 09:35:18 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-517bdd9957dso588669a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Apr 2023 02:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681983314; x=1684575314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ryva+FQmb09SgOiCE7P4pQBiT6BdeSdh3y4Qn91oZ9M=;
        b=d4ER6huQjMtUV4wHdMb9ME9KpU3d2FGtvqsgiDTUlUyLvDePcXJ0PKh98S6NEnsa2G
         XpQA1rCPbkz2/bCmmRIw/iKSY7Jc/iG598aSV3OIGqyeUx4IBcGUZKtO4vIBwSqT9r0P
         p5FSKMM0VYyfyGjMat2EmIyNNAimvy6yE8WNCYrKGxEhDc/YAWf+Pc70ybdNvL8zO+JA
         QpNju3Pf0hJEFC4gFdxrSa9X6mz6r/WWX5OMVqulCgrYK2qAWDlWa525eBQUcoKAVN9a
         K70k1rCm/C/aU30qmXDSBl7EG/LeuOhixKwJILpFQprjgRGLNArBduUmQD/Zx6K1YSUy
         l2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681983314; x=1684575314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ryva+FQmb09SgOiCE7P4pQBiT6BdeSdh3y4Qn91oZ9M=;
        b=gPdvYiyJpbJXovgtXzRNLK6qsRTSInt9KDY/IajlJBVEMaVlfm/QzoM3gOELXvayX5
         fqKynwcL4GxzqX/32PkbZAEGhm9f3yYpwA9+2WCtEcm7K5zhIlb6vcaYHOx7heQT1Hn8
         3wqmBV51skGAcgbsT07B/7LDAPPlNk52PJ1ZVTJfojRHlaVDQvRBMjrK/f50ONIMfhmG
         4mEfeDiolwn65Vudw0ST5M03QvKkax5GZxplFojzBh+s7goyhcZWg/ZiVN8oCHHFliRy
         fcXTkHlCOOyJNbyv/tPFKL1BplaIf1Por2+yxLYSbsuJqAr98i3hOkWA9lowkdCpxNRC
         lX/w==
X-Gm-Message-State: AAQBX9ec8i6f61HoL9qWC4XS350xKjeDg2NT5a0dZRaw7RAq+amxUuKq
	HoF//ndU5/POvAcF4z2NhPEUwQ==
X-Google-Smtp-Source: AKy350br6fKdRCr0Nj4YKMv9Nvtjoq+VqjzrOMC15lETcCmUtAqFU5evu54VS9v+FLXPiour7tCHKQ==
X-Received: by 2002:a17:90b:10c:b0:23f:9fac:6b35 with SMTP id p12-20020a17090b010c00b0023f9fac6b35mr1017558pjz.39.1681983313820;
        Thu, 20 Apr 2023 02:35:13 -0700 (PDT)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id p5-20020a63c145000000b0051ba9d772f9sm781551pgi.59.2023.04.20.02.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 02:35:13 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: aou@eecs.berkeley.edu,
	conor@kernel.org,
	emil.renner.berthing@canonical.com,
	geert+renesas@glider.be,
	heiko@sntech.de,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: nylon.chen@sifive.com,
	nylon7717@gmail.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/2] pwm: sifive: change the PWM controlled LED algorithm
Date: Thu, 20 Apr 2023 17:34:57 +0800
Message-Id: <20230420093457.18936-3-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420093457.18936-1-nylon.chen@sifive.com>
References: <20230420093457.18936-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_023516_883700_029503F9 
X-CRM114-Status: GOOD (  11.54  )
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

The `frac` variable represents the pulse inactive time, and the result of
this algorithm is the pulse active time. Therefore, we must reverse the
result.

The reference is SiFive FU740-C000 Manual[0]

Link: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b16acba_fu740-c000-manual-v1p6.pdf [0]

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index 393a4b97fc19..d5d5f36da297 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -132,13 +132,13 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 {
 	struct pwm_sifive_ddata *ddata = pwm_sifive_chip_to_ddata(chip);
 	struct pwm_state cur_state;
-	unsigned int duty_cycle;
+	unsigned int duty_cycle, period;
 	unsigned long long num;
 	bool enabled;
 	int ret = 0;
 	u32 frac;
 
-	if (state->polarity != PWM_POLARITY_INVERSED)
+	if (state->polarity != PWM_POLARITY_NORMAL && state->polarity != PWM_POLARITY_INVERSED)
 		return -EINVAL;
 
 	cur_state = pwm->state;
@@ -154,10 +154,13 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * calculating the register values first and then writing them
 	 * consecutively
 	 */
+	period = max(state->period, ddata->approx_period);
 	num = (u64)duty_cycle * (1U << PWM_SIFIVE_CMPWIDTH);
 	frac = DIV64_U64_ROUND_CLOSEST(num, state->period);
-	/* The hardware cannot generate a 100% duty cycle */
 	frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
+	/* The hardware cannot generate a 100% duty cycle */
+	frac = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;
+
 
 	mutex_lock(&ddata->lock);
 	if (state->period != ddata->approx_period) {
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
