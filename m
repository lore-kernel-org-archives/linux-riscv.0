Return-Path: <SRS0=DSzU=WD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F05BC433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2019 07:20:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3559B2199C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2019 07:20:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SXLocmJ1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3559B2199C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aHVfqjkhauYHvEPVxV7KasOHrPUyGYoLSh0AZ3B+5qA=; b=SXLocmJ1+HjlOf
	IuTDwbcBQLObH79kDGlxDrXtW7/1MoXb2vjIyTAvs+BvNyutbn7jwn56YgKNFqU4ELKtbspvNIpiS
	2ahxRVdo38W9thj5o9/ZljyzQ1g2c+CiRq0Gju+SZpxhFFjdemGlqGvzUInv9gMA8qZP4zapUH9iF
	gsnEuSMw7Omz5xWktx+32IKsAIeWcUb6fz6TFjFCh7ZNydf+J6Xwyl75m7GuYCd+YbcuUhsmyTgGf
	RCvRn6clCH5RfDUcp9SgJBI6ON9vnBjvyee9Y86GwS3OezTV+VLRlMudOcoC4gONXzgkNKxxZlpXS
	tl9XINKFMhX/DeLFYczA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvGFB-0004WT-5T; Wed, 07 Aug 2019 07:20:21 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvGF8-0004VR-28
 for linux-riscv@lists.infradead.org; Wed, 07 Aug 2019 07:20:19 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id x7778Nlw027022;
 Wed, 7 Aug 2019 15:08:23 +0800 (GMT-8)
 (envelope-from nickhu@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Wed, 7 Aug 2019
 15:19:21 +0800
From: Nick Hu <nickhu@andestech.com>
To: <alankao@andestech.com>, <paul.walmsley@sifive.com>, <palmer@sifive.com>, 
 <aou@eecs.berkeley.edu>, <green.hu@gmail.com>, <deanbo422@gmail.com>,
 <tglx@linutronix.de>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <aryabinin@virtuozzo.com>,
 <glider@google.com>, <dvyukov@google.com>, <Anup.Patel@wdc.com>,
 <gregkh@linuxfoundation.org>, <alexios.zavras@intel.com>,
 <atish.patra@wdc.com>, <zong@andestech.com>, <kasan-dev@googlegroups.com>
Subject: [PATCH 0/2] KASAN support for RISC-V
Date: Wed, 7 Aug 2019 15:19:13 +0800
Message-ID: <cover.1565161957.git.nickhu@andestech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x7778Nlw027022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190807_002018_366168_03AE212F 
X-CRM114-Status: UNSURE (   6.35  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Nick Hu <nickhu@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

KASAN is an important runtime memory debugging feature
in linux kernel which can detect use-after-free and out-of-
bounds problems.

There are two patches in this letter:
1. Porting the memmove string operation.
2. Porting the feature KASAN.

Nick Hu (2):
  riscv: Add memmove string operation.
  riscv: Add KASAN support

 arch/riscv/Kconfig                  |    2 +
 arch/riscv/include/asm/kasan.h      |   26 +++++++++
 arch/riscv/include/asm/pgtable-64.h |    5 ++
 arch/riscv/include/asm/string.h     |   10 ++++
 arch/riscv/kernel/head.S            |    3 +
 arch/riscv/kernel/riscv_ksyms.c     |    4 ++
 arch/riscv/kernel/setup.c           |    9 +++
 arch/riscv/kernel/vmlinux.lds.S     |    1 +
 arch/riscv/lib/Makefile             |    1 +
 arch/riscv/lib/memcpy.S             |    5 +-
 arch/riscv/lib/memmove.S            |   64 ++++++++++++++++++++++
 arch/riscv/lib/memset.S             |    5 +-
 arch/riscv/mm/Makefile              |    6 ++
 arch/riscv/mm/kasan_init.c          |  102 +++++++++++++++++++++++++++++++++++
 14 files changed, 239 insertions(+), 4 deletions(-)
 create mode 100644 arch/riscv/include/asm/kasan.h
 create mode 100644 arch/riscv/lib/memmove.S
 create mode 100644 arch/riscv/mm/kasan_init.c


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
