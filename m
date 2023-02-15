Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F39C6379F
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 08:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XSz5nTFXECOI6DkBQxCl+t54UYkqzvXePMpWUX3+XpA=; b=PpWrce6qDG/zXb
	HCczzJS2tCigHy8BZeNGZxgffoRM5SDtOIfPGeAP3ZdCe1i9PRymnNB1zAU5tK1NqkTeEYm1EnaYn
	diMzZv842vfP0Uyd7ZnDetZgEFOaJa5JxihWLD25kmhGs5/ShvYSoeYdah4AH7EfB4CrCknrOashx
	7eXEOfNT4JzZhVXlV85mJLQy5EECOeuE/eW0I1zfh6NJ4PdCyvdqzSWKHXB/EYECNFEFZ2OhmDvqf
	ux6yuaCm5mdoM6xI6MlS6rNTQqe1JNZuLaGHn/ySxxtxF7Zw3dYlYq0xcjrcr1Wjz9YBrE7ez9DKP
	KPlWvAsakrLSynrbwQ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSCk1-0057fQ-0L; Wed, 15 Feb 2023 08:02:13 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSCjy-0057dw-Np
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 08:02:11 +0000
Received: by mail-ej1-x62d.google.com with SMTP id rp23so46063262ejb.7
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 00:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYpuouRtqGGYmfeCWWTT/2rWXrPC61M4tuQYBc16990=;
        b=Ewy3+ElsaB8wC+43QB/lfm6tQzdZpiyQ90g2dcojPYfreVDuUoUiZIX1QRFQ4ur+8d
         YpynnM+VOqTiBoS2gcwOCQgRMBHEHRa7DDwYgt+9gFT3Ax5RR/fK88ZjaB4ShaijJJQd
         pKAF0DuwZeJWtxQRb/as5Rpco5nFCUbGTlK3ZrPdCaN2FJeQWaiILYYaksPdcwGRaUjt
         pZ3+WeMMQFf3l0iYpMZhFIRp/UzxlavSH8s97HpohyoB1Wiiq27aNfG58bV2FJ3bQe3r
         eCjGzailwH8oX3hMJek/7Y3xI0sT2pD05SE07tn61F7FzTTQUB3rW0/C9gZNuqVWZSbV
         ulrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYpuouRtqGGYmfeCWWTT/2rWXrPC61M4tuQYBc16990=;
        b=AGG/evCeeog4l7eWHArS8T9yWWbSGLb3jNz5FD3qIhidk7LtNkHJlZVByeWhPVeWVl
         RI0TsTlby7jHsEUhJ6rOh5SaAcQfegTNcIG81xxRpn35e9Wt3yE9jSVLAG8TZswEkJ43
         mII9J9tNtl4N9YU1PvKEzi/qwLGb3G/4EdDQnjOW6O7kbtFuqLDkhq/KZdpTes/35bC8
         2v6L5q56ZsfrPRoL0QMFTCqjfrsqCA4nlXFLT1VarqJ3CQb3vke+856eC5Hoo6WWTO68
         XYsAo6AY36Z2p2X5Fx8lgmSiF7pWqj9H560OssBrj2hqHsAnu325ORyW/eOiFR2Ot7Cn
         Riww==
X-Gm-Message-State: AO0yUKVXrvovr9wy7pE9CwhIhSm+qD26IZh8fsWCS8HTlvaKQHOOsk48
	8Dtcfn0odUIVq6zaVZ28DL4=
X-Google-Smtp-Source: AK7set8L1CiiJwryrzPT+bqNoU9kWn4IRGRjCWQD3hofSiPU02XlmrnSQ8929Pfwkl3yRRdX0hnQzg==
X-Received: by 2002:a17:907:584:b0:870:d9a:9ebb with SMTP id vw4-20020a170907058400b008700d9a9ebbmr1578180ejb.38.1676448126256;
        Wed, 15 Feb 2023 00:02:06 -0800 (PST)
Received: from felia.fritz.box ([2a02:810d:2a40:1104:983e:41b3:46f3:e161])
        by smtp.gmail.com with ESMTPSA id p2-20020a1709066a8200b0087bdae9a1ebsm9394619ejr.94.2023.02.15.00.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 00:02:05 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: William Qiu <william.qiu@starfivetech.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: repair file entry for STARFIVE JH7110 MMC/SD/SDIO DRIVER
Date: Wed, 15 Feb 2023 09:02:03 +0100
Message-Id: <20230215080203.27445-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_000210_796450_400956F7 
X-CRM114-Status: GOOD (  11.77  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Commit bfde6b3869f5 ("mmc: starfive: Add sdio/emmc driver support") adds a
section in MAINTAINERS refering to the file drivers/mmc/dw_mmc-starfive.c,
but the file is actually located at drivers/mmc/host/dw_mmc-starfive.c.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Repair this file entry in STARFIVE JH7110 MMC/SD/SDIO DRIVER.

Fixes: bfde6b3869f5 ("mmc: starfive: Add sdio/emmc driver support")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 945b86f93cf7..74a30e724f7c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19935,7 +19935,7 @@ STARFIVE JH7110 MMC/SD/SDIO DRIVER
 M:	William Qiu <william.qiu@starfivetech.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/mmc/starfive*
-F:	drivers/mmc/dw_mmc-starfive.c
+F:	drivers/mmc/host/dw_mmc-starfive.c
 
 STARFIVE JH71XX PMU CONTROLLER DRIVER
 M:	Walker Chen <walker.chen@starfivetech.com>
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
