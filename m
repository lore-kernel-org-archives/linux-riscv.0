Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1052DC76196
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Apr 2023 04:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=svneYEG5XFPk50sFe4aSU4zi4RNettGjHJxqdhybys0=; b=TM7eF7qNkUMtEc
	3g/DHhzWYqgm0C5+9vAoF5Sa+0fS9D7FhEBy/p4sdQPg+DQM+pLyTCV5AUHWrLuI7Q7uIoCjFoR5k
	5xA84HbT30X1KQe9ruTMzD4DvymP1TtpR3QDiiWjsWEHcy0uo4MExaeZxm4BetlNkXRAwFIgY9Zj6
	pjc7kVXAvAn43xakoEMQDBm0BG0UeWpeGIzz8me0FEWHHgx4JNdoTNMAnePqVIGHu5wxkVzKEVwlD
	e/oCcBK9Bnv88I7os209RV0Cew7dFBWBtTidnodwJzd3o4Y6DM4Dxn3q9qJeflebPzqJOVSE7wZH1
	CDq5UMKF6Az+N2gCk97A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plj7G-00EY3N-3A;
	Mon, 10 Apr 2023 04:26:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plj7E-00EY2I-0e
	for linux-riscv@lists.infradead.org;
	Mon, 10 Apr 2023 04:26:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 98C7660C33
	for <linux-riscv@lists.infradead.org>; Mon, 10 Apr 2023 04:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D65C433EF;
	Mon, 10 Apr 2023 04:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681100809;
	bh=PFTs0oq8nDaAGNB4674K1KYq60X4dMAg8eiKLD2TXMM=;
	h=From:To:Cc:Subject:Date:From;
	b=LDXsH0qPu1THx7nSLzxr+IntmT0GIKv6nawYUT4PgAsllybbDfUR1nkD0lBBqGv/D
	 phZdm7Bk5n0W7Gy2U+st+BNo2QHVSo467cJjjtgzB7esTcQpEC9cxoX5DDIrzWgU6G
	 EExD/HuxejDedf7XpsXwYQtNE4slPDugjueJB7rbqQ+rfSY+IXBZ7B44zj8AjaQfzq
	 8DNb0gfyTPCX8wW8ke+bw/0FGIMw/FP5XV/j46eqC1tywKeRHxH8qa1drZEJ4tXqu+
	 ipaxiAhAej7Ao1jVLU75KCl77pplV2nWLqApbO1EjskS71CQyey7bsbb8Pl0/AZp9l
	 eqyCiVFX6hVkQ==
From: dlemoal@kernel.org
To: linux-ide@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] ata: Change email addresses in MAINTAINERS
Date: Mon, 10 Apr 2023 13:26:46 +0900
Message-Id: <20230410042646.124962-1-dlemoal@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230409_212652_294520_87A2085E 
X-CRM114-Status: GOOD (  11.26  )
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

From: Damien Le Moal <dlemoal@kernel.org>

Change my email addresses referenced in the MAINTAINERS file for the ata
subsystem to dlemoal@kernel.org. While at it, also change other
references (zonefs and k210 drivers) to the same address.

Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ec57c42ed544..8e156c754e20 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4461,14 +4461,14 @@ F:	Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
 F:	drivers/net/ieee802154/ca8210.c
 
 CANAAN/KENDRYTE K210 SOC FPIOA DRIVER
-M:	Damien Le Moal <damien.lemoal@wdc.com>
+M:	Damien Le Moal <dlemoal@kernel.org>
 L:	linux-riscv@lists.infradead.org
 L:	linux-gpio@vger.kernel.org (pinctrl driver)
 F:	Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
 F:	drivers/pinctrl/pinctrl-k210.c
 
 CANAAN/KENDRYTE K210 SOC RESET CONTROLLER DRIVER
-M:	Damien Le Moal <damien.lemoal@wdc.com>
+M:	Damien Le Moal <dlemoal@kernel.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
@@ -4476,7 +4476,7 @@ F:	Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
 F:	drivers/reset/reset-k210.c
 
 CANAAN/KENDRYTE K210 SOC SYSTEM CONTROLLER DRIVER
-M:	Damien Le Moal <damien.lemoal@wdc.com>
+M:	Damien Le Moal <dlemoal@kernel.org>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 F:      Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
@@ -11757,7 +11757,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
 F:	drivers/ata/sata_promise.*
 
 LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)
-M:	Damien Le Moal <damien.lemoal@opensource.wdc.com>
+M:	Damien Le Moal <dlemoal@kernel.org>
 L:	linux-ide@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata.git
@@ -23122,7 +23122,7 @@ S:	Maintained
 F:	arch/x86/kernel/cpu/zhaoxin.c
 
 ZONEFS FILESYSTEM
-M:	Damien Le Moal <damien.lemoal@opensource.wdc.com>
+M:	Damien Le Moal <dlemoal@kernel.org>
 M:	Naohiro Aota <naohiro.aota@wdc.com>
 R:	Johannes Thumshirn <jth@kernel.org>
 L:	linux-fsdevel@vger.kernel.org
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
