Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E17C54EBE
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jan 2023 06:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2gJN3/CUe4I8Z48ILUVwsSaSkzEWoEoT6tqKmTUZqrw=; b=OxXljeXdQwmTxA
	gOkNL9StZvVGju+zgguciyJqiZbBWceOR8yuRfQMha7mA9WB9tbN+V2JYgG9Q0UdU5BnuUYMKVueV
	vFYhQe2CfTpVPxdtidLxm/e0rvH1xEE7mBWhoxhheqZgK+qPUQvLPodhfflsJMmmZMQGOd5+3phTF
	N27lt4qa5cRe0Q3gNXuYwxbA1Av7R75rWI+YbIQMk5PNFokkhfifOKTlx0R/HPtbDN3a5EwHr7vNQ
	338DksYJaqktKTcRT1il1mbVXuy/EqDM13xHlMX5m1K1adFR7xbaekkBot6m+OwXBkbAnJRzqaXMt
	F06KSnfGquxzxz8lQMoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHJGG-008s5H-Lg; Mon, 16 Jan 2023 06:46:28 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHJGD-008s3G-8i
	for linux-riscv@lists.infradead.org; Mon, 16 Jan 2023 06:46:27 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NwMvK41BbznVNh;
	Mon, 16 Jan 2023 14:44:29 +0800 (CST)
Received: from huawei.com (10.67.174.53) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 14:46:10 +0800
From: Liao Chang <liaochang1@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<liaochang1@huawei.com>, <mhiramat@kernel.org>, <guoren@kernel.org>,
	<me@packi.ch>, <penberg@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<bjorn@kernel.org>, <chenlifu@huawei.com>
Subject: [PATCH] riscv/kprobe: Fix instruction simulation of JALR
Date: Mon, 16 Jan 2023 14:43:42 +0800
Message-ID: <20230116064342.2092136-1-liaochang1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_224625_582520_A4859061 
X-CRM114-Status: UNSURE (   9.22  )
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

Set kprobe at 'jalr 1140(ra)' of vfs_write results in the following
crash:

[   32.092235] Unable to handle kernel access to user memory without uaccess routines at virtual address 00aaaaaad77b1170
[   32.093115] Oops [#1]
[   32.093251] Modules linked in:
[   32.093626] CPU: 0 PID: 135 Comm: ftracetest Not tainted 6.2.0-rc2-00013-gb0aa5e5df0cb-dirty #16
[   32.093985] Hardware name: riscv-virtio,qemu (DT)
[   32.094280] epc : ksys_read+0x88/0xd6
[   32.094855]  ra : ksys_read+0xc0/0xd6
[   32.095016] epc : ffffffff801cda80 ra : ffffffff801cdab8 sp : ff20000000d7bdc0
[   32.095227]  gp : ffffffff80f14000 tp : ff60000080f9cb40 t0 : ffffffff80f13e80
[   32.095500]  t1 : ffffffff8000c29c t2 : ffffffff800dbc54 s0 : ff20000000d7be60
[   32.095716]  s1 : 0000000000000000 a0 : ffffffff805a64ae a1 : ffffffff80a83708
[   32.095921]  a2 : ffffffff80f160a0 a3 : 0000000000000000 a4 : f229b0afdb165300
[   32.096171]  a5 : f229b0afdb165300 a6 : ffffffff80eeebd0 a7 : 00000000000003ff
[   32.096411]  s2 : ff6000007ff76800 s3 : fffffffffffffff7 s4 : 00aaaaaad77b1170
[   32.096638]  s5 : ffffffff80f160a0 s6 : ff6000007ff76800 s7 : 0000000000000030
[   32.096865]  s8 : 00ffffffc3d97be0 s9 : 0000000000000007 s10: 00aaaaaad77c9410
[   32.097092]  s11: 0000000000000000 t3 : ffffffff80f13e48 t4 : ffffffff8000c29c
[   32.097317]  t5 : ffffffff8000c29c t6 : ffffffff800dbc54
[   32.097505] status: 0000000200000120 badaddr: 00aaaaaad77b1170 cause: 000000000000000d
[   32.098011] [<ffffffff801cdb72>] ksys_write+0x6c/0xd6
[   32.098222] [<ffffffff801cdc06>] sys_write+0x2a/0x38
[   32.098405] [<ffffffff80003c76>] ret_from_syscall+0x0/0x2

Since the rs1 and rd might be the same one, such as 'jalr 1140(ra)',
hence it requires obtaining the target address from rs1 followed by
updating rd.

Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
Signed-off-by: Liao Chang <liaochang1@huawei.com>
---
 arch/riscv/kernel/probes/simulate-insn.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index d73e96f6ed7c..02aa262fb2ac 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -71,17 +71,13 @@ bool __kprobes simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *reg
 	u32 rd_index = (opcode >> 7) & 0x1f;
 	u32 rs1_index = (opcode >> 15) & 0x1f;
 
-	ret = rv_insn_reg_set_val(regs, rd_index, addr + 4);
-	if (!ret)
-		return ret;
-
 	ret = rv_insn_reg_get_val(regs, rs1_index, &base_addr);
 	if (!ret)
 		return ret;
 
 	instruction_pointer_set(regs, (base_addr + sign_extend32((imm), 11))&~1);
 
-	return ret;
+	return rv_insn_reg_set_val(regs, rd_index, addr + 4);
 }
 
 #define auipc_rd_idx(opcode) \
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
