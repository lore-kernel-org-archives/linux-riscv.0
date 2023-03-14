Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BA0C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 21:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i/2RzHK3J3hdkjvDQeTDhhgzRTSFsILYWWwfpqVAeko=; b=JIeu8+ZI+E3vbQ
	Orxv3w0BgFxm9Ty1QTOIJVFa3RzpvxkSjpPdKRhLdRc6FrohuoL6Xz6SwkCO0nlyzOdh1pCa9Rphw
	dd8ykSKiw9c83O5Fi8+Pw3nRhLck4koEDWiExo9+dsDgs8tY1dWuKGfIc6QfCNBi/cE4d1H3pVdqI
	Hm8FnitJhCqfog7MLRG8kumvlWk7z2JKQAM4T7wBfM8k8lVc4gsj6haPwPZNKSsKfWJRTPQRPzbZH
	4hhya9BxruMzNq/HvFAeHeGIu/JccbJco2jvbBFNFnib3S5XCLuuzqZpHFc+7zREMOMIlgAFSe0SP
	7ggesjedZWHeUbQhuUyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcBus-00BYQS-2b;
	Tue, 14 Mar 2023 21:10:42 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcBuk-00BYPV-1W
	for linux-riscv@lists.infradead.org;
	Tue, 14 Mar 2023 21:10:41 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id t13so6587137qvn.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 14:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678828232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gFGKOv/gsoVIy8/SJ0JWX6aXeqfw2gjMFT5w7VG7REY=;
        b=pcxc6CU22/fuEYmub2qnTMBjE38I2bfwMO+vN/5//rLZgB+7tjqg1jorWV8aTjG+ul
         m27De5cQlqk7sCdxMT24ih9wxa6ZHvQWslS5ld9PT+1aOQZm09NawtWp/lZKLMehX5w+
         j4mmK8h4+Tz2TVP66HAiuugBfNlKJuQskh5qS2kVDvv5uMixmSpmptLiw7wyMJmzN0eg
         mV+B0D+krz4SneOEjQQoiadSQdSLzkU5JUaYhkW7Y435hbUjrC/PgnUaVhTNwAdHWk44
         zQ8DHVbqwy2z9PTpcWibYzIMmGFWi8Wo8FYgiTLhvlXmkjBU3aKtmloxYZLVnWU3ccS4
         ZKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678828232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFGKOv/gsoVIy8/SJ0JWX6aXeqfw2gjMFT5w7VG7REY=;
        b=Hn2LNltj5CfxskfDmvaLx4hJpAT4J3qgJYJzXQ2QQsIIc/FdScjJv1K0gg65DcN70W
         L3NYgycApTubwAGLBQyVwvyn72FcU9uTXpjduOkqXUHK/U+qD+1EWWar+6dXLdf6tZAi
         h5FqXsLsjDJV3hRYAajzrk1lFSm1Zp7PNiXHRJ13bYenrM/3DZ1Af+sW1qW5/8K1VldZ
         Em2fPnnZCKzJWoADqIzC/8ISl/VNCNEbx+yLfudICmuGunJ4s8+TNbE3oZhpMwkhmg3s
         vkIkGvV+3MWmm6bxSo7DMLBQpQKVKdZjdnSr5+8yCQKI9b2o+QdWVPG0TVv3coG2T1G0
         ugkA==
X-Gm-Message-State: AO0yUKWxaQBQeoYrbgCD/MPKz1VQT8j8P10omQZOO7xAC/7BAMasPCzn
	HmRD8voLHa+CgJvlrH3Zzzq1Fxd67hg=
X-Google-Smtp-Source: AK7set8s5PLApjeu1ZkOkOWsjBPp5MpES5WSbkTRdnCH2mkXb8zMiahzcjThB3wmKpu24GYSRxUV+w==
X-Received: by 2002:a05:622a:1ba6:b0:3b8:3a7c:d204 with SMTP id bp38-20020a05622a1ba600b003b83a7cd204mr61380513qtb.58.1678828232116;
        Tue, 14 Mar 2023 14:10:32 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
        by smtp.gmail.com with ESMTPSA id ef14-20020a05620a808e00b0073b967b9b35sm2429498qkb.106.2023.03.14.14.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 14:10:31 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jesse Taube <Mr.Bossman075@gmail.com>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v1] RISCV: CANAAN: Make K210_SYSCTL depend on CLK_K210
Date: Tue, 14 Mar 2023 17:10:30 -0400
Message-Id: <20230314211030.3953195-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_141036_928042_646A5924 
X-CRM114-Status: UNSURE (   9.59  )
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

CLK_K210 is no longer a dependency of SOC_CANAAN,
but K210_SYSCTL depends on CLK_K210. This patch makes K210_SYSCTL
depend on CLK_K210. Also fix whitespace errors.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/all/42446784-a88b-df09-41e9-5f685b4df6ee@infradead.org
Fixes: 3af577f9826f ("RISC-V: stop directly selecting drivers for SOC_CANAAN")
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 drivers/soc/canaan/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/canaan/Kconfig b/drivers/soc/canaan/Kconfig
index 2527cf5757ec..caf3705d8917 100644
--- a/drivers/soc/canaan/Kconfig
+++ b/drivers/soc/canaan/Kconfig
@@ -2,9 +2,9 @@
 
 config SOC_K210_SYSCTL
 	bool "Canaan Kendryte K210 SoC system controller"
-	depends on RISCV && SOC_CANAAN && OF
+	depends on RISCV && SOC_CANAAN && OF && COMMON_CLK_K210
 	default SOC_CANAAN
-        select PM
-        select MFD_SYSCON
+	select PM
+	select MFD_SYSCON
 	help
 	  Canaan Kendryte K210 SoC system controller driver.
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
