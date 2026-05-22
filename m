Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1F4CD5BAC
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 10:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O4l/1dU040VKOr6oXQ/GooVRJZ+h/ueFQI7/sX1A8hU=; b=dwYMTF3ctrKr95
	XYZ5K075KAid9PIHXwLmlfxNArrgWOJ0KFAvpq117dZxsZ41Tit83BgD3hff/d8NMbKZ0jkOZFybw
	xxjT0LY7As1UTqltB60jz8/6WYPFXo9zoCnty7k/74BFmCESRvo+cx44Mdrz3PRk4EEFL7T20dI8P
	SRfa2IHSUtAWjhQK2K7U7ke1h9CGo7GlIIJ+dnk4htO/9pYaYh+WlcTAlF8xywwOkcx0GDnLAZBDP
	+7rsGGY96BXf2FW6OPpUiYh2daytyGXUsZpMZ1Nt/Xf0svs4bR67+DJk4krrT8rftVTA/o5pIRkdG
	ns/ecf3Sv2zfq9GwdyoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMiV-0000000AQF6-03D7;
	Fri, 22 May 2026 10:02:55 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMiR-0000000AQEI-40lk
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 10:02:54 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1779444159; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gHIq3ixD9bRmVE+/Sy63lp/TQO7Ryf7D8wlX2vPyr7+uuZ4QslwDZJgBJczdpquW5XS0dIzNHj19Oui/C0Q2vTF9rhcFvPoByBEeiwZK36Ajm2mjSapYU+p5WuTqbRtWrsn7OQrV1Og00T6SgXzkTO8hopawDTMNXjtk1O+naSI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779444159; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OSYRXWdgPQ0qpSaOzFwa2vTnVH0eSYVEuTRMqO5a4RE=; 
	b=ha6VWbGe0WlLUFAEDT5QLxD0IhK7kreC1Zy0myB8I7DucaxOnkKM9HCoiIXRYZmv3j+TVdBPOOEv01sEQ01vHkcHdVSNJp7T6+JYWDG4pmOwd64wYVio8VP2PqhGbxwV7O8VYGXwQGT0E1/IBhbtqF4CPM+PxQ0zscLdu5VGsp4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779444159;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=OSYRXWdgPQ0qpSaOzFwa2vTnVH0eSYVEuTRMqO5a4RE=;
	b=Mwbhf6szXkf7TRqc6+kAplUhx5h5cZQN2WdLJNVoBECygFyo1qdYh6ZBCURWj5i1
	eIlcqpnZJAo31zgYXuYxAMsdYjiBuCknyM07z42+/gwX8jLD1Atc6jSzmVO4ThGUZZc
	O9VVEQNUSit1RjYWGw+u7eVmHQDsJwm3w1Dlq5jM=
Received: by mx.zohomail.com with SMTPS id 1779444155920672.4289544688394;
	Fri, 22 May 2026 03:02:35 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH 0/3] spacemit: k1: Add support for Banana Pi BPI-CM6 IO
 board
Date: Fri, 22 May 2026 18:01:32 +0800
Message-Id: <20260522-bpi-cm6-v1-0-707ef1917a30@pigmoral.tech>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw6CMBCF4Vchs7YJ0wEEX8WwaDtTnQUXWzQmh
 He3keV3cvLvkCWpZLhVOyT5aNZlLsBLBeHp5ocY5WKwte3q1lrjVzVh6gwH6uOAQlEClPeaJOr
 3X7qPp5O83iW4nSN4l8WEZZp0u1WdMA+uZrKCEntEIt8H33rynrC9uqZh1zDCeBw/UJtQxaUAA
 AA=
X-Change-ID: 20260522-bpi-cm6-dc38f91e3fec
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Paolo Abeni <pabeni@redhat.com>, 
 Guodong Xu <guodong@riscstar.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444139; l=1748;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=hEkh1Pczn0aaj0ONuR8AqCQA/Ha96EV3U5jPPt4y1oo=;
 b=c8pKUtG6Qf7XIhK7Sdr0k30OlDYgbdTnu/F0hVFQmfvDz3owqof13prOwKJMPOi6HTbCieMUL
 re3mGFGzlBlAiw+AG2QFyP+THrWLyGmAQreaPi2eiLoutuv4iIypg1v
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_030252_356734_6516F6DE 
X-CRM114-Status: UNSURE (   8.79  )
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

This adds initial support for the Banana Pi BPI-CM6 IO board. The
BPI-CM6 is an industrial-grade RISC-V compute module powered by the
SpacemiT K1 SoC, featuring board-to-board connectors similar to the
Raspberry Pi CM4 form factor. For evaluation and development, the module
is paired with a companion IO carrier board.

During the board bring-up, GPIO45 and GPIO46 were found to be used by
the BPI-CM6 hardware as Ethernet PHY reset GPIOs, while the common K1
GMAC pinctrl groups currently mux them as optional GMAC reference clock
pins. Since the reference clock pins are not required on all K1 boards,
the first patch separates them into independent pinctrl groups so board
DTS files can select them only when the signal is actually wired.

This is based on the "dt-for-next" branch of the spacemit-com/linux.

Link: https://docs.banana-pi.org/en/BPI-CM6/BananaPi_BPI-CM6
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
Junhui Liu (3):
      dt-bindings: riscv: spacemit: Add Banana Pi BPI-CM6 compatible
      riscv: dts: spacemit: k1: Split gmac_clk_ref into independent pinctrl groups
      riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO board

 .../devicetree/bindings/riscv/spacemit.yaml        |   5 +
 arch/riscv/boot/dts/spacemit/Makefile              |   1 +
 .../riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts | 215 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi  | 227 +++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  24 ++-
 5 files changed, 468 insertions(+), 4 deletions(-)
---
base-commit: 6edd9a0d32e1ef81133b8cb5b3bb3157a44da4d1
change-id: 20260522-bpi-cm6-dc38f91e3fec

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
