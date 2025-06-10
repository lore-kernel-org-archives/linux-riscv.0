Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31496C678DA
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 10:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9JNf8xUAHI4ye9rzc4Zwyn8nPcWvthcaVzdfeC8qfm8=; b=P1fVLhNyWmo2xw
	TGdQPbadQ0IjXwTJaGhWv0t6yCwgFOgbH97os07gcKERC7gDmEKp4MQR+OjklRPwURuKrGSjB/jJr
	ybx+Xdu7S8yrfpeLv9dbJt7zhlY5tgBr5JGt/FIPPbyuUAspwzj4MR/XHMMGzeiATcpgiwMVCbsDL
	cfBc6wCbkG9g8/m2gbgtC4e/a+C+M4FsofZVpJIJuFILc9eJov303qyzMQWX3JeKnwNNHhTIHay2w
	jergnrtKfBkZxrmvd4MeOBY98ibdbxN6kvLH8mZoOvf8Ukl2dwGttiNRPJAJ5AjfWVWMTEbdoHRxi
	B1802KR3QFeeS9iXCpzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwfU-00000006Yrg-1PJj;
	Tue, 10 Jun 2025 10:57:24 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvsO-00000006S4s-0pvj
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 10:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749550000; x=1781086000;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SN4p3535kdtcE359HyHqmgAqCNO8q/vwRTBRnnXqNN4=;
  b=IWfLOuuupLGOSg8HWXgvBJNLuFZNymIVR83Ztfw1e+/C/U5lglzanW1I
   YRfp1PTC1TpPVlt2YMMkgq8+epdAinbM4bkg5sHpFoTGeb71rG+z/L4UQ
   zW00NhwMSvf06qS/7AAxLtr7b/wwhD9hDwydLG11lBpqQ1H3b8ZFoy0x7
   JizrmuRs74PwxRJtUgYc8Zh5a95BaF57MlnOXN4iIsWv3rxqkI0sJJ4Eq
   h4WySCsfgSmmsT8elEkMGqd0lOKbMu336fexQyN3YiXz0GvY/NSZi/PSu
   6TCZBQvkfZdUyya+AScbSGR1f5idrPkQ8mkGOiTuIvj7GS5NQyyPnQmRx
   w==;
X-CSE-ConnectionGUID: 3emX4oBjR8yFNJI3/XKeFA==
X-CSE-MsgGUID: Cy/V0VhKRJuxtkk4AVr50g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:06:35 +0300
X-CSE-ConnectionGUID: txeNxAlZRW+e9WnO4RN3zQ==
X-CSE-MsgGUID: kvKai6YvSLuMpDdlPykeJQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.1])
  by ces03_data.me-corp.lan with SMTP; 10 Jun 2025 13:06:34 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 10 Jun 2025 13:06:34 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v2 0/7] MIPS P8700 variant of the ACLINT IPI controller
Date: Tue, 10 Jun 2025 13:05:33 +0300
Message-ID: <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_030640_561692_EF37E056 
X-CRM114-Status: GOOD (  12.84  )
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

RISC-V draft specification for the ACLINT IPI controller describes
an "SSWI" device that allows to send IPI by writing register from the
S-mode (Linux kernel), as opposed to the "MSWI" device that does the
same from the M-mode. Sending IPI through the M-mode requires extra
SBI call, SSWI is much faster.

Support for the SSWI exists for the Thead board, it is almost as by
specification save for reading one custom CSR.

Soon to be released Mobileye SoC based on the MIPS P8700 RISC-V CPU has
variant of the ACLINT SSWI device that follows the spec exactly.

To support P8700, refactor Thead implementation, factoring out
generic code that complies with the draft spec, and provide
Thead and MIPS specific variants.

In addition, MIPS P8700 uses non contiguous hart indexes, and thus
requires "riscv,hart-indexes" property.

Patches 1 and 2 refactor "hart index" support, replacing
APLIC specific implementation with generic helper

Patch 3 adds dt-bindings

Patch 4 refactors Thead-specific SSWI, adding MIPS variant

Patch 5 adds "riscv,hart-indexes" support

Patches 6 and 7 do some minor improvements for the SSWI

Changed from v1:
1. RISC-V spec for the ACLINT is in a draft state, then can't
use "riscv," prefix. Restcucture commits to add MIPS specific
ACLINT-SSWI variant instead.

Vladimir Kondratiev (7):
  riscv: helper to parse hart index
  irqchip: riscv aplic: use riscv_get_hart_index()
  dt-bindings: interrupt-controller: add MIPS P8700 aclint-sswi
  irqchip: MIPS P800 variant of aclint-sswi
  irqchip: aslint-sswi: resolve hart index
  irqchip: aclint-sswi: reduce data scope
  irqchip: aclint-sswi: remove extra includes

 .../thead,c900-aclint-sswi.yaml               |  64 ++++++++--
 arch/riscv/include/asm/irq.h                  |   2 +
 arch/riscv/kernel/irq.c                       |  34 +++++
 drivers/irqchip/Kconfig                       |  16 +++
 drivers/irqchip/Makefile                      |   2 +-
 ...d-c900-aclint-sswi.c => irq-aclint-sswi.c} | 116 ++++++++++++------
 drivers/irqchip/irq-riscv-aplic-direct.c      |  16 +--
 7 files changed, 186 insertions(+), 64 deletions(-)
 rename drivers/irqchip/{irq-thead-c900-aclint-sswi.c => irq-aclint-sswi.c} (62%)


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
