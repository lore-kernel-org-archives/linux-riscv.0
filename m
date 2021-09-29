Return-Path: <SRS0=hgxb=OT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5B2C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 17:23:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34E4660E08
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 17:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 34E4660E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b481/Dxa9R5pDHyWXCGniWZLeXKy/z4qol2pf5bdE7U=; b=Okc343QA3UIDBX
	+0JvVu+FjI655UJr3EcZLo+b/junIjBCOxoo1XS8TXFvEiJJwFjE0HrzX9dGfgCyW+VcPDcb/lEz+
	juZBDPlgQSEVAzqTpvU93/40pPc5u93xBwer22MCv5u4/MN0IO2OWjuFxb9kapxQCLcKA2ZndfMvd
	V4K4qa5t3akRV6YPhQVq8vZLQJkJyjnfpgYZKOZ6QYdbEQ+iR4pZ3WIri7W+fEen9HEqaoPxg3gKb
	mf4UMLG1fKYCqgfMIECo9afDgc2DtpylBI/ZLD7UOJfmONlxRGzN2ur42Nqq6bloRhUidwYWo/9Xe
	Q0wJKa0C/CSzRImPS4Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVdI5-00BuUX-BP; Wed, 29 Sep 2021 17:22:45 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVdI2-00BuSr-R8
 for linux-riscv@lists.infradead.org; Wed, 29 Sep 2021 17:22:44 +0000
Received: by mail-wm1-f45.google.com with SMTP id b192so2437228wmb.2
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 10:22:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/wYiStrhTYDyD6KyMsoACZjcHuOdOYLgD+s4ib2mjlk=;
 b=EXJYip1n+OeEiBTCguIJUkrCt9NFXMd1F4XBQckWflFh3TE/98Fy2S8Kdn1EAClvVG
 9YBjqLQO9coSIe29pCDda7i7jA9MnVNAnX5EzrWa1rmCInJkVzXJYpUCZ0aRM5kU6Nz7
 pI6Ym0wlWQ3CFDervE+2Z/mmixz0jGWfQvQSugUhh+RnIoIlH5+vwnph5gRNMvMTvQzj
 Rrf6hkNQg5An19lXBj3kob6LGTD7ihcWgCvu6J51EUHyfSWHdfk9h2mOKTeUxA6P410r
 SZNjqWT9F/WNQiQMmpF2pMlczvmI/E7bWnRGQE0MvcDzXBNxBWKYAr44IuicfYmuFboJ
 5RRQ==
X-Gm-Message-State: AOAM533g2F6O4BlrY5/0OHiN62hqe96KnuwHWGYsYGhyp+UjXygVClrE
 GLbWMS7lJ4SeBPr0Ui8owGMyTz6dMR1oZg==
X-Google-Smtp-Source: ABdhPJwj+v6Ia/1ewRH90e4P1/TPFUvE8EwF6nwIW4OtRVbDIJFo8m6XaalECnXB7TPk8E2KUUOv5Q==
X-Received: by 2002:a7b:cde8:: with SMTP id p8mr11667995wmj.178.1632936159413; 
 Wed, 29 Sep 2021 10:22:39 -0700 (PDT)
Received: from msft-t490s.. (mob-31-159-120-132.net.vodafone.it.
 [31.159.120.132])
 by smtp.gmail.com with ESMTPSA id n26sm2267502wmi.43.2021.09.29.10.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 10:22:38 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>,
 David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Subject: [PATCH v5 0/3] riscv: optimized mem* functions
Date: Wed, 29 Sep 2021 19:22:31 +0200
Message-Id: <20210929172234.31620-1-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_102242_903122_76420900 
X-CRM114-Status: GOOD (  12.36  )
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

From: Matteo Croce <mcroce@microsoft.com>

Replace the assembly mem{cpy,move,set} with C equivalent.

Try to access RAM with the largest bit width possible, but without
doing unaligned accesses.

A further improvement could be to use multiple read and writes as the
assembly version was trying to do.

Tested on a BeagleV Starlight with a SiFive U74 core, where the
improvement is noticeable.

v4 -> v5:
- call __memcpy() instead of memcpy() in memmove()

v3 -> v4:
- incorporate changes from proposed generic version:
  https://lore.kernel.org/lkml/20210702123153.14093-1-mcroce@linux.microsoft.com/

v2 -> v3:
- alias mem* to __mem* and not viceversa
- use __alias instead of a tail call

v1 -> v2:
- reduce the threshold from 64 to 16 bytes
- fix KASAN build
- optimize memset

Matteo Croce (3):
  riscv: optimized memcpy
  riscv: optimized memmove
  riscv: optimized memset

 arch/riscv/include/asm/string.h |  18 ++--
 arch/riscv/kernel/Makefile      |   1 -
 arch/riscv/kernel/riscv_ksyms.c |  17 ----
 arch/riscv/lib/Makefile         |   4 +-
 arch/riscv/lib/memcpy.S         | 108 ----------------------
 arch/riscv/lib/memmove.S        |  64 -------------
 arch/riscv/lib/memset.S         | 113 -----------------------
 arch/riscv/lib/string.c         | 154 ++++++++++++++++++++++++++++++++
 8 files changed, 164 insertions(+), 315 deletions(-)
 delete mode 100644 arch/riscv/kernel/riscv_ksyms.c
 delete mode 100644 arch/riscv/lib/memcpy.S
 delete mode 100644 arch/riscv/lib/memmove.S
 delete mode 100644 arch/riscv/lib/memset.S
 create mode 100644 arch/riscv/lib/string.c

-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
