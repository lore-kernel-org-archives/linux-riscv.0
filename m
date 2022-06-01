Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B18C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 07:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lX5UMa/Ue2PHxJOKPLAU1K9gRL2IXzTfdNKZgT5ayuE=; b=OBCBMyDHMBGrm3
	3b4wKu9pK/iB2rU4tF8EAi3Z8WqQcRHtI9il+/L77aMjbxKrg8mv2ey/g9THsCqFTXFJfhgCFz6IV
	vO4B6S+u626N7b8IYLv5Qvpx8gFawTWt4ACOJG66LmvOMcwizAPsx0ui+hMLOV0hiEFZVEQ4/cwuX
	daOqHmw8/qBsYsyeaJB14sfbweFOJNeRaJyBifMHggMrHgztciUe2K0nXD/IZFn3xKXdxv0tSXIS2
	WKGt/5qu5tqFhNlBbqRwQOpo2JqVBm51DGezi18+Jk/9fXRBjdlC+sfrVVcXvOP/y5xSiNd6GAory
	SpbPGcTW5rlwp3NaNjJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwIOe-00EJNd-Pe; Wed, 01 Jun 2022 07:04:00 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwIOa-00EJMQ-JR; Wed, 01 Jun 2022 07:03:58 +0000
Received: from kwepemi500014.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LCg7Q5gDFz1K97R;
	Wed,  1 Jun 2022 15:02:10 +0800 (CST)
Received: from huawei.com (10.67.174.157) by kwepemi500014.china.huawei.com
 (7.221.188.232) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 1 Jun
 2022 15:03:49 +0800
From: Li Zhengyu <lizhengyu3@huawei.com>
To: <rdunlap@infradead.org>, <palmer@rivosinc.com>, <mick@ics.forth.gr>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<liaochang1@huawei.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <ebiederm@xmission.com>,
	<kexec@lists.infradead.org>, <linux-next@vger.kernel.org>
Subject: [PATCH] RISC-V: kexec: Fix build error without CONFIG_KEXEC
Date: Wed, 1 Jun 2022 15:02:04 +0800
Message-ID: <20220601070204.26882-1-lizhengyu3@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.157]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500014.china.huawei.com (7.221.188.232)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_000356_864404_E79D907E 
X-CRM114-Status: GOOD (  10.02  )
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

When CONFIG_KEXEC_FILE=y but CONFIG_KEXEC is not set:

kernel/kexec_core.o: In function `kimage_free':
kexec_core.c:(.text+0xa0c): undefined reference to `machine_kexec_cleanup'
kernel/kexec_core.o: In function `.L0 ':
kexec_core.c:(.text+0xde8): undefined reference to `machine_crash_shutdown'
kexec_core.c:(.text+0xdf4): undefined reference to `machine_kexec'
kernel/kexec_core.o: In function `.L231':
kexec_core.c:(.text+0xe1c): undefined reference to `riscv_crash_save_regs'
kernel/kexec_core.o: In function `.L0 ':
kexec_core.c:(.text+0x119e): undefined reference to `machine_shutdown'
kernel/kexec_core.o: In function `.L312':
kexec_core.c:(.text+0x11b2): undefined reference to `machine_kexec'
kernel/kexec_file.o: In function `.L0 ':
kexec_file.c:(.text+0xb84): undefined reference to `machine_kexec_prepare'
kernel/kexec_file.o: In function `.L177':
kexec_file.c:(.text+0xc5a): undefined reference to `machine_kexec_prepare'
Makefile:1160: recipe for target 'vmlinux' failed
make: *** [vmlinux] Error 1

These symbols should depend on CONFIG_KEXEC_CORE rather than CONFIG_KEXEC
when kexec_file has been implemented on RISC-V, like the other archs have
done.

Signed-off-by: Li Zhengyu <lizhengyu3@huawei.com>
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
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
