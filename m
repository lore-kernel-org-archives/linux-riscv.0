Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21CACCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XU/T5bwcTycWRcmp0cghLyvLuv0Hmx7iieVMC3frYEM=; b=JBhMMULSqtF7uf
	LBuvJ8ZWWgVtMuZqpAzl6bxNswuJwiC6pkNofi/LMRD5I/FFsKM7bBm9/pFeXj6u+sdYzrwWeSVoZ
	WDq+3fMxd8NeFMYNJmc1lLM3FarOpEG+Uq009PAKXoyoRRU+KsyNiHc4uEYkqNlXqsgzbZym9ux8J
	w3HDxdX3SYiR4uXIEFNNkZ/xI320z0/8k+oFUHc3JYl1CSkHTldm5l78TlGtHHNZnQrJ+Uj47P6dy
	9ShQrzCuto8JJQq7HIbiEfPx04ff4I/3zoPQgSFrOQNxYwMOh7rmdxidBOPthZGuM1I66h+QCQwQg
	7ItTjEPc7r2dZCER9g7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8enr-0000000GPsY-3mLm;
	Tue, 14 Oct 2025 13:10:59 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eno-0000000GPpx-40nJ
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 13:10:58 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6AE6522BF5;
	Tue, 14 Oct 2025 15:10:54 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JnGNg-KN5pZ; Tue, 14 Oct 2025 15:10:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1760447453; bh=SnHE+KYEHYlkFQ1P6HZQnLB2xV8QwDDqPT4rwxwlJ6I=;
	h=From:To:Cc:Subject:Date;
	b=MzaNRXInIU7n2CLfs0Q63SN1pA0bzrgbHPLGdxUwBtuQE50Unl5MFqC1beR0aBI97
	 7zN9/3SRr6cLvYDN9fb9l3VrercwRqWpFJJ2M01BfQdzBAV3JhJP0BoooPnBXu66RH
	 V9feFn5KKkZTMaFl01skCvUFYmkTOie6f5hlZHMQfFtE8jr3JfqOdcgY1jWgwFRDAv
	 vtwgau6IOjbWhbKB2X9+I99g1FR6uEN4DixGMDUlteF6R241nWaqagNc0WQVaZTwO/
	 G6GJOyPaLVjcLKH4Npo/K5z0AnbVasQ+4bjwNYi7d5oBWY1a7NBliAaNYc1DeZXHQG
	 XOrLTvg73lQvw==
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
Subject: [PATCH v3 0/5] Add reset controllers for other TH1520 subsystems
Date: Tue, 14 Oct 2025 13:10:27 +0000
Message-ID: <20251014131032.49616-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_061057_410661_9D575732 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

This series is based on next-20251013, thanks for your time and review.

Changed from v2
- Collect review tags
- Fix duplicated dt-binding IDs for DSP-subsystem resets
- Link to v2: https://lore.kernel.org/all/20250915095331.53350-1-ziyao@disroot.org/

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
