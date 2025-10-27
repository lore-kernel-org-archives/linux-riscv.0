Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62D9CCF9E0
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 05:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z4xBbb8JtQibsTt+g3aYzCCqYiVgqGs+tEE5cCZkEpU=; b=CDhMDBHRC7dobX
	kMcnDRp05ByDwiT0FI1/sJDsxkLUrGQQjY+GZvGiO2HAeCQmUu26DB3POaQv6CaMu3AYPa1dDUGfp
	QeX7WppjPKxYmkarkJ7nV/W4fFSPieIhJ4gCCG+PK4GBT2aJ4pPdYrcQFADSey5fzq7sGpWIRhFm7
	8p5sr2/inFSVyTSsLmRTyipkzD1bDbWzHsRwluOaxOmvQas1HuYyqSiPHmR46xLYcJJQHE+4XdnPC
	0b4CXL9xG9DdwrE9owRq1qeNYpj6TFCGrPMZvvZuhY/DVz4ReHShdnSllqodlr2YpKIlsQBrQvI0V
	iorL7Y70hfEeCKPN3URQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDG6l-0000000D8zk-1FVJ;
	Mon, 27 Oct 2025 05:49:31 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDG6i-0000000D8y5-2X3m
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 05:49:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761544101;
	bh=WfFn7N0mc1wHwAiznNZBnReSRfRT2Yj3MVPqoP4mDEU=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=nj5gHCY6YmLTFGYl9EQghxyTXLW1LpVFwbOlEBsYrBO9hjVtSekc82eRnsLcUcYK0
	 NPYa2wtCyZWjiD6vPuEOhdW9KYvjf+hwzf5aJvivcgjbgdiFAAfYPt/SUE9Sw3hQ//
	 Xjc92WS3oAzzzwG1qdUgROnFAFSSQSNHmMBkY/Bg=
X-QQ-mid: esmtpsz19t1761544091tcb13cbc9
X-QQ-Originating-IP: E90Q48vY5pZc+ZER2E/GzZ66qCzJUQPL0AnAd+/lUTM=
Received: from = ( [183.48.247.177])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 13:48:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13782442783455841640
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v2 0/4] fix the SpacemiT P1 Kconfig and resend the K1 I2C
 ILCR patch.
Date: Mon, 27 Oct 2025 13:48:04 +0800
Message-Id: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJQH/2gC/13MQQ6CMBCF4auQWTukU8WgK+9hWEA7wERpSYsEQ
 7i7lcSNy/8l71shchCOcM1WCDxLFO9S6EMGpq9dxyg2NWilC1KacCR8GO9a6bCVBc9WN8XFqmN
 TtpBOY+A07+C9St1LnHx47/5M3/VH6X9qJiQ0dNK2IKZGlbenuNeSx7E2PMiUGz9AtW3bB4We5
 YO1AAAA
