Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2084CA0EFC
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Aug 2025 08:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OIlpsU7v4ZAKTxUsqikHR1vNVcNyUac5e3UHcLPJtBs=; b=qC5wjGTZnyKmX5
	55XVK+OobdXKim/wXVrpHBC9zcwo2hbVPUiCCmOnfHGeGZVgnlLR/j8i4ngUyT8xPRPuWW1eZXtc3
	UFX3+Zr7mEVn2wWBRAFcbcnzu6+Ija9LHhhEEBCf+ltNGM8Mpfrbdve/a2m6cJoYRBlD1h+vGrnEv
	uWP9nQ4m7Rs5YWBaSPt26qoAHsPyrIHA2v72ZD2mhhqbE/giDf8t9ibooWGVVC7eQfbV+5PT1dt+P
	mYbwgU+RV29833Cp4aZ9gRMzOpIdd+Vga0A9C5HDkZwBeely0wmypnZSVH0Dh/VQdsDHQzs0s9znc
	gd1UlrpwR56jsosFcu7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq6Im-00000005sp6-1tz8;
	Sun, 24 Aug 2025 08:42:12 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq6Ih-00000005sgq-0djz
	for linux-riscv@lists.infradead.org;
	Sun, 24 Aug 2025 08:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756024828;
	bh=O7QkqLL1Uz4POVfUWaVHKWCebfO78hHJLlMwMJBxzhk=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=ItQz1KxaiRzKdg1h5l+hOnK3Ao5EtoBI9IfiPirqudAwhBagG4k1MaQkSAAy1olNh
	 nIWHDTn19Lu88V76a0J8mnLG6vTEczOXCSy8YbiWqQSCV2RIHhMy9QToEHP2ZX8pKF
	 TYeXTrJCKjJ9x4YPxbptktr6iV/tVRXGBh3T/amk=
X-QQ-mid: zesmtpip2t1756024819t4c5e839e
X-QQ-Originating-IP: upKO0L+yIpZXn8455s8h5c8yHNVZ/SB8e48qzQtjrRI=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 24 Aug 2025 16:40:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4970945692771033576
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH RESEND v5 0/2] clk: spacemit: fix sspax_clk
Date: Sun, 24 Aug 2025 16:39:59 +0800
Message-Id: <20250824-k1-clk-i2s-v5-0-217b6b7cea06@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAN/PqmgC/3XPsa7CMAwF0F9BmQlKXNy0TAywMsCIGNrEAQtoU
 QMVCPXfifr0BAgYbeueK99FoIYpiMngLhpqOXBdxQGHA2F3RbUlyS7OAhSgMtrIvZb2sJcMQdI
 YDHjtc42liIFTQ56vPbYWy/lqvpiJTdzvOJzr5tZ3tNBf/ziAV64FqST4jJynxBXleHrg6nIdh
 VNh6cjnka2Pvdcmr0b2ZiTRQGfQ5F4BgPlmDP/fSfRHFnyK6FypbOp/9uOzP9PvBkaDysI5lZK
 mXH81uq57AAupCF95AQAA
