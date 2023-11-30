Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D473CC10DCE
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 01:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x544VxXpipg7oeYXMDkdocUqV5bhju+YlD0s93Xls+M=; b=NUP/TU4fGj/ifV
	HS9j32WQPoZfhF4bDu8sQsSSzX9II4rsWYWEEqIaH+PFHtpOSZfDE9vg+ayZ1962SQmwxoCYih91S
	Btnkb65nyyVpAFW4e9+ziKNTTXvdshRqY+p0LXOkI2yOOo/95tQ7XIeOMyILK5FLvjar78jEWZwzV
	BtFFq2lqJ4fs5e8O/Xz48uJgbPy8zT8CTbkRhnjyZKylGxPNnfopNSifG5duSCK6cfJPBURAiWuRF
	tyO0T8qh5KlxAPxUt0yD86hmI6gIPMGq5g6KbT3blPj2f/C4H9a76Ptk/rQLNqznY9tobUqIGi6QT
	rfTig1T5siJsGAF7z5jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8WBC-009i5R-21;
	Thu, 30 Nov 2023 01:49:26 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8WB4-009i0f-2l
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 01:49:20 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1cfb30ce241so4689265ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Nov 2023 17:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701308956; x=1701913756; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Jr7JkNTCoyAHbuKHVkD5XQJ6tzPUzNpAQ8g+iKdWxE=;
        b=PTINi9LHGhjPFR8w9atZBt7ZTIbvrOTpcegfhx0lDchAi88k5zyxaulRFK3iFwC+8C
         eawVM0ic/sKHznBYylJXaNWvC2NX1M3pqIno0/nFjXXfyq6LD0gkyE/Agay0UJ4WMgZD
         BOg4Oq2B78VFCX8XjfXkvaOC5NrBKK8DCvQ/YRWQ7QCIelOPgB+t87RMJIY85bpMA5Cv
         S7fI5HVxF16bcrv2hYpsb85gpYaU9vEKsW/4a69a857awDYyFohITQlJiampNmjssRJ0
         YkVlFPZYq6mcy9Ej34YtNsrOYsM7ZR+dnVUhnjlOs2SYMMXNxeRonCciuwTAycs/KvyZ
         dk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701308956; x=1701913756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Jr7JkNTCoyAHbuKHVkD5XQJ6tzPUzNpAQ8g+iKdWxE=;
        b=F0jcUB95yVkRds2R5FBg+VF5rkAltt5WQMAdQi23pnp6Jy/uNSnZzlD4TyJxOMuGcY
         gK0H9rw3fnJt7BJB+S91ro532qTV08awstl/+RoLiUlTPLdhi8wy2OB1jCfDKmdGxi2I
         Kb/am/j0p7aNJIaKToHqsE7xTaAdNQekV7FMeMlF5N9H/wYU+TNEKWVHvS/guoRF9aJc
         IM7ubWkkgQ8XhZjW24nqKE/FWhayNVY6FDGFSWMmWkh4uk9oZQySBNYYtxJ5d/owzFjs
         TWNNOoUWhT8aMhJcFyyh5iBn4l6kkQgPgKF+V4RGF7LV1e81F5qnWf4ccSkt6nrvzMr1
         YjTA==
X-Gm-Message-State: AOJu0YwUkyoKh6vlQiE5Rlg3k3UYcK7THB/2sHcn8/pY0MPujczTJSUX
	ecsb1BWc7rn85y4I/485/GaxOA==
X-Google-Smtp-Source: AGHT+IHQc/jfjKv11FHDAZ6SssqWcsxklBpB0+uT5dFsDWyCXUV6EYlxkHDsqbFW3Z2rHO8iX8TjLw==
X-Received: by 2002:a17:902:e74f:b0:1cf:e4d2:bdf with SMTP id p15-20020a170902e74f00b001cfe4d20bdfmr9817512plf.51.1701308955904;
        Wed, 29 Nov 2023 17:49:15 -0800 (PST)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:9707:1e8c:3166:6a23])
        by smtp.gmail.com with ESMTPSA id bc3-20020a170902930300b001d00b0bd306sm24455plb.251.2023.11.29.17.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 17:49:15 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Date: Wed, 29 Nov 2023 17:48:49 -0800
Subject: [PATCH v7 3/4] riscv: dts: thead: Enable BeagleV Ahead eMMC and
 microSD
MIME-Version: 1.0
Message-Id: <20231129-th1520_mmc_dts-v7-3-c77fc19caa6f@baylibre.com>
References: <20231129-th1520_mmc_dts-v7-0-c77fc19caa6f@baylibre.com>
In-Reply-To: <20231129-th1520_mmc_dts-v7-0-c77fc19caa6f@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701308949; l=1108;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=x4GrcOzQSHp6HC4WBUnYJkDmvdf8pnCHmIBijw3/K20=;
 b=22ATaiedZ7qoXu7rErPn74nYsPkB3Xum86xjFWOL/OdPNZV6jrsAtQx7tUW/pYkpE0TebmKFx
 QJ3R6ApWzRtC9w/W/38Qwc+tU4oYlO2rQu8Cnr0Ga7klX1hTo7W2d4y
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_174918_915715_2D490A0C 
X-CRM114-Status: UNSURE (   9.19  )
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

Add mmc0 properties for the eMMC device and add mmc1 properties for
the microSD slot. Set the frequency for the sdhci clock.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 70e8042c8304..b767d3f078d7 100644
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
 
+&mmc0 {
+	bus-width = <8>;
+	max-frequency = <198000000>;
+	mmc-hs400-1_8v;
+	non-removable;
+	no-sdio;
+	no-sd;
+	status = "okay";
+};
+
+&mmc1 {
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
