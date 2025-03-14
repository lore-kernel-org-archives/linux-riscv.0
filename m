Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50279C282EC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 15:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XNVHHpd7Opr2QyV+/nkSPk/H+9o1lkCJs+GHDmu08rc=; b=3yKa4TrmkElbYW
	ziON+S+iWv+wcXAyG7kwoT5ETN1TI7H7DxyDJu09NX/4U+vpINQ235jLj9XmjRhxZUxZyLuZ6indj
	oCRqnno+EMV0Bvb1/6XsUz9U6tHcQwMVesC6yZTA4yOQe5A2WoMWmvMRz7M0SDQxQ1PFbiIn0G/TB
	mrljAU9y/sTgUzJbGT5bDKUzslr8CdBnya1JlcaR6sz0ltN2JksUL1StM03zjwzvYHmAw8Q/mpej9
	OssQvMgoA6s7C/pviKzLSfoO6+YD2UvK6xSB/OIT+IeB8OXDEwmCAmLXDuI9CvkrIjaiqA01LLDHh
	g2Q3oogtVfXGBeQTi2rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7H9-0000000EcU8-0kZn;
	Fri, 14 Mar 2025 15:48:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7H6-0000000EcTa-2ddz
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 15:48:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0E7AEA4768B;
	Fri, 14 Mar 2025 15:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6FA4C4CEE9;
	Fri, 14 Mar 2025 15:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741967319;
	bh=cjpKAPzkSfWP+V9JdaT/PCmkXC4+EeuFVF3S8kTC2Qs=;
	h=From:To:Cc:Subject:Date:From;
	b=GtGXbqpY5BeWics6m+RWZJbYCR1wFIrt7oHarMgmwvg713Q9cRdMVUZU0NF5pWnkI
	 Kd+U0SvkPHsv/sFHf2bMDjvPD68+kUwTjrvCoc12eUr0JqDvpm4OK0YVd37LmrIWUk
	 bsqak4qqKSMvf60xugBP+xeCBBCNG6KWlQ+ocBI21MbHxraq2NdZ+G9ue/Wrb76sZO
	 JJwHYkTbBeZq4Je19TNzRT2b7QoNaW1HkCbY+e0wk73hahOz6noL65/Im+TDs+zoVZ
	 P9ar+P90I4ze3irZtsX4LLKgkXQkC6exx4/bRwnvCh4Vq4OK/iEeGpmi3I6f/G7FDc
	 P8ZIGAi221GLA==
From: Arnd Bergmann <arnd@kernel.org>
To: Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pmdomain: thead: fix TH1520_AON_PROTOCOL dependency
Date: Fri, 14 Mar 2025 16:48:31 +0100
Message-Id: <20250314154834.4053416-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_084840_735846_9530D0FE 
X-CRM114-Status: GOOD (  11.83  )
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

From: Arnd Bergmann <arnd@arndb.de>

Kconfig treats the dependency as optional, but the header file only provides
normal declarations and no empty API stubs:

ld: fs/btrfs/extent_io.o: in function `writepage_delalloc':
extent_io.c:(.text+0x2b42): undefined reference to `__udivdi3'
ld: drivers/pmdomain/thead/th1520-pm-domains.o: in function `th1520_pd_power_off':
th1520-pm-domains.c:(.text+0x57): undefined reference to `th1520_aon_power_update'
ld: drivers/pmdomain/thead/th1520-pm-domains.o: in function `th1520_pd_power_on':
th1520-pm-domains.c:(.text+0x8a): undefined reference to `th1520_aon_power_update'
ld: drivers/pmdomain/thead/th1520-pm-domains.o: in function `th1520_pd_probe':
th1520-pm-domains.c:(.text+0xb8): undefined reference to `th1520_aon_init'
ld: th1520-pm-domains.c:(.text+0x1c6): undefined reference to `th1520_aon_power_update'

Since the firmware code can easily be enabled for compile testing, there
is no need to add stubs either, so just make it a hard dependency.

Fixes: dc9a897dbb03 ("pmdomain: thead: Add power-domain driver for TH1520")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pmdomain/thead/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/thead/Kconfig b/drivers/pmdomain/thead/Kconfig
index c7a1ac0c61dc..7d52f8374b07 100644
--- a/drivers/pmdomain/thead/Kconfig
+++ b/drivers/pmdomain/thead/Kconfig
@@ -2,7 +2,7 @@
 
 config TH1520_PM_DOMAINS
 	tristate "Support TH1520 Power Domains"
-	depends on TH1520_AON_PROTOCOL || !TH1520_AON_PROTOCOL
+	depends on TH1520_AON_PROTOCOL
 	select REGMAP_MMIO
 	help
 	  This driver enables power domain management for the T-HEAD
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
