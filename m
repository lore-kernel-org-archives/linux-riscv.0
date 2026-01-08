Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C71D148BE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 07:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9+93L4C92NUrIvnmKrbptQpFGsGmOU4t5LpVxMMgNdc=; b=X8w60mhmdpOm2g
	joGLh15F4hxbsFUoZsPQKPPrsJfJMvLehgzUQFck7BrXZzl21Yay9cby2qrE7WmMg0LtpD1KyUHA7
	aP1kYiJuZ+P0+I0/LPikx6fjAXE1j1mhBEPz4FZcQnouly2OLfjTV9ntTKdIh9QmtpNkgl7tYqpWc
	0jeZHaE/yMM9Zgx6aUnEkc8A9Qtig2ptGSV5HYyKmnPRuSt0iy994UE80LOERnmIut3Z0chG52FC6
	mGcyYaoZHUAxlNB3VUO0BBbRGBNcwXSsUdWTbcBR/0de2nCXaTFfhuBnfw3XP+gOz1CkZcqkJ/tck
	LCyAnqJxN9pjkxGfbSwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkpR-0000000G9P8-2rVL;
	Thu, 08 Jan 2026 07:53:09 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkpP-0000000G9M2-19Kw
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 07:53:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767858743;
	bh=dSgTeSeO39henS7z9zA+8wqyqWr9MsRhjybXmwMrFLg=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=ubi5/jstXkOP0QNiT7Sv4NvRiNmefd67yQ8CX+9Yt6A9zgIfN9D3EZc+iuMix0kFQ
	 m++rsjNDomgLrqhS4L1Zv+jwyWjV/a450aWU0eq10QfL2fv7H7X1jPyLGUNxJjnbSR
	 Tgz2zQvcPyUynecgVaYzGj7IboF9w2DJR+W5ZQyo=
X-QQ-mid: zesmtpsz6t1767858734t11a7d292
X-QQ-Originating-IP: H36tlciJAHojKYwWDqPDN5sGrJxjmKZKGVMCoDe+Pzs=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 15:52:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14826193270515343133
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v6 0/2] i2c: spacemit: introduce pio for k1
Date: Thu, 08 Jan 2026 15:52:10 +0800
Message-Id: <20260108-k1-i2c-atomic-v6-0-41b132b70f68@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACpiX2kC/3XPTU7DMBCG4atUXuNqPP6JzYp7IBbu2KEjSFLFI
 SqqcnfcClEUyPL9pHmkuYiSR85FPO4uYswzFx76Gu5hJ+gY+9csOdUWCGjBKyPflGQkGaehY5K
 tigEoaaOdEfXmNOaWzzfv+aX2kcs0jJ83flbX9VvCZiXNSoLMNhxyBEzOw9M79x/nfTlFyh1Pe
 xo6cSVnvDMB7ZrByhiXSGmtFKW4yejfTFgzWirZNtk5qJI/uE3G/DAK4A9jKhN90K7xDaDfZuy
 dQXRrxtanADU1wZO1qP9llmX5Ag2ZwWzPAQAA
X-Change-ID: 20250814-k1-i2c-atomic-f1a90cd34364
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767858732; l=607;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=os9j22xJFP9qjppUkhykfcLZmmFjfsSd3/7uBNcOhII=;
 b=Belefl3BhVf82d1SVzx5wRhmtuMs1/Cm1W26ufr7HUd/UeVn9v4d6YeDCqwK/niGHggybk//q
 W76mKGaa1W4CVcJsMqUbvujoG+XNDuCRe+LH+nlOMPMfL0D1nKCBt2d
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M4PK2jc64AMYUu0qcNIr9Al8svmGy3ObXpI17ZOJcqNSoHVAhFjKRRFg
	prri++cn4bNxiUd2vQoE2uIC6J8/dsuq+SJMuzOLKiOY8Tl1vSwtPFbN/ADK52tbi4ySVuy
	iqylR9oeUcCc8goVGTVlKXfBV0NafroGwGDFBnMGcQeXdTG9/d6xhFojYxol2K+6Nwndgsd
	ECXzqhVoMO3kDdkB6/SkmX9m6L9nk8b7HROyFjlC4FpOFXEONOJTJwSTcaBKWhHFkSCJlkL
	OurnzOt6d7Me1wtS9ijPPUj20V/lLHHOcgYIzys6c5mS50U2702N3zX27Rsl1GMjXNuqEED
	sav1wg/mBfV2bxL7CWPoLWS5KJT/jvR8jj1JBEAGfjZZU+BHJz1UXfUCDjjwb1ZkrewHKPC
	BEsJoXUvIusEYHCxxhJkg29hJ2x4NVEb618hFAd09+/TW1QOOSD+PSJF3tzk/Fb9KaBS+jN
	dpvr1KdNKQ3hwm0HsJXl2YO9W1zAF901bjdK/QMUWIN1slHIWnRl3pd8YsGJWnYn5lZVLRq
	va+X1QAUFgOXressoBvgT+TU5Rrmx24NSHc9BnyCDjq63sSTyRD7xKNghTDrtXnBTIMSOC4
	n3DLnbfGClXpROMmf8cEo8sW64WUspS1kT3cuz3Nd5z0/gseMCV0SEhOlzntQTM9MLSVVU2
	uCd83selfYn7cf0vLO1r7Ruu6pa3MkTmWG1ss/YH1aZzmiiv4cBJowb8Fb8mLF+uNZJsSyO
	6tAvDW3sevCQ/FdHyEwUw4Kft/pU0/L/Z8bq5+Xy6mKtxtCEDScR5UrgrZzIZ+fvqccZZ1R
	9B6zp2ds6PWyOsX7SiQFjIOVyTm1f8PVkJl+Wae0qRDTtY8xfZtI5ol3ILeQI1sRaa6LIbw
	0spjYJM/6ZFTbDEg+attC6HHncl8mGk79L8g3o4Bj+We1oMzT3sSwOMPG3ujAL8UtYlqRNy
	afcGQRJz1WtmRX9IduDVv5QsaoSKVCoK+hYQZPT64K1jr5JWgiEwK9IoGKi+ck3HrnGmceD
	avdvJdZAYJQhAWgI/fwz1qKM+wkLkmy/Is6wnGQhpiw1UHjR8o5VO3rlwLo17eGerStdDcm
	3XsUDS8j14teb4Mjn7aIPN/hA3YyNyj6VXfeou/1olW
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_235307_603838_03C1BEC5 
X-CRM114-Status: UNSURE (   3.57  )
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

This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
enabling the use of I2C in atomic context.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (2):
      i2c: spacemit: move i2c_xfer_msg()
      i2c: spacemit: introduce pio for k1

 drivers/i2c/busses/i2c-k1.c | 314 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 237 insertions(+), 77 deletions(-)
---
base-commit: 003e84792ce811256114dee4f4ecc1cafdab2b0d
change-id: 20250814-k1-i2c-atomic-f1a90cd34364

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
