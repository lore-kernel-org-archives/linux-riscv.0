Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BF2C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 10:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7vc4jCzbWTKeecJjO8nTjw6CKYjs026Zi47OY5FNfU=; b=FQ2doQ25Sd2BcV
	W1pLpYau842yCkaVAUTLOv3iNx0cVogM5Hx1gKglIYsPjOu0iWZEsfQ1Zk6rbfeiUAOxkHP2dsXy8
	7IDOvKL/h5vI3oftDoZm5YQW0k9n9hKzDCAx5Um4rGXrXDBsUBQR2zkfSIGlU7DLHCoeWQ/pDdOAl
	pFCtvz65Do1qNGz/fohDTBhBXes5JFxaNw22ecWnzUMg4TcFCUe3ODWO+L/dUojXiQ6qFa7dEWQ7L
	tIEyFqL0inwaJtIP5FRUW3hgItbO9iDMftYnJeCeVWwhISsUSudpD6VOpe6ohZczO6oxBxpveXp26
	DByCPg0I2tL462Wi/v9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGG0u-002NnJ-1X;
	Thu, 21 Dec 2023 10:10:48 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGG0r-002Nlr-2E;
	Thu, 21 Dec 2023 10:10:47 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a236d77dceeso69936266b.2;
        Thu, 21 Dec 2023 02:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703153442; x=1703758242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QMQp28PVkuOsPBKyVgYS5Ymf4YAkrOuT5kryWvtFrk=;
        b=IAspYxXZehkY04QWVi1AMfGRZYi5JYqZ7LKGWWNmn4FgDT1qeHjCIBB/2eWzQAogjK
         iRadfrAN4AQSLJf7VsvRLfEqxlCeIYl5R5cB1nbXozmGsZ2wzAzci/cvmRYORQ+8Z9In
         dTnBQkZmJPuR2iCL0zz886SWyqdEMvO7PuDvMkF70Fjl1OtgbChzOwyu2BiHrK5IVhfW
         2Zu2tBUijOiOiZX6zdm8pjfuvq6Gc3gdgiKccA1kb4tme2q2qm72qMM+SnReQAgQJtat
         oiPWHAMTPStAChTI85nCLF5ZfA0U81P1K4caa0VC4WC0exSq6xIZw+gIeVg9Nfmc7a28
         iz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703153442; x=1703758242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QMQp28PVkuOsPBKyVgYS5Ymf4YAkrOuT5kryWvtFrk=;
        b=MOJ7LEB17Pjl2ovsfSO1h7jcEUx4II7G30RU+3uMXWhDaXBqwAdez8XiFPva8KIKbw
         SZyM8KXeLK4SIalhHrLHPuJSh3HwyR7iVqFWwLBlI8K6htzuWjcsR3L3n2New8Vn+e8O
         +MdHJm+Ymo5ijti+V1YvXuJ41/BH5WnY2iBr1QqjZ7hLYiq54/hiOiX1Jbf27WlJbsL7
         s3l1vOfSXdxxV5FX4xvRwAzoWlcQfdwszec7CYzCA0gltheY+6u+sMI5A3td8FSUM+kE
         sQfx3GOb22h6datLz5GAadcX/Mwo0GpEmMddzMcemmWZAX8O6xgImPZNmUyd0LuLj/IQ
         0+Yg==
X-Gm-Message-State: AOJu0YypPdunaDdO02Sc4D6uPRjpJ0HcRRpJGbHzzduAbbfB7miOv8GG
	f4jFVHv2OGAJTiuxByGbis0sTaIXuQzH4Q==
X-Google-Smtp-Source: AGHT+IGXjrE90/2KzHJgTFiU2ndSeAIZdngOEf0GUcN28R/bVeQcO0PAgHNRNaNMWci22btJbMGnsQ==
X-Received: by 2002:a17:906:5306:b0:a26:9fa0:5b4b with SMTP id h6-20020a170906530600b00a269fa05b4bmr363273ejo.226.1703153442340;
        Thu, 21 Dec 2023 02:10:42 -0800 (PST)
