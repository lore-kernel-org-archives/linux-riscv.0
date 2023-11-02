Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D901FC001B2
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 02:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1mMv4ofHgIshuICtxw8YXyj2s3VD9uu6c5Ar80uMv8M=; b=S6oJo/24LTRZJd
	KvlUw0VznAa/AlioYjUuTXOjcaTGPsPMqk4V8EVPtmXyRfgh8aX4sIZSzBKi1u2KhpYmP0pmaJju+
	Yy+orwjf9A8nJDiilkV4uxoWahEftcO9DK15zxwDAYIiDSC47Rynz59miWNWMK7AjbBw93ZH37oml
	+z9uoQ43JN9W7mh3ib8Ddxua8RRm8jq4ggxbeMvIRtF/xYGo/AhMieVsxJDGntjnjWWBPZ2vNkQPv
	b79lAcpEkXhXs8jD0bVm1/u+7nk5FtkYPIGoYNkADRWsI/M7r9+UfTcSfe8tMi/XS0222QT1lQ2OX
	ZopIhn5o5Tkv9EhiyFVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyNlp-008a59-04;
	Thu, 02 Nov 2023 02:49:21 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyNll-008a35-2j
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 02:49:19 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5a1d89ff4b9so356996a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 19:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698893356; x=1699498156; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xY9e61NSBd34WKgwLiextVdIl1pEHWCBao7kYEHaYbc=;
        b=ppc8zLkc305UrSDqBV41UHecOFsDHIsoSRr3tolay6fPqp336xZq7NvaXJnonzLa60
         Dj+E9FdhScmWG1JejVNOPGaxp46i6TRPKcEV+mAb67OCrKGH/QSnVw6i51bRcAonuyT7
         KsDtv/Kktl69/vUkAZ+M1+U5ifwxH2t6LjxWLy+biZQnsJEO6gVpbhDkn6/0yCz6drFH
         pjMstN0H9C/FFIPbH2b5fD+TDMnwTc9D9J+fVaI+dlVudCudGQcmyilZFNoUb02QiXBY
         VjISUMsu0fL3GT+GvJNHskgXCXjwbuFx5uJ33tf2yAaEOn9omulQB/v0uP7UGugI1CoC
         PJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698893356; x=1699498156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xY9e61NSBd34WKgwLiextVdIl1pEHWCBao7kYEHaYbc=;
        b=S4tYhB+Mav7oG6tpcrMH1c/pnIl9ntMNzTQ4B4IQ+/jOfnAofe4+KzIv5fSDwraMcj
         ba2o1C0MqnK23Tzwpo3zRRLJtLCYHS7hTsI2bBb6RaPI2hRD7KSAgwdgNk3aIbVYemLZ
         0QRjeicqE859A24VzafGZpX5k2hoXmTBVlHuRjwsLou2LA/+8dtAU8WCL+nSCHg3QQXZ
         Ch8rQHjtaidPNocCJ0EZk5x2GyfJpJmomhIahp2t3Z0eB1B68bYjF5iR4hYKiVGVzSGw
         5Vbg07gWaOl5KjqkvsYJ3gTVzl9QLF2v2gv49c8VGQ83yz8yROlppH0qI/Oj7s48JAOY
         v+eg==
X-Gm-Message-State: AOJu0YyOcetZHWFgzM7OFuHvE1gtfuCBG0FT91V7Pv3h4AxgQekFb043
	D1lLYGHz1sv1TGPoC41xaQELGA==
X-Google-Smtp-Source: AGHT+IGIkak0BWPmf96vSjrzvsdLE6FSIqQnE69o81x6bAW2NsVUROi7m+yImFnuEBD3qfEnlgNLMA==
X-Received: by 2002:a17:902:904a:b0:1ca:a290:4c0c with SMTP id w10-20020a170902904a00b001caa2904c0cmr14004681plz.16.1698893356673;
        Wed, 01 Nov 2023 19:49:16 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:7e4c:4d4e:6943:bc0f])
        by smtp.gmail.com with ESMTPSA id n4-20020a170902e54400b001b850c9d7b3sm1925787plf.249.2023.11.01.19.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 19:49:16 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Wed, 01 Nov 2023 19:48:55 -0700
Subject: [PATCH v4 4/7] riscv: defconfig: Enable mmc and dma drivers for
 T-Head TH1520
MIME-Version: 1.0
Message-Id: <20231101-th1520-mmc-v4-4-86e0216b5994@baylibre.com>
References: <20231101-th1520-mmc-v4-0-86e0216b5994@baylibre.com>
In-Reply-To: <20231101-th1520-mmc-v4-0-86e0216b5994@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698893345; l=915;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=ht5Rt9iMCRM1t5yThjxoCTbuOVz3OXmRTAYLzzfd3/s=;
 b=FZMIpbOF3eXJOg41M+jpGkm0JMPaPS1i+Fh/DURCDFJ6QTIV6xnD4KSvnKvDKTZm/Q5C4u02O
 XJ40YVrYjkqDC8JNiTK4WMQXC8RJvH5O3/cEe7X9+tCNDrDxEPQ8ITa
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_194917_889900_2585210B 
X-CRM114-Status: UNSURE (   9.54  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>
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
