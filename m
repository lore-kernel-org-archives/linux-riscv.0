Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91DACAC5A5
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 11:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ESYsBQKRtWg2k0mTzwGzrN/LoirxL8ORB5dZs00yjb8=; b=P4aI5VGeVqsOKJ
	4geIDbWBdnIJpipalf6EghzkwA0DZENai8m2oZZtRHpBI+ClyHGAArw24+cJyRNA5LjUqCLUrqDLN
	ihS7udxLsWScMS4sep4ujI7/quwkSNJbdqMzpUeJ+IJMMpXVxxLH+6rfB/TbgtoCdH8P7xqtaoVM3
	SUBpVJ/ycptVfBbfDlOvUqEQ+EChub0C5nRJoL02LQGaPhIqeyvDH0yQOhrdK0USmVFqE2KtZ2wvp
	60ozCaFXbN2pUsZnJDh/KZvOt01Pa+gwRlTQ6dMhkoGS4tq1bs20/6ZKou45ch2qZza3tsMN3iHrg
	DJ1HAfSraB7P7uCvCW4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1NPR-0000000Gnyl-0tXa;
	Wed, 24 Sep 2025 11:11:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1NPP-0000000GnwP-0nQe
	for linux-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 11:11:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD0114444C;
	Wed, 24 Sep 2025 11:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9094FC4CEF0;
	Wed, 24 Sep 2025 11:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758712268;
	bh=doBgBoI1eDAhaG6OMnM5npExQ5Xq3oY1DJugrOTICDs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=C+IkBcFvRHMhMqSTAi7QQvT426ov1Xu2lUdeVYhwFMZ/ySB+bA9+EkAeUtMjEoDzq
	 hdgcIDbRhBuRXaITeBuyUwDm0WKiprteqxn4OwZ9WJgd+OW7yWorlsg9iC+29qhvG1
	 x3luhyhCR4ln1Pgdt9UOW28fPZw8+otc+Zi69pMbQzZQpXIV7vjgV0TDrAmiSBPumf
	 JBs+eh3+7HMARx8f6ph1+OMtreW/srOdiCHC9Klc4zI3JYPSM/3mBqlrBI8pZYpSal
	 3K0kZora+PXHeg9JXNfEbKEjp/iQhE335xgQ5IHVeAmAjB+n/1ejXtKnyytdm4/FDV
	 4T6bsdP7YnF6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8525ACAC5A7;
	Wed, 24 Sep 2025 11:11:08 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Subject: [PATCH RESEND v6 0/2] riscv: Use GCR.U timer device as clocksource
Date: Wed, 24 Sep 2025 13:10:36 +0200
Message-Id: <20250924-riscv-time-mmio-v6-0-9c6158a14b37@htecgroup.com>
MIME-Version: 1.0
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758712265; l=2047;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=doBgBoI1eDAhaG6OMnM5npExQ5Xq3oY1DJugrOTICDs=;
 b=cGoKWPef+x/OJkYs0CfESXFWfVLvr4WX+Yo6owR4wQKjP0iD42TLYxf1tYO05HzoeQYXSwtF0
 DXSxwdt/bd2Df9BY7kAWrV0PLXuzNvKx6zZxEiTuuxwiSE2do/xWQXQ
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_041139_275326_0E28A595 
X-CRM114-Status: GOOD (  10.32  )
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
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds bindings for the GCR.U timer device and corresponding
driver support. Accessing the memory mapped mtime register in the GCR.U
region should be faster than trapping to M mode each time the timer
needs to be read.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
Changes in v6:
- Rename mti,gcru to mips,p8700-gcru
- Link to v5: https://lore.kernel.org/r/20250711-riscv-time-mmio-v5-0-9ed1f825ad5e@htecgroup.com

Changes in v5:
- Fixed build issues on 32-bit RISC-V and sparse warnings
- Remove clint_time_val and clint.h, replace with riscv_time_val
- Depend on RISCV_TIMER in Kconfig
Changes in v4:
- Remove "select" from mti,gcru.yaml.
- Refactor the driver to use function pointers instead of static keys.

Previous versions:
v1: https://lore.kernel.org/lkml/20241227150056.191794-1-arikalo@gmail.com/#t
v2: https://lore.kernel.org/linux-riscv/20250409143816.15802-1-aleksa.paunovic@htecgroup.com/
v3: https://lore.kernel.org/linux-riscv/DU0PR09MB61968695A2A3146EE83B7708F6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com/
v4: https://lore.kernel.org/r/20250514-riscv-time-mmio-v4-0-cb0cf2922d66@htecgroup.com
v5: https://lore.kernel.org/r/20250711-riscv-time-mmio-v5-0-9ed1f825ad5e@htecgroup.com

---
Aleksa Paunovic (2):
      dt-bindings: timer: mips,p8700-gcru
      riscv: Allow for riscv-clock to pick up mmio address.

 .../devicetree/bindings/timer/mips,p8700-gcru.yaml | 38 +++++++++++++
 arch/riscv/include/asm/clint.h                     | 26 ---------
 arch/riscv/include/asm/timex.h                     | 63 ++++++++++++----------
 drivers/clocksource/Kconfig                        | 12 +++++
 drivers/clocksource/timer-clint.c                  | 20 ++++---
 drivers/clocksource/timer-riscv.c                  | 34 ++++++++++++
 6 files changed, 128 insertions(+), 65 deletions(-)
---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250424-riscv-time-mmio-5628e0fca8af

Best regards,
-- 
Aleksa Paunovic <aleksa.paunovic@htecgroup.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
