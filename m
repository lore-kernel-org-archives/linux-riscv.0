Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF96DC61CE8
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 20:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C6aPogq6kM3EMLHTNNwDgZhoQ74eacMAmXTelOelfwk=; b=EUCwjU/YW+HSLE
	Yhm5HKDs8lcBPBe2ua0ZoTjv/wxQbR1Q/FjE0VsD5HrhkT7YSdv9tBNJsJW4uIHfeAu6LoFcztvGj
	kTJA1Wnecz+PTfJ0yvqulSsmip8AhwQaFf0Yq8x4z10qU/ikhbv7NNSLMOvlcZrbT5iIk3STUBn0K
	WzrfBDj/OAi9BV5iKm9DV2c5Fqq7lJXi/n8rQhFcvnzZC2kjRhd2GdzRUTYq/r36s+mamyjBFdeCo
	vcnvoxVx2r5CinnAXt85ZSkTAngatPKrOcBq0smEUtZ3K43M6f4JYW12JEuhSRd/roKdCviAah0Mh
	1+RMB8SCAybbdCjKvutQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowU-0000000EXOH-1oEq;
	Thu, 12 Jun 2025 20:54:34 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPj5L-0000000DeB1-3N7y
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 14:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749739159; x=1781275159;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rJw+iZgSceFPmWQsrS+uwRkcpeIPXD4DqfxkrrwqqmQ=;
  b=hR7UDDKpMHclPdaM8y0qlDzy5+WgZpTuI57+7YjPleHx22iGsrKWfIFP
   iog5Xv3fBeGBkLYGY4fIONdXuykwtntb9PeHV+Y4v6YFyEKq3Xt3VZK/R
   YIUHdNYU2ra9e7Enq0hg6W1543rZiISXdwPkHTRgPjSXfZKm5sTQuvn1K
   4ok4Smyjukrou+vq4P/RF+1tQZVvUY5J2H0OaqS3bVWKdy/Zm6GpVThuu
   5T2rSJ5sC58A/+HmR824eu17tAlHbi/JIRqjBJSQ3WttsZ0YLnI7nfUWs
   GchiJLxDFBEcubRL2Y0irwyZU+aYz1/6KaI9TSeWL5OyQM+DQGoptroIN
   A==;
X-CSE-ConnectionGUID: dmA6qLipRWS3XnypdCwDbw==
X-CSE-MsgGUID: rC7VIbbjS12WP3Y5SFe0Xw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 17:39:15 +0300
X-CSE-ConnectionGUID: ky4FU3/vQr6CUKG7QLpYDw==
X-CSE-MsgGUID: 3aQdNsO6QBmvDScTYdB+GQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces04_data.me-crop.lan with SMTP; 12 Jun 2025 17:39:13 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Thu, 12 Jun 2025 17:39:13 +0300
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
Subject: [PATCH v3 0/7] MIPS P8700 variant of the ACLINT IPI controller
Date: Thu, 12 Jun 2025 17:39:04 +0300
Message-ID: <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_073920_258995_5020CE9D 
X-CRM114-Status: GOOD (  13.11  )
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

Changed from v2:
1. fix path prefix as in
https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-subject
2. Optimize CONFIG to keep single ACLINT_SSWI supporting all
variants
3. Rename T-HEAD specific CPU hotplug state

Vladimir Kondratiev (7):
  riscv: helper to parse hart index
  irqchip/riscv-aplic: use riscv_get_hart_index()
  dt-bindings: interrupt-controller: add MIPS P8700 aclint-sswi
  irqchip: MIPS P800 variant of aclint-sswi
  irqchip/aslint-sswi: resolve hart index
  irqchip/aclint-sswi: reduce data scope
  irqchip/aclint-sswi: remove extra includes

 .../thead,c900-aclint-sswi.yaml               |  64 ++++++++--
 arch/riscv/include/asm/irq.h                  |   2 +
 arch/riscv/kernel/irq.c                       |  34 ++++++
 drivers/irqchip/Kconfig                       |  15 ++-
 drivers/irqchip/Makefile                      |   2 +-
 ...d-c900-aclint-sswi.c => irq-aclint-sswi.c} | 114 ++++++++++++------
 drivers/irqchip/irq-riscv-aplic-direct.c      |  16 +--
 include/linux/cpuhotplug.h                    |   2 +-
 8 files changed, 179 insertions(+), 70 deletions(-)
 rename drivers/irqchip/{irq-thead-c900-aclint-sswi.c => irq-aclint-sswi.c} (63%)


base-commit: 2c4a1f3fe03edab80db66688360685031802160a
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
