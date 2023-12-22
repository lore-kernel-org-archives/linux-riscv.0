Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4C0C46CD8
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 11:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ylsg0sh1ZFgUWiFmAgaTUsbRrUwaHT66tAfZNl5a1ts=; b=egStbBA2xX+V/P
	W6QYOxzsOw9Hf/FYt/vPO7wUrN1tgCFRBUslbvVUNWQfQ3kSjEhd3/Gq/ge1AG5FIu/Yj5ZgwOIkb
	x3Ni2AxYVIp5h6YNsZtWR5UpalpcZZnyVGOQc2ruNlIXUa7nwxceoRxksRlO/Yt8PA9LegGXdusor
	DDptsdycG/FePhMKwr0g45JoRRhXr7bH9MGc4sWTadTp48/83A6bS0nQMw+gZweWQnoXL6EGTVjaD
	bCEm52nyXAD5JQo0Wgv5nBO4/22BcWGfCLoqMuwcrPksLA09QaF/Hj8qPY2Iw2TbEjm7VZEHcD6V3
	lYVzyJ6IX0fOHssiPj3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdUR-005dRF-28;
	Fri, 22 Dec 2023 11:14:51 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdUO-005dPM-0Z;
	Fri, 22 Dec 2023 11:14:50 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2cca5e7b390so13081031fa.3;
        Fri, 22 Dec 2023 03:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703243684; x=1703848484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7DGrzlVlvs9gxszkU6Ibjz+3jgxk5y/rrrR3fSlR9s=;
        b=ACPCFLL+E0fHr7zggvwszw8yWTo3nQhFre+ky0EPu7uj4f+gP0SRKOzVthKTgEpunt
         3gsGF45aca6Wx5aSQyr0crWCIWPxIlGIW+QFj1JHSN46LIHm0/Hx2WgMyDTHURn9Ino2
         RGdb7cYTmlP+Ow6oT41WDBE/IuH1phitS53GhfI+1CQM5lJ9nMxyMeWXLRioRauQ7rDp
         L/1oWdsWRcy7CI4x3yvbTOdXj41GCusoJJltaz3eQmIOutFzZh7yINoXeQgK8EHjZpYT
         4jh7i1yB1/TfcR5rgfxty+fVOGf45XKc8vR75lzTgSFoXpNt3pMxLP1egopv9f9PFABR
         zVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703243684; x=1703848484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7DGrzlVlvs9gxszkU6Ibjz+3jgxk5y/rrrR3fSlR9s=;
        b=TM/QwJKmqTGQ6UAJ/YQukL5m7e82ytuwZ2f8Q4PSUiq5NNWblJn87PY3I+crteGUc6
         kHy7JLXLlvd1REfmwqDNx1WDO11/MtsGAj2sQ7IX/zIjZVfi+Dh1HLgBeKH5V6niTEAf
         grUV6qvOIhq0MCpgwfJigdSFhy2cghgmThSkOg0kFNwMwJ7ava9Lb3euujAfJmz7PkVC
         iyfDl+isERpbuRpeylGa7QYeGbsdlonUbt3wTxsTB/wnnt6Q6eBVQkGLXLiJU160mXQU
         rXyrFW4ViKAUTM82ZYRar6mMAPom+gLEhJ6cp+JIMMeLjfzxEzRbitARksu52Fm2KHC7
         4Y/Q==
X-Gm-Message-State: AOJu0YzfahqL6CC5SKs+N3pss+W3cSk3HhJqCcGSQDnVWhrFySFx2NyG
	Iag8aqUeRINjJdNrrWehi7g=
X-Google-Smtp-Source: AGHT+IHg0MuEsdR3YNmYjR54tmAi0CP4dEHlQyIUYDid2LMDCv5m0mmnyatup9/AcekOKefeZufagg==
X-Received: by 2002:a2e:2ac2:0:b0:2cc:5dc2:3f09 with SMTP id q185-20020a2e2ac2000000b002cc5dc23f09mr542885ljq.44.1703243684017;
        Fri, 22 Dec 2023 03:14:44 -0800 (PST)
Received: from localhost.localdomain ([154.72.162.91])
        by smtp.gmail.com with ESMTPSA id es15-20020a056402380f00b0055267663784sm2420469edb.11.2023.12.22.03.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 03:14:43 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
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
Subject: [RFC PATCH v3 1/3] cpufreq: sun50i: Refactor speed bin decoding
Date: Fri, 22 Dec 2023 12:14:05 +0100
Message-Id: <20231222111407.104270-2-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231222111407.104270-1-fusibrandon13@gmail.com>
References: <20231222111407.104270-1-fusibrandon13@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_031448_216323_4A62C2F7 
X-CRM114-Status: GOOD (  16.37  )
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
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 58 ++++++++++++++++++--------
 1 file changed, 40 insertions(+), 18 deletions(-)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index 32a9c88f8..e8c2a1dc3 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -25,6 +25,38 @@
 
 static struct platform_device *cpufreq_dt_pdev, *sun50i_cpufreq_pdev;
 
+struct sunxi_cpufreq_data {
+	u32 (*efuse_xlate)(u32 speedbin);
+};
+
+static u32 sun50i_efuse_xlate(u32 speedbin)
+{
+	u32 efuse_value;
+
+	efuse_value = (speedbin >> NVMEM_SHIFT) & NVMEM_MASK;
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
+static struct sunxi_cpufreq_data sun50i_cpufreq_data = {
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
@@ -36,9 +68,9 @@ static int sun50i_cpufreq_get_efuse(u32 *versions)
 	struct nvmem_cell *speedbin_nvmem;
 	struct device_node *np;
 	struct device *cpu_dev;
-	u32 *speedbin, efuse_value;
-	size_t len;
-	int ret;
+	const struct of_device_id *match;
+	const struct sunxi_cpufreq_data *opp_data;
+	u32 *speedbin;
 
 	cpu_dev = get_cpu_device(0);
 	if (!cpu_dev)
@@ -48,12 +80,12 @@ static int sun50i_cpufreq_get_efuse(u32 *versions)
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
@@ -61,22 +93,12 @@ static int sun50i_cpufreq_get_efuse(u32 *versions)
 		return dev_err_probe(cpu_dev, PTR_ERR(speedbin_nvmem),
 				     "Could not get nvmem cell\n");
 
-	speedbin = nvmem_cell_read(speedbin_nvmem, &len);
+	speedbin = nvmem_cell_read(speedbin_nvmem, NULL);
 	nvmem_cell_put(speedbin_nvmem);
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
+	*versions = opp_data->efuse_xlate(*speedbin);
 
 	kfree(speedbin);
 	return 0;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