X-Change-ID: 20250717-k1-clk-i2s-e4272f1f915b
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Yao Zi <ziyao@disroot.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756024814; l=2110;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=ZUrL1GUtAJCNKt2pUUAfCSXGuuvKhhmY6ZNaHjLFvb8=;
 b=0UsnuH+nwaZtbx9QBe9ToLPKe7brpz7gls5WfkZlfGM3b1yjiv6asuooZN47hWHhRp0wERvOe
 IKXR/VWBmYGCO9gUUUT3UiqKkLP9fPQ+Y0N0WCghE+fLOdxN5ur3mPA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NUAR720uS3BXN31/TXGTQ51lxQJ4YOQ57YCzFslEax+BnPsuonG+YqG9
	rfisgnGGGkgO8oqzKAPwpocj4ksTktScZUDb7Unlw791URqqZNvOKFBQATcXa5ZpUJfBYY0
	ffEW38zs7Q5PCLOl4Qml2ksLfPh0wZQnwaZO0gWgyJWatAlRNpuwaN99kCdcSZOiL10DjYe
	f5Y3zwJmGaTtseSRkfUSDG3oAcig32+i5zPETfX1oU9HHwSbaEDXhaVLK5mmTUihGfbW3G+
	wzxli2L4UpqYZwZz2pKUfJDGk/UcLWEoIDne0XlImM5R03D1uciXndMl8go22OUVHbnWldk
	aifuj4GPYVwCy/XLdUgFBRB8irklzM2T/I/zFowzneomwDGFd8f5XRUWvlBR8jPJXyiCcWN
	z52gCpq9Tj8g2deFb0eO6aiXAjhGgxC0uguKPOZaVo7w+Gt35sGT9sSaE9ky97VHJenZu4s
	8/MZIIaXiZLTWbl+pbuJ01j8i7HQ1d0125/ConMms3bZAnZ9megkfWd8AinVe8Z5jCC32kh
	GMtxiNj26TKipmwqhdjs1IvQdnF3XzvvMlddLZekuMxchiPAdhHfLF7LbLlvPNe9GsooCVb
	3I6HR9Ok0OqujdkmYBWGHzuEMEV3VNoITEQhovoOy9Z2y1EPWxgeyZ8TLApGoWhTHSBU2VO
	fXReYRR6Gr4YghpnAIFsAzRX2tgwmU8i1pe3sEvc6dHZroMGXwviBPwNrhcucCPJ7jCA+8T
	n7gEMaxxex33fucUKlHfIkhj+9cYJtklbYSK4TCEzlk9dD1IuTPlfpVSJ8an70B60g5diZE
	4r73isUOVonuAVLKrH6uofMhEUvagRxnXjhzPFLNQRTJ8JFsq/U3dcQa8xGSxuZmJLYq9h5
	xTPrtqySIqh1GitA2DPm54tlYBxE+RxGqTaf4wO/EnIIJ9WF/6aXhyO78Sq56sKbcwYIoc2
	DaEFsizl0/tyCzW0aoMSVPLBeviOTU7Z2glEChwGLlZ4zK8GLdWPfcfa2GXfE0rg2dH/KYw
	E1isZag/jdfe450s5WiT+YYqloadjUh8eQhzg/2a5P91D3Vz8seBVxbTw20qiO0tW24jOLt
	QXBcJ3udYKooaqMRqQbiG6PsqD7oMlw22How+H5QlYpufa7N4uNLPc=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_014208_061449_907C8BE0 
X-CRM114-Status: UNSURE (   8.05  )
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

In the SpacemiT public document, when the FNCLKSEL field of
the APBC_SSPAX_CLK_RST register is 7 (3'b111),
which is a reserved value. And BIT3 of the same register is
a reserved bit.

But the documentation is incorrect. In reality, the value 7 (3'b111)
of FNCLKSEL is not reserved. Instead, it indicates that i2s_bclk is
selected as the parent clock. Similarly, bit 3 is not reserved either.
When FNCLKSEL is set to 7, bit 3 determines whether i2s_bclk is actually
enabled as the parent clock.

In all other cases (i.e., when FNCLKSEL is not 7), bit 3 has no effect.

Importantly, whenever FNCLKSEL is set to 7, bit 3 must also be set to 1,
otherwise the selection of i2s_bclk becomes invalid.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
btw, the public documentation for the k1 clock has been updated.
---
Changes in v5:
  - move fixes tag from cover-letter to patch1/2 and patch2/2
  - modify commit messages
  - Link to v3: https://lore.kernel.org/r/20250731-k1-clk-i2s-v3-0-2f655ddb0c6f@linux.spacemit.com

Changes in v4:
  - add comments
  - add tags
  - Link to v3: https://lore.kernel.org/r/20250731-k1-clk-i2s-v3-0-2f655ddb0c6f@linux.spacemit.com

Changes in v3:
  - Fixing ABI-breaking behavior
  - Modify commit msgs
  - Link to v2: https://lore.kernel.org/r/20250722-k1-clk-i2s-v2-0-2f8edfe3dab4@linux.spacemit.com

Changes in v2:
  - Use virtual gate instead of new function for sspa
  - Add Suggested-by tag: Yao Zi
  - Add Fixes tag
  - Link to v1: https://lore.kernel.org/all/20250718-k1-clk-i2s-v1-1-e92c10fd0f60@linux.spacemit.com/

---
Troy Mitchell (2):
      dt-bindings: clock: spacemit: CLK_SSPA_I2S_BCLK for SSPA
      clk: spacemit: fix sspax_clk

 drivers/clk/spacemit/ccu-k1.c                  | 29 ++++++++++++++++++++++----
 include/dt-bindings/clock/spacemit,k1-syscon.h |  2 ++
 2 files changed, 27 insertions(+), 4 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250717-k1-clk-i2s-e4272f1f915b

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
