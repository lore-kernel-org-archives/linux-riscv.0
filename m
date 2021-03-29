Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B44C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 16:53:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F3DD61920
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 16:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F3DD61920
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WCKuHu8Z7yC9Pso33s9SWUk2KL/4fbcUOH+3SxfKBYg=; b=gJt2CKHG6M4HbFMYLaYQjKXscR
	blL+3IL82nTqW4kZnfoU7F4d6nw2naNNFwWLH9GGQLCWz1yZNDkUsOPHMpAd5ikdL4gSRctyiahdy
	a9g8MWK59oLgYZa0cBTP9al+T25imTuMRqL5s4BgV1Cc+fS4wRm4oFH6Baji4xF2jSw/xgK/TGrgd
	MtFSdOUHJ4gxAaZseDgR4OPTlHTLsE6wggvXu2xYLBvZ/ulW8xFrTYag2r68WYseJrY1octEvm2zU
	HAm1bOSfBcJL0eanHXxa9ZslKCrPa9h18FRP7vyIWAgHSOhoNBPD2pOW8by9sdbABEPchbWxmTR9U
	VKU8HIEg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQv8h-000na1-Tx; Mon, 29 Mar 2021 16:53:20 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQoem-000YnF-Dh
 for linux-riscv@lists.infradead.org; Mon, 29 Mar 2021 09:58:02 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=rainbowdash)
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1lQoed-0005bK-F2; Mon, 29 Mar 2021 10:57:51 +0100
Received: from ben by rainbowdash with local (Exim 4.94)
 (envelope-from <ben@rainbowdash>)
 id 1lQoec-004Bsj-Al; Mon, 29 Mar 2021 10:57:50 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org,
 Javier Jardon <javier.jardon@codethink.co.uk>
Cc: Terry Hu <kejia.hu@codethink.co.uk>, Ben Dooks <ben.dooks@codethink.co.uk>,
 syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com,
 Arnd Bergman <arnd@arndb.de>, schwab@linux-m68k.org, dvyukov@google.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr,
 linux-kernel@lists.codethink.co.uk
Subject: [PATCH v4] riscv: evaluate put_user() arg before enabling user access
Date: Mon, 29 Mar 2021 10:57:49 +0100
Message-Id: <20210329095749.998940-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_105800_538141_00C22C78 
X-CRM114-Status: GOOD (  15.67  )
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

The <asm/uaccess.h> header has a problem with put_user(a, ptr) if
the 'a' is not a simple variable, such as a function. This can lead
to the compiler producing code as so:

1:	enable_user_access()
2:	evaluate 'a' into register 'r'
3:	put 'r' to 'ptr'
4:	disable_user_acess()

The issue is that 'a' is now being evaluated with the user memory
protections disabled. So we try and force the evaulation by assigning
'x' to __val at the start, and hoping the compiler barriers in
 enable_user_access() do the job of ordering step 2 before step 1.

This has shown up in a bug where 'a' sleeps and thus schedules out
and loses the SR_SUM flag. This isn't sufficient to fully fix, but
should reduce the window of opportunity. The first instance of this
we found is in scheudle_tail() where the code does:

$ less -N kernel/sched/core.c

4263  if (current->set_child_tid)
4264         put_user(task_pid_vnr(current), current->set_child_tid);

Here, the task_pid_vnr(current) is called within the block that has
enabled the user memory access. This can be made worse with KASAN
which makes task_pid_vnr() a rather large call with plenty of
opportunity to sleep.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
Suggested-by: Arnd Bergman <arnd@arndb.de>

--
Changes since v1:
- fixed formatting and updated the patch description with more info

Changes since v2:
- fixed commenting on __put_user() (schwab@linux-m68k.org)

Change since v3:
- fixed RFC in patch title. Should be ready to merge.

Cc: schwab@linux-m68k.org
Cc: dvyukov@google.com
Cc: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com
Cc: palmer@dabbelt.com
Cc: alex@ghiti.fr
Cc: linux-kernel@lists.codethink.co.uk
---
 arch/riscv/include/asm/uaccess.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 824b2c9da75b..f944062c9d99 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -306,7 +306,9 @@ do {								\
  * data types like structures or arrays.
  *
  * @ptr must have pointer-to-simple-variable type, and @x must be assignable
- * to the result of dereferencing @ptr.
+ * to the result of dereferencing @ptr. The value of @x is copied to avoid
+ * re-ordering where @x is evaluated inside the block that enables user-space
+ * access (thus bypassing user space protection if @x is a function).
  *
  * Caller must check the pointer with access_ok() before calling this
  * function.
@@ -316,12 +318,13 @@ do {								\
 #define __put_user(x, ptr)					\
 ({								\
 	__typeof__(*(ptr)) __user *__gu_ptr = (ptr);		\
+	__typeof__(*__gu_ptr) __val = (x);			\
 	long __pu_err = 0;					\
 								\
 	__chk_user_ptr(__gu_ptr);				\
 								\
 	__enable_user_access();					\
-	__put_user_nocheck(x, __gu_ptr, __pu_err);		\
+	__put_user_nocheck(__val, __gu_ptr, __pu_err);		\
 	__disable_user_access();				\
 								\
 	__pu_err;						\
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
