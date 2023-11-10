Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25DBC41535
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 05:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1mMv4ofHgIshuICtxw8YXyj2s3VD9uu6c5Ar80uMv8M=; b=OokDkIvGvBdAZt
	tMj4T1SbE/Lnoyf7m5pih9dG1KoHyFZvqE7Q26jji0MwmeKba/L60jOr+NFPUkez0eslueZ287u+y
	kF5Ea8XvESoyD9eaOhtRNmscz9v7pIENNWY451b5rT6u9JC9VHJt3EaFvlIcmDAU5ULJe1877cL45
	wlfYC84neaqtK8nJUm1o+UjC2yPd7iZgVou+gltxdHNKYFOGxcdy1uGfzVb1HVJ/f7CEP6AEhIEgT
	dwPYkrhWyNYfKw1uuMQ2J7pETOKgwxpFG+26wBITBY80WXG2W2aqXA/NvbJuRe8WLS07tVekUtRhI
	jcWzPoaDW0f+CRlNZKVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KHr-007u6U-1q;
	Fri, 10 Nov 2023 05:42:35 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KHp-007u5S-0W
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 05:42:34 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1cc0d0a0355so14633915ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 21:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699594952; x=1700199752; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xY9e61NSBd34WKgwLiextVdIl1pEHWCBao7kYEHaYbc=;
        b=hZ6SDC9bgrGTZONNTZS+2p76iQC84tRs5QbEd6g4JnfMHUOoCLnhMyCDd1XgJ+rUMf
         STWuPQgdJM/fWeepCHgNaTOCS13yRgRg0bH1673Bf7Aw/tctvD7oe9eqsOtEXHuAY59N
         T69QEwWqFwSu276socxAEB6tuz0JOl00SUWbYcBcSxE3mXy3cmefjp6R46Coz0Y5hw7d
         IwNG53LSBoWZhBwXnuQ4Uh5S3FtsrgAWMsrsS3x4ermyuIytbJ1H+m9AUaQx03HmsdtV
         kE3o1pfrHlSU3p3SA/nxW2SSvFwAcnQpyKGU/Z+8lYxmLQ1mfw5ZelywHN8ToRYket3o
         Xo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699594952; x=1700199752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xY9e61NSBd34WKgwLiextVdIl1pEHWCBao7kYEHaYbc=;
        b=oZcQv+OoVnuyN6nVOAoEPKIgNHMYrkONS8AqOHGah4bQA8qofHPBs1Smkk/F+ZnXMj
         dShvEK+LrcpYEukTG61VzlOdwhShLkp99GgTv98Eu+43wwgThZGXquSM6FuGEfVoUlYX
         /sW5kCs+/Tq6GW8AzIg0TKSKzJ8WXct23eK2lgXw/7OiZ6MZTJ+2vGPglR6Qf1XAGJOz
         PAWBJ37krHSUtX3qg0/92KIMx+UYUIPN3ZlbG8yTf8vIy9+/miNZbsio1wqOcASoK417
         DxCGdrDiiWKntC+asUxeHtWxXwmeVwYQ348XDLyJ4H4mjL0PyERqgCj4e6zqLmyXJElO
         //Kg==
X-Gm-Message-State: AOJu0Yx+6lolW+P04WZIh2BB0t1jsnCGF6NJCP5ycBLsYADt/JHsglzm
	VwQ2iEhz/F5fl2BCCO+AbxK3pw==
X-Google-Smtp-Source: AGHT+IGXmrfa4qbmD8PufQBo8ECvg8/RA13eLrik89guDJz1lWQRgT5GoM06ddfpEcVwZ1Qo931DgQ==
X-Received: by 2002:a17:902:8c92:b0:1ca:8b90:1cbd with SMTP id t18-20020a1709028c9200b001ca8b901cbdmr6854012plo.0.1699594952706;
        Thu, 09 Nov 2023 21:42:32 -0800 (PST)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:2071:4479:98b8:cc69])
        by smtp.gmail.com with ESMTPSA id ix22-20020a170902f81600b001b8a00d4f7asm4498845plb.9.2023.11.09.21.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 21:42:32 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Date: Thu, 09 Nov 2023 21:41:14 -0800
Subject: [PATCH v5 4/7] riscv: defconfig: Enable mmc and dma drivers for
 T-Head TH1520
MIME-Version: 1.0
Message-Id: <20231109-th1520-mmc-v5-4-018bd039cf17@baylibre.com>
References: <20231109-th1520-mmc-v5-0-018bd039cf17@baylibre.com>
In-Reply-To: <20231109-th1520-mmc-v5-0-018bd039cf17@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699594943; l=915;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=ht5Rt9iMCRM1t5yThjxoCTbuOVz3OXmRTAYLzzfd3/s=;
 b=81YrMX/6Pup0Mk4t9Mpny542tULxqVs1k+13xNQqBbmGqkaQgZCsQjsJdqcuxcUGHQdm9Sdy0
 DormnbG2KwrClt9J1tjQHZ3FwqQMqAeqmWYK1a5r2HceKW/UQkdU9DC
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_214233_196133_B83E2012 
X-CRM114-Status: UNSURE (   9.12  )
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
