Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44D1606B261
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 12:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TwL1I7fs;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=CRK6c5IK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JWBMGhfoRZqcYT55PyGSJvGFUBSEE+sROHTiWW/NfvQ=; b=TwL1I7fsNSRBF8Ibk8KimN31uo
	TXq6fomIW4zQ52OCeCOcKrnzQ9oOuhOatLHXmWwIoxhurrbWA5Q+kMmZL/L6+tc6/Fmiw2QTdQwhF
	qOK+R4VRb6RK8H//FECeX1FbspS1pwNXT/A2H5Yfg6Xk7a5VeSWYYg466qz+tsoP6yGz6EuT1gqUH
	vc8ta83/w4izD3QqQAam8pMLgCdtXZel5FZ/b31H96NP17FZBsCE1b0YuTmpGjydUw2T5UuRsTM7Q
	vpI11ksHg7deRNyQnlV9wAmnR/4Onc8E6drZYZ+ORkphkrErFFbD0lmmfCJ9/YbWtWOsKPHc1u7g9
	qXZJYwnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgIq-00000004dXi-40SP;
	Tue, 27 Oct 2026 12:29:20 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgIU-00000004clG-30Pb;
	Tue, 27 Oct 2026 12:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=fk
	bxfhGzrbeIPo/NQkn0e/A9RxO8YhcAAShr8Zw3aUQ=; b=CRK6c5IKE8+NwaJG3q
	HtzQH6bWr5/XMK+N7v0BtcqoHnTMvsGiMmt+pNp7CTFXyCW0ag5B+13GhXDO2g8j
	5dM51f9xOwAk78iulsdEo4jvTLDmiig2N5bC3/xWfM6NJaIzeJjQAiQOA6FlNCOo
	5HBMtOL86LRqDaVDp3KlppXgk=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3Dz_umOBqUsqlCw--.64541S2;
	Tue, 27 Oct 2026 20:28:31 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	jingoohan1@gmail.com
Cc: imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v4 00/16] PCI: dwc: Cache PCIe capability offset
Date: Tue, 27 Oct 2026 20:28:11 +0800
Message-ID: <20261027122827.2725643-1-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3Dz_umOBqUsqlCw--.64541S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3WrW5KryUWr1fKFykJF47urg_yoW3KFy8pF
	Z0qrWSyrn7trWSvF4xA3WjvFyruas3AFW7G3s5W3y3ZFy3ua1UJr1FkrWFyF17Cr42vr13
	Kr4jqryxCFyDXFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi0JP_UUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7BA12GrgmPAXtgAA3S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_052859_182946_EC0CEC90 
X-CRM114-Status: GOOD (  22.95  )
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

The DWC PCIe core and its platform drivers repeatedly call
dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) to obtain the offset of the
PCI Express Capability structure, including in paths that run more than
once such as link polling, suspend/resume and interrupt handlers.

Add a cached pcie_cap field to struct dw_pcie and a
dw_pcie_get_pcie_cap() helper that performs the lookup on first use and
caches the result, then convert the core and the 14 platform drivers
that use PCI_CAP_ID_EXP.

After this series, dw_pcie_find_capability(..., PCI_CAP_ID_EXP) no
longer appears in drivers/pci/controller/dwc/ outside of the helper
itself.

Design change in v4
===================

