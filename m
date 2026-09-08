Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831EAC79FA1
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 09:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dJhFPQZT/IvrLhnE1T9N8nWu1LgUK8G1ktwvaPMe3fU=; b=dwosOr6hSNxCEs
	Oa/UgD8iTnk+Z0zWFbeBQ2myi+LAyFaccKUgAcTU/Gs0pk4p+MdFUb6n7jiQQJbE9cGnE2jWszUnG
	8/fonZ7q3OQMFOvc0P/lismCAZ0C5Woh75FNhfzXOHK4D8ouzjFugQXRgHusrjwrzeVzePRoVJND/
	OD1SrRqUpR0W86FBP/veGpE4+K9Y6MARUvUeEc79hmdegzQTWKzF8tfEPwizo1aahxpFCu54BzWOj
	/cM10ZdP2jgHtkFRZRCwvBKwOkdqHjIqz3tsEpMC4JWXzcukiWgd06wbuA0/WIOczXXnW/zenvhH6
	agMq4X7mnbKcVBwyRe3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sSP-00000008fJX-2wSA;
	Tue, 08 Sep 2026 09:49:37 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sSM-00000008f9r-3XmQ
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 09:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788860959;
	bh=/BNkqzuX02cWhuJG/NBOMRq7lwA2Ms/b7iNVif1Gnmo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=l1WmM1QhbUQPoExrFh+LPTyQ6+FqfAJzCCp0W6wuB2V5zQq0GhbSS9ALOSZapO6kV
	 vogsuhvX5XWx+yK3PoG/4du/SYoq47giWSzLSpDPgv6tUcAhk4mjTCY4AvwCAqW6Me
	 KNba7+q3/EV0/katbA1wznuyLaDG/7zJtqVkcdSc=
X-QQ-mid: zesmtpgz5t1788860952t5e5148b1
X-QQ-Originating-IP: h5Cgcf4ei3ZQWW1PdQL0N7LIMCWcdJmyqjcubY9j15w=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Sep 2026 17:49:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5232426988612340040
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 08 Sep 2026 17:48:46 +0800
Subject: [PATCH v2 9/9] riscv: defconfig: enable ChipIdea USB controller
 support
MIME-Version: 1.0
Message-Id: <20260908-b4-spacemit-k1-usb2-v2-9-f07342ffa051@linux.spacemit.com>
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860920; l=1038;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=GPWLpmaRDDt3mVA1ZEPJfXPaZTyfIi/TrBRNSZQi7lI=;
 b=QvtTY1HFJEMOR3xKMv3s1ibDIr5WwrGhp4cEq6CTCDYtcWhgtdtS/CJMJFI94FKM0vO0wkiQl
 akqU92hso/UDeObGvDnOaSXh76YtAxuBTW8AOLsiFPWDjChYW15BRTA
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NlN1EawlHQc+vk22C5Lc1bVvq4nBAf/4YUpljqWd1ZUmNXaDJ65kWERF
	EX2P/fRn6hHTouxIn6DHb9NGIg0J8MeRqYTifeJe0FZR+Nm5nQUZcgZImlC7zvDzQpHbnEe
	WZWWcjNCgnURuOuBOhn4I6k2uVg67Y2ppeeU9KZ11bIx2I8/I8pUi+xOnqkmNQZ8qIEcsWc
	kODljubl6Bbbf4XsxfSiu2sNkxwG0qz9L4RFKRm8sfiLaQtD+qfb5BncyoXwsZnEFnpDLXj
	xq6WrvI2C2ByvFcysEQC6tuc3s1K9/s4EWUAV8SBg7ncT0xvjplcvBtJvVIHDKo9Vw+QkcL
	ap+/9j1UiICfs/TucX3ELAgJBKtrsgzczzQ6uva8O+ZeLd9xImXwP8V7qS47WuEtq3h64F1
	qzrKeOIG/tjZkEVsaaPi3XpilcrlbYTLQNz6qq0mQIsrPZ19bwOyGL4p6qUymfcasXybO2e
	TSYpMUAUYxJ4ojUHyQ4503crnTQekf0D8HnMO8XioJ2WISDfqk/pHpUu/KHOKZW1nF5HOpT
	RIJY3Jah02/6vQaGcsPPNDNyXgGqmj9TgOhG1blEVQvDv7oUTUKyptp1yrBce9V3Kp/DpOS
	fwodueF14TqjAhAnmK3MEAEIkR0g51oyeWqIXUuxsnfp8PrImFJk0Ar6Oh8ssaGHt7LEIia
	ow0MzsndmO2IFRvYYIM9VENxjwqWzuiZfRTkCUdR/18p/hNWVImnRf1L0YgUfeNLdrduTE9
	5xljpgq+IiWWJauV32yEO9b+c/7RAj21775CYUMYdGY06DjUCKFE8krX1i45tR1g4y3mmJ7
	Sh2EZRjz0CSc8PyyCNhUDpdZzeZk8JMDR1RsDEwig1nvVlZ37Q9nYvENY0LRngYES0vWRG7
	P6xHiP/5m7x7JSQG0eKz95sRrSYDLUYZXlCA2k1AHdWsKx27ilQhBii2WtiCcKlai1Dqsgf
	RRes2M2DHTarPq/VvBrcHcEUozveehU3SpJ6AvyKZdpmhY8mQQuO9JhSWUq/+zYYsmB/VCl
	3lDzsa8P/7KxzWEuRVIYmiuZLfO5hbuBzhn6/mcIf36LfcUFGwt5mhxAT3HEJIIN1pnu+Gv
	F60OXqWbT3ijNb5XXoJhGj6xOLc/t/26C/WTtWGczVQK7FCtaKT3mSi6edYhdeUlazDw8xb
	Z5EiD2IZqDFjgqxqzfErkKbhNfVeKEdov6ap2wv4Of/EJ2xOQPUHoZc9QQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_024935_516611_1AB411C3 
X-CRM114-Status: UNSURE (   7.80  )
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

Enable the ChipIdea USB2 controller and SpacemiT K1 USB2 PHY to support
USB2.0 controllers on the SpacemiT K1 SoC.

Tested-by: Ze Huang <huang.ze@linux.dev>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 arch/riscv/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511..5b556488de66 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -222,6 +222,9 @@ CONFIG_USB_CDNS3_HOST=y
 CONFIG_USB_CDNS3_STARFIVE=m
 CONFIG_USB_MUSB_HDRC=m
 CONFIG_USB_MUSB_SUNXI=m
+CONFIG_USB_CHIPIDEA=y
+CONFIG_USB_CHIPIDEA_UDC=y
+CONFIG_USB_CHIPIDEA_HOST=y
 CONFIG_NOP_USB_XCEIV=m
 CONFIG_USB_GADGET=y
 CONFIG_USB_CONFIGFS=m
@@ -272,6 +275,7 @@ CONFIG_PWM=y
 CONFIG_PWM_PXA=m
 CONFIG_THEAD_C900_ACLINT_SSWI=y
 CONFIG_PHY_SUN4I_USB=m
+CONFIG_PHY_SPACEMIT_K1_USB2=y
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
 CONFIG_PHY_STARFIVE_JH7110_PCIE=m
 CONFIG_PHY_STARFIVE_JH7110_USB=m

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
