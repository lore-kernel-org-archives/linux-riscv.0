Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36ACFF886F
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 05:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+VXqE1Jw0WYjf5oGvIps7ibz4q2hUW4Bz1UmlIPg5Us=; b=kZW1AdvnpRQ5Z+
	CpLOrcL2sh1eEjTV9J3NIal3gOr6sBzlOG9SiV9Mo8LSEg0PeP1Kxt041qPSy7bGgaoXCvpKr0nwx
	JrYOCeDjQa7y3j5FbmT05vZU824mKhd2fkDvJxZkGtudP1lqg4UF22yN2AhsinMeESa4Tp7FQsQ4a
	X/Ys2v5GM0EDnyDd1k8xdm9YS2wZvOlwobPQXlHklVX6tH/9WNcZl9mTSy3tV/wBcvg9oH45QWKjs
	8ESMAYOeeiR+z5sls/JneU2iOyiScZiPqhd7NT4NqUKooDyzn05D0YVmI3vHpCwoplyXUpYEd5zKJ
	ypNKBqB1MXucQ/A9RpuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHaz8-00000000ZzC-1YfM;
	Tue, 28 Apr 2026 05:27:50 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHaz2-00000000ZvY-1LpR
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 05:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Subject:Date:Message-Id:
	MIME-Version:Content-Type:Content-Transfer-Encoding:To:Cc; bh=tk
	+Su0SD8Q9/52Qv4/eBjgpzRRMB+Aab/0Tn5htEYYs=; b=BYhLsZJK/a+Gi/xhNK
	WI8B2pRhuqlFjB7EBTIo+FswAGSDuR/mewYPoXDlNRHlsdaeTwlCHgml46pno5nE
	uiJEgTBJf3VJqDmdAMES2ghPheUj6um2U4xi/WygJtuCANte4FNM4aAL9KuE9/km
	nSxCkkG47VJ+6LyL4Ic0GQ75c=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cUIxRfBpJRMDAA--.1785S2;
	Tue, 28 Apr 2026 13:27:13 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Subject: [PATCH v5 0/4] serial: 8250_dw: Add support for UltraRISC DP1000
 UART
Date: Tue, 28 Apr 2026 13:26:25 +0800
Message-Id: <20260428-ultrarisc-serial-v5-0-97de63b1e3eb@ultrarisc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAFF8GkC/4XNwU6EMBQF0F8hXVvT9j2KzMr/MC5KeR1qECYtE
 A3h323ROJORxOVN7j13ZZGCp8hOxcoCLT76cUihfCiY7cxwJu7blJkSSgsQNZ/7KZjgo+V5aXq
 u0TkNFbVOaZZml0DOf+zky+t3jnPzRnbKTm50Pk5j+Nw/F5l7P7zUf/lFcsEtphegGsCUz7+VR
 zu+s3yxqP8QlRBtGqDKmada2iMErggqeYBAQqCtnKitQiXoCMFbBA8QTIisdGlEgxaNuEe2bfs
 CG3W1MpUBAAA=
X-Change-ID: 20260309-ultrarisc-serial-64ff637edf26
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777353989; l=2987;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=jO0zlNA1eKxRESAZ5hHV3AD2XwV5WDA/D8hVXLHOwgY=;
 b=mZB5PyptJVQTQp7P790pUMUE+WLiBvm2WEW+kA5FWYSWDhGjVMiknAZFQQ//eZh+aglDFUiB0
 fBJh4X5WS5aDx9wuh4u8gA+rAmXyk4Url1jwqMOecct1fAgsq05C38U
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwA3cUIxRfBpJRMDAA--.1785S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWDGr17CryDtrW8tr1xAFb_yoW5Ar4fpF
	4YgFsIy3s8tFyfKan7tw1rZF1SgF4rJrWYqFsrKw1Yv3W5ZF1IqrWrKw45ZF9xZ3s5Xr1j
	9F13uw1rGa42vwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAKEWnti78ACwAes-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_222744_720419_9856ACDF 
X-CRM114-Status: GOOD (  13.13  )
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

This patch series adds support for the UltraRISC DP1000 UART controller.

The series includes four patches. The first two are preparatory cleanups;
the last two add the DP1000 compatible and fixed CPR handling.

The patches have been tested on an UltraRISC DP1000 development board with
Linux v7.1-rc1, verifying basic UART functionality.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
Changes in v5:
- Rebased onto Linux v7.1-rc1.
- Patch 1:
  * Reorder and document the moved DesignWare register/bit definitions.
- Patch 2:
  * Add a FIFO size -> CPR FIFO_MODE helper and use it for RZ/N1.
- Patch 4:
  * Use the FIFO_MODE helper for DP1000.
- Link to v4: https://patch.msgid.link/20260424-ultrarisc-serial-v4-0-1765a0b4c4a0@ultrarisc.com

Changes in v4:
- Added two preparatory patches before the original series, shifting patch
  numbers (former 1/2 -> now 3/4).
- Patch 1:
  * Move all DesignWare UART register/field definitions into 8250_dwlib.h
    for shared use with 8250_dw.
- Patch 2:
  * Converted the Renesas RZ/N1 CPR magic value to use DW_UART_CPR_* macros
    and FIELD_PREP_CONST().
- Patch 4:
  * Converted the UltraRISC DP1000 CPR magic value to use
    DW_UART_CPR_* macros and FIELD_PREP_CONST() (value unchanged).
- Link to v3: https://patch.msgid.link/20260421-ultrarisc-serial-v3-0-3d7f09c2420e@ultrarisc.com

Changes in v3:
- Rebased on Linux v7.0-rc7.
- Patch 1:
   * Removed separate `items` entry for DP1000, merging it into the
     existing `enum` to comply with the schema.
   * Updated commit message to describe DP1000 UART hardware differences.
- Patch 2:
   * Drop the custom quirk for missing CPR register.
   * Switch to using DW_UART_QUIRK_CPR_VALUE to provide a fixed CPR value.
- Link to v2: https://patch.msgid.link/20260316-ultrarisc-serial-v2-0-6ab3e7fa891c@ultrarisc.com

Changes in v2:
- Rebased on Linux v7.0-rc4 (previously on v7.0-rc2).
- Reordered patch series: DT binding patch comes before driver changes.
- Updated commit message for DT binding patch.
- Link to v1: https://patch.msgid.link/20260316-ultrarisc-serial-v1-0-c464f3e933a5@ultrarisc.com

---
Jia Wang (4):
      serial: 8250_dwlib: move DesignWare register definitions to header
      serial: 8250_dw: build Renesas RZN1 CPR value from DW_UART_CPR_* definitions
      dt-bindings: serial: snps-dw-apb-uart: Add UltraRISC DP1000 UART
      serial: 8250_dw: Use a fixed CPR value for UltraRISC DP1000 UART

 .../bindings/serial/snps-dw-apb-uart.yaml          |  1 +
 drivers/tty/serial/8250/8250_dw.c                  | 33 ++++++----
 drivers/tty/serial/8250/8250_dwlib.c               | 49 --------------
 drivers/tty/serial/8250/8250_dwlib.h               | 74 ++++++++++++++++++++++
 4 files changed, 96 insertions(+), 61 deletions(-)
---
base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b
change-id: 20260309-ultrarisc-serial-64ff637edf26

Best regards,
--  
Jia Wang <wangjia@ultrarisc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
