Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795F1C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 14:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3aDHmetn+a7XPIcy7XDxboY3O0XsmyLj31Ce/wnfc7g=; b=nGo2tdg5JH5+FG
	W56op0X20uLaLqm6GAZvfH6reBv3Kr4BaIPv034nnCjdN4/urckvX4jK1pxk++uN6d6FV0t1nLSiH
	xCmdJqpq3fsHEZB8tHfe3YOGHcezmc/e5KnWI3ASMG6SFFpE2iy0QXW9XEJOyLvZ6kRsbKvbf1j+h
	Ni/1vYVG9rEsJBu9q+ypMjdgcWiHVqItQ4yfGGe56J1coV+Ab+Ap+/DPqXBEMo0MfAO9d4loeAjgH
	9JlBWtOD/XY0mY9VrdxopxoulChz0WBwW07EVebYVfmaGV/9MnSnLuciGcigrHqQfqQVyjCWx/Bbq
	285YfIBst4FsWQ1o1cHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndupq-009L7e-Pr; Mon, 11 Apr 2022 14:16:06 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndupj-009L4I-VD
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 14:16:02 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
 by APP-05 (Coremail) with SMTP id zQCowAAnxaUUOFRil9sMAQ--.30543S2;
 Mon, 11 Apr 2022 22:15:49 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn, Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v1 0/4] riscv: mm: add Svnapot support
Date: Mon, 11 Apr 2022 22:15:32 +0800
Message-Id: <20220411141536.2461073-1-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAnxaUUOFRil9sMAQ--.30543S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1rZw17WFW7Gw18WF1ftFb_yoW8Xr43pF
 W3GrnxKF98GryfAr1agryv9rW5tr4S9Fyaqw17J34UA39xAayUZwnYyFs8Aa48JF4fJFy0
 kF4Ygry3uas8X3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
 rcIFxwAKzVCY07xG64k0F24l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
 1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
 14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
 IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvE
 x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnU
 UI43ZEXa7VUbSApUUUUUU==
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_071600_417452_972E2481 
X-CRM114-Status: UNSURE (   8.28  )
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

From: Qinglin Pan <panqinglin2020@iscas.ac.cn>

Svnapot is a RISC-V extension for marking contiguous 4K pages as a non-4K
page. This patch set is for using Svnapot in Linux Kernel's boot process
and hugetlb fs.

Since Svnapot is just stable recently, and there seems no official way to
determine if the CPU supports Svnapot at runtime. This patchset adds a Kconfig
item for using Svnapot in "Platform type"->"Svnapot support". Its default value
is off, and people can set it on when their CPU supports Svnapot.

Qemu support for Svnapot has been accepted but still not merged into master.
So the qemu which we use to test this patchset is current in this repo (it
contains qemu Svnapot patchset):
https://github.com/plctlab/plct-qemu/tree/plct-virtmem-dev

Tested on:
  - qemu rv64 with "Svnapot support" off.
  - plct-qemu rv64 with "Svnapot support" on.


Qinglin Pan (4):
  mm: modify pte format for Svnapot
  mm: support Svnapot in physical page linear-mapping
  mm: support Svnapot in hugetlb page
  mm: support Svnapot in huge vmap

 arch/riscv/Kconfig                    |  10 +-
 arch/riscv/include/asm/hugetlb.h      |  31 +++-
 arch/riscv/include/asm/page.h         |   2 +-
 arch/riscv/include/asm/pgtable-bits.h |  31 ++++
 arch/riscv/include/asm/pgtable.h      |  68 ++++++++
 arch/riscv/include/asm/vmalloc.h      |  20 +++
 arch/riscv/mm/hugetlbpage.c           | 236 +++++++++++++++++++++++++-
 arch/riscv/mm/init.c                  |  29 +++-
 8 files changed, 416 insertions(+), 11 deletions(-)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
