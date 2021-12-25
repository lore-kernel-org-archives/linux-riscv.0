Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911BAC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Dec 2021 04:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/90QTpPQ6bWGTOIjuIgQ2AxXFUfUGy6tAmi+/VIyzOY=; b=fUSA1gGvct3r0z
	ICNam1m2qFXFirSW6GlfZ7oped0c9u3JXuJVYoD96cuD1sCS/IXT++1PTTxUySV9M2wXRF3WveUfn
	Zlj6Ae4KtIlHzXc6scf0sbgN8Yg6WFWMFAP3MdYgcJzcDlLdH0gEbQc+x5ZGN9DtJTN9y1Pi0yQQv
	sGkZfpFJU//kn3zFHnoZJ7kGMNg4BxPcWw0egVTkS3nEYypmsGgcww1oIxBr184hmbdtwH/HCMiCZ
	T26vDTKiviYlYvr6xxHHwLmDfdn6zNIcv2S/7fDlxncUJmhvL/vlYyApzpYHpYw1TBOx11wdc2TYg
	hpVBr9u8ZaWC0iz7Ee6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0z63-00EdR5-SX; Sat, 25 Dec 2021 04:55:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0z5G-00Ed4S-UN; Sat, 25 Dec 2021 04:55:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 716B1609ED;
 Sat, 25 Dec 2021 04:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB97FC36B02;
 Sat, 25 Dec 2021 04:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640408105;
 bh=RZHxDhGeVX15oaLNc4kx+vq7jlXyQAqs6QHL/XY/HJ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HBUzN/dAdq53By2AFjyJLl1rUToAPIE0DArdtg2/nQcxIbo2Jb3T2uQD9h6V/j4lD
 AO4KrkZ4eaF7bxV4pwuJO32Huq9luMfiaNEVYeguq1ne+OKSWWzZUNNCOT6cxHxrDx
 4JDLSz2JRUouJ9fKJYqyJKJvEuA9MfTfc6Zvk8XyN084gA0wgj6BswXD2r1Em3nWPh
 yechGLYta7pErAUHHEbq2C0fTrmRGMUusAWTOSbZOMW9bHLi8RnXR4j/w+G46CaIX6
 Dqv5PslHxbh88YCZyfjD1r6NBxa40/8zEDDYYj+vE0A0TeoQNT+g2bNBr7Pxe+Igwf
 sn/mteg33tFgw==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, christophe.leroy@csgroup.eu
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.or,
 linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 3/8] sched: sparc: Remove unused TASK_SIZE_OF
Date: Sat, 25 Dec 2021 12:54:25 +0800
Message-Id: <20211225045430.2868608-4-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211225045430.2868608-1-guoren@kernel.org>
References: <20211225045430.2868608-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_205507_114063_78167FE8 
X-CRM114-Status: UNSURE (   7.23  )
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
 arch/sparc/include/asm/processor_64.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/sparc/include/asm/processor_64.h b/arch/sparc/include/asm/processor_64.h
index ae851e8fce4c..628349fc4cdd 100644
--- a/arch/sparc/include/asm/processor_64.h
+++ b/arch/sparc/include/asm/processor_64.h
@@ -27,9 +27,6 @@
 #define VPTE_SIZE	(1 << (VA_BITS - PAGE_SHIFT + 3))
 #endif
 
-#define TASK_SIZE_OF(tsk) \
-	(test_tsk_thread_flag(tsk,TIF_32BIT) ? \
-	 (1UL << 32UL) : ((unsigned long)-VPTE_SIZE))
 #define TASK_SIZE \
 	(test_thread_flag(TIF_32BIT) ? \
 	 (1UL << 32UL) : ((unsigned long)-VPTE_SIZE))
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
