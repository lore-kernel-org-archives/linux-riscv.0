Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E9ACAC58E
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 09:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lbNjU50194BLWnCIliGhSKsLU/IMoY96FFRD5SHk7c0=; b=dMCTYNX6dKvJOu
	o2bm4wmX2zUPjl27iNatQ4YEpnv0FceN2Qg2iAxHMQMlIY7R4t+0cKbRWQSe+NNLOCc9UgqwpoVHO
	acItJTHuqU+FNa+XvO8q7VIOq+tvjRcCvsmutRWLHV+7u1UcslPUA9MCX6GsQc6LoEtP6UAl4Alrc
	VcYn8e39d4uJbzIOF5Yy2DIyCCCxxVoEtEImAI3V8uoTGuMRWEvd6cRiAuFVCXD4IFeznxkO6OE0D
	yrOXKpEQiiJFX4G4aQKplsLZuV2IXbLYSu8azOOCJIc17n+diF10fOAP5pILfuJC49TFa6f0vG3VY
	uKLHrqj3Rss3CYITCExw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5vE-00000003XUq-49PM;
	Mon, 15 Sep 2025 09:54:56 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5vC-00000003XTx-2muK
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 09:54:56 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6928C25D81;
	Mon, 15 Sep 2025 11:54:50 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DKm59VjfPMPN; Mon, 15 Sep 2025 11:54:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1757930089; bh=d0VqZbpQ0JGwY8ajzJh1U/vak+EkkwD4uK2aJndcr8E=;
	h=From:To:Cc:Subject:Date;
	b=PgZoum/hHcKkQqtSl3UBtjW23RnWMDzKiJCFBXKH8tu5b33wGdm80vG4QlxujSoK3
	 CodbPTz8s60cg3td0TtnG9zlXD5vk+Ezq6O8Z1m7Ww1bc+ACnq6dUT386zCp5zHFhE
	 aOWX+RmNunbz9jsM8i0gUY9ysZHyGe1eOIC9B2amrIycL2T8UO6Keu+ZolGynxHdfR
	 smzfXbYsQdA0eEPrPRG4kJurSKk7KPGNl5f7jLKdLsOqiNiCGPkwUpR2wQB7j0J6oC
	 u5a0FwOWAuNygw76T8mfzP5zBg0anCJoxwLxn/tcjjtcHoogyC/uMqgkjig+vlgp96
	 wDzIyvbwzT0JA==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v2 0/5] Add reset controllers for other TH1520 subsystems
Date: Mon, 15 Sep 2025 09:53:26 +0000
Message-ID: <20250915095331.53350-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_025455_128601_F8952D56 
X-CRM114-Status: GOOD (  10.14  )
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
Cc: devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

TH1520 SoC is split into several subsystems, and each of them comes with
distinct reset controllers. We've already had the one for VO subsystem
documented as "thead,th1520-reset" and supported, and this series adds
support for others, including AO, VI, MISC, AP, DSP and VO.

For TH1520_RESET_ID_{NPU,WDT0,WDT1}, these're reset signals that have
been introduced along with support for the VO reset controller. However,
registers in control of these resets don't stay in the VO reset region,
instead they're AP-subsystem resets, thus the original ABI is
problematic. I remove them in PATCH 1 and reintroduce them in PATCH 2.

Note the reset controller for AO subsystem is marked as "reserved" in
devicetree since AON firmware may make use of it and access in Linux
side may cause races.

This series is based on next-20250912, thanks for your time and review.

Changed from v1
- Make a separate patch for the ABI-breaking change of
  TH1520_RESET_ID_{NPU,WDT0,WDT1}
- Fix the duplicated dt-binding IDs
- Sort compatibles/reset-signal definitions in alphabetical order in
  the driver
- Sort dt-binding IDs in alphabetical order by subsystem names
- Link to v1: https://lore.kernel.org/all/20250901042320.22865-1-ziyao@disroot.org/

Yao Zi (5):
  dt-bindings: reset: thead,th1520-reset: Remove non-VO-subsystem resets
  dt-bindings: reset: thead,th1520-reset: Add controllers for more
    subsys
  reset: th1520: Prepare for supporting multiple controllers
  reset: th1520: Support reset controllers in more subsystems
  riscv: dts: thead: Add reset controllers of more subsystems for TH1520

 .../bindings/reset/thead,th1520-reset.yaml    |   8 +-
 arch/riscv/boot/dts/thead/th1520.dtsi         |  37 +
 drivers/reset/reset-th1520.c                  | 835 +++++++++++++++++-
 .../dt-bindings/reset/thead,th1520-reset.h    | 219 ++++-
 4 files changed, 1083 insertions(+), 16 deletions(-)

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
