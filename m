Return-Path: <SRS0=5I1x=EZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E696C64E7D
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 00:39:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E08D9246A7
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 00:38:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JvJM+tkc";
	dkim=permerror (0-bit key) header.d=wdc.com header.i=@wdc.com header.b="jkHh6aOk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E08D9246A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=at0E00dc7xJMBVuvq+sCmYv2iK3n218YOfNB7C5ADvE=; b=JvJM+tkcuZVDDWdBtFb4Kh4dhc
	5J/GprIFHbMI41LiRsfqktU1V+P2Dn6rLvnnss/9cI01KUboGoJf4qg9l7lE8GCS7dtgxLW8VlwKx
	QoWi3W6cj4rbpBmAUHjrD9giCFPs0FxcVcpWuDybTePUmcmVRQ/5nBu36FB+/Wg8Oqq/bKavlXpby
	qjX94C8EGyo+zSA+7Ff5GCjEsehFTulEjcdb8xhytXaGnYg1a2vy+4bAT+06y+WZrD8VnDwOkH0IH
	6loa6/VJd18Eo7nkA7oVXvdhdQCSe9mHiN4AN/zcpk3DmdBIA5v77UBdFSEtwqc9xR87FE+suVB27
	XVIynvpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfXyI-0006Dd-JK; Thu, 19 Nov 2020 00:38:46 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfXyB-0006C3-DH; Thu, 19 Nov 2020 00:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605746718; x=1637282718;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ff0Sftjg7u8VcDfJoP3445LCpQ0dbvEgLQGePuE2VOU=;
 b=jkHh6aOkz3dLJ8T5wkzegNsPinpzLFYDuom2w4KjlBgHqyMnPxutODsh
 rPSLoXbKS+wGqHqD8S2HMn6TuFPTKoGZsyYtXTG0Rrm3j14WAbDU+Roja
 KWEYSyeYbnUVbtMBCxkpPRvPTtSvD3+TyfOQYadHR5AOP7c5wHh+0SxOU
 2CUQ0k22qySV3PpUEqqCDl3wtGWjmW+1gJ9Giry0ts93gmSdKjEAX2KdW
 kZE3/xUy468oPqREJTHqA2AOOwV+FVsofx5lWd33dGLk4mHHKmuxTsn6t
 Sysun1ft2vNQXZ4w41KNEpw3uCln6uwzXSU03S5FW8XQXAcgjl253S9ao A==;
IronPort-SDR: r6E+Jj6HvmKl/sR8ugY5DG/KKGBGbVIigNFs+g4RwjuEZNjB3K8zhQHfO0myQH1OyB0P+tHKE7
 WKKneR6AuA/EAOdIM1GfjeL71jA4x7XyUADWEa9R7ROagfOw1hDCyKxH3vu4nffgzqTUqRYjko
 db0cd3CTkQyGAzWlOq1dM9WoGioVmLgj0iallfveRj8RWEBNezUUrKuVbKf/0lnApLGGGbbf/b
 SLE6tx/3ffhqcPHPDtOVzHO3QuvZa79teEk7ce7GcG7ZnIPae8PT9LV+VddS3sGZskz9FQ7SxZ
 lWI=
X-IronPort-AV: E=Sophos;i="5.77,488,1596470400"; d="scan'208";a="256529092"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Nov 2020 08:45:13 +0800
IronPort-SDR: XKo4XIXHeZsf8bW8eh/5aUAb5QPtbdJAkCD4P0dwqxQLmWsO/ONnhD8Xo5p/xvCFpCghYOITWk
 D8i2rq0+A31i0vf5NhszoLcxQTS6Mwit6ceNXcl/TXzvvvK3j4Hu/u/OO8pQU/TtaB8ISbBQFq
 s+k9NdFH2xT2uWm7ZM4ceXfrLYDfrbu6Rk3PvebIl6lREXbq+GPOOqNigQrLlbboCt8eDyN4Cn
 HnfdHSDuffw86FnX49HGAh7Tq+H4SP5KvygNhAqch/a+nEQ2AeOayi0Z1tWOMTFQKDtvpeY+Jg
 Rvx8ih7aQZ9XMyBkjAnS6qp6
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 16:23:06 -0800
IronPort-SDR: t17QL4+3OacEm2ugsmhqCxFoCnuFeTaxOirT7uSgyxkksAzXqLXJiw2XBchqbwxpvy63lYrxEH
 XY82WWOGufFiCJDIX6Fh0sx8yrBdd2xfE7DZwY4g4Br/78QxYopWm5SEaleC+hO/OdOllBuBgf
 p+b3TUI3ygnlI6D0wHHh+enTpXPfkAkvHrrMg7y/SoJyvCJ9w9S0ZrC09PC3+DW8spf9HqSRaB
 1fX0vR3tpzf/LZR1/oDv+7wzztovDBUzxjShYlBwMLakAwjrO1mmkl0wJXre6XDVD8nwgdnQCM
 GKs=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.61.71])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Nov 2020 16:38:34 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/5] Unify NUMA implementation between ARM64 & RISC-V
Date: Wed, 18 Nov 2020 16:38:24 -0800
Message-Id: <20201119003829.1282810-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_193839_606901_94B89FBD 
X-CRM114-Status: GOOD (  20.05  )
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arch@vger.kernel.org, Zhengyuan Liu <liuzhengyuan@tj.kylinos.cn>,
 Baoquan He <bhe@redhat.com>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Steven Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
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
https://github.com/atishp04/linux/tree/5.11_numa_unified_v5

For RISC-V, the following qemu series is a pre-requisite(already available in upstream)
https://patchwork.kernel.org/project/qemu-devel/list/?series=303313

Testing:
RISC-V:
Tested in Qemu and 2 socket OmniXtend FPGA.

ARM64:
2 socket kunpeng920 (4 nodes around 250G a node)
Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Changes from v4->v5:
1. Added by Acked-by & Reviewed-by tags.
2. Swapped patch 1 & 2 in v4 version.

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
arm64, numa: Change the numa init functions name to be generic
numa: Move numa implementation to common code
riscv: Separate memory init from paging init
riscv: Add numa support for riscv64 platform

Greentime Hu (1):
riscv: Add support pte_protnone and pmd_protnone if
CONFIG_NUMA_BALANCING

arch/arm64/Kconfig                            |  1 +
arch/arm64/include/asm/numa.h                 | 48 +----------------
arch/arm64/kernel/acpi_numa.c                 | 12 -----
arch/arm64/mm/Makefile                        |  1 -
arch/arm64/mm/init.c                          |  4 +-
arch/riscv/Kconfig                            | 31 ++++++++++-
arch/riscv/include/asm/mmzone.h               | 13 +++++
arch/riscv/include/asm/numa.h                 |  8 +++
arch/riscv/include/asm/pci.h                  | 14 +++++
arch/riscv/include/asm/pgtable.h              | 21 ++++++++
arch/riscv/kernel/setup.c                     | 11 +++-
arch/riscv/kernel/smpboot.c                   | 12 ++++-
arch/riscv/mm/init.c                          | 10 +++-
drivers/base/Kconfig                          |  6 +++
drivers/base/Makefile                         |  1 +
.../mm/numa.c => drivers/base/arch_numa.c     | 27 ++++++++--
include/asm-generic/numa.h                    | 52 +++++++++++++++++++
17 files changed, 200 insertions(+), 72 deletions(-)
create mode 100644 arch/riscv/include/asm/mmzone.h
create mode 100644 arch/riscv/include/asm/numa.h
rename arch/arm64/mm/numa.c => drivers/base/arch_numa.c (96%)
create mode 100644 include/asm-generic/numa.h

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
