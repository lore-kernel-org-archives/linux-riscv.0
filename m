Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1723C44527
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 10:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pymdWPgJ4/MOvsahymo1zN8xdmSDtVRXSWj3U/3g9FQ=; b=dFYlcBmmE+JiDd
	wVV03jdLNI7uJmHBCPdvW68tqu7TFmN/TXm03a2QA44GTu3CLiF8u4ZiKmZOc7np+HaRU7odz0sDA
	TrNtfBjESc2iuQV6j8mP8u/PI2cwSvbZKqWEZGUI1TPt2sd2UzwDYitUv8lwJGZzD2rZfvOsZQMNg
	fR2bRKsbgAfQhnTpNXiPIxGucx5AkaRZhSUdelqPthrAP6ND8U90LzaJeGWV5it9VmgLjsSdjdkNN
	Y/K6zKsmjJ68zUhHtEYdE6+KXuBNv0OYtTouuUMr/9E3O3z+we4r0c8Drqe+bkdPw/VWlAQRChtyV
	dEaH/311FrDPF8fs0OeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllMC-00000006V9Y-0TGe;
	Mon, 20 Jul 2026 10:36:20 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllM9-00000006V8Y-21Lu
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 10:36:18 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-848d21bbaffso9761933b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 03:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784543777; x=1785148577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3oqW8KaEsXv0dXUfcgcDqMh+LX2DCloRVbZb54sf32E=;
        b=s9t3N4ZXPqiBoeAvIjGjU/XCVGcT9mVPonPyAZTujDA3Yv8GPwbbwoxBNRKH1l2+DH
         PLGIbittsX7p51qM8pT0T2wGwt1FEU6UV64B65nssMxu1ay91i0NfovXeu8pV/HXeYvC
         ofPXpILDJ0jHU4lu8bG+/hppjRhlpJ7Fn2WsLMmZCJ9r9CpGaVcd1P0w5q93u7NMwVys
         qrO6OQ+wm2ynEVXD9X7ybRHirvT4+Y8r8X0JjZoWljsghBi+fJk4L2yfkcgXLTvujciM
         jMFJiFnuOa3Li7oponJYpC+tTU0/ok5rLLup2MxWhveM5lyKGChmkOEzvLKsB/aU1yp6
         68nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784543777; x=1785148577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3oqW8KaEsXv0dXUfcgcDqMh+LX2DCloRVbZb54sf32E=;
        b=HYn7L6igCnVp78KleifLl3wY5/ybWU2rXWZu9eQxp1/U4Sv5nG8d3FQ3mwULvHYGx+
         kdSM9DizAK2MjIK3T4HpA+itKnfIqK/6NObIc7g8lGA2YhPm+fElfIw8u9VgcMu9+6CN
         Ei1NAJBCgO1Zsz8kqOxLg9TJFBmXRuazSuAph7zRuPcA2C5Ubg6Kias+Yri0nFslOf96
         rar3Mlv3sRZiE+OnJhtvRsoESJTJ11Yh7PKklyAcxMjyHHS2Wc2XB5hVxJX2OoGv7iOx
         f1K/BdsDg+q2z7nIv+eWHV8ahTmqyMr4vO7Jp3eJ9fMKg1q1cCVP91IwpuCSOriakwp1
         b9jA==
X-Forwarded-Encrypted: i=1; AHgh+Rpu5GmfI2stZqcUZBXz1WdlXgoVZZUsHp7LKwvKdt5z+9tUx1bF6z2gCz5ZvsyWcawbzmsBKt8dUbw6wA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwP2ffVuWIQ5C+x75zKXUMZZbyXTD/pem9V48AMlF2h7F+dcvpU
	OJlRfAaUYD8f4BOjGC787rewE5wOH3leJesxX6hs8VDT4uTNiFjEZ0Q=
X-Gm-Gg: AfdE7ckfjS0qS0xwcKhszqKRHxEtdp3GIFm/PCEmHR2B8F+mQBopRDy1x+94tCAhQ1z
	33nKPL+/WNhP4wsx6QaM7XbuzuAmd8OLABvvmytqEvq4H1eU6nVE+WEvNzns2t9xIZw00DrLTt/
	yjYE+okPpbq0RArtcKE42vPdqKhWaokYgRSvQB+qyzxoJJIs+Cub6nl+bcpoGjjwuEpA2iFjJXX
	b8Y42XpKsGrQEFvAqKCnHyh6vK1sumYaOsEpi50b6wx47uHqTLE8iAgywP6pyGsUar/Iq9o4rMo
	ffopm7gmUlzFW123zv9cYQ8JShKD46+HjtRwKbAiTO5IbavM/TYVARxy57fHpe5hHBihDH+7zOy
	2UM/oeZyaoka/ZIj71pZMBLljmBYrJpeodeQQC2SAPPtloxZ89UHCG5onNITQBD35SVYDqYC7Ey
	uON0Qv/lal5nntZbhCTcKidFG6rA==
X-Received: by 2002:a05:6a20:728a:b0:3c3:a1e6:a62a with SMTP id adf61e73a8af0-3c3ad99c684mr14396156637.63.1784543776540;
        Mon, 20 Jul 2026 03:36:16 -0700 (PDT)
Received: from t-rex ([2401:4900:c200:8f2e:8d2c:f805:595:9600])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429ff04absm32697446eec.8.2026.07.20.03.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:36:15 -0700 (PDT)
From: kr494167@gmail.com
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	dlan@kernel.org
Cc: rui.zhang@intel.com,
	lukasz.luba@arm.com,
	shuwei.wu@mailbox.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	surendra <kr494167@gmail.com>
Subject: [PATCH] thermal: spacemit: validate clamped trip thresholds
Date: Mon, 20 Jul 2026 16:06:06 +0530
Message-ID: <20260720103606.93924-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_033617_519700_E1379833 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

From: surendra <kr494167@gmail.com>

k1_tsensor_set_trips() checks the requested trip temperatures before
converting them to the sensor register representation. Distinct
out-of-range temperatures can clamp to the same hardware value, leaving the
sensor with an invalid low/high threshold pair.

Validate the ordering after conversion and clamping.

Fixes: 296a977f2bac ("thermal/drivers/spacemit/k1: Add thermal sensor support")
Signed-off-by: surendra <kr494167@gmail.com>
---
 drivers/thermal/spacemit/k1_tsensor.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/spacemit/k1_tsensor.c b/drivers/thermal/spacemit/k1_tsensor.c
index 79222d233129..a9eaedefdac3 100644
--- a/drivers/thermal/spacemit/k1_tsensor.c
+++ b/drivers/thermal/spacemit/k1_tsensor.c
@@ -156,13 +156,12 @@ static int k1_tsensor_set_trips(struct thermal_zone_device *tz, int low, int hig
 	struct k1_tsensor *ts = ch->ts;
 	u32 val;
 
-	if (low >= high)
-		return -EINVAL;
-
 	low = clamp_val(low / 1000 + TEMPERATURE_OFFSET, TEMPERATURE_OFFSET,
 			FIELD_MAX(K1_TSENSOR_THRSH_LOW_MASK));
 	high = clamp_val(high / 1000 + TEMPERATURE_OFFSET, TEMPERATURE_OFFSET,
 			 FIELD_MAX(K1_TSENSOR_THRSH_HIGH_MASK));
+	if (low >= high)
+		return -EINVAL;
 
 	val = readl(ts->base + K1_TSENSOR_THRSH_REG(ch->id));
 
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
