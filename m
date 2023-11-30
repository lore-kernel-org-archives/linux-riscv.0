Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9B5C10DAA
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 01:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kM82fo9/PS9EshiWGcmUOA3DjLIg5qcw8BtqkWe2qJQ=; b=Ti6yuQ0q1q9y/5
	aIxITPhnGn6tIU65zfj3UxEUG+7YpgWJ9VYJRQoxu7Sge8Z1/Q0ha9BOGeDgpkO2PPArzZQt6FME7
	mPSCx/AMfxCfvsp0N9m3YX1LCNZUMTzzd85VK9ojl3qDrp6Mu6MuWPpj96m4W0R8PZgfD4bj1j2P5
	ulnZfD28E3vi29s4UlziD1ujf0EWLVN4AgLo5Vx4On68WQH/E5N8tOsLyNN1XBYVoEb33mhLinL3A
	/CZZPGDRI3fKHfz3hVDimLWsL8fhJHbnsta2UBdlDHiD8dOEnUVUWjLzy20+BeFkd/N8JPBmNd2az
	8ZxEQIyzMeE417pqwTug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8WB5-009i1y-1S;
	Thu, 30 Nov 2023 01:49:19 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8WB2-009i08-1z
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 01:49:18 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1cc9b626a96so4660305ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 Nov 2023 17:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701308953; x=1701913753; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zUhuNFsiAvrHYnZLi2Em140Y4QPJessaIPRDZmEdsMw=;
        b=J2B2kveQp9Ni5L4hz4PQIvaH2GYt+SfAHPGby7tsO399NWNetT7scEyuOZhlWG9Y2x
         /GsvxMKI+NPWoTrugqbplnxWHEJpN0MhHC4sPpUTf40+oNFeAVHQMvW4OoK2W1Qv1Aj4
         BjzlUbGS7gsoq+WCQrJv1LCFfw4gRBPqRUNdFiBIo03QhybjChwjdl1BiNSNEytGP+8b
         fPnio7+5/n0SsVgRqq0VDSZ3yaXehDQTwRJ4gpJRl4kWIUEt3Z6En4yCypCL7CUz+Bmj
         aeIiSkLmV+gIjQFcOQoHK9Ox6rGW1rPijWn0VR+nypwfXUyTosmC4lrZ0HQCII3+T6dm
         rKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701308953; x=1701913753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUhuNFsiAvrHYnZLi2Em140Y4QPJessaIPRDZmEdsMw=;
        b=oyaUD04WBciVbSPumb5zcOv5rRRFOWI2JY6fcAywhKs4lAXutf9QPImMleFQfd3/kp
         ij21LCcc9MIrPNLn7snW2KQXFsGZdOexyUo1A/HUFfkYu/dptW/vIA0PITYkGEDRT13W
         gcBoDz29mT71w2P3JfDzSyvR5oUH7C/EAZUsjZu/CJCPWIpxTzAX6FpTx/6YhDlHk4ib
         nLWqeqCI0ddHGnqVerOaZe8pmCEyyi5ZTJ5e8YgHHcn1Ha8f++5phj8ghBVeOrMTHX3a
         d2/nk0rVLk4UwzPZhYRbvCZtWiaC8BUy9ZaM+CU4cVaNYupIvfPPEuAdvylGlnrNpNm+
         3omg==
X-Gm-Message-State: AOJu0Yy4ZUkbgB+e7aZWL16cuLGSGE5Q86wN92V8Y2Q8pOY39cx4cng5
	7u2nlzVSvd8v4mytcK8fsnpx6w==
X-Google-Smtp-Source: AGHT+IFrYiRFrGzs3Y1CBEPL2phpj1QNKQPDTXXYUtfO5eBxcLlNdgmRNSs2XIEy08Ji+Bq43Zrniw==
X-Received: by 2002:a17:903:246:b0:1cf:b29d:3e8e with SMTP id j6-20020a170903024600b001cfb29d3e8emr16912003plh.58.1701308952800;
        Wed, 29 Nov 2023 17:49:12 -0800 (PST)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:9707:1e8c:3166:6a23])
        by smtp.gmail.com with ESMTPSA id bc3-20020a170902930300b001d00b0bd306sm24455plb.251.2023.11.29.17.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 17:49:12 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Date: Wed, 29 Nov 2023 17:48:47 -0800
Subject: [PATCH v7 1/4] riscv: defconfig: Enable mmc and dma drivers for
 T-Head TH1520
MIME-Version: 1.0
Message-Id: <20231129-th1520_mmc_dts-v7-1-c77fc19caa6f@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701308949; l=951;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=4RIHUzQaxou3jWGQo/iOBjqUj+fsmX35ctdJCieIZQA=;
 b=lABD+i37ZsVjKTem2rwlrtlpGSvWvZfxV4ATEPFLVk0KhDOrnCghqvXJAuoDLcgASHkByc7EJ
 piiI2bt8FWGCRfYuwkatOQAxcEt9VJHtEoGTUvCKvmAswq+uFD2jxKc
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_174916_652506_CAE3DE21 
X-CRM114-Status: UNSURE (   8.65  )
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
