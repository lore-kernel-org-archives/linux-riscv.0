Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37522C369D7
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3G69vOLWCRc5L4cuKKoDHhv0lp2W6JceNyecTLRz7ys=; b=aC21IUFMJUTufx
	TM5bqU3ZMmk6QMDrFAVIVUFY9I//75mvqETiO8BhL1CB8kvg6PB0DgffdxC/IyQfv+bLSlqeaI+A7
	P+EIUPp0fSmGVMF3GCex30cESGEs3IvSQZcCmbQkdLw2mfszfGj4Vnz8rwcg26DjcFafkTgcIQKHK
	KLWbAD/vsWDoMkrBG1i1byHcUgXg7MzGWgkORadNxjLM81pbOEQw1FWYi4kgOCxv/mPY2gm7+lsyd
	2aUmM61rEwtNtJ82zRhSSLrTiGeNTU59mGeh9pYDB0vdJAICabhtxardDMaMNzRDZTkZllldxZFbe
	vYD7WZpxNxiCl5TYyxqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AEJ-00000006cAv-46eA;
	Tue, 22 Apr 2025 09:47:51 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79D2-00000006OfL-05bD
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 08:42:29 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-225477548e1so47021145ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Apr 2025 01:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745311347; x=1745916147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89q5KIPhl5BwNYn6HnfG+6c7PCM/cs0DxATEzoR1SG4=;
        b=MD4D+tLGF3Uj5iwJNgfShA82CAret3V8CP0YEgPxCwDhcejA7Tr0CLAss4N/6R75UD
         qsmSIRaop2tlkoshCT9xDgUfzgLMJBp3CdXJCQM5/SEXnBIfaA8Xt62IuH/alzNFbVtH
         HJc1ckqPO8xOoU6Ahx020y2es5Le9mGQ/D1OMtzH8bHh85QvVutOCs/B+eJrn0YKuMtt
         A2D85cVcQLG+5zXATOAwGcZrgasw5A8HH+qdW6F+iAOiqWIatb6ktA8bdQr0NWDpBVKV
         yL8cnDp7HNHVVxGNVaTaivvLEYT6uX63Me7R/wunZQ4BP4TuvwCaiiNKit8/R1GvC32a
         +4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745311347; x=1745916147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89q5KIPhl5BwNYn6HnfG+6c7PCM/cs0DxATEzoR1SG4=;
        b=n2Qm9wO0iQ0lwiJngY3kwQWn3NuPipc/VxgDoWyB/Ib+Gwfoacvzai/4AWBgT5fOx9
         blISiV8DNLSmyfD3RGUWqbNZM3zSP3HCsFstkGaYNgBncrq1hJFJsiJKp7WjqIyj/VUY
         8jPtAlrq23Rja4KSm/+Ejrg/NwGFz4jj/DxoKh/kzVM4QiNvYLcfF5LyEnwvQxW0/mXv
         zrvW8WWI5w0IWFwqGh3OdHM8YYEISqr84l+/85yF21aNXiooefkyuTqmW3BSMuh9h+eu
         HPyTnKAMuFhP7dbCX8hoOi6UKE8oAe4dm9bvHcDBFXOX2UpAwo8fLro/vz40ufTL9MkI
         IhVA==
X-Gm-Message-State: AOJu0Yytb2ZMpGR8ejS0R6DXxSOnsM9u1DRM/LEgOYpi+A6r7cs7qj8j
	l8XklQF8Y4d/7xL+bpDsQtX9AIGUFmgpJeNL9TdZGMsZ1trMGcFApSvbnPWffMg=
