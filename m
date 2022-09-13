Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9792C6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 06:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qrA9ZD3fBzTGaPmOJCE7KItu3dbqv6yyiVLolhpNfNc=; b=EuWQ3Jx9FTu22m
	Vl4W6rnlzsOz9fke09LTMMXTHci1RZwZ0SYs29aHFyfQKPlmFJ8dZQW9pIogzzi8fQhTCp+se3HA1
	MCC57KsiSYg7XsntKITDj0wZqwSS0lucFTeKXDxyG1jk76kfulymZBBoFVQuP3M9ktQTlHNMCgDIY
	DN/JvlFQ4XbQiDSogDvMjszhQPYGpKbsIPDZ9mz6klGfwVRQVEdjU6NPlLxhkod98sLYFUZOORBr+
	7LuaBmsDIUZnjN5kXL7tM48ufOSDrAYXQ89v2n+JYB/c6t9eSfSZZrutUy1GYzUwzUtSLuAepQ4Po
	n9QM+cixGwUj+GaDDKlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXzFe-002sRC-Rr; Tue, 13 Sep 2022 06:18:30 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXzFb-002sNc-Q1
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 06:18:29 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d82so10769137pfd.10
        for <linux-riscv@lists.infradead.org>; Mon, 12 Sep 2022 23:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=y5P7by1jIpQzIvb2tD2gXNIWnK8iruU4UUaIlQg1bkU=;
        b=FURSNvAsrwuNMGImdijAMz8mE4g8/oBqhm2etPnz9/VXqv0Wwf67+KLa1RQz8Xk13f
         XiBgKDhzEU69AdabcMPz2RN3RilK93j0H1dS9dyPpWaQXYvGadDCcnqn1tsNr0VyzOqr
         EPQxGjZpaq3hOYm55EQ8n/LM7JO2D10khgdiMI88KNnABIowBIcPHZWrm/4YUlM8ivWu
         in3n05qIeaKrUeslPFcz9TDWIF85hPMvzC/tmIdmSXcBjHcwMxXPoooWmOXdtNveXf5R
         kLjeFBC324DCi0GbpIqmAGBPinp81KwIPJCEeYT+DFP+W+7EW75m4UdWiR+agje4LkfQ
         W5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=y5P7by1jIpQzIvb2tD2gXNIWnK8iruU4UUaIlQg1bkU=;
        b=8O7GIY1Cd56OIInYNXbu2BEOZnBE6TJWYkaCVxa9jKaKpCcpdMPhIx/yclsEqoR5CI
         5Sy2MY/3g5wnMkAobY2GKp5ElpysTAfhzD2kyN+oFGLvXE9oZfKLmrn2jiSTjnDtuI3g
         3+Ij6pkRJWdS9gUZJExYzYF305Goxr9NuZSgIXBPrLE/+JS3jCS4zxs/s97TeWHBME7u
         Y2Wqf8s+eof7bk0HbzpiDGCtynceIcps3safAlM8y7Ds77UnSmO33odx+ARcGCDuNcYU
         r9Hb73COuAtpLVq+cCeSw36UjxZ8wyFJrBtaimSmcRLswp1/dfLhUH4ZXhkczvQ8NEfJ
         HvpQ==
X-Gm-Message-State: ACgBeo1TavoMq1jAW01QlYDrB/p0ePMsvMupbchfjWGsMgfj5acxKrfR
	rAPd9OYVXpAscd+J7m+fMxzwFg==
X-Google-Smtp-Source: AA6agR5kuFJvWnGaHooiefmgt6Shu6OXVYfwtD+luhjkdQ8TycC57b+ASOg3PzAvilZOrJNJZdasbQ==
X-Received: by 2002:a05:6a00:21c8:b0:52e:3404:eba5 with SMTP id t8-20020a056a0021c800b0052e3404eba5mr31522452pfj.67.1663049904141;
        Mon, 12 Sep 2022 23:18:24 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id z11-20020a170902cccb00b00173cfaed233sm7296332ple.62.2022.09.12.23.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 23:18:23 -0700 (PDT)
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
Subject: [PATCH v5 0/7] Use composable cache instead of L2 cache
Date: Tue, 13 Sep 2022 06:18:10 +0000
Message-Id: <20220913061817.22564-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_231827_935919_9C72F10F 
X-CRM114-Status: GOOD (  14.95  )
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

Change log in v5:
 - Add a patch to modify aux vector for sysconf

Change log in v4:
 - Change the return value from from ENODEV to ENOENT
 - Apply pr_fmt refinement to all pr_err

Change log in v3:
 - Merged the EDAC patch into L2 rename patch
 - Define the macro for register shift and refine the relative code
 - Fix some indent issues

Change log in v2:
 - Separate the rename and diff to different patches
 - Rebase the dt-bindings based on Conor's modification
 - Include the patches of Ben for refinement of printing message

Ben Dooks (2):
  soc: sifive: ccache: reduce printing on init
  soc: sifive: ccache: use pr_fmt() to remove CCACHE: prefixes

Greentime Hu (2):
  soc: sifive: ccache: Rename SiFive L2 cache to Composable cache.
  riscv: Add cache information in AUX vector

Zong Li (3):
  dt-bindings: sifive-ccache: change Sifive L2 cache to Composable cache
  soc: sifive: ccache: determine the cache level from dts
  soc: sifive: ccache: define the macro for the register shifts

 ...five-l2-cache.yaml => sifive,ccache0.yaml} |  28 ++-
 arch/riscv/include/asm/elf.h                  |   4 +
 arch/riscv/include/uapi/asm/auxvec.h          |   4 +-
 drivers/edac/Kconfig                          |   2 +-
 drivers/edac/sifive_edac.c                    |  12 +-
 drivers/soc/sifive/Kconfig                    |   6 +-
 drivers/soc/sifive/Makefile                   |   2 +-
 .../{sifive_l2_cache.c => sifive_ccache.c}    | 200 ++++++++++--------
 .../{sifive_l2_cache.h => sifive_ccache.h}    |  16 +-
 9 files changed, 158 insertions(+), 116 deletions(-)
 rename Documentation/devicetree/bindings/riscv/{sifive-l2-cache.yaml => sifive,ccache0.yaml} (83%)
 rename drivers/soc/sifive/{sifive_l2_cache.c => sifive_ccache.c} (31%)
 rename include/soc/sifive/{sifive_l2_cache.h => sifive_ccache.h} (12%)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
