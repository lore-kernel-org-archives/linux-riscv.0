Return-Path: <SRS0=6doD=NU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB707C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 03:17:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BD0C20840
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 03:17:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AGxc/Vo+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="deq7ZwA+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BD0C20840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=+OtudACHIqL9w+h/A9wykGTwBmrbBfecOLA3lISKBnU=; b=AGxc/Vo+jdL3/A
	uQ3TvrfdyGs8V7auo6fKZHdhY+qgfZSnVk/LMvWqgfMEbkpSNZb3sJ/sb3aioZQRNL/soBzfXzIQj
	fBPa9RWPDtlm0kWBTvACRm0ObtVs/6PvKqITmLl6Krd+RLceteEFaQaWkcb58mG/zBF/awm7KnC2H
	IadDFGvvxAtbbQrlI/4rfiL7ob2YKANVgRimFsa+UFfGDCn7MQ9d5AQ6eiAOqmnC1Ltw56uVNqzeq
	G3fUz37rAQQDvrSWA7TfhAjIjh1ZLxOE3I54Qm6Q9uZKIOC2ecC14KW2mUZYlXpNRLDnOHoh08hAi
	m9zKOWKp46F8pmW4mkyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKxIX-0002Bm-Qq; Fri, 09 Nov 2018 03:17:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKxIV-0002Bd-Rs
 for linux-riscv@bombadil.infradead.org; Fri, 09 Nov 2018 03:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KUBlN//D60TGTjxVJz3mDURy8xo3EZsAJrJAp5DeHPc=; b=deq7ZwA+me2JqFQarZ6JewRR7S
 Ry0YXdjHAneRHr5S7zGFy5OmB6fqo0cULV+hiFMKur5ZbEIbuwhhg5+x8etf0xkfyZncOzNOK+Sui
 zfNMFZ3v2uc3DSFSb16114xeSUF2X3aGCr7BjzdQ7znANRTqyZz8iL8wCVvHl1IAd+alVH9OKAFPO
 dIi1vJ5atQNNdcNYmw0WGZK+5TXn7nTKyv4FPspPY6y1zAvbWd9gkBRj/e+ahC6LJnWG6BA138CJA
 b4VQnmzmuARsU/yFnoidbaBW1CIGBNF4A46Vagt14p0vpidVSTxxPQSkp3GhOJUzKJW2PZ9woYnCj
 JUY4lw3w==;
Received: from vmicros1.altlinux.org ([194.107.17.57])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKxIS-0006bB-4H
 for linux-riscv@lists.infradead.org; Fri, 09 Nov 2018 03:17:26 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 69BD672CC59;
 Fri,  9 Nov 2018 06:17:13 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id 631357CD1FF; Fri,  9 Nov 2018 06:17:13 +0300 (MSK)
Date: Fri, 9 Nov 2018 06:17:13 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Andy Lutomirski <luto@kernel.org>, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Moore <paul@paul-moore.com>,
 Eric Paris <eparis@redhat.com>
Subject: [PATCH 12/13] riscv: define syscall_get_arch()
Message-ID: <20181109031712.GL21511@altlinux.org>
Mail-Followup-To: Andy Lutomirski <luto@kernel.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Moore <paul@paul-moore.com>,
 Eric Paris <eparis@redhat.com>,
 Elvira Khabirova <lineprinter@altlinux.org>,
 linux-riscv@lists.infradead.org, linux-audit@redhat.com,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181109031303.GA20906@altlinux.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_031725_250731_364AD63D 
X-CRM114-Status: GOOD (  10.22  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org,
 Elvira Khabirova <lineprinter@altlinux.org>, linux-kernel@vger.kernel.org,
 linux-audit@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181109031713.FdS_VWFY-8IfqkbcHdqIP6Lxs3u3eIliBI-p77GuNxY@z>

syscall_get_arch() is required to be implemented on all architectures
that use tracehook_report_syscall_entry() in order to extend
the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.

Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
---
 arch/riscv/include/asm/syscall.h | 6 ++++++
 include/uapi/linux/audit.h       | 1 +
 2 files changed, 7 insertions(+)

diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index 8d25f8904c00..7e1e26ca7317 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -18,6 +18,7 @@
 #ifndef _ASM_RISCV_SYSCALL_H
 #define _ASM_RISCV_SYSCALL_H
 
+#include <uapi/linux/audit.h>
 #include <linux/sched.h>
 #include <linux/err.h>
 
@@ -99,4 +100,9 @@ static inline void syscall_set_arguments(struct task_struct *task,
 	memcpy(&regs->a1 + i * sizeof(regs->a1), args, n * sizeof(regs->a0));
 }
 
+static inline int syscall_get_arch(void)
+{
+	return AUDIT_ARCH_RISCV;
+}
+
 #endif	/* _ASM_RISCV_SYSCALL_H */
diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index c4c8b131af48..ad4105c602a1 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -405,6 +405,7 @@ enum {
 /* do not define AUDIT_ARCH_PPCLE since it is not supported by audit */
 #define AUDIT_ARCH_PPC64	(EM_PPC64|__AUDIT_ARCH_64BIT)
 #define AUDIT_ARCH_PPC64LE	(EM_PPC64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
+#define AUDIT_ARCH_RISCV	(EM_RISCV|__AUDIT_ARCH_64BIT)
 #define AUDIT_ARCH_S390		(EM_S390)
 #define AUDIT_ARCH_S390X	(EM_S390|__AUDIT_ARCH_64BIT)
 #define AUDIT_ARCH_SH		(EM_SH)
-- 
ldv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
