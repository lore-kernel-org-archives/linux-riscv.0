Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39718CCD19A
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 06:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Z7KgE/Ywx04I7Gud6N86Rp6UAcEX65dtJdPiFGqjHY=; b=oqESbzaJhZhin3
	9NOICkcq80DcW+JGFDttpAYlUlen2EiQDlOvpFgWEDzKFP+XmTe05yNkKZytH3OVgz/1Py9MNvuQl
	qDImYnRxp+GuzEp/KTBqcNrnP9wx2hSs90cJximirf/sk1vqURE0KL1wmCw6JX0tArUOtR2OTc3x1
	shpl9cw03Iu09MD1qxOyCyQxq3+UVCVtMh3CMZErKLORMzLwbK01uEDyEro/n1G78/sIOAkshtJfF
	9hPtV6KKL0uL2KbKFTWIbsBL7JxRsrIYRdhJ30b0jVL57B4cu5x6Uf7je1yoF8+tJatzy2tL0AwAS
	4Lw4e+RLePjwe3jo1i5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLEua-0000000HTP5-46Mq;
	Tue, 18 Nov 2025 06:09:57 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLEuU-0000000HTHu-0vDm
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 06:09:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763446105;
	bh=JJKnbCzCyE56DvqtMiAuAzvsyxWj4Xmfmgz9svZYVl4=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=LRzi5te6C02Gs+k77eRctMheekb4+/EoX3pFZR6n6/Y/PUGHdak2khCC99ikBA+S3
	 93NHOriWsxYZgr6wVPvlpa35uyG5ckt+wWgUid7+A5jLVlsIIFKxxFwZfN2Ye7Gj7f
	 /yyH8aMYgMi48swl3OSdy+FZrJPMhQpI3N5o+BUQ=
X-QQ-mid: zesmtpsz7t1763446097tc170ed18
X-QQ-Originating-IP: +LNcdJjd9qMKIjgg15SU0g3IP6WZkqv8aPItSsa9TDo=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Nov 2025 14:08:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13402662488646973170
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 18 Nov 2025 14:08:06 +0800
Subject: [PATCH v3 2/4] rtc: spacemit: MFD_SPACEMIT_P1 as dependencies
MIME-Version: 1.0
Message-Id: <20251118-p1-kconfig-fix-v3-2-8839c5ac5db3@linux.spacemit.com>
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
In-Reply-To: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763446086; l=1318;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=O0ET+73GNcMNM8GQ0vp3eFlX8NnqDIXFIkI/j57BfWg=;
 b=8TEiAdqEhKkZALZLUbMI/ZvkEHwHrPeyfyMYKZDiS5r2HzeKYowHaOrTl+gWievKRuNoS24WU
 enNBKW94GzLBQtnqIVyyDffebqQOWxnQgKLUPEoazPiHoQkJ6tuWtuP
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N5zs7xsto/jUP4dsboR6rAUIRdzYqwB2GNQpqqoFrwWjVjoaBtXlmbxF
	Kz5nSDkZ3Y/yPQF/Ot1erOEYbxxtmgTGCglDPWPy+uEjJSTzc/nvY8Sv1Dzp5kiPz/etE2w
	Tkrjw+CEou1WsVx+HjFWLKyjoGQxnlM29Rm624v0sjHq8hpX39t4H2O7hbA6XiEUuhWwCT9
	WJCNTVhCLcH1pS3iSUUCQ704Vyfs09o2MJkhH/ulfYF3OcX84wAuGaN6lr7UaUfPoFVkxpq
	x2voLnydnuaASHqJMewJN0CBoamWSk7SrAMdUKBvY3oZJtC8Jeo7kk3lYnj/A46rjYigy7G
	0XX4moE1pCWknpNRefLOhC7xWLICKRocvvsAMIFCbUwqREJMGNlMz/TOw+hLp4PQ1bEuMj+
	JlCfRTQ4Q6Gue6jxUqBxFY9WQuYSjNmkaxu3ngM7Eimp5Nx+XgqXC50s13l+SjoUSNbfQg9
	RksVgLdsYMedYdi7IxLICTbxTgtVGeAymJl2NB2C5xB//v0Fe/D14iJEkXtaXoMNE9aEc4h
	9ep/7vzn1N4BzCnopFccmAXCxvSO34OZeYK0jrJeGhHi5kHlSdyLfz1+f1cBg5YxGhOsbdJ
	hXQJzYE6/FdysD7x9PE7SfQNfNZAqsczokjuWoVo3zELaqiU6SR3kzVBzws8IgG7gmbMybs
	2Xjbu2Vbp6WhNEjKrrmKygLFAI/tBAzkP6/xFwk4Got/9BILYhu3tKMC3NyJ3jZNaccoWK4
	k0kGhx2W5Rb53bfqU8m7U6bq+hytTsp56aP/FMCmRfYRcytJ64i8zsYwcvihH6I5brfMybM
	dkLGMQ6KzdK5xBE+ODngl73hDNjpuJ7wGDju+2s77UxBBK4ItRaM3PU6K/Etdq/nKmvvrxp
	tjBPuYJ33xCvjAyIvB6fN5iNKZbkWFeOwlF+RKdu/ykN6cCNY/q5yRrusIhCJWsAPsRwsUA
	uf0et/7S1VBbM9q7/xtU3feg8SZdxW04rW+R67T/iVQ7uBeD+KAS/nD/L1TsNxYrEM5q50B
	D+660c+Mg2J3TbViVWoY7z7C82getAfIbXF50Wph02JJYDEql9liteVqq6obXwPpCcAUAOj
	qaYg3G7weydRXGMEUDg/LxOT44LXiL0BqdqLNfKOC5ThEZhLvDm0IXYksRSKNpOx1S1oP8m
	5MgDKKT4t/u+AGI=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_220950_883113_3DDEEC9E 
X-CRM114-Status: GOOD (  11.37  )
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

RTC_DRV_SPACEMIT_P1 is a subdevice of P1 and should depend on
MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
does not always respect the parent's dependencies, so 'depends on'
is the safer and more correct choice.

Additionally, the default value depends on MFD_SPACEMIT_P1 rather
than ARCH_SPACEMIT.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changelog in v3:
- modify commit message
- change default value from ARCH_SPACEMIT to MFD_SPACEMIT_P1
- Link to v2: https://lore.kernel.org/all/20251027-p1-kconfig-fix-v2-3-49688f30bae8@linux.spacemit.com/
---
 drivers/rtc/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2933c41c77c88e60df721fe65b9c8afb995ae51e..b392e6d096ed077e841a2e68b70d8b80d9ad1cde 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -409,8 +409,8 @@ config RTC_DRV_MAX77686
 config RTC_DRV_SPACEMIT_P1
 	tristate "SpacemiT P1 RTC"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
-	select MFD_SPACEMIT_P1
-	default ARCH_SPACEMIT
+	depends on MFD_SPACEMIT_P1
+	default MFD_SPACEMIT_P1
 	help
 	  Enable support for the RTC function in the SpacemiT P1 PMIC.
 	  This driver can also be built as a module, which will be called

-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
