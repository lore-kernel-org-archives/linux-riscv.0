Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15426C83F1B
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 22:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ul1QESOsEZWRDw2AC4foVY2RkJKUMFwlW7D1JeiQE3Y=; b=xUJBz0LbvVKtnw
	KMogTkDemFPIFosgfL3ik8GOezmq/TXwIA6j53E358KBMkcU1s2AgCoanJfFWNW2x+QZdghEnGNRt
	tq1J19Fqklt4gZ/yrhRMfGdYu93fg5Mz5GBRUHcXKNMpivjol1Vvy/rL4cDCAoAdaXIVIhjWrhUpK
	ylOGiNxw1nBjiNwCEuafiKLu44JuuZWnTnzPrmB8h9pN0OoK5Unrh10sNmMbVtaVFNsROMPE8JhF3
	1zQaRIDkrzK/IITJ71gxcUeJbJU1OnNKE14qPxLO/Gif8UNWz5lo1gKnbEKO5HG1sqTBXwRmUhxzo
	Hoj/MGN1kfrjALydacZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaMi8-0000000Fz8V-2bxM;
	Fri, 11 Jul 2025 22:59:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLkN-0000000FvCD-1vSq
	for linux-riscv@bombadil.infradead.org;
	Fri, 11 Jul 2025 21:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Sender:Content-ID:Content-Description:In-Reply-To:References;
	bh=hT6hRPRdORTNjZo9/76KeSdfDtZa05qA94d2HRMxZKE=; b=W0RSvG7TJs4Q2D6QO0UzfY9FYs
	R9iPVQDP6CU8ijKjXN3vIiT26H10Lz9Gxd1IN4yBEmXVaVTDRVAeafVpe1dFe4p+B7bkvOKG0VHoN
	IzFh4iCqBKd0SpxJ+pHwtAWM6t6Rqc8XI5+cirkSXsaWApXG4b5ZOfky0mN1kYeReVgOlgaBV6ld3
	JUcymdxt+g2SxW4sCLBCoyT/qbW9LXMcUyy5gf32MjXHg5jx9ppqhMT2asekzZr+Z/rb/caLCIlSo
	YZOoWdeVugd+sYk0xyJqEweivLgtxTY7mSl5oZE07x0ZWTey26G/bPXZHDoLs9gKnUxSfeOlh3Sd6
	UvqBJG/g==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLkF-00000009Mfb-37S3
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 21:57:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A9B85C48D3;
	Fri, 11 Jul 2025 21:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E708AC4CEED;
	Fri, 11 Jul 2025 21:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752271042;
	bh=rKK6/zAeDGlf2Rcw+XgRGzGg1wLNDrZiOXO05uwH78I=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=C0fzv1J/J1OS2rZ8cREfFFwlyuwaUdPYY6YfQVJku7fQJMUe3hDMvrP6cdjytJmsb
	 T0F+d+derx/9PxhuUHck8ivlq5D+33XlUumgQWon/YKev1in7Mt0++If8KQpwC2Mq1
	 fLWx2DnOsZm7yK4y3K7BM5DUDdn2cYGJz7+OTBGPvKbUQlJ87Sx5OmJqtyImDFMLqa
	 76Uru8EIfuUSvgSeLbIDWvz8HI/C8pV2e3xtKJkx7/3SI4fFrzX+JVFfyT/uR6H0At
	 oE5h1o9a78cf4sXvwyW83mxviXOMqUiWRSH/1d/UQGYRf24URZt1cb910fs1DH0iqu
	 qx/RxqzcLyY2A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D643DC83F21;
	Fri, 11 Jul 2025 21:57:21 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Subject: [PATCH v5 0/2] riscv: Use GCR.U timer device as clocksource
Date: Fri, 11 Jul 2025 23:56:44 +0200
Message-Id: <20250711-riscv-time-mmio-v5-0-9ed1f825ad5e@htecgroup.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJyIcWgC/2WNQQ6CMBBFr0K6dkydtARdeQ/CAocpzKKUtNhoC
 He34tLle8l/f1OJo3BSt2pTkbMkCXMBe6oUTf08MshQWKFGqw0aiJIowyqewXsJYGtsWDvqm96
 psloiO3kdxbYrPElaQ3wfB9l87a9lL/+tbEADPTQ5vCIOdX2fVqYxhudypuBVt+/7BzH0MY6yA
 AAA
X-Change-ID: 20250424-riscv-time-mmio-5628e0fca8af
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752271040; l=1798;
 i=aleksa.paunovic@htecgroup.com; s=20250514; h=from:subject:message-id;
 bh=rKK6/zAeDGlf2Rcw+XgRGzGg1wLNDrZiOXO05uwH78I=;
 b=KytOxScst8FlcaqhCNUXLNgl4U+YRyv7Yo59CwjWeu9RGKO7KU14DknmC2ThSZqyiN+EJWQ1u
 i925hQY2QoLCIseXEBHReLzdPoZyna1zQlpJcjdIQHTIeO/BV4wy6H7
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=gFVSVYLKAgJiS5qCnDyUMGOFuczv8C6o0UmRs+fgisA=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250514
 with auth_id=403
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_225729_447543_AC696CA8 
X-CRM114-Status: UNSURE (   9.55  )
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
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds bindings for the GCR.U timer device and corresponding
driver support. Accessing the memory mapped mtime register in the GCR.U
region should be faster than trapping to M mode each time the timer
needs to be read.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
Changes in v5:
- Fixed build issues on 32-bit RISC-V and sparse warnings
- Remove clint_time_val and clint.h, replace with riscv_time_val
- Depend on RISCV_TIMER in Kconfig
Changes in v4:
- Remove "select" from mti,gcru.yaml.
- Refactor the driver to use function pointers instead of static keys.

Previous versions:
v1: https://lore.kernel.org/lkml/20241227150056.191794-1-arikalo@gmail.com/#t
v2: https://lore.kernel.org/linux-riscv/20250409143816.15802-1-aleksa.paunovic@htecgroup.com/
v3: https://lore.kernel.org/linux-riscv/DU0PR09MB61968695A2A3146EE83B7708F6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com/
v4: https://lore.kernel.org/r/20250514-riscv-time-mmio-v4-0-cb0cf2922d66@htecgroup.com

---
Aleksa Paunovic (2):
      dt-bindings: timer: mti,gcru
      riscv: Allow for riscv-clock to pick up mmio address.

 .../devicetree/bindings/timer/mti,gcru.yaml        | 38 +++++++++++++
 arch/riscv/include/asm/clint.h                     | 26 ---------
 arch/riscv/include/asm/timex.h                     | 63 ++++++++++++----------
 drivers/clocksource/Kconfig                        | 12 +++++
 drivers/clocksource/timer-clint.c                  | 20 ++++---
 drivers/clocksource/timer-riscv.c                  | 34 ++++++++++++
 6 files changed, 128 insertions(+), 65 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250424-riscv-time-mmio-5628e0fca8af

Best regards,
-- 
Aleksa Paunovic <aleksa.paunovic@htecgroup.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
