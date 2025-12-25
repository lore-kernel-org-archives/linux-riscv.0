Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC4FE784A6
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Dec 2025 07:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AB4nlNNjyNCqZcll/w3cSFDNpOc7XJQv4aYFKoa0KR8=; b=KnzZf64fYXWqGq
	/6gebUgPbRk3uH/2vl8VQ+lNXkGiBw8mEkFXA41iIgxUKgFFoSnSsIPJev2p7kD8fUTWQqMz6cMf5
	5o5JsEPcFpd8xVFYe9nXT/XmlZhQ4G5vRaW3F6IMGMKCEOTCone1M9neouGhXUQw4S74hFT9aSpr7
	vUdkiyOZ2Ws/LPd0AGDD/pGMDMo7UfABR6ipfIv9KKDbVP+s21BWqvWhPbSy8VGqXlQO+xtsB7qPK
	iI7iWmPkun2ZjT1kaf2Xk2Lt2XFKCbVtW2OvRL7IfLkKOgJe7uXJLm5wh6iypGAD8P+7p8NcWU94O
	ZeXtp0jaeACy2U76Smng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYg6U-00000000Bzr-1vKs;
	Thu, 25 Dec 2025 07:49:46 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYg6O-00000000Bxn-2zyE
	for linux-riscv@lists.infradead.org;
	Thu, 25 Dec 2025 07:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766648917;
	bh=oXpcYu7/BiXLtInxfeyZ/crAJL6uNMHTLPJTzMs80uI=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=JT7HW3ZtSQvkS9qjkuiT2iGS+Ske+BhVd30tqt9544ZR1AjQCI/qyo8v+V+XhCT7v
	 V3Px+qH18IXgQbKcv+QqQfZezfG0ZpGWmOE2sp0ffpMhchTwuE3ffmHHgTJmJRBIbc
	 TzdTkPQFVh0Uz6X0rk4/xZwm0Dmh/z8RcCS7lafs=
X-QQ-mid: zesmtpsz8t1766648909td176ce42
X-QQ-Originating-IP: QroFkQHEo23eylXHlQX/mxkpfFw7ESnMfV2JhlLx0dY=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Dec 2025 15:48:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13698806636319235656
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v4 0/3] spacemit: fix P1 sub-device Kconfig defaults and
 dependencies
Date: Thu, 25 Dec 2025 15:46:30 +0800
Message-Id: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANbrTGkC/3XMSw6CMBSF4a2Qjr2mt6VaHLkP44A+kBsVCEWCI
 ezdQmI0Pob/Sc43suBb8oHtkpG1vqdAdRUjXSXMlnl18kAuNhNcKOQCoUE427oq6AQFDbBxwqj
 McWl0weKpaX2cF/BwjF1S6Or2vvg9zuuTEp9Uj4BgMRVOoUfD9f5C1W1Yhya3/krd2tZXNpu9e
 He2X44ADmm20bqQ3OT+vyNfDqL+cmR0tJaZVblVzsifzjRND/nW6xZFAQAA
X-Change-ID: 20251021-p1-kconfig-fix-6d2b59d03b8f
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766648906; l=720;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=IiRNSVJmhy8MrOZ1LUM3AjhCQcMWkKuilr5Lzf2ajGs=;
 b=RwCobX1DexAcrhwW5nRpQnaIlrwLh5GQ4Cify866vKLrtNeOnI23S6PNT6jW8HjcQ1H+HEgH2
 Orta6juCA1zCAYyKskHsWjCIOSHOeM67uZruPWvld09T79VgH0/HTxp
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NzOHSugmTg7Xb23x27/8qEjVd6K2ihSavA6Ea/iJfz4HWWSev+bMNU+k
	dv1mqPYUaoTCWOE1NfRcpfpAucPCMr0pncFI8PBkHakNloEgMabP5Durm5i7LLaMXi6nC5O
	wpWr1/plVcAzuJVd5+PDRZth6oNyGYgOXbmUnlO69ZCcbwCoGTkAbNTapB8iIw7gi788/Ch
	wlvMwZZ/yMBI4V7r+EcPsXx1IYgu/Vsi7h4zc2Zl0ugU3JxVUmXe3WtDMRYqm2Y7S4uTxo4
	eLAXkX3uQyTSuxw4TS1VFA8vlPs4uwfSXHuPyYOkWR4v1Ps6JY0q8JLSmh/yuJhECOjk5qh
	YLVzh3/6P1RYb5xJVKrx9jxwxbznH/1OoL7gAv8Hy/ZH208V3FhX96LO1/tAzMfF83bwEZm
	8ii68T2yRh2W5j5CrT2bioAt9M3D4b8L0x0BuPODTplsBXHpwzu0qehiUOnuifDxSGlJIWy
	E8ZY24oQ0EC7xubRHW8leDfpSNJSigmRAJGI+7tYCKVGipqSIADIjFohfs1/4HM4BD7tR3b
	9xJQO1M9HzWaJBIENW/mbWGiNP8Rc7bihi1CTgM5y07D5JCYEMftm2XHx+yU8MPq2JB4YO3
	56QvHX2ZrcHc/aFYTYZFzM4bFyCNtv7ch043+2yCN1DzH+eXIoyrxU2azrsQtdt8oHc9ejm
	aRhLCYnu2LjxOK5kZ0GSUNpGnJ9C/he9aI7S8aEsjQfCID+w7pLhkb4k50cht7KOncjxBW2
	s9wkSgQffXm4XX7pZeJFVDFj68QqUJ/aHYUEYfkJiTf/TZzj7oRfnSMnzDwVDGax6sg6+RK
	bvU26Po6T78GonKQH30aVq7KQ8ULlWsQWqQ+anNUXx0NB8EQwcdfXwK/HBwqHl1ukqwiMkg
	Er76IvpXhv77z3Yjs8wsA90R4i+jTvUbiaq8mQfGbkaX+3l96S0m8Mqr+d+jW/2EhUaukL1
	r+y/Jks1HjP491jzebJt52EUquNgZOYldCESC5gEYozqBp8ybaXQfTNrIimz7hDu1vJz0m0
	1C7iG77j3pnJAn1G2z8DrKQr+Ggv/1XAsVNHlR3IOvheuH2VqtyaD6DxIy2xd0RKpkwD7zQ
	gL2MlszU1dp
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_234941_130354_CE865233 
X-CRM114-Status: UNSURE (   6.02  )
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

This series fixes Kconfig default value and dependency handling for
the SpacemiT P1 PMIC and its sub-devices.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (3):
      regulator: spacemit: MFD_SPACEMIT_P1 as dependencies
      mfd: simple-mfd-i2c: add default value
      rtc: spacemit: default module when MFD_SPACEMIT_P1 is enabled

 drivers/mfd/Kconfig       | 1 +
 drivers/regulator/Kconfig | 5 ++---
 drivers/rtc/Kconfig       | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: b87881a3c93345252ce8559ad763369febfdb75d
change-id: 20251021-p1-kconfig-fix-6d2b59d03b8f

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
