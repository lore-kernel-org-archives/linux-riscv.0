Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531ACC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 21:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PyV8O5m8AWhwGgHFvz5hlgwFEdtfLAiqb0Tzcw87NHs=; b=ppxeLW/bk3I6v/
	McDOVQEnfMetMz+/c214Fy5Uhpto5LOp4mz2Ftsv6J3hOBukrQTFXTos9yZRkilzlWzhGjhlNbNT+
	JlMP3UMv2PNQoFF+LSHH9gr7/4C1Kl+aEOXcn4aezRc41Yfsn92IHvBEr5UglAetcNZnEpGeL1chT
	5gd9f2+laZDkSnRAXQ/z+SP1o1yNbdHCULtzqHMAONGulHarS9/GINx07PyKIyiho8reLGb2/1iKL
	ppaGcqnoQy5RUUo3q9piYjuqmb1XJOL3YzBqPBfaqbo3hNKz1n31E9VPLJY0UduHYTXYqpe2YW6Wn
	1KgO+sMVmBQozsrnuqpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ossXh-00HOWF-Oi; Wed, 09 Nov 2022 21:23:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ossXd-00HOU1-5r
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 21:23:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B7F0A61CFE;
	Wed,  9 Nov 2022 21:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BCB0C433C1;
	Wed,  9 Nov 2022 21:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668029004;
	bh=djqMJJN5Z2uJit2sAoUpAX5+9Xk7foJHsNds+vuT428=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=KeQ4QV3rNq5pdQC1ZSrmgGCD0dHlyfQq7PLyBUn4aYujhn12BuAXT3+GCL2hGWRli
	 ND2KHgg8p0FWuYGexzowrL+btq0x+UFceQKWJDCjteKG2KH0TdCao4ZVDg27dCH5El
	 fQNVE200yKn9ja0IhJpdDHPOTAe5hzs8IQvJIftIWcUg6CoQnHbxNqD5otngUzYJtJ
	 Hus1lDSnFBlPczqNfrP7erFDXYZdVjSTI6azKbPzai91gxlSrf1oWTF/ipLiG+lHo3
	 YrBZkJI5p16EYV4klN2tNHyb5q89+Amw3Mm5uYLPEueGFnxvVO7ax5AKtMBj68N59r
	 +oEGR9eGMXVfQ==
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 3/4] MAINTAINERS: add an entry for StarFive devicetrees
Date: Wed,  9 Nov 2022 21:22:19 +0000
Message-Id: <20221109212219.1598355-4-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221109212219.1598355-1-conor@kernel.org>
References: <20221109212219.1598355-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_132325_331541_D4C0F975 
X-CRM114-Status: UNSURE (   9.54  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Emil looks after the downstream StarFive stuff, and agreed to look after
the upstream ones too.

CC: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a57c90be001f..040d49af9bdb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19622,6 +19622,11 @@ M:	Ion Badulescu <ionut@badula.org>
 S:	Odd Fixes
 F:	drivers/net/ethernet/adaptec/starfire*
 
+STARFIVE DEVICETREES
+M:	Emil Renner Berthing <kernel@esmil.dk>
+S:	Maintained
+F:	arch/riscv/boot/dts/starfive/
+
 STARFIVE JH7100 CLOCK DRIVERS
 M:	Emil Renner Berthing <kernel@esmil.dk>
 S:	Maintained
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
