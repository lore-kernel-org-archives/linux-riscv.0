Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7FAC10DC1
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 08:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cWODlNg5vc8C/gMX1yfWIhs7aGG7gR7+ob/GQ65Z20o=; b=Yzzh0fU5wA+AYI
	XLEJBLqzF9TElkdYnyJbVtDdE5bUzJPlcFdmaYovQp2bJqLknEQP5xUUDZZR88tICFwUe42YO6mmJ
	1d8wlzgytg3ZNoz5T0iBxBPurCdqLi2FLL1OwYC/Y058CrmFfHjSoZPrLKN5u0grtiUGwKVJduWKS
	iCdru4FP6mF93vojoQhA95qna58/+K3RUL3gDrCLj40qIAlPUQ9EbdIfBUkOSTA6o1wP7Ilvgs8Cp
	oJ+BdYUbLkawq20XIkbE/4/1NM0LKlPeDwQmv7Kae6jCahcquFvzj4G6kDzY/1Tnmjd/k3Y8Fu0fZ
	Owl7Gxbqj02Q1k+PnGiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAmyf-009MBW-34;
	Wed, 06 Dec 2023 08:09:53 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAmya-009M7h-32
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 08:09:50 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d0ccda19eeso9586715ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 00:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701850188; x=1702454988; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LbmBzwUY0t2HlseySntw7VHVz6E41O0M8Fv31kHjYNc=;
        b=3XA/GLHJCRnLUnjAt3XkSOjo7dLuddspQTKNOrpyR5ybMC2mouwXEkpICH2kqQh2iy
         xP/9dm9472j81TmCLUdzKyBOlwIogLlQo5kBHDP3a81Axi288vJWKfrAeXA7FEl5JKib
         zM7L23UHh2Mwbt2Ao8NU49ECvYH1qx1smK3rfF/b8DqWwGuk7mJ0mfjlDYXSOxRJ4KF5
         h14l6IKV8+YsXHo1ap5bjCEVfnYyx4GKCpeZAcVeaEVdGLbIjute39EgixK+Z76qB6Pv
         RUhxyjH3rP4da5ne/qAUdZUIXipjaZtcBeORaGmhKk5um+hsIu7SdG3Okh7Dg/cf7ejJ
         q+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701850188; x=1702454988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbmBzwUY0t2HlseySntw7VHVz6E41O0M8Fv31kHjYNc=;
        b=jLsrB1dlvej58Xu9/5vwqC2o+v2CVd2V3kZiVk4x5Y/tf5OTbqCihZy2hbfVfGH1Hp
         TUku+hg3/+c1yCmXAOFKOzEo6U9Pl+OepPAY7y5fEelxNDp7f8f9IDhrbru9nX80IMRW
         kHm6zSw2jKcGuXhjxzNL0GOg0WmV9Yz5HF4DIi74vR7mjn6Z82hOsW/M9fPicyWHDVO7
         TWBHuVsfgkwSHgUeddSCgwtqBKupu2Hwn/9BT2vni+ELGmCGuDXtuuclytdXDMcT/Htm
         Lj3GaGCaS4WVrfyFvmGl4qtG6/miMud/0PuwfR1K7LvGXg7e0rxwAVa4B/706RH5XDtR
         8sAA==
X-Gm-Message-State: AOJu0YwMQkbeos7fwHXpc7vY8/dgEYULr2MKJ8Pzib9Swev3mSkuNaDZ
	rvFKs1cn8wk1Wnv5FV3TOh0umA==
X-Google-Smtp-Source: AGHT+IG+IVNu440mrvRBStKIEhon2ZDqZu9o/4ngZUUVarpEskLvBTGXAYNAbp4uL1sBhOVHpCI+pQ==
X-Received: by 2002:a17:903:555:b0:1d0:6ffe:1e85 with SMTP id jo21-20020a170903055500b001d06ffe1e85mr298277plb.104.1701850188352;
        Wed, 06 Dec 2023 00:09:48 -0800 (PST)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:92e9:8fb4:700:680])
        by smtp.gmail.com with ESMTPSA id bd11-20020a170902830b00b001d0d312bc2asm1208668plb.193.2023.12.06.00.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 00:09:48 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Date: Wed, 06 Dec 2023 00:09:23 -0800
Subject: [PATCH v8 3/4] riscv: dts: thead: Enable BeagleV Ahead eMMC and
 microSD
MIME-Version: 1.0
Message-Id: <20231206-th1520_mmc_dts-v8-3-69220e373e8f@baylibre.com>
References: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com>
In-Reply-To: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Jason Kridner <jkridner@beagleboard.org>, 
 Robert Nelson <robertcnelson@beagleboard.org>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Drew Fustini <dfustini@baylibre.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701850181; l=1131;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=hHAbb4qtRlHdob9grY86/6CrB93uiLQSe6D5Pf4bJ6w=;
 b=a3RjXkzF5S6RuHE5jVRda77tdw9TE8uVsvTL+GIZkd2GPapFmSTRl6NNWqrVwaVtoNrubatFW
 CldudAcR7JPAYR6Lyqy0D8NDNk3WsZOzEwuNW+fxyDBbe6NCHsQ8Z6Q
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_000948_978778_9AC1DBF1 
X-CRM114-Status: UNSURE (   8.36  )
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

Add emmc node properties for the eMMC device and add sdio0 node
properties for the microSD slot. Set the frequency for the sdhci
reference clock.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 70e8042c8304..d9b4de9e4757 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -48,6 +48,10 @@ &apb_clk {
 	clock-frequency = <62500000>;
 };
 
+&sdhci_clk {
+	clock-frequency = <198000000>;
+};
+
 &uart_sclk {
 	clock-frequency = <100000000>;
 };
@@ -56,6 +60,22 @@ &dmac0 {
 	status = "okay";
 };
 
+&emmc {
+	bus-width = <8>;
+	max-frequency = <198000000>;
+	mmc-hs400-1_8v;
+	non-removable;
+	no-sdio;
+	no-sd;
+	status = "okay";
+};
+
+&sdio0 {
+	bus-width = <4>;
+	max-frequency = <198000000>;
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
