Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C19BCA0FE1
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 10:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=16Dw8GS467YW9ePUjPhsLR9klNrexD+kioMsPMQm/AA=; b=ude4iP0NYot6Wh
	vv0t/2qo1Em3x2iLTkiSjKAilOnZxARj67kasFUYg6MdymqAGF6z02wgM/YbNOuNx+CFvZPwuhTNZ
	WZ3RoJnLt+6Q8UXhoSQWPEVMJv6DkhrwzSt9R+obioasKyhNrDl0yo0LP5nd0HauaiMVsgHINL9Mv
	GRgWvTVwtCm17r1sJsaM/NDH/Dr4swdDUkh9DMVGiPR420ykXUCOc9ELCf0SHyb2m1eYFyJO3QnYM
	oaGIv6BbWcvD8aA4PIes+wTImqhGieUv3XtUadO8hu2Y1ZZ0X92u4F1MbFLi6sIDwalxl+0uxPZPP
	L/ioLRqLH916VMj12fkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc1l7-00Gxgz-1y;
	Fri, 01 Sep 2023 10:52:13 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc1l5-00GxaD-1P
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 10:52:12 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2bcc187e0b5so32474551fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 03:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693565521; x=1694170321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Xmp9WqBbQgAo1cevlJdH0YFWuDdqUeSzKBH4Ev5l8s=;
        b=WkC66/Ewo0klyDErEiHeejyoBzjbf7TZYw4+KY1KeqsEquttPZTvUUvdl3LMqnBUZm
         sijjd5vSxUYBWWo7B3+N4Abiqn95UJAInwvt4q8VbKQ+k4fGinwu3e5g8/SG2kxwzuIR
         g7WMzhTuYOU7jvcSlNX0S55H54RnkCoUBgw1pcRmFEU4nFCfuvyAJOFHp1pmeAjK5TC/
         l80FBgEu3D5O84aDMSilkc9nuaHHGWnS3ZHCPnMuk3xlJVOiGaik/QXEQpAixltDcc8T
         4LBTVyIEgzKW6kl2BRDB4YGUeqqGDUPvxo/wailj7kBKy0k3KpIeIZrxAlnXHTzdBwDf
         yEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693565521; x=1694170321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Xmp9WqBbQgAo1cevlJdH0YFWuDdqUeSzKBH4Ev5l8s=;
        b=Odstsi33O0OR6wgwydlUpW5E908UzWLolkzgLyCwdUi7V+zbv5FC4jXDw7yQdcckEl
         /QJvaIXqn+K5UxhpdVpdhAL+CmopbyuJwMTWxpfb0AYaiTijLnXP3wb3GNphaILVLTRi
         46fdTzGqVy88t4XWtM6IkJ8CeY3mTmONYn8oAGOnt7k/dpRiUnrUBtKOxl+m6PzfqyyY
         KtWXAUbxm30JLAV/IzyjfzQgxbwdWgfhSKCaK7WPsX9yAe/vG3HS1YoJLrmXdWDPtLGP
         lwsC7AeB/WWab22MfVfg3HjWGnipTKMzeDjl+FeEuj27aHPjpn6uNfVxARf/U+97wiKm
         lL5A==
X-Gm-Message-State: AOJu0YzmQQ5BAsfoteYxvkhYbgleWAI/8C/YPpjrgxK3+/+VKFWKpjVK
	UgPyOf3dmN8u8c9DugT49dm+0oHhGIl8fA==
X-Google-Smtp-Source: AGHT+IGGkITGqugrHo6c9lWxjv069VV2n6HMgoHi23eIRSVL/TtfI5z/CRm5kFpMVR3m/saeOUWXIQ==
X-Received: by 2002:a2e:7403:0:b0:2b6:cdfb:d06a with SMTP id p3-20020a2e7403000000b002b6cdfbd06amr1275906ljc.22.1693565520727;
        Fri, 01 Sep 2023 03:52:00 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:64d6:8737:b80d:a298])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c025000b003fee7b67f67sm4497495wmj.31.2023.09.01.03.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 03:52:00 -0700 (PDT)
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
Subject: [PATCH] riscv: Kconfig: Select DMA_DIRECT_REMAP only if MMU is enabled
Date: Fri,  1 Sep 2023 11:51:11 +0100
Message-Id: <20230901105111.311200-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_035211_478765_EDD27561 
X-CRM114-Status: UNSURE (   9.79  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

kernel/dma/mapping.c has its use of pgprot_dmacoherent() inside
an #ifdef CONFIG_MMU block. kernel/dma/pool.c has its use of
pgprot_dmacoherent() inside an #ifdef CONFIG_DMA_DIRECT_REMAP block.
So select DMA_DIRECT_REMAP only if MMU is enabled for RISCV_DMA_NONCOHERENT
config.

This avoids users to explicitly select MMU.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 468063780a93..a065abdc80e3 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -273,7 +273,7 @@ config RISCV_DMA_NONCOHERENT
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select DMA_BOUNCE_UNALIGNED_KMALLOC if SWIOTLB
-	select DMA_DIRECT_REMAP
+	select DMA_DIRECT_REMAP if MMU
 
 config RISCV_NONSTANDARD_CACHE_OPS
 	bool
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
