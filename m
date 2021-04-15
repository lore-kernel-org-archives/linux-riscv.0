Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 154A4C433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 17:18:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6ECB61184
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 17:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6ECB61184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Cc:To:Subject:From:Message-Id:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Inlmzu9GZhVUYTuUZ+6xsDsx7tWwrehJAMFQ2qdDens=; b=aY0qWJ2Wh283JJi3bEEG3kPh3n
	S2vk3wd6z8MQxovn57bAQLgTt/Ralh8LSRrgWvN6KJ7K8f0aNHfoFQADX9wEiVsjbEPBstRgq3mvU
	6HTEkPgsOeEXnpILM5aRivMgV71tgH80sgSrIS081zKvEgCJ4F6/fqrL5C47dVZRiLL/XTgJx1VtP
	nUmr6hXGfpe3wqde69aF+JmWLkMumj0HG+UJGuW7Lm9Ca+tNPSUu/+PoIQExwbwXg2OYYHypBKc6j
	UG/pverNFZNa/g5Ig1Lp5zkTlp178tXfuMiDsppyKFCBXiyfAWoLu1mzTdiIYA2/EIjirNwPDMvZk
	Yb41rtGg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lX5de-00GqFy-NH; Thu, 15 Apr 2021 17:18:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX5dE-00GqBX-SQ; Thu, 15 Apr 2021 17:18:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Date:Cc:To:Subject:From:Message-Id:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=tF7wrIP6T12hkwOoPPRFPQZPCvPod6X6H7Gd/lglEnQ=; b=XOtiKJh2i7vixTUcPtJDGaHvwi
 eNyjL7z2QgWAUv9sJIAVvBw6yUuHC5RWFBJHBNR7XAjvRafpBtI5W8rDOx6k6Tz1c/FLCkKJlsgS0
 nB/s1hdo1GUUqvO/Fjfk/9y2R9kCSU3mQyQcmdLlxwFVFZ9g8NPGZe83ePpbD3S/nFyXeul5L5Ty5
 Kj2cRTdTAJzuKweB1l0lOG5vjVT+zcxy49DMNiWBPt6EY8R8KwBJelcQIC188GGu6CEZCNRw3dGeR
 MwT3BULyO6RBeFDmDmMSpUP/xwwyjQ1GahSNXo+0v2hqnyklhxOOayf5Gmo/05hkTquhhv3AAHM0U
 Ft+vq5Lg==;
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX5dB-008llv-E4; Thu, 15 Apr 2021 17:18:19 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FLmJQ28nVz9vBLm;
 Thu, 15 Apr 2021 19:18:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xQ_LIEXY2H5D; Thu, 15 Apr 2021 19:18:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FLmJQ08Wvz9tyvC;
 Thu, 15 Apr 2021 19:18:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F13E68B804;
 Thu, 15 Apr 2021 19:18:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CN9zIg9V5yLe; Thu, 15 Apr 2021 19:18:13 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B7A058B7F6;
 Thu, 15 Apr 2021 19:18:13 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7341B679F6; Thu, 15 Apr 2021 17:18:13 +0000 (UTC)
Message-Id: <cover.1618506910.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 0/5] Convert powerpc to GENERIC_PTDUMP
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Steven Price <steven.price@arm.com>, akpm@linux-foundation.org
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-mm@kvack.org
Date: Thu, 15 Apr 2021 17:18:13 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_101817_648220_2A804F86 
X-CRM114-Status: UNSURE (   4.21  )
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

This series converts powerpc to generic PTDUMP.

For that, we first need to add missing hugepd support
to pagewalk and ptdump.

Christophe Leroy (5):
  mm: pagewalk: Fix walk for hugepage tables
  mm: ptdump: Fix build failure
  mm: ptdump: Provide page size to notepage()
  mm: ptdump: Support hugepd table entries
  powerpc/mm: Convert powerpc to GENERIC_PTDUMP

 arch/arm64/mm/ptdump.c            |   2 +-
 arch/powerpc/Kconfig              |   2 +
 arch/powerpc/Kconfig.debug        |  30 ------
 arch/powerpc/mm/Makefile          |   2 +-
 arch/powerpc/mm/mmu_decl.h        |   2 +-
 arch/powerpc/mm/ptdump/8xx.c      |   6 +-
 arch/powerpc/mm/ptdump/Makefile   |   9 +-
 arch/powerpc/mm/ptdump/book3s64.c |   6 +-
 arch/powerpc/mm/ptdump/ptdump.c   | 161 +++++++++---------------------
 arch/powerpc/mm/ptdump/shared.c   |   6 +-
 arch/riscv/mm/ptdump.c            |   2 +-
 arch/s390/mm/dump_pagetables.c    |   3 +-
 arch/x86/mm/dump_pagetables.c     |   2 +-
 include/linux/ptdump.h            |   2 +-
 mm/pagewalk.c                     |  54 ++++++++--
 mm/ptdump.c                       |  33 ++++--
 16 files changed, 145 insertions(+), 177 deletions(-)

-- 
2.25.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
