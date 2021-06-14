Return-Path: <SRS0=CnAn=LI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 124AAC2B9F4
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 17:52:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDE586100B
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 17:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDE586100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jkoh01s6JuV0ixpmd83wK8Czu+mgaVgiPI/2o6wavfA=; b=WPK0wrZwMQlImg
	t47DqLPbdgjak1wE8CRdk+gVYKswWnoN1wLaEhfW0mz1yW3bwphrlRnDGvqGitRvUYyiZvAdn1lNd
	EF4ip+lsgZoASt4Muc19Vu4uS0nwOEnFmaAYRorYjx34D0WuWJOdeEnsBhdny3kTnQl9sWfRatBPT
	e+bteh2xxiBDMx0okj66fIa3vUni4i6NrpE7srya2oR5WFrIEdYSRrGhPlQzXR4IBsQaqdHcbfyC5
	o/npYQeIe4x9dew8/MYA7E1CRRr0VrmA2/Q2vhhJ/VHAR1Shf4MjOTqV8Ritfp/a5KFtpa96s1MYo
	GIUo4nwMB2r0EVLPeMIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsqkn-00FVzI-Ns; Mon, 14 Jun 2021 17:52:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsqki-00FVya-4P
 for linux-riscv@lists.infradead.org; Mon, 14 Jun 2021 17:52:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 827DE60FEA;
 Mon, 14 Jun 2021 17:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623693119;
 bh=w6yEl6RdNBce/fM+QwtQ8kaN8ZBcaj88bvIJYqQiqWE=;
 h=From:To:Cc:Subject:Date:From;
 b=CYV9czSkjRP4LdvMU9VxTMqEGCe5n1d/EBSjIvR9gHcyfwJuSRTkmVyYzxr0mPz6T
 FIkdFELsy/LoTBt/VXXTgJwhKsOk+cUGUH4yXFcIOR4n3I3TzN8iLE7KIDNb85vGLl
 W+ou9zfbWXYBzbPUnA+PStAK/B8qvyCt2O8SQDuOOFucnuWmHel8OcCBPIR7UhP0DV
 mXMnXjNCSs1G9gkKBwsBkzsG292IZnCsxGDGikAyOjTvUgeuY9bxtQ/Ipb2QHQjVpy
 LaxuWv6ITwYHAf8RY8ckaF4CYe4YehO5MntIA5z8cPL6sxLW0EI8ZJEJwiBX8+n6jz
 rqN/opCt1ylLw==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech, drew@beagleboard.org,
 liush@allwinnertech.com, lazyparser@gmail.com, wefu@redhat.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 tech-virt-mem@lists.riscv.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH v3 0/2] riscv: pgtable: Add "PBMT" extension supported
Date: Mon, 14 Jun 2021 17:51:05 +0000
Message-Id: <1623693067-53886-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_105200_214640_C6981BBA 
X-CRM114-Status: UNSURE (   6.10  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

These patches are a continuation of "riscv: Add DMA_COHERENT support for
Allwinner D1". Compared with the previous factory-defined hardware
implementation, it now follows the PBMT extension proposal.

V2: https://lore.kernel.org/linux-riscv/1622970249-50770-10-git-send-email-guoren@kernel.org/
V1: https://lore.kernel.org/linux-riscv/1621400656-25678-3-git-send-email-guoren@kernel.org/

Changes since v2:
 - Change to PBMT extension proposal
 - Add pbmt in dts
 - Using img hdr for custom memory types moification

Changes since v1:
 - Rebase on linux-5.13-rc4
 - Support defconfig for different PTE attributes

Guo Ren (2):
  riscv: pgtable: Add custom protection_map init
  riscv: pgtable: Add "PBMT" extension supported

 arch/riscv/Kconfig                    |  4 +++
 arch/riscv/include/asm/image.h        |  6 ++--
 arch/riscv/include/asm/pgtable-64.h   |  8 +++--
 arch/riscv/include/asm/pgtable-bits.h | 55 ++++++++++++++++++++++++++--
 arch/riscv/include/asm/pgtable.h      | 17 ++++-----
 arch/riscv/kernel/head.S              |  6 ++++
 arch/riscv/mm/init.c                  | 68 +++++++++++++++++++++++++++++++++++
 mm/mmap.c                             |  4 +++
 8 files changed, 149 insertions(+), 19 deletions(-)

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
