Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E03CA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 07:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h8bByxtSCePESmatLJmYRaFyEkV437Jnvhk5+7Zcs80=; b=gmjXZXilLHONtk
	006LCKcCofiIXXJ6gZ1dzivItYtc0A2pgS24N3LRcXD1Xai/fM9Stv+3TtBPo23lJMYtS3zUyDOww
	TuVXI4z+FlR82Fa04tzjnJ2e1MxpJ9XX/nDuVO6/F1CeqRXXoMgoQj/tCaXnd/HaZvvYGyXqAI81d
	NK2FrfqliMobIPD3RvFYmozeRXLnGcSpd4CGQiD9RWHS+q7GeGxcUfvzMtPSULDaAruMCWMR2Mk5X
	a1beAlGBLtkUoCbCdbEGLeH6uSNJtIYiNtnlsaVPoDFGxx/Edog7bM+VP/V1HmHn4bRmUCx3b2vq6
	s/NI7NMDtyAh+wh+B22A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unufl-00000006rS2-0z9d;
	Mon, 18 Aug 2025 07:52:53 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unucV-00000006olu-1XB4
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 07:49:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755503364; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Xat82lbwEAS5jmKyCWhCxIrL/pBgJx8v8X9Zf9OCzTYRKnq7vczAO28Ph4iQAHHOVyK9H204KTrbsEPND4n7KsxlBWajeRQDqcY4clpvhTTbeuqt9L6G6c7iRlVprl3CY7UYHaYbRhWImLh6Yht/lWrCjRu+jhLCxgGDoKWj5pg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755503364; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M3qvXpajujXPyv4fG45eVXvK9DfgH/PM+T6mlMFxVd8=; 
	b=c3b/6iJXlHwPsV+IOwvc+S8GbhXs0ie0By7xvFaMEY9lCkoKGYHLyf+zSW4Dg1RcmqN8SHdO8EpBKpVKsFg46fZdLOB8tF3fZz/LjvR0MKQdk0xQOKOczPQLyg8d4IUkqoQAT3ZyOJP2x2SFdcpSlEP+909+oVDrQWUHJim7G6c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755503364;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=M3qvXpajujXPyv4fG45eVXvK9DfgH/PM+T6mlMFxVd8=;
	b=gILAbdMGVlBomoNgtIKUlWz8tm2rVq7h3QiiDUl0ykxnuozKF5nktryt66P3Q+B0
	G4uTYo2pCWzzOHaxJipLyB1GsLOxbrxneteHyQcMn2yHuWuD5ST5OOQpzjJPvJSh77P
	hU0Pp+ZaaEhnNiJPCswVbFm9gTg5gFlyG9vKiR5AgJNuDCsVqJEW60GJYOsEnyjuFlA
	bBk+5G2Nybfz7vqMvt4ZoNhQUoizZWvCFHLyPJpL3Tpn2fhpTOmVpORhFv33KZWrqrB
	wcvdJoCYyWjn/FuiuRd+LJyVV3AIZtLy4Zmfm6z72NbKrhTvgr+RJod3xxeuDXRVuyr
	njNlXuepjw==
Received: by mx.zohomail.com with SMTPS id 175550336257471.67178673265767;
	Mon, 18 Aug 2025 00:49:22 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 0/2] Poweroff/reboot support for TH1520 via AON
Date: Mon, 18 Aug 2025 15:49:04 +0800
Message-ID: <20250818074906.2907277-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_004931_459275_D8BF39D8 
X-CRM114-Status: UNSURE (   9.66  )
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

This patchset tries to add support for poweroff/reboot on T-Head TH1520
SoC by calling the AON firmware.

The first patch creates an auxiliary driver for this, and the second
patch makes the driver currently matching thead,th1520-aon create an
auxiliary device.

Icenowy Zheng (2):
  driver: reset: th1520-aon: add driver for poweroff/reboot via AON FW
  pmdomain: thead: create auxiliary device for rebooting

 MAINTAINERS                                |  1 +
 drivers/pmdomain/thead/th1520-pm-domains.c | 35 +++++++-
 drivers/power/reset/Kconfig                |  7 ++
 drivers/power/reset/Makefile               |  1 +
 drivers/power/reset/th1520-aon-reboot.c    | 98 ++++++++++++++++++++++
 5 files changed, 140 insertions(+), 2 deletions(-)
 create mode 100644 drivers/power/reset/th1520-aon-reboot.c

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
