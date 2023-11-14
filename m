Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38569C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 21:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1mMv4ofHgIshuICtxw8YXyj2s3VD9uu6c5Ar80uMv8M=; b=bj3mgrN8Es4Oyo
	lZzDtICSOYVmlH3+dqC/7pvKzGk4Zvf+RflJXF0g+BcRDB0AcY+Js6fupNL9708dgXr6FMxZU0agk
	IwXLw5wz1sxdMtSiufZWF/pj352+hZmzwtrA5ERwbix1Ry3E04bedC/zQMYwqQq4l7wphW+Xbw706
	ywq1HqoJ2Reoxl23DMavOq7ST0HRi90FarcGXwFlLAp1H3D+5ssfWAZ2oMEVcYHJVddzAIL4jLl6N
	G+GhgjtUA+vC00GKz8HJ0g+TX2FWyaa1jF0V6ODyctGcTxxI1HnLhJ+ePQqXglADLNsAsw9BN+yQa
	l2VcTzwmJRHHA46Nks3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r30dw-00Go5a-09;
	Tue, 14 Nov 2023 21:08:20 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r30dq-00Go13-35
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 21:08:16 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-41feb963f60so1784901cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 13:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699996091; x=1700600891; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xY9e61NSBd34WKgwLiextVdIl1pEHWCBao7kYEHaYbc=;
        b=B6wf68Afofqh6UaVIb1E7eGmdnElcgyTCfPzg/MNpaaQsMdkkEbyo974KW5Ngagr3m
         YgJ63H0q3sfEkrdZyg39Fous5ndafpYUTfHDiJTFhq9gYZm2AMr+1Oz2atLWiiTW5gZj
         sMJqLBuJBoE1L0hHGv23fyI5sbg8CGn7WUunI5V6lyQcrSEcFNlbdrpfBksXojSlnEaF
         mAcjY/Ca8hlxjSgMTN+dO9vwUFr9LPTkg0CXzgaSH90xQcIwQ6OEylmaB4fJRJJUXWYN
         SGH6ZJZfYhGxp00V934UUBmtZuBWXJLCrsm/nhlAtef8MuE7JokH20y2ssjSkt9Kk3Et
         oFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699996091; x=1700600891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xY9e61NSBd34WKgwLiextVdIl1pEHWCBao7kYEHaYbc=;
        b=vaHQQ+ImO2bZOGVG+PR7HMSfJPym48QYCsrE3kwor/m/+hNpaPE/uNuhOx5MBTqlS6
         gYiFqxDm1Hydn8DLHai6cjn+qDcT6K3Lyxo6E1LMaq5cus//WN7URZFw22pYS1ljWYOA
         VJVBqcBfZ8E4yjsj64z482rIVwwF+X+N+t9QmD0t5XpkzM/A5rDCDKmWZDfduGgOTG+P
         O4QeAXXu/Q5m1yT4TxdMr5CvCb+P3VLjwVilrAPJbcFHhGzB2RS0wZq6+H3IcHIeM79L
         JHAUSRkbk9Gs8Z+x5LhaJbvdkCC6asWLMznGHz37O5UGfTyeFrSC6UdiAj2Qrk8/siKE
         vnFg==
X-Gm-Message-State: AOJu0Yz3kwtq9TZAv5NJXI6whdzKfMP8g+p/B5yKbyrVw0xffP4j6MJx
	8Ba4I+pgEYtu4RTLc4vMdONXdg==
X-Google-Smtp-Source: AGHT+IFJvqoQROwwnZlNFrPWPbi+KrCcUZmD+wBQHJolGGJaCfaUKesmouXXRiY5zwFysxdAbpnclA==
X-Received: by 2002:a05:622a:18a9:b0:403:a662:a3c1 with SMTP id v41-20020a05622a18a900b00403a662a3c1mr6177219qtc.29.1699996091186;
        Tue, 14 Nov 2023 13:08:11 -0800 (PST)
Received: from [127.0.1.1] ([12.186.190.1])
        by smtp.gmail.com with ESMTPSA id x16-20020ac85390000000b004198d026be6sm3027549qtp.35.2023.11.14.13.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 13:08:10 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Date: Tue, 14 Nov 2023 16:07:58 -0500
Subject: [PATCH v6 4/7] riscv: defconfig: Enable mmc and dma drivers for
 T-Head TH1520
MIME-Version: 1.0
Message-Id: <20231114-th1520-mmc-v6-4-3273c661a571@baylibre.com>
References: <20231114-th1520-mmc-v6-0-3273c661a571@baylibre.com>
In-Reply-To: <20231114-th1520-mmc-v6-0-3273c661a571@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Drew Fustini <dfustini@baylibre.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699996085; l=915;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=ht5Rt9iMCRM1t5yThjxoCTbuOVz3OXmRTAYLzzfd3/s=;
 b=JTamoh/lCi7AMcxyCl7HeTkxkkYYuIc66GCiiSy4UUWu0BsgiDMdM/Ez/NrXpxAMeY8exyl1a
 Ey4mBBQRxwqBZTsGmBhcVQPqjRvWp7v4rtzBvBsm7SyVjBWPZDXMJS3
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_130814_990722_6A665692 
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
