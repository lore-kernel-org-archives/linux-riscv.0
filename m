Return-Path: <SRS0=9SVT=C3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6293AC43463
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2020 20:13:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD27E2074B
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2020 20:13:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oQVfICdv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="qUkDDNx1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD27E2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1yeXsLsZDyINW1diu5WuzQRosXy32A5KuPhpJaFZfZc=; b=oQVfICdvYOEMHWYZ77njpNny07
	7AYd5S8QMPXohMBMz3BlFTMLiFLCjIZbsbG5V0MYZHhoDgbtqeHmgOnGUZFVGyt2HPfMexFooiB1A
	MlcBLidXzNss3g33sWMOqcbXeSWNUAw2+kzbGT/nIGzHQkqD2OjnPddc5WQ3R5Ag/+RKNLwAiS7Sa
	H1cyT+BtqixOGRDrSxf2Rd26KGWIjq3CViqcPkyMTEIJw/5WZ3J+afgbAhQaM+rkkUqB36/FlDECN
	Wsi6kh5m9VDRs1pmkMNTruXjTny3OeuipJZinAdOwxQr/67g3+s3Zd2i+26nJQ3DP8kzxV0VtCRpj
	b6S1hlNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJMkY-0006j9-6h; Fri, 18 Sep 2020 20:12:54 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJMkV-0006hb-Cy; Fri, 18 Sep 2020 20:12:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600459971; x=1631995971;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GI3H7FI5MM8SnAiJ9n4LYSUWOw7izossiuo/gw2bk/g=;
 b=qUkDDNx1I/eY9d7zbHl2ni++ucy8dFbo1uuL4DUTz3McrNXlwJRhmJUk
 kiMLzKrpN8PnlfnZO09/5X49MfO0wq7Pg5QquEoiXLal0UEKP4LJY1AVm
 64LQkmGI04DC/nykga0/v2pYvBbeI48hmMd9uafTBee9p05rIdkhMy5WC
 oaE4A7rveI8DVGhbB0usDogwEagq+nksd+6S1TQ8EFLW4VJg5VEhhP6OA
 6tgrsHiMq+GYDb6ZXCPW96SIC9CSddPOyLPrlJsCW3xVlT51aQXewmJHm
 AKNqwhiM332RfBPzegPNEZtsIVqFZ8Bzx0+KALA3N+LN0L89WqvYFa6RK g==;
IronPort-SDR: ZSJMhv0Syih6q38E988OpMAAy93a2mjT9tUFHVBaVBNPidYsSaFplgeWyn43hBMknPTXRcIK5Q
 52EjbYOVwXhBFI0tl1VgkGL1Iedn9Uys/+NbATnrSZOhvq67fdiPvYdbcsJLCoVW8UKvqCeH4R
 nMGmRvJTlfnDh14rROrK1ldTEPoFivTqKVsbPPqQ+rKMskZ701JtOShejz9VHEDD4/lr0xWjj9
 5bqJqk2WIQbrlFHpqxVsPdXTzPEDsivUONaoWmFPlherCcnuLjtRTRljXO7XLZWH+HkqRy2Vfl
 Im0=
X-IronPort-AV: E=Sophos;i="5.77,274,1596470400"; d="scan'208";a="147671103"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Sep 2020 04:12:47 +0800
IronPort-SDR: t7M5/x8wqdknAD2rrBujcOs6v/Vn6dksM8+SN+Nam9qpR5HpZmGixkjrdj6YH2JfgO7lWkXDlX
 jMMsIhkuf9gA==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 12:58:59 -0700
IronPort-SDR: Q+Z6LvVPGweJdIFY//I/72e4PvvW6vQGNmh+aBzgJ5z5U6FdHT4C8mw8luHFGSpwHXxbrFjjRP
 ymg46FROWaFQ==
WDCIronportException: Internal
Received: from us3v3d262.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.69])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Sep 2020 13:12:47 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFT PATCH v3 0/5] Unify NUMA implementation between ARM64 & RISC-V
Date: Fri, 18 Sep 2020 13:11:35 -0700
Message-Id: <20200918201140.3172284-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_161251_611776_C17AAF8F 
X-CRM114-Status: GOOD (  21.24  )
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
 linux-arch@vger.kernel.org, Anup Patel <anup@brainfault.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Steven Price <steven.price@arm.com>,
 Greentime Hu <greentime.hu@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
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

For RISC-V, the following qemu series is a pre-requisite(already available in upstream)
to test the patches in Qemu and 2 socket OmniXtend FPGA.

https://patchwork.kernel.org/project/qemu-devel/list/?series=303313

The patches are also available at

https://github.com/atishp04/linux/tree/5.10_numa_unified_v3

There may be some minor conflicts with Mike's cleanup series [2] depending on the
order in which these two series are being accepted. I can rebase on top his series
if required.

[2] https://lkml.org/lkml/2020/8/18/754

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
.../mm/numa.c => drivers/base/arch_numa.c     | 31 ++++++++++--
include/asm-generic/numa.h                    | 49 +++++++++++++++++++
17 files changed, 201 insertions(+), 70 deletions(-)
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
