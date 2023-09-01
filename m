Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11F4CA0FE1
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 11:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4BeWmk4nml/1RUeAg/jGrfW+2QrtBdO6MCuadE0aRiw=; b=I6IkvFBppYMZ+d
	b/V8+5vA8r5uR2OqBSBF7n3r5pqqtM5bNIIV0HI2YkF0IiypcwMwl9LC7l9BFUOQWGCEMljckR4Xt
	p6MPW9Bnyja4aZmy4VQKY3J96S5h6YwoxxHSu1axBeN7QOjWo9TLA7hLyKiAesLvVuNSWFOcPc0mE
	6PsURtECXEIkq5M5OXVUIu7e/ZJoERhe36qDzZ1M8gnGiNbkiMD9YD39cwaoZwEJFquQSmQY0bC/K
	gwWwkExBG97e8ctMr4LSkcIvyXGcdPnsIC0PLFUKa3ys8P8cBm2jua/WbE+XwJGHwME8Ks6Wxp1Iw
	rIrlX3yqSE4cvk7gOwPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc1sc-00H26F-2S;
	Fri, 01 Sep 2023 10:59:58 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc1sZ-00H23A-2M
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 10:59:57 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5008d16cc36so3276337e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 03:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693565993; x=1694170793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lPHcmAD9CRQ9UoDmbcvoNZ8a9fCLHJeehssHlOotx8k=;
        b=eUbVVHKDtmJ9z9nKgRmHD2x4V798cYjhYFwdx2Eq4PZ4iJCi4MfFato/51Ul+Dq51s
         o7eH0KNvykH7fnJvg1jAcW7o00bp7e1ntSeNtLEyhzvwL9xn6R+JBUr6u+6Z8tqe9xYH
         yTgr1hQxt1z4xX4eZoDsQn1W7Zy/T9vNKlBdTT81dfgkHt4uYidoo0RnyxWLZgxn7bXU
         AEQTU65biOp4BKaC03CfxhIeb10nzz3qPsJ9FYhfZw3y0Mf0/BNMXf4tEynoKgk/NSpr
         rMSOBHf8y4G3NWW8f+P/FopGCyJBFeZMz/QG5CsIcWnH6yZ8jLtF0fZ91dwoNhs/hvk1
         D5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693565993; x=1694170793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lPHcmAD9CRQ9UoDmbcvoNZ8a9fCLHJeehssHlOotx8k=;
        b=ERYmtrCsoJiuX+3W+WJasU0DRfYr9etTeZwxe0+ZbGyr6S+IYO3nh1Cy8DtvxeL/zJ
         RK3nkA+21OJnrdQ5MITOeSOaMvLHjkQl5wyAy1QrNfQJp0GST73/iIQaSdJdgIevSWK9
         qPFYHvVxAmqrOCMpzb+kWsKUDwHFLUvmBicRcNCuRlVaheCszm6Q2tn4aIjghelGQDwY
         45fawDA715WwVT/Syer6wB/uuqp4h2A/l6cbZdkyPSJ5X0EbkuGpPd6NlEQB4ldXS5E4
         dwJ9673lF795dJwEX+UIt/0/J0k1yYgAR/fqS6gW8u4I2ohNnWSNKJXfgQG0W9whGbfN
         +N1w==
X-Gm-Message-State: AOJu0YwmcE8FnG/1UOBfmwwiG3jDqnaqsq+lJxRg1ktlajOpP9iUf2+U
	O/MstN0nQWJPJRgFA3maSuEwH08sZgMFEA==
X-Google-Smtp-Source: AGHT+IFcg/nVsdjSQfPUUokzU+sRfNuxh2D+RuR5R16y1wHUCa60XciguEdDyvboW1fdR/xI87GXMQ==
X-Received: by 2002:a05:6512:2114:b0:500:78ee:4cd7 with SMTP id q20-20020a056512211400b0050078ee4cd7mr1165114lfr.23.1693565992910;
        Fri, 01 Sep 2023 03:59:52 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:64d6:8737:b80d:a298])
        by smtp.gmail.com with ESMTPSA id 11-20020a05600c248b00b003fc01495383sm7657973wms.6.2023.09.01.03.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 03:59:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] riscv: Kconfig.errata: Drop dependency for MMU in ERRATA_ANDES_CMO config
Date: Fri,  1 Sep 2023 11:58:58 +0100
Message-Id: <20230901105858.311745-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_035956_241311_4C088B46 
X-CRM114-Status: GOOD (  12.14  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Now that RISCV_DMA_NONCOHERENT conditionally selects DMA_DIRECT_REMAP
ie only if MMU is enabled, we no longer need the MMU dependency in
ERRATA_ANDES_CMO config.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note, this patch needs to be applied only if patch [1] is accepted or else
we might see build issues with randconfig.

[1] https://lore.kernel.org/linux-riscv/20230901105111.311200-1-prabhakar.mahadev-lad.rj@bp.renesas.com/T/#u
---
 arch/riscv/Kconfig.errata | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 92c779764b27..bee5d838763b 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -12,7 +12,7 @@ config ERRATA_ANDES
 
 config ERRATA_ANDES_CMO
 	bool "Apply Andes cache management errata"
-	depends on ERRATA_ANDES && MMU && ARCH_R9A07G043
+	depends on ERRATA_ANDES && ARCH_R9A07G043
 	select RISCV_DMA_NONCOHERENT
 	default y
 	help
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
