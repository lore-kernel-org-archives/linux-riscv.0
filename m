Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E8EF327AD
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 06:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:To:Subject:Date:Message-Id
	:From:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=askBOGOw2h4CyNP8gbRzmyPnYBinWtONeBuuFNqI6gs=; b=ofSAh8fnLL8rcA
	58/UdSm/ll1Zrxq06rtyqV24f6P/PfN6qmNOfipC9aQyBQtkMw1q96xjzmY9tFPoJgSTpJFEeOaI7
	1jnraZkaYRbwI9v59WyFF6jCtqYRIY/jq1Tq7RIeQKFX8scVt7CP9+RxNWuJjGGNP/Cya8EWNanft
	t1zWB+XGyrnR6FFdMWHLA2bVZOY6ci780CN1a1RsH89MDZg/6+LG9k7MUTx+HzirFkkXZ+Lv5bFfS
	5sJ6OuGYmNFNJPrBpGvwzA81rW0LY7uKzi6HZXNze3OmA3MJSgC8cBHJbWsPs5DQ92M9xlxU/6weF
	/W7IaMAk+wFWt0NKN2hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4nI-000000087Aa-1DLj;
	Tue, 21 Apr 2026 06:41:12 +0000
Received: from va-2-27.ptr.blmpb.com ([209.127.231.27])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4nF-0000000879E-185r
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 06:41:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1776753662;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=bOD3EGcybYF59xsN+7vrNuVhjQ9htAdl90lQIE/I3Uc=;
 b=0AbhKR9odaVJolw2A8Cc6aTH9iBHe2iV9ySgdqEoYLkOsxcNLtbkyZZFbD1KnEcJiS6nDs
 Db5BImo4tpprx6TjSylDzjlCErenuu2HsLl9CONIfjcDFfS8qBjmzXUlujv7I6yTVvcN1i
 KJT0B0Ew5Te8KQs5cqXmPA6THFXZxJW4YsHkhyI42X9SwwHFS6ZCu2O99U2An7fSqHZMgQ
 Xhdi0Sc3n09RzzqmFFgRcmLD4REx4W2CBTNs7ROmRyt84HmxPlSpRwjPWCngt3SO669b/5
 7tvGTOEw3dtrEJ+otweCv/HtQohrP7NHzk6WnftWhIqfHtK/teUCAbeQjWDDOQ==
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, "Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Message-Id: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
Date: Tue, 21 Apr 2026 14:40:21 +0800
Subject: [PATCH v5 0/2] Add DeepComputing FML13V05 board dts
X-Lms-Return-Path: <lba+269e71bfb+a0b9b0+lists.infradead.org+sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([113.110.140.180]) by smtp.feishu.cn with ESMTPS; Tue, 21 Apr 2026 14:40:58 +0800
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>
Mime-Version: 1.0
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_234110_402611_9F162A06 
X-CRM114-Status: UNSURE (   5.03  )
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

This series updates Device Tree related files to introduce the
FML13V05 board from DeepComputing, which incorporates a Spacemit
K3 SoC.  This board is designed for use on the Framework Laptop 13
Chassis, which has (Framework) SKU FRANHQ0001.

The series is rebased on next-20260420.

v5:
rebased on next-20260420.

v4:
- Patch 1:
  Add Acked-by Conor Dooley.
- Patch 2:
  Copyright begins from 2026.
Link to v4: https://lore.kernel.org/all/20260413060524.1235982-1-sandie.cao@deepcomputing.io/

v3:
rebased on k1/dt-for-next.
- Patch 1:
   Use formal format user name.
   Remove Reviewed-by Heinrich Schuchardt from internal system.
- Patch 2:
   Use formal format user name.
   Remove Reviewed-by Heinrich Schuchardt from internal system.
   Add uart0 pinctrl.
Link to v3: https://lore.kernel.org/all/20260407055557.1202713-1-sandie.cao@deepcomputing.io/
 
v2 (deprecated):
Link to v2: https://lore.kernel.org/all/20260331071110.68321-1-sandie.cao@deepcomputing.io/

v1:
Link to v1: https://lore.kernel.org/all/20260331034423.67142-1-sandie.cao@deepcomputing.io/

Sandie Cao (2):
  dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
  riscv: dts: spacemit: add DeepComputing FML13V05 board device tree

 .../devicetree/bindings/riscv/spacemit.yaml   |  1 +
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 31 +++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts


base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
