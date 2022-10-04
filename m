Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41382C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 20:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OJclCTiWqpBXNf9rIhTlSf++7p48GFBSCDMphcBgMvw=; b=yikkyh8Dod7yI3
	dZp9GTZLD4sXwKwtKvlNfUi2ojjlB5vjb2rgowb/LckbKMZyPt3aYWJJBRpTICu/WYsC8qP3a53XK
	4q57X8s2PG+wXvsIfEA0BzeZ6pqBxFHq9mrVprEaTI3bCZ8hppuypijPzfAjewkhnnLzErpcEdTrZ
	IUySWYP6HM/5NLfief3vbx3Tpqpwvx4kW/3b3q8uuXiQT0LuUs9ObP8covRYlnCKg5D4Jy/CB2goT
	FC8h0e19qzEv/9h/kwc8zMMo25Xf79x+X3/LpCJp1hooZUsYhbWA0ti3T8NwxU5bGw/Q8MPHYI3+Z
	HA5e096uVXzi50lAdu6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofoff-00B0RJ-Aw; Tue, 04 Oct 2022 20:37:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofofb-00B0Q6-Em
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 20:37:40 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ofofS-0004n6-Co; Tue, 04 Oct 2022 22:37:30 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: atishp@atishpatra.org,
	anup@brainfault.org,
	will@kernel.org,
	mark.rutland@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor.Dooley@microchip.com,
	cmuellner@linux.com,
	samuel@sholland.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v4 0/2] riscv_pmu_sbi: add support for PMU variant on T-Head C9xx cores
Date: Tue,  4 Oct 2022 22:37:22 +0200
Message-Id: <20221004203724.1459763-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_133739_515519_929B785C 
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

The PMU on T-Head C9xx cores is quite similar to the SSCOFPMF extension
but not completely identical, so this series


changes in v4:
- add new patch to cache sbi mvendor, march and mimp-ids (Atish)
- errata dependencies in one line (Conor)
- make driver detection conditional on CONFIG_ERRATA_THEAD_PMU too (Atish)

changes in v3:
- improve commit message (Atish, Conor)
- IS_ENABLED and BIT() in errata probe (Conor)

The change depends on my cpufeature/t-head errata probe cleanup series [1].


changes in v2:
- use alternatives for the CSR access
- make the irq num selection a bit nicer

There is of course a matching opensbi-part whose most recent implementation
can be found on [0].


[0] https://patchwork.ozlabs.org/project/opensbi/cover/20221004164227.1381825-1-heiko@sntech.de
[1] https://lore.kernel.org/all/20220905111027.2463297-1-heiko@sntech.de/

Heiko Stuebner (2):
  RISC-V: Cache SBI vendor values
  drivers/perf: riscv_pmu_sbi: add support for PMU variant on T-Head
    C9xx cores

 arch/riscv/Kconfig.erratas           | 13 +++++++++++
 arch/riscv/errata/thead/errata.c     | 18 +++++++++++++++
 arch/riscv/include/asm/errata_list.h | 16 +++++++++++++-
 arch/riscv/kernel/sbi.c              | 21 +++++++++++++++---
 drivers/perf/riscv_pmu_sbi.c         | 33 +++++++++++++++++++---------
 5 files changed, 87 insertions(+), 14 deletions(-)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
