Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DA8CD342F
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 08:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4D75TJaTWp721pN66G6CtLc1h5n64g9OFkaOrzWmh5s=; b=z9JP6uwd2LPjUc
	NFXQKr7W4VeTBtVqXfcQCs0eM/G5YY55NOUqYwQX88R/VqT9c67+NNFzSSc6nkMmQSCu3kCtGgk0c
	zr3nMWUWax4NCX9rWMksZlLA26CUH45HGBgnakWJsAhAD5e2n0NEAcghiuyk/arJZ/voP+fR/Quiw
	BNcNg/EXAoKcBlxVzXMnUhziUyl64ccF2sANsLRiphAqEw8rRE1X+MX57hu3AHxLwQfxh0a+29ZVI
	vfCIIU6xUERserY/AOy0X39nUGjGZ1vV/GfP4vqsjTARZN8AFRCg1MvDMNGMAq+sf0cknP1QWEhla
	qM8ANl/sGCYzTggc2VFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGRn-00000005yfC-1QrL;
	Fri, 08 May 2026 08:20:36 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGRi-00000005ydk-2PiY
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 08:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778228425; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=+7QdPcCzeWAnAa1oaJ9PNAr6xemcX6oyHA0viBSsOL0=;
	b=yWILmYOdCyM+kzmfMrwBHzapYkRrJFMFs3GqqtRfoIHnWAqrtNFE8nxGPsEiwz2uayUnErusR8P1zF6Ot1r3qbuQRZMfkK1aDW/FwY0Gtdzckgbvw8xpvW4CS0e+E/wp+aSdpNgsIfQTGiebU159FieZ1QBdSowFfa5PuMGb0HI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0X2WlM8y_1778228422;
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X2WlM8y_1778228422 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 08 May 2026 16:20:24 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	rafael@kernel.org,
	tony.luck@intel.com,
	bp@alien8.de,
	guohanjun@huawei.com,
	mchehab@kernel.org,
	xueshuai@linux.alibaba.com,
	lenb@kernel.org,
	saket.dumbre@intel.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Ruidong Tian <tianruidong@linux.alibaba.com>
Subject: [PATCH 0/3] riscv: log Hardware Error Exception via APEI
Date: Fri,  8 May 2026 16:20:17 +0800
Message-ID: <20260508082020.3368109-1-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_012031_159259_8771A691 
X-CRM114-Status: UNSURE (   9.42  )
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

This series extends the handling of do_trap_hardware_error() based on
the works in [1].

RISC-V already dispatches Hardware Error Exception (cause 19, "HEE") via
do_trap_hardware_error(), but today the trap handler has no way to learn
*what* went wrong: the offending task is killed (or the kernel panics)
with no diagnostic about the underlying hardware fault, no error record
is logged, no page is isolated, and memory_failure() is never invoked.

There are two principal ways to obtain hardware error information on
HEE:

  1. Let firmware parse platform error registers and hand the kernel a
     standardized CPER record through ACPI / APEI / GHES.
  2. Have the kernel read the error registers directly.

Option (2) is not yet viable on RISC-V: the architecture does not
define a unified, mandatory layout for hardware error status registers
across implementations, so there is nothing stable for common code to
decode. This series therefore implements option (1) and wires HEE into
the existing APEI / GHES path, mirroring how arm64 treats SEA.

Future work: option (2) is not ruled out. Once the RISC-V architecture
standardizes a common hardware error register layout (either as part
of the privileged spec or via a well-defined SBI / ACPI namespace
interface), a kernel-native decoder could be added alongside the
ACPI/APEI path. The two can then coexist and be selected per
platform through a Kconfig choice. This series keeps the door open
by routing HEE through apei_claim_hee() behind CONFIG_ACPI_APEI_HEE,
so disabling that config already restores the legacy path and does
not block a future native decoder from being wired in.

After this series:

  * Firmware reports RAS events to the OS as CPER records through a
    HEST GHES entry whose notification type is HEE (new value 13).
  * If CONFIG_ACPI_APEI_HEE is set, do_trap_hardware_error() calls
    apei_claim_hee() first. On success GHES queues the record, drains
    irq_work inline, and delivers a BUS_MCEERR_AR SIGBUS to the faulting
    user task via task_work after isolating the poisoned page with 
    memory_failure(MF_ACTION_REQUIRED).
  * If firmware does not claim the error or CONFIG_ACPI_APEI_HEE not set:
      - user mode falls back to SIGBUS / BUS_MCEERR_AR via do_trap_error(),
      - kernel mode tries fixup_exception() to let MC-safe copy routines
        recover; otherwise die().

References:
----------
[1] [RISC-V RAS patch]: https://lore.kernel.org/all/20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com/

Ruidong Tian (3):
  acpi: Introduce HEE in HEST notification types
  riscv: Introduce HEST HEE notification handlers for APEI
  riscv: collect hardware error information via APEI on HEE

 arch/riscv/include/asm/acpi.h   |  2 +
 arch/riscv/include/asm/fixmap.h |  3 ++
 arch/riscv/kernel/acpi.c        | 54 ++++++++++++++++++++++++++
 arch/riscv/kernel/traps.c       | 35 ++++++++++++++++-
 drivers/acpi/apei/Kconfig       | 12 ++++++
 drivers/acpi/apei/ghes.c        | 68 ++++++++++++++++++++++++++++++++-
 include/acpi/actbl1.h           |  3 +-
 include/acpi/ghes.h             |  6 +++
 8 files changed, 178 insertions(+), 5 deletions(-)

-- 
2.51.2.612.gdc70283dfc


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
