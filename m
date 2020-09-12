Return-Path: <SRS0=wYeJ=CV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 385C7C43461
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2020 01:35:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 790AE221EB
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2020 01:35:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uT6TL98E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="MXYSmVSq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 790AE221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WVZFGxr2uEUS6Oq2kFfupF7dNMUyZoe2ygu70gDqFOo=; b=uT6TL98Ep5vrzd/30c4vs8iWMz
	xMwf4Lqx6CGJQgFqRy0Nwa/hLh4DCV/SQOs28ipd/IC6IOttoMsJ7WMFBzFvWk8jQzQ9ftKht7z0J
	hZr950ZB37Exip5OVmvF+ramcttYwjz0JabvSFt2Q5NDyC07XzhNlB6Elp3fTURNuR2MxJk1bCo4r
	vWBxpEW9W9PgdCV6W94C7f9Q/YZtqPDiL+rbxp7ALUdkGwa2uaMgrSHENACUQR4Q4Rw6z09RQ0rSN
	NKbYElIp1hj7um2qYq3D2vWa3dGez6A0qZMYfZiPaIFbutJETqYy9p24+rZrnQRLsXobn6VsX5rjY
	13KXmu9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGuRE-0003vC-Vy; Sat, 12 Sep 2020 01:34:49 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGuRC-0003tl-Jx
 for linux-riscv@lists.infradead.org; Sat, 12 Sep 2020 01:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1599874486; x=1631410486;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i2IoWykb7HuBzS5tSv/XkodyucYzXuuq1LC24xxJfzE=;
 b=MXYSmVSqFyQqh2s9bSwOob2T56JrY/AZRshAt6C5cGrgUMprFwXoPuC6
 ZUkRQjLLosrRGZynV2qMhCdiferwO2mz94zlGQSjwLDv6x5D91i4mE8P7
 JpC0WOnKv7DBNtE328Ls4Oamj2KvHI4ea95OZvzhaFzCeLNvRIzv6o/lL
 k65e54xESuWXS+vIs2CiJDn1sj3SVlnDucA8lPpkNgl1MqqJJKRkbiru9
 9VUItaszdnovs3DVENr9qH+YexlILBru5Ai69UCNx7odnB7c2bmmwjosx
 LEnCI6TQsoFA7zXHqmm8v48qjLdickhoEYfUQVWDmzchCdziUCWUcDucA Q==;
IronPort-SDR: SBMmx547EbraOkX/+OwNSXsfkKjgf8MooYOxdDIxrQqVNRA8hMiymOXvgTflxVaGJaOb3mjnQi
 z2voUoyjfHnQiT/W9ovmWhqn7C7/2px71yl5Xgwbs8lJI7ZjQs8vhDaUImnvLfdJ1chwrrC1Gf
 D3xrnXFqTcxiXgKZazbtJE1k/6q7O0rQwOtJBlKrGqB0tymFQyW5lBdaclp7gKXMB1YDjVt3cS
 dMut4vJ+xMhpd7zd5i9L06QfXbFElaRLMS3K2GecJsZ0PTN08sSv64dHIZt3ZPRW6D9+wyhYyZ
 0bM=
X-IronPort-AV: E=Sophos;i="5.76,418,1592841600"; d="scan'208";a="256787988"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Sep 2020 09:34:44 +0800
IronPort-SDR: df1nhfVbQBcaAAAXLCP4q/h1VNFPYKekKZsxZWNylL6M3IVmBEa7X4a0oPBl+iqL0bnsVAFOSz
 HI3vKV8kK0aQ==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 18:21:05 -0700
IronPort-SDR: qY7VYxrseh/RhlJyz0RffEAYIQCptuw4PxQZLocbWF4FJBaQ1dwdimjIbbFKG27t6x/UoB0VY3
 Phe+TTHjGIXA==
WDCIronportException: Internal
Received: from unknown (HELO jedi-01.hgst.com) ([10.86.59.229])
 by uls-op-cesaip02.wdc.com with ESMTP; 11 Sep 2020 18:34:44 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC/RFT PATCH v2 0/5] Unify NUMA implementation between ARM64 &
 RISC-V
Date: Fri, 11 Sep 2020 18:34:36 -0700
Message-Id: <20200912013441.9730-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_213446_847504_641F857F 
X-CRM114-Status: GOOD (  21.04  )
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
Cc: David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Atish Patra <atish.patra@wdc.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, Jia He <justin.he@arm.com>,
 Anup Patel <anup@brainfault.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Steven Price <steven.price@arm.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Greentime Hu <greentime.hu@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
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

For RISC-V, the following qemu series is a pre-requisite(already available in upstream)
to test the patches in Qemu and 2 socket OmniXtend FPGA.

https://patchwork.kernel.org/project/qemu-devel/list/?series=303313

The patches are also available at

https://github.com/atishp04/linux/tree/5.10_numa_unified_v2

There may be some minor conflicts with Mike's cleanup series [2] depending on the
order in which these two series are being accepted. I can rebase on top his series
if required.

[2] https://lkml.org/lkml/2020/8/18/754

Atish Patra (4):
numa: Move numa implementation to common code
arm64, numa: Change the numa init function name to be generic
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
.../mm/numa.c => drivers/base/arch_numa.c     | 29 +++++++++--
include/asm-generic/numa.h                    | 49 +++++++++++++++++++
17 files changed, 200 insertions(+), 69 deletions(-)
create mode 100644 arch/riscv/include/asm/mmzone.h
create mode 100644 arch/riscv/include/asm/numa.h
rename arch/arm64/mm/numa.c => drivers/base/arch_numa.c (95%)
create mode 100644 include/asm-generic/numa.h

--
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
