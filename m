Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C03C54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 14:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nUhWf3gKUGrrQaKXojRcNHNHuIny76k5DqUqUh2ZtzY=; b=gVG2zuCyCIGx/U
	ex/qMnWHuZMP+P5k5Utj7jSAQydZUnhkucJ7HvW5yqF3nCpdRZV0Wz6AjSqC+cxtS7B5b9XZyK0Oy
	gC333Tc0O+2S/a77IzJmD7IultcebWMKUg5hwi9PffjGzz6TUn/zi1IRRnPjgGHRqw4zASlXVSfD/
	6PHJtky+Ey+mqcSSm+KUhixLcTcx4QSkzl05tm1dXGEmFpSI+Rh04JXjIxXuuOlzYByxGJg2MCqZU
	/bEvcUCzyS84T5V1YigeyLwmlxZMJdZOUDctpwo2ePfiDBRYefAL8LhhlVfXeAIrx/5Bc7RDE+TAC
	Hq3D6zy992wAkpHqStpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIlg-004q9T-UN; Thu, 08 Sep 2022 14:44:36 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIld-004q2T-Un
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 14:44:35 +0000
Received: by mail-pj1-x102d.google.com with SMTP id a5-20020a17090aa50500b002008eeb040eso3388377pjq.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 07:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=f1u38+lpP3uUpdpRuDgUoYZwjE7yjDfDzNqW/1OTveQ=;
        b=ZNproLrsTmwfqHcFUDE41Pn3ppB+VvLZUt0OoQ/lZ8e72Q4YKxyaVCpMJUEyJDSnCa
         eSvRWzccMzwJdj0YsjFjIxTL0dooM5nXCJQP1PHx6bQAleNplo75lHpEsF01QFXIRXG5
         hWhwYer3PbDbVMh2Q+ageHD13Lg3lZ9UNYzjE6R3Kpgb6kr2VESZ2zW03pvIHxwhUhLQ
         VM/VmGpj/f69qM5euFPl+/zTJxdrJzD15osyWfZUKyDS3KpIYPFOb2AJBH0xSX0/InSq
         sbmzdRs2AAJLvnjkxQfmgN7ca08+AGeBoJY+Ywl58w7EF52lSkWP1Ztdmuv5l+ZSF/97
         tFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=f1u38+lpP3uUpdpRuDgUoYZwjE7yjDfDzNqW/1OTveQ=;
        b=n8QtQoksRQAAWR04dZyGoIHeFLoiIyxWHI1a4T2qH0ZcW3Xybs67rI8Lj9azzCfeOP
         94JEB34uwRwN4jbSYEJyEhnMPKOVz4FOjAzSMEEIum1N/ypW/5nf5xvFoLGQuKkEEmt2
         Dw7q1tE+S/6VtCnfN2U2OsMEsa0qd1qWzSeo0tapv7rG3f8sngTWQ1AGMCQsnasZXlfv
         RYRv761awDCSkC9Xxwurq49aVCI75Id9R0cWsvQ4T0PYVVkvrbP7QjbUKEFdyG4zk4i+
         y49UP0c+j0/dHEApwFwgJza4QEwGxdfL8vRq4lW8j2C/N1tuGpSu8UpBA+/+dOk4c4eK
         JpLQ==
X-Gm-Message-State: ACgBeo17F0NibRnmp5NaRB09o0jcAlMfNLOlmtTAzl8pNpZfVy2IoeFG
	CBHoGrl8LsuQxr/660CFRdtSmQ==
X-Google-Smtp-Source: AA6agR44jEvcjSHnfI5NxCT6ZhnkMwVUCWHJdZqCZKYRVa7ZlaxswBnb0759Edh4RKcLiWU9DD+ttw==
X-Received: by 2002:a17:90a:e586:b0:1fa:d28b:ab9b with SMTP id g6-20020a17090ae58600b001fad28bab9bmr4692671pjz.47.1662648270190;
        Thu, 08 Sep 2022 07:44:30 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b4-20020a170902d40400b001750361f430sm4484728ple.155.2022.09.08.07.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 07:44:29 -0700 (PDT)
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
Subject: [PATCH v3 0/6] Use composable cache instead of L2 cache
Date: Thu,  8 Sep 2022 14:44:18 +0000
Message-Id: <20220908144424.4232-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_074434_074974_371A11F3 
X-CRM114-Status: GOOD (  10.42  )
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

Zong Li (4):
  dt-bindings: sifive-ccache: change Sifive L2 cache to Composable cache
  soc: sifive: ccache: rename SiFive L2 cache to Composable cache.
  soc: sifive: ccache: determine the cache level from dts
  soc: sifive: ccache: define the macro for the register shifts

 ...five-l2-cache.yaml => sifive,ccache0.yaml} |  28 ++-
 drivers/edac/Kconfig                          |   2 +-
 drivers/edac/sifive_edac.c                    |  12 +-
 drivers/soc/sifive/Kconfig                    |   6 +-
 drivers/soc/sifive/Makefile                   |   2 +-
 .../{sifive_l2_cache.c => sifive_ccache.c}    | 200 ++++++++++--------
 .../{sifive_l2_cache.h => sifive_ccache.h}    |  16 +-
 7 files changed, 151 insertions(+), 115 deletions(-)
 rename Documentation/devicetree/bindings/riscv/{sifive-l2-cache.yaml => sifive,ccache0.yaml} (83%)
 rename drivers/soc/sifive/{sifive_l2_cache.c => sifive_ccache.c} (31%)
 rename include/soc/sifive/{sifive_l2_cache.h => sifive_ccache.h} (12%)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
