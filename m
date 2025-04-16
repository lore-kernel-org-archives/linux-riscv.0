Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C33EC369C2
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 00:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sSHVdQQ5IF7bHjbAB2d+ikqNkMfu/PhljSSD0tJ29RA=; b=mg2HKBnILst0W7
	Sb7Ge9ReVTtLRE1uMksbWy/yLvVga7tPWxpVMmIa4F1QSM5CO4CIhGUuRlg7OFlXb89o+t/KOwZUg
	xAGtENS0PXWGHp2MbHXSPxSwOywtKeTTXa1/mwe5p4ajLQCGhdi5iGLeKcOBRhRPTnMn3wUA6H0aS
	jW88gGfffvRP/Zjro06cxOH2tFo2l5upIavA4dlL8dgOcQEDI0m/9wefaiLTC06IMtl9al6pAr2aw
	g++zo6Zc2S4XJecUbtLiTdDRSdcvg335LjIv9A3ysj9wXVKcRhWWf8Q1hy9SQ6/9cQ0th06Y1wWIO
	EYsxoOXsf4GJciYvJCkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qT7-00000007cXf-2Jr4;
	Wed, 16 Apr 2025 00:17:33 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qRY-00000007cCp-2IRm
	for linux-riscv@lists.infradead.org;
	Wed, 16 Apr 2025 00:15:57 +0000
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A4E5F34300A;
	Wed, 16 Apr 2025 00:15:50 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 0/2] pinctrl: spacemit: add clock/reset support
Date: Wed, 16 Apr 2025 08:15:26 +0800
Message-Id: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ/2/mcC/33OTW7DIBCG4atYs+5UMCYUsuo9qiz4GTsoiUmBW
 q0i373U2Xf5jjSPvgdULokrHIcHFF5TTXnpQS8DhLNbZsYUewMJOgglCQXhReI9LaGVK4brBa1
 WNmoXiYKC/ncvPKXv3fw4Pbvw51en2/MI3lXGkG+31I6DcBNN2rP0iowczcFraYI3XbRKc+Qoj
 HXBwJ91TrXl8rPPXeWO/bNslSiQR/s2KiWto/g+89Jyfs1lhtO2bb/Gl930/wAAAA==
X-Change-ID: 20250412-02-k1-pinctrl-clk-9649d6ad22c4
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=qlJ8Tc2gUqt6w0CMZd9qhlIpyo4QUot0tlRIcFaOaCw=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn/vasfKVKApe4VDYSxefpZgPabZvNwvE1uKWK+
 rjFQz47MPSJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ/72rF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277deMEACFs485MdGS+XOS4e
 RMwkTCVIfA7OzDzWERRAmScNVaFUbp1o6d4fhGgwH6hwyCzkI28+YzjdHraMEmvRBMhw+0DE+hJ
 G4IHHsBFPAWCNMPsUDj8U/KDMmMmwSpJKr1raL8qroNyNxzJRv26icOgB6UTpELgxt0EEzOoqSy
 nIGrC7y+T1Hz1t6fcEevOOTQlAj6LOU8PJljYw/d+LFu3gpXZHhzsfi572nEq2XuzYNBS1vdFjM
 pEIyZzkZSVTc5jA7ry5WSUYdo7yOaiWod+gJvkXI500FqIDQpU2TCwGYKNgoE1AXtO7RXyfCOAI
 jcmEqMxpv2g4nDjGjD1gQV+iPPqPi3ApXGIGIGaByvt3dHbCRnpQLjuOD8WWyIxqxuL8MgIxHC2
 yp7n+B1ggmVDYQQhjLMyfiAK+GpIuZ/cSPbEKXYksC1Rl7xyyxroJs1jk483WGNlygQZF7kDIdm
 fDA/Y7e2krbGshjAya0Au5T+3EXVEcz4DxPhzdH/k5BN0hbmdAdS0oyNA3WAvfSZ/7OwJsGyyvp
 ArAkbffeaVQ0wbwL8Zfl8mlmwKMyxLGVPVnTe+aL9KMq0vu4vieJSQuOouaaSz3WcpHbqEGBFEg
 E6TzdRz9U6SJ2MFjfwZ30tjVVebfEmn74wkBoM41THMrE4ztPuGH1OhFuqJCHMcrUC2Q==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_171556_624355_20BAF0D6 
X-CRM114-Status: UNSURE (   6.21  )
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

SpacemiT K1 pinctrl requires two clocks in order to be functional,
also one reset line from hardware persepective.

In this series, adding clock property in dt-binding, and activate
them in the driver. But for reset, making it optional for now.

For DT part patch, I plan to submit after clock driver merged.
This may result dtb warnings in this version due to the mising
clock property in pinctrl dt node.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v2:
- fix typo
- drop the _optional_ API
- Link to v1: https://lore.kernel.org/r/20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org

---
Yixun Lan (2):
      dt-bindings: pinctrl: spacemit: add clock and reset property
      pinctrl: spacemit: add clock support for K1 SoC

 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml          | 18 ++++++++++++++++++
 drivers/pinctrl/spacemit/pinctrl-k1.c                  | 10 ++++++++++
 2 files changed, 28 insertions(+)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250412-02-k1-pinctrl-clk-9649d6ad22c4

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
