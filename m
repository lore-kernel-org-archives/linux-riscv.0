Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D53CDB482
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 20:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pRs+JECDiF01iGA3sMTeu9oJxfQsqO2GLJ8MMNBNh7I=; b=lf7eR7ndROkk9g
	J1OyatJ7iDc2OS2o+Oqir93534cj5ECyhV4Pz548g30EjNl08XCfu8mt+LQfDHZv9Fznr83au9Qst
	vHRe8TTwXq0s6G0PzhROrRIQuVkDMZvGWVTs9MMcDcoe4HYgdRriok0YDALBSV0xKc26GpdknrW6U
	kKf7VkL00Ckqp2ZH4y03w0lW0Z0evA6Lr9RCWUM6gYffWoRtl+axBKOyUFpctBUwvhTH7nXa8Gjw4
	SHNnoTSBLBPtRfTNHApcU/K1mrqNVMaW/GiUjdHrTlCNOElhYDOeQXdVpMQkvaJok+045MxZGx8uf
	Jsw/onQYuFNPUudFz8og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsqwX-00DE44-1i;
	Tue, 17 Oct 2023 20:45:33 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsqwT-00DDzx-1b
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 20:45:31 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c9de3f66e5so38122025ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 13:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697575526; x=1698180326; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2BmxulcCPkSniZYdQWfk9xRMqLpea0NZ1oqzxL0OgN4=;
        b=HeVaDDn4zbC7zUgGbfAjhOZrfCHbB+1lQ2UIrsOtGAU6DN0Azu/S3oSJVymkyD30Ga
         qdH9wrHJ12Zhp0jPAtosElJu+q7Y3WP7oMi8fQ3GnIudWmtgj5G2/iIkAL519gFMx2lr
         sMeYQlbWPw9SjPaLZD3x2gGgiiOkJeWoNOutZ6qE58oNNmCHBvjnqLV1/xrX82AArRLa
         7N5KqMI7dAAeCQxAQjYlBnXBxStj7jHSZnqsA878ZDeEgGO3f7VVq934AmRXI58RuhnT
         kHdKGoE37IFugLd0ZQVRfkvr6lOqAroz1/ORy1HTz1i3HYUEu9GPDhrWHbwT7Imn9EY3
         CT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697575526; x=1698180326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BmxulcCPkSniZYdQWfk9xRMqLpea0NZ1oqzxL0OgN4=;
        b=oYSeMSATiiu27+vbS3tzL0DeLIzDedH2XmXeZsKxr4E2Y34/fmG3ItRsYJP9chQDfh
         jBEcjgiNOwYPSzGU+upnbru0flrfjTOQtkTBK1p+rINGDYCuyGs1swZQDJUXiaBfG6gG
         T00N4OUVdeMunipsyQKMbQNMr7wuvjNVOZXpQPxIIB3bi9P1eajm9koxsQQelqq8ebCd
         lcY/84z042NhbRtCi3chhE2TCQK2rWygjTAIPW6yurcJRdx/M2OZMVP/yh4cw+bA+Swk
         i9egiMNiKqYXuN2irWgV942V0m+KVfAUFOsmvQNTbN7VbMQMNgPP3QzOVOag6voPp8e2
         Cu0Q==
X-Gm-Message-State: AOJu0Yx1lSPmx9w7R1Y9bIjvwdmbSRYFcD0nJcp+0pKI3lP6jCI/Z4IX
	ycDXfKyainyrz32ER/EGbUvpeLQWZNoqzGLdAJQ=
X-Google-Smtp-Source: AGHT+IEzzNmgIZ8zis35YXLxguwj5DngT1258LdDb627amXgp9c4UUvS9r5IPBtrYpPwBsm5Y/h7PQ==
X-Received: by 2002:a17:90b:2501:b0:27d:7666:9596 with SMTP id ns1-20020a17090b250100b0027d76669596mr3072562pjb.11.1697575526448;
        Tue, 17 Oct 2023 13:45:26 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:51d6:dcd6:63ef:52e9])
        by smtp.gmail.com with ESMTPSA id w3-20020a17090a6b8300b0027b168cb011sm1906553pjj.56.2023.10.17.13.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 13:45:26 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Tue, 17 Oct 2023 13:43:50 -0700
Subject: [PATCH v2 4/7] riscv: defconfig: Enable mmc and dma drivers for
 T-Head TH1520
MIME-Version: 1.0
Message-Id: <20231017-th1520-mmc-v2-4-4678c8cc4048@baylibre.com>
References: <20231017-th1520-mmc-v2-0-4678c8cc4048@baylibre.com>
In-Reply-To: <20231017-th1520-mmc-v2-0-4678c8cc4048@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697575515; l=873;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=1b6E7IcYPcGUX3CsWI9slySNkcpgVBWsbFODn/9h1s4=;
 b=35sRMPw4jZ4wGRrdg+DGS4oNB75lU2OE/PvljPF/GCaThFBcZGUoTrJbIi4kNmE714EcWRq9I
 FUKF7Fv4YiNB82HJ4GGaDCbqEs6wY44RXyc+Euh+2yVdj6gHQDyUizS
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_134529_532957_3442B53C 
X-CRM114-Status: UNSURE (   9.29  )
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