v3 cached the offset at one chosen point (dw_pcie_host_init() after
.init, or a driver's PERST# deassert handler) and then read the raw
field everywhere else. As the review pointed out, that model is
fragile: some paths reach the offset before the chosen caching point
(the qcom .post_init callbacks, qcom-ep icc_update() from the global
IRQ, the i.MX6 endpoint path) and it relies on every endpoint driver
remembering to call the helper after enabling hardware.

v4 turns the cache into a lazy lookup: dw_pcie_get_pcie_cap() is called
at every place that needs the offset. The DBI read therefore happens at
exactly the same point as the open coded dw_pcie_find_capability() call
it replaces, so it is impossible to use the offset before DBI is
accessible, and no driver has to call the helper at a particular time.
The repeated searches are still eliminated.

Sashiko review disposition
==========================

As requested, here is the disposition of every non-pre-existing issue
reported by Sashiko on v3:

- Patch 1, "the search is repeated if the capability is not found":
  not a functional issue. The PCIe Capability is mandatory on DWC
  controllers; if it were missing, the hardware would be unusable and
  the only effect is that the (cheap, error path) search is repeated.
  This is now documented in the helper; no negative-cache flag is
  added.

- Patch 1, data race on pci->pcie_cap: the first lookup can be
  triggered from more than one context, so the field is now accessed
  with READ_ONCE()/WRITE_ONCE(). A concurrent lookup stores the same
  value, hence the race is benign and no lock is needed.

- Patches 2, 3, 6, 8, 16, "pci->pcie_cap may be 0 in Endpoint mode":
  valid for v3, fixed in v4. All users, including the endpoint ones, go
  through dw_pcie_get_pcie_cap(), which searches at the point of use, so
  a stale zero offset can no longer corrupt the standard PCI header.

- Patches 2, 6, 8, "unused cap variable and redundant DBI read in
  dw_pcie_link_get_max_link_width()": valid, fixed in patch 2.

- Patch 2, "the commit message claims a warning is printed": valid. The
  claim was wrong (Mani asked the same question) and has been removed;
  no warning is printed and none is needed, because the helper always
  returns the freshly searched value.

- Patch 10, "icc_update() can run before the PERST# handler caches the
  offset": not possible in v4 and not a new issue. The lookup is done
  inside qcom_pcie_ep_icc_update(), exactly where the open coded search
  was before, so this series does not add a DBI access to the global
  IRQ path. The pre-existing races between the global and PERST# IRQ
  threads are out of scope.

- Patch 11, "the qcom .post_init callbacks run before
  qcom_pcie_clear_aspm_l0s() populated the cache": valid for v3, fixed
  in v4. The .post_init callbacks now obtain the offset on their own.

- Pre-existing issues (rockchip and sophgo INTx IRQ domain leak,
  layerscape dw_pcie_dbi_ro_wr_en()/dis() race, spear13xx phy_init() and
  shared IRQ handling, UltraRISC 32-bit RMW of 16-bit registers): all
  acknowledged, but they are not introduced by this series and are left
  for separate fixes.

The layerscape-ep patch keeps Frank's Reviewed-by tag.

The series is build tested with allmodconfig on x86_64
(drivers/pci/controller/dwc/).

Changes in v4:
- Rework the cache into a lazy lookup done at the point of use; drop the
  explicit caching calls from dw_pcie_host_init() and from the driver
  init/PERST# paths. This removes the whole class of "offset used before
  it is cached" bugs and the need for every endpoint driver to call the
  helper itself.
- Fix the qcom .post_init ordering and the i.MX6, fu740, rockchip,
  UltraRISC and core endpoint paths flagged by Sashiko.
- Fix the redundant lookup and the unused variable in
  dw_pcie_link_get_max_link_width().
- Remove the incorrect "prints a warning" statement from the core patch
  commit message.
- Use READ_ONCE()/WRITE_ONCE() for the cached field.
- Audit the whole dwc subtree: all 14 platform drivers using
  PCI_CAP_ID_EXP are converted, and no direct lookup remains.

Changes in v3:
- Remove automatic caching from dw_pcie_ep_init() to prevent unclocked
  DBI access on EP platforms (qcom-ep, tegra194).
- Add explicit dw_pcie_get_pcie_cap() calls in qcom-ep and tegra194 EP
  paths after hardware enablement.
- Keep Host mode caching unchanged.
- Update commit messages accordingly.

Changes in v2:
- Move dw_pcie_get_pcie_cap() from the beginning of dw_pcie_host_init()
  and dw_pcie_ep_init() to after the hardware initialization callbacks
  (host_init/pre_init). This can prevent the reading of DBI when the
  clock is turned off or when the hardware is not ready.
- Convert all platform drivers to use the cached offset via
  dw_pcie_get_pcie_cap() or directly pci->pcie_cap where safe.
- Fix type mismatches (u16 -> u8).
- Properly split per-driver modifications.

v1 series: https://patchwork.kernel.org/project/linux-pci/cover/20260509135152.2241235-1-18255117159@163.com/
v2 series: https://patchwork.kernel.org/project/linux-pci/patch/20260530153101.695580-1-18255117159@163.com/
v3 series: https://patchwork.kernel.org/project/linux-pci/cover/20260720150619.24733-1-18255117159@163.com/

---

Why splitting into per-driver patches
=====================================
To facilitate review and potential bisection, each platform driver is
modified in its own patch. The core changes are in patches 1-2 and the
follow-up patches convert individual glue drivers. If the maintainers
prefer to squash them, please let me know.

This splitting was carried out solely for the convenience of code
review.

---

Hans Zhang (16):
  PCI: dwc: Add pcie_cap field and caching helper
  PCI: dwc: Use cached PCIe capability offset in core
  PCI: dwc: imx6: Use cached PCIe capability offset
  PCI: dwc: layerscape-ep: Use cached PCIe capability offset
  PCI: dwc: meson: Use cached PCIe capability offset
  PCI: dwc: rockchip: Use cached PCIe capability offset
  PCI: dwc: eswin: Use cached PCIe capability offset
  PCI: dwc: fu740: Use cached PCIe capability offset
  PCI: dwc: intel-gw: Use cached PCIe capability offset
  PCI: dwc: qcom-ep: Use cached PCIe capability offset
  PCI: dwc: qcom: Use cached PCIe capability offset
  PCI: dwc: sophgo: Use cached PCIe capability offset
  PCI: dwc: spacemit-k1: Use cached PCIe capability offset
  PCI: dwc: spear13xx: Use cached PCIe capability offset
  PCI: dwc: tegra194: Use cached PCIe capability offset
  PCI: dwc: ultrarisc: Use cached PCIe capability offset

 drivers/pci/controller/dwc/pci-imx6.c         |  4 +--
 .../pci/controller/dwc/pci-layerscape-ep.c    |  4 +--
 drivers/pci/controller/dwc/pci-meson.c        |  4 +--
 .../pci/controller/dwc/pcie-designware-ep.c   |  2 +-
 drivers/pci/controller/dwc/pcie-designware.c  |  8 ++---
 drivers/pci/controller/dwc/pcie-designware.h  | 34 +++++++++++++++++++
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |  2 +-
 drivers/pci/controller/dwc/pcie-eswin.c       |  2 +-
 drivers/pci/controller/dwc/pcie-fu740.c       |  2 +-
 drivers/pci/controller/dwc/pcie-intel-gw.c    |  2 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c     | 11 ++++----
 drivers/pci/controller/dwc/pcie-qcom.c        | 17 +++++-----
 drivers/pci/controller/dwc/pcie-sophgo.c      |  5 +--
 drivers/pci/controller/dwc/pcie-spacemit-k1.c |  2 +-
 drivers/pci/controller/dwc/pcie-spear13xx.c   |  2 +-
 drivers/pci/controller/dwc/pcie-tegra194.c    |  6 ++--
 drivers/pci/controller/dwc/pcie-ultrarisc.c   |  2 +-
 17 files changed, 72 insertions(+), 37 deletions(-)


base-commit: 4352b8aee98005853aa63f57d6377282de17a33f
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
