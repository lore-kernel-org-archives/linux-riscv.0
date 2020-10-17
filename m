Return-Path: <SRS0=ZqiR=DY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30675C433E7
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2020 07:07:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC88B207BC
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2020 07:07:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TCSr/YiB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zzAG7FVu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC88B207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04Ugukgb58+m7Tf7a2KD8i4Yee3xaWaHqF2lEXraHqI=; b=TCSr/YiBBn//Jf9lvMKi1uFM6a
	gwC1x41qsIYcfx3Q2afTiong6UY3inRzc3f4E9VAXRP8J7+q/Ur+XSAb/0ePShcSkzOl8cjE1eGzC
	wyvb3gJLXph1E++NPRGeYLUYx0/hrqSiPQg9ZHQj4EiThpVhqs9CuvIwqSf9fF/78IE2c5WMbm12P
	f1vvr3+3U6O7QcFipsGYcL7eoaEpkXAvigcYJaxBSXCc5xWhcTv/DH0/gMchYE1//fKC7kuCv7BZP
	ros7ropbAy6jbf3VGkZpvjoJfKO0lBoPyvtpsTwL5zMYO7MZ3xcgPQal2LaG2O76fhVgnTR0+H9Wc
	iHCHrMQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTgJ7-0001hT-2n; Sat, 17 Oct 2020 07:07:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTgJ4-0001gf-7Y
 for linux-riscv@lists.infradead.org; Sat, 17 Oct 2020 07:07:10 +0000
Received: from localhost.localdomain (89.208.247.74.16clouds.com
 [89.208.247.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D0EE82074A;
 Sat, 17 Oct 2020 07:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602918428;
 bh=xA284iII8ZRmJJo0eUa2yxNmhAWRCMgnzZvf5SdcrYw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zzAG7FVunUHB2umA5syQVcafMHCwBPvMDzgvzxMn/sJ6XjQBUalPSMl3ojdAfid4E
 0x6XY/zyyPP6UBe2Gupm9G6cwNU4IbJPKsgg519HzOwFMJjnmus4EXaGF/yj5GXdbx
 lk8uXiLOMWZRgRuK/yeOXZ49jOzS8xSILcZPBlbQ=
From: guoren@kernel.org
To: palmerdabbelt@google.com, paul.walmsley@sifive.com, mhiramat@kernel.org,
 alankao@andestech.com, rostedt@goodmis.org
Subject: [PATCH v4 3/9] riscv: Fixup wrong ftrace remove cflag
Date: Sat, 17 Oct 2020 07:06:11 +0000
Message-Id: <1602918377-23573-4-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602918377-23573-1-git-send-email-guoren@kernel.org>
References: <1602918377-23573-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201017_030710_342669_E532AE53 
X-CRM114-Status: GOOD (  10.70  )
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
Cc: me@packi.ch, Guo Ren <guoren@linux.alibaba.com>, anup@brainfault.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, guoren@kernel.org,
 zong.li@sifive.com, greentime.hu@sifive.com, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

We must use $(CC_FLAGS_FTRACE) instead of directly using -pg. It
will cause -fpatchable-function-entry error.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/kernel/Makefile | 4 ++--
 arch/riscv/mm/Makefile     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index dc93710..f14aed2 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -4,8 +4,8 @@
 #
 
 ifdef CONFIG_FTRACE
-CFLAGS_REMOVE_ftrace.o	= -pg
-CFLAGS_REMOVE_patch.o	= -pg
+CFLAGS_REMOVE_ftrace.o	= $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_patch.o	= $(CC_FLAGS_FTRACE)
 endif
 
 extra-y += head.o
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index c0185e5..6b4b7ec 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -2,7 +2,7 @@
 
 CFLAGS_init.o := -mcmodel=medany
 ifdef CONFIG_FTRACE
-CFLAGS_REMOVE_init.o = -pg
+CFLAGS_REMOVE_init.o = $(CC_FLAGS_FTRACE)
 endif
 
 KCOV_INSTRUMENT_init.o := n
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
