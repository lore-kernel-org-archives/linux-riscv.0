Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C284DC4452D
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 02:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D5n9cCA+VUcgd1dvGGlSUyuHKxkEPyt7uIb+QVDO0hM=; b=L3v2Ez8YzoGWVN
	MPZk98PaPzHDkWYz2sTDg20nBrHHconOP4flK+HMOqZr3jc/xevrPhwF10LmxoU/8wsGiZx89gDGE
	eeuuoBH+qCfanSMfvkahshtpiQON0X7094U7Z5biFMISca8+VF2IbEGAEoXJkwtgEBwi19agdTa8T
	WB1LmlcPnNMgeySbs/QnO8f7mejNUe1mQXyqgyZxU7rZwz/q84tKeSw/4lTLWXhXDkZt9SCUX97fE
	tMw712eFhCtr8IS8owODZgmztvtZgEjhta4IaZdbj7sSiV67/FhzFiQ6/UlU2/8GnMON0F1uAc73p
	yqoLnujngoSmdw9VzUeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmMoz-0000000AlH8-1CTw;
	Wed, 22 Jul 2026 02:36:33 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmMow-0000000Al7u-01sZ
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 02:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784687778;
	bh=G0gDdNHVnvtP4yszwAdRHHpQzzGyb6zFjiPptHcS3Ps=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=AAJFlfnD1BIrJIUa5Z4sD7Jjr2arHOFs256uagYQfFXwr21IG02TE7iAXeMKDLy3x
	 TooqmnMJaPwWzRS+iwS2iSLbuwOR2GNqI2r9QeC6OQHEbqgOU9uF8VusqjqPDAAhxI
	 NzM0aRhGjkdrwN9LiaCHtwcxkHUv2IsiVuMjeuL0=
X-QQ-mid: esmtpsz11t1784687775t53f7b8f6
X-QQ-Originating-IP: n8lR2Gkx3feR2ficqsmcYu/ITMH8GkieABedXHtIO7M=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 22 Jul 2026 10:36:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8802665718144346637
EX-QQ-RecipientCnt: 19
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/3] SpacemiT K3: fix I2S DT integration and add controller
 nodes
Date: Tue, 21 Jul 2026 19:35:54 -0700
Message-Id: <20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2O2wqDMBBEf0Xy3JUkakQppf9RfIhx26Zem1URx
 H9v1D4OzJw5KyN0FonlwcoczpZs3/kgLgEzb929EGzlM5NcKq5EAvUCVhJUI4GQUapik5WylMw
 PBodPuxywR3FmmsoPmnEn/BsOv5N/Gc8aKzUhmL5t7ZgHJpaJ4lmltIn3eotE+lDIg+thkIoU6
 ghMU4O/OkxmARwwSzgXWmUS8d7YblpCGrRBjw09/caKbfsBLfvL7uwAAAA=
