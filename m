Return-Path: <SRS0=uiah=DN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B33C4363D
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 00:18:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28CE0206F4
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 00:18:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yhRyrHYf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Nvjm5XjT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28CE0206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vtxzs3ibBGFzBiKKrekOSLQKqiB6ruILKwEMfbwea9A=; b=yhRyrHYfNDWellJR6B6LwC+Qel
	Z83SrGzozsNgVL7Y3eHEs5rHfpYOv8VFvdOjeOCbVKe8jdsoXFsFzhSO1f6FnqlV/sfT8IFaZjpkZ
	x93ZN5Vd3AgvsbRuwwQSbsWpbkJ07Y/L5lVzOF2r1yVH6z9Yx6Jh6IjrLEVLefN+6RofQUSpoMAIc
	BL22M/ODBUZ6JIYHVdQPuDEkWXlb1kAsKxojVpgluwuvG5Y1673wzFAe1XAdx5xlt5MNQHR07KsCb
	IoK0mIKffumlbkquHy8H5hOxhtCbFbtfWBWXwVvmaFcDDGTUvsN2zgXPs6uVrr8/DxrMRPWWjy3pB
	kxD0CH0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPagB-0006rB-TV; Tue, 06 Oct 2020 00:18:07 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPag7-0006oV-Hs; Tue, 06 Oct 2020 00:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1601943483; x=1633479483;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QAwKU8lAOts2CUnPA+WBIUI5CpZVX/yVSp78aPQvNQI=;
 b=Nvjm5XjTbG0yuHjRU3ySxK22x3yw3qrq3JjrHNfC2qxeRINN4ZMP8j4u
 EJ9hY05C/6ZySIoRdpRNoTVwd6bgEuBdf40SmCQgyjrQ5GEtazeFruJKR
 sewBJRbMX2R/W6QnzAqKNu84A7a1GjW+n2uQnjE/ft5tnkTF50u4QCOT0
 nsJPZbLjOJcES//ZrYBPnFB437S17ZckUAiSui1hfISEgTjxvvgLdS7f/
 jxMGSCIk09YdawGVAnNDnPZ61A0JjQJNfVqDoZdl4CAE17eMcQqY/1hCB
 wkh3MwVJq5GrRe4yvabtvCX1LgfRzGq0hIG3K2l5vK61ebeyKDnOC+R5+ A==;
IronPort-SDR: /NT84a2N1jh8pmfje69F4C7gmC+/0tasuTPs9Xwv/gLa/3dekqlNMYREJvZjJS1EHhAj4HBNi+
 cimGpp6UNCzFCS+LpIVxnPZx6CtPvzbpA185BMUuRWEMwKRR8RW1cWlDAqlpjj1DYL3fY0/yCQ
 XmhPqVsI3F1hg8MrhCffEQty7h0E+nKm7K+LSBaOi1UQUY77msxNHUlM7Ea8iSHhO9OYgyBydB
 MW747g5ts/Iu9Mik+KGdWsIFQvW6MU/U1dsDwctPejopcN8LWB3AV4FpngB67COtcH+RpuA3uH
 06s=
X-IronPort-AV: E=Sophos;i="5.77,341,1596470400"; d="scan'208";a="153530914"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 06 Oct 2020 08:17:56 +0800
IronPort-SDR: ia2r14+IUZfZHV8owtXSibtteW/lyCVdAtsG9QHiceq7n/CUBW8RFEZ1jJ59M5whWPzOduYPzF
 b2Plr1gxR5fA==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 17:04:42 -0700
IronPort-SDR: Neg4gQXFt16GausLnkBfK7NTrO7uOhLbWHdiEHDf+HDtgOth4FjfITodd3H2Qum9/EAwzsM5gp
 ULdHQ5pTY/EA==
