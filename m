Return-Path: <SRS0=3Ayx=L2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A043BC11F68
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 04:45:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DC346141A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 04:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DC346141A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xFYyp/1IpUAImuvpeksLNPJJinsjt4H7KF+rScalewQ=; b=VA2yVDziVHCE3S
	UHVTDCJ5zFENrIspurqInXjGCT5brIflIo+hSO5Z9z/TMIiWy1qoqpPQJNDpuZUEW+ncb9UN7J/ij
	76nTq0nOGWLvoL7HB1TTgKLPVy4hwCAPCBB6TS7EJqa2l/GlQJD1FxuehkQAlGRIUSyNIsqta0hMV
	yxglev8/ifth2FXlu5xxHMNEEADVQT7IZpc+Fjj7JpBoRKFWSH+PPP4oPVEg9s+t7fa3miq8/LBaA
	NX885RHk/52TPHRqq3LyQH0EcFxGcXU6+JQnSnoAnuEmP7uH7W7Y0Lq9PFMjq7kAL090qw/MSX6Vs
	yirtlor0plmWY5VMlRhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzB30-0025Zz-AP; Fri, 02 Jul 2021 04:45:02 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzB2w-0025Xy-Oz
 for linux-riscv@lists.infradead.org; Fri, 02 Jul 2021 04:45:00 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GGMqQ1qS6zZkDR;
 Fri,  2 Jul 2021 12:41:38 +0800 (CST)
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 12:44:46 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm000001.china.huawei.com (7.185.36.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 12:44:45 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: <palmerdabbelt@google.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tong
 Tiangen" <tongtiangen@huawei.com>
Subject: [PATCH -next] riscv: Implement thread_struct whitelist for hardened
 usercopy
Date: Fri, 2 Jul 2021 04:54:21 +0000
Message-ID: <20210702045422.3527469-1-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm000001.china.huawei.com (7.185.36.245)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_214459_032992_21DC0FA0 
X-CRM114-Status: UNSURE (   9.21  )
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

This whitelists the FPU register state portion of the thread_struct for
copying to userspace, instead of the default entire struct.

Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 arch/riscv/Kconfig                 | 1 +
 arch/riscv/include/asm/processor.h | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 821081bdb8b8..5c26c0726944 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -70,6 +70,7 @@ config RISCV
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
+	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_CONTEXT_TRACKING
 	select HAVE_DEBUG_KMEMLEAK
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 021ed64ee608..46b492c78cbb 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -37,6 +37,14 @@ struct thread_struct {
 	unsigned long bad_cause;
 };
 
+/* Whitelist the fstate from the task_struct for hardened usercopy */
+static inline void arch_thread_struct_whitelist(unsigned long *offset,
+						unsigned long *size)
+{
+	*offset = offsetof(struct thread_struct, fstate);
+	*size = sizeof_field(struct thread_struct, fstate);
+}
+
 #define INIT_THREAD {					\
 	.sp = sizeof(init_stack) + (long)&init_stack,	\
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