X-Change-ID: 20251021-p1-kconfig-fix-6d2b59d03b8f
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761544088; l=1382;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=96aC389yABIKi820ambhl0cjJ7tBBL4EZCK0/odqlGk=;
 b=97JBHNALbGENyElZmpwiUy7eXNO28dNsBJA/+Ag4XaDhraAr701WQkmJKN7Vllq7Csxl/CdT9
 NjjCaUwfPUtDen7qvUf1el9pqUmYK0i3xVkY9dndhMapSAoKv97Y1Zq
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NH+njjzUOij/ZIe26MRjOqDHhwRGRs5beEL7fs8Mpqwe88D5etDoDb4Q
	GGTeyzIZPV02d7wrEGRPDafKYL95xhER6EE1lu5XMdR/ympZPol9vBBu+nS56a+fbRssU/r
	oRR3hYuhH1nQBBpg+1CEMXzriAgVL3Cm0N6qhQbBPe8KFdseyqJCK8E2LZJLic5CtZhGZid
	r1H/bXcCQLOTYrEN+vp3aMkftLGhrvMJHKms6t3jF+vhXxdYEkdaKrTJPyc7223bU/JJv0R
	XMVUk5bcCtVVOpmt1gSJAvcaDbgc/haR6jk22yoJzPOoFXVYCLOm8Gc2/Nula0ev1xqkdb1
	aMIEqdII+nOju1sNLxY87OgdDlHGMB2WjU/3h2nY/SvWyIn8jc8VL+WEWnoNsP8to7yezOb
	TdkQzcWo01flJybgIiHTsKSVEuCaT8KmfdvjqnJdg4Mu5PabyPozXqZj165k+BZDHGNdPkN
	9OUV3SzRz079f/vXrD5NKdjL35ku1xqBg2Pa1yqgHDppvZE0aEaJU2kCxIH9ehipoMUshjX
	wf5R4lEM6gOHAOGv0dwAeR2VvRvBgt8Hn1SHnRwht8cBLoQ2VBgnkNYlqN5jfZFhu3tNN45
	XuzT/4a8VarpvWGvrZCAgBIXB84GaXhDIntKe12tvQDdYp3dXKEweTZz2ZyLyesyrSSsPdV
	1oSvmbKfNABXuG99YhD19MIbsb0uOyB7OpSTlcNOF8tM99N55pGoNKdzVS3N+DGWUMfByue
	48fHfdXgK5bWV89FnLLPW4lLWskZ+vF2VEJjkV3k/BGuNHmIulw4G6XsfMVtZJnI+QypLGe
	RvhPioX9itTrYG1T7ZnzlbLV7vlPqV08tpCL1xtl1iSL/x8wBlqeHbYAGy+gnIJRv8YphgX
	R+MOX3ijvKDORaOFNuzcOxrnTjH7bRLaSBE47Yv71Dt+/4nZMsUXbNI5D7PHd8Kz0LrARrE
	I4C34QMLUh40R+Xz3lX6qhSj037UdoP4mzMQ3VEQe3fzSViLNBrrQ4/4zcdY2mXtSDGU+MG
	718jxQf62AKvOgnEt2zP0cRpu0h2yrM6apUJkTnNXQR2nim7uFhzM8kNKVW2WL8qrnm7MgR
	uLJ9B3bkc21mc9vOI4QsJfDzAAx3X8qz8pCR22rMr/YtETBpjmzAJbEtZizZeF/6NKkMZ75
	u4/jP4JiUhSphZT3qwI439r56g==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_224929_099438_17ABA4E2 
X-CRM114-Status: UNSURE (   7.39  )
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

Since P1 Kconfig directly selects K1_I2C, after the I2C ILCR patch was
merged, the driver would fail [1] when COMMON_CLK was not selected.

This series fixes the P1 Kconfig and resends the I2C ILCR patch(This
patch has reverted by maintainer [2]). In addition, the Kconfig for
P1's two subdevices, regulator and RTC, has been updated to use
'depends on MFD_SPACEMIT_P1' instead of 'select'.

Link: https://lore.kernel.org/oe-kbuild-all/202510202150.2qXd8e7Y-lkp@intel.com/ [1]
Link: https://lore.kernel.org/all/sdhkjmi5l2m4ua4zqkwkecbihul5bc2dbmitudwfd57y66mdht@6ipjfyz7dtmx/ [2]

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (4):
      mfd: simple-mfd-i2c: remove select I2C_K1
      i2c: spacemit: configure ILCR for accurate SCL frequency
      rtc: spacemit: MFD_SPACEMIT_P1 as dependencies
      regulator: spacemit: MFD_SPACEMIT_P1 as dependencies

 drivers/i2c/busses/Kconfig  |   2 +-
 drivers/i2c/busses/i2c-k1.c | 159 ++++++++++++++++++++++++++++++++++++++++----
 drivers/mfd/Kconfig         |   1 -
 drivers/regulator/Kconfig   |   3 +-
 drivers/rtc/Kconfig         |   2 +-
 5 files changed, 148 insertions(+), 19 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251021-p1-kconfig-fix-6d2b59d03b8f

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
