Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A147AC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 21:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWwH3saS/cjTSU650lhlEr0mNzY6PiciEQjlmh7CZDk=; b=Zb2EclF3Wmyf+U
	d2eMSDBIb8QkiATgChdkyAcdK3kCgrMhA+6kALcP9DiEWuKCpeOyzPF3x+zdqQ+5a7WCv+g0df2iJ
	0UfIRSYjOrVyRY4F7S8udiqIvXDslxm3tMTOKY7V0GrtCOFmOIIdUielxH5DKMNny1EmBr3xq/U8g
	o48yDbAWcK0xKlO/RGeJol6MXhSo2FukgFAS2tL+FtSA0X79VBS5vwWKWy+pawkCObd8Sv355T8ev
	3CBb5OVxWQQLjQFS4I1gvuO52Uk8mVSaDA+6L44ND2nAs0R6gHfkLGkfY2pPY3BZf5VPhX2E66F9Q
	Dy0iR1s+vVfOeFWiR8cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ossXj-00HOXS-Hw; Wed, 09 Nov 2022 21:23:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ossXf-00HOV4-Pi
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 21:23:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6623F61CFE;
	Wed,  9 Nov 2022 21:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933AFC433B5;
	Wed,  9 Nov 2022 21:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668029006;
	bh=Uhz+c0Au4X5R+Me/kqjj5ZsS5Tm4IL+gXDcUV/+yS4E=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=F7+JYa8wW+KGwjrZkH1mPIM3cysiWtFkiahgRNauk9TvmMXUQBj/dtH17Nj40+uly
	 SWc84L8J5a5OF7/QXIRrteMKAkBgjM0jlOiZmzP9c3n1S0dj1m7AaE3r3lDyQfnX+f
	 HiCxtE9hcJO0Dqzvs5P94FpVXaOmV+zHQvOQu6ZwDFbDm13MxcPRxerHhpX8TRVrp/
	 5VBuCiyE1cYEnENY5a82QXR2aZemnf19NuAUI7nPeTv1RyJICJuqbrQsue4D5nknjl
	 i9PNG9yBCvhxKLQAo4WWFrOg0NSXxJNiq8swRvfoNZeMzJBZypf+9S+O1c4x9FmSPo
	 xK1RyP5wfRrZQ==
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	soc@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v1 4/4] MAINTAINERS: repair Microchip corei2c driver entry
Date: Wed,  9 Nov 2022 21:22:20 +0000
Message-Id: <20221109212219.1598355-5-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221109212219.1598355-1-conor@kernel.org>
References: <20221109212219.1598355-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_132327_902312_FFBB0D8D 
X-CRM114-Status: GOOD (  13.67  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The driver was renamed before application but the relevant change did
not propagate to the MAINTAINERS patch that was applied. Repair it.

CC: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I'd swear you reported this at some stage Lukas but I didn't see
anything when I took a quick look on lore.
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 040d49af9bdb..269e284570fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17750,7 +17750,7 @@ F:	Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
 F:	arch/riscv/boot/dts/microchip/
 F:	drivers/char/hw_random/mpfs-rng.c
 F:	drivers/clk/microchip/clk-mpfs.c
-F:	drivers/i2c/busses/i2c-microchip-core.c
+F:	drivers/i2c/busses/i2c-microchip-corei2c.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/pcie-microchip-host.c
 F:	drivers/reset/reset-mpfs.c
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
