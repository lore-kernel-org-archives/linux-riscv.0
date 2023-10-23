Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC473C25B45
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 21:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pRs+JECDiF01iGA3sMTeu9oJxfQsqO2GLJ8MMNBNh7I=; b=fPyXPZWluqmeo2
	lPa0amcmd3idHofFeKJRIvpCZONfCKsfAxxsWCk1OS2puMOybSnFQsxR5pOAy6wLMLVviXqflzhhH
	xIaxXuSYtX9ZW9eRlWuRypp9BHQFBt5xrJHuaiSCMGh5x+djv8twXxEyW/bKcEaqbA4/LmV7+PZc5
	983fqz1DY5tBOexPS22mTFZ/oTdUxCo1+PFgcKuAhP1biHCjpA+IW0uM9e76XZzBwHv7j3S/hdNke
	YkZP5ZryUyFVN18cGjrwYvzZMv5PXHHYp6FVHs21TxC+NPT6hopZffjDxfvsfDukX1OK5yvD6ONbA
	V5XLP14HycfFQVTQLjqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv28t-008HWV-0b;
	Mon, 23 Oct 2023 21:07:19 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv28o-008HSy-2m
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 21:07:16 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6b1ef786b7fso3596708b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 14:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698095234; x=1698700034; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2BmxulcCPkSniZYdQWfk9xRMqLpea0NZ1oqzxL0OgN4=;
        b=MuXa31XNzhiJqFNCHIkbfecF2sfKLltCVq89ytl1FIp0AUDIpn/W6s9aAc3oOoMn5g
         8JfUbdFprbsDk0B/QA2WSPcL099TRA8QQMsUbormAm1013fz6dDIZA/NEzRXWtDQv46M
         SA4tyRX3vaoe97YL0S5GlFyth3cSaeMvGpipmnTIaQMXIf83HDHRf5EUFF78Ia5VkuCj
         aH1f/Nq3uzIEwT9jm5j6vX9XRimJBjoTPUp9rtv3U5LtNHowGIWVMLmBlv1ALvKve/Ne
         Fa9Zy2h7ATTjzr23zt09ujickD+v8YU38Wf+ctgnFk/0/J0oBDqvD9P81E51ATM9PEZ2
         O69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698095234; x=1698700034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BmxulcCPkSniZYdQWfk9xRMqLpea0NZ1oqzxL0OgN4=;
        b=w8lIAnP1ew4SO+KNtKmcqIJGXGUM+jyzNQuszkjt65KiWtUgdu2WvMXSC/JMFMLqcM
         tVcO7oLJZ5SRkJQlpfZtBf/gLTKUIC5YVS+YSU3aG1iuMf21dr51K/bzXKZ56w4A4OXe
         +BsmW2bzDw92pxZpz9Cy8ugHIMYvW/XgL8oHYgT1pMwjOZK8jUp8Wq1U4xWqahJA14A6
         9xCOhsNqrr23WvyodeydLI2oe5pNM4Iebk/mUo5/WC+2coZFT1DGAfOm7UUl5jp85KAa
         3M91EOrQDf6l+biyXdpURHjjZpmlnYRUpVITeguGtguC2Lv9r9THq/uYDZ6W+tlP8t4C
         LYSA==
X-Gm-Message-State: AOJu0Yz6ydZb01dmvSsFsDP8OmP33yBDbVuAe4sr5xtGKa7UP7F17AxU
	RPf3KfI6gcwSvrU5mc5dgQxiEg==
X-Google-Smtp-Source: AGHT+IHVfWbZSHoSGCqE2+JO5fDD9h81EB2GrEP950fIqALNsZch0ZqvHM2SXLcTN8QPzMSrUNWfCQ==
X-Received: by 2002:a05:6a00:b8e:b0:6be:5e64:babb with SMTP id g14-20020a056a000b8e00b006be5e64babbmr12277394pfj.18.1698095234354;
        Mon, 23 Oct 2023 14:07:14 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:b9a0:8714:407c:4146])
        by smtp.gmail.com with ESMTPSA id k28-20020aa79d1c000000b006bde2480806sm6573066pfp.47.2023.10.23.14.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 14:07:14 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Mon, 23 Oct 2023 14:07:05 -0700
Subject: [PATCH v3 4/7] riscv: defconfig: Enable mmc and dma drivers for
 T-Head TH1520
MIME-Version: 1.0
Message-Id: <20231023-th1520-mmc-v3-4-abc5e7491166@baylibre.com>
References: <20231023-th1520-mmc-v3-0-abc5e7491166@baylibre.com>
In-Reply-To: <20231023-th1520-mmc-v3-0-abc5e7491166@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698095224; l=873;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=1b6E7IcYPcGUX3CsWI9slySNkcpgVBWsbFODn/9h1s4=;
 b=yBinOOYM0Z6WV9s+1nnMazkJd6maQjOcaB27HcLTZpb2dPFv7Idu8SXkKrMs6/zTjogZrUJX2
 t1MO5v7c2qeBbcg/nGTT45Uw9LovoK5z/l9tIKfTy+r+8fe1zZmnrTv
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_140714_895066_69D257B5 
X-CRM114-Status: UNSURE (   9.01  )
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
Cc: devicetree@vger.kernel.org, Drew Fustini <dfustini@baylibre.com>, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>, Xi Ruoyao <xry111@xry111.site>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable the mmc controller driver and dma controller driver needed for
T-Head TH1520 based boards, like the LicheePi 4A and BeagleV-Ahead, to
boot from eMMC storage.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index ab86ec3b9eab..c5a8583236d0 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -168,12 +168,14 @@ CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_CADENCE=y
+CONFIG_MMC_SDHCI_OF_DWCMSHC=y
 CONFIG_MMC_SPI=y
 CONFIG_MMC_SUNXI=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
+CONFIG_DW_AXI_DMAC=y
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