X-Gm-Gg: ASbGnctUHDHpDbHCNmwLmgR7RybG867helEeNSi4s3yjbeUeADYtGGiYAZY9cYufUe6
	n3qP9XuguF1wLDbpXkH+89OzZ2yKMIxgeKVBB9Ua8kamzr/LX3U9xj/hbTNP2qtyoBXPHnN5+ai
	+TWI8IHrnSizYYS169E8/HSpfEvrflSORy0Ykfk/THR4d9GcEFskRTMw4aZjgLJ0zucB8uTMD50
	QUYYAAyuOxer1hPQbaBv+y4RNpXE0cmZf10QBF0LviK/CV2sUXfTJ+Dwee/WXLiRY78IlyMgVPy
	p10HDPs+VIR78NoZJcw4AYiE8iGjbI4S6fjUDDpa1oWuKBRRXZX4EjatVhfFeHll91lFDyyvDQR
	1ZQ==
X-Google-Smtp-Source: AGHT+IG6i6LASvzQIRsj01arYQDJviqBEn/oP/EmdDE8D+TJPVgUwa41kw2BKL7zCVHOsNc3CK8D2g==
X-Received: by 2002:a17:902:cf07:b0:220:f140:f7be with SMTP id d9443c01a7336-22c53601243mr243185875ad.41.1745311347173;
        Tue, 22 Apr 2025 01:42:27 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf90d7f7sm8038343b3a.82.2025.04.22.01.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:42:26 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Nylon Chen <nylon.chen@sifive.com>,
	Zong Li <zong.li@sifive.com>
Subject: [PATCH v12 5/5] pwm: sifive: clarify inverted compare logic in comments
Date: Tue, 22 Apr 2025 16:53:12 +0800
Message-Id: <20250422085312.812877-6-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422085312.812877-1-nylon.chen@sifive.com>
References: <20250422085312.812877-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_014228_189276_6AF14954 
X-CRM114-Status: GOOD (  12.95  )
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

The reference manual says "pwms >= pwmcmpX -> HIGH", but in Figure 29 pwmcmpXcenter
is forced to 0 via an XOR, so hardware actually outputs HIGH when pwms < pwmcmpX.
Thus pwmcmp holds the off-period count, and the driver must invert it
to expose a normal active-high interface.

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index 065d6d2b84bc..a1f13801bca4 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -4,11 +4,28 @@
  * For SiFive's PWM IP block documentation please refer Chapter 14 of
  * Reference Manual : https://static.dev.sifive.com/FU540-C000-v1.0.pdf
  *
+ * PWM output inversion: According to the SiFive Reference manual
+ * the output of each comparator is high whenever the value of pwms is
+ * greater than or equal to the corresponding pwmcmpX[Reference Manual].
+ *
+ * Figure 29 in the same manual shows that the pwmcmpXcenter bit is
+ * hard-tied to 0 (XNOR), which effectively inverts the comparison so that
+ * the output goes HIGH when  `pwms < pwmcmpX`.
+ *
+ * In other words, each pwmcmp register actually defines the **inactive**
+ * (low) period of the pulse, not the active time exactly opposite to what
+ * the documentation text implies.
+ *
+ * To compensate, this driver always **inverts** the duty value when reading
+ * or writing pwmcmp registers , so that users interact with a conventional
+ * **active-high** PWM interface.
+ *
+ *
  * Limitations:
  * - When changing both duty cycle and period, we cannot prevent in
  *   software that the output might produce a period with mixed
  *   settings (new period length and old duty cycle).
- * - The hardware cannot generate a 100% duty cycle.
+ * - The hardware cannot generate a 0% duty cycle.
  * - The hardware generates only inverted output.
  */
 #include <linux/clk.h>
@@ -113,6 +130,10 @@ static int pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	u32 duty, val, inactive;
 
 	inactive = readl(ddata->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
+	/*
+	 * PWM hardware uses 'inactive' counts in pwmcmp, so invert to get actual duty.
+	 * Here, 'inactive' is the low time and we compute duty as max_count - inactive.
+	 */
 	duty = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - inactive;
 
 	state->enabled = duty > 0;
@@ -161,6 +182,7 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	do_div(frac, state->period;
 	/* The hardware cannot generate a 0% duty cycle */
 	frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
+	/* pwmcmp register must be loaded with the inactive(invert the duty) */
 	inactive = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;
 
 	mutex_lock(&ddata->lock);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
