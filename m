Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16526CA5FD4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 06:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JiMb4H90BJp7SoVNKJ+QUCrjJNgHisXDy9+y4Qykvh0=; b=ggZqbAxnKUIp+c
	z/IbMWBlCU0tXP/Jc4HZLJEBmnL7tq/tJyv0LYyBy1QTeS6zeJWlwyw1rURgqvAUt7QUi8cxtFQ0U
	xpCtWAlUYW2zUxjztVZ41GLpdukQJ4Tz/TnL8vuROiQwcWZX1nhjIsH73MOfn0fBwzEmOKyt+tIJX
	pnnJ03xVAwhbPkSR6BLUtdZ8Wws2KPU5sEXZbJIu8oB4MtGlDDXTvqRb2XxT2GUlaFbdpo9m1Kjqr
	4XMGQWIEU8HYs1XPfdMhqJGTcl92P/oxlrboAC2TXG1qx2Vh0TCZ92SoysdDdZLtzJ/uFpQNUYdBx
	iAbGv1vyfVdEz1tHyY+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWRy-0000000AgUP-235I;
	Fri, 02 Oct 2026 06:08:54 +0000
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWRu-0000000AgU0-2iHx
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 06:08:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790921320; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FHp4CYoXX53jLoSWEtcKpA3m+g8b3ny5d6fTFKQqrUix62Ak3P1TCwDBQpO42iC6roCoxQ6EfH30SNZYgWZYJeAbaY6cCzjF3Bj5ui4S9FLB8IG9WzOJk2wRRi0AjmmlMA1dNovOJXXeiVyjEi1g9j6CzhZ7qjQQnT9RJRf2j7U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790921320; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rb8nHi/CxSI1Yh6JtZ4ABJjs9vevLTrFHUXkNahjvzw=; 
	b=TdKHW9Kq9D8fdZHxllzwsJ++k7x+fA7kr8FLzsy3SnYgzYeaP0OpgOQam2z9yr69R1Yutu5hwcArUfplQTg8ViZY2tUfFRig7iWl52qY4jC8bjvXQpuKT1JTPwJd42Yy1Z/FQ2evJaS+bO7ouTGo7ZpHpwWJxgI3KNMFB6JGvVI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790921320;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=rb8nHi/CxSI1Yh6JtZ4ABJjs9vevLTrFHUXkNahjvzw=;
	b=BwmlKBECtCIVUucj7lHQveYeeFGF/gEebAW9V8GGKKo52abdJMyfjqgyTc0I2XXM
	N/5G9c0wPsJBWMgH+Gj9KBLg/ZDMb+eEq+PgUR88AmdP+1JJK5Oy8V8JqH1T/GtLO4c
	X9SPr1666XvSzckqsA6sG2i+TNZkdRxQj5jq/W9I=
Received: by smtp.zohomail.com with SMTPS id 179092131883686.4936962033596;
	Thu, 1 Oct 2026 23:08:38 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH 0/2] riscv: dts: anlogic: dr1v90: fix clock dtbs_check
 errors
Date: Fri, 02 Oct 2026 14:06:59 +0800
Message-Id: <20261002-dr1v90-cru-dt-fix-v1-0-c3e0b5d4c30d@pigmoral.tech>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAyF4atI1gaSqQj1KuJiOhPbdKGSUREG7
 +7YLr8H78+QxFQSdFUGk12TzlMB1xWEj5/eghqLwZFrmchhNN6fhME2jCuOeiA17SOMnj1TA+W
 3mJT51+yHv9P2+kpY7xCc5wWYzrEodQAAAA==
X-Change-ID: 20261002-dr1v90-cru-dt-fix-0463cfa1a104
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Brian Masney <bmasney@redhat.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1677;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=12bXabEjP7UeJc1aLl9bL1z/QcKD8ABIHMY7JVzWKy0=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLL2e/n8O+SdONNwmvm0jhChqxPuJsZe9Q2YGn/gTEP+z
 uM3dts5dJSyMIhxMciKKbJw+Yv/s9bh+XZEoPU+zBxWJpAhDFycAjCRij2MDO1/hQsUvy9tvsPN
 JHRzlsg+3qpfjiJ/shKNMmd0ite9+s7wh/f7pGbjfb1C2kUHnRcc3pezhL2fS3JpoOkZk3OPf5b
 mMgIA
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_230850_762958_58FDCA83 
X-CRM114-Status: UNSURE (   6.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The external CAN and watchdog clocks are optional board-level inputs to
the DR1V90 CRU. The current binding requires both inputs, causing the
common SoC device tree to provide fixed-clock placeholders without the
required clock-frequency property. Consequently, dtbs_check reports:

arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dtb: clock-ext-can (fixed-clock): 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dtb: clock-ext-wdt (fixed-clock): 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml

Make the external clocks optional in the binding, then remove the unused
placeholders from the common device tree. Both muxes select their internal
clock parents after reset, so boards without the external inputs continue
to operate normally. Boards that route either input can describe the
corresponding clock in their board-level device tree.

This based on linux-next (next-20261001).

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
Junhui Liu (2):
      dt-bindings: clock: anlogic,dr1v90-cru: make external clocks optional
      riscv: dts: anlogic: drop unused DR1V90 external clocks

 .../bindings/clock/anlogic,dr1v90-cru.yaml         | 24 +++++++++++++++-------
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi            | 16 ++-------------
 2 files changed, 19 insertions(+), 21 deletions(-)
---
base-commit: 9f24d789f03b22941b905ded43cb5ff8eea9ce62
change-id: 20261002-dr1v90-cru-dt-fix-0463cfa1a104

Best regards,
--  
Junhui Liu <junhui.liu@pigmoral.tech>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
