Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAD2CCA481
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jul 2022 08:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fEiTKDEtxtCWgFADBv073GBJIqoE1xONfDjFgRQ0ppw=; b=RAOGdzZ8RLx89M
	6+E6Zyi57rzh2RGeZTvkn27o9LQdLmMkG4bm0O8u6+mHvOrpyJ0GwzXmR6B91MV+oTpCAmACk6Cm3
	nYJ9Cpyao+XT4B1rQruaYbryAAsKwd+islmqG9/niDNizX6FEViQ1n8AsG9/kQtT3gCGezI839vAb
	mxN33x/4+PNJSZn1JPQHEgTTd7frdD5I3ogiCuw3+OJi/2eTDYZkSTy5KjtqDdHTeGvLnk9Q+XxHh
	Av4dK7LvfUHj6VhNjyvQvHndzdbmJEUHPaNPRlvs86OOxttHJ8Q3BiSN6Sm+2Wl5faJLbWz+pBrpK
	ESOh1AfCFshOY/p+eXdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCdbw-00Epkd-UM; Sat, 16 Jul 2022 08:57:16 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCdbr-00EpgW-9o
	for linux-riscv@lists.infradead.org; Sat, 16 Jul 2022 08:57:13 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-05 (Coremail) with SMTP id zQCowAAXOX5afdJiXNlgDg--.22302S2;
	Sat, 16 Jul 2022 16:56:59 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v2 0/4] riscv: mm: add Svnapot support
Date: Sat, 16 Jul 2022 16:56:44 +0800
Message-Id: <20220716085648.4156408-1-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAXOX5afdJiXNlgDg--.22302S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1rZw1xuryxAr15WF15Arb_yoW8XF17pF
	ZxCrn3GF98CryfAr1a9ryDurn5Jw1fGayaqw1xA34UAwsxJayUZwn0y3Z8C3W8XF4fXFyI
	kF45JFyF9a4kX3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwAKzVCY07xG64k0F24l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF
	0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kf
	nxnUUI43ZEXa7VUjt8n7UUUUU==
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_015711_758460_94AF4246 
X-CRM114-Status: UNSURE (   6.74  )
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

Qinglin Pan (4):
  mm: modify pte format for Svnapot
  mm: support Svnapot in physical page linear-mapping
  mm: support Svnapot in hugetlb page
  mm: support Svnapot in huge vmap

 arch/riscv/Kconfig                   |  10 +-
 arch/riscv/include/asm/errata_list.h |  24 ++-
 arch/riscv/include/asm/hugetlb.h     |  31 +++-
 arch/riscv/include/asm/hwcap.h       |   1 +
 arch/riscv/include/asm/page.h        |   2 +-
 arch/riscv/include/asm/pgtable-64.h  |  14 ++
 arch/riscv/include/asm/pgtable.h     |  67 +++++++-
 arch/riscv/include/asm/vmalloc.h     |  20 +++
 arch/riscv/kernel/cpu.c              |   1 +
 arch/riscv/kernel/cpufeature.c       |  18 ++
 arch/riscv/mm/hugetlbpage.c          | 239 ++++++++++++++++++++++++++-
 arch/riscv/mm/init.c                 |  28 +++-
 12 files changed, 442 insertions(+), 13 deletions(-)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
