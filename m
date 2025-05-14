Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25F4C3ABDE
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 12:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7lbIbA20QcX1cH6sFEEF6T898wtHDwWjtas9dNzjSSk=; b=cu+nyuBGuXUJSg
	a5HUvWKzbvA1Nqkth4HwHeB0mioO9fTDkwwy6rZcZlLpLeEQOaQMn/wh5+qP9blIFCknAKsapfLXf
	8zJWSkydtNxmHZlCa6cFBbBDyda3rNGx3dWLR2ccsR8/R/hdnQY6lqPX/GKf+sxgpfEI/AXkfWZog
	pvmQK86MO4fro+N1lTELmFyDLeWEdlpNzpcA9ICZumOcbj52oq6OIrBYN+LDZoC1mJBQUAk8UK440
	coG/IKw3IIVr+/LRGgbZfYgbpFOsmE8p6JE8j/u764ZOq1jBZx5mBIzfYDRZFo8XIFZEzEfZcUulM
	xWy9hYETPhA/gpzb6JCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB3Y-0000000Ezva-1g5P;
	Wed, 14 May 2025 12:17:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7qi-0000000EZau-2xD9
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 08:52:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52B595C63ED;
	Wed, 14 May 2025 08:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E000C4CEE9;
	Wed, 14 May 2025 08:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747212743;
	bh=pn79s5/J/P9TNe+3hLy3s/qDtoOXGxNKcDbvTKLxHq0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uijrsK5MXZDqv5WghHiK0XdMjDfGlSwTTmKDKeXTdeHHnZLCQdV7oV7tpcI+wcP6h
	 gxvNrKPAPRQE0N6JQ93jMB7xwIN2N8kCA1UIdllwoq3Px4d38feOv7lAdI+pqe43Yg
	 cMk6xiP2RcnfrXNeLyBB7cjcG8eO49STacoteMoAnCpsHcydpCDal5zkTOUaeY1Ptt
	 2/pnj170IpHuiUlRO50cj31kV+ajfGHZvvjZWgJFsNYN5I97LnpQmfRYWsnQ9Ug2zq
	 njXIPoARiY1yiPMIRUWCUi3LtPq+g6rOnYslOC7lk1sTFGsDVUGRoO0cSLEiYFYN2B
	 tDVOdwsvNFafg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D326C3ABD9;
	Wed, 14 May 2025 08:52:23 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Subject: [PATCH v4 0/2] Use GCR.U timer device as clocksource
Date: Wed, 14 May 2025 10:51:49 +0200
Message-Id: <20250514-riscv-time-mmio-v4-0-cb0cf2922d66@htecgroup.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKVZJGgC/x3MQQqAIBBA0avIrBsQ0ZCuEi3ExpqFGhoShHdPW
 r7F/y9UKkwVFvFCocaVcxrQkwB/unQQ8j4MSiojtdJYuPqGN0fCGDmjmZUlGbyzLsCorkKBn/+
 4br1/N1+qi2EAAAA=
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
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747212741; l=1393;
 i=aleksa.paunovic@htecgroup.com; s=20250514; h=from:subject:message-id;
 bh=pn79s5/J/P9TNe+3hLy3s/qDtoOXGxNKcDbvTKLxHq0=;
 b=rlPq6swwSQfvouul8tW+SJQHbhgJ9bLJXKSNximZEzgFJegjutl9e61P7ng8+xa0j9c7BERNl
 peYI8pd6S8tAMlHpGC/INhUOvEzV/JOrTCoHCBvvxYC+8x1rhWP5QuQ
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=gFVSVYLKAgJiS5qCnDyUMGOFuczv8C6o0UmRs+fgisA=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250514
 with auth_id=403
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_015224_867918_26AE5F0F 
X-CRM114-Status: UNSURE (   8.99  )
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

Changes in v4:
- Remove "select" from mti,gcru.yaml.
- Refactor the driver to use function pointers instead of static keys.

Previous versions:
v1: https://lore.kernel.org/lkml/20241227150056.191794-1-arikalo@gmail.com/#t
v2: https://lore.kernel.org/linux-riscv/20250409143816.15802-1-aleksa.paunovic@htecgroup.com/
v3: https://lore.kernel.org/linux-riscv/DU0PR09MB61968695A2A3146EE83B7708F6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com/

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
Aleksa Paunovic (2):
      dt-bindings: timer: mti,gcru
      Allow for riscv-clock to pick up mmio address.

 .../devicetree/bindings/timer/mti,gcru.yaml        | 38 ++++++++++++++
 arch/riscv/include/asm/timex.h                     | 48 ++++++-----------
 drivers/clocksource/Kconfig                        | 12 +++++
 drivers/clocksource/timer-riscv.c                  | 61 ++++++++++++++++++++++
 4 files changed, 126 insertions(+), 33 deletions(-)
---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250424-riscv-time-mmio-5628e0fca8af

Best regards,
-- 
Aleksa Paunovic <aleksa.paunovic@htecgroup.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
