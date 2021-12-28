Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22ADC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 06:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Rc6Bmsd12cYsJkzrU/j0NR13/IlrDhxv+sswEV6cvU=; b=bNVsCJMSRmuedi
	nT8tMB8orG6mbL+Zs6MuoG8L1sFlFFa2Ib0KJy/p7nPajLC6s3U7lw3fqXgqnAfn4d4HSYduIWMLX
	qMXGZIgo5OPClkCrP4aaf31EdHKXMjiRPG8/HcOpoRSL7e2wwHgGZJHoYYjYdvtHEcny2yaru6XM9
	deKvNe1+X+XAUdjXiP9s3QAPHH/Kf1r15+OWCGuzoxq+piH5MmgUl9hvsRGsoC+zM+0ZMHiwn2aL6
	RwpJBPC144Ru2TwJjidIbu5FhmV3AgYwaZBb4TPVK9Y5zHMdgB2/va4jB9GwE6X4GaLd2SqcfjVoE
	45VyMA6yv9m4MfmQ2G/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n26KY-000IuN-Tv; Tue, 28 Dec 2021 06:51:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n26He-000H5a-SW; Tue, 28 Dec 2021 06:48:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8EED8B81183;
 Tue, 28 Dec 2021 06:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D17C36AEB;
 Tue, 28 Dec 2021 06:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640674108;
 bh=VNmoFKw8R9K2OcmjmelDhRhySWO6Ih0fBU/Aljv4crs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p4P7PIVKeH9DRPDMaJHzgL9388gzhi6Jpx/12ZZaWUMeUmu0fZt7eygIyKX8iFEEp
 5V7Qm2P/0tUCPOllQQS5zGIKo1i9xBMYcEo0LwM4nRrc1GBp4jY0IknZCs8CW+b8aC
 +BWs1+cfSPC5J8+q7mLjVFtOZiazn965xbGrsrVnPhcbVr1Oo0pjsKAzECkfHZU1vW
 5oE6//VIWrFOJ7unJPtQolyyGtYFSHR++InYTtZ7ns6hf2rxEtLmmIRGM3fv3SKrIk
 WiGlzw3OZn26f4CGIp4O4kCTDg4moVXZYWKHXEQKA4j1miHCHincoRMHWP25QglKsk
 Oqsjqp5no8Bdg==
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
Subject: [PATCH V3 8/8] sched: mips: Remove unused TASK_SIZE_OF
Date: Tue, 28 Dec 2021 14:47:29 +0800
Message-Id: <20211228064730.2882351-9-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228064730.2882351-1-guoren@kernel.org>
References: <20211228064730.2882351-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_224831_108319_892D3ED6 
X-CRM114-Status: UNSURE (   7.91  )
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
 arch/mips/include/asm/processor.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/include/asm/processor.h b/arch/mips/include/asm/processor.h
index 4bb24579d12e..8871fc5b0baa 100644
--- a/arch/mips/include/asm/processor.h
+++ b/arch/mips/include/asm/processor.h
@@ -61,9 +61,6 @@ extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src
 #define TASK_SIZE (test_thread_flag(TIF_32BIT_ADDR) ? TASK_SIZE32 : TASK_SIZE64)
 #define STACK_TOP_MAX	TASK_SIZE64
 
-#define TASK_SIZE_OF(tsk)						\
-	(test_tsk_thread_flag(tsk, TIF_32BIT_ADDR) ? TASK_SIZE32 : TASK_SIZE64)
-
 #define TASK_IS_32BIT_ADDR test_thread_flag(TIF_32BIT_ADDR)
 
 #endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
