Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5483CC4452B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 07:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iqKZfvi8/DdMJexJuUlj31RjYjeJ60sq/EZnqBnWDig=; b=LuZqtDN75msef2
	5APF6qk2n45OI4sVQaGNS8uF0oTT30MIrJdZPOlQvfmVIEdYCV0pOkUwwXmSlqctrWHCr/c8Vxwa9
	Xqa2KQ0Q0oRucZvqeLfhLqNbi5TwatR1a+T4H/FFi2z0VK9UWs0WTSZ772J+79NhfztQvqHIXJ/wo
	l/NsKSOkQxlz999+0N7+j9Q+6vhyCaKpnin/HYgCevpvylAbSkujRO7AEPFw6bsNCa7oN+OPcxVNS
	g7+j9S3ngHBgXI0x3/UzKiqfVTr9AcR1dolLYVjrHlXHsPMyl+BWdBKe0l7ZOUKq9Kg1OVzgTXryE
	CdcTrNM8ZWYjXVN/YOsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5N1-00000008jGb-1F4x;
	Tue, 21 Jul 2026 07:58:31 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5My-00000008jEY-1S2D
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 07:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id; bh=XK/HnDp6PjMUdSQsB7EyanKLgIWEHt+IDQvqOHHSn0M=; b=l
	0fQCjiqMKcNbFeemG9D7H+ULjeq12BBr/NS7SXrPwtZbeYVXah1uI2qZTZbOWdYG
	FlKWgB7+UFeY7y4Q7/USgY7pXOhYPey7/1cL9LvYFQ1cweK8KZBiu1U51GKQopFm
	xry7ce3eZHAWRXd3nrHFbff1S3IW3tmt7YE1s87ZHk=
Received: from localhost.localdomain (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkOyJl9q4GgUAA--.17568S2;
	Tue, 21 Jul 2026 15:58:46 +0800 (CST)
From: Xie Bo <xb@ultrarisc.com>
To: linux-riscv@lists.infradead.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-kernel@vger.kernel.org,
	Xie Bo <xb@ultrarisc.com>
Subject: [RFC PATCH 0/3] riscv: Add supervisor pointer masking infrastructure
Date: Tue, 21 Jul 2026 15:58:09 +0800
Message-Id: <20260721075812.82708-1-xb@ultrarisc.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: AQAAfwAnEkOyJl9q4GgUAA--.17568S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr1DZr4fAFy5Jry8Cr18AFb_yoW5CF1UpF
	s5Gr1rCrs5CF92k3y3A3yDu34rXws5G3y3W3Z3Ary8AF43tFyUZws0q3ZFvF909FW8Xr10
	9F4Yk3WFka4UAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUva14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyT
	uYvjfUYfHjUUUUU
X-CM-SenderInfo: l0e63zxwud2x1vfou0bp/1tbiAQAOB2pdm1EAHAAJsg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005828_883710_3C389F14 
X-CRM114-Status: GOOD (  10.28  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RVA23 requires an Sspm execution environment to provide supervisor-mode
pointer masking with at least PMLEN=0 and PMLEN=7. SBI 3.0 FWFT provides
the standard per-hart interface for selecting that value.

This RFC adds the architecture-private lifecycle needed by a future
in-kernel tagged-pointer consumer. It deliberately does not enable pointer
masking at boot and adds no userspace ABI, DT binding, hwprobe key, HWCAP,
or cpuinfo token.

The consumer API performs an all-online-hart PMLEN=7 transaction. It only
publishes success after every online hart accepts the setting, rolls back
the complete mask before publishing failure, and rejects an incompatible
hart before it becomes online after successful enablement.

The lifecycle code also restores a known setting across CPU hotplug and
hibernation, clears retained state at boot, and clears every hart at its
final kexec handoff point so an older successor kernel cannot inherit
PMLEN=7. Returning to normal execution with an unknown retained PMLEN is
treated as fatal.

Patch 2 is an independent RISC-V kexec fix: KEXEC_FILE-only SMP builds
need HOTPLUG_CPU for machine_shutdown() to offline secondary harts. It
is placed before the Sspm lifecycle code because safe outgoing handoff
depends on that guarantee.

There is no tagged-pointer consumer in this series. I am sending this as an
RFC to get feedback on the API, lifecycle boundaries, failure policy, and
whether the infrastructure should instead be carried with its first
consumer.

Specifications:

  Pointer Masking Extensions, version 1.0
  https://docs.riscv.org/reference/isa/v20260120/priv/zpm.html

  RISC-V SBI specification, FWFT extension
  https://docs.riscv.org/reference/sbi/_attachments/riscv-sbi.pdf

Tested on Linux v7.2-rc4 with a RISC-V cross compiler:

  - W=1 builds with CONFIG_RISCV_ISA_SSPM=y and disabled
  - KEXEC_FILE=y, KEXEC=n SMP configuration selects HOTPLUG_CPU
  - strict checkpatch (apart from the generic new-file MAINTAINERS warning)
  - sequential git apply --check against v7.2-rc4

Runtime SBI 3.0 FWFT, CPU hotplug, hibernation, kexec, and crash-kexec
tests have not yet been performed.

Xie Bo (3):
  riscv: sbi: Add FWFT get helper
  riscv: kexec: Select HOTPLUG_CPU for KEXEC_FILE
  riscv: Add supervisor pointer masking control

 arch/riscv/Kconfig                |  23 ++++
 arch/riscv/include/asm/sbi.h      |   1 +
 arch/riscv/include/asm/sspm.h     |  78 ++++++++++++
 arch/riscv/kernel/Makefile        |   1 +
 arch/riscv/kernel/cpu-hotplug.c   |   3 +-
 arch/riscv/kernel/hibernate.c     |  12 ++
 arch/riscv/kernel/machine_kexec.c |  10 +-
 arch/riscv/kernel/sbi.c           |  29 +++++
 arch/riscv/kernel/setup.c         |   2 +
 arch/riscv/kernel/smp.c           |   2 +
 arch/riscv/kernel/smpboot.c       |  11 +-
 arch/riscv/kernel/sspm.c          | 202 ++++++++++++++++++++++++++++++
 12 files changed, 368 insertions(+), 6 deletions(-)
 create mode 100644 arch/riscv/include/asm/sspm.h
 create mode 100644 arch/riscv/kernel/sspm.c

base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
