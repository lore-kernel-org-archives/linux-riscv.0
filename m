Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6735DC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 08:19:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE93661987
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 08:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE93661987
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9cWToodo+Sb/9bzXuBHN4dRsTCdyzbvjwnuFMbr8v5Q=; b=QEInJHdYUtAbEg0w1x4KqX+zpH
	4COUY4FoMgjXDgE2pq4Xoz7ec4o20DQKVnUkVI04YqGUHjbxDMJmYPljmQMGWTa2bUMhprt+HYuC6
	5mUmbLdOfCkqTxwBJWnpA7zJQtKIBq/JcjBwQo5HhLUPHwtY5ejTTP+Fa2dyeyhaIkQazv9L/DMY6
	q84jojmARMC65AjMYbiFk54rPIsthwvR8Bakvcx117bGlX6p2BcTLgmGyGBISjNdGKMJ3gd7hk+WN
	XLPuj70N+FjfBr3nwX0nCtv5dX8QZeBjndSVjZrjlGXMjPvexqYwWQZNZYqK7rr/8ZlqU6Yll68ii
	gM2YwsiA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR9ak-002zal-Gu; Tue, 30 Mar 2021 08:19:14 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR9ae-002zZk-1l
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 08:19:10 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F8j3D04HCz9sKj;
 Tue, 30 Mar 2021 16:16:56 +0800 (CST)
Received: from huawei.com (10.67.174.53) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Tue, 30 Mar 2021
 16:18:49 +0800
From: Liao Chang <liaochang1@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
 <guoren@linux.alibaba.com>, <mhiramat@kernel.org>, <penberg@kernel.org>,
 <lkp@intel.com>, <me@packi.ch>
CC: <liaochang1@huawei.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] riscv/kprobe: fix kernel panic when invoking sys_read traced
 by kprobe
Date: Tue, 30 Mar 2021 16:18:48 +0800
Message-ID: <20210330081848.14043-1-liaochang1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.53]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_091908_639450_11C132C3 
X-CRM114-Status: GOOD (  15.71  )
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

The execution of sys_read end up hitting a BUG_ON() in __find_get_block
after installing kprobe at sys_read, the BUG message like the following:

