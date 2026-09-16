Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B90C88E77
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 19:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9kmjPFMLLWIP8fl3SFxAc7F73VT7ePUtCqkX/pYds98=; b=JAHab/NsUX3u+x
	zN5dqASBsrFYX9eT45WYmAeydZtmz5EIKtpiAo7na+7cCyuCzCMqIhknJR0l8WTB2vb0p0XFXID1W
	wbRvVkYqGE5yyQLCn9btUI2J3fHlCuMZsn4e6QJfcVONcZ4IBzVoyQyilmaeZEv445zASpcCBwnvE
	LSOGCeH5Ru80LwOdf5vaev2GX249+0zF9vEWeVZJphmtSewM2BT1q5b8buxR3bT4NHKuL6IDS1R5i
	SHHaRrs7CCVtI1QSzh41nBfipkXNNv4Wo3UyAA6pSCohgzbZRD6z0Iij4xUYysmFrudfACwcYH/O6
	UwzPBbwa4JgCoH4t0bKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YVS-00000007pWn-2tqY;
	Tue, 15 Sep 2026 19:07:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YVO-00000007pVw-2OFV
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 19:07:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82219152B;
	Tue, 15 Sep 2026 12:07:39 -0700 (PDT)
Received: from fedora (LJ9QCPV96V.austin.arm.com [10.118.150.127])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBB563F7B4;
	Tue, 15 Sep 2026 12:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789499263; bh=Nw/rrxVtJgyBbpfuY2oArZ6bQKwbS8jJxnE5J7+xsEw=;
	h=From:To:Cc:Subject:Date:From;
	b=ZjOEjkgI831pw6kfI5sMsGQwhOkS4iZarX5bntSa+rENICdie3QuKK2Ea5wDY7CSF
	 3t0SktW4jTWeQXAPlPPSV9UCXMe9+BEPd+aTMJU74Od1Szx3icwgFJfMrv0S+cP3vG
	 rnzEgsMWvB9lIyMN7jbuGksGumSTLFd/0XpEakkg=
From: Bill Roberts <bill.roberts@arm.com>
To: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>
Cc: jesse.huang@sifive.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Bill Roberts <bill.roberts@arm.com>
Subject: [RFC PATCH] riscv/usercfi: fix shadow stack locking argument
Date: Wed, 16 Sep 2026 04:32:26 -0500
Message-ID: <20260916093226.1524954-1-bill.roberts@arm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_120746_651315_72D5DCDB 
X-CRM114-Status: GOOD (  14.05  )
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

The API for arch_lock_shadow_stack_status, is that the argument contains
the feature bits one wants to lock, including support for unknown bits.

The API was documented in:
commit 91e102e79740 ("prctl: arch-agnostic prctl for shadow stack")

The current code expected the argument to be 0. That would mean nothing
is locked. Note that glibc has not merged the riscv support yet,
so now would be the time to correct this behavior.

See the patch series in question for glibc here:
Link: https://inbox.sourceware.org/libc-alpha/af2bbbac-5421-4b7c-af4b-4feb84b87629@foss.arm.com/

Signed-off-by: Bill Roberts <bill.roberts@arm.com>
---
RFC Notes:
I ONLY compile tested this. This was meant to strike up a conversation
on this before it gets baked into the kernel forever. Right now, seems
like the time to change that.


 arch/riscv/kernel/usercfi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index f027e6e05251..a688e3b942a8 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -440,10 +440,12 @@ int arch_lock_shadow_stack_status(struct task_struct *task,
 {
 	/* If shtstk not supported or not enabled on task, nothing to lock here */
 	if (!is_user_shstk_enabled() ||
-	    !is_shstk_enabled(task) || arg != 0)
+	    !is_shstk_enabled(task))
 		return -EINVAL;
 
-	set_shstk_lock(task, true);
+	/* transparently handle unknown bits, this is part of the API */
+	if (arg & PR_SHADOW_STACK_ENABLE)
+		set_shstk_lock(task, true);
 
 	return 0;
 }
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
