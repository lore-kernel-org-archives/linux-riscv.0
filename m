Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34ED6E8784C
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 17:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aZKPwv7GUdOkDEM74RcW9dGIYMXsSMburCCtYO659Cg=; b=Hnxq534HiAGPSO
	/vwF7OH9fEHQRA2iH7D4h6q8v+KSn1uf9/nTIvi901ypdADU67EBsOiYrAt3KCV0fUplnEsWREOVl
	nbDIjjjTSoNvZNQDmrn0EFQZeixOqA3wNLSo56Ny6MLmpAJES2a15lcLuuppvVC8qU+IIkXoXw4Zt
	ThfitVfOm2xdCB3Us0MVndsmsrX8Oi/WEbYx1YbRoSc+sax2ANpOse9fjSMmzLIcpw63SeP2QgX+I
	nA6Xr0+htJVKz1ZMxI6sy7if2IwULlwoPkm8PzL2Eyhs4tPEFSIYJKAfcIa570jQtP4WFbHe3WfHd
	8hRjqvI3bY/3L1vy+Abw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnK1s-00000007274-3NlO;
	Tue, 03 Feb 2026 17:17:32 +0000
Received: from out203-205-221-153.mail.qq.com ([203.205.221.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnK1n-0000000726P-3fNf
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 17:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1770139041; bh=2m9r7lyGKPwigNE6SDb1IPWk3KIGxSFqCC+NDWFmpPw=;
	h=From:To:Cc:Subject:Date;
	b=Vz34wpMKqx57ppoewy/J09/lD5QRbl1dMlozPfc4DWjfqii8F40xr9wfi7d/4N0lH
	 yeEaBjWyagbz7xYZUAc7PS1BUjlYNIsyq6AAOrCZHZJzlTNGOsKCWMbbFFsqD93Yqp
	 sZVU/wF1u7YfpJcav7mZWv6wqC0kTmnPk3eEqyPs=
Received: from cyy-pc.lan ([240e:379:2263:bd00:7e4b:55e4:8771:53fb])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 44FB641C; Wed, 04 Feb 2026 01:17:15 +0800
X-QQ-mid: xmsmtpt1770139035tu2r2k9s8
Message-ID: <tencent_AEBB719FAF49D05B5BDF7118D729463F6405@qq.com>
X-QQ-XMAILINFO: MwoEXPhRg/2G5m80Km1Rl90HySxC/ky8sgaEysJd53CqJAobJIsrrGYHutoLrv
	 Hd2o95KPOGZ9ARw4t/8cmcYbxmY4dIn5BqKVwv1fz2HNGZyi2qSLYBrL0h2AimFGxsfhEZ1ltYYO
	 5qYzQpliCoDEAK+jV+58Tfj9L9ZRIJSAqKH5i37ITME32TaV3CCGPjn+eiVGIfaPEZfeeywU7wWP
	 Pmqx15U58/tvNLsKU/WNJV3PrUwz3kn7xVrA1dSepjuyMvh+72NiSBpvdmtRFlC91jE9OzGkXmTZ
	 xUsiWIPGZnQ/XMY4XIbp/mGf0GIpic13uvpotUrJS9wnP1xi5QVIY4BN3t3BX3Gz6Gy4o6YQepqn
	 3ZWuCrGAoEu5rrNMoHw0N9YbCa9csveYHjJEc/7MSgEYS1q5/Fdjr0k9EeBfTkoT3+wljgLlrLdZ
	 1Z/Mw4wWYFXsUPTkcCoY5h3ygVrB/KNNrB5A0HeekjOoOVioySCyvHZrAqfRKe1mbYDNDWSxGYhe
	 6aYwa9IgCFLWxkMCQpIZdZtUtzaA+IqLmIHPjeYwvCHYL7aLpF5DnHCWOGOWGBshWfUAokv5GoVO
	 NPEpxIT6F/n1iPrEsd277INJ/FRB4IrxXb5Di25mck4MSJweTUo7lr8/9zyGydYC0VD0zfnzqd++
	 E8hpb/y0cSdretIJFdZ4h36mvskP3qDAMANmcI6yusFfmFmij7QPhWNLFqzJYedAC+80fbCGUcOo
	 oS3Cw4xqjqHkaEDZhfoIPLk4b8n8uvaYdZVdhhEDkc2krrXYq32FvtVRkwYV7sp2qSFmLc1UVV7y
	 VbHKEOw5+CC9B6c/ynPpvkuOU78Jzizara9leSgOnyLR6Og5zo+qjOcUHzt5/bUlG7iKiMXEIA2H
	 3Y6sJP4F7GNg7YaGy5mrcTY1Bw/YnkTyErJ+nFaGOZwNmxpEeVnbM+RS3uXirn1qvMLyel3SG04m
	 nxYYJX+s7PhRZ1Dbhllt7VKJ4rEfJGecU3IP9MOx5leOObslc+o+6vRhzrsDuq8FgqNWJL3bdUrN
	 m6JQq+Nh7ajoBStsFpKENA8/KUf4qj4ezbF6OX7FGebnTnlpm5pEYCfh3OSFt2zscYp0jE5TqDK5
	 ATeC0sn4C0m6x3zEE=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Anup Patel <anup.patel@oss.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Lucas Zampieri <lzampier@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mason Huo <mason.huo@starfivetech.com>,
	Zhang Xincheng <zhangxincheng@ultrarisc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Marc Zyngier <maz@kernel.org>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	Yash Shah <yash.shah@sifive.com>,
	Jia Wang <wangjia@ultrarisc.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v3 0/2] irqchip/sifive-plic: Fix wrong nr_irqs handling
Date: Wed,  4 Feb 2026 01:17:07 +0800
X-OQ-MSGID: <20260203171707.1581780-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_091728_223949_DEF7BBF8 
X-CRM114-Status: GOOD (  13.12  )
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

This patch series fixes long standing bugs in sifive-plic driver regarding
the handling of nr_irqs. Some code assumes the first irq source is 0 while
some assumes it is 1. Since the first irq source is actually 1, this causes
various issues including memory corruption when the number of irqs is
multiple of 32. Also, some code assumes nr_irqs is the maximum irq source
ID while some assumes it is the total number of irq sources including the
reserved source 0. This patch series standardizes the handling of nr_irqs
to be the maximum irq source ID, and the first irq source is 1.

This bug can be reproduced by modifying the PLIC node in DT to have ndev as
exactly multiple of 32, e.g., 32, 64, etc., then triggering some interrupts
and checking dmesg for memory corruption:

plic: plic@3c000000 {
	compatible = "riscv,plic0";
	reg = <0x0 0x3c000000 0x0 0x4000000>;
	#interrupt-cells = <1>;
	interrupt-controller;
	interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
	riscv,max-priority = <7>;
	riscv,ndev = <64>;
};

Here is an example dmesg log when ndev is 64:
[    0.077196] Unable to handle kernel paging request at virtual address ffffaf8000000000
[    0.077205] Current swapper/0 pgtable: 4K pagesize, 48-bit VAs, pgdp=0x0000000081c2d000
[    0.077215] [ffffaf8000000000] pgd=000000009ffffc01, p4d=000000009ffffc01, pud=000000009ffff801, pmd=000000009ffff401, pte=0000000000000000
[    0.077240] Oops [#1]
[    0.077246] Modules linked in:
[    0.077254] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.19.0-rc6 #36 NONE 
[    0.077266] Hardware name: XiangShan (DT)
[    0.077273] epc : __kmalloc_node_track_caller_noprof+0x1a0/0x524
[    0.077284]  ra : kstrdup+0x32/0x60
[    0.077293] epc : ffffffff80253c70 ra : ffffffff801fa70e sp : ffff8f800000b700
[    0.077304]  gp : ffffffff81a1b580 tp : ffffaf8080158000 t0 : 0000000000000264
[    0.077313]  t1 : 0000000000000003 t2 : 0000000000000000 s0 : ffff8f800000b750
[    0.077323]  s1 : 0000000000000002 a0 : ffffaf8000000000 a1 : 0000000000000cc0
[    0.077332]  a2 : ffff8d800200bfc0 a3 : ffffffff81a5c5e0 a4 : ffffaf8000000000
[    0.077342]  a5 : 0000000000000003 a6 : ffffffffffffffff a7 : ffffaf8080001400
[    0.077352]  s2 : ffffaf80802ff178 s3 : ffffffff810107f0 s4 : 0000000000000000
[    0.077362]  s5 : 0000000000000000 s6 : ffff8f800000b9c0 s7 : ffffaf8080823200
[    0.077372]  s8 : ffffffff81a20580 s9 : ffffaf808012c990 s10: ffffffffffffffff
[    0.077382]  s11: 0000000000000000 t3 : 0000000000000cc0 t4 : ffffffff801fa764
[    0.077391]  t5 : 0000000000000000 t6 : 0000000000000263
[    0.077399] status: 0000000200000120 badaddr: ffffaf8000000000 cause: 000000000000000d
[    0.077409] [<ffffffff80253c70>] __kmalloc_node_track_caller_noprof+0x1a0/0x524
[    0.077422] [<ffffffff801fa70e>] kstrdup+0x32/0x60
[    0.077433] [<ffffffff801fa764>] kstrdup_const+0x28/0x34
[    0.077444] [<ffffffff80318438>] __kernfs_new_node+0x3c/0x274
[    0.077457] [<ffffffff80318a90>] kernfs_new_node+0x44/0x6c
[    0.077470] [<ffffffff80318f40>] kernfs_create_dir_ns+0x20/0x7c
[    0.077483] [<ffffffff8031b8f8>] sysfs_create_dir_ns+0x60/0xcc
[    0.077497] [<ffffffff80b41bea>] kobject_add_internal+0xae/0x2d8
[    0.077509] [<ffffffff80b422d6>] kobject_add+0x52/0xb8
[    0.077520] [<ffffffff80b6401c>] __irq_alloc_descs+0x190/0x328
[    0.077534] [<ffffffff800976de>] irq_domain_alloc_descs.part.0+0x46/0x78
[    0.077549] [<ffffffff8009827a>] irq_create_mapping_affinity+0x72/0xcc
[    0.077561] [<ffffffff805d27d2>] plic_probe+0x2e2/0x6c8
[    0.077573] [<ffffffff805d2bc8>] plic_platform_probe+0x10/0x18

Changes since v2:
- Clarify the riscv,ndev meaning in the devicetree binding
  documentation for PLIC.
- Fix the entire driver code to have all nr_irqs handling consistent
  with the standard definition.

v2: https://lore.kernel.org/lkml/tencent_A697393AE256C4288768342AF245099A690A@qq.com/

Changes since v1:
- Add more Fixes tags for earlier commits that are also affected by this
  bug.
- Add more explanation about the bug's history.

v1: https://lore.kernel.org/lkml/tencent_6E9A1A3DF88005E3B4A11C4D7039637E4309@qq.com/

Yangyu Chen (2):
  irqchip/sifive-plic: Fix wrong nr_irqs handling
  dt-binding: riscv: Clarify the riscv,ndev meaning in PLIC

 .../interrupt-controller/sifive,plic-1.0.0.yaml  |  2 ++
 drivers/irqchip/irq-sifive-plic.c                | 16 ++++++++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
