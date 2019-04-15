Return-Path: <SRS0=fYgv=SR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518E1C10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 12:16:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2162520645
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 12:16:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mw6fOzGA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="V659ZK1U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2162520645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:From:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bGW3MYtgWDW2Z7eGs61Pl7k+rXlTwnYBrjdRsxab3MY=; b=Mw6fOzGAwl31VA
	34aGEoEJXju+5BG8qdT65vdEjBZ+AUWhmrneKh0ulRzkErOxJp+1wOvAABc4lskJVRxKkmuhut53X
	cGZKHr3EDDTdZ1HTwITlKtu2y13QUpP8lY4e7cj5eA0dPE0kW/UFw2WBLGFrn1OfS54Rv97+flxa/
	aaNKCj4ha1RpGZfBCGWq7LcEnfjI940koX4zs7gBKQB2v9d8+N3faqIA1v96d9lYogOAcbeW8F0DK
	GZYfjffLlEisMrpirTJTznbQC6WynwcXi+PUGnlbFfvfV2pMER8TvYMtppTdZcH7yMJhnQ0J9f4z5
	lBXi1FigNtHl18C3N5gA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hG0Wp-0004BI-Jx; Mon, 15 Apr 2019 12:16:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hG0WM-0003cN-OZ
 for linux-riscv@lists.infradead.org; Mon, 15 Apr 2019 12:15:45 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E627B218D3;
 Mon, 15 Apr 2019 12:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555330534;
 bh=i98U/XTllCRphQh5oVhFu/+Q/bjEO+c6/eOK5j3jL+0=;
 h=Subject:To:Cc:From:Date:From;
 b=V659ZK1U2ikRrH8utBKx/Qhe1Jj4YatPL96rBzbeXnApG6O65ZFdDhvJDNVAf4JWl
 JWCHddqZY3IL+fRk4Za4U6TzozJQdijv6f0Rj4vOlCJbQZdd6Ns3kV6ygDZ0lUDkax
 1rRBejIc+bi33aa91zm5Kox6GoqwqDWD8eZqSTy8=
Subject: Patch "riscv: Fix syscall_get_arguments() and
 syscall_set_arguments()" has been added to the 5.0-stable tree
To: 20190329171221.GA32456@altlinux.org, aou@eecs.berkeley.edu,
 gregkh@linuxfoundation.org, keescook@chromium.org, ldv@altlinux.org,
 linux-riscv@lists.infradead.org, luto@amacapital.net, mingo@redhat.com,
 palmer@sifive.com, rostedt@goodmis.org, wad@chromium.org
From: <gregkh@linuxfoundation.org>
Date: Mon, 15 Apr 2019 14:14:54 +0200
Message-ID: <1555330494148141@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_051535_299471_11F9E297 
X-CRM114-Status: GOOD (  10.53  )
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


This is a note to let you know that I've just added the patch titled

    riscv: Fix syscall_get_arguments() and syscall_set_arguments()

to the 5.0-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     riscv-fix-syscall_get_arguments-and-syscall_set_arguments.patch
and it can be found in the queue-5.0 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 10a16997db3d99fc02c026cf2c6e6c670acafab0 Mon Sep 17 00:00:00 2001
From: "Dmitry V. Levin" <ldv@altlinux.org>
Date: Fri, 29 Mar 2019 20:12:21 +0300
Subject: riscv: Fix syscall_get_arguments() and syscall_set_arguments()

From: Dmitry V. Levin <ldv@altlinux.org>

commit 10a16997db3d99fc02c026cf2c6e6c670acafab0 upstream.

RISC-V syscall arguments are located in orig_a0,a1..a5 fields
of struct pt_regs.

Due to an off-by-one bug and a bug in pointer arithmetic
syscall_get_arguments() was reading s3..s7 fields instead of a1..a5.
Likewise, syscall_set_arguments() was writing s3..s7 fields
instead of a1..a5.

Link: http://lkml.kernel.org/r/20190329171221.GA32456@altlinux.org

Fixes: e2c0cdfba7f69 ("RISC-V: User-facing API")
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Andy Lutomirski <luto@amacapital.net>
Cc: Will Drewry <wad@chromium.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Cc: stable@vger.kernel.org # v4.15+
Acked-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 arch/riscv/include/asm/syscall.h |   12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -79,10 +79,11 @@ static inline void syscall_get_arguments
 	if (i == 0) {
 		args[0] = regs->orig_a0;
 		args++;
-		i++;
 		n--;
+	} else {
+		i--;
 	}
-	memcpy(args, &regs->a1 + i * sizeof(regs->a1), n * sizeof(args[0]));
+	memcpy(args, &regs->a1 + i, n * sizeof(args[0]));
 }
 
 static inline void syscall_set_arguments(struct task_struct *task,
@@ -94,10 +95,11 @@ static inline void syscall_set_arguments
         if (i == 0) {
                 regs->orig_a0 = args[0];
                 args++;
-                i++;
                 n--;
-        }
-	memcpy(&regs->a1 + i * sizeof(regs->a1), args, n * sizeof(regs->a0));
+	} else {
+		i--;
+	}
+	memcpy(&regs->a1 + i, args, n * sizeof(regs->a1));
 }
 
 static inline int syscall_get_arch(void)


Patches currently in stable-queue which might be from ldv@altlinux.org are

queue-5.0/riscv-fix-syscall_get_arguments-and-syscall_set_arguments.patch

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
