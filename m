Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBA0C32774
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 15:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EwKdb0nGsNjRiOqK7aGL1ZD7LwNZW9ckBmL2g8HOFS4=; b=wjMKh/Z9PPEXFH
	qQfYacgWliVOMjNN2Cx37zo2iEZfRFecFMTEUP3cmP0N2D1xaJZZTbPu913GBZumYx9p3zEN1UNEl
	qiwSoYjxSTRFhZpGgZRfyAtahYN+ezgW5b/hoH/97gk0+ZTAyvjTTUKwFZbLbnRYcKPsI9WnXwGwz
	NkP+NdaPKcrjP91cPwJY17OYDUWh3OfHGtJQIOPlIO1l7tJaOglH4ZNtJMMU/uh5jho+R0yFa5JJV
	W+lYwLbTQLY4Q+i7/lPQTFCStT5rH0dcFOqhlCcbbgCHyRUf/MlhyW00rIEpKC/bl4L9b9meF5XMY
	tbbr/1Wot+v4K4aDLYZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ9Rl-00CGNU-Qe; Mon, 22 Aug 2022 15:34:37 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ9Rh-00CGIQ-4p
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 15:34:35 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-01 (Coremail) with SMTP id qwCowACXnpL+oQNj_a29Cw--.4579S2;
	Mon, 22 Aug 2022 23:34:24 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v4 0/4] riscv, mm: detect svnapot cpu support at runtime
Date: Mon, 22 Aug 2022 23:34:09 +0800
Message-Id: <20220822153413.4038052-1-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowACXnpL+oQNj_a29Cw--.4579S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1rZw1xuryxAr15WF15Arb_yoW8AryUpF
	WDCrn3GF98CryfJr1avryDur1rJw1rGayaqw1xA345AwsxJayUJwn0y3ZxC3W8XF4fXr1I
	kF45JryF9a4kX3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwAKzVCY07xG64k0F24l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x0JUhjjkUUUUU=
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiBwAGDGKY1zhgyQAAsx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_083433_643850_E37B942F 
X-CRM114-Status: UNSURE (   7.87  )
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

This patchset adds a Kconfig item for using Svnapot in
"Platform type"->"Svnapot support". Its default value is off, and people can set
it on if they allow kernel to detect Svnapot hardware support and leverage it.

Tested on:
  - qemu rv64 with "Svnapot support" off and svnapot=true.
  - qemu rv64 with "Svnapot support" on and svnapot=true.
  - qemu rv64 with "Svnapot support" off and svnapot=false.
  - qemu rv64 with "Svnapot support" on and svnapot=false.

Changes in v2:
  - detect Svnapot hardware support at boot time.
Changes in v3:
  - do linear mapping again if has_svnapot
Changes in v4:
  - fix some errors/warns reported by checkpatch.pl, thanks @Conor

Qinglin Pan (4):
  mm: modify pte format for Svnapot
  mm: support Svnapot in physical page linear-mapping
  mm: support Svnapot in hugetlb page
  mm: support Svnapot in huge vmap

 arch/riscv/Kconfig                   |  10 +-
 arch/riscv/include/asm/errata_list.h |  24 ++-
 arch/riscv/include/asm/hugetlb.h     |  30 +++-
 arch/riscv/include/asm/hwcap.h       |   1 +
 arch/riscv/include/asm/mmu.h         |   1 +
 arch/riscv/include/asm/page.h        |   2 +-
 arch/riscv/include/asm/pgtable-64.h  |  14 ++
 arch/riscv/include/asm/pgtable.h     |  70 +++++++-
 arch/riscv/include/asm/vmalloc.h     |  22 +++
 arch/riscv/kernel/cpu.c              |   1 +
 arch/riscv/kernel/cpufeature.c       |  18 ++
 arch/riscv/kernel/setup.c            |  11 +-
 arch/riscv/mm/hugetlbpage.c          | 250 ++++++++++++++++++++++++++-
 arch/riscv/mm/init.c                 |  47 +++--
 14 files changed, 477 insertions(+), 24 deletions(-)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
