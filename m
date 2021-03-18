Return-Path: <SRS0=IhzG=IQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD3CC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 22:42:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4497A64EED
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 22:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4497A64EED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6DRpJZhV/yBQvOq7ptRmCc5eVk4Hs+H0oKMQ8WNBaQc=; b=IS1Dsh++H7J7ywI3b4YNW5EvEE
	IXl3mPHpg50Jwm0gn8G+gBdJRIE95nnWQo4q5OPc2Qf/y5JUXzkTNmob7ksTcfjmxSx3WJYgsNPxj
	x+skyrATkta8hdyyN0cx75KRiy8ynpHJnc/5WAaHVky6WxYnSQAuOUcveBdTXSj2tbXv3m0NxkVYu
	5gS+beKF1lrWDkRLxvVyc01GYt/U1zTtA/lJ156W6LrjVsoFcNJR9iIz1qAFEFtJt1RRihwoJuFBL
	nDZPIHyptBpMsAancFaY1LXAmH08Hhb1MkSvdCRWknRx3mOneP0vUr/R4juv0Sp7w2ScOeg/0vzO5
	yHUDBRXw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN1Kq-0067wz-Od; Thu, 18 Mar 2021 22:41:44 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN1Km-0067wb-Hu
 for linux-riscv@lists.infradead.org; Thu, 18 Mar 2021 22:41:42 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=rainbowdash)
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1lN1Kj-00075Y-VR; Thu, 18 Mar 2021 22:41:37 +0000
Received: from ben by rainbowdash with local (Exim 4.94)
 (envelope-from <ben@rainbowdash>)
 id 1lN1Ki-000Yxd-Qo; Thu, 18 Mar 2021 22:41:36 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Terry Hu <kejia.hu@codethink.co.uk>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Arnd Bergman <arnd@arndb.de>
Subject: [PATCH] RFC: riscv: evaluate put_user() arg before enabling user
 access
Date: Thu, 18 Mar 2021 22:41:35 +0000
Message-Id: <20210318224135.134344-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_224140_714810_497FECC9 
X-CRM114-Status: GOOD (  12.98  )
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

The <asm/uaccess.h> header has a problem with
put_user(a, ptr) if the 'a' is not a simple
variable, such as a function. This can lead
to the compiler producing code as so:

1:	enable_user_access()
2:	evaluate 'a'
3:	put 'a' to 'ptr'
4:	disable_user_acess()

The issue is that 'a' is now being evaluated
with the user memory protections disabled. So
we try and force the evaulation by assinging
'x' to __val at the start, and hoping the
compiler barriers in enable_user_access()
do the job of ordering step 2 before step 1.

This has shown up in a bug where 'a' sleeps
and thus schedules out and loses the SR_SUM
flag. This isn't sufficient to fully fix, but
should reduce the window of opportunity.

Cc: Arnd Bergman <arnd@arndb.de>
---
 arch/riscv/include/asm/uaccess.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 824b2c9da75b..7bf90d462ec9 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -306,7 +306,10 @@ do {								\
  * data types like structures or arrays.
  *
  * @ptr must have pointer-to-simple-variable type, and @x must be assignable
- * to the result of dereferencing @ptr.
+ * to the result of dereferencing @ptr. The @x is copied inside the macro
+ * to avoid code re-ordering where @x gets evaulated within the block that
+ * enables user-space access (thus possibly bypassing some of the protection
+ * this feautre provides).
  *
  * Caller must check the pointer with access_ok() before calling this
  * function.
@@ -316,12 +319,13 @@ do {								\
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
