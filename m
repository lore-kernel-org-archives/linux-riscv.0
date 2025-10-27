Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D63CCD1A5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 05:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GTVrCWNQhmgSj+AR1lc+rjvUBx5PnoLCUt+/BwPo9I=; b=DyeguhGdtkPRTk
	o7Lv51FD1/l2+vxGZ8Glx1z/r4sRwYgNKmDD3+AP2R7Lytrw3S183Pa9jTmyH2050dKVj026Zzt9K
	0/BBumZuLcr5C6mYWDo4LK2zVpHMgeh2WCmL49JI35lKZEr6aKpIxy5//BI8ClT9a0B6+u5qHcPFh
	FXrJGSyxCHT7H2Uj86mf11WEXvFS7oYaQRK7vXGEYy8+BdFMFXtz04IPhTIEnFeo0RoZ2pQU05PwZ
	Pp8hD86mMOZWnYwG73DH/TRnV6f+tEGetHHZp9PVe1q9XqZ3ggf3qTfTWOCdX9KaER0o6RkYfCMOy
	DM+FdzXYTmHweZyjnPyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDG6s-0000000D91I-3nrt;
	Mon, 27 Oct 2025 05:49:38 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDG6p-0000000D8yE-2HWM
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 05:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761544104;
	bh=VUROzD2Px2X01kMjDouTVlJB/FxOGL4kiYbsA/z/bxo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=UkXBKQqPb+sRn2eOlZ/SaX6PLSCmarWbCuIHFBNaPK00drkVp7i55hxqcxRJTqfj2
	 hBMGOXKSVYGyc35esXKH4FJ5z6BhWo9OKaNhu05XQxCw+3EZ48M/YpRpxd2rxyUUO8
	 vfJ9IgZO7I0jItBV/lQTRw033ebOjA+hMfU65n0U=
X-QQ-mid: zesmtpsz7t1761544095t7e2c79e6
X-QQ-Originating-IP: 2YYRSz8nfBT+0rkbxFwdGXPE9OU+8C/eh6y1Zk5miKU=
Received: from = ( [183.48.247.177])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 13:48:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11408485327618603896
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 27 Oct 2025 13:48:05 +0800
Subject: [PATCH v2 1/4] mfd: simple-mfd-i2c: remove select I2C_K1
MIME-Version: 1.0
Message-Id: <20251027-p1-kconfig-fix-v2-1-49688f30bae8@linux.spacemit.com>
References: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
In-Reply-To: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761544088; l=1235;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=haUTX3DAFG/sDExwxhYrFG+MpFnxNHgK9T898K4DEpw=;
 b=axT647NiGxsuB2r629BN37g+E++QCuCRTuuShun9jkeP1mUdrBRCaBuTuSlqcsYYlzjRaqazp
 X2VApOdw7riBC6daxcAt+BqIAk9j2LxxfeYInibW477iQkz438YsLYB
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OaUS/vBL36PcrxsqVFuqWfeo5c/moXnAmpVNEYaVqMP+nATRSDK9C1eF
	t9mgzIPgoYSsudFivUk9JYdINuFVlNWwdoE5zivFlgr7ckbc3IhrIJJ0R7yb/T7XfQyvx2O
	W4TdMLrhmFP56uKifi38U2JSA9fn4Qd31we1qRuHMy7i6QjmV5okwDI0DBRARRn4i0O4SOz
	IGgDpVUVZacRHcC1SGaDL3XuaRBwY0ELshiLMsP6wuUvCsISMZmXafsdkrqluqW4FF4nhOw
	BwbZqxEywhriVjeEXlllDblKbcK241fH/CR8yiE9m/V4XgK+dysyBK9dY+zuZivSGCnl8CG
	oKk7Egde8Bijy08zABdV56hY5VG4T3yyd8yojbFnsbQ+vgsIKSjRP3VDpS2yx4c2m1vogfH
	dgEXoTtWamBLkApo28f88iQGTjaWkAns8Wpm4wqEHDCUVBs1//WN8qsCDa9usuzniIpG6ee
	n6Q9JpaBi061OsJ4SVTifGLy572JS76egp35drCe/8a6TszW0eWIYQv4IfMSlln/502gdjf
	1Phfjprb4H2f8Eaaawpu5gDv9VhGxr/3smxYwuNTZlfZsw9PNkWO66KLHjEWh8x9lsfDK9l
	nvtm3xB5clHJwg+NuSLzI3pOS8nSnrxA9CxS6bnLI4l1X/j0jdcoy3z1r8UXbX1N1YaOsDP
	0VBoqw/zMsidralEQkBH6nClpz/DY9RZemKn0fBEjmmfKwGSdIz+gkcPs8HJLXi1NmluvOK
	TIl0isT/CK3XnxTWOH5cE79df8Yzqo/7KSLvQjHGMqqzltJsoVh3M8Qzbiz5lvlXRZgGc+Y
	IvRwU3KZyMuzkBfu9noKXvYwIZfmFVGLbtGJroU8FjGhb9hEljmhnFBekykk5QfO0e2mr83
	DOd2UD/EZmo1bR0P7taBEeGMrnU9YKf9JjYQKjPf+P6LtHNtScQdEuaf5+KHWQwfOGA4PaK
	nUw20FSo76inMixt0V/O+jHZIyjUxGrDssot9htLNkL6N7n9viza4KJE4hUqWZBhmlnFHoD
	PuhA4uT17RYxbZGavZJ6Yo7cpq4ki+KPgFZ0Of/cSxHTT+ar22mSc0gacvKXrXoYFIy7Xga
	yMJciNPuN1Ea+v3ag+PTHIEEnjnufRPYiVymTETermgc2S1W4XOwuAQLFe/ktJ7Dez7jcQC
	CrEi
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_224936_466184_22877F84 
X-CRM114-Status: UNSURE (   8.96  )
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

select will force a symbol to a specific value without considering
its dependencies. As a result, the i2c-k1 driver will fail to build
when OF or COMMON_CLK are disabled.

The reason for removing I2C_K1 instead of adding a depends on condition
is to keep the possibility for other SoCs to use this PMIC.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510211523.sSEVqPUQ-lkp@intel.com/
Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changelog in v2:
- nothing
Link to v1: https://lore.kernel.org/all/20251022-p1-kconfig-fix-v1-1-c142d51e1b08@linux.spacemit.com/
---
 drivers/mfd/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6cec1858947bf7ab5ee78beb730c95dabcb43a98..ea367c7e97f116d7585411fff5ba6bcd36882524 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1258,7 +1258,6 @@ config MFD_SPACEMIT_P1
 	tristate "SpacemiT P1 PMIC"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
 	depends on I2C
-	select I2C_K1
 	select MFD_SIMPLE_MFD_I2C
 	help
 	  This option supports the I2C-based SpacemiT P1 PMIC, which

-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
