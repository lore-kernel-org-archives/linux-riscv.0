Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9834606A895
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 07:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y+A/E+xQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QNdlAFgkicgNqCLg1ivjHaYmcMmtKfYtPzDoV/D/dE8=; b=y+A/E+xQWE7uXdcaTtH7u+QOC8
	O2b+Dy0Rg+b9uVtiP03A/MgsQTkiEnh8W8vF6d80zqpos3QfagnTGLHnpxaEemHCdK+1qMvynhydd
	6yGp46zU8tllh775kTt63suYvWvQY4ZyBimQ6iz5P/FaZjTJNPLGB01BkL0+sv/bh8RQUl4Bx4a+d
	u/BGVt8COQrJ2tn/pSH7e714Ot7HFdjcv+lIUDLmfR8JBUrHWU7vPJLBdr8N8WdI/IuiCZy0t97Sv
	7VEvpCTSBybE9wtCyO4OR742i3MxKksn7fF5Ki1KtNN8+dgzJtryZQEaoLR7H2a6E2XnsaZ9oKqNl
	PQDU+XRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlTW-0000000Bqig-3ZZm;
	Fri, 13 Nov 2026 07:13:30 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlTL-0000000BqdS-2mM0
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 07:13:25 +0000
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CR5H059129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:27 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:27 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 15:12:27 +0800
From: Mina Hui-Min Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <conor@kernel.org>, <jic23@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <minachou@andestech.com>, <az70021@gmail.com>
Subject: [PATCH v2 00/19] riscv: andes: make the LLC driver and cache errata generic
Date: Fri, 13 Nov 2026 15:11:24 +0800
Message-ID: <20261113071143.1446167-1-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 6AD7CR5H059129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_231320_428428_B29B6DF4 
X-CRM114-Status: GOOD (  16.40  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Andes last level cache (LLC) driver and the Andes cache errata were
written for the AX45MP core in the Renesas RZ/Five. Other Andes cores use
the same LLC controller and need the same CCTL-based cache maintenance,
but the driver, its binding and the errata only handle AX45MP.

This series makes them generic, in preparation for the Allwinner V821
SoC [1][2], which uses the Andes A27L2 core [3]. The A27L2 has neither
IOCP nor Zicbom, so it relies on the LLC driver for DMA cache
maintenance.

The series is organized as follows:

- Patches 2-6 rename the AX45MP and L2 identifiers to generic Andes and
  LLC names, move the Andes CSR definitions to a shared header, and
  rename ax45mp_cache.c to andes_llcache.c. No functional change.

- Patches 1, 7 and 8 are small cleanups. No functional change.

- Patches 9-11 fix issues that do not show up on RZ/Five but affect
  other Andes platforms:
  - write the full physical address to the 64-bit CCTL registers,
  - register the CCTL cache ops only when the errata asks for them, so
    that they do not override Zicbom CMO,
  - index the per-core CCTL registers by hart ID, not logical CPU
    number.

- Patches 12-15 add andestech,llcache as a generic compatible, keep
  andestech,ax45mp-cache for existing devicetrees, and add a
  MAINTAINERS entry for the driver.

- Patches 16-18 make the Andes cache errata usable on any Andes SoC:
  ERRATA_ANDES_CMO no longer depends on ARCH_R9A07G043, Andes cores
  other than AX45MP use the CCTL ops when they do not implement Zicbom,
  and the SBI-based IOCP check is limited to RZ/Five.

- Patch 19 adds the andestech,a27l2 CPU compatible. The V821 devicetree
  will be submitted separately by Allwinner.

Existing RZ/Five devicetrees and behavior are unchanged.

[1] https://www.allwinnertech.com/index.php?c=product&a=index&id=136
[2] https://github.com/AvaotaSBC/AvaotaF1
[3] https://www.andestech.com/en/products-solutions/andescore-processors/riscv-a27l2/

Changes in v2:
- Rework the series: split the refactoring into smaller patches, drop
  the performance and feature changes, and add the cache errata
  changes needed for other Andes cores.
- Split the v1 refactoring patch into separate rename, header, macro
  and file rename patches.
- Keep andestech,ax45mp-cache and add andestech,llcache as a generic
  fallback compatible, instead of renaming the compatible. Drop the v1
  DTS update patch accordingly.
- Drop the performance and feature changes of v1 patches 2/7-4/7 to
  keep this series focused on making the driver generic. They will be
  sent separately.
- New: fix the CCTL physical address width, the cache ops registration
  condition and the CCTL register index (patches 9-11).
- New: generalize the Andes cache errata (patches 16-18).
- New: add the A27L2 CPU compatible (patch 19).
- Link to v1: https://lore.kernel.org/r/20260330102724.1012470-1-minachou@andestech.com

Mina Hui-Min Chou (19):
  cache: ax45mp_cache: use __initconst for ax45mp_cmo_ops
  cache: ax45mp_cache: rename AX45MP-specific identifiers to generic
    ANDES
  cache: ax45mp_cache: rename L2 identifiers to LLC
  cache: ax45mp_cache: add shared header for Andes CSRs
  cache: ax45mp_cache: standardize macro naming for LLC and L1D
    registers
  cache: ax45mp_cache: rename ax45mp_cache.c to andes_llcache.c
  cache: andes_llcache: clean up cache inv/wback functions
  cache: andes_llcache: use u32 and fix the cache-line-size error
    message
  cache: andes_llcache: write the full physical address for CCTL
  cache: andes_llcache: register cache ops only when the errata needs
    them
  cache: andes_llcache: use the hart ID to index the CCTL registers
  dt-bindings: cache: andestech: update schema for generic LLC support
  dt-bindings: cache: rename andestech,ax45mp-cache to andestech,llcache
  cache: andes_llcache: add generic andestech,llcache compatible
  MAINTAINERS: Add maintainer for Andes cache driver
  riscv: errata: andes: allow ERRATA_ANDES_CMO on all Andes SoCs
  riscv: errata: andes: generalize cache errata for Andes cores
  riscv: errata: andes: limit the IOCP workaround to RZ/Five
  dt-bindings: riscv: add Andes A27L2 CPU compatible

 ...45mp-cache.yaml => andestech,llcache.yaml} |  73 ++++--
 .../devicetree/bindings/riscv/cpus.yaml       |   1 +
 MAINTAINERS                                   |   7 +
 arch/riscv/Kconfig.errata                     |   6 +-
 arch/riscv/errata/andes/errata.c              |  22 +-
 arch/riscv/include/asm/errata_list_vendors.h  |   2 +-
 drivers/cache/Kconfig                         |   9 +-
 drivers/cache/Makefile                        |   2 +-
 drivers/cache/andes_llcache.c                 | 213 +++++++++++++++++
 drivers/cache/ax45mp_cache.c                  | 217 ------------------
 drivers/soc/renesas/Kconfig                   |   2 +-
 include/linux/soc/andes/csr.h                 |  12 +
 12 files changed, 316 insertions(+), 250 deletions(-)
 rename Documentation/devicetree/bindings/cache/{andestech,ax45mp-cache.yaml => andestech,llcache.yaml} (52%)
 create mode 100644 drivers/cache/andes_llcache.c
 delete mode 100644 drivers/cache/ax45mp_cache.c
 create mode 100644 include/linux/soc/andes/csr.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
