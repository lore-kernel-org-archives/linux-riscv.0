Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2928C636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 14:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTpgQoJTh8FKgaRBbf99VI9lTz5gy/ZC2VITdB6kUIg=; b=gQEk26Qy3bD2Rv
	MYUHzCCp5L+TQ/0ixgNDWaDPtq87vcVC8PxKNSWlCZHy2p76YHTE4v/r9KY83jCDWjboR1R83Ly+D
	ZdOHrFo9CTxrtkafp8z8M3rmdTKLxPX7FwbDnXbwXGhvkHINslm18WpwHNJ52SLUEMBSf5hXxDJQE
	R3FqR6lIBQ98QMIMm+0VHUY5XLm5TBtSPUUCPNzIbmP7LQBqDk86Q+XpddJRtW/lBGjYIyjXchKB/
	QR9NjprRhx2Mhf0Ll8LEVadgVGMXZUtMYHEYPalK67MUTXL9nYKTV5+ZScLAEG0+acbeIEOStlfFD
	qqvHv2YT7NPxXq3nUqXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJ9w-006HMl-1h; Wed, 15 Feb 2023 14:53:24 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJ9t-006HLk-CO
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 14:53:22 +0000
Received: by mail-wr1-x433.google.com with SMTP id r2so19418789wrv.7
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 06:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FW33dZcmgamFLHOTdXPHNpGgKYwkutrhlJjCm0kdncM=;
        b=6f34A81AdUxOH0WhwVsAvnd7QnICuPh2mkx2g5yciHqCqPGB4OLnzv6jky6q1O/hfm
         U8F+RjNXec7Y3q/+PaEfH5Gy/8JiPNBVK+ekDTDUwVbuHxDvJY2pBvK+7o3JLJYKBeVc
         +3bZj2WL+kSOUhvYVXJeDXUBE/x1YUhkmTJa1BP/fJrk3Upr2bOataEn5EsQDgE7Al0l
         p/MwLupVTscio/uIUYgKKQNBp2N8PnioSN8WwCs3TQ+r0TJf5OikyF5qKuiiV1kwRMsT
         38ZAAhCzhyz2clBQG8uC/c7VjaxqSlOcpzoWyNMmtBvZfPDu2mzkVHsF2Oz4Z87rstpo
         ecJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FW33dZcmgamFLHOTdXPHNpGgKYwkutrhlJjCm0kdncM=;
        b=lllSEQEnqSv3EaQ6PKGN5UEpbIQbUdcFZF4XnFPsTX30NCn5ocAr12IbPTZS+hlOCj
         mGTVwoirf8To2DOT8DUShnz92kEk9e2O/dIo9w7CSRVCjzkajH3B56wRoV38Gi3qNTwq
         LIVUaj5oajpfl4g9/A8ECOVqysGwjPUMCpolEQTnKbfecvyar5I9e03NZiz9/Hz8XHdW
         f2wiq17iWUdekypMytFWdwryowJKv4LQBZZIcr2zQlnULbFS31mAcH12X7MEwzZoEcJZ
         YLGc7bB7uH4hPFrYBN6vjt9lo4b0ZSW7DZVoNGdDtRT2u1qFQfSh3GvK2naeQS9DW7Ba
         UZtQ==
X-Gm-Message-State: AO0yUKWgrlvBTs2F5zZeQn/1TDzG1gCN8oRkeueXQIBBqPLmemssInUO
	jXM9SDGaOM63vhtk8HdWZi6bfg==
X-Google-Smtp-Source: AK7set/WnuTHm92+t20uOay6ITH6KB/xE4G2qx8LvXnqLdm4L7GdGScfCmsVgnF5z780Nk79xDddFQ==
X-Received: by 2002:a5d:404c:0:b0:2c5:5881:be0f with SMTP id w12-20020a5d404c000000b002c55881be0fmr1904111wrp.25.1676472797736;
        Wed, 15 Feb 2023 06:53:17 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id u13-20020a5d514d000000b002c3f50228afsm15411785wrt.3.2023.02.15.06.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 06:53:17 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Zong Li <zong.li@sifive.com>
Subject: [PATCH 2/4] riscv: Dump out kernel offset information on panic
Date: Wed, 15 Feb 2023 15:51:11 +0100
Message-Id: <20230215145113.465558-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230215145113.465558-1-alexghiti@rivosinc.com>
References: <20230215145113.465558-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_065321_439615_8E95FC41 
X-CRM114-Status: GOOD (  10.26  )
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

Dump out the KASLR virtual kernel offset when panic to help debug kernel.

Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/setup.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 86acd690d529..d33065f4c084 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -20,6 +20,7 @@
 #include <linux/smp.h>
 #include <linux/efi.h>
 #include <linux/crash_dump.h>
+#include <linux/panic_notifier.h>
 
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
@@ -330,3 +331,27 @@ void free_initmem(void)
 
 	free_initmem_default(POISON_FREE_INITMEM);
 }
+
+static int dump_kernel_offset(struct notifier_block *self,
+			      unsigned long v, void *p)
+{
+	pr_emerg("Kernel Offset: 0x%lx from 0x%lx\n",
+		 kernel_map.virt_offset,
+		 KERNEL_LINK_ADDR);
+
+	return 0;
+}
+
+static struct notifier_block kernel_offset_notifier = {
+	.notifier_call = dump_kernel_offset
+};
+
+static int __init register_kernel_offset_dumper(void)
+{
+	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE))
+		atomic_notifier_chain_register(&panic_notifier_list,
+					       &kernel_offset_notifier);
+
+	return 0;
+}
+device_initcall(register_kernel_offset_dumper);
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
