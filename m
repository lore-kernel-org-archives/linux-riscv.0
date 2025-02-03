Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DC7C02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 14:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iXX2hxDIrrPOuC6LtGxfEcXQzF66/KfPtfx6FpjctO0=; b=wIeUvmknB+h6cp
	2QUA3+ydnWBIq2gtYDiIOndUT12DtRjsgRHeMToKC1vZQWzbLOMi+rGLGeoP0X+CkzuunGwN2cSmZ
	kf1e8K+xcR2eQWrsI+h2yTqv1FMcVXqpDQ0I4izF7u4aj81JGZ26SFmdHH6e92urTk5xa9TXviwUv
	/ucWPZ3QcARTSQWjwEKaRJTQIhClKTqhccRoagv2oeLRIxZh2fo5I5dnu/AAXYeJRoA0sCTdG7km6
	9RDqzdMamPk/uN1DAP7nDPyiEbftpOO9rTTmwvf1vauACcZjY2gDeQGk2sVKoUzTk5J/7nRlDtJsF
	9hWsBYkw8d05hrosvGsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1texu1-0000000FmSB-3NJQ;
	Mon, 03 Feb 2025 14:58:21 +0000
Received: from sender4-pp-o94.zoho.com ([136.143.188.94])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1texp6-0000000FlR5-3X9p
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 14:53:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1738594393; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LOqLGkygm7V2gIYETMg6LFnKgtXNMxmvaoCx9w/yCBa1An44em7600Q3Dc7lR2XQRpeWf3FK3nJ8TPXuc/LtogtqeOErh5wIQ3zpystjSjf+t2BZOo5d/UR20qN0rBJww4nKgrdFC1ccaBAXdnv96zjBhusf17OuFRIyGxP50Hw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738594393; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9FBpXPNQ/O7C3kvwwBaoJusx+yF7wtAqh45WHVLBK9E=; 
	b=VX80JuHjRfxYFcEaTLsbh87fS8nIZEFqixWlCtDBTGRYDI4qPwyJDKpGJ2K7KPzo0kqdnSo/i3dNNq9dknfSNqJDNWdwuzGwAOr20kwuHXn05hgPJxqYi+NDi6R0OryB+4TndI8q9jv0VDprN3FlA5sllJPKGJTQ1Stup19DAIM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738594393;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=9FBpXPNQ/O7C3kvwwBaoJusx+yF7wtAqh45WHVLBK9E=;
	b=IBeKPXaxZpHA/VIu41bW1W1wr5b79pO8iTa7HCjxq3yMh8u9Pm8Bpm7lg7W82a5s
	lTV1WIYb14UoIxX8pMXrzD7pckerclMNkwTQUoPRuADKQFKstdcmJ2zfoI9eM9+9cEt
	4DQi5lmVkqcmEqSAY73mE8eMff2Igf++4nRxSWhw=
Received: by mx.zohomail.com with SMTPS id 1738594389391931.2624604192613;
	Mon, 3 Feb 2025 06:53:09 -0800 (PST)
From: Xukai Wang <kingxukai@zohomail.com>
Subject: [PATCH RESEND v3 0/3] riscv: canaan: Add support for K230-Canmv
 clock
Date: Mon, 03 Feb 2025 22:49:54 +0800
Message-Id: <20250203-b4-k230-clk-v3-0-362c79124572@zohomail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJLXoGcC/23Pu07DMBQG4FeJPGNkH9tx0omBrgwwIgb7HJtYv
 aQkIQKqvjtOKFID9eSLvt//ObI+dCn0bFUcWRfG1Kd2nw/qpmDYuP1r4InymYEALUGU3Gu+ASU
 4bje8BhOVioFKBJbFoQsxfcxpz+xx/bR+uGcvP/ddeHvP4cP58eAGbHL0qqBATqG2EEVeMZIWS
 EQWY0nKmwBkyVnCKd+7PnBsd7s0rArrjLTeU1SEVe3ABWOEyHGlDRWoWEVAVcYwN2hSP7Td5zz
 mqOYK54nsYqJR8bzx0tZGVlWw9u6rbdqdS9vb/O/UITMjJMB/5mO0xjisMeKSTQ1GffGr1EuuM
 5coanSlV7pyV7i84FAvucwcQLpa5tFFoCscfnkuL6olh4lbr4QDdAb+8tPp9A0vAdH6JwIAAA=
 =
X-Change-ID: 20241206-b4-k230-clk-925f33fed6c2
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xukai Wang <kingxukai@zohomail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Troy Mitchell <TroyMitchell988@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
Feedback-ID: rr08011227eacedceba60c4476cc4e07bd000017c7dfb419cf004296e5ba00ad2accf505e42645bb0986f39f:zu0801122737ed594d3df406b351e29cc20000b074cadc34b5eab45684974784152d0d14e3d1f9501fea7ad4:rf0801122dc4b18f66a3e2640540f745880000b75a1bc68ba714d550431b5842fecb09d3a409da7c48875c423cc6863ed0a3:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_065316_953655_80E83482 
X-CRM114-Status: UNSURE (   7.78  )
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

This patch series adds clock controller support for the Canaan Kendryte
K230 SoC. The K230 SoC includes an external 24MHz OSC and 4 internal
PLLs, with the controller managing these sources and their derived clocks.

The clock tree and hardware-specific definition can be found in the
vendor's DTS [1],
and this series is based on the K230 initial series [2].

Link: https://github.com/kendryte/k230_sdk/blob/main/src/little/linux/arch/riscv/boot/dts/kendryte/clock_provider.dtsi [1]
Link: https://lore.kernel.org/linux-clk/tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com/ [2]

Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Xukai Wang <kingxukai@zohomail.com>

---
Changes in v3:
- Reorder the defination and declaration in drivers code.
- Reorder the properties in dts node.
- Replace global variable `k230_sysclk` with dynamic memory allocation.
- Rename the macro K230_NUM_CLKS to K230_CLK_NUM.
- Use dev_err_probe for error handling.
- Remove unused includes.
- Link to v2: https://lore.kernel.org/r/20250108-b4-k230-clk-v2-0-27b30a2ca52d@zohomail.com

Changes in v2:
- Add items and description.
- Rename k230-clk.h to canaan,k230-clk.h
- Link to v1: https://lore.kernel.org/r/20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com

---
Xukai Wang (3):
      dt-bindings: clock: Add bindings for Canaan K230 clock controller
      clk: canaan: Add clock driver for Canaan K230
      riscv: dts: canaan: Add clock initial support for K230

 .../devicetree/bindings/clock/canaan,k230-clk.yaml |   43 +
 arch/riscv/boot/dts/canaan/k230.dtsi               |   32 +
 drivers/clk/Kconfig                                |    6 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-k230.c                             | 1372 ++++++++++++++++++++
 include/dt-bindings/clock/canaan,k230-clk.h        |   49 +
 6 files changed, 1503 insertions(+)
---
base-commit: 7a517bbdf3dc89a2ae5500ded67e823f8f2c36fe
change-id: 20241206-b4-k230-clk-925f33fed6c2
prerequisite-patch-id: deda3c472f0000ffd40cddd7cf6d3b5e2d7da7dc

Best regards,
-- 
Xukai Wang <kingxukai@zohomail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
