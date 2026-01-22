Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A88C44536
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 07:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:To:From:Cc:Mime-Version:
	Message-Id:Subject:Date:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TjRwKqAye+o5AuzLV662OK2I2ICsvudJpet9xN25A4o=; b=jz4wgFdRBZqAUk
	6dCHeAXULmBqS44BL4lykkiWIBDzjK3gjD92bLVa5afpkadKbR1tcmNtE55yacKRZMODihkTXcpRC
	3Hkf9fp4ms/SkmaNjV5mzTKWOEVCtioVoFGt+H6Uy581hSFbxg5mzUdSGb6K3KYv6BLS4Uj3X8GS7
	2fxLsfE75WbJP4vaWL7ilipU8okbsJ5fzTBTrSF5QwuZ+mRGa3Haefzo2nNtXmrT+69TcXlSxzoCD
	K8+2+LwTq/dLKta8WPQya3R0fK7yZmEO/ErY+Qh3fMCeIr5QyKbDCl8tFz+Yk1IrBX4VjgRt1cgRr
	IvQmDVSGVWIKdfhMs1gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipDh-00000006aPo-0wPh;
	Thu, 22 Jan 2026 07:35:09 +0000
Received: from sg-1-31.ptr.blmpb.com ([118.26.132.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipDe-00000006aOJ-14Lf
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 07:35:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=picoheart-com.20200927.dkim.feishu.cn; t=1769067297;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=+g/3tjO+rV9WYb2Jh/rm5GHV4Veu7YSdogQYF3BcWcg=;
 b=wNQzGcVgLadD5kvUkSUhWc45cDCxqGNGk6kd/+Wz0BUSIemBHHh9+csbwE5Lol9hTFdnSx
 lnDZNlRR+79edruORKpTgTilX5NN3Df7nP4eDQjYgLTtpB2k7e+A3mO3k35LX2QkuYGqfq
 +HYh0Z6Mj8kSsz4CygQGQGIsuN/U9Jfa/UqKNGfb3YLrzCZgboO/lo9jqP4qz/u0vMPzIu
 dEM0lIys8QnUps1Lcltctl6o2i2Yrt0O5QcBr33LcrzqoQdqA2ur8uLOgJKS2xrcOBJ4vl
 QC1TbrPduy45WUvBIN30u0XxrjloAjEMU8p58mzFrI29VsImUHE+9/Z5vYaoSg==
References: <20260122073446.45628-1-yang.yicong@picoheart.com>
Date: Thu, 22 Jan 2026 15:34:46 +0800
X-Lms-Return-Path: <lba+26971d31f+4fdaaa+lists.infradead.org+yang.yicong@picoheart.com>
Subject: [PATCH 2/2] init: Move console_on_rootfs after async_synchronize_full
Message-Id: <20260122073446.45628-3-yang.yicong@picoheart.com>
Mime-Version: 1.0
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Cc: <akpm@linux-foundation.org>, <apatel@ventanamicro.com>, <pjw@kernel.org>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<geshijian@picoheart.com>, <weidong.wd@picoheart.com>, 
	<yang.yicong@picoheart.com>, <linux-acpi@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Received: from G9WYR9K0VW ([58.250.122.114]) by smtp.feishu.cn with ESMTPS; Thu, 22 Jan 2026 15:34:54 +0800
X-Mailer: git-send-email 2.50.1
To: <rafael@kernel.org>, <lenb@kernel.org>, <tglx@kernel.org>, 
	<gregkh@linuxfoundation.org>, <dakr@kernel.org>
In-Reply-To: <20260122073446.45628-1-yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_233506_500231_EB867B49 
X-CRM114-Status: GOOD (  11.42  )
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

Currently the console_on_rootfs() is called before
async_synchronize_full(), the console initialization
could be still in process in theory due to async
probe, etc. Make it after the async_synchronize_full()
to make sure the initialization work is done.

Log the error code as well if we failed to open the console.

Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
---
 init/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/init/main.c b/init/main.c
index b84818ad9685..c37ba5f89b96 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1578,6 +1578,7 @@ static int __ref kernel_init(void *unused)
 	kernel_init_freeable();
 	/* need to finish all async __init code before freeing the memory */
 	async_synchronize_full();
+	console_on_rootfs();
 
 	system_state = SYSTEM_FREEING_INITMEM;
 	kprobe_free_init_mem();
@@ -1647,7 +1648,7 @@ void __init console_on_rootfs(void)
 	struct file *file = filp_open("/dev/console", O_RDWR, 0);
 
 	if (IS_ERR(file)) {
-		pr_err("Warning: unable to open an initial console.\n");
+		pr_err("Warning: unable to open an initial console, err = %ld\n", PTR_ERR(file));
 		return;
 	}
 	init_dup(file);
@@ -1690,7 +1691,6 @@ static noinline void __init kernel_init_freeable(void)
 	kunit_run_all_tests();
 
 	wait_for_initramfs();
-	console_on_rootfs();
 
 	/*
 	 * check if there is an early userspace init.  If yes, let it do all
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
