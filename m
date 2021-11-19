Return-Path: <SRS0=zkJ7=QG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F4AC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:45:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67AB161B30
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67AB161B30
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oCLKKWGZBZMg7K5pAAE1KSyYLY5XlmogIaSkMlXXeJE=; b=z2GH4znOrKoYLM
	uAgf+REoM0qXAaiXD7M1x7erN4r2/K2vN+uUohOK18tCUsRvA6eg5fpJXXiacVLkhJ4zTLAd6Vx4P
	r4HYJaG3kRZjgDIITM1PgOsthxeePyqXqejoM3NJ6m5K9i7HkrRN3CrBPgd2tbbABrp2Lw70NZg7y
	Sj1o4iTa3FV2kp+XvPy7TLqBpifh0q1O4sT5aR64U6fiwMUcW0ZCPV1soTMXDCwE8iI5hV2e+73fL
	IhjXEtzw9lQb60DpNfda2C18HRxOY8MVFyqY558kWNVuZbKjLwJW0MdHrhReKNBeYJGic71QkeQfp
	rW8OD7riZm3LoigLzhNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo70N-00B5eu-Sb; Fri, 19 Nov 2021 16:44:51 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo70H-00B5be-4j
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 16:44:50 +0000
Received: by mail-pf1-x435.google.com with SMTP id x5so9882335pfr.0
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 08:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=5ChM9rojwfVZwb854uhoQhujli+NJle96xwmBErH+IU=;
 b=DaCfNGu+rNT7plyiOhA2fSQzYoF3ErJeSq6lLAt9u7p5aRck5wu/2q8lyTSKC9FwL7
 8mt3lmeZ6OpVHgLgtMAyDz44a78JkOoCWTRVB65syJhyKhGddI9tWRbuaIqKuryMM0cZ
 qpq20nC50jElNtQrUfuJwwqeLesDO6dbKe1Tk0VUFmW5xpDzSVEDztR9ZFBBxGRk+1sN
 hCav4BtrNRiyAnus7AcC4kWfXf+7Fo34FkZdSuFFCy1/QvGiXIm54hcm8YKlUrHoMpWH
 fO8FTlpHAJZMFYf3dPqlwJFPtUlHBygsGhK2YhmcMHN6plY73ISQXSDvOHtdnu2inQoR
 dLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=5ChM9rojwfVZwb854uhoQhujli+NJle96xwmBErH+IU=;
 b=pDGyDEVUacORiUaIc2N+cfNSiZsney7KksKlEXLBvimHh1q+xqMDQ6uFE0qNqpuw5V
 ynXSr5HwPuRSkjf/MzuuCiEgeLQUHZXaqHPrQGrrz8sXHG6cc4IJSBKwdVaA+ce0xdGX
 mRnXkfQvOGjCRpGcSq7Utn6u9gcnHv/FYLgAKy0zFZUBzjSrt0w4PUCBt4L1i8MowQMq
 Z4SAk0RxL1+c8JEPZF2ch4EsUwyfhyqPG1YY4BJQRaK0ZuicVfeg8TP0lCZRN7eN7KzB
 Fiklnr76AY9jmqDgjJgoPMXnjmAqMzjpsbx9XtubkfOmypEKOuZ3VDXb6T99QCltPZbX
 b2VQ==
X-Gm-Message-State: AOAM531XvcyPTuwmRGBi0hw15WzgoxcdpoillD+Ou7SoyIgLYkMKe6bz
 ycqOB/My0io8gRTTO6pxeiZerUDhPKb99ogk
X-Google-Smtp-Source: ABdhPJyf466y1OSj6NIxhcvh6K8TQYHu4W9tg//KV4Y0C3o/44ZnxTLiwoKCUqKKG8aX01yCdYyQZw==
X-Received: by 2002:a63:ce54:: with SMTP id r20mr18197963pgi.95.1637340284094; 
 Fri, 19 Nov 2021 08:44:44 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id i76sm194874pgd.69.2021.11.19.08.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:44:43 -0800 (PST)
Subject: [PATCH 01/12] RISC-V: defconfigs: Set CONFIG_FB=y, for FB console
Date: Fri, 19 Nov 2021 08:44:02 -0800
Message-Id: <20211119164413.29052-2-palmer@rivosinc.com>
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
 Palmer Dabbelt <palmer@rivosinc.com>, stable@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_084445_230447_A2D6ABC1 
X-CRM114-Status: GOOD (  10.17  )
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

We have CONFIG_FRAMEBUFFER_CONSOLE=y in the defconfigs, but that depends
on CONFIG_FB so it's not actually getting set.  I'm assuming most users
on real systems want a framebuffer console, so this enables CONFIG_FB to
allow that to take effect.

Fixes: 33c57c0d3c67 ("RISC-V: Add a basic defconfig")
Cc: stable@vger.kernel.org
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/configs/defconfig      | 1 +
 arch/riscv/configs/rv32_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index ef473e2f503b..11de2ab9ed6e 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -78,6 +78,7 @@ CONFIG_DRM=m
 CONFIG_DRM_RADEON=m
 CONFIG_DRM_NOUVEAU=m
 CONFIG_DRM_VIRTIO_GPU=m
+CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_USB=y
 CONFIG_USB_XHCI_HCD=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 6e9f12ff968a..05b6f17adbc1 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -73,6 +73,7 @@ CONFIG_POWER_RESET=y
 CONFIG_DRM=y
 CONFIG_DRM_RADEON=y
 CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_USB=y
 CONFIG_USB_XHCI_HCD=y
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
