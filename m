Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99EEC46CD3
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 09:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2urRRG27FvfQMDyaOJmcCldibNWNFOjHspq5HUeely8=; b=gI6tqwgMQcAg/Q
	G4+IHwT7FSHb9uQppWsyf3bm1EhOuoarNc+JT4VhJ5j45NKLV3HjsAWrtRChb/zFuXTvUS985gxu8
	TwPrLOXBxLfCVJoVGQZKaXqjo7W10VuPD+JMOj2aMYzTEqUEztQ4qKk0Ilg42Y19Dru1nE8Ys+Gi9
	rq7v2GFuuXkNSmIeiVBxLZJXOEiPVNVEIxLY4FFqkDS42mvKX6GInkp10twfurPPhbYf6k6AWzOvq
	bKQVRDfBINWgwIiAijY2BYp484tX2pP2vzCqUqp0Y12PHgkP7TH58WpPWvFyw0NWqKM1XkE0oW/tF
	f43hm6PFeypT0uaZyW9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFtFQ-00GmGR-1C;
	Wed, 20 Dec 2023 09:52:16 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFtFL-00GmDx-2u;
	Wed, 20 Dec 2023 09:52:13 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a2340c803c6so437170566b.0;
        Wed, 20 Dec 2023 01:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703065927; x=1703670727; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvAwavagWNrO/Q9Vdb9xCDrUrBaPNjWgjY6N/TwA0bg=;
        b=egJFbfbdZCPkeg7J66miAQ4OJSGl/yz8JZ7jrcTERQeulYIJlOiEhktefy8VkJ3TQh
         0K2XrRqAI8tIug5/qbQFFMvzg8jQmm2UkfvfyW6xI/ORBUAf9eqvTzrHi/mot6S6LK6m
         Jf290P7Br2vKOTMi04k+p0BKo1VIq6tgOZqOgwNO8FdyTHf5QQGrmc/sUM1ayaNl4bQL
         q2R3chVbd7qbOecqaKeZWDpzCGzXTccVGZDNIoms4MUEyy43T9faFHeCcYG4ITTuIA6p
         iQQU7rT3rv6p2rBUgcsk2KyKUG7ToQbfvqgzbIXzWhkZe4/3b6ohQ2K2OLH5m7Qmozpm
         7yOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703065927; x=1703670727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvAwavagWNrO/Q9Vdb9xCDrUrBaPNjWgjY6N/TwA0bg=;
        b=q7mFPaOAmMvJM7Vx4mns+3gj1Ss1ebTcYCO7Mdcj0wp8Y6qpgxozIht34fTOpkyC3s
         xYmF1TRX96AFIXUPwOSia27iPr5lO4TuWNlCvILHA6i9YYEBXrgCKkikglaeI88YyBAV
         y4SNtbDPN16r+0FGZi0Ec5P6L5ZxN8l8/+BvN7b2eW3fZkzlszRiLZOti1fpWWybRBd1
         7Pq/mtwu3CdL5pXPBBWx86xV6ebbcOzsLMirVWYbQMAKuuf0r8uj2lZ2qfzH435CrjRF
         98ni8sObVO3kFFVu8EYMSK+UucyyE2wH+O+NzRtJbYvdROFR3T5sIVecVnJeuWuXebrJ
         1mBg==
X-Gm-Message-State: AOJu0YxnV4vDhQcQzX01lkEaEZmGvyLg8sUnoOCsaAHgekjrduhb32/F
	CimaVGx8BNpgZwT9E8QEjZQ=
X-Google-Smtp-Source: AGHT+IHJLTFVlMeVWUfl2R/aVxV5HUEVW0LFkZhbSzhOrR+n633yl76oiQKvS23mYKEl1VoOE8yaXA==
X-Received: by 2002:a17:906:1787:b0:a19:a1ba:8cd6 with SMTP id t7-20020a170906178700b00a19a1ba8cd6mr9779000eje.116.1703065927014;
        Wed, 20 Dec 2023 01:52:07 -0800 (PST)
Received: from localhost.localdomain ([154.72.162.158])
        by smtp.gmail.com with ESMTPSA id st3-20020a170907c08300b00a1c4fde4e88sm16596791ejc.18.2023.12.20.01.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 01:52:06 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [RFC PATCH 1/2] cpufreq: sun50i: Add support for D1's speed bin decoding
Date: Wed, 20 Dec 2023 10:51:40 +0100
Message-Id: <20231220095141.27883-2-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231220095141.27883-1-fusibrandon13@gmail.com>
References: <20231220095141.27883-1-fusibrandon13@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_015211_938077_497F85F3 
X-CRM114-Status: GOOD (  18.94  )
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

