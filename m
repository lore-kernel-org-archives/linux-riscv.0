Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F28C64EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:16:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C228A2064D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:16:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C2i82x6l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="HF9XMB6x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C228A2064D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=scec3WC7rCE0L6WYqWnve4cIW6Jb+r/8VIou7Bt712I=; b=C2i
	82x6lHlZBf6nwzKU53S8aqgU9P7Dh2m3vMD2AcN2mOo80qy1Pzl1aUCrPJLH93gj/i0lM0TPLz54N
	7s69l2yJn5ZuYPU8/LIwPWwyqj4j+b0GXJsp6M/EKWuKmUay/BYGiTiQlCl9eCWqJ2Yk9qBWXkJcT
	ufutXu1dD2EgCqWyVIk0POsht9CZ2DqKYnXzeud03oF9g9aQE8YCItOZUYIvDZvXdVQ5UqkInPH88
	Mg07U3SAdDaOxJ6si1ImWN/oDj+51tkmB+VGGDGffB/m5aCDP2WSeqaWd3MRn6WASEhunYl8qXYeh
	MVAslRODjdXvkprYAEJUXRTrUAaRVFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7Q9e-0006Ex-35; Tue, 02 Oct 2018 19:16:22 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7Q91-0004j9-UM
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 19:16:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1538507744; x=1570043744;
 h=from:to:cc:subject:date:message-id;
 bh=rMPk8dxyx5CybRX2rxrSyOX33/pWDxcvGzCyMW0+dcU=;
 b=HF9XMB6x3eKC3ythOpohqHdpA/7FhxUErSJv5NUGm7nfkgwcNH2D7PG2
 E+So716w6E1wB29IZaG7kHC4zDXcMSHewdI4i3ZHEpXcHmFSaxG1uRNw4
 LaJVCLFm+qwgYrUz0G5akIukRc2STiQkxYcYj9KkqbccToOrBAycgPxSd
 EAdGUbvYlzGGz5fwZBPv0W5ybJvVHdSW8qMmsH4aFy6Ql7f7Jx+I0c1Hc
 Q8YdAaZF005oNPeDkTaRyAOV0tkuj9gnb1DNZXzUfeXYvYN/eM2w97Jxy
 +YVpjP3hCokDp4ctSC+a9LmcByA90UXo1RoTz5+/7saGWL2mAIXzeVZzD Q==;
X-IronPort-AV: E=Sophos;i="5.54,332,1534780800"; d="scan'208";a="92732902"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Oct 2018 03:15:12 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 02 Oct 2018 12:00:49 -0700
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Oct 2018 12:15:09 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org,
	palmer@sifive.com
Subject: [PATCH v6 00/14] SMP cleanup and new features
Date: Tue,  2 Oct 2018 12:14:53 -0700
Message-Id: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_121544_057168_0FBFFB49 
X-CRM114-Status: GOOD (  10.89  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: hch@infradead.org, anup@brainfault.org, linux-kernel@vger.kernel.org,
 atish.patra@wdc.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002191453.DfUJDvAx7iSRuhpHbuUtsQDd1916pK9AFy5S3jQ0-FA@z>

This patch series now has evolved to contain several related changes.

1. Updated the assorted cleanup series by palmer.
The original cleanup patch series can be found here.
http://lists.infradead.org/pipermail/linux-riscv/2018-August/001232.html

2. Implemented decoupling linux logical CPU ids from hart id.
Some of the work has been inspired from ARM64.
Tested on QEMU & HighFive Unleashed board with/without SMP enabled.

3. Included Anup's cleanup and IPI stat patch.

All the patch series have been combined to avoid conflicts as a lot
of common code is changed different patch sets. I have mostly addressed
review comments and fixed checkpatch errors from palmer's and anup's series.

v1->v2:

1. Dropped cpu_ops patch.
2. Moved back IRQ cause definitions to irq.h
3. Keep boot CPU hart id and assign zero as the CPU id for boot CPU.
4. Renamed CPU id and hart id correctly.

v2-v3:

1. Added cleanup patches from palmer.
2. Moved the hotplug related functions to it's own file.
3. Updated stub functions as per coding guidelines.
4. Renamed __cpu_logical_map to a more coherent name.

v3-v4:

1. Addressed minor typos in commit text and code.
2. Included Anup's do_IRQ patch.
3. Dropped CPU hotplug patch. As there are some concerns
   about approach, I will submit it separately.

v4->v5:

1. Minor typo fixes in commit text.

v5->v6:
1. Included Anup's IPI stat and cpuinfo patch.
2. Fixed a typo cpuid_to_hardid_map->cpuid_to_hartid_map 


Anup Patel (3):
  RISC-V: No need to pass scause as arg to do_IRQ()
  RISC-V: Show CPU ID and Hart ID separately in /proc/cpuinfo
  RISC-V: Show IPI stats

Atish Patra (4):
  RISC-V: Disable preemption before enabling interrupts
  RISC-V: Use WRITE_ONCE instead of direct access
  RISC-V: Add logical CPU indexing for RISC-V
  RISC-V: Use Linux logical CPU number instead of hartid

Palmer Dabbelt (7):
  RISC-V: Don't set cacheinfo.{physical_line_partition,attributes}
  RISC-V: Filter ISA and MMU values in cpuinfo
  RISC-V: Comment on the TLB flush in smp_callin()
  RISC-V: Provide a cleaner raw_smp_processor_id()
  RISC-V: Rename riscv_of_processor_hart to riscv_of_processor_hartid
  RISC-V: Rename im_okay_therefore_i_am to found_boot_cpu
  RISC-V: Use mmgrab()

 arch/riscv/include/asm/processor.h |  2 +-
 arch/riscv/include/asm/smp.h       | 47 +++++++++++++++-----
 arch/riscv/include/asm/tlbflush.h  | 16 +++++--
 arch/riscv/kernel/cacheinfo.c      |  7 ---
 arch/riscv/kernel/cpu.c            | 87 ++++++++++++++++++++++++++++++++------
 arch/riscv/kernel/entry.S          |  1 -
 arch/riscv/kernel/head.S           |  4 +-
 arch/riscv/kernel/irq.c            | 12 +++++-
 arch/riscv/kernel/setup.c          | 10 +++++
 arch/riscv/kernel/smp.c            | 82 ++++++++++++++++++++++++++++-------
 arch/riscv/kernel/smpboot.c        | 46 ++++++++++++++------
 drivers/clocksource/riscv_timer.c  | 12 ++++--
 drivers/irqchip/irq-sifive-plic.c  | 10 +++--
 13 files changed, 259 insertions(+), 77 deletions(-)

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
