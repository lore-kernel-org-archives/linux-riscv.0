Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899B3E92FFD
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 07:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NyY8InA/DNvFIRLR0ESwnM+KVvGAteeoKZpw27VWV8o=; b=pefJoiZ6rPaD6D
	yHgXcDdmowiOoS/H6YHkHicpvz84Km2Yt+xd81ve5YCwqVrcuBnFIqFVpGQa3wDt2+B7Bs0agVl26
	O7i+6eCzEB4uqjPBeItFrOP1ax0kWcF4FH1QG4TUeTgjtkBdoiKFeThdZk2zgxigTKTvIzXkuVZxW
	pnyE184thfpxSM2JgITravEJn0e2lVZEX1LAbv4YeO42a0xQB+c4q5QhyQ4lO9hOm9lpP29YoXdmL
	PAxHZ01oP2ZxSs/fz2Ybe6LKRbAFVZbYVMH2vrdN3EJJE8VsR4+wrRz3X+bsmKaq6zKNaMWFrjmA1
	BNVO6CHiLwczRRosje8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp2CK-0079fC-1k;
	Sat, 07 Oct 2023 07:58:04 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp2CH-0079e9-25
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 07:58:02 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6c67060fdfaso1932621a34.2
        for <linux-riscv@lists.infradead.org>; Sat, 07 Oct 2023 00:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696665480; x=1697270280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4FXVyN5gTzbLetmafn65CKFetT69h/TQ9sNDnsnsoU=;
        b=CQaXuLfuyIFB/Gs4gwQWDiAad9xvIjwjHMBgNe+r9i/cBoRIsIiifvGHhVcu9y4EUA
         i07GBnDIrW+0b2ekZqIQXoBA/hQ0K4efPvBtOHVvVNYnXI8FY68eWPEirxU/WnlQTpgS
         Pi7XmDOBYGS//eCzM5NBzNcEN19FfWbHmeU2XWnZ75efcgYsLkOlv8b0j7ZfVFV7QS5n
         knaWCK43ocGMunCqdqVZbFtHtHj97cScfCe8ifu8nw/nPnxxiG50zWV9enKfBFdx21qK
         uBa1WHkoJLTi5xeVXIIxOxs2fzbrNA2899pLrOT5tJNUTrztTdyLJBzqdaflLZ87XZaG
         /+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696665480; x=1697270280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4FXVyN5gTzbLetmafn65CKFetT69h/TQ9sNDnsnsoU=;
        b=fKUXMcRrQQknzqab3ixHAvAC3QJ7pLrN5QqHPxzeIJ33w5Eh5NNKN52t6qerUepjm2
         aceqMsOWlKUU9Gl+vaQZdb2+7jqw1oy/OMHz08Mn3F1CEy5WIm4X1ieehi2SAVCtbVGV
         wVLUbiQ+w04Xgl2fXhzL91LdvhhiuiRu8DLcf3tyCQd8Yd6XMUztawpVS+vWyNtiupv/
         5X1CbAbobITcYgbtMfsUnzBDhZeRttfaThl3l8t/cCD3z0PjeVLuWQjftwyf+iyROAit
         rmNr07kfjg6cwPHz4Iqvydte3bU/wBrSSyP6FhJsUKGyUSkoVPG5Tblli6QQcFoBq29y
         EIHQ==
X-Gm-Message-State: AOJu0Ywcz0fbCpo5qPEU8idQhA+FHYcHkbdmB9Gz7bIKwGGzbpZzG6V3
	+9hKUVoL0MRl8Aw9ggEmWZmUbAYRz0VSDYzN
X-Google-Smtp-Source: AGHT+IHEccQE4XHAgSZ2hfQK/cHeUv11vIoPi5s95iiPvHqfedlwnQ8rQsV/au2INVqdbO37/SnHYg==
X-Received: by 2002:a9d:6c0f:0:b0:6c4:d08c:6a2 with SMTP id f15-20020a9d6c0f000000b006c4d08c06a2mr10223004otq.9.1696665480022;
        Sat, 07 Oct 2023 00:58:00 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id k7-20020a056830168700b006b87f593877sm832825otr.37.2023.10.07.00.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 00:57:59 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com,
	apatel@ventanamicro.com
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 10/10] riscv: defconfig: enable SOPHGO SoC
Date: Sat,  7 Oct 2023 15:57:52 +0800
Message-Id: <53553d9a75740f528c4ea22860055bfb642a2cac.1696663037.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696663037.git.unicorn_wang@outlook.com>
References: <cover.1696663037.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_005801_683332_733D448A 
X-CRM114-Status: UNSURE (   9.22  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Enable SOPHGO SoC config in defconfig to allow the default
upstream kernel to boot on Milk-V Pioneer board.

Acked-by: Chao Wei <chao.wei@sophgo.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
[conor: fix the ordering]
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/configs/defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index ab86ec3b9eab..1edf3cd886c5 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -27,10 +27,11 @@ CONFIG_EXPERT=y
 CONFIG_PROFILING=y
 CONFIG_SOC_MICROCHIP_POLARFIRE=y
 CONFIG_ARCH_RENESAS=y
-CONFIG_ARCH_THEAD=y
 CONFIG_SOC_SIFIVE=y
+CONFIG_ARCH_SOPHGO=y
 CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
+CONFIG_ARCH_THEAD=y
 CONFIG_SOC_VIRT=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
