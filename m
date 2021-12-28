Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479B4C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 06:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJl1FR01LhkwIpxZ5TVvHE9enSdJmaJeM2+duawZNBQ=; b=qLu2iTpmwYhtNN
	V4oty2gmJ0f7wblSS+yTzPFTumeJ0hCWoaiA0+EDzF7Ok0ct9o2OsA+4Cs6Uy+nJ6ejIiWYeib/h3
	UGEJKKnVeLwzlRptBRE6tm3yRRHblYtjaatYeFX6NVgc5zb4LGqKCxkLpziuN8TOz+Evwzdd2DLJe
	UyAsjF6kbCPS4AQGsiYg/ORR12YGOaPATHEefbWNMReDKdMoEJM37NnBsCiYaj26T0Oe0Wf4f0bBF
	iWqJ9zNGvjBx9+3j7YXNvGN3iGpYMuSgoEKdBwZRKeOIX0c4sSArkcYiBim2CqPa/oD7IbliQ3syT
	OqOkgF5zVK1aWsckKvlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n26IF-000HRk-LW; Tue, 28 Dec 2021 06:49:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n26HF-000GqW-83; Tue, 28 Dec 2021 06:48:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DD3CAB81181;
 Tue, 28 Dec 2021 06:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593AEC36AEE;
 Tue, 28 Dec 2021 06:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640674083;
 bh=kTZEcBT+5Go5nfuBUtuREshHd2md+mgqYEFXzNe9sc4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ze8+mzJqajnqM9co8JY/atNts1gRA0tZfEN7BsA4AY8+sT8Q7kOmEYDa0+0WK2j5L
 mxgsj1WP+WkS2V934Bpk4Az5id6zrCQx++knOyRk+24rAvhxftRconCsTV4425VgIo
 QN8XZnHAXF8Hp3NQ94uuXtt3ELe7WmFrSRLsRitk8jRkYKT/dytLroQoy5HaIIq/Z7
 0ZSvrKgSZwk7EqjCDOcD4M0la8Cgt0KJAr5l+1jSOqljbNiStWsFMNOYQCjkKS+lWu
 +1z8oiRGIAvdTvZgElLxzeZQcdNCBj0DU+XBUJCrpO3Flqw8tjQkNTRUDZM2guOdaX
 BFzVW3J3lJCtw==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, christophe.leroy@csgroup.eu,
 hca@linux.ibm.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.or,
 linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 4/8] sched: powerpc: Remove unused TASK_SIZE_OF
Date: Tue, 28 Dec 2021 14:47:25 +0800
Message-Id: <20211228064730.2882351-5-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228064730.2882351-1-guoren@kernel.org>
References: <20211228064730.2882351-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_224805_493569_C4EEAAE8 
X-CRM114-Status: UNSURE (   9.09  )
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
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/include/asm/task_size_64.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/task_size_64.h b/arch/powerpc/include/asm/task_size_64.h
index c993482237ed..38fdf8041d12 100644
--- a/arch/powerpc/include/asm/task_size_64.h
+++ b/arch/powerpc/include/asm/task_size_64.h
@@ -44,11 +44,7 @@
  */
 #define TASK_SIZE_USER32 (0x0000000100000000UL - (1 * PAGE_SIZE))
 
-#define TASK_SIZE_OF(tsk)						\
-	(test_tsk_thread_flag(tsk, TIF_32BIT) ? TASK_SIZE_USER32 :	\
-						TASK_SIZE_USER64)
-
-#define TASK_SIZE TASK_SIZE_OF(current)
+#define TASK_SIZE (is_32bit_task() ? TASK_SIZE_USER32 : TASK_SIZE_USER64)
 
 #define TASK_UNMAPPED_BASE_USER32 (PAGE_ALIGN(TASK_SIZE_USER32 / 4))
 #define TASK_UNMAPPED_BASE_USER64 (PAGE_ALIGN(DEFAULT_MAP_WINDOW_USER64 / 4))
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
