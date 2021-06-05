Return-Path: <SRS0=INRY=K7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31FDFC47082
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jun 2021 14:38:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1362613AC
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jun 2021 14:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1362613AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IsS4wspE7s7NxR8P57Pja++xe0g7x6XGHUoHW08rrMo=; b=EfgbLgNfv+uKKV
	UmHYcR9BmnYgYtbZb5dOyKsoKeN1NKDbHBFcEfBbnEPnEO5O/ut7XERMq2OeQiK25JamyB5QFasL8
	lco2IpzmZ9qBCWyfcfiKHkx36QxdIm5ZgaNRAnbLiGYWV1cpVwtVqduEIB4hciX1FngjQY5kw1Mq6
	9eyNdIW1kD+qo0pmDb+UqPl5Jp/LnxLxvrtkV83Clqr1kggtJUtxxckdnZs4sOjAoVDUedemf1geT
	T7Pg/tvfUZg2l+p7D1/OGRwjI3eNApwdAw5kqxN5HuNpl1a+opLWfj04A/nFiP9HvK532kMohdkyy
	5KObuTQ4R/PfnW7LmSow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpXQo-00GhLc-1h; Sat, 05 Jun 2021 14:37:46 +0000
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpXQk-00GhKo-Go
 for linux-riscv@lists.infradead.org; Sat, 05 Jun 2021 14:37:43 +0000
Received: by mail-pl1-f174.google.com with SMTP id f3so511736plg.2
 for <linux-riscv@lists.infradead.org>; Sat, 05 Jun 2021 07:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=MVXg+TM3W6qOVs0MrUWFbVcO7ai55q7VxFvc/ybDjWw=;
 b=kaL/5d26QQxWUXqTD+oWxqPqRvfHi6y4jxIP4S93hMZMiBkw4G9HXo2xFxrXXr88Y2
 iWrGd20SJUjsjSrCyS9H182a25EpKPMcB8FzSEDdAiyZ8vYZF4d3Uq86xOXARoxuV8c+
 Z1QPfwDax1t8nhZnQrdzA60PVuZEMk/Xs7cZqxMbD8ZHAjhouVrb2GAg516iKJ7sh8Sc
 v8dp67bRZj7CQF2sV5fLxj1qjbDYrkZvqXUhLmXt5D7IBhgN6MTziIfOgXd0bPo3Xv7e
 +rm4UIFEYTO8+RFM0bA5LTT6QAHTW21RRcalVERASbzyvW3/C+WN6EVlZmGxqWICGpv1
 MoSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=MVXg+TM3W6qOVs0MrUWFbVcO7ai55q7VxFvc/ybDjWw=;
 b=uDxlWXhTwG9+L9TlzgleWXqjYvWdPQLOILfwUA+807VCFJxD8Wku9ZrIuXIa4psJcA
 5Nv86AGQtTFJAMHO5wV6RBru8IsYlb8UL0gy+AFtq3KMAY5gM15Z9cTKWoJmTSfb3Qw4
 ENm8qjWtZRM5oZOpFRjowdHs1cYwwuqKzZB/MOVc3lvqjqG7HxfzxYuGu8L6fTek/fn2
 i5Z+7xQxSJZ1SZrNWKR6aU8+ewo6J446xPHl1kKDPRpzxzVWYRKuo/whoDWaACvu9avY
 y9RyjDo5eciq6gIpaFo7iKpbhRZstt4Zkf5HIpd/13R6J6TihhW3/Llifh3zCBPbmSVE
 UJew==
X-Gm-Message-State: AOAM531hd7zC/rCahoBIN0hsG6ZDgxTUKLqJGPuX9cDCY6X+k23zBcfi
 b8IZ+4HG42IejaGFjrf9hMGvmg9b5IsQFoXZ
X-Google-Smtp-Source: ABdhPJz2e10SXkzAW2wHeuYPnO5Ux9o74si+RhnWjaYFkoWIuzajzYNFS+gLvVsg8VwT8xcAZgRnkA==
X-Received: by 2002:a17:903:1c2:b029:10e:5ff0:bd44 with SMTP id
 e2-20020a17090301c2b029010e5ff0bd44mr9234171plh.7.1622903801524; 
 Sat, 05 Jun 2021 07:36:41 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id d12sm4017894pfv.190.2021.06.05.07.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jun 2021 07:36:40 -0700 (PDT)
Date: Sat, 05 Jun 2021 07:36:40 -0700 (PDT)
X-Google-Original-Date: Sat, 05 Jun 2021 07:36:38 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.13-rc5
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-8b83335c-43d4-4912-a2b6-2d609e10d7bf@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210605_073742_638226_9BC33079 
X-CRM114-Status: UNSURE (   8.36  )
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

The following changes since commit bab0d47c0ebb50ae0bcfa4e84986a60113bf7d6b:

  riscv: kexec: Fix W=1 build warnings (2021-05-22 22:05:30 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.13-rc5

for you to fetch changes up to 160ce364167fabf8df5bebfff1b38fd5d8c146c9:

  Merge remote-tracking branch 'riscv/riscv-wx-mappings' into fixes (2021-06-01 21:17:08 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.13-rc5

* Build with '-mno-relax' when using LLVM's linker, which doesn't
  support linker relaxation.
* A fix to build without SiFive's errata.
* A fix to use PAs during init_resources()
* A fix to avoid W+X mappings during boot.

----------------------------------------------------------------
Jisheng Zhang (1):
      riscv: mm: Fix W+X mappings at boot

Khem Raj (1):
      riscv: Use -mno-relax when using lld linker

Palmer Dabbelt (1):
      Merge remote-tracking branch 'riscv/riscv-wx-mappings' into fixes

Vincent (1):
      riscv: skip errata_cip_453.o if CONFIG_ERRATA_SIFIVE_CIP_453 is disabled

Wende Tan (1):
      RISC-V: Fix memblock_free() usages in init_resources()

 arch/riscv/Makefile               | 9 +++++++++
 arch/riscv/errata/sifive/Makefile | 2 +-
 arch/riscv/kernel/setup.c         | 4 ++--
 arch/riscv/mm/init.c              | 8 ++++++--
 4 files changed, 18 insertions(+), 5 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
