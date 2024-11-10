Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C4AD5E39B
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Nov 2024 06:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p0PwrZxrua6cj8mshE3bEsSruv1L+pxILPSZVsCUqlo=; b=V7aWlTR+7dTz26
	w66dVxrUp7czoYrXtbHq8Dk7oifxW+5/FbS/jQQ6H/HwOTW9RKCrcLkCVPzHN5H8yOKFYnbYEuB8Z
	uACoCGfjjUr/lYiply6bLS6VvfaHZIb+kk2lULGBRMHv76ImXRSBj0M866++VuZs1gizJ7LCPKhqY
	gj2eSl226ucoGrVYGxsUfsolLdOHFNr4iRUcLXLwUhWZF7qm5Z2NYZ7c3PskmxjXHK25VC+jQIiGC
	wynQ7GLx6a5Pd2ccgobLlLhsgqlo/CAZcxx3yc/0hDaTV76jL8HrIaPOIMkAMP9/KXs/DrCmX0fzW
	RMXMdpdzDer0VjS2oSbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tA1AL-0000000EQiQ-3IQG;
	Sun, 10 Nov 2024 06:11:17 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tA1AI-0000000EQi1-1tiV
	for linux-riscv@lists.infradead.org;
	Sun, 10 Nov 2024 06:11:15 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2e2b9480617so2843780a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 09 Nov 2024 22:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1731219073; x=1731823873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/aRM5Ww9FHH05vD+pnExec4peRxorVW2HFD8O0Pjugs=;
        b=yGZLBlksIKm9R3PpEYq2lCjG8db6U2owm8tMLKCyXU90hg43sdp8Wn/2HDdjc3EEqv
         2ArxfS8mKxnLbzAi7Ff8WVuVWBELio0obrGFqy81goubYwc3M1i31dsEMMAtnFzILl/M
         UdcVVTldwRO0ydDVlooMOLhcP18RTIJX3JEyBIWTQb6O9QtGCEkxtyIhqbpCI14qx03a
         PM+C5HQBwMRT5OLrQAKEq5bMTPjXVXkPGhmZ0E5ZXWnPWdpBcZPnxkSGV8q2EFKYy8DZ
         pE59uTrGz8tlhR9nxt8X57ucnFUSUqhxseXc5pooaKWNd5jEyqtx9+ILsQDVxTfKtfrI
         Py9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731219073; x=1731823873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aRM5Ww9FHH05vD+pnExec4peRxorVW2HFD8O0Pjugs=;
        b=F7TljfWvYq3irYuYTRXbpvjTSGtfnsIaNaGQGmZpa404sBGSEuAbZzUkVfMHHVyjCj
         dJejCZPY3+S2rgqbcMb+ogXkpJ4SRCJwvlzmqJN/mizn07WRqQ5BZaaYSFYDp8DdXBcA
         RVaf4odoF9iKEwgaC9hCN1VpYnBCzAwpdfDaVThAHjWsnhKdJkvZv99zW7W15QcWYG2c
         HiF8x5KQwGnAgjmic99ytH3l5+nXna0Ft7CTaKpUQEY9m/ohEo87N1Rfydqt8bfOW9Sm
         smxoXe77/WYf9VHOwKt5yx+e+gukhbWjqEYaDsGm0cVuCfS/O4dp+6rQ2wuj4czY5Y+Q
         UVJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGRLdbYS2Arwx9nXKfslz2euSIzu8/eBN0FKVe7Mzvf+tC2o8cDcDrVXC28K7wURs/mi4sqiRyRjUaMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWeL20uKNw7edqJXYODFKa5wK6CDDICgRotiS5y88fsKseTM3a
	dkTLhSgRC61rDw4yGOeYcJFz7S3cA22NiEagTsum2WoNVLrbHJBMunTe5ddYn2s=
X-Google-Smtp-Source: AGHT+IH7Xi3ivP4+SmhzEM00uzgJKu3Ewsu9l50QIYl6viRlDLtPY+yrZXelv5RLlMBav+OKnuEI6A==
X-Received: by 2002:a17:90b:4c4c:b0:2e2:cf6d:33fd with SMTP id 98e67ed59e1d1-2e9b174821bmr12073495a91.31.1731219072969;
        Sat, 09 Nov 2024 22:11:12 -0800 (PST)
Received: from x1.tailc1103.ts.net (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fe8e1bsm6205467a91.51.2024.11.09.22.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 22:11:12 -0800 (PST)
From: Drew Fustini <drew@pdp7.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Drew Fustini <drew@pdp7.com>
Subject: [PATCH] riscv: defconfig: enable pinctrl and dwmac support for TH1520
Date: Sat,  9 Nov 2024 21:44:11 -0800
Message-Id: <20241110054405.667779-1-drew@pdp7.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_221114_782526_3C0793E3 
X-CRM114-Status: UNSURE (   8.06  )
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

Enable pinctrl and ethernet dwmac driver for the TH1520 SoC boards like
the BeagleV Ahead and the Sipeed LicheePi 4A.

Signed-off-by: Drew Fustini <drew@pdp7.com>
---
Note: the th1520 pinctrl driver and thead dwmac ethernet driver have
been applied by their respective subsystems and are in linux-next.
I've successfully tested next on both the ahead and lpi4a boards.
This patch is based on next-20241108.

 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index b4a37345703e..99a11142c03c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -167,6 +167,7 @@ CONFIG_PINCTRL_SOPHGO_CV1800B=y
 CONFIG_PINCTRL_SOPHGO_CV1812H=y
 CONFIG_PINCTRL_SOPHGO_SG2000=y
 CONFIG_PINCTRL_SOPHGO_SG2002=y
+CONFIG_PINCTRL_TH1520=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_SIFIVE=y
 CONFIG_POWER_RESET_GPIO_RESTART=y
@@ -242,6 +243,7 @@ CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
+CONFIG_DWMAC_THEAD=y
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
