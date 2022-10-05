Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB1AC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 11:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oEImNvtiArFV2KsVfSN22dPpZ+JxYDE3UGC6Vs+m8rI=; b=trRC4uYTzA3TWw
	2PHAsG5DAf44Gj4oNTKJrwlwWtkuaJVS8AF9R2lzVRSqYUb4gEeHiaA931zG7dmmjS0SR5GZe3rsi
	u8eZhTKUvqGktxjhzs9Frd6fBdtB5t5HM32rBESSnD7wO9dfV5S7SVizAm32H65CLMFbMNg9YUyRW
	O3Hx9DdLv14VaRRfY9CCzr6eQSxUwmiPqw9TqGucBgsq+7qMmXFPkMXl6qurKNLx3Ll9TyXNLyntH
	86ywHamEEWS7ThYZ26g/lSBMUl5UbstGor87Sb4yCmgb40Td0aP2yW6x9mmRsj9/5n7EThfN/Y9Gj
	30aSupthKRVS0cUunwQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og2b1-00DnLe-LK; Wed, 05 Oct 2022 11:29:51 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og2ax-00DnJx-73
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 11:29:49 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-05 (Coremail) with SMTP id zQCowADn13Sgaj1jGzAeAw--.15274S2;
	Wed, 05 Oct 2022 19:29:38 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	conor@kernel.org,
	ajones@ventanamicro.com,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v6 0/4] riscv, mm: detect svnapot cpu support at runtime
Date: Wed,  5 Oct 2022 19:29:22 +0800
Message-Id: <20221005112926.3043280-1-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowADn13Sgaj1jGzAeAw--.15274S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1rZw1xGry5Xw45AFWfAFb_yoW8AF1DpF
	WUCrn3GF98CryfGr4avryDurn5Jw1rKayaqw1xA34UAwsxJayUAw1qy3Z8C3WkXFWfX3WI
	kF45JFy3ua4DZwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwAKzVCY07xG64k0F24l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjfUYuc_UUUUU
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiAwMKDGM9I2pkMwABsH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_042947_666460_F67DBD5B 
X-CRM114-Status: UNSURE (   7.66  )
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


Changes in v2:
  - detect Svnapot hardware support at boot time.
Changes in v3:
  - do linear mapping again if has_svnapot
Changes in v4:
  - fix some errors/warns reported by checkpatch.pl, thanks @Conor
Changes in v5:
  - modify code according to @Conor and @Heiko
Changes in v6:
  - use static key insead of alternative errata


Qinglin Pan (4):
  riscv: mm: modify pte format for Svnapot
  riscv: mm: support Svnapot in physical page linear-mapping
  riscv: mm: support Svnapot in hugetlb page
  riscv: mm: support Svnapot in huge vmap

 arch/riscv/Kconfig                  |  17 +-
 arch/riscv/include/asm/hugetlb.h    |  37 +++-
 arch/riscv/include/asm/hwcap.h      |   4 +
 arch/riscv/include/asm/page.h       |   2 +-
 arch/riscv/include/asm/pgtable-64.h |  13 ++
 arch/riscv/include/asm/pgtable.h    |  69 +++++++-
 arch/riscv/include/asm/vmalloc.h    |  28 ++++
 arch/riscv/kernel/cpu.c             |   1 +
 arch/riscv/kernel/cpufeature.c      |   1 +
 arch/riscv/mm/hugetlbpage.c         | 250 +++++++++++++++++++++++++++-
 arch/riscv/mm/init.c                |  30 +++-
 11 files changed, 440 insertions(+), 12 deletions(-)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
