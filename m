Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B91C369C2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5uBqadZ1/dNd5FA6RfLl4zXSsTPpTucWbiPswwkVN8=; b=FtekVhnCw30oh4
	rA+t1/PRcjW0KpUsW3LiSzxfIJXo15GNNTmxVOldWc7PzrUCNNXnX7QR5ceZoBi4i5XTvqeNxlU6x
	AnemisX1Vz2hlYY9LcfGBjNZsBwfxkHSKEcRA40hPWJtYExgtD0EVJmfgPwIf6yzXH38675OKr2b3
	QUhe8Yjhb3Ltfmsy1ON7/6lAOYUXRbfK+e+VGsIYDOhXxMJzBYIen8SyBLJH26mXcxZzeebCBfXst
	56I1VUpV+TlawJUa/otg4dyciXpdg2g5FhkO7e9s7WCLumot6bAI2ZseMhYSKKZtWlrtgNQhCfEH5
	PUDTXdh8t110xfmeb7+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AEJ-00000006cAN-1Hj7;
	Tue, 22 Apr 2025 09:47:51 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79Cw-00000006OdI-1FQG
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 08:42:23 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-736b98acaadso4524264b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 22 Apr 2025 01:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745311341; x=1745916141; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kd2q5FNIM78jM5HghPwsl1jyBcissy+tuMihRdmdhE=;
        b=YAZlCki8Ia1AFqjm9k6AEMWJYvxTijF2dxvqVv7eB1VebnTOwgkoQX8NFiynBcDhBz
         BN9Y1mavbv3lAK9K3Yov0KdQOyMIkl4Lz2gtFLSh3MTai3q9XVDwNSqyHr7A1FhM0npE
         3MxSkXHqRX+OLeI1CSd7T9EEg7DSRreZs3Ad4ABTaes8PEztPo5vp3XEDIxphGLx/MTZ
         EOtXE5BVHvWR0QZEzSQjSkfpIx39Y2lFtLCwXOjEAsw6RiZNUPHfflti4yZDeFcmM1Cr
         h7TIf6+ueqefjsH8Wipc/mLeFV+5OIJZUv1OeAX+ZSQCiqZjOaaVIuaPO6EJA86JOIAd
         YTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745311341; x=1745916141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kd2q5FNIM78jM5HghPwsl1jyBcissy+tuMihRdmdhE=;
        b=eRaWkm9PZvUhh0ceB3p/2DTfyBzP4uoelsTmtsTHv/PYUk5bu6mxv35lfpr6t0J0SJ
         QDU1cAqL3h+Du9SJo34KdHU7CvLV2zzzHi9pY1De6LLl6Vn4W1WmEKaZpneQYJ1Z9oaj
         a99Wtg7VVORN5fyWkD/MRL86dEJPkm38oJxZOsHKoCYk96RDrMPqUmP1sWVbe9ejT0Q7
         bHtiK9IPgKON134V4YYbvq/TkPE+unPfdS0zEAbcxnaRp2gNnopqMIzmqECjrZeKSatC
         uOuNnRB9joJjaPv45BLm+8stSjPMJjeAQdeO9yQEXUXWhFpJ4b5gsxitsppXKeKtOmoY
         U9eA==
X-Gm-Message-State: AOJu0YyLXhxqILafIKUiR40Z4SzzP2he1zw2SQCOXkXENZDAueuXIhK2
	YVIxK1XLfMJ0W0zfSqvTOzaMuu6tNua1+Qe7ZTM2agZ8f8gB5elfbqy/OtHgr3Y=
X-Gm-Gg: ASbGncsG3PkeKmFZERe4Oguhx2MqfOXSP6p+Z2n7XuCM19EbAdB2bbsEFIvQSH/xTj/
	HKxCdT9IunUs1H86LC0vI9wwb9Or0tv/UAN4tjP4i62B0G0zo4aK1lvntO7MG7xh+Y2WLpQtGh/
	6m6vFGO/S8a6hgTJd5PHVJa7FWPCnnednrhMjNgMsG5/WtiXS9+pMA6rEpteq2+DjSdVffo6few
	/odXJf2LKED2djv427dt5rxSgLq1DuPe4Y7g+Ab1+aucI9c7CSIm3qPaIbDHmuqpL+a8IiFfHfV
	y1YiFM2xbsNvTkXYd9lE202CasEWvc7T2b4bvQ7kjrNs8+BbvdB1hTcSfCpN8h/Oz4Ihcp1PChr
	5nQ==
X-Google-Smtp-Source: AGHT+IFXZZ39jj72YYhr/K/5oJ3Ngnd4eF5Q61F34OsaTVnM0ysvTXVv8micdw2peLTPVFWC++GWNQ==
X-Received: by 2002:a05:6a20:9f07:b0:1ee:e96a:d9ed with SMTP id adf61e73a8af0-203cbc251cbmr24313065637.7.1745311341488;
        Tue, 22 Apr 2025 01:42:21 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf90d7f7sm8038343b3a.82.2025.04.22.01.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:42:21 -0700 (PDT)
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
Subject: [PATCH v12 4/5] pwm: sifive: Fix rounding issues in apply and get_state functions
Date: Tue, 22 Apr 2025 16:53:11 +0800
Message-Id: <20250422085312.812877-5-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422085312.812877-1-nylon.chen@sifive.com>
References: <20250422085312.812877-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_014222_363982_93DFCA90 
X-CRM114-Status: GOOD (  10.06  )
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

Fix PWM apply and get_state rounding to ensure consistency between
setting and reading values

This fixes the reported errors:
pwm-sifive 10021000.pwm: .apply is supposed to round down
duty_cycle (requested: 360/504000, applied: 361/504124)
pwm-sifive 10021000.pwm: .apply is supposed to round down
period (requested: 504000, applied: 504124)

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 drivers/pwm/pwm-sifive.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index 6259f8500f71..065d6d2b84bc 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -122,8 +122,8 @@ static int pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		state->enabled = false;
 
 	state->period = ddata->real_period;
-	state->duty_cycle =
-		(u64)duty * ddata->real_period >> PWM_SIFIVE_CMPWIDTH;
+	state->duty_cycle = DIV_ROUND_UP_ULL((u64)duty * ddata->real_period,
+					     (1U << PWM_SIFIVE_CMPWIDTH));
 	state->polarity = PWM_POLARITY_NORMAL;
 
 	return 0;
@@ -157,7 +157,8 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * consecutively
 	 */
 	num = (u64)duty_cycle * (1U << PWM_SIFIVE_CMPWIDTH);
-	frac = DIV64_U64_ROUND_CLOSEST(num, state->period);
+	frac = num;
+	do_div(frac, state->period;
 	/* The hardware cannot generate a 0% duty cycle */
 	frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
 	inactive = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
