Return-Path: <SRS0=Z5mV=BY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB30C433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 21:48:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13D1020716
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 21:48:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JG8PbeUx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="h1zCGcFe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13D1020716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g7FnBa+cFRp6xFqxL4XEpiRkg3SuYfjGCP5DWoDTikA=; b=JG8PbeUxHWhBn/v0yDZfE599cT
	2IV2ltzUZyY4QSXoto6QF6cS3A1H1GruafvoAlOcphbEopA9WC7MnPMAxMCSMVtT46K93tFAIGtNC
	4w+0zpeH/7NETlmWvYKOBU5kLCxGEQpRU8WliNm0U+n29yU2zLVEiWa1VTAtTYcLybN/U400jxrD3
	93BjGXMcV5HZUH/tqr/aCskbTLg+bne6QyVD5BLijRYv2QKdOzS7Va+BPbkJB9i7jttTIhzXo527o
	SxUylBPgzEUSs4DKoqOMUX0yY4R7DCwkvLknxPX2wkNibwVkcU3Mwhg1+DbtZnRsZ0nZuNChoouZm
	Xf0xzVsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6hYw-0008K8-P4; Fri, 14 Aug 2020 21:48:34 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6hYt-0008IE-G8; Fri, 14 Aug 2020 21:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1597441711; x=1628977711;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cVOIibxYR9Eik4Y9Pl2EwMku9T0o7D2+6lin3phBclo=;
 b=h1zCGcFeF87CVTl6o+ycPL+r/jg/AKOTZyKOf1J0CYKHIzkEon9N9izX
 QrdBUAsUvQQ67FTYeJBQtXsYr4bnpBcc7Mz6fiRtoTeYmonWqwrHP8wYy
 KhVPes75Xu5vixh2KbNcuLfqnf+svFhSK802NNS6IBq9b2n7D8164FrwL
 TAp+90wEzi0sJX5X22EvvyKWISio1cb8oMAAA4gjc35faNyF23HOslHMO
 0dnPRKvwrcdALh2HQDh/Cw7WuIU9Ge+eWOElaIFMeGmYofV9BZlW56+Eu
 umR3/DZiuQ3WQipqzMMrn7kfWRvR0j1ePeZd+Py/Zney24hqp4TAOAeLK Q==;
IronPort-SDR: X0zOL6JlxVi7IkpjSrCjssI5wYkxyLETz4Sg8iQL232V1Fgb8MGJFZLqFPEFyuHTjnQNAN8I1h
 1xsvKy8mjrfZjfFP9C/06+b+gJDizp2n9iZ8uuj3vVsSkq/jsSBNhjeHaz4+nD3JqoKpzcnNZ8
 AL7riQKlDzNUArYqGyAE2QJSBXq9ERkn3DGYjnygbW3wJ9kS+A84pxRzCrDa8paauXUcrJxMuT
 WFqyH/c2tkGhkpHvKV9wQf0HriJMKyrQsxM5//hM67ttTGe8sj4NpjXlhGEEEzM0y0sflkdzNd
 i7k=
X-IronPort-AV: E=Sophos;i="5.76,313,1592841600"; d="scan'208";a="254397121"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Aug 2020 05:48:28 +0800
IronPort-SDR: 6D7wjOv6bYMJfXW4PB2pNQW3AJKVjagfqROwmVfSz/MJbed1HOzdhdN+H2xx1/BiN3fZZ7fPhU
 Hj4FNg2lueDQ==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2020 14:35:33 -0700
IronPort-SDR: l9oujh1ogNiL8KZfFqy7fwqsIfsdi8s8QR8PSME3DgGt+iLSNGkjDoL5CfDo85ewnW9Idf7xdE
 o8npwh7E+v9w==
WDCIronportException: Internal
Received: from cnf006060.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.56])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Aug 2020 14:48:26 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC/RFT PATCH 0/6] Unify NUMA implementation between ARM64 & RISC-V
Date: Fri, 14 Aug 2020 14:47:19 -0700
Message-Id: <20200814214725.28818-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_174831_769658_8B54C562 
X-CRM114-Status: GOOD (  20.86  )
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
 Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atish.patra@wdc.com>,
 Zong Li <zong.li@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ganapatrao Kulkarni <gkulkarni@cavium.com>,
 Steven Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Nick Hu <nickhu@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
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

For RISC-V, the following qemu series is a pre-requisite to test the patches in Qemu.

https://patchwork.kernel.org/project/qemu-devel/list/?series=303313

The patches are also available at

https://github.com/atishp04/linux/tree/5.10_numa_unified

There may be some minor conflicts with Mike's cleanup series [2] depending on the
order in which these two series are being accepted. I can rebase on top his series
if required.

[2] https://lkml.org/lkml/2020/7/28/39

Atish Patra (5):
numa: Move numa implementation to common code
arm64, numa: Change the numa init function name to be generic
arm64, numa: Move pcibus_to_node definition to generic numa code
riscv: Separate memory init from paging init
riscv: Add numa support for riscv64 platform

Greentime Hu (1):
riscv: Add support pte_protnone and pmd_protnone if
CONFIG_NUMA_BALANCING

arch/arm64/Kconfig                            |  1 +
arch/arm64/include/asm/numa.h                 | 45 +---------------
arch/arm64/kernel/pci.c                       | 10 ----
arch/arm64/mm/Makefile                        |  1 -
arch/arm64/mm/init.c                          |  4 +-
arch/riscv/Kconfig                            | 31 ++++++++++-
arch/riscv/include/asm/mmzone.h               | 13 +++++
arch/riscv/include/asm/numa.h                 |  8 +++
arch/riscv/include/asm/pci.h                  | 10 ++++
arch/riscv/include/asm/pgtable.h              | 21 ++++++++
arch/riscv/kernel/setup.c                     | 12 ++++-
arch/riscv/kernel/smpboot.c                   | 12 ++++-
arch/riscv/mm/init.c                          | 10 +++-
drivers/base/Kconfig                          |  6 +++
drivers/base/Makefile                         |  1 +
.../mm/numa.c => drivers/base/arch_numa.c     | 19 ++++++-
include/asm-generic/numa.h                    | 51 +++++++++++++++++++
17 files changed, 190 insertions(+), 65 deletions(-)
create mode 100644 arch/riscv/include/asm/mmzone.h
create mode 100644 arch/riscv/include/asm/numa.h
rename arch/arm64/mm/numa.c => drivers/base/arch_numa.c (97%)
create mode 100644 include/asm-generic/numa.h

--
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
