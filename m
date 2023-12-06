Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6949BC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 08:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kM82fo9/PS9EshiWGcmUOA3DjLIg5qcw8BtqkWe2qJQ=; b=4jBIs7+ExH6b5P
	bLI+xPFm1z22akHHWsKqmeDF8/5WtegrU3T0MlqWbnjeaEvC+A0msIptXJMAASLMJctbOTGU9svsJ
	7+V6eZ/JUh1qlrO3lO1asROmFx7c4WT81Bv3HZ/EFQggIghLObkmKrI1FCnmzlNkrmgRb+qoW0bGw
	mOyvcjU8NCVlSW3Lvn3nv6wnfbj3mo43fjhrgomgwp4hBUJaoRSeL22dmgP29ku+FZYEpCPs1TIBW
	gCI3wdCiITmKwO8JqhZOEqZ5keu4vb60XIl5y8YH0Kofavv3GlnuzjF/mSgJnf8xsLn5pM0hnRFJi
	2oF1s5hsike0clah6Opg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAmyc-009M90-1F;
	Wed, 06 Dec 2023 08:09:50 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAmyY-009M6l-1M
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 08:09:48 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d0b2752dc6so24371915ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 00:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701850185; x=1702454985; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zUhuNFsiAvrHYnZLi2Em140Y4QPJessaIPRDZmEdsMw=;
        b=GwPWj8ITsAyUoAwFNd3MI9AF7qBA+ucoNGoNJ1F+vxX6IuclAMqda6LMT7jorY/GcE
         mY4irH/hZk9d5XfyaazApWBIoNgU9+DlCN1H2gIgvoszeJdFcgmuT4nbN1eEFtGFzIqh
         cSsJdgFGbFztCe2MnJ6dtKk7Xkn/RJhHs2uXL8o4IPbKAc/LUMy6DXiTGM3cHhtkselC
         EvsUHaDZrqvXGBlFsLiwIZE5soSagybSCKq6kb2KV78KCZUnDxqy1yVjnN+fCVUF/XjU
         E/LjtbFlhbtla2emM1txFJR1sLuRilelqFDzYMLKJznLtXtwO8OkLfyl4QhQ4oMwpwfe
         SRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701850185; x=1702454985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUhuNFsiAvrHYnZLi2Em140Y4QPJessaIPRDZmEdsMw=;
        b=u7Hs9i+DUoC9qWvGbVZr/apz2djpMXlec9BRweBnDZ6h93kUdfBs1tivcX5Sym2WYD
         L4fT/o3HoyhoE0ELO+8Y+iu8kJyCmoJu5UF71UuOaCXN/b132B+rvwcSNL/2X1/g8d07
         xIkfljPTgW5iaH4+HaRdmx//1RmW5zVRm5c6Xz/AXYYCiGPEydQ8c8g5G9pIZ0TT59/Z
         eYGyBT3dlT0C0zJbcTqnFtJ5ludNSwhZwZIaVZVJkGdKC5JAiQ7Sq89C0qBwrUSHyjnk
         thuXwSnCRcIxELQPGPrNWCAHU6ANq1DXZ4wtC/l8VgRfyTqHR5lrD3DYTaU7wHz3Vnc6
         qqpw==
X-Gm-Message-State: AOJu0YxNY5+lOQQx+njN4mi9Ub3N8dckeWQLhfGfDLTLjA77e4ngKLgw
	vU2bnuJjvXE8aBOV6LOpXIRDWg==
X-Google-Smtp-Source: AGHT+IH3gRYGjosEd0BiJj75NNhlV088XtZ8mMy8bZQeahdEBG8P85BdfI6y2nZrTFPSVoonaAxNwA==
X-Received: by 2002:a17:902:b08e:b0:1d0:cd9e:424b with SMTP id p14-20020a170902b08e00b001d0cd9e424bmr475933plr.43.1701850185075;
        Wed, 06 Dec 2023 00:09:45 -0800 (PST)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:92e9:8fb4:700:680])
        by smtp.gmail.com with ESMTPSA id bd11-20020a170902830b00b001d0d312bc2asm1208668plb.193.2023.12.06.00.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 00:09:44 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Date: Wed, 06 Dec 2023 00:09:21 -0800
Subject: [PATCH v8 1/4] riscv: defconfig: Enable mmc and dma drivers for
 T-Head TH1520
MIME-Version: 1.0
Message-Id: <20231206-th1520_mmc_dts-v8-1-69220e373e8f@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701850181; l=951;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=4RIHUzQaxou3jWGQo/iOBjqUj+fsmX35ctdJCieIZQA=;
 b=MY1Zn/vpteELgknAAqVIXREnspLxXc/K9fvkAmxIH0O5NBcwu6+SJNZDx/iNZIPHhcMKHzFZn
 HlK6cjYNyhFADzUsGzTvSSr8g8A+4qXhyxs+w65zE8Zyoc9DoL/xiiI
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_000946_457853_97179870 
X-CRM114-Status: UNSURE (   7.90  )
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

Enable the mmc controller driver and dma controller driver needed for
T-Head TH1520 based boards, like the LicheePi 4A and BeagleV-Ahead, to
boot from eMMC storage.

Reviewed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 905881282a7c..e635dc9d1997 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -214,6 +214,7 @@ CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_CADENCE=y
+CONFIG_MMC_SDHCI_OF_DWCMSHC=y
 CONFIG_MMC_SPI=y
 CONFIG_MMC_DW=y
 CONFIG_MMC_DW_STARFIVE=y
@@ -223,6 +224,7 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
+CONFIG_DW_AXI_DMAC=y
 CONFIG_RZ_DMAC=y
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
