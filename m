Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3B9606A32A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 08:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uMI2lpZc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=S1bK5FtW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:From:Message-Id:Mime-Version
	:Cc:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ad53w7FoDSsiCWO6NBvBEK1oPJUGSw8hGQP1Ouw4qts=; b=uMI2lpZcJAgXEDW4M4rhpuqHGc
	XDYuZgbqkG4RHGco0ygfxXfDgezRCOCEK0aMsQRz6KG+lsaPzyq7oaONr93TPbaqUmHkvAEzHD9jm
	LITZKUwElHP2QjUxzY27gFamKbStQeGSaH+nrG2IjzgoJ1NZxqK60RTibh5MfkBEO+B1mPx+2ot9i
	DWPuywiHXBKyLMe2el45S7qrB1o6YQP9yt/t6ZuwZV87znTfCdp4RePYm/psQVYlBOwahl788g5W/
	AEZyiGpfKLy60kSmEq5uFdlU21Vvt/pJlH+x+HdUy8NxZORufo2umslFmUxmqzJmhyW+2gFuUZRQ7
	Au6jbS3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbUT-00000008Fb8-0E73;
	Wed, 18 Nov 2026 08:58:05 +0000
Received: from va-2-55.ptr.blmpb.com ([209.127.231.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbUQ-00000008FZw-0l3W
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 08:58:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794992272;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=yOxzqLseFUYhYdIECMH6Pr89r6ogqLgHYA2LaD6ZQPI=;
 b=S1bK5FtWYNSZHZNX0NmS/qx575+gxqKr0uU0DGZ6KoNSLjWC8AdMWE8i+M6rPVG5OVY2Bg
 woP7owbnzdPKbrNZS1k0pIIYhfMFmaZR0yIdt9QXNJ1bUTTvQ2PXEd1avjQ8KYRW6xqtSt
 fGJKjiKuOcw8rbFd+4bnXMJDTtQa+RRFMT9cty2VFkwYf0AK4u5AoMW5KNd0e++v/TJmJd
 rHBM5Xg1oD1tdN3SpFanaXyF9YhOjhxHv1NlToTGKjesIjFEJk50LtLG9chwM/LDM2DRi3
 0kNVlBv2/SlBhmBr4qFtx0QYDhknD1bWZQEjV8JhRJgn3qGJ6LpSp1Ij6PjS0w==
Date: Wed, 18 Nov 2026 16:57:33 +0800
Received: from ubuntu.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Wed, 18 Nov 2026 16:57:49 +0800
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26afd688e+b75892+lists.infradead.org+yang.wang@deepcomputing.io>
Message-Id: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
From: "Wang Yang" <yang.wang@deepcomputing.io>
Subject: [PATCH 0/9] Add SpacemiT K3 FML13V05 EC keyboard support
To: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_005802_305551_1DC512D3 
X-CRM114-Status: GOOD (  13.00  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DeepComputing FML13V05 uses a ChromeOS-compatible embedded controller
connected through the SpacemiT K3 eSPI peripheral channel. Its internal
keyboard is not available on linux-next without the controller and EC
transport support described in this series.

The EC host command registers are exposed through a memory-mapped,
non-linear peripheral window. This interface cannot use the ordinary
cros_ec_spi message transport directly. Add a K3-specific controller and
EC transport, and reuse the existing ChromeOS EC protocol, MFD and
keyboard drivers. Existing EC core, LPC, SPI, protocol and keyboard C
files and the google,cros-ec binding are unchanged.

The series is based on next-20261116. Patches 1-2 document the controller
and EC bindings; patch 3 adds the controller; patches 4-5 enable Chrome
platform support on RISC-V and add the EC transport; patches 6-8 describe
the pins, controller and board keyboard; patch 9 enables the drivers in
riscv defconfig, with the EC transport and keyboard built as modules.

The controller implementation is ported from the SpacemiT vendor BSP
(revision 29b78afb484b, originally authored by goumin
<min.gou@spacemit.com>). Controller programming and recovery remain
separate from the EC client. The EC transport and compatible are scoped
to K3 because the window layout and controller recovery API are specific
to this hardware. Feedback on the transport split and recovery interface
is welcome.

Validation on an FML13V05 with its internal keyboard, 2026-11-18:
- W=1 cross-build of Image, modules and the board DTB completed. No new
  warnings came from the added drivers.
- Both new bindings and their compiled examples passed schema validation;
  the new examples passed strict DT style checks. The new EC, controller
  and keyboard nodes in the board DTB also passed validation.
- Cold boot and module autoload passed all 20 automatic checks.
- 153 read-only EC queries and three EC module unload/reload cycles
  succeeded. EC firmware was FML13V05-V01.06.
- A/B/C/1/2/Enter, all four arrows and Fn+F1/F2/F7/F8 produced the expected
  28 paired press/release events, with no dropped or held keys and no
  new EC/eSPI errors in the kernel log.

The running test kernel was
7.4.0-rc3-next-20261116-fml13v05-k3-espi+.
Booting the test system required a separate K3 PCIe test module and
USB/NVMe DT additions, which are outside this EC series. Suspend/resume,
EC restart fault injection, full-keymap coverage and long-duration
stability were not tested. A previously observed UEFI reset_system()
failure was not addressed or retested by this series.

Checkpatch reports no errors or CHECK findings. Its four new-file
MAINTAINERS reminders were reviewed: the existing SpacemiT N: pattern
and Chrome EC/DT entries already cover the new paths, so no MAINTAINERS
change is included.

OpenAI Codex assisted the port, patch preparation, review analysis and
test tooling. The work was developed through an iterative session to
port the existing DC-linux/BSP support, keep the common EC implementation
unchanged, use K3-specific naming and bindings, and verify the result on
hardware. Human review was completed before submission; the numbered
patches retain the submitter's existing DCO sign-offs.

Wang Yang (9):
  dt-bindings: bus: Add SpacemiT K3 eSPI controller
  dt-bindings: embedded-controller: Add SpacemiT K3 EC window
  bus: Add SpacemiT K3 eSPI controller support
  platform/chrome: Allow ChromeOS platform support on RISC-V
  platform/chrome: Add SpacemiT K3 eSPI EC transport
  riscv: dts: spacemit: Add K3 eSPI pin group
  riscv: dts: spacemit: Describe the K3 eSPI controller
  riscv: dts: spacemit: Enable the FML13V05 EC keyboard
  riscv: defconfig: Enable the FML13V05 EC keyboard modules

 .../bindings/bus/spacemit,k3-espi.yaml        | 146 ++++
 .../spacemit,k3-cros-ec.yaml                  |  58 ++
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 137 +++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi  |  24 +
 arch/riscv/boot/dts/spacemit/k3.dtsi          |  31 +
 arch/riscv/configs/defconfig                  |   5 +
 drivers/bus/Kconfig                           |  10 +
 drivers/bus/Makefile                          |   1 +
 drivers/bus/spacemit-k3-espi.c                | 804 ++++++++++++++++++
 drivers/platform/chrome/Kconfig               |  13 +-
 drivers/platform/chrome/Makefile              |   1 +
 drivers/platform/chrome/cros_ec_spacemit_k3.c | 739 ++++++++++++++++
 include/linux/spacemit-k3-espi.h              |  20 +
 13 files changed, 1988 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/spacemit,k3-cros-ec.yaml
 create mode 100644 drivers/bus/spacemit-k3-espi.c
 create mode 100644 drivers/platform/chrome/cros_ec_spacemit_k3.c
 create mode 100644 include/linux/spacemit-k3-espi.h


base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
