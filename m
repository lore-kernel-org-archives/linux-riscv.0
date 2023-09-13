Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C09EDEC52
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E8n9bq0Uqd8/EZw1kQrhOkso+YB2NhnWuqN6X21ncRg=; b=nfEvECXpjthTb3
	nGI/mhhqap49qv8FSq7v+AYqmGDbi9mKtZag+qjo1+L657OPtC87Nk/wxSLYU7+b8KABxXuQH6RvE
	Q6f94PlXMFzyBBdFYOB/w4VvauVdvxiSbF8Urnf6jnhkVoJqFWtEib/Xkg+JP8xF6L0bAvff4qgve
	VM2Xf6unzhgrAQqVoQmCGfr3Lse6kYCKVoTBvIYmJIC0G3W+1xht8ZviA5oeYDxnGjKedU4XehHAQ
	U8glmVuWdR9hbo6z4rH2NuLuu9Ltm+lzMnqlSpyyEjAQ0cC9jO6T23iBz+WkXC5Dy5D6AXY3J0jWe
	cxvzZFK0OUcQ+Ci83HVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQLp-0064Gs-27;
	Wed, 13 Sep 2023 13:56:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQLm-0064F9-1Y
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 13:56:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1781861950;
	Wed, 13 Sep 2023 13:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA1DC433C7;
	Wed, 13 Sep 2023 13:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694613367;
	bh=cPW3ngQcLFNVapX0q9aS5nmb5CE6JzKHtu3Dbmcap1M=;
	h=From:To:Cc:Subject:Date:From;
	b=KKMvp/l1Rq1L9185vo8pIgTFQuMzeAq6JuWHg+TWaOmaNUXrYeUjRM+tKOOvDFDuQ
	 zNZfsAEdV+e95VXY/g58J4djh6Ax8xrkc7e2qeDOsw6Z0j53jaHAu7KIpYJVD30wrl
	 G3qHY0TCu19q3QO6/LvVTvjqkWZxp6BqSRhhr/rVVZpZAP+bEL03S1YNgkNAsTbBeJ
	 LXtkcjwyhtzTsd25tV1cN7k4+EF6aSkgk9GkF+rwtnWt+DJGEH3LreOWSM6h7Qu4HG
	 +BofmIevmezasMvQjD/fTbMTaX32VroLZVA8egkHzWGuTGpW8zlfMKJDjzxW72ZzG6
	 IdV0Z863yOSbQ==
From: Conor Dooley <conor@kernel.org>
To: ulf.hansson@linaro.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	arnd@arndb.de,
	changhuang.liang@starfivetech.com,
	jiajie.ho@starfivetech.com,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	robh@kernel.org,
	walker.chen@starfivetech.com
Subject: [GIT PULL 0/5] Missed starfive pmdomain changes for v6.6, now for v6.7
Date: Wed, 13 Sep 2023 14:54:23 +0100
Message-Id: <20230913-bloomers-scorebook-fb45e0a2aa19@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=EKO/JXotiZvRjrciydNKo5TqXwavOcF+4xIEn9RLlOY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKmM+/nPGSu+vpKQG/txu+X0tv7YgENZZ4+tUpep27iQ/ WNU+zXujlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEyk6Cojw/I1Mxe/6xXT4k1w zXMsnDc5dtvas2KG0/dscDM97sCxtJqR4czvOEmOtnXxGjxRE9+HZIu2lLBssONaEtEoc1DyZq4 VGwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_065614_579472_F354BDA6 
X-CRM114-Status: GOOD (  10.51  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Hey Uffe,

Here's those missed changes in patch form. I figured it might be a bit
easier this way given the name of the subsystem is in flux, doubly so if
you'd like to put the header change of Rob's on fixes.

I had this out for LKP last night, seemed to get a clean bill of health,
before I rebased it on top of the new name this afternoon, and ofc it was
in linux-next on top of v6.5 for quite a while...

Thanks,
Conor.

CC: arnd@arndb.de
CC: changhuang.liang@starfivetech.com
CC: jiajie.ho@starfivetech.com
CC: linux-pm@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: robh@kernel.org
CC: ulf.hansson@linaro.org
CC: walker.chen@starfivetech.com

Changhuang Liang (4):
  dt-bindings: power: Add power-domain header for JH7110
  pmdomain: starfive: Replace SOC_STARFIVE with ARCH_STARFIVE
  pmdomain: starfive: Extract JH7110 pmu private operations
  pmdomain: starfive: Add JH7110 AON PMU support

Rob Herring (1):
  pmdomain: starfive: Explicitly include correct DT includes

 MAINTAINERS                                   |   1 +
 drivers/pmdomain/starfive/jh71xx-pmu.c        | 139 ++++++++++++++----
 drivers/soc/starfive/Kconfig                  |   4 +-
 .../dt-bindings/power/starfive,jh7110-pmu.h   |   5 +-
 4 files changed, 117 insertions(+), 32 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