X-Change-ID: 20260615-kx-i2s-dts-123764c9b2b2
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2135;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=RJHbA+ZG6dUJcD4N6XNifYvpWo+x/xTcFUb6y+QQiQI=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkJOtMOdHwO4P81XXrv+TcNMdfW95fXnTiaOG/Vp/Qn8
 mo7Fy526ShlYRDjYpAVU2TpfsCzrcAnyrZAoNAXZg4rE8gQBi5OAZiIRDojw8XsIDXevWVT5BLY
 xbkbyh4c4itYd8hb+edG3coit+8XtjL8U5zs+afp0JqsPRaTnovP/KVQ6/ipYnJ9eyS/j8/FSv5
 XHAA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Of/Z+TGqbjgQhLCoXjZMGfz08jRlFSLduNoMIbuxw5WAjsczgsbtGoEw
	o5TjyuYo19KEaezyPHecqui1XzcCM3QjoA5QObpR0oCFW8Oc8DbOqpKFsssC2Swch3M995B
	wqFFH+6uu4NuiP7Qf8tDjymuG0N/CaporQXjDQsTjtjsavOPi6dIhJhgr28QGeNt269xnvJ
	oXX/KZt4HTnusu+a3zZRMPc8BtoFfzuBDZcn4/IOoinxbq7bx3lPZP3zR7sAcTjjywi2is9
	FUJRitOD/ocLUwrSY8E97sDMOD2qVz26DHsBuMHcTdGJsvQaP/MiafNPFyQwGWvHff6kDTu
	Zob9if5xjA3O5Q5i5QM6mINCf8B9wFgV8pF1FYYr3cuAV6rqLJUKCRvjtu+9j+6mHjnIUL5
	Xif11U71C9FK5cXXbQekEJle03onmKmidvspM6YPWzC7CSKy09YOnKde41i2fm+OYUgho//
	hwY2Hym5uJq22hkb78RQ+u7fedgXinOgnTcyn4+petc046WQLySnB7mWfrDNGAOCCGmyzMy
	fbLz5VJoukgWCSF8fxiTVsSGoom5rqCzjCALEWQQtnQy7j1ilkW3ar7xkJOhgnPB2EEsWlq
	4uZXLK0N2miDgsv+fiNY/jAbEZ9YN2yDhSKJmfFd0rGnK3H02gLyW7FaaSUINrI5OvMTKw6
	IOC5Imuew06uQhCgNoURkQpKeqijPUFY7P5Tesoz0f/p6ei4uV1BHUVkehhYcP4CC9O8jdz
	rC3ddzsgf+BkuYVWp0D8Vtx2aN8I7YjCwDwrDnvqJN0cTQW8qC8K35+RW+t3Jlpf20FZtWX
	QxBcZqCf3MtT1EzLLep2UDUjTtEsoYB146Odd3EV6wOtYIdU/jmU2x8tAVa1HUvUCdl0Mv7
	buyCwT3O+CwvwqMGik0aBT8WwgzViG6RILFRF+wU3qvZyydk81F5hfbp8yKAugyzq6uH9T1
	liNpwAljEJDuFSJjl4Q0ktQCyIMaC0MqgnoHJAjpj23ODGJK2uJ6/j0tzjmX1iMx/j+RGLf
	YdJ5yA2asjvAA/0WMfEpjsrciyGky6xA+CKhXLq8HtVE2m2DI8dokogu9Scj7Bi9R/1apf7
	QrRf17sQ5f3dcNYRxkDWHbJduxcHsQXxmOHnGPozX2vkKtT2F87cdiO9oSuh6CZpEQ+p35U
	47hVVz/0kjianCvkEq0x+gRGyJPCkA/oJmo9O7CV6wZBZ/Q=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_193630_771868_3F74ED2E 
X-CRM114-Status: UNSURE (   7.97  )
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

The SpacemiT K3 SoC has six SSPA-based I2S controllers (i2s0-i2s5).
This series fixes two bugs that prevented writing a correct DT for any
of them and adds all six nodes.

Patch 1 fixes the ASoC driver's clock lookup names. The driver was
requesting "sspa_bus" and "sspa" but the published binding specifies
"bus" and "func", causing probe failures on any conformant DT node.

Patch 2 allows K3 i2s1 to use its 6-clock layout while preserving the
published 7-clock order used by the other K3 I2S controllers. It
describes the K1, K3 i2s1, and other K3 layouts as separate tuples.

Patch 3 adds the i2s0-i2s5 DTS nodes. i2s0 and i2s2-i2s5 use all 7
clocks including sysclk_div; i2s1 uses the 6-clock variant.

This series depends on the K3 I2S clock fixes posted at:

https://lore.kernel.org/all/20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com/

The prerequisite series contains:
  - dt-bindings: soc: spacemit: k3: add i2s_sysclk,
    i2s_bclk_factor and i2s1_sysclk_src IDs
  - clk: spacemit: k3: fix i2s clock topology
  - clk: spacemit: k3: fix missing /2 factor in i2s sysclk dividers

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (3):
      ASoC: spacemit: rename clock inputs to match binding
      dt-bindings: sound: spacemit,k1-i2s: allow 6 clocks for K3 i2s1
      riscv: dts: spacemit: k3: add i2s0-i2s5 nodes

 .../devicetree/bindings/sound/spacemit,k1-i2s.yaml |  64 +++++++----
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 119 +++++++++++++++++++++
 sound/soc/spacemit/k1_i2s.c                        |  16 +--
 3 files changed, 171 insertions(+), 28 deletions(-)
---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260615-kx-i2s-dts-123764c9b2b2
prerequisite-message-id: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
prerequisite-patch-id: f8cbf4a26caa4b48d44328ec55288f19a5ea67fb
prerequisite-patch-id: 710ec05bdce3d01dcb7bb1fc2a5750666d02c20d
prerequisite-patch-id: 197bf1e162e5346f0282d4fd945ba631c68e0fad

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
