Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98714C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 05:05:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59F17613CE
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 05:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59F17613CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kl1o1Lpno+4BrYuM/vZ1rzLWLCbJDnJxA405HlaTa6E=; b=UVfk3LsypZ7QWsr7LqrfGgDkT3
	sWpWklOwKh7uVSQRMd/zQv1epMHoTkT3gFhQmVZ2B/yu8KO1kYYgV07q5/6aKgkaaf4jCOuvwhTUs
	K24wke2+rAuA0GINKHJ5FzKDdGk/txb5DLeDkOqBQvjEi2Q/t9WLDPEIAgZLCzWyXIDCjMARJMF8z
	wnMSee24LQUP8s9hX8Efg0ZMh5+QQ1t3MZ7/ywH5qXGnwz6SFcmBGDeFBcY5q8G/kZc71k/OC9lLd
	L3MSf+9eYLNpO3xfa13iz/Z2fZnMp2OPxPQN6Qega+7Yr2mDdav2msRZyUoj0YJm641N42YN9Vdea
	TNGdolKw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljEOZ-002o3a-Kq; Wed, 19 May 2021 05:05:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljEOX-002o2z-J3
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 05:05:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=6XHzsiRXJ5wBHYKCT9/U4+eRxyTgk6Oc13fYA4HliIQ=; b=OGwoqxNepMyEd7OaIqKla/jKUd
 F/9d5eFnVpkfbrgEuWgOA7OGDK75clZQotl0EQKBx2AXqMolWzw2vFJH4VsV2DfWQ2okRsx6NhB3L
 S7xWRGsQA9/E6FIBIYdrYMIdl7c3VXLJuJab//O0t4riF8gKMmWePiWjPLt+mhn0KtnkdAyjEA8pV
 pj/rDBleMsGTayeg4ogIAz/ms7k8wPndJJyySdiXYhlyqAJC4urSZEd7uS3DCfdXFCO/Y/PHCIQfI
 K2zJJR2iaSiIreZ00bvjwRK0QZYfCThCCk9f1kscdZL/1qG0J/CKABP7izXsdF96f9enDGA4nGUl9
 DyRoGuWw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljEOU-00F8Ys-V6
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 05:05:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6B7A61355;
 Wed, 19 May 2021 05:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621400718;
 bh=FUR+kgZ+mw6mQw3yvdnnfad7YItNxZiYZYD2BKwK/SQ=;
 h=From:To:Cc:Subject:Date:From;
 b=i7EKFQigqGmUdb8wYjNQHOwKJkDxkY3IxJXsCMm/WnSs3Q3TgMcH4lt917hLkjtH+
 6L1kLdk9P5li0WQzsEsAzZ02qa9W3r9WGdsh8J4VSMU89257YxpBkzYM7qVSXLBvpp
 2kIpk4Pu2cbOVb6sz2EvDUj3J0o5Am6Td9n2BMmSosbqFwVW+4O23BFXpk4wrS357Q
 Lw/TjRESwjTy9MkCBEprl0eIKkenIS8nBmy9FAlanquBC9dD7/Cr3ZMJBtxbmShTyJ
 c9o57+MKko2T8D9fNPZ6rS66E+U3rPpmQIHnTvj6xrY7ymyyyfl+E6p5DpjL2hGUGu
 fUKUd1DUMl/yQ==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 drew@beagleboard.org, hch@lst.de, wefu@redhat.com, lazyparser@gmail.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Date: Wed, 19 May 2021 05:04:13 +0000
Message-Id: <1621400656-25678-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_220519_065935_3430D984 
X-CRM114-Status: UNSURE (   9.68  )
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

The RISC-V ISA doesn't yet specify how to query or modify PMAs, so let
vendors define the custom properties of memory regions in PTE.

This patchset helps SOC vendors to support their own custom interconnect
coherent solution with PTE attributes.

For example, allwinner D1[1] uses T-HEAD C906 as main processor, C906 has
two modes in MMU:
 - Compatible mode, the same as the definitions in spec.
 - Enhanced mode, add custom DMA_COHERENT attribute bits in PTE which
   not mentioned in spec.

Allwinner D1 needs the enhanced mode to support the DMA type device with
non-coherent interconnect in its SOC. C906 uses BITS(63 - 59) as custom
attribute bits in PTE.

Here is the config example for Allwinner D1:
CONFIG_RISCV_DMA_COHERENT=y
CONFIG_RISCV_PAGE_DMA_MASK=0xf800000000000000
CONFIG_RISCV_PAGE_CACHE=0x7000000000000000
CONFIG_RISCV_PAGE_DMA_NONCACHE=0x8000000000000000

Link: https://linux-sunxi.org/D1 [1]

Guo Ren (3):
  riscv: pgtable.h: Fixup _PAGE_CHG_MASK usage
  riscv: Add DMA_COHERENT for custom PTE attributes
  riscv: Add SYNC_DMA_FOR_CPU/DEVICE for DMA_COHERENT

 arch/riscv/Kconfig                    | 31 ++++++++++++++++++++++++++
 arch/riscv/include/asm/pgtable-64.h   |  8 ++++---
 arch/riscv/include/asm/pgtable-bits.h | 13 ++++++++++-
 arch/riscv/include/asm/pgtable.h      | 26 +++++++++++++++++-----
 arch/riscv/include/asm/sbi.h          | 16 ++++++++++++++
 arch/riscv/kernel/sbi.c               | 19 ++++++++++++++++
 arch/riscv/mm/Makefile                |  4 ++++
 arch/riscv/mm/dma-mapping.c           | 41 +++++++++++++++++++++++++++++++++++
 8 files changed, 148 insertions(+), 10 deletions(-)
 create mode 100644 arch/riscv/mm/dma-mapping.c

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
