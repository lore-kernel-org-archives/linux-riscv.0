Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B53CA0EED
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 07:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JbssM8UuSVCJIqd6vDgtKNQ/ONd8gx68tfxQOsLccVA=; b=fYgFnk5Y7nWUC8
	RSDh26xyuf7C87qA5qIty+8zypBK1VZrvej0/4yPkXtJTxlpnfG78zEQPLYAC8fsag4KzbD3OcyH2
	50qVmU6nlhTmBbjxKHU0FfhRl0jACzGWkcnFWuQzOpGzFLb3FK48vGd1hV4VaIwNzKYddz+NM/Fcm
	GJ6eWjhd8kHfKviP0ZUxt+MH5b53feavwTiXr7W41tJlmVETvfT3hQGb4PpwmEcNYrpy0cj/DCkdD
	c/Tb/HauZDEUfew6Gla8s9PtQB177AvfSOgY39CvX8LzA/VFKozkLTmevYQEMrxfrLORHRb1N3Duc
	5y5QVty6D9qYcxaKHV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodWD-0000000CdMr-2HXx;
	Wed, 20 Aug 2025 07:46:01 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodTS-0000000Cd2N-0FKd
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 07:43:11 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D0A6820D9E;
	Wed, 20 Aug 2025 09:43:06 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9woW5s42fAIz; Wed, 20 Aug 2025 09:43:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755675786; bh=P8veYh6gqApO82yJJe+m7t0wzfjcOUl63n9yTtWKqKo=;
	h=From:To:Cc:Subject:Date;
	b=KoIPgeBCeFzJnioLHkrdO5SJbjwjUvd6Ha8yC2W2/m91IshHhmUU7EOYsVK6gBPxx
	 AHONKz/mXH2RO7f3HIPasV5DSSGbLqi/wodQHQBoV1EXhZYB6sJGDwoLmT6DVNgT40
	 uGDo4OdQYrne305FMWNkYoiHRscAf8rHVUgAQ8+ChyMQHo8YSkJxxzP/5b+Oq1kyC5
	 LLkZ3aa4UXgLtCnLHrGGeyNwOKZpieA6FJObChZxb08dLff2J2RWPmPN77hcHiL/t2
	 Pxp8By5aqPWir18gMUeb7qapQLoxhLhDbUGAGMbnTsg0Wp471pxPoJ31/L6L6lXsAb
	 d3/gCMtFlk1gw==
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
Subject: [PATCH v2 0/3] Scope TH1520 reset driver to VO subsystem
Date: Wed, 20 Aug 2025 07:42:42 +0000
Message-ID: <20250820074245.16613-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_004310_229260_3724799A 
X-CRM114-Status: GOOD (  11.89  )
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

T-Head TH1520 SoC integrates nine distinct reset controllers (AON, AP,
DDR, MISC, VI, VO, VP, DSP and AUDIO). Currently only the reset
controller for the VO (Video Output) subsystem is implemented in
mainline Linux.

However, the controller is described with a generic compatible string
"thead,th1520-reset", which may imply control over all reset signals
on the SoC and thus is confusing. It may also cause conflicts when
reset support for other subsystems are introduced.

This series deprecates the generic "thead,th1520-reset" compatible
string, documents a new one, "thead,th1520-reset-vo", which explicitly
describes scope of the reset controller, and converts driver and
devicetree to use the new one.

Krzysztof and Drew, I agree that we should document the bindings for
other reset controllers in TH1520 ASAP, but this requires a lot of new
code: taking TEE-only ones into account, there're eight new controllers
to be documented. Since this is a fix series that may be backported, it
think it may help to keep it small, thus decided to make a separate
series for the new reset controllers.

Changed from v1
- Split the original patch
- Deprecate the old compatible instead of removing it in dt-binding
- Drop the redundant label and outer SoC node for the dt-binding
  example
  - Keep the old compatible in driver for compatibility
  - Link to v1: https://lore.kernel.org/all/20250810-fix_reset_2-v1-1-b0d1900ba578@samsung.com/

Yao Zi (3):
  dt-bindings: reset: Scope the compatible to VO subsystem explicitly
  reset: th1520: Support the new compatible for VO-subsystem controller
  riscv: dts: thead: Scope the reset controller to VO for TH1520

 .../bindings/reset/thead,th1520-reset.yaml      | 17 ++++++++---------
 arch/riscv/boot/dts/thead/th1520.dtsi           |  6 +++---
 drivers/reset/reset-th1520.c                    |  1 +
 3 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
