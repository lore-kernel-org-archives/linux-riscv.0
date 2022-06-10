Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D59C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 03:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sucuRMqLJDNdyh965RurGsm0DYKGKnOuU3iZMIOz1YM=; b=Lj2QQ11zww35kK
	Ty3Ns6T4zzpmW6mW/nuJME98r2TfECwsu2E6v6j6jKelHGYT1Si8BdfhKMnLB0XK94zQs2XrNB8bi
	gjxF3SVY3h3AUmerPJr+Dfl1eT3zdZbOyzHmDgifSvZrMfrmEaO9pudtMYmewe2v3HW6xDm2eal8d
	9uZI5zgZ66wbaz3iykutxDX1YSRI2lAzQATjV4mtNR/f/Ow67qPa1l1iFxHEtS4z7Lm76qjd7wVZ2
	TEDfgM5ZQI8ZF9Bb8dfio/TtE4AbXjEJdwd+ajmgsZSeK258xKE7bZYZP3AzmWPuFUOZtt97cmeTd
	LHEiRtaVtKF5iF4O+iBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzVbf-005WuM-QH; Fri, 10 Jun 2022 03:46:43 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzVbc-005WoM-D7
	for linux-riscv@lists.infradead.org; Fri, 10 Jun 2022 03:46:42 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LK6KN4GnJz1K9BP;
	Fri, 10 Jun 2022 11:44:40 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 10 Jun 2022 11:46:31 +0800
Received: from huawei.com (10.67.174.33) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 10 Jun
 2022 11:46:31 +0800
From: "GONG, Ruiqi" <gongruiqi1@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Liao Chang
	<liaochang1@huawei.com>, Li Zhengyu <lizhengyu3@huawei.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Wang
 Weiyang" <wangweiyang2@huawei.com>, Gong Ruiqi <gongruiqi1@huawei.com>
Subject: [PATCH] RISC-V: Fix a linkage error related to CONFIG_KEXEC{,_FILE}
Date: Fri, 10 Jun 2022 19:46:59 +0800
Message-ID: <20220610114659.1506718-1-gongruiqi1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.33]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_204640_642414_0C1AD89B 
X-CRM114-Status: UNSURE (   8.93  )
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

Following files (currently compiled with CONFIG_KEXEC=y) are needed to
be linked with kernel/kexec_core.o (compiled with CONFIG_KEXEC_CORE=y):

  arch/riscv/kernel/kexec_relocate.o,
  arch/riscv/kernel/crash_save_regs.o,
  arch/riscv/kernel/machine_kexec.o

But CONFIG_KEXEC_CORE can also be selected by CONFIG_KEXEC_FILE
regardless of CONFIG_KEXEC, which causes the problem as the Link
specifies.

Fix this problem by changing the controling config of the above
arch/riscv/kernel/*.o to be CONFIG_KEXEC_CORE, as how some other
architectures do.

Link: https://lore.kernel.org/all/202206100324.B0KDSd1C-lkp@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
Fixes: 6261586e0c91 ("RISC-V: Add kexec_file support")
Signed-off-by: GONG, Ruiqi <gongruiqi1@huawei.com>
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
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
