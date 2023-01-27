Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD28C54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 13:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F7xDS4xtMEIcplrsdw5hXKDrYnFB6BNdgXieVqMijgE=; b=gYYC4KsPr+cipJ
	69j5Mz2gWg2hiV9r3WB2SALxwee8EpkyU8rY9xHSFxULRmPlpmCYtbiTeaa2p1gdT1Q2TBTiGBzjV
	qQhy87Nt6kFcEwVqCHizHCPkg/gU4adE0jtoMEjC8NIfJ9VahX5HheJKucl8GovNU5/WmCPzSUAtW
	ykjanygHvKnFr64gXVd7BHNGN0sGv1SJ7YKxH5Fc4199PdO0+s/GBBF8Ybmx0zWwogFLWitqzC1Cu
	8iqpnhV0RykwPlJGBBEBWGhDwO0mmZDy804jXiGjILXun7WyDo1pCPr0yxY4NxcrglYDrZiwiyjqf
	Xgmt6vISrdyeaOUpVUJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOqP-00F1Ru-B9; Fri, 27 Jan 2023 13:32:41 +0000
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOR0-00Ery1-FQ
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 13:06:37 +0000
Received: from cgk-Precision-3650-Tower.. (unknown [219.141.235.82])
	by APP-01 (Coremail) with SMTP id qwCowADX3Eg9zNNjDyF3Ag--.52827S15;
	Fri, 27 Jan 2023 21:06:10 +0800 (CST)
From: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mingo@redhat.com,
	sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liaochang1@huawei.com
Subject: [PATCH v6 11/13] riscv/kprobe: Fix instruction simulation of JALR
Date: Fri, 27 Jan 2023 21:05:39 +0800
Message-Id: <20230127130541.1250865-12-chenguokai17@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
References: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADX3Eg9zNNjDyF3Ag--.52827S15
X-Coremail-Antispam: 1UD129KBjvJXoWxGw17AFyUCFy3trW8Jw13Jwb_yoW5Xw1Upr
	W5Jr1UCr40grn7Jay7Jr1rAr4UJr1jk3WxWF18Kw1FkF1UW34UXw18tF43AF1Dtr13Ca47
	Jr1DJr40qr18GaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPKb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
	jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vE
	x4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52
	x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWU
	GwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkIecxEwVAFwVW5GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC2
	0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
	0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv2
	0xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
	80aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU
	0xZFpf9x07jF_M3UUUUU=
X-Originating-IP: [219.141.235.82]
X-CM-SenderInfo: xfkh0w5xrntxyrx6ztxlovh3xfdvhtffof0/1tbiAwoEE2PTrr4g1wAAsJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_050627_055150_85F7285B 
X-CRM114-Status: UNSURE (   8.98  )
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

From: Liao Chang <liaochang1@huawei.com>

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
index 7441ac8a6843..8402020010d5 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -75,13 +75,9 @@ bool __kprobes simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *reg
 	if (!ret)
 		return ret;
 
-	ret = rv_insn_reg_set_val(regs, rd_index, addr + 4);
-	if (!ret)
-		return ret;
-
 	instruction_pointer_set(regs, (base_addr + sign_extend32((imm), 11))&~1);
 
-	return ret;
+	return rv_insn_reg_set_val(regs, rd_index, addr + 4);
 }
 
 #define auipc_rd_idx(opcode) \
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