[   65.708663] ------------[ cut here ]------------
[   65.709987] kernel BUG at fs/buffer.c:1251!
[   65.711283] Kernel BUG [#1]
[   65.712032] Modules linked in:
[   65.712925] CPU: 0 PID: 51 Comm: sh Not tainted 5.12.0-rc4 #1
[   65.714407] Hardware name: riscv-virtio,qemu (DT)
[   65.715696] epc : __find_get_block+0x218/0x2c8
[   65.716835]  ra : __getblk_gfp+0x1c/0x4a
[   65.717831] epc : ffffffe00019f11e ra : ffffffe00019f56a sp : ffffffe002437930
[   65.719553]  gp : ffffffe000f06030 tp : ffffffe0015abc00 t0 : ffffffe00191e038
[   65.721290]  t1 : ffffffe00191e038 t2 : 000000000000000a s0 : ffffffe002437960
[   65.723051]  s1 : ffffffe00160ad00 a0 : ffffffe00160ad00 a1 : 000000000000012a
[   65.724772]  a2 : 0000000000000400 a3 : 0000000000000008 a4 : 0000000000000040
[   65.726545]  a5 : 0000000000000000 a6 : ffffffe00191e000 a7 : 0000000000000000
[   65.728308]  s2 : 000000000000012a s3 : 0000000000000400 s4 : 0000000000000008
[   65.730049]  s5 : 000000000000006c s6 : ffffffe00240f800 s7 : ffffffe000f080a8
[   65.731802]  s8 : 0000000000000001 s9 : 000000000000012a s10: 0000000000000008
[   65.733516]  s11: 0000000000000008 t3 : 00000000000003ff t4 : 000000000000000f
[   65.734434]  t5 : 00000000000003ff t6 : 0000000000040000
[   65.734613] status: 0000000000000100 badaddr: 0000000000000000 cause: 0000000000000003
[   65.734901] Call Trace:
[   65.735076] [<ffffffe00019f11e>] __find_get_block+0x218/0x2c8
[   65.735417] [<ffffffe00020017a>] __ext4_get_inode_loc+0xb2/0x2f6
[   65.735618] [<ffffffe000201b6c>] ext4_get_inode_loc+0x3a/0x8a
[   65.735802] [<ffffffe000203380>] ext4_reserve_inode_write+0x2e/0x8c
[   65.735999] [<ffffffe00020357a>] __ext4_mark_inode_dirty+0x4c/0x18e
[   65.736208] [<ffffffe000206bb0>] ext4_dirty_inode+0x46/0x66
[   65.736387] [<ffffffe000192914>] __mark_inode_dirty+0x12c/0x3da
[   65.736576] [<ffffffe000180dd2>] touch_atime+0x146/0x150
[   65.736748] [<ffffffe00010d762>] filemap_read+0x234/0x246
[   65.736920] [<ffffffe00010d834>] generic_file_read_iter+0xc0/0x114
[   65.737114] [<ffffffe0001f5d7a>] ext4_file_read_iter+0x42/0xea
[   65.737310] [<ffffffe000163f2c>] new_sync_read+0xe2/0x15a
[   65.737483] [<ffffffe000165814>] vfs_read+0xca/0xf2
[   65.737641] [<ffffffe000165bae>] ksys_read+0x5e/0xc8
[   65.737816] [<ffffffe000165c26>] sys_read+0xe/0x16
[   65.737973] [<ffffffe000003972>] ret_from_syscall+0x0/0x2
[   65.738858] ---[ end trace fe93f985456c935d ]---

A simple reproducer looks like:
	echo 'p:myprobe sys_read fd=%a0 buf=%a1 count=%a2' > /sys/kernel/debug/tracing/kprobe_events
	echo 1 > /sys/kernel/debug/tracing/events/kprobes/myprobe/enable
	cat /sys/kernel/debug/tracing/trace

Here's what happens to hit that BUG_ON():

1) After installing kprobe at entry of sys_read, the first instruction
   is replaced by 'ebreak' instruction on riscv64 platform.

2) Once kernel reach the 'ebreak' instruction at the entry of sys_read,
   it trap into the riscv breakpoint handler, where it do something to
   setup for coming single-step of origin instruction, including backup
   the 'sstatus' in pt_regs, followed by disable interrupt during single
   stepping via clear 'SIE' bit of 'sstatus' in pt_regs.

3) Then kernel restore to the instruction slot contains two instructions,
   one is original instruction at entry of sys_read, the other is 'ebreak'.
   Here it trigger a 'Instruction page fault' exception (value at 'scause'
   is '0xc'), if PF is not filled into PageTabe for that slot yet.

4) Again kernel trap into page fault exception handler, where it choose
   different policy according to the state of running kprobe. Because
   afte 2) the state is KPROBE_HIT_SS, so kernel reset the current kprobe
   and 'pc' points back to the probe address.

5) Because 'epc' point back to 'ebreak' instrution at sys_read probe,
   kernel trap into breakpoint handler again, and repeat the operations
   at 2), however 'sstatus' without 'SIE' is keep at 4), it cause the
   real 'sstatus' saved at 2) is overwritten by the one withou 'SIE'.

6) When kernel cross the probe the 'sstatus' CSR restore with value
   without 'SIE', and reach __find_get_block where it requires the
   interrupt must be enabled.

Fix this is very trivial, just restore the value of 'sstatus' in pt_regs
with backup one at 2) when the instruction being single stepped cause a
page fault.

Fixes: c22b0bcb1dd02 ("riscv: Add kprobes supported")
Signed-off-by: Liao Chang <liaochang1@huawei.com>
---
 arch/riscv/kernel/probes/kprobes.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index 7e2c78e2ca6b..d71f7c49a721 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -260,8 +260,10 @@ int __kprobes kprobe_fault_handler(struct pt_regs *regs, unsigned int trapnr)
 
 		if (kcb->kprobe_status == KPROBE_REENTER)
 			restore_previous_kprobe(kcb);
-		else
+		else {
+			kprobes_restore_local_irqflag(kcb, regs);
 			reset_current_kprobe();
+		}
 
 		break;
 	case KPROBE_HIT_ACTIVE:
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
