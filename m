Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25F1CA5FDD
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 16:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ropzgSY3srbD01JZWxrQP39PIq6muH+vSJVcz8e/u08=; b=eEyei9lvVj5i5s
	fBtAi06ekDbjXTkdqnVg+dIIjT694IlIRIU4mUd9uPzP/UGqcdFsVu6eipaUGUyMVUDAj43xUd71z
	hBsLXdWUubKXABbW4mIO46vu6kuHUVvKIakIo4UCCRblawJsum2JBH7BQfLrEU84lmJVkuQx/elY3
	FIxlmKjAP+hWCLl+Qua40pjsDuHjyjKvsz6NqdTp5rIp/mjq+qcGOWOdRseaGwDJW7IPhhbA0qDRl
	5v7SYHfO3QGVNaRnoSwadqIJ3z2eeOhMUj801lOsPAUXgLH88OvHOZyNIHWoVTo4oMRXemgGJ9q8w
	yeQzl444xg71lmYk7HUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCg8L-0000000C1v3-0xCA;
	Fri, 02 Oct 2026 16:29:17 +0000
Received: from sender5-op-o15.zoho.com ([165.173.182.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCg8H-0000000C1uP-1zUT
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 16:29:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790958545; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aSIVhUj4khfoLk3lWl78yR+YHulD0x/Om2m9eERu8UpLaAi+Won1b09eHv6SOm1fk6uaCCMRz3UoffFnxYSIHFa9iVaqB0yiPwKOCfszeJ3RSGNODJsFTol+0ZvRjpyV/0/TTskX6NCYpBoC/PxxXxauvEObMS2r0LTpbX/PcIE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790958545; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hCAHqdDJ11ApEMn14+Ry9UN0txrOLWuLO9GRK+R3gmY=; 
	b=VlBduSsl0GijwcKQvE6/S766LWNahL26z0zZrmskab0/E7fxJTS/eQI6D9U5c2TrvSOi5Wg47wOPnkbBf6/Xz2iwNR2u9LIgLxLOCOo+Mr3Tu6hyfPBnnCK7/l/n4mHNYkAxCR/xNDMeJdh+qz2MV+pGJNhdcCKJq4RwBXTIHD8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790958545;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=hCAHqdDJ11ApEMn14+Ry9UN0txrOLWuLO9GRK+R3gmY=;
	b=AzdXh1Kx8Kxq8jQ7qLP0kwUYhly6J7xMZdeBL3QIHe1s49lEx5wbz8mOz+zMkhuT
	u9qCjLz8PaFRKGhtX3SzraEtADPJuTAUf58C/KlYDgO/O5yHLIPjdMTvtCfqDb422yx
	Sj0Lb36F58eBtnLWIMxbw+t9tPDo2M5+saHYNFdU=
Received: by smtp.zohomail.com with SMTPS id 1790958543889765.0593727159765;
	Fri, 2 Oct 2026 09:29:03 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v2 0/2] riscv: dts: anlogic: dr1v90: fix clock dtbs_check
 errors
Date: Sat, 03 Oct 2026 00:28:38 +0800
Message-Id: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NwQ6CMBBEf4Xs2TXbgiR68j8Mh9IuUKNCtqXRE
 P7dgnePbzLzZoHA4jnApVhAOPngx1cGfSjADubVM3qXGTTpWhFpdKLSmdDKjC5i599IVV3azii
 jqIK8m4RzvDtvzY/D3N7Zxk20NQYf4iif/TSprffPnxRmLpnak6tsSe46+f45inkcI9sBmnVdv
 /uPXSfIAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2057;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=IHvzbLrU31w9ckgQETxkKDJeh7K+/rYGP2tSLlCw4uU=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLL2394tL3wtZm3SxgWXL0e/Pf7rwq01RvvndCjGr5suU
 xo24dkS+Y5SFgYxLgZZMUUWLn/xf9Y6PN+OCLTeh5nDygQyhIGLUwAm4lTOyDDpl9LanKPuqjUX
 lJf7rWadYdcdW3jzl/1HEQ6TJd1e9ocZGa6vNxQzWn3vFtOJrNBF9r59Gzql4+Mv/1WRT+P3m+B
 rzAMA
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_092913_952202_2E91D60A 
X-CRM114-Status: UNSURE (   8.12  )
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

Based on linux-next (next-20261001). The issue was introduced by the
original series [1].

Link: https://lore.kernel.org/all/20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech [1]
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
Changes in v2:
- Update the binding to clarify the clocks description and simplify the
  clock-names constraints
- Collect tags
- Link to v1: https://patch.msgid.link/20261002-dr1v90-cru-dt-fix-v1-0-c3e0b5d4c30d@pigmoral.tech

---
Junhui Liu (2):
      dt-bindings: clock: anlogic,dr1v90-cru: make external clocks optional
      riscv: dts: anlogic: drop unused DR1V90 external clocks

 .../devicetree/bindings/clock/anlogic,dr1v90-cru.yaml    | 12 +++++++-----
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi                  | 16 ++--------------
 2 files changed, 9 insertions(+), 19 deletions(-)
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
