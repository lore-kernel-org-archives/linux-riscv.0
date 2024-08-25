Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB8FC5320E
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Aug 2024 14:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U8zpHIrMeHY2huE65j8eR8KhnIEgbnYxzaSRTsJjZN8=; b=nvXXCmVgCO/xmc
	fWWPfKfMS54JITN6AzQ3zTa3y+2FqndX/OuHDlE4vqKrFkPcHHHplGZP33CLT8c6RAS3IiHP9Vq/X
	xyGXwgJYhGUp9BMkW0mZah0/MTLUf/UNqxUvta8gbfHtAR5SdZcVvLqEV6tMD8Aa4/w3TwsenNsh2
	jJTo03bZv1Iho/4PZGAXOIWMkVeCjsO5XTf2Hzux1ymdjjFqyj6C7rt9QF98gzQdrU+wWLCTZe5+z
	ZhrUO7tS5bI9+aqTlsEY09EtUuWBP1TKkaDKZO+jXUSmJb1Fn5ayL+wFenbWb+syKiEWYjt3LIXVg
	j3+jV90YdQkKpnZUq7lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siE4Z-00000004TN1-35Gm;
	Sun, 25 Aug 2024 14:18:27 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siE0v-00000004SK4-1cd3
	for linux-riscv@lists.infradead.org;
	Sun, 25 Aug 2024 14:14:43 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4290075c7e1so4344985e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 25 Aug 2024 07:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724595280; x=1725200080; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dPfVC68w4G9TItKcZX9hLfDBOa9Rh2fNT0mcRYJpZNk=;
        b=hD+65tpTEWtq9ENKXa6rVYWm2o9DjwkzSIIAQ/6ZPh3U8vNqRVirdIdl/E1NC0tFCP
         7lHyqXhy4rhkRnLgW2mzQaXc7ymfLI+WoKD4y00eUfumb6hihseGcdOG/hvoGVpSm1Kz
         kgNDuA4itjv+VClB1qW3uJQpN4uBQJkNGQDx0SaIMy5zFAbU4ak5CAPBpriVboygbBEz
         VX41uPW+HAmbJfEgvytOdZ7CH4dTgTrSjcNxPysmnfdci32uBNTZgaWGx72HOM9gxm2m
         RbnEPdtdYtFOthfQQeYhWrUFAbXutY5v7UhzrKS4oXUoPRGzdgggmyy4clnwz9oSnM6U
         Sr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724595280; x=1725200080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPfVC68w4G9TItKcZX9hLfDBOa9Rh2fNT0mcRYJpZNk=;
        b=qNR8hITJlhs4jF29f2y2ilc9cVNAD31OsSDZTgW+H+W0GIi55/PHqiW8IO3VgBHeQH
         wGnRcHehVqzBvmyArd+7j4/xppEQVnbBU2jDz34F71R8fwWNozuDcKc9WAf3TLHkEef3
         LdAHovXQF2vcJws2i8I0kCOew3zIu7Q07ObewJOm/wlUxxvu+m/1ZZbpNoe2atAUI3Qk
         oI0bLMsUNAD3OJur7KB1H7I4dHkbTAn1SXjj3ebXpEYEr62LuqRB0nKer+JpH6ah35qf
         ItACwIkuUBaknZYJ2E2vIWVJ7JlpzFzVOe16xzTRAu8652hh4baf19NGhV82fS5w2p8Z
         ceBA==
X-Forwarded-Encrypted: i=1; AJvYcCU5Tch9wCxxiaKf2oiw58xMQW2NkV73AIGG1O3b+c1ADs26ZdIMwJuPHbYks2w8XFnJQbxkr1vW8NgyHA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5L08QewFqfVb6qBBPtLB0SX5cXRBc7e8hWGX+dABQm2iqu7GU
	PwddP/hBuuIzp7QxYmFuZWlQDnHDpLDcFX5vVP+giiVMaMTlkl51qb23XcE7HG45sEn7TCW5tlL
	O
X-Google-Smtp-Source: AGHT+IElMKRI5xZ8yzDk8JbJF8qKOxDYwCIunD6hU146I7V15XtRVaFAqCfrraqfYRZZ0YGENwgH/A==
X-Received: by 2002:a05:600c:1c1f:b0:427:9f71:16ba with SMTP id 5b1f17b1804b1-42acca112admr31861355e9.5.1724595279439;
        Sun, 25 Aug 2024 07:14:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac5162347sm122556045e9.23.2024.08.25.07.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 07:14:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 25 Aug 2024 16:14:28 +0200
