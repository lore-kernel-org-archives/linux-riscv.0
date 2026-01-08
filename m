Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1747ACF6A88
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 08:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k0TotIPTq6xTfMgrxHWO6+QTbTDzI8BUN765Apac61Y=; b=rMW249k9+hmbVp
	aAkdPmyVVuSR/fZhq9bH2aGsv3grQ+csdAdjmy3TacDKA1iy48yqFMSKE4kkLwIgxbmVkWgqOLQ01
	zeLu+zaynaVDfTTfOrot3x0llMYP5YdoPI3lLOZEN4j+K3rKHXONwNp2pLBv5yLw7jz8ruPN9PDJ4
	I0X0yU77MsPP9GE2F1ifNwGiSJZQIUxvw8U9nDfCW5zGkmnyDwSARd4LVdJV4goR1shSFk+frH3dP
	LUO75P81e4He0cXGIYYRBvwgAm/BOUuUEx1Yj+TCjFdu/GheWUNvBZKgb5TwmtW05Nw5wTJ3jB0DH
	t8CobQvNLUVf3je7y0OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlZ3-0000000GJnb-2qOg;
	Thu, 08 Jan 2026 08:40:17 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlZ0-0000000GJhL-2RxY
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 08:40:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767861557;
	bh=Uvn8s4PS4Zfv1GYnrb8c0wteskQ9xtzXuxq/XnZHJDs=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=u7XY7NsziktGSs+QrfqnYMHIfSN33bMcm6EdemJ3vgIfwQ6JdwGboidbs59XaglTP
	 GyA6PkTCCefRs38HBOiJo/eOTJDUsumdxDhCZHbv7xif9wP6bms0eXqSH+mTxnfeVw
	 Hw+vaDcg5HjC/DbrGw91yS6fkXtm5k5tAz00Bj6E=
X-QQ-mid: zesmtpsz7t1767861549t562ab659
X-QQ-Originating-IP: JrlKtLWhKvgKg+YK19bVS6mC/dYvL2/Cm3SMf/hzeYM=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 16:39:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 140231474234214423
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 08 Jan 2026 16:38:56 +0800
Subject: [PATCH v5 3/3] rtc: spacemit: default module when MFD_SPACEMIT_P1
 is enabled
MIME-Version: 1.0
Message-Id: <20260108-p1-kconfig-fix-v5-3-6fe19f460269@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767861535; l=1183;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=SwCXuUmIT3DgySnnl02i2vZ2GAlXrZQWhCxKhnIHQzw=;
 b=YbZjoRK8NM8bVAyK8aIfaNYf9Vb/qa18H4zel5cD4wDS/4ONVTeXqbqNnCVdbN9McAEmfTJXS
 RjNR5dbb9CEDjXIJlTwDpw4JaRMChxvTDGYTrtZsJsbKtsaCH6bU06L
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MoMFunSSeOstWh0xyQH01muvJGHe6YGNDtQUWMxuQqagQUfBQYVVbJRG
	WDIjKYn12MdPEOoJb2xJmvEyz7KDcIQCeiMNT5qg2bt2JadZZ93ldxxSjViVWp70MYWjZUI
	nLO5dGZBSUq4qn+RpHXHF86vAEKW9nO8Su8mqwwufDfQrONhXJRxBuy1kLN3yBB8YpbXbib
	coDY6gnaMAB4kHQZOmcR8IQsANsEzGmgTt7UZ9CUZxsN+uPfRm53XSZwLaYSkiu6BQTv9QZ
	wOOI0bln/QFHYWm2AfrWGeI+Ym+6BY3WpKNM5fbjA+CNN74uw1SSy3ntSHh6YzXMVsy4EYA
	4yZQsYVDOG2gKpxGPfTvm8qrEaRiq4GBAdlKaMaMOAtRWBn9opFBstumsAYTa9JPYnyhOyy
	enJA77KsJPYfLPKwCZg2qPlqCpFzEcV0aZbYm1zO4d5zcay0nY2vF+r3800l9Rer0fjEQMw
	O3WL7gXCDZJuoutJPfwtftQHRCpP/jVYKCBClz/dQWy6GasgC6R8RX8hbEqC55ZyDVRVYM7
	tY1340N8Li+FWBJUxh+haW4Kza9kAjSe+NSSSFperJIFejskFNJxQ9iZ5TkWz69JHSnK/h2
	3KRa6/0RUtFFjeGBNaB5cCAWBQOKslne00o9WziA4EhNTlyb4FEx0hspIUCfm395GCNB2dY
	noj66x1uFwyHqo8Nzgf9j/OXHdTATkkCGGjIgNci3E3qWxhtCvWSuqLs+sf2CuJg+C7K1zg
	I1M1FY5jD1GhpB0EKZBDUqnRe37dgVGfnvd9h7eQcmpzJ+O6ZNjrHiowJiSIiWwNedGp3t2
	qv23d1Vvcf7+lseUcxje7sQnatPTQwq4qdqKdfoX8DBHFMYjZxTiei7MG2uHFW2t9up9vxf
	CSSeaqEe1V6bt7j150hEhUVgaK2y7p0SezS116xD6SN0yaMVZ5VYVYKh2pZ/saFnKDEiMDg
	hdPOl8LWosBTs7z422lvWliv/KEhp/Gb/v+KFpNH5mwCcuiwF16Pa/VRDtV3KSBJhdn3cwo
	jOSwg1rSuapZ6jMqGD2XB5MsGc010SU7ySY19TLYD8Ow04e0a2uGzk2gBx2tPgySs5vMlny
	0YR7QAZ3R7KfcuD/r4iJeMl6YzXGH5AHW/vkxYO5XTA
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_004015_100574_7BEF6EEC 
X-CRM114-Status: GOOD (  11.92  )
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

The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
caused it to be built-in automatically whenever the PMIC support was
set to y.

This is not always desirable, as the RTC function is not required on
all platforms using the SpacemiT P1 PMIC.

Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Change log in v5:
- add Alex's tag
- Link to v4: https://lore.kernel.org/all/20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com/
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 50dc779f7f983074df7882200c90f0df21d142f2..53866493e9bbaf35ff0de85cbfe43e8343eadc1e 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -410,7 +410,7 @@ config RTC_DRV_SPACEMIT_P1
 	tristate "SpacemiT P1 RTC"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
 	depends on MFD_SPACEMIT_P1
-	default MFD_SPACEMIT_P1
+	default m if MFD_SPACEMIT_P1
 	help
 	  Enable support for the RTC function in the SpacemiT P1 PMIC.
 	  This driver can also be built as a module, which will be called

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
