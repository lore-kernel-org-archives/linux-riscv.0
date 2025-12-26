Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D837FE8FDA7
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 17:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=paHtsS0NAkLySuTs6ne3nW9cmWyzORyumCzriOL88fE=; b=0QoiJVr2tNFhCb
	obGw8V6lcBhYBCib3+B9mgA8aMUDCzqhqIv48UZLGG0AZ9f1+HyUhVmCvUSlHM0r3koPVaEOJf7aX
	rkhGKU2G5EMC9BETdYHsxlWKSjZL/EvIKvF7dSuc9VduSyv5Ww2IoA6LxS6pFDm36R2vnLBQJzusa
	YRgWTIX6bSISBaWoQ493nwAzIOnRtzOwBXRgxqhr+pUf++KmBxT1hbga4ypwZBLtfquw21U+RoRrj
	WwzxLtXX/ZWo/6MAuxirhhg6bJHNlHu5shRnnZUELqW/tZH0/L7JU+qJJ0XAnmGcBeYcUeCPGaUIb
	LFQZnV9yozZmlBitU9uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZBg5-00000001Klj-1Sit;
	Fri, 26 Dec 2025 17:32:37 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZBg2-00000001Kl1-0xdK
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 17:32:35 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-8887f43b224so108360466d6.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Dec 2025 09:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766770352; x=1767375152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ciwqItzOvTH80EkqRK45xqhfDMd2iUMF4JpBnkt+bcA=;
        b=OsmXbiyWhDSUlUabe125/5JaJhyB9dQ0/p0OYTT1mH9KJPhdgk8GcKRatzDbPkmYPA
         zy5Pv3ZHlWpdSIC+qZaGAO/FOaTmXCu5gXx2Rg5ol0HX/9LQxs/Zb3X7ma/S6sLWWnvG
         zA5uqXGYAcvlMs0aY43sejvJbdGknu5acUHw8xWcsoKSHTQUwXEwi6y35YxDdtx5QQxG
         31Ow9ujxpmmx50XGN0IgJqxQAYAQRmj1GvjhP9iE8lg5aaRUcV/QZLdU1yJxNqeyvEpq
         d4XwIuJ+sDMAZ5ja06xZLe8p4qchWnolOb2AhXaSJ1fAbUYKvXBSI5nHmMb5/yRbOYBP
         l9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766770352; x=1767375152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciwqItzOvTH80EkqRK45xqhfDMd2iUMF4JpBnkt+bcA=;
        b=ffXjBol/mAvd4YcI72wvYSAKMzXLGj6Jklxi5yVjBSePFAc1Lqs/otGNNhBKuAKbNE
         xqXUd2QyMxtgsZ7Bac3/siUomZy8wg4H9RKSmk5syTAURRjEKoxwhEVxAdhXFRVleYCl
         XTxNTVBkkerJ9DX4xIbYTSrjKAK9glcPsF0yQwrV/ebKyKq2SL6kqEob48YXbolA46Ef
         FUQ+HX8foELC9w+a3Bz52JKv8hcduRMI/BHUSLs8VbFX3PhGijNDbomEa0J6kiy5pPu9
         TcgCEGsoCOWCfNIqP/h5niQzAYoRUjhPPW4e48z5Pw/64l9FtRecZlEEdKcG1oyvXUvE
         JfqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWh8tb+LMfp8b+6uFL6LrJrIH8OpAYBFxQb5KwFBnlJzYj97ZuO6QZ858dBPKIUI/uKvQxsjIE8e71Xw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUCHJTRvP9HQPdy3pPxK28iOfjDsMv9ARex4luSu94U7FhXtAI
	yAZV0MGw8MW9EPnt60TwbezTvYmCu8Ew3sRYqgWve6r9F+qFgCxhpXZJx1xQ0+ku+B4=
X-Gm-Gg: AY/fxX4U8d7oAYw4wI7891cx3XSxIbciGBqdsTp6WpuztaHTPxLXU4Dgg72f9nvoMY7
	PLR5TnICKQT5egPveS7oXDrNVk3flf25e8ybuaayXsn3jwfPtW6rjuE90z0S7GocUVow6WfUi56
	Toy1zap6M3k2kJ/tCurMf1eXwQGQCSSV2ogzx03DX3m3RTwVLCECeAWPXVL90Ltel4Eg7jb/66F
	k00Pm7z/diYw10LhEQ8FGsvEpLFRz9k7VwDU3clRKIoLC4qs5JYg03SlDaipEyF2BQycBt5yrpc
	ogLQ6lxdwiYs8Yi0yDHKENr478fvbfSRZQGGmPGfGxi09cNoK70K65gmX4LFAeQ0oL/TRGFWc5I
	uqM+kW78Mw2vH8ndcWZv2KXq3KA2gXwRM/jrFJiNbnnuCam12jyOH4sIjgV+yTQ5enn4OmBWM73
	Hjg1WDnjtYir4nwsiM0QVcPs4udb9iQ7t9ScLzVb1tGHXra47vu+RlOA==
X-Google-Smtp-Source: AGHT+IGBstnrzq5tGM78o3fmlA/RjQNKRMjqUXsz1wbOluahiwHWTwU9dUEJYN2xiG5mCT00aGrX4A==
X-Received: by 2002:a05:620a:17a8:b0:88f:ee0a:3d66 with SMTP id af79cd13be357-8c08fbbc94emr3534421585a.80.1766770352281;
        Fri, 26 Dec 2025 09:32:32 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0975ee7d5sm1751075385a.49.2025.12.26.09.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 09:32:31 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org
Cc: dlan@gentoo.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	guodong@riscstar.com,
	linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] phy: Kconfig: spacemit: add COMMON_CLK dependency
Date: Fri, 26 Dec 2025 11:32:27 -0600
Message-ID: <20251226173228.2020411-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_093234_510526_7DC6B5AD 
X-CRM114-Status: UNSURE (   7.41  )
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

The SpacemiT PCIe PHY driver depends on the common clock framework.
Not specifying that led to a failure when doing a COMPILE_TEST build
for the SPARC architecture.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512251903.sTVZgg6c-lkp@intel.com/
Signed-off-by: Alex Elder <elder@riscstar.com>
---
Note:  This is based on phy/next, which I find doesn't currently build
       cleanly using "arch/riscv/configs/defconfig".

 drivers/phy/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index aa2d30e0e3261..3bc7378ea8658 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -104,6 +104,7 @@ config PHY_NXP_PTN3222
 config PHY_SPACEMIT_K1_PCIE
 	tristate "PCIe and combo PHY driver for the SpacemiT K1 SoC"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on COMMON_CLK
 	depends on HAS_IOMEM
 	depends on OF
 	select GENERIC_PHY

base-commit: 27287e3b52b5954b73203d32ee76ffd5f53f5074
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
