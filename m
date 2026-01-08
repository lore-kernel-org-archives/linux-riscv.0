Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844CACF6A86
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 08:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6pkPotyQtK86XZFLlOjmDGOU774dS3XChQ2hkkcnBxs=; b=Q9RiuYz1jc2hvG
	3oIeXEfNJYAz4Ge2grMTghP1AV2iEDIrub4m+RxloYe7NRYdJU5s1TqDeTt9tgsU2wamtJfY1haEv
	O4uMqI6JEfyWwgPJDEdlCvh7dNNYXlbUZ03+Vh89DHzqfYDlX2aZqayv10vQv/pv+VBXco7Hn2r9P
	2syZjGFduXhPBzcU+S789NQLKEkX1g4h7ZmIsnkdFde5V3Fgv7O8nbP45PksWsWFm1aUUiUbza/tE
	py3tG+abAxfGgFpAG/NtQmcgZdgd4S66eoYmQoyFkQ9xbOzKF0Xp6BRtiRTP8fVGCXR1UZ4wHDO2y
	2V+6Ya49YZMWUnf7iLJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlYr-0000000GJk8-3FS5;
	Thu, 08 Jan 2026 08:40:05 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlYo-0000000GJff-2vE5
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 08:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767861549;
	bh=sp5K3VkefrVnuWV+ys3nGYfC61ceu0DP4LhpEvGP00Q=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=y3NyM5CAkKM3AoPF8mepppeP/CiQU4KJYLEZwL8LVf1Nuo/9303eZ+yol0sNBu/Gm
	 5QT5wqzFwtpK1GIZSjDGx25KGOQEC/iRcsge9Qro0zXn3hK5SQ1XGxwU8lDzJMyuxD
	 D8wawYVKVAXAPumObk4m8dOutW2dXLr1dskxk61I=
X-QQ-mid: esmtpsz20t1767861541tf3b247e5
X-QQ-Originating-IP: wz7bZD9g+XxhYcyVO7Bx85P+ibKdteFy0msASS7JnYk=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 16:38:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14760604461507898606
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 08 Jan 2026 16:38:54 +0800
Subject: [PATCH v5 1/3] regulator: spacemit: MFD_SPACEMIT_P1 as
 dependencies
MIME-Version: 1.0
Message-Id: <20260108-p1-kconfig-fix-v5-1-6fe19f460269@linux.spacemit.com>
References: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
In-Reply-To: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767861535; l=1908;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=l0P1/XJnYJJjVLkQ2RZpYHnO+C5ScLPs7tmvyBIKM/I=;
 b=ESyDfxPS8NIbcdtEszUGlXFzmS7z8F7hdhU6+rn4cXKnYF39eOKpv4J2iwqubimrGrG3fJUDB
 0KEedp49deYDsuGsUUemkfJaHHoBJAepDwBJ812yXU/a/pmCY1OrUeA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MyirvGjpKb1j5YbK+baXzNPJU2eh80mxY68nqflhAQCsOMzB2GkWj7ln
	nwpwb2REpIFFpaWw2P+/EBbuayPaJOUKryasxFTOIagVFLDiH55oanVCf81skLrARXng/is
	uYE8dHTOR7u2kG5nr5pj/s+kz2muaBLYIuRcoCLEY1bYyQ0Xd9LXsdmKmUTchrHdpiNODlb
	DR1aQyuD1bzD8l3oadNevCG1fEbSD8IYfz6uUs46rC/dK1plWb1jfmp4eiwdkGrts97tFa4
	Jx/d/KIhSX8WGH8YxGy6Ez0LMb+QcOvhYd0dUEIt33jgbc74RIrI6LulnUkhHomWQ8d1b1I
	93lgPLyv5jee8tjt3rdBzG+RNqEbfE61vufDLZToB3GSZ5fMj6Oq4wCSW8mo9E6ZCkLAokg
	pcZT2as5jksD2hOozgU1o3f8iDmK5/dY41r+nDeoJJjyjK5rG3QXleS2qUnUJL9sQ+aUd4u
	FhW9/zDBr0KHjO3FhPDY+ySOiVM86fQgm6C3/9t3MCbpJrQuteXKi0oHrgBjnjd1Hm81UN9
	00aMhv3Fdc7qmC/hqZeb5SfC3dn9vOXg3FgnTqD00MQQq9OkAWLudaeNNo1jKT14R9phFSP
	Knr4rXs3WZg94Ez4okmivlVMYg66F73DVQK4qzEwkbO57V1mvMG5tmDzofBq1+fxULchgQP
	N3UvP0KsDiT9drG+WFLV6cScrMtwADZfQgpoj5EljGd3Se2U7FRzokQV3pN6CYFp9aSaiyk
	Y5TxpvHWVCUbExIiZt99kYoXymvz1PwNOvg8vsOt2DoLleAXHs+NzFUQFf4pUyzgniAujEc
	DTEbN3mQuKiqZn6XMSrzNYYghd57yz3P+QX5rsfxnIUXpzgXZ/rNOmC8QncMT5Wm35skilx
	0RFdLDnZUW1wmzzBJ+NbtxIb8pH/5VIR2/+TbTfHzjr9L1re/dGPMP1CdzwT1gnCS1IO1Bv
	XnkvKXjYy0YHCgCQ3GnvTCP1JK3UVGCcl0S5A21flBr/ft+dr9qVGSDjpiUTdWFXM/bNFls
	jSyiddtcW1jKVsILnU4QkfSWtcnKwyMgb3kCWkcxMGr+m7dNRsW3K3hnL5nx8bS2+i1wYuW
	YuB56oEcCY0dpJNLCHAyFMcFLmoe7VDBdLM1taopht5f4MGoc1rZXw=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_004003_674816_31C48961 
X-CRM114-Status: UNSURE (   9.39  )
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

REGULATOR_SPACEMIT_P1 is a subdevice of P1 and should depend on
MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
does not always respect the parent's dependencies, so 'depends on'
is the safer and more correct choice.

Since MFD_SPACEMIT_P1 already depends on I2C_K1, the dependency
in REGULATOR_SPACEMIT_P1 is now redundant.

Additionally, the default value depends on MFD_SPACEMIT_P1 rather
than ARCH_SPACEMIT.

Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Change log in v5:
- nothing
- Link to v4: https://lore.kernel.org/all/20251225-p1-kconfig-fix-v4-1-44b6728117c1@linux.spacemit.com/

Change log in v4:
- default m if MFD_SPACEMIT_P1 instead of default MFD_SPACEMIT_P1
Link to v3: https://lore.kernel.org/all/20251118-p1-kconfig-fix-v3-3-8839c5ac5db3@linux.spacemit.com/

Changelog in v3:
- modify commit message
- change default value from ARCH_SPACEMIT to MFD_SPACEMIT_P1
- Link to v2: https://lore.kernel.org/all/20251027-p1-kconfig-fix-v2-4-49688f30bae8@linux.spacemit.com/
---
 drivers/regulator/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index d2335276cce5ffbd500bbaf251d1761a9116aee9..b51888a9a78f399a6af3294fc19f60792576332c 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1496,9 +1496,8 @@ config REGULATOR_SLG51000
 config REGULATOR_SPACEMIT_P1
 	tristate "SpacemiT P1 regulators"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
-	depends on I2C
-	select MFD_SPACEMIT_P1
-	default ARCH_SPACEMIT
+	depends on MFD_SPACEMIT_P1
+	default m if MFD_SPACEMIT_P1
 	help
 	  Enable support for regulators implemented by the SpacemiT P1
 	  power controller.  The P1 implements 6 high-efficiency buck

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
