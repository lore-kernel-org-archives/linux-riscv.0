Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC7BECAAD3
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 10:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HAuOYUIGUjJiQ5A06/ZbmZ2EnEi3zPWB3iZPua4SYBw=; b=vySPSX5O2T0haH
	jlNH4HSDpjOf85xxPcN3H9Ys9/YzdyhfvYWzEyD09erX0LwC/Gkw4pbDJXjsXocgd/oLyvUSCpWBz
	/F+5+BvmmRWpoSHcRoSUuaBdUr7zirpJN/5BLvEc4zuJ3AkmRCZODocPNSFPoHQix8vLgdzKdjHXS
	JaW029FD+i/SHzyHDJvgqONTtgsqaD1Tyeq0BXQdP2dHN/b7Y6KR8EUaK6OhcydeIOAml1Y89PVYZ
	bx6wY73iIaCnZDxpY+T3dGPGPlgJEtmYkNMOBwiDgnzimHrwFyBzk4fr/jKeWqRW3x0D9TLGC8Gje
	NzXYGN8ZkEyMuiIk/OGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV91t-00HOEA-DK; Mon, 05 Sep 2022 10:08:33 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV7W1-00Eh7P-My
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 08:31:39 +0000
Received: by mail-pl1-x62b.google.com with SMTP id x1so3506199plv.5
        for <linux-riscv@lists.infradead.org>; Mon, 05 Sep 2022 01:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=s3hOdjxXsap0YRXvjxYWIlEI0piYVKoTC0n9P5HnS8U=;
        b=VJJzPQJ1cWBEZK1HBWOn5P3vqsLLo9JWaWwO7q2CaasS7NEA3XlpZk4YrMbS0ioQmx
         2DUmKBWzVSo+TcyoNxbeoUPYTGV5zRpvAK88DxEdKCpeltfsC1tR14akp28UetRl3iu0
         XeNtjMnphRjAPxDSYQYmMfiyTFe/k/YOPhufSCMz5yM9rBUupijYpLpOoiKHXN+Ke+1T
         DFdXIBPXkmhEazPMWS9qvAiEJvTkBl2PBA98xz2lgeMQlFXLwzhpHfWCLZfcpqiafDpd
         aY8s5bh12f0Z3IJJbQzwPfk92ut5OVuOlIm/FXXh17AZX7mPSC66s4M6bmkTNx5Nhv7J
         b1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=s3hOdjxXsap0YRXvjxYWIlEI0piYVKoTC0n9P5HnS8U=;
        b=LAleTzDkyOdIo2m1gm5nlGV9DL3r276I8IO/KMTYijZSU1AwzoUDa1s4rmcUGegLWK
         MjtLcVqTIktNysOQq3TDr3rn5LqbdLvBT1Jc2oCBtnnzzmfgE9LQq+RySjuodDzNsB2M
         bQbJOBW2jj/O+bmhEg3XYe0lGRGu2VG56kdj7lvvmEKEdL5qEUZZIKG5xhBM7WRdKURA
         wh/ZQTRjlud1/qIQCegmTyJuKc2aplHvJZfajNUAwVmfT6Zw7So8cHJn8McwpdXZ401Z
         hJWa3nH2f3iA43S8k4MHTEUHWWR9KTsK8nUJP8oqxkw10rKAOz4I12Pw99MSGTCMR7rD
         N+kA==
X-Gm-Message-State: ACgBeo2LAySFR+OsRalisFarIqSDJjIfC0Luyq/drXwIPYJKuR02tlH+
	OnCN0RFEsRTy1CLydWOxql0Xsw==
X-Google-Smtp-Source: AA6agR4nKAVKAuZX1ZISjF81oe65A4kGyO+0VV8EZk2A7ZosaG47IwTfakAHqqYoOBU8VO/tJRK1pg==
X-Received: by 2002:a17:90b:1b52:b0:1ff:f536:1f3c with SMTP id nv18-20020a17090b1b5200b001fff5361f3cmr17807344pjb.232.1662366691713;
        Mon, 05 Sep 2022 01:31:31 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b00537dfd6e67esm7089721pfo.48.2022.09.05.01.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 01:31:30 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	ben.dooks@sifive.com,
	bp@alien8.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v2 0/6] Use composable cache instead of L2 cache
Date: Mon,  5 Sep 2022 08:31:19 +0000
Message-Id: <20220905083125.29426-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
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

Since composable cache may be L3 cache if private L2 cache exists, we
should use its original name "composable cache" to prevent confusion.

This patchset contains the modification which is related to ccache, such
as DT binding and EDAC driver.

The DT binding is based on top of Conor's patch, it has got ready for
merging, and it looks that it would be taken into the next few 6.0-rc
version. If there is any change, the next version of this series will be
posted as well.
https://lore.kernel.org/linux-riscv/20220825180417.1259360-2-mail@conchuod.ie/

Ben Dooks (2):
  soc: sifive: ccache: reduce printing on init
  soc: sifive: ccache: use pr_fmt() to remove CCACHE: prefixes

Greentime Hu (1):
  soc: sifive: ccache: Rename SiFive L2 cache to Composable cache.

Zong Li (3):
  dt-bindings: sifive-ccache: change Sifive L2 cache to Composable cache
  soc: sifive: ccache: determine the cache level from dts
  EDAC/sifive: use sifive_ccache instead of sifive_l2

 ...five-l2-cache.yaml => sifive,ccache0.yaml} |  28 ++-
 drivers/edac/Kconfig                          |   2 +-
 drivers/edac/sifive_edac.c                    |  12 +-
 drivers/soc/sifive/Kconfig                    |   6 +-
 drivers/soc/sifive/Makefile                   |   2 +-
 .../{sifive_l2_cache.c => sifive_ccache.c}    | 183 +++++++++---------
 .../{sifive_l2_cache.h => sifive_ccache.h}    |  16 +-
 7 files changed, 136 insertions(+), 113 deletions(-)
 rename Documentation/devicetree/bindings/riscv/{sifive-l2-cache.yaml => sifive,ccache0.yaml} (83%)
 rename drivers/soc/sifive/{sifive_l2_cache.c => sifive_ccache.c} (34%)
 rename include/soc/sifive/{sifive_l2_cache.h => sifive_ccache.h} (12%)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
