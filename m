Return-Path: <SRS0=fnRf=HB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED4EC433DB
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Jan 2021 02:53:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 862A464DBD
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Jan 2021 02:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 862A464DBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PyLm6bAI+nfI5D1hYXcu68Rm8l9OdlfBxWWUhHElS04=; b=HEtH7l9z7BoJiwcv/Pj9q/rYVR
	UHMPGXA28e4TxHtWzDsvDJm0C3DYGx7JgK80t66NfsrfGV8xmpiAPFNXhrg6Ynnhc45CSLtl6Ee4K
	CFdUi3exWgaXuuNcE/W+Zg00PEzeS1RyzHbW0H1FU7iF1SdBidBWfqzt2SNZiGPPpumrPGzFWjYay
	CJ3Q9XJ6C2zNSHTIB9HsZtgH4VUSHibpz+paqCNyWxCaSXTRobMxYGCWpXlqERi7iOTjpi1bsNsd0
	cKnwjjSKGZcRYO84jh7JTbyLHbzOImWq4H7FmmZJ9nc5jBiYujUg3U5m9qvi4qUEj+aBysF49jClS
	tzlpjpMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5gNg-00084G-1R; Sat, 30 Jan 2021 02:53:00 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5gNc-00082i-6f
 for linux-riscv@lists.infradead.org; Sat, 30 Jan 2021 02:52:57 +0000
Received: by mail-pg1-x52a.google.com with SMTP id o7so7910887pgl.1
 for <linux-riscv@lists.infradead.org>; Fri, 29 Jan 2021 18:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=z0ZSRAm22becpoRJb9gtSQVe8ycgGNmfWJKMTAVmy7w=;
 b=GwLpMbfM6WAZVcr1QevQus5d4SobAJ9SIZ+mvNqxCPS66/pVg0HN0aNAdR8AcX6nSw
 q+U2qhTq1d6Is3uT/3wqIOKAkEpSuP6v7yKV9w05AGZG+nzq5EMV1kErrpPP4cu3u5FW
 UOlrZoFd1ZJIdH6mchJkoWCgCoFYgQzBl8sv8814DDmMASYUkwpgAICeYzRKtUqSEO6B
 BnT4tqtV/J54KOPQAei/GckKR6pqQyQ0hjwgiTO1rC68ZbQGhSqkkyl1IHVMfQucV+a1
 xmmJFGm7Xf6lDZM1Dq0t0K6Awx3gTJBHpw3Ot6xtLVit/Y4r/AegD3NL+nqYYq5094ed
 Z6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=z0ZSRAm22becpoRJb9gtSQVe8ycgGNmfWJKMTAVmy7w=;
 b=U3+/A5drqGqWQQjyVA00NslYfC5S+3QFAAqy3GU6iQSixuIN3LOslmnx9zlCwlFXgw
 2M05wiA81Oy/PJxOmrAPywYkI9NG/ERZdeaZLh9NBd2ZWbInx/7F0/x9iGu7QvhLxz98
 p0rV6zk596+c5HU6O8vEPXK7o0pW7AmkV0koumRyoqudJhnei6umi1XWAB6jdnV1bycu
 WWOB2ROqC98lsTwZ7lM9gz/UmsuvStKMIV+ACXczMZhfvnyssNcViCQ1r+LrvxUMbqW7
 RqZbeGmH6IeNKJlaoTJvYsBWjnsuOoMggvzCBC698+cSPqiOya/9yikE2FlGbJU5ThyK
 lfBQ==
X-Gm-Message-State: AOAM532ZT/E+mAvB+0uJIlAG3KtZZayPAwCgMdWn8NWQaq9+2GhfQlqA
 zYbB8cC9OUmjrUyJAhiwHnJGOVrkjJBBgw==
X-Google-Smtp-Source: ABdhPJz6ksfwhE/qfo7BaGpKQo1YSgYeKx5gzN2g1HwK7oNMEiNEL+mIJm7O/+1TZKkZ8sRUWkzI9g==
X-Received: by 2002:a63:c207:: with SMTP id b7mr7310629pgd.184.1611975172866; 
 Fri, 29 Jan 2021 18:52:52 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id p7sm9877162pfn.52.2021.01.29.18.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 18:52:51 -0800 (PST)
Date: Fri, 29 Jan 2021 18:52:51 -0800 (PST)
X-Google-Original-Date: Fri, 29 Jan 2021 18:52:49 PST (-0800)
Subject: [GIT PULL] A Single RISC-V Fix for 5.11-rc6
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-72236532-fb2c-406a-9a7e-509c579364c5@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_215256_398437_E016CC74 
X-CRM114-Status: GOOD (  10.00  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 19c329f6808995b142b3966301f217c831e7cf31:

  Linux 5.11-rc4 (2021-01-17 16:37:05 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.11-rc6

for you to fetch changes up to 336e8eb2a3cfe2285c314cd85630076da365f6c6:

  riscv: Fixup pfn_valid error with wrong max_mapnr (2021-01-22 20:18:03 -0800)

----------------------------------------------------------------
A Single RISC-V Fix for 5.11-rc6

* A fix to avoid initializing max_mapnr to be too large, which may
  manifest on NUMA systems.

----------------------------------------------------------------
Guo Ren (1):
      riscv: Fixup pfn_valid error with wrong max_mapnr

 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