WDCIronportException: Internal
Received: from b9f8262.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.253])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 Oct 2020 17:17:55 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] Unify NUMA implementation between ARM64 & RISC-V
Date: Mon,  5 Oct 2020 17:17:47 -0700
Message-Id: <20201006001752.248564-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_201803_786110_5457CB23 
X-CRM114-Status: GOOD (  21.51  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Atish Patra <atish.patra@wdc.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, Jia He <justin.he@arm.com>,
 Anup Patel <anup@brainfault.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Steven Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series attempts to move the ARM64 numa implementation to common
code so that RISC-V can leverage that as well instead of reimplementing
it again.

RISC-V specific bits are based on initial work done by Greentime Hu [1] but
modified to reuse the common implementation to avoid duplication.

[1] https://lkml.org/lkml/2020/1/10/233

This series has been tested on qemu with numa enabled for both RISC-V & ARM64.
It would be great if somebody can test it on numa capable ARM64 hardware platforms.
This patch series doesn't modify the maintainers list for the common code (arch_numa)
as I am not sure if somebody from ARM64 community or Greg should take up the
maintainership. Ganapatrao was the original author of the arm64 version.
I would be happy to update that in the next revision once it is decided.

# numactl --hardware
available: 2 nodes (0-1)
node 0 cpus: 0 1 2 3
node 0 size: 486 MB
node 0 free: 470 MB
node 1 cpus: 4 5 6 7
node 1 size: 424 MB
node 1 free: 408 MB
node distances:
node   0   1 
  0:  10  20 
  1:  20  10 
# numactl -show
policy: default
preferred node: current
physcpubind: 0 1 2 3 4 5 6 7 
cpubind: 0 1 
nodebind: 0 1 
membind: 0 1 

The patches are also available at
https://github.com/atishp04/linux/tree/5.10_numa_unified_v4

For RISC-V, the following qemu series is a pre-requisite(already available in upstream)
https://patchwork.kernel.org/project/qemu-devel/list/?series=303313

Testing:
RISC-V:
Tested in Qemu and 2 socket OmniXtend FPGA.

ARM64:
2 socket kunpeng920 (4 nodes around 250G a node)
Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

There may be some minor conflicts with Mike's cleanup series [2] depending on the
order in which these two series are being accepted. I can rebase on top his series
if required.

[2] https://lkml.org/lkml/2020/8/18/754

Changes from v3->v4:
1. Removed redundant duplicate header.
2. Added Reviewed-by tags.

Changes from v2->v3:
1. Added Acked-by/Reviewed-by tags.
2. Replaced asm/acpi.h with linux/acpi.h
3. Defined arch_acpi_numa_init as static.

Changes from v1->v2:
1. Replaced ARM64 specific compile time protection with ACPI specific ones.
2. Dropped common pcibus_to_node changes. Added required changes in RISC-V. 
3. Fixed few typos.

Atish Patra (4):
numa: Move numa implementation to common code
arm64, numa: Change the numa init functions name to be generic
riscv: Separate memory init from paging init
riscv: Add numa support for riscv64 platform

Greentime Hu (1):
riscv: Add support pte_protnone and pmd_protnone if
CONFIG_NUMA_BALANCING

arch/arm64/Kconfig                            |  1 +
arch/arm64/include/asm/numa.h                 | 45 +----------------
arch/arm64/kernel/acpi_numa.c                 | 13 -----
arch/arm64/mm/Makefile                        |  1 -
arch/arm64/mm/init.c                          |  4 +-
arch/riscv/Kconfig                            | 31 +++++++++++-
arch/riscv/include/asm/mmzone.h               | 13 +++++
arch/riscv/include/asm/numa.h                 |  8 +++
arch/riscv/include/asm/pci.h                  | 14 ++++++
arch/riscv/include/asm/pgtable.h              | 21 ++++++++
arch/riscv/kernel/setup.c                     | 11 ++++-
arch/riscv/kernel/smpboot.c                   | 12 ++++-
arch/riscv/mm/init.c                          | 10 +++-
drivers/base/Kconfig                          |  6 +++
drivers/base/Makefile                         |  1 +
.../mm/numa.c => drivers/base/arch_numa.c     | 30 ++++++++++--
include/asm-generic/numa.h                    | 49 +++++++++++++++++++
17 files changed, 199 insertions(+), 71 deletions(-)
create mode 100644 arch/riscv/include/asm/mmzone.h
create mode 100644 arch/riscv/include/asm/numa.h
rename arch/arm64/mm/numa.c => drivers/base/arch_numa.c (95%)
create mode 100644 include/asm-generic/numa.h

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
