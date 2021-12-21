Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D84CC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 17:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2PN2ddSWctY8o9dbq+ryCZ0kcUfDDjWTv673t4fUg70=; b=kgJVbowxp4wWnU
	JWGyyVE7a21DZ5dV6UWl8jEfWl9JX063qvSR8BPqKy1VdAlHi0FY4tvSZCm459axhzksrWQ97JG9p
	qiSh3UZZR1sn8wzf7CUHhCgz7ceN1jjALQwpPiP+0dwqFN9O9S+LdaiKWL1y+F4kkCziNsTtyWS1x
	yyTUc7mn2Nazj5Wm/rqqPaqjyGztR722yLXpu5TmNoxC34Aqj8rmpz0/UfbxEarY4goYS/ssWPMVy
	pKW34XvzZOV0vHLkvi59OodwXyLVPOCXa/sSYkL3/Oz2WAmzxTemXrwsT3GX/ROkgqa6rH6v9VWyz
	2X0+uIBrXEOrqUQcgflA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzifh-007jcF-Vm; Tue, 21 Dec 2021 17:11:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mziWD-007f8a-0t; Tue, 21 Dec 2021 17:01:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 905726168F;
 Tue, 21 Dec 2021 17:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D3CC36AEA;
 Tue, 21 Dec 2021 17:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640106100;
 bh=yebEHrXO3xitrmPY1eiCj8/ZZmBcRpO1kVVqCIUFCmY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jVZs0brlicBeWTJT6gUoU+0VOX9gAZ1AaW+R7u29v8MChfsAAZ3n5+IwWbugSO6H+
 /Rjk+nONgaTYZyeF/JvoV0kLHWyupDaNTnHSRgDH3ds8LLKOZbR+MzQSPvgUQZ/xRg
 GAdVS+eSR9bBsQMgJJwgZuvSSRGLTZ8P0fa5gxa1k+3FRa1X7qSSVS3NSVmbZh6WTE
 BUUeBfzRDBVoUac59kIPNLbSU87LzcWMwQLutIw9I85D0mUa3CLqiw+/yI9QxFuQ5w
 g3ip6oo/gDqNGG9xSDLIG93lSBwga8tqITI+VYAtVYnCnY0RaQNRTaIAN9PWY2G2I/
 8+0EqwaqjbWaA==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.or,
 linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 7/8] sched: arm64: Remove unused TASK_SIZE_OF
Date: Wed, 22 Dec 2021 01:00:56 +0800
Message-Id: <20211221170057.2637763-8-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221170057.2637763-1-guoren@kernel.org>
References: <20211221170057.2637763-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_090141_199102_3F7C457D 
X-CRM114-Status: UNSURE (   8.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

This macro isn't used in Linux sched, now. Delete in
include/linux/sched.h and arch's include/asm.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/arm64/include/asm/processor.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index 6f41b65f9962..d24dfb49237d 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -65,8 +65,6 @@
 #endif /* CONFIG_ARM64_64K_PAGES */
 #define TASK_SIZE		(test_thread_flag(TIF_32BIT) ? \
 				TASK_SIZE_32 : TASK_SIZE_64)
-#define TASK_SIZE_OF(tsk)	(test_tsk_thread_flag(tsk, TIF_32BIT) ? \
-				TASK_SIZE_32 : TASK_SIZE_64)
 #define DEFAULT_MAP_WINDOW	(test_thread_flag(TIF_32BIT) ? \
 				TASK_SIZE_32 : DEFAULT_MAP_WINDOW_64)
 #else
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
