Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49649C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Dec 2021 04:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v/YbMzPE+jxiYglxt85AT3ef2waMnpysGLiuL3e8tzo=; b=J98hvbkaXLGiS6
	Y3Vuy44K++0dP753+0LWvB5G2dnes9R2hNp+fxU49DIeZzs1hE2X6+bLIz7F0SmK+ev4m/FZJmt4o
	bzYpN+417tre/5mfTvHt8c+dJKLLcGrKzHluVxKqq4yhrws57we8rMSdyKxua/FNoNmGrxi9RFbE+
	nFXV/+OTObAJbcTobG1EhER9hsVkFkpag/DzEWUt2mJU75PUxQE7MC4K1Toxy4SS3UfTFMVfdMqgD
	POankmb3XHh8EI8+/wljQ3vYfEQB7Cg0mwKZ9ZtWypwu6mOtli4ooF7exN4ZLifE8DhRvKbS/qB08
	ihlEbwA4JFZjhQ49OdmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0z5j-00EdIK-N5; Sat, 25 Dec 2021 04:55:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0z5C-00Ed3J-6z; Sat, 25 Dec 2021 04:55:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B858160C72;
 Sat, 25 Dec 2021 04:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F74C36AED;
 Sat, 25 Dec 2021 04:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640408101;
 bh=D7/U3HVHnvdLiesri1jE7OLilV2Wekoh0yj4lEBJWbA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=byrTRC+8fxp8jHbj0YHIBTJx13ra9eI4+1+wqqb2XatoanHFeEnUAB5CPEexvwuwC
 RTxw6e8ibZfN8wvqdtxRQUqStPIviNR1tukjX6HSyvfiLGP/AcWEmF9o6gQ1cNUlMO
 MhUE6Ti6oGVKLse3OXbpvmnFWsABcjQVMue3COD79wkSU2vX77zDHRWbFBdiRLROu+
 JsbXlEXlUZPg82q/iMvMoN5Nw8lOaL5zFXNm4TEUS8KE+OSgZJX3403HFGX5C/d7WF
 BuopzUBs5cGJgVtZ8znSl2oVIZUcEZoIbWAwL6YU0MYms5CYlqeSGDbERbvQhYUEDP
 bln0VWBZohRhA==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, christophe.leroy@csgroup.eu
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.or,
 linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 2/8] sched: x86: Remove unused TASK_SIZE_OF
Date: Sat, 25 Dec 2021 12:54:24 +0800
Message-Id: <20211225045430.2868608-3-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211225045430.2868608-1-guoren@kernel.org>
References: <20211225045430.2868608-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_205502_342630_854DB437 
X-CRM114-Status: UNSURE (   7.87  )
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

This macro isn't used in Linux, now. Delete in
include/linux/sched.h and arch's include/asm.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/include/asm/page_64_types.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/include/asm/page_64_types.h b/arch/x86/include/asm/page_64_types.h
index e9e2c3ba5923..6191cf417c31 100644
--- a/arch/x86/include/asm/page_64_types.h
+++ b/arch/x86/include/asm/page_64_types.h
@@ -74,8 +74,6 @@
 					IA32_PAGE_OFFSET : DEFAULT_MAP_WINDOW)
 #define TASK_SIZE		(test_thread_flag(TIF_ADDR32) ? \
 					IA32_PAGE_OFFSET : TASK_SIZE_MAX)
-#define TASK_SIZE_OF(child)	((test_tsk_thread_flag(child, TIF_ADDR32)) ? \
-					IA32_PAGE_OFFSET : TASK_SIZE_MAX)
 
 #define STACK_TOP		TASK_SIZE_LOW
 #define STACK_TOP_MAX		TASK_SIZE_MAX
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
