Return-Path: <SRS0=zkJ7=QG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273DCC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:45:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E707961545
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E707961545
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+fiQ2QeiNPWdcANgyMavBCD31ygnkGfSFktx/AT2amw=; b=J0NYdx27LTkQOV
	IF1eOo69XWiCPOFu8qeHH+37/X0CFsE1EwaaBiw8nxpd0SJ1iJhRPyhLU6JJQLtMvG/3QzRAfuzoe
	2uLggISRr7JhnRA2zAOID3bU4nWEjqI4mho+XZJJHfOzNqtlcBU5cI5qjoOzgq8+nBMlXQlmZem60
	wbm3qzQJJRKglCNgU8tSfydaJy5KJCT6cVa7J4Cqs1PdCc29qaL7UOAALLXqF7HveoawiTeNTwtwS
	f69f3fS51+hPxiOAH4QXoWKaVXNVhYIvCmvG/LeGTVxgi0RrfebiOG+/L5JbcYH0nphqvmTWYROlz
	7vABn4Q9puAPGhp0zJiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo717-00B6CN-CA; Fri, 19 Nov 2021 16:45:37 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo70b-00B5nj-VS
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 16:45:07 +0000
Received: by mail-pg1-x529.google.com with SMTP id 28so9103414pgq.8
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 08:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=ivqtHuQQy+Ti1nGZM78VH3NnxqlTHSj7efazweFJjBg=;
 b=xCJz84KUacA0+N0Ca6TRoBqmuuLTgLoHxBPbMdmvVVYr2Z4lQ6x7ziqa7G8DjcIsXB
 35wAgPJ+2MeGBdtBQtGakgnIhw+JBChvxlxedWkQmm5vhkm/oVEJm3gH6VvZEWF1V5hi
 7HOYHSf2NMWSnt5Y0MdH4A3TOPJZXzcx8fjmth/fkMEoz+jfsCvusR8n3HgeTurfWkf/
 AI9y4j9vwb7624GPrW/ggtfsZqjDohsws3KxSHl9ZX0n7vdy6YLvAfwjX/Ao9if16p29
 QiYcsLjQX0GaC8/7rBPfudJ64y2lrnenoJZyvxBek8mTcC9DRWsMj2HKcFGnA8l6j3A6
 xHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=ivqtHuQQy+Ti1nGZM78VH3NnxqlTHSj7efazweFJjBg=;
 b=BFDY+qvgWBDk5Pq5hLJvmBiJrpYNQG3GGTBpheYQt+sRgaTkdcEKvunqs5GRRKbZa0
 neM2jgZ7PJ5dTM8rMXJ6wgnQ1apSLNsPw/Hr1LqT0Ju2CQ87u0CPZqQ+qU3P5hcUtdDj
 bN70ruUVKd6oM4GeYx4C0gKAxRXS7Mch9r+3zIPxGUXcPLsYZDOvhspyTaizYhNPrtPT
 oTUCKwn560Gq90L8hgR6LM/AQBuI/RaiCipIM8u8IwZ8gpkF2vtkQx1fGhmXlRQJA0Nc
 cDPLc976ETlh1Vl7fkqHpK3jiC2h+LVutJKLOrua9J6GYwvacq4o7yPIE63myfRdjNob
 bmvQ==
X-Gm-Message-State: AOAM530IS4L2317BMbvvK4OBNovZeRRd7jDqG0Vsso1TtnsnYb/ar4IH
 GjuLcw6zYaDZwzQRuLZ4I110tg==
X-Google-Smtp-Source: ABdhPJyHrtCKVEz3g1W4YC/nDDEb0i8GXYsPXYbT0SIo742e2HT/EXNSMRC4MWwkFtknpt95l9iQMQ==
X-Received: by 2002:a05:6a00:1399:b0:49f:ae7d:cda6 with SMTP id
 t25-20020a056a00139900b0049fae7dcda6mr24039382pfg.10.1637340303855; 
 Fri, 19 Nov 2021 08:45:03 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id h25sm207718pgm.33.2021.11.19.08.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:45:03 -0800 (PST)
Subject: [PATCH 10/12] RISC-V: defconfigs: Remove redundant CONFIG_POWER_RESET
Date: Fri, 19 Nov 2021 08:44:11 -0800
Message-Id: <20211119164413.29052-11-palmer@rivosinc.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211119164413.29052-1-palmer@rivosinc.com>
References: <20211119164413.29052-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, anup.patel@wdc.com, heinrich.schuchardt@canonical.com,
 atish.patra@wdc.com, 
 bin.meng@windriver.com, sagar.kadam@sifive.com, damien.lemoal@wdc.com,
 axboe@kernel.dk, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_084506_064492_FA450D35 
X-CRM114-Status: GOOD (  10.07  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

As of ab7fbad0c7d7 ("riscv: Fix unmet direct dependencies built based on
SOC_VIRT") we select CONFIG_POWER_RESET=y along with CONFIG_SOC_VIRT,
which is already in defconfig.  This make setting CONFIG_POWER_RESET in
the defconfigs redundant, so remove it to remain consistent with
savedefconfig.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/configs/defconfig      | 1 -
 arch/riscv/configs/rv32_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index ec9540392df7..a72dbd74b93d 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -74,7 +74,6 @@ CONFIG_SPI_SIFIVE=y
 # CONFIG_PTP_1588_CLOCK is not set
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_SIFIVE=y
-CONFIG_POWER_RESET=y
 CONFIG_DRM=m
 CONFIG_DRM_RADEON=m
 CONFIG_DRM_NOUVEAU=m
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 1f6808aa1261..8b56a7f1eb06 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -70,7 +70,6 @@ CONFIG_HW_RANDOM_VIRTIO=y
 CONFIG_SPI=y
 CONFIG_SPI_SIFIVE=y
 # CONFIG_PTP_1588_CLOCK is not set
-CONFIG_POWER_RESET=y
 CONFIG_DRM=y
 CONFIG_DRM_RADEON=y
 CONFIG_DRM_VIRTIO_GPU=y
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