Received: from localhost.localdomain ([154.72.163.204])
        by smtp.gmail.com with ESMTPSA id x7-20020a170906b08700b00a25f5dba09dsm784928ejy.145.2023.12.21.02.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 02:10:41 -0800 (PST)
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
	Viresh Kumar <viresh.kumar@linaro.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [RFC PATCH v2 1/3] cpufreq: sun50i: Refactor speed bin decoding
Date: Thu, 21 Dec 2023 11:10:11 +0100
Message-Id: <20231221101013.67204-2-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231221101013.67204-1-fusibrandon13@gmail.com>
References: <20231221101013.67204-1-fusibrandon13@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_021045_729462_1C974F77 
X-CRM114-Status: GOOD (  16.66  )
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

Make converting the speed bin value into a speed grade generic
and determined by a platform specific callback.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 55 ++++++++++++++++++--------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index 32a9c88f8..fc509fc49 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -25,6 +25,38 @@
 
 static struct platform_device *cpufreq_dt_pdev, *sun50i_cpufreq_pdev;
 
+struct sunxi_cpufreq_data {
+	u32 (*efuse_xlate)(u32 *speedbin, size_t len);
+};
+
+static u32 sun50i_efuse_xlate(u32 *speedbin, size_t len)
+{
+	u32 efuse_value = 0;
+
+	efuse_value = (*speedbin >> NVMEM_SHIFT) & NVMEM_MASK;
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
+struct sunxi_cpufreq_data sun50i_cpufreq_data = {
+	.efuse_xlate = sun50i_efuse_xlate,
+};
+
+static const struct of_device_id cpu_opp_match_list[] = {
+	{ .compatible = "allwinner,sun50i-h6-operating-points",
+	  .data = &sun50i_cpufreq_data,
+	},
+	{}
+};
+
 /**
  * sun50i_cpufreq_get_efuse() - Determine speed grade from efuse value
  * @versions: Set to the value parsed from efuse
@@ -36,9 +68,10 @@ static int sun50i_cpufreq_get_efuse(u32 *versions)
 	struct nvmem_cell *speedbin_nvmem;
 	struct device_node *np;
 	struct device *cpu_dev;
-	u32 *speedbin, efuse_value;
+	const struct of_device_id *match;
+	const struct sunxi_cpufreq_data *opp_data;
+	u32 *speedbin;
 	size_t len;
-	int ret;
 
 	cpu_dev = get_cpu_device(0);
 	if (!cpu_dev)
@@ -48,12 +81,12 @@ static int sun50i_cpufreq_get_efuse(u32 *versions)
 	if (!np)
 		return -ENOENT;
 
-	ret = of_device_is_compatible(np,
-				      "allwinner,sun50i-h6-operating-points");
-	if (!ret) {
+	match = of_match_node(cpu_opp_match_list, np);
+	if (!match) {
 		of_node_put(np);
 		return -ENOENT;
 	}
+	opp_data = match->data;
 
 	speedbin_nvmem = of_nvmem_cell_get(np, NULL);
 	of_node_put(np);
@@ -66,17 +99,7 @@ static int sun50i_cpufreq_get_efuse(u32 *versions)
 	if (IS_ERR(speedbin))
 		return PTR_ERR(speedbin);
 
-	efuse_value = (*speedbin >> NVMEM_SHIFT) & NVMEM_MASK;
-
-	/*
-	 * We treat unexpected efuse values as if the SoC was from
-	 * the slowest bin. Expected efuse values are 1-3, slowest
-	 * to fastest.
-	 */
-	if (efuse_value >= 1 && efuse_value <= 3)
-		*versions = efuse_value - 1;
-	else
-		*versions = 0;
+	*versions = opp_data->efuse_xlate(speedbin, len);
 
 	kfree(speedbin);
 	return 0;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
