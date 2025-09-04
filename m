Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E43CA1017
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 07:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lDa6GpsWkCchb5SdGLpC+tR5usi4SxLoCgwNcA+DgL4=; b=DjigX4GkH3S9mD
	OBq5kKZXatlipyQCjIBbopTroXXY++tvl9K2W7cOoB7cdR2D0binw1pF9n1KQ3wvLXHdt5pkH3LPj
	C5J48KWosOwS5k3uj+lTXqyWN4qBmi/cDp/X5zEuRkfJsfYwMZTg0oSfgzmbizXH88qp+SxhvVvfj
	q+fv/qbNsdgxDfDhIIieClJOji/nt/CwWLg0SDCpBpiSc9qpRKUEpXqg5WUKokxp5zmhJlFqE0J75
	JjnZaMD+vhh5JnVTatCQ+zgu6v9Gab9lJaC79FG3dTMQ76JnThG4C4xusy2bFBsXpY1iSMuX4H7m/
	7XdMxo89mP/kTht2qquQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4l9-0000000A0VR-42XA;
	Thu, 04 Sep 2025 07:51:55 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4SO-00000009sv5-48Db
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 07:32:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1756971141; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DohdtRdsnWm+FTyceYTJ1ADB2Cu4BDb1acLuTd4SkmAWJE7xnDdnSJc2Mwa+DXakk4L+tYo3jZ3vfJPtoGaY/ES6YnB3yk4Qf3gfhZXM50Z+xWAl7tk7CFwx+yCY5Q2dmf/VMXmBQJpcZ07zN7gMhyTmZdM2fC6kW6/6qvOgOZM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756971141; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aTE4qhWLj97cE91FZu0gKB2lFf3oxunWOUcVgs6SaiY=; 
	b=CQzsD7s5mdKui9tWAxYTf59KjgQCG5QxG2pn9Ckh63Yd98snZqpAptfhid9wB0u2s5C65F9dFa21Dhq9yPAsaHWw+8tr9VRM7ESoPLOhx1Jirx6VWSpzaXNl4dEDpLxrBfRyqUWzTpEudyabVcLUgzn87UfRImIOpsgNVRk46vs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756971141;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=aTE4qhWLj97cE91FZu0gKB2lFf3oxunWOUcVgs6SaiY=;
	b=fJmEpBPVk/LMbZ5euOWMiJw4miTmtW7Msgj9kucoLU6iL98BN14/ytbyQZ/ZvNbL
	LjS1jBL+WRG0CEKWrk43+v8W2dssyyHb6zeDjdSbotNJft1JcVZEp8IfZYk0Bpf9dsf
	CUbmT7MX4vKA+iUTtH8fcsc5n0y5CceQjn5MlTeFIpJy2mySjx+c3UXhOAGTZWpgypa
	srIc2bzCiqvi7BAC9vkfaAS2j85E0P1cn2IYboFcgjkzcXavYuIYlfAR6AMEll0Z5x5
	cLcsWgrO0L7jbhILOL8a0HGVB0sxOKlSN7Tkxnizc2IMskk2B8kuOAzMuzYNZdKBT8Q
	9Lw+h2YHwA==
Received: by mx.zohomail.com with SMTPS id 1756971139231102.77951280999105;
	Thu, 4 Sep 2025 00:32:19 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	etnaviv@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 0/7] drm/etnaviv: add support for GC620 on T-Head TH1520
Date: Thu,  4 Sep 2025 15:31:44 +0800
Message-ID: <20250904073151.686227-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_003233_116708_E6770DED 
X-CRM114-Status: GOOD (  10.80  )
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

This patchset tries to add support for the GC620 2D accelerator, which
is a quirky thing -- it has quirks on both MMU and DEC.

The DEC quirk is bound to the model number and revision number
currently, and only involves writing to some DEC registers at specific
situation.

The MMU quirk is more weird -- it contains a broken implementation of
PTA, which blocks directly writing MTLB address to switch MMU context,
but loading page table IDs different to the initial one does not work
either. A shared context practice, like what's done for IOMMUv1, has to
be used instead.

The DT patch isn't ready because the VP (video processing) subsystem on
TH1520 does not have proper clock and reset driver yet, and the DT patch
included in this patchset uses fake clocks and ignore resets.

Tested by both the etnaviv_2d_test program in libdrm tests and
xf86-video-thead 2D-accelerated DDX.

Icenowy Zheng (7):
  drm/etnaviv: add HWDB entry for GC620 r5552 c20b
  drm/etnaviv: add handle for GPUs with only SECURITY_AHB flag
  drm/etnaviv: setup DEC400EX on GC620 r5552
  drm/etnaviv: protect whole iommuv2 ctx alloc func under global mutex
  drm/etnaviv: prepare for shared_context support for iommuv2
  drm/etnaviv: add shared context support for iommuv2
  [NOT FOR UPSTREAM] riscv: dts: thead: enable GC620 G2D on TH1520

 arch/riscv/boot/dts/thead/th1520.dtsi      | 19 +++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c      | 19 ++++++++++---
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c     | 31 ++++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_iommu.c    |  8 +++---
 drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c | 26 +++++++++++++-----
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c      |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_mmu.h      | 24 +++++++----------
 7 files changed, 99 insertions(+), 29 deletions(-)

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
