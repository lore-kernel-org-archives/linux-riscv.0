Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE49F327A8
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 06:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x8gQ0Kl1/yXCANwoVhqCsUrwMtr8NbFEK3M4tfFVHvQ=; b=kw5xfb5w1B3CLY
	4owhCu32Jyi6rnPNoJDPxz4/EBpEh+HKpbQKPiIXZGkbIOh+amFOxlk4fTy14h4a6rfX1pxktEKDF
	prfldX1jI+D9ntWgJMKvHBxtHRffTJEIZz1ABDW4OgB/Ggvyr/aGFcMN3w9XtD74z2MQdexY5Agr+
	N9YhcquiQm8SSBia0rGzj9VAaTUqRisRa4mILOBgSMaEd5fd6UlD7867tZ3MndHK1sQqhp/6CmuRH
	fAaHp09Y8zVwp6QMwolPdlCMdXBWADt4W6H52dG9sJTTvhxH51bM91RLZEywn7Z8c26Dxlqglh8Ys
	z9Suoy0DTYtKVaoj6yuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4MA-00000008569-2RzY;
	Tue, 21 Apr 2026 06:13:10 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4M7-0000000855Q-2tJr
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 06:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Subject:Date:Message-Id:
	MIME-Version:Content-Type:Content-Transfer-Encoding:To:Cc; bh=pv
	2U/fmy1reiP+MQCpzdYmztXgUgUtkA06G8kvdTjMo=; b=kAVzyhPropr4lSGuxv
	9Hw9HCWdsJVvqMDAD8dEYrifdSEBRQ4CGtGQfAXBT3oUGaT7LLuhVDul+cW8V4LE
	fZbVr5yFTn55bIBmtq/dJbe/Rcyq7Lt4XJFuA1jU0qdBmaV1g1XmCWqVZLDcYm2b
	NA8v3D51P/TGnnodToLo8HlXI=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkNyEudpn5ACAA--.1518S2;
	Tue, 21 Apr 2026 14:00:19 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Subject: [PATCH v3 0/2] serial: 8250_dw: Add support for UltraRISC DP1000
 uart
Date: Tue, 21 Apr 2026 13:58:50 +0800
Message-Id: <20260421-ultrarisc-serial-v3-0-3d7f09c2420e@ultrarisc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABoS52kC/4XNTQ6CMBQE4KuQt7amP1iElfcwLkp5lRoE00KjI
 dzdFo0LXbicZOabGTw6ix6qbAaHwXo79DGITQa6Vf0ZiW1iBk65pIKWZOpGp5z1mqSl6ojMjZG
 iwMZwCXF2c2jsfSWPp1f2U31BPSYnNVrrx8E91s/AUu/NM/nLB0Yo0Xl8EVgKoXaHT2Wrhyuki
 8D/ITwiUtUCC6P2JdPfyLIsTypzDLULAQAA
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
 Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776751174; l=1735;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=nlzC/TkdOL8Fx2Pa2jwa6BfY6uq0jPunb9jzlydHx7w=;
 b=xYvHnO/glTxpq7fhEoZSLCbJsgh3Ri6zI5A6Opg3VG6rMIhDENYJXBRhBsdU0Iru4u5e4fBsj
 3kvBSWUDzG1C7Y0rOAm5keuXs+hOGg4MUPgQhQNOEUl6Q2MsN9+mosD
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwAnEkNyEudpn5ACAA--.1518S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur1DJryfAw1DJFW8Aw15twb_yoW8Ar4rpF
	nI9Fsxur9xtryjka97tw1xAF4xuF47AryjqF1jkwn8ta98ZF1IqrWfKw45Za4DZrn5Wr40
	kF15ur1rKa429aUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQADEWnlor4ACwAFsN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_231308_016650_B58141E0 
X-CRM114-Status: GOOD (  11.15  )
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

The series includes two patches:
1. Document the DP1000-specific compatible string for this UART variant.
2. Update 8250_dw to use a fixed CPR value for the DP1000 UART.

The patches have been tested on Ultrarisc DP1000 development board with
Linux v7.0-rc7, verifying basic UART functionality.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
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
Jia Wang (2):
      dt-bindings: serial: snps-dw-apb-uart: Add UltraRISC DP1000 UART
      serial: 8250_dw: Use a fixed CPR value for UltraRISC DP1000 UART

 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 drivers/tty/serial/8250/8250_dw.c                              | 7 +++++++
 2 files changed, 8 insertions(+)
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
