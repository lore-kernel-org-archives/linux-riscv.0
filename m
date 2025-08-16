Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10ED6CA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 07:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0fd/CZJEeUqWk0zuo0SamhrUqnfl4t/2xbDXhLY1azM=; b=cSMKmRpoZCtNRd
	XrBxRtDloL9rF9amcQoPZCb+J5TKimxyKtuo1qpoZxT7U/1RQhRY0o+wX/9DdtW1q7wNxW5+amaL8
	oCJp4STeUPES3mq8oKiMR/tn0BDn4Bfc7pbfP7ZGjYv2rNQxQfz0/kmSRh6WNp/pTP5D9IjO78+Qn
	TjbY7Y6Wn3AA547HAg/5YdQk69kQnHcXW1BBsE5hHz90xtRuV7NDkdAiIj4eUW5Gwknts9HiacF/z
	UmIKvlwnD1d7Y/CK5P3Bo11e/xKwEualYLoLbQ3Vwrov1l78kskA40Ocvg8ZsR7JHLxY8tMH9rcXQ
	6IiWeyXBi7GgYArNAqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unBeW-00000004ERJ-39ZZ;
	Sat, 16 Aug 2025 07:48:36 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unBeT-00000004EQw-3tPC
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 07:48:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755330499; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A3Z3+ERcLsXTZoUMsAKaue8d2lHMezKapHDW7CIAizHx7DFRfYlxDHl+oVMKxnmPZY92upxn8WP/kd4f+7bf+jsr1MnwPaJcr8/jIOcz3+GNX0aQ4IJ4fqVaxzRc3JfmxSBluUTF+yRkWlC0VTRHWhhUNjiGrObr/M4mTFUAnV4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755330499; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZvPMHxn9L7TiQAMN2zR904XCsjoFl4D3E0wwP1N3GjU=; 
	b=bIO4+m8a1j6drs3qvNV5RvzSKhP+SZUi8yeO98ZXPG+TBg5VKrHp/Njbb/5iI7gsCD65Q/zm6ocF7VE9SKPhyNhsMyAnJlyC5vqutdkj9BMITfuE/Cr50OYT3+MhtIATV6I/N+9MLyBLy2LEVM8PZVf9ox4t95At6GA1DtkLJWU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755330499;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ZvPMHxn9L7TiQAMN2zR904XCsjoFl4D3E0wwP1N3GjU=;
	b=Ejc61UXZtgJgtPUu0kbjrf9a3gMGZBwkNEp6GNXbaNY9cd5k5v4MN4OUPJjCST4P
	vJN8xP6j2quoP+UiX8rOPTDhpmQnuK7Ca4VoiCwf6BwMohPt4vXBZPMyL3+ugPn0b9i
	ATAD/sVL2HgXoQASdKdxOM9iCXCGoRJ2YVlrcA37+Otde/CsMDzREbQSi2+UMXaWEOu
	bc5y0Bxy7VrFu0J6Uh0IWJt84uFla/nVJOI0ZWnDF68SbRdbcf4rtTsUWqBsxdbUacv
	IPzTuUPVP9O4Da7Joos9Te4/Pvrpl4RUT0Z00JnjGCuQZZ7aQaQJxIi8PwtiVwQXa0M
	uk4u/S+V8Q==
Received: by mx.zohomail.com with SMTPS id 1755330497800252.9936948125818;
	Sat, 16 Aug 2025 00:48:17 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 0/7] drm/etnaviv: add support for GC620 on T-Head TH1520
Date: Sat, 16 Aug 2025 15:47:50 +0800
Message-ID: <20250816074757.2559055-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_004834_036537_F141DBDB 
X-CRM114-Status: GOOD (  10.22  )
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

Tested by the etnaviv_2d_test program in libdrm tests.

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
 drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c | 23 +++++++++++-----
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c      |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_mmu.h      | 24 +++++++----------
 7 files changed, 96 insertions(+), 29 deletions(-)

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
