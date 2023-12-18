Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD7EC35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 11:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qqutzu8tSWBvyQuS7K5LR930pUKCdPiyXMTbfFMf6A=; b=1Bgpu0G6KQHi0z
	fW0I/As+RmlsPNbPM/+qNO/V8paGT7RSN+hO0xJAGvpt2ZQ5sIYEy1jKnU9Sl04BsWP992AIRwMCe
	7gUtWU5VFYKdPdC6Xm1h3XsQA35NDqjBK78bNioHn/8JuH9/LwDJHPk2FGaBQL5PAdvETOJ+5urtk
	7eKDr44pITKnZErPSrQJCS2klE0fy0F3zv7rFON93pCwmd6C/zKzLpKrTrwDc9fE/RSqoRJfaWASO
	PMNnYMAQLPWkGdZvwkwTffqU1NGIw3hUyWK8+Yd6UuhOi055S7wAFHfXdtSd5aGU6SZj/8LrrBOoF
	ppvsApiYtkdDtcItRgWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFBSo-009z4K-1F;
	Mon, 18 Dec 2023 11:07:10 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFBSj-009yyr-2p;
	Mon, 18 Dec 2023 11:07:07 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2cc6121c113so15611171fa.0;
        Mon, 18 Dec 2023 03:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702897622; x=1703502422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SZpEgDuZF0Kd57Q/v4Kq9sCIukMURy5kzt0ohYZmr8=;
        b=Nf6dNKMtTZNpFYxCJVyx1T9CChgMb7Z0Ff6luqZIZ/LZB2JHFy/4MOWnUIKQ84CUbp
         thEU1tdUqB2hZnbGvCZIYWh4AnYFNk1BZ3o8Mi8nlqbI+6EmQXIwXzJXM4uW/PWHnaVA
         H1MZmFs9vffbnZbICjFvy+rvQL0tZLhzbXySz4jhBAGU4Km5nguDeOOMVnT/bpOMH2/2
         yJIbAFvs5eoIGiJjIF7YH98VTE9/BO59MrzLlvrR2AXBNKh3XpmxOXRZQ9qH2I/ZQzZZ
         keOidIF9IUpOx+r1SffHJg0pwAVt8/O7qT/vhllmoaWo5cbHA1aTA5L7sCW0xq/fHr+w
         74Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702897622; x=1703502422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SZpEgDuZF0Kd57Q/v4Kq9sCIukMURy5kzt0ohYZmr8=;
        b=TKes8vW3nnaD151P5+RHcBbdF5bj8r11y29QZILZscYt9CUZpnQQSRhZLCfS2xuJzF
         YNvLraJADM24zriqSJSoTSkBhYt1pPjXD+RgYJukYaHZ/x95vZPhKvN88XBlwWa93dnh
         VneZcOY5QhkG8zxjXDKp67PrGvUa8dZG05MUnezz2ogVuDF0wddRq0pJXsv61zCFw6dW
         h58r+mwHMKb+G4hjQFLp/4YLEwoVig68AmuwUPuz6iGxg6ISJCgGfBG4QQoZN9x1fzTk
         kM1q2hABsrVTRWg6/w/82Ux7i0o0Exg/1yZJWlAi8RyWm916vU2IVgtFL95Tj09UwRtq
         jAAA==
X-Gm-Message-State: AOJu0Ywwd7XgFl9cgxEapP5UIsUufSOZYno8rD47C2Ek1mLLmDlg2J7/
	fyzxUGmT6Hw+A6UZeAnAupU=
X-Google-Smtp-Source: AGHT+IEEPpv4PbOGki1wpFYE/FNbr0LMBpvRkHRipU02IysiUzOQcuXrBHqB/ytN1/Alf/94bokq8Q==
X-Received: by 2002:ac2:4d12:0:b0:50e:3dc2:ad16 with SMTP id r18-20020ac24d12000000b0050e3dc2ad16mr142258lfi.232.1702897621400;
        Mon, 18 Dec 2023 03:07:01 -0800 (PST)
Received: from localhost.localdomain ([154.72.163.164])
        by smtp.gmail.com with ESMTPSA id pj4-20020a170906d78400b00a2353af1f7bsm1406769ejb.92.2023.12.18.03.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 03:07:00 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH v2 4/5] cpufreq: dt-platdev: Blocklist allwinner,sun20i-d1 SoC
Date: Mon, 18 Dec 2023 12:05:42 +0100
Message-Id: <20231218110543.64044-5-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231218110543.64044-1-fusibrandon13@gmail.com>
References: <20231218110543.64044-1-fusibrandon13@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_030705_954428_4B75D93E 
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

The Allwinner D1 uses H6 cpufreq driver. Add it to blocklist
so the "cpufreq-dt" device is not created twice.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index bd1e1357c..2febcfc2c 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -104,6 +104,7 @@ static const struct of_device_id allowlist[] __initconst = {
  */
 static const struct of_device_id blocklist[] __initconst = {
 	{ .compatible = "allwinner,sun50i-h6", },
+	{ .compatible = "allwinner,sun20i-d1", },
 
 	{ .compatible = "apple,arm-platform", },
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
