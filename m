Return-Path: <SRS0=VhLN=P2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87E0C433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Nov 2021 03:47:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D406C61208
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Nov 2021 03:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D406C61208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IxJm4JGcL6AJLl45n6+AnSnvOg89fIIPz45CJ7xS/6o=; b=ByvBZ/LhwmDQh1
	epaUqkSCPovLkkkRRI7NVI4gTWs9Mp+Y3XFkPYT2TmUF5e9knqSh3JV1aqxKjVrik+0ltGmn65JmY
	1e2TjOZNNBC2ESMaFRi5mYGyi+iYnnHRmQETAEfmee3BJrKv/AjjYo9ZWX3O5fLfmoWwC5T/wFpmv
	oToqlNC+0CUjSfopiQPV03xiHm2FL688h4Wpqu60faTRSysHqdRkUnE7oI/xZQ3BelK7JAS/WZuhU
	aXT8tnprEdWD4C1JEgv0XErAYevRvy7H36ppvJ79RDTPorSo0Zpxd6WhouDYfSUXEL42N1BdBw3zf
	hwjzUfGRgjrlpJKzM1sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjZ9S-00DwyA-89; Sun, 07 Nov 2021 03:47:26 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1234::107])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjZ9Q-00Dwxs-K3; Sun, 07 Nov 2021 03:47:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=m1mrkg1KCENusuCP1Uhak5JxRDb6vEFEHQG0eW+qSz0=; b=OrlugSmQkgJn0N0SXqnL4wBtD6
 9Pf1J8fI0Aboyv3XhJENorMl4BlA9c1upnEq+71qbQMvnL2q/2PgjePKsB+jH0K1pVsBRX97R9q4s
 KwaGUfsspL4nKMYi57ppmmYiWr5DixAFlCG2qFFW3TTA9ZV5xsHnw7Ye2IkvOX4bIuw+2BANu02a7
 pdoduAmmGq8M0oDW906m5B6WeQKQKsorM3XxfHC7jMb3UWp7EEBxvkFjIq9oLkTJFYgwypPp2EMT0
 r+LFGTsgUWW0gO7+U+MvdpLvKQ6z+9OYw3omrGEngHSX/IlGpPJr7VldDyNTu78W3NEidf2QoYdzu
 FYIPwzMw==;
Received: from [2601:1c0:6280:3f0:e65e:37ff:febd:ee53]
 (helo=merlin.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjZ9E-008bWR-6D; Sun, 07 Nov 2021 03:47:12 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH] riscv: kvm: fix non-kernel-doc comment block
Date: Sat,  6 Nov 2021 20:47:06 -0700
Message-Id: <20211107034706.30672-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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

Don't use "/**" to begin a comment block for a non-kernel-doc comment.

Prevents this docs build warning:

vcpu_sbi.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Copyright (c) 2019 Western Digital Corporation or its affiliates.

Fixes: dea8ee31a039 ("RISC-V: KVM: Add SBI v0.1 support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Atish Patra <atish.patra@wdc.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: kvm@vger.kernel.org
Cc: kvm-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
---
 arch/riscv/kvm/vcpu_sbi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20211106.orig/arch/riscv/kvm/vcpu_sbi.c
+++ linux-next-20211106/arch/riscv/kvm/vcpu_sbi.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * Copyright (c) 2019 Western Digital Corporation or its affiliates.
  *
  * Authors:

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
