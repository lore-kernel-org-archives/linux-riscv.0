Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F563C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jun 2022 03:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NQLQYM/cKFLlZsUIJOw/0bSM90di1PCOjlTyagq7f/4=; b=PGpqX89E5CzV+P
	nhjYdY6IJd3lcZU+24eXFulHmLfue6wUSk+5jKCouL3hcCGgslkCzWotZbsSpmw6XuAov5+i7hX3H
	ZXOeHbIb22psWcPnpsEkpKCvlEGYXw3ON7b2lim1C/4eamlPxq/P+RSzyVx5WF9Tcx5JghD2yoYjt
	jwgr4uf0gCJmQCG4Y6b9prftKORYrnHiUTESfu8Fx806nyLrgu+7Tswy55kZA5nZU9TyzXkKWdyPD
	R3fmYncWAPCUIMFGIkpERlmOnLeRXfBKSSGTNxSzw9vURCD/yDqOiQc5t4wmIWr8BDM8uyqsWlc5X
	8Cq5Ft1aC7kGWJSHBijQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny3rN-00GdxX-5X; Mon, 06 Jun 2022 03:56:57 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny3rK-00GdwX-IX
	for linux-riscv@lists.infradead.org; Mon, 06 Jun 2022 03:56:56 +0000
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LGfmq2KDvzKmJG;
	Mon,  6 Jun 2022 11:56:27 +0800 (CST)
Received: from M910t (10.110.54.157) by kwepemi500013.china.huawei.com
 (7.221.188.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 6 Jun
 2022 11:56:42 +0800
Date: Mon, 6 Jun 2022 11:56:35 +0800
From: Changbin Du <changbin.du@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Changbin Du <changbin.du@gmail.com>, Hui Wang <hw.huiwang@huawei.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<changbin.du@huawei.com>
Subject: [PATCH] riscv: kexec: build
 {kexec_relocate,crash_save_regs,machine_kexec}.c as kexec core files
Message-ID: <20220606035635.o52ja3bjpru3fqcf@M910t>
MIME-Version: 1.0
Content-Disposition: inline
X-Originating-IP: [10.110.54.157]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500013.china.huawei.com (7.221.188.120)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_205654_824292_D2E3165F 
X-CRM114-Status: UNSURE (   7.77  )
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

This fixes below linking errors when building with CONFIG_KEXEC_FILE=y &&
CONFIG_KEXEC=n. The {kexec_relocate,crash_save_regs,machine_kexec}.c should
be core kexec source files.

riscv64-linux-gnu-ld: kernel/kexec_core.o: in function `kimage_free':
/home/changbin/work/linux-riscv/kernel/kexec_core.c:651: undefined reference to `machine_kexec_cleanup'
riscv64-linux-gnu-ld: kernel/kexec_core.o: in function `__crash_kexec':
/home/changbin/work/linux-riscv/kernel/kexec_core.c:981: undefined reference to `machine_crash_shutdown'
riscv64-linux-gnu-ld: /home/changbin/work/linux-riscv/kernel/kexec_core.c:982: undefined reference to `machine_kexec'
riscv64-linux-gnu-ld: kernel/kexec_core.o: in function `crash_setup_regs':
/home/changbin/work/linux-riscv/./arch/riscv/include/asm/kexec.h:35: undefined reference to `riscv_crash_save_regs'
riscv64-linux-gnu-ld: kernel/kexec_core.o: in function `kernel_kexec':
/home/changbin/work/linux-riscv/kernel/kexec_core.c:1200: undefined reference to `machine_shutdown'
riscv64-linux-gnu-ld: /home/changbin/work/linux-riscv/kernel/kexec_core.c:1204: undefined reference to `machine_kexec'
riscv64-linux-gnu-ld: kernel/kexec_file.o: in function `__do_sys_kexec_file_load':
/home/changbin/work/linux-riscv/kernel/kexec_file.c:363: undefined reference to `machine_kexec_prepare'
riscv64-linux-gnu-ld: /home/changbin/work/linux-riscv/kernel/kexec_file.c:363: undefined reference to `machine_kexec_prepare'
make: *** [Makefile:1160: vmlinux] Error 1

Signed-off-by: Changbin Du <changbin.du@huawei.com>
---
 arch/riscv/kernel/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index c71d6591d539..33bb60a354cd 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -78,7 +78,7 @@ obj-$(CONFIG_SMP) += cpu_ops_sbi.o
 endif
 obj-$(CONFIG_HOTPLUG_CPU)	+= cpu-hotplug.o
 obj-$(CONFIG_KGDB)		+= kgdb.o
-obj-$(CONFIG_KEXEC)		+= kexec_relocate.o crash_save_regs.o machine_kexec.o
+obj-$(CONFIG_KEXEC_CORE)	+= kexec_relocate.o crash_save_regs.o machine_kexec.o
 obj-$(CONFIG_KEXEC_FILE)	+= elf_kexec.o machine_kexec_file.o
 obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
 
-- 
2.26.2


-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
