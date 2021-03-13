Return-Path: <SRS0=xwO/=IL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984B3C433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Mar 2021 08:46:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 048F164F1D
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Mar 2021 08:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 048F164F1D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=evR5p4Jawz9SGxFjMuUjyhiGn6An9+t95A34neIC08Y=; b=dWdy4nX1r3riMju2a10s7U3Qvh
	WZA1mjss7mGN8EpKXG7hOAsVpvCPc5MDBHatL0gFrM3EjDUtbUH3Kn+BBFyOoxNRcesBCdF1T2rir
	oAjc4N+q5k5E8YtjIcWorjcxpthLZzuhSKPNCuNefKZjle3aYeVWwfL9KroSGBPexP3NCzIUcYm04
	vu1Z9IhB29QD88da/wDGfvLcPGkXrXGa8Y2oCH0h8nMuYyMKu4MxWwhAIydlbmH3EXBbm7P6919/w
	O41wp2eMisaeZ25PINNLg8kYZjuPQ2TGUjkZeqKre7hAZZ3Cfb2ypEgaB/R2/egUHl6gr2ainJoQu
	fpBI5Q6g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKzuO-00D2PN-Ok; Sat, 13 Mar 2021 08:46:09 +0000
Received: from relay13.mail.gandi.net ([217.70.178.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKztZ-00D2LF-O1
 for linux-riscv@lists.infradead.org; Sat, 13 Mar 2021 08:45:25 +0000
Received: from debian.home (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay13.mail.gandi.net (Postfix) with ESMTPSA id 736AF80003;
 Sat, 13 Mar 2021 08:45:10 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nylon Chen <nylon7@andestech.com>, Nick Hu <nickhu@andestech.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Cc: Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH v3 0/2] Improve KASAN_VMALLOC support 
Date: Sat, 13 Mar 2021 03:45:03 -0500
Message-Id: <20210313084505.16132-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210313_084524_138119_6E5F8C31 
X-CRM114-Status: UNSURE (   4.66  )
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

This patchset improves KASAN vmalloc implementation by fixing an
oversight where kernel page table was not flushed in patch 1 and by
reworking the kernel page table PGD level population in patch 2.

Changes in v3:
- Split into 2 patches
- Add reviewed-by

Changes in v2:
- Quiet kernel test robot warnings about missing prototypes by declaring
  the introduced functions as static.

Alexandre Ghiti (2):
  riscv: Ensure page table writes are flushed when initializing KASAN
    vmalloc
  riscv: Cleanup KASAN_VMALLOC support

 arch/riscv/mm/kasan_init.c | 61 +++++++++++++-------------------------
 1 file changed, 20 insertions(+), 41 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