Adds support for decoding the efuse value read from D1 efuse speed
bins, and factors out equivalent code for sun50i.

The algorithm is gotten from

https://github.com/Tina-Linux/linux-5.4/blob/master/drivers/cpufreq/sun50i-cpufreq-nvmem.c#L293-L338

and maps an efuse value to either 0 or 1, with 1 meaning stable at
a lower supply voltage for the same clock frequency.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 85 +++++++++++++++++++++-----
 1 file changed, 70 insertions(+), 15 deletions(-)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index ccf83780f..28afbe558 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -25,6 +25,66 @@
 
 static struct platform_device *cpufreq_dt_pdev, *sun50i_cpufreq_pdev;
 
+struct sunxi_cpufreq_data {
+	u32 (*efuse_xlate)(u32 efuse_value);
+};
+
+static u32 sun20i_efuse_xlate(u32 efuse_value)
+{
+	u32 ret;
+
+	switch (efuse_value) {
+	case 0x5e00:
+		/* QFN package */
+		ret = 0;
+		break;
+	case 0x5c00:
+	case 0x7400:
+		/* QFN package */
+		ret = 1;
+		break;
+	case 0x5000:
+	default:
+		/* BGA package */
+		ret = 0;
+	}
+
+	return ret;
+}
+
+static u32 sun50i_efuse_xlate(u32 efuse_value)
+{
+	efuse_value = (efuse_value >> NVMEM_SHIFT) & NVMEM_MASK;
+
+	/*
+	* We treat unexpected efuse values as if the SoC was from
+	* the slowest bin. Expected efuse values are 1-3, slowest
+	* to fastest.
+	*/
+	if (efuse_value >= 1 && efuse_value <= 3)
+		return efuse_value - 1;
+	else
+		return 0;
+}
+
+struct sunxi_cpufreq_data sun20i_cpufreq_data = {
+	.efuse_xlate = sun20i_efuse_xlate,
+};
+
+struct sunxi_cpufreq_data sun50i_cpufreq_data = {
+	.efuse_xlate = sun50i_efuse_xlate,
+};
+
+static const struct of_device_id cpu_opp_match_list[] = {
+	{ .compatible = "allwinner,sun50i-h6-operating-points",
+	  .data = &sun50i_cpufreq_data,
+	},
+	{ .compatible = "allwinner,sun20i-d1-operating-points",
+	  .data = &sun20i_cpufreq_data,
+	},
+	{}
+};
+
 /**
  * sun50i_cpufreq_get_efuse() - Determine speed grade from efuse value
  * @versions: Set to the value parsed from efuse
@@ -36,9 +96,11 @@ static int sun50i_cpufreq_get_efuse(u32 *versions)
 	struct nvmem_cell *speedbin_nvmem;
 	struct device_node *np;
 	struct device *cpu_dev;
-	u32 *speedbin, efuse_value;
+	const struct of_device_id *opp_match;
+	const struct sunxi_cpufreq_data *opp_data;
+	u32 *speedbin, efuse_value = 0;
 	size_t len;
-	int ret;
+	int i;
 
 	cpu_dev = get_cpu_device(0);
 	if (!cpu_dev)
@@ -48,9 +110,8 @@ static int sun50i_cpufreq_get_efuse(u32 *versions)
 	if (!np)
 		return -ENOENT;
 
-	ret = of_device_is_compatible(np,
-				      "allwinner,sun50i-h6-operating-points");
-	if (!ret) {
+	opp_match = of_match_node(cpu_opp_match_list, np);
+	if (!opp_match) {
 		of_node_put(np);
 		return -ENOENT;
 	}
@@ -66,17 +127,11 @@ static int sun50i_cpufreq_get_efuse(u32 *versions)
 	if (IS_ERR(speedbin))
 		return PTR_ERR(speedbin);
 
-	efuse_value = (*speedbin >> NVMEM_SHIFT) & NVMEM_MASK;
+	for (i = 0; i < len; i++)
+		efuse_value |= ((u32)speedbin[i] << (i * 8));
 
-	/*
-	 * We treat unexpected efuse values as if the SoC was from
-	 * the slowest bin. Expected efuse values are 1-3, slowest
-	 * to fastest.
-	 */
-	if (efuse_value >= 1 && efuse_value <= 3)
-		*versions = efuse_value - 1;
-	else
-		*versions = 0;
+	opp_data = opp_match->data;
+	*versions = opp_data->efuse_xlate(efuse_value);
 
 	kfree(speedbin);
 	return 0;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
