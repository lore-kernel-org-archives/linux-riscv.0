Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D660C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Oct 2022 13:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i1GsvneQvIX5vGbQWNH5pjkGwq8Du1zOP0FkxwkWcJ0=; b=l+zDxZum3JVtpO
	xm7qypoE1cpXATHymeMP6GH7PbmEbe7CnnjGxKTosZM2Ls6PPRjLA9sfRO7WS68Z4tuiK6Ws5K9z3
	hfobqh1zls719lisl/1FnrvpaiyaR2KZLWGiqyhrwYnTyog/gGRXYfKQBwHScHnlfwJ+4Hsw6PDZx
	GUBx+2hAp5RwnoDQu7k5biLYspHtIiCkBw2veSqIWBIsL7vzXcAV9mW9FZZFGWYgw75Nh5umGp29h
	/0abMbLgGFqZii92ylZW/3oy2g7fwEUDmav/Yi7+Klrgd+9vmv8MxuuZhcSzDzkHhA+2xuU1876DE
	3MANwKEYCnGqpiIxmvKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofLnY-0065Ai-VA; Mon, 03 Oct 2022 13:47:56 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofLnQ-00655y-8J
	for linux-riscv@lists.infradead.org; Mon, 03 Oct 2022 13:47:51 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-01 (Coremail) with SMTP id qwCowACHzoj05zpjo2sYAw--.64668S2;
	Mon, 03 Oct 2022 21:47:33 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v5 0/4] riscv, mm: detect svnapot cpu support at runtime
Date: Mon,  3 Oct 2022 21:47:17 +0800
Message-Id: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowACHzoj05zpjo2sYAw--.64668S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1rZw1xGry5Xw45KF43GFg_yoW8Xr18pF
	ZIkrn3GF98CryfAr1avryDur98Jw1Sgayaqw17A34UAwsxAayUZwn0y3ZxC3W8JFWfXF1I
	kF45Gry5ua4kX3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7M4kE6xkIj40Ew7xC0wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnU
	UI43ZEXa7VUjt8n7UUUUU==
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiAwcIDGM6ocpgjgAAsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_064748_754068_9A41148A 
X-CRM114-Status: UNSURE (   6.82  )
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
"Platform type"->"SVNAPOT extension support". Its default value is off,
and people can set it on if they allow kernel to detect Svnapot hardware
support and leverage it.

Tested on:
  - qemu rv64 with "Svnapot support" off and svnapot=true.
  - qemu rv64 with "Svnapot support" on and svnapot=true.
  - qemu rv64 with "Svnapot support" off and svnapot=false.
  - qemu rv64 with "Svnapot support" on and svnapot=false.


Qinglin Pan (4):
  mm: modify pte format for Svnapot
  mm: support Svnapot in physical page linear-mapping
  mm: support Svnapot in hugetlb page
  mm: support Svnapot in huge vmap

 arch/riscv/Kconfig                   |  17 +-
 arch/riscv/include/asm/errata_list.h |  23 ++-
 arch/riscv/include/asm/hugetlb.h     |  30 +++-
 arch/riscv/include/asm/hwcap.h       |   3 +-
 arch/riscv/include/asm/page.h        |   2 +-
 arch/riscv/include/asm/pgtable-64.h  |  13 ++
 arch/riscv/include/asm/pgtable.h     |  68 +++++++-
 arch/riscv/include/asm/vmalloc.h     |  28 +++
 arch/riscv/kernel/cpu.c              |   1 +
 arch/riscv/kernel/cpufeature.c       |  18 ++
 arch/riscv/mm/hugetlbpage.c          | 250 ++++++++++++++++++++++++++-
 arch/riscv/mm/init.c                 |  28 ++-
 12 files changed, 467 insertions(+), 14 deletions(-)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
