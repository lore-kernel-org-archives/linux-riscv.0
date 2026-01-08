Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B890FD148A3
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 06:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NqWRoKmAU9n01W37U6Q1NLWu4+lgaARNP9D1H06x/r0=; b=VqH27hwVkmhan6
	uj0tBbPAkQWF6L8hGQglbeoLwcfcD4YUDg0w23w2MYj8ztXpi7fC195IHL9JGu1XpwvyGL6+uakfm
	+1YPb71D2abqV6VBe1GNeeCoiK4xLQRxt2y0OkGfVp2nGki8lj+P5iWk+YXL/UGwAPxJzQYOFcaMv
	iVqsNE9gU/tDx+zavey725WyAxKGiYd7H8BpWlgWw+pcpEwoUS2xlhLuc4oMLe2eDVbPVmKAahq6+
	LazNPFw4eOQBRqjjEUo8O473nP8RD80DqzwZpTJ+6UzGZJhor8Sr6dz6LUPFHf13LZZFqZ/nWMOph
	0BX6con4Wm7rV1WioStQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjkf-0000000G0pg-0Ifv;
	Thu, 08 Jan 2026 06:44:09 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjkb-0000000G0mE-3k3s
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 06:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767854572;
	bh=9KHROnUEIvPqP19NCUXrKwxxtcouWKa/sIjP2B/yxeI=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=JzAGXqPbB3lFFI6tIXPxoaHEYvmcPli8QPJ/ei55XHkSvMj47H8oGPnjxYvAAmNOI
	 8CURceu9WVYaP7TY46uszzPewiUs4MjOXcvzJTaWpsq3Z2MWg22E5t81yp3JvoIYbh
	 R10YkYVX4UPCyolzrJFh8jv+cr1QiXEgN8N55MJI=
X-QQ-mid: zesmtpsz7t1767854562t5f925277
X-QQ-Originating-IP: jpsITs+0M8zYjWpG+mRTWA7xVHFcy2hgYLaxB7MfVFU=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 14:42:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1930214051744861045
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v2 0/3] pinctrl: spacemit: support I/O power domain
 configuration
Date: Thu, 08 Jan 2026 14:42:37 +0800
Message-Id: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAN1RX2kC/42OwRKCIBRFf8Vh3XOAYsxW/kfjAhHzTQoEaDaO/
 x7Zom3Lcxb33JUE7VEHcslW4vWMAa1JwA8ZUb00Nw3YJiaccsE4P8J9AYdGRT+AxAbQgnt6aO0
 o0UBDeSu5EF0pFEkTzusOl33+Wn/Z68eUKvEnewzR+td+YWYf+2dtZkBBdIyWVJ7OhSqqAc205
 MFJpUeMubIjqbdtewN4Zwz05gAAAA==
X-Change-ID: 20251223-kx-pinctrl-aib-io-pwr-domain-b02da255f95c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767854560; l=1410;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=ZcMJv5vySvDa5Y1bfoUtyEpyvXhIYxmk5NRRDB88Ifc=;
 b=kri8MZhe0WMkMtzShrT1PFKK/8gTmXAPM97j6yiW7+TlGtDJEZj2R3j/dQkYjZbOTzh3v4n6q
 SUzKldhoR5yCYCaPkelY6tgE6h/2eW9X6gNLSNd1oLHGHiadPd6dEJd
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OPLQSEV68v20gIT8DqMIthvx8Lcp5sffnkag3n9mtpzn8DKB1Xh+wZ9S
	jicFbrw4pMb3DIrER2s1ET6kH81sw9Z7OIj0Pn1iWF40p08Eer/pldI4qLSBRIFWTlRiKYm
	6Nf3f7qVtPF+KXwKXAssSzXIkPr7qUN//EGGwYSwGU/b/9YmO5Fp7RyCZsHkjPuGO4u+jnu
	yepEBUp8QtUtBptYJS48xp7huGGtS2wiJI4vOkYLv+eb4nFMbDq86zmEQ86hc7fQPT0m4FH
	SkMehsXx9Q5cNOEzGkYjAPWNi+5s3xnmWiN32fDt2a5alEdBTSD1VfWoOVDFmPUtLA5XrDs
	sCkNiGc5r7McaAiy6fVXxNHP8CtKtdS6OLPtdV6oPlZi8FMLfGpRnjMQgBtA4gUQ2TqTj6O
	HXGc8nuE2lTwi3poBuzAsS6YYwbD89bKGusLyCNJ8KTfOg9VtKrWP1F+iQzSN7W+vVi5B2T
	Zq0JpnY/DEsW+rJjVDjxeAbzlaG0bRSUwmegGthj93naSX3LOVJ8uBGeFucRYW0Rq9FrktW
	ftD/snrt6VJ3YPqa0gAZQJ2UvSmktcCyoagMAAYIarAjjwkqCPrFoy9pxuSYhYGs4kYxfcg
	Y6Pv/ARoMrQhLcA8ENdrs4eVFVgnRnjK9212FnJa5/+4MrYlaKK1SMwG7yfAtlFGHu1qE3M
	cmPscHqi4KHhLTRbIKgoWcCzk8Fe5iiSYXQzSs1XTPAn0J96anE/pqsMglaskqLuuiMuuJT
	aEwJ22/zrZPNjPa5m0pAeHxBlpyZeLVHxhk5JEtewOqeJZI8WK8kISL7L3T+g1QsAOm2efR
	fcUR8ThYmeaVU+zIhKdPJ7Sz/RjO3Lx9xYQPRFFPtuaoldZ49VRCl+4OcwRhhsTgUXofXWz
	N3157+9lQQMvbbeKdIhokmveDQ0YK9qTwLeWU7uUfFp2+bZybRJhUVZBCRxEtbLV7usMT6J
	dZc0LlHRTO6Ss9viXiECA3R4Hd7ZQM3ygOZ95buQ6h6sEgKh/vLsvw6hn5l25rcQ581YsxS
	UD6I0tFWl0Ks2EtHwG806e4i0CPm5FD+4GBY+mrrr6khQ1h95Cj+9CAI3X2O9My8z4tFfZd
	4MPLe8NidZ/UDVIdInwOnnu18GwMDXyHKRY6BT/b4Q0eXlBCeA0K11bu38aSeBpn7FWs3Dl
	KDp+W77qITC52aI=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_224406_805521_A4A3DCED 
X-CRM114-Status: UNSURE (   6.37  )
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

This series adds support for configuring IO power domain voltage for
dual-voltage GPIO banks on the Spacemit K1 SoC.

On K1, IO domain power control registers determine whether a GPIO bank
operates at 1.8V or 3.3V. These registers default to 3.3V operation,
which may lead to functional failures when GPIO banks are externally
supplied with 1.8V but internally remain configured for 3.3V.

The IO power domain registers are implemented as secure registers and
require an explicit unlock sequence via the AIB Secure Access Register
(ASAR), located in the APBC register space.

This series ensures that pin voltage configuration correctly reflects
hardware requirements.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (3):
      dt-bindings: pinctrl: spacemit: add syscon property
      pinctrl: spacemit: support I/O power domain configuration
      riscv: dts: spacemit: modify pinctrl node in dtsi

 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      |   5 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |   3 +-
 drivers/pinctrl/spacemit/pinctrl-k1.c              | 129 ++++++++++++++++++++-
 3 files changed, 133 insertions(+), 4 deletions(-)
---
base-commit: 168d19e604855cfa6024e9854f8ea9b1c8efa2d9
change-id: 20251223-kx-pinctrl-aib-io-pwr-domain-b02da255f95c

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
