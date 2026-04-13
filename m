Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CD5E9381F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 06:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Cc:To:Date:Subject:From:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pd9+8oMzSkAN97TzDV71+na6VrHvo56r21m1se4TWY0=; b=qvLAGjdIWByI8y
	j9ilWuhee5mizG4Saz1WCnAXq1Cn6jFZyWH4fSx2hDikwkGd12M44jm29TuKFGNyQK/kDcqL2JeGJ
	oXv+L8HVarM0kFV9U9UxkvLbFhh2D+5CW/MnNMCtbEhw9bqOvcj3PkUsWJRiDDq+aYM+FX08MJLeP
	iVmFLI9FcJVz5MjFPHS1CE/3vch0+gFojRyjjwM0c0cF3CP/mH7TvZebn3iwWFN/ULNJxMA25xSoB
	ecPauqmDf81IJtiQ+AVA6IACUdTN9UZwFfFPCWWVSDutB3wpv28LPrBDjgDG8S7z00O4WUJbNpIJ5
	TzjHSUcvAbPydoegwKng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCAQn-0000000F2sY-30WO;
	Mon, 13 Apr 2026 06:05:58 +0000
Received: from va-2-37.ptr.blmpb.com ([209.127.231.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCAQk-0000000F2sE-0kXO
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 06:05:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1776060345;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=jc7SW3G3n7gqDEES3NqW5Omx0t1DvQGVxUWrewOE79c=;
 b=rR0ybaSkWeUEFJxyTc/nNZjsptHaZj/fHMF1Wf/psKULYrevZLewlokwUoJKhCXR9MB0ru
 c6TloqxNgCAM8velyd+m/+JIKQSArzWv3sgNxgoJyXZJBspbcjrYPClUdjIYfPHupGJi3A
 zcElHQyv8Q4K5Mdm3328wrTXUCz8X7m2TsjpGlB105zibcXhBSrZ/+p0fi0aw2PGatOjQS
 i3SfBzeaff37xyel4IxT0SrNopBDL8A9YdJr/SHZMvt9wFb9SInOlnbXNLGI+6FZtIs0Rm
 82DkP+i34KOkN2JJQ46NWi5TszIXR3mGyylrmNwcrZ23xf5tAwZaIuFZGizZrg==
Mime-Version: 1.0
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v4 0/2]  Add DeepComputing FML13V05 board dts
Date: Mon, 13 Apr 2026 14:05:24 +0800
X-Lms-Return-Path: <lba+269dc87b7+8f7fd7+lists.infradead.org+sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: "Conor Dooley" <conor+dt@kernel.org>, 
	"Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Message-Id: <20260413060524.1235982-1-sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([61.141.250.238]) by smtp.feishu.cn with ESMTPS; Mon, 13 Apr 2026 14:05:42 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_230554_367767_43C8CCA9 
X-CRM114-Status: UNSURE (   5.22  )
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

The series is rebased on k1/dt-for-next.

v4:
- Patch 1:
  Add Acked-by Conor Dooley.
- Patch 2:
  Copyright begins from 2026.

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


base-commit: af62a095eb0c3359d477b55ef72d2afd94c83c8f
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
