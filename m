Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A932FB44A9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 05:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QFhHj3L76vN+0Q+tGQNtyY39zphFSkr7Cn2Qmp1hkUg=; b=ydyWtc/ACZ7AF3
	UK6BHL0ROzT1udkEppWLgcMrhMbArfL3ClEeVJfN9PBYNv8zbysaH/rvIQl329D9OSXMI8TIXHi1V
	Oo0NONfi7sOWkyY8JixsJbP5UAICflwIJ0lINbcCOSIKjgexl6d3j143M5qJLH5WhuXRNShv84hjm
	d42+EOrI0nRuzKxSTVauSwrqCKgpIVfRRetuW/yedkOwdIy6JLNpwNr/5Jwz7BRRmxh0gnVnbQsej
	Q6mSpdG7nUJsmn/hiBmDM4P7xO+wv65Pu7NOaNCXQeML1GfFzVSdLKl0+MG+Zdkri6y9cc0Mphzcx
	YaT5q21kjX/biiiZxHBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG9HC-0000000Cfim-2u9M;
	Fri, 24 Apr 2026 05:40:30 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG9H9-0000000Cfhv-1lpm
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 05:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Subject:Date:Message-Id:
	MIME-Version:Content-Type:Content-Transfer-Encoding:To:Cc; bh=En
	tjKiXGiVc7g9ljDSOTLPPgkKKwLhEPaqid4wCky4Q=; b=GTYJ8U/FXpj2dAoA/9
	9Q6vlXq/sTbGO86OIEn+q/fm/JP8f4hvz00a2P1eKSXGJ73MHQCuKOPZb7+94xNR
	K6GSkEOyV6DTmstskOc0BXnku47zcL3ko+KocOoYabmVfAjh+3tmUC+p4GVwD6+1
	eAhcPC61wrJqrE2vz1RE3Er+4=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnYUJlAutpm8gCAA--.1607S2;
	Fri, 24 Apr 2026 13:40:53 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Subject: [PATCH v4 0/4] serial: 8250_dw: Add support for UltraRISC DP1000
 UART
Date: Fri, 24 Apr 2026 13:39:27 +0800
Message-Id: <20260424-ultrarisc-serial-v4-0-1765a0b4c4a0@ultrarisc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAA8C62kC/4XN0QrCIBgF4FcJrzPU31zrqveILpz7bUZtodsox
 t49XVFQgy4PnPOdgQT0DgPZLgbisXfBNXUMcrkgptL1EakrYyaCCcWA5bQ7t157FwxNS32mSlq
 rIMPSCkXi7OrRuttE7g/PHLrihKZNTmpULrSNv0+fPU+9F8/VL99zyqiR8QUwB9Dr3buyMs2Fp
 Ite/ENERJQuADOrNzk3cwh8ECn4DAIRgTKzLDdCCobfyDiOD4RaV+xQAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777009209; l=2625;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=k55XBV/nmFEVR3wNAXd6Yzldm76QwPMOMHGutyTPK34=;
 b=m23lxKeGrSvvMwMxC73BQt4E78pRW+AQ7iu8g4y1JQfYxO9PI4ZTzunANxT1JBHzTSzpkMpQH
 ntlP33boulFAWNe9XpxLyoirrnpZjx4EtX0GJFkroVlq+LW290Lz55j
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwAnYUJlAutpm8gCAA--.1607S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWfCr4Uuw45CF45tr13Arb_yoW5Gry7pF
	43KrZIyr98tFySkan7tw1IvF1fWF48JryUXFnrKw1Yq3W5ZF18trWrKw45AF98Zr95Wr1j
	9F45u34rGa4UuwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAHEWnq6L8ACAAAsL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_224028_013940_2F26055A 
X-CRM114-Status: GOOD (  11.92  )
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
Linux v7.0-rc7, verifying basic UART functionality.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
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
 drivers/tty/serial/8250/8250_dw.c                  | 31 ++++++-----
 drivers/tty/serial/8250/8250_dwlib.c               | 49 -----------------
 drivers/tty/serial/8250/8250_dwlib.h               | 63 ++++++++++++++++++++++
 4 files changed, 83 insertions(+), 61 deletions(-)
---
base-commit: e774d5f1bc27a85f858bce7688509e866f8e8a4e
change-id: 20260309-ultrarisc-serial-64ff637edf26

Best regards,
--  
Jia Wang <wangjia@ultrarisc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