Subject: [PATCH 5/5] reset: lpc18xx: simplify with devm_clk_get_enabled()
MIME-Version: 1.0
Message-Id: <20240825-reset-cleanup-scoped-v1-5-03f6d834f8c0@linaro.org>
References: <20240825-reset-cleanup-scoped-v1-0-03f6d834f8c0@linaro.org>
In-Reply-To: <20240825-reset-cleanup-scoped-v1-0-03f6d834f8c0@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Antoine Tenart <atenart@kernel.org>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Damien Le Moal <dlemoal@kernel.org>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-kernel@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2441;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=3FUpFc5Q6VFd1fQ8A/U87QLsFQnyhnFox4YWGWQ0Hbk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyzxGxK3ymr8fJfvYSTHWGw3mhICORfcHW0/ex
 woHJNmabneJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZss8RgAKCRDBN2bmhouD
 15u+D/9Enprg8sJbkA1Du6xadF51tsosIPpeLdcevWdfza41+UoHchX5cxoDdM6x3VHFYX5PSvr
 Vomw26pQKB8SMQUS38dtxNYBc3yrtp97ZP+t1ryzjTmkPEX7Nl76aJnQgsDxFFqoHepwuupIHCs
 FUoV6QMXQbjQvINTbf+hIky6dYdBoaYMe6ln95ldHsqc+3hJzfiKkum72zx3hK1kepxrvn7NikR
 O7dV/PuemP226IU/zwtMmhwCNTRaU+OFVdWrC807JD/Kua7UZ8bERqRR1aZw2p2jyyvXXCsb6yu
 gehSPqxngcswmzrm2lPn+CRZhKGdpxHLjyzoJX0edDaYAtvUeOlnVxKrm6mV6g0tPjV5p+qfj2P
 /CYDSpOaNixEpQqahTXrdrx1PW45Y7NVkfPYZaaFSqNLo5R17dbZCq960XCavRAdEXmAPCaVFa9
 0TM+Rl5tlPvjpkKutR7FtTrJhq29nVqACJIFbcgK6Z2rr/X7He2hf76yDDfHTQM6xAq079EdQIr
 eGxBvKCPMoNs3sxD47j8uBxqztQ7eCWvZbGljfM3g2sPWhYi9n16BP95eZt9xH0cPj4nKAmNMWE
 jbXjXkQ/TK235iBhyt+rEN/t91x9JxGZmALel2kJeKHIejYXTEd75zBGb3WGxS93VDUjVyqBdBu
 i6S6vCcYnfzEz6w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_071441_495212_FF9FB70D 
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

Use devm_clk_get_enabled() to drop clock prepare/unprepare parts and
make code simpler.  Change to dev_err_probe() in handling
reset_controller_register() error to make it even simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/reset/reset-lpc18xx.c | 29 ++++-------------------------
 1 file changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/reset/reset-lpc18xx.c b/drivers/reset/reset-lpc18xx.c
index e7896e3f1851..e42b2f24a93d 100644
--- a/drivers/reset/reset-lpc18xx.c
+++ b/drivers/reset/reset-lpc18xx.c
@@ -150,28 +150,16 @@ static int lpc18xx_rgu_probe(struct platform_device *pdev)
 	if (IS_ERR(rc->base))
 		return PTR_ERR(rc->base);
 
-	rc->clk_reg = devm_clk_get(&pdev->dev, "reg");
+	rc->clk_reg = devm_clk_get_enabled(&pdev->dev, "reg");
 	if (IS_ERR(rc->clk_reg))
 		return dev_err_probe(&pdev->dev, PTR_ERR(rc->clk_reg),
 				     "reg clock not found\n");
 
-	rc->clk_delay = devm_clk_get(&pdev->dev, "delay");
+	rc->clk_delay = devm_clk_get_enabled(&pdev->dev, "delay");
 	if (IS_ERR(rc->clk_delay))
 		return dev_err_probe(&pdev->dev, PTR_ERR(rc->clk_delay),
 				     "delay clock not found\n");
 
-	ret = clk_prepare_enable(rc->clk_reg);
-	if (ret) {
-		dev_err(&pdev->dev, "unable to enable reg clock\n");
-		return ret;
-	}
-
-	ret = clk_prepare_enable(rc->clk_delay);
-	if (ret) {
-		dev_err(&pdev->dev, "unable to enable delay clock\n");
-		goto dis_clk_reg;
-	}
-
 	fcclk = clk_get_rate(rc->clk_reg) / USEC_PER_SEC;
 	firc = clk_get_rate(rc->clk_delay) / USEC_PER_SEC;
 	if (fcclk == 0 || firc == 0)
@@ -187,10 +175,8 @@ static int lpc18xx_rgu_probe(struct platform_device *pdev)
 	rc->rcdev.of_node = pdev->dev.of_node;
 
 	ret = reset_controller_register(&rc->rcdev);
-	if (ret) {
-		dev_err(&pdev->dev, "unable to register device\n");
-		goto dis_clks;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "unable to register device\n");
 
 	rc->restart_nb.priority = 192,
 	rc->restart_nb.notifier_call = lpc18xx_rgu_restart,
@@ -199,13 +185,6 @@ static int lpc18xx_rgu_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev, "failed to register restart handler\n");
 
 	return 0;
-
-dis_clks:
-	clk_disable_unprepare(rc->clk_delay);
-dis_clk_reg:
-	clk_disable_unprepare(rc->clk_reg);
-
-	return ret;
 }
 
 static const struct of_device_id lpc18xx_rgu_match[] = {

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
