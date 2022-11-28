Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D55C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 02:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZwkBlyYYyxmC4SSIFn/HjED+5NQkM3fk4Hmxl1MnKTc=; b=Cfn9FI/Ak0j5eC
	/B+8xePek06PAsg7YlVuiiUzoUFgVgtTE90Q9vTHzHec5Vfvyw4wi2fnsvw4QyH0OghC42nFZaGL5
	Y+OGklFqqe+trwz7LKVXfErZioQmd+tA3+qyWKHHthNmxmhLNUbkvEZdnw3MQSopffkmdMzOpw2OF
	BdE3k4s7i/S/trx2xhprk64YGnNYRQLL+OAGNnBKCcLgIRxXZw0/yDoXibTnEywBqR1CPaxRCI9+e
	HaM8fqpPwOhKmd3lIYCFfzRH749J+zag05BCgdsSskZ/fjtKh56frcewzcafke3pX034/urWeIpmd
	kL2REQ0Pd0J8i7+NiRyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozTqy-00EzPt-Lj; Mon, 28 Nov 2022 02:26:40 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozTqu-00EzL8-JC
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 02:26:39 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-05 (Coremail) with SMTP id zQCowADn7OxNHIRjZ4jlAg--.15084S2;
	Mon, 28 Nov 2022 10:26:22 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	conor@kernel.org,
	ajones@ventanamicro.com,
	alex@ghiti.fr,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v8 0/3] riscv, mm: detect svnapot cpu support at runtime
Date: Mon, 28 Nov 2022 10:26:06 +0800
Message-Id: <20221128022609.328714-1-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
X-CM-TRANSID: zQCowADn7OxNHIRjZ4jlAg--.15084S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1rZw1UJw43Jr13WrW3Jrb_yoW8uFyrpF
	WYkrn3GF98Ar93GF1fur9F9rn5Jw1rKFWaqw1xJ34UAwsxJayUZ390yFn8Ca1kXFWfXw4I
	kF45uFy3ua4DZ37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwAKzVCY07xG64k0F24l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
	DU0xZFpf9x0JUBSoJUUUUU=
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCgEEDGODm0rAVAAAsm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_182637_046579_19B1115E 
X-CRM114-Status: UNSURE (   9.54  )
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
page. This patch set is for using Svnapot in hugetlb fs and huge vmap.

This patchset adds a Kconfig item for using Svnapot in
"Platform type"->"SVNAPOT extension support". Its default value is on,
and people can set it off if they don't allow kernel to detect Svnapot
hardware support and leverage it.

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
Changes in v7:
  - add napot_cont_order for possible more napot order in the future
  - remove linear mapping related code from this patchset to another patch
  - refactor hugetlb code for svnapot according to thanks @Andrew @Conor
  - use tools/testing/selftests/vm/map_hugetlb as hugetlb testing program
  - support svnapot in huge vmap on newer for-next branch
Changes in v8:
  - fix compilation errors in rv32_defconfig
  - insert some lines of whitespace according to @Conor's suggestion


Qinglin Pan (3):
  riscv: mm: modify pte format for Svnapot
  riscv: mm: support Svnapot in hugetlb page
  riscv: mm: support Svnapot in huge vmap

 arch/riscv/Kconfig                  |  16 +-
 arch/riscv/include/asm/hugetlb.h    |  34 +++-
 arch/riscv/include/asm/hwcap.h      |   4 +
 arch/riscv/include/asm/page.h       |   5 -
 arch/riscv/include/asm/pgtable-64.h |  34 ++++
 arch/riscv/include/asm/pgtable.h    |  39 +++-
 arch/riscv/include/asm/vmalloc.h    |  61 +++++-
 arch/riscv/kernel/cpu.c             |   1 +
 arch/riscv/kernel/cpufeature.c      |   1 +
 arch/riscv/mm/hugetlbpage.c         | 294 ++++++++++++++++++++++++++++
 10 files changed, 480 insertions(+), 9 deletions(-)

-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
