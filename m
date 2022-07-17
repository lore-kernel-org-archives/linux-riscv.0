Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35ABC43334
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jul 2022 04:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IY2M5cBuu3ss85E9ouyT1Q9pcAoTjv538U/F4liVSRE=; b=GUleN1g1BM/f8/
	aYm8yaTVoRB2LYB2cgxUsX9Q/J3fYYevr5gzHquuh4YfqqteZIM+6DIZ2yes8KqpA4S+Y6+tUfUP7
	RLjmN6HR2wuoKG7cj+uzG7/+zUveqZovQFWXL7gMHuQa2DlBmEfst4/RO/WjZGUFyk1GKuzyS/+q1
	wRWR0mHSZ1rD/R8M1zC9ns0SuZ5eTe3hW1MM1s6SSw8A18mlsJQfr0V/7EobDWsCxsnjbRPxG48bh
	Z45UeyzOdXyW4PO0Uzx/sz5Ot5noVQVDmsipCjF0zHM318OBAL/8GZdAMy9ttHb1rF4jE2RpA4DuT
	3WsB8YPkgJ35pbJe+FsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCvuc-0040A7-89; Sun, 17 Jul 2022 04:29:46 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCvuY-00404w-Kx
	for linux-riscv@lists.infradead.org; Sun, 17 Jul 2022 04:29:45 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R841e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0VJWzxAP_1658032171;
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VJWzxAP_1658032171)
          by smtp.aliyun-inc.com;
          Sun, 17 Jul 2022 12:29:32 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: crash-utility@redhat.com,
	mick@ics.forth.gr,
	heinrich.schuchardt@canonical.com,
	guoren@kernel.org,
	k-hagio-ab@nec.com
Cc: linux-riscv@lists.infradead.org,
	hschauhan@nulltrace.org,
	huanyi.xj@alibaba-inc.com,
	Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: [PATCH 0/8] Support RISCV64 arch and common commands
Date: Sun, 17 Jul 2022 12:29:21 +0800
Message-Id: <20220717042929.370022-1-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_212942_889383_2D7EA099 
X-CRM114-Status: UNSURE (   8.37  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series of patches make crash tool support RISCV64 arch and the common
commands(*, bt, p, rd, mod, log, set, struct, task, dis and so on).

To make the crash tool work normally for RISCV64 arch, we need a Linux kernel
patch(under reviewing), which exports the kernel virtual memory layout, va_bits,
phys_ram_base to vmcoreinfo, it can simplify the development of crash tool.

THis Linux kernel patch:
https://patchwork.kernel.org/project/linux-riscv/patch/20220714113300.367854-2-xianting.tian@linux.alibaba.com/
 
This series of patches are tested on QEMU RISCV64 env and SoC platform of
T-head Xuantie 910 CPU.

====================================
  Some test examples list as below
====================================
... ...
      KERNEL: vmlinux
    DUMPFILE: vmcore
        CPUS: 1
        DATE: Fri Jul 15 10:24:25 CST 2022
      UPTIME: 00:00:33
LOAD AVERAGE: 0.05, 0.01, 0.00
       TASKS: 41
    NODENAME: buildroot
     RELEASE: 5.18.9
     VERSION: #30 SMP Fri Jul 15 09:47:03 CST 2022
     MACHINE: riscv64  (unknown Mhz)
      MEMORY: 1 GB
       PANIC: "Kernel panic - not syncing: sysrq triggered crash"
         PID: 113
     COMMAND: "sh"
        TASK: ff60000002269600  [THREAD_INFO: ff60000002269600]
         CPU: 0
       STATE: TASK_RUNNING (PANIC)

carsh>

crash> p mem_map
mem_map = $1 = (struct page *) 0xff6000003effbf00

crash> p /x *(struct page *) 0xff6000003effbf00
$5 = {
  flags = 0x1000,
  {
    {
      {
        lru = {
          next = 0xff6000003effbf08,
          prev = 0xff6000003effbf08
        },
        {
          __filler = 0xff6000003effbf08,
          mlock_count = 0x3effbf08
        }
      },
      mapping = 0x0,
      index = 0x0,
      private = 0x0
    },
  ... ...

crash> mod
     MODULE       NAME             BASE         SIZE  OBJECT FILE
ffffffff0113e740  nvme_core  ffffffff01133000  98304  (not loaded)  [CONFIG_KALLSYMS]
ffffffff011542c0  nvme       ffffffff0114c000  61440  (not loaded)  [CONFIG_KALLSYMS]

crash> rd ffffffff0113e740 8
ffffffff0113e740:  0000000000000000 ffffffff810874f8   .........t......
ffffffff0113e750:  ffffffff011542c8 726f635f656d766e   .B......nvme_cor
ffffffff0113e760:  0000000000000065 0000000000000000   e...............
ffffffff0113e770:  0000000000000000 0000000000000000   ................

crash> vtop ffffffff0113e740
VIRTUAL           PHYSICAL
ffffffff0113e740  8254d740

   PGD: ffffffff810e9ff8 => 2ffff001
  P4D: 0000000000000000 => 000000002fffec01
  PUD: 00005605c2957470 => 0000000020949801
  PMD: 00007fff7f1750c0 => 0000000020947401
   PTE: 0 => 209534e7
 PAGE: 000000008254d000

  PTE     PHYSICAL  FLAGS
209534e7  8254d000  (PRESENT|READ|WRITE|GLOBAL|ACCESSED|DIRTY)

      PAGE       PHYSICAL      MAPPING       INDEX CNT FLAGS
ff6000003f0777d8 8254d000                0        0  1 0

crash> bt
PID: 113      TASK: ff6000000226c200  CPU: 0    COMMAND: "sh"
 #0 [ff20000010333b90] riscv_crash_save_regs at ffffffff800078f8
 #1 [ff20000010333cf0] panic at ffffffff806578c6
 #2 [ff20000010333d50] sysrq_reset_seq_param_set at ffffffff8038c03c
 #3 [ff20000010333da0] __handle_sysrq at ffffffff8038c604
 #4 [ff20000010333e00] write_sysrq_trigger at ffffffff8038cae4
 #5 [ff20000010333e20] proc_reg_write at ffffffff801b7ee8
 #6 [ff20000010333e40] vfs_write at ffffffff80152bb2
 #7 [ff20000010333e80] ksys_write at ffffffff80152eda
 #8 [ff20000010333ed0] sys_write at ffffffff80152f52

Xianting Tian (8):
  Add RISCV64 framework code support
  RISCV64: Make crash tool enter command line and support some commands
  RISCV64: Add 'dis' command support
  RISCV64: Add 'irq' command support
  RISCV64: Add 'bt' command support
  RISCV64: Add 'help -r' command support
  RISCV64: Add 'mach' command support
  RISCV64: Add the implementation of symbol verify

 Makefile            |    7 +-
 README              |    2 +-
 configure.c         |   39 +-
 defs.h              |  248 +++++++-
 diskdump.c          |   21 +-
 help.c              |    2 +-
 lkcd_vmdump_v2_v3.h |    2 +-
 netdump.c           |   22 +-
 ramdump.c           |    2 +
 riscv64.c           | 1414 +++++++++++++++++++++++++++++++++++++++++++
 symbols.c           |   10 +
 11 files changed, 1759 insertions(+), 10 deletions(-)
 create mode 100644 riscv64.c

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
