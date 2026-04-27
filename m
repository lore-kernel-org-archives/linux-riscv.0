Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD81EFF8861
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 07:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FgPmNxoY0K32jrqO+vo/XRzO3+0NOLsq9K//mSHBd64=; b=rRk61t7gszErO8
	tDeOP0bs81hVoSjLEQUxiLswE4LWfGEw7CyVDnhdKdl8MMPBJT/Y8KHZJZtxlnNkutUFshmVmCq8d
	xZmK6w+C2ctuR2mfapBwwlK308xStApaekoUw7ppcsm78jNH0AxbHt5C8fzg/dhRT3B7UYDGVJBJl
	ASJMcRgqWPR2nLjQyrzDPDKrjx72WT98C5INBiGEZYXbNBSzd7lxlPxwfrgZp13zlFNBaLO3EVdlM
	FumcEC9c6stWEz0FTGj/kaZhJ+XC/WS6nmwXVGkFNtmG9yIYTXZT9GT/pto5NInd52ZoP02TGWxy4
	aa3O/+XxIMtosFL22fQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGCD-0000000GLlx-22ho;
	Mon, 27 Apr 2026 07:15:57 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGC9-0000000GLkX-2JrF
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 07:15:55 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g3vx11431z9vDh;
	Mon, 27 Apr 2026 09:15:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777274149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Le2XwzWiqwhfCfphPB8qaGdrWgXHDh5RoYZDWvPLXgs=;
	b=l6PHItTPk+9hhxYukbnDaHbFDgiNXfcCNGYQDkX1MwzDbCdzZowTsqz9HcFemhxyHjTvaV
	DMBksUY90gV9orfYZly4eyILlwUb5TMFOa3iknpLfY0CvaRELDMZ7Xe63+ULln4JZA287J
	wMRGAwcFGpS6dnc4Ucl3psK/c22H9yypcgL6EkEI/mnLfTOj/Ea56agJgE/pJzDcvE4NUL
	YChd8W7em23H5j4Mj0GhSFKzuRPtLyNVQ3jLqQxKN3OIehdGqThUVQqHg0SsUjXAhP5pLU
	peM+XHxynrnaaAOmwJjyY7CtdyKNsEsETFLL8iDbK2hoS6lAtofIiPUQzEKVYw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=U8+R79XG;
	spf=pass (outgoing_mbo_mout: domain of shuwei.wu@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=shuwei.wu@mailbox.org
From: Shuwei Wu <shuwei.wu@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777274146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Le2XwzWiqwhfCfphPB8qaGdrWgXHDh5RoYZDWvPLXgs=;
	b=U8+R79XGmUd2FFR6qIVVYLep+NgyvN8lndXNXXEEeg72ttOamPpBiHEO44ImL0NkVAVa7p
	W1qYohfgy470oc5xeDUMT1OcPJTDhvQV2QGSqZyT8LFFSw1vzinT1JJjtEGbPCND08Kdqe
	DTnP9mvpmLMd26xmvAGWRsZ4VkgonFR9Oo4GsC///Rjw0npMTxX7lYo23FDpOsDto/iDt8
	SsomAfuQfEc5s6TPGI6WWQsT0qg5s/nkdEJChaVejmFcPfND0wRS78dycSsNAC1E7WuRnC
	FzzoM2m4FCZzwZVNG3zh0yXwGcAARTkO73nW1jgUODkmSj7F7ac2gTUcv7+rpw==
Subject: [PATCH v5 0/3] thermal: spacemit: Add support for SpacemiT K1 SoC
 thermal sensor
Date: Mon, 27 Apr 2026 15:15:14 +0800
Message-Id: <20260427-k1-thermal-v5-0-df39187480ed@mailbox.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAIN72kC/03MQQ6CMBCF4auQWVvTFqnIynsYFm0ZYCJQMyUEQ
 7i7lbhw+b/kfRtEZMIIVbYB40KRwpSiOGXgezt1KKhJDVpqIy/yJp5KzD3yaAfRWmWN86UzBUI
 6vBhbWg/sUafuKc6B34e9qO/6Y5T8ZxYlpFDal9emkSb3+X20NLiwngN3UO/7/gEQDkZ7pgAAA
 A==
X-Change-ID: 20260409-k1-thermal-fa1a6bc8b65e
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Shuwei Wu <shuwei.wu@mailbox.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777274126; l=2057;
 i=shuwei.wu@mailbox.org; s=20251125; h=from:subject:message-id;
 bh=P/tTQuPHG8NvZa6CrH2gIUjX+SxZnduY6Mz93+yekh8=;
 b=YgNHdzLvJyPejzh7MYVe41x9bBzX5q1DIhB3k5HQw7m+23/YeAnOCYlTVI0bo1z517P3Kh0FR
 dm/b7uN448EA+zP3Khd6xeA9spphgZXO96E+oG37i9d+frYpjnnEP63
X-Developer-Key: i=shuwei.wu@mailbox.org; a=ed25519;
 pk=qZs6i2UZnXkmjUrwO5HJxcfpCvgSNrR4dcU5cjtfTSk=
X-MBO-RS-META: wtwznt6tf6zqny1hyqtetawm48ryqccy
X-MBO-RS-ID: 481a13714f42994e906
X-Rspamd-Queue-Id: 4g3vx11431z9vDh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_001553_750657_EAB619BC 
X-CRM114-Status: UNSURE (   8.40  )
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-pm@vger.kernel.org, Yao Zi <me@ziyao.cc>, Gong Shuai <gsh517025@gmail.com>, linux-kernel@vger.kernel.org, Vincent Legoll <legoll@online.fr>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Introduce support for the on-die thermal sensor found
on the SpacemiT K1 SoC.

Include the device tree binding documentation in YAML format, the
thermal sensor driver implementation, and the device tree changes to
enable the sensor on K1 SoC.

---
Changes in v5:
- Register threaded IRQ handler before enabling interrupts
- Clamp trip points with clamp_val in set_trips
- Link to v4: https://lore.kernel.org/r/20260410-k1-thermal-v1-0-12c87dd063c3@mailbox.org

Changes in v4:
- Add 'depends on THERMAL_OF' in Kconfig to ensure functional dependency
- Link to v3: https://lore.kernel.org/spacemit/20260119-patchv2-k1-thermal-v3-0-3d82c9ebe8a4@163.com/

Changes in v3:
- Fix indentation and variable types
- Simplify clock management and redundant assignments
- Link to v2: https://lore.kernel.org/r/20251216-patchv2-k1-thermal-v1-0-d4b31fe9c904@163.com

Changes in v2:
- Move driver to drivers/thermal/spacemit/ and update Kconfig/Makefile
- Address reviewer feedback on style and structure
- Improve variable naming and comments
- Link to v1: https://lore.kernel.org/r/20251127-b4-k1-thermal-v1-0-f32ce47b1aba@163.com

Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>

---
Shuwei Wu (3):
      dt-bindings: thermal: Add SpacemiT K1 thermal sensor
      thermal: spacemit: k1: Add thermal sensor support
      riscv: dts: spacemit: Add thermal sensor for K1 SoC

 .../bindings/thermal/spacemit,k1-tsensor.yaml      |  76 ++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 101 ++++++++
 drivers/thermal/Kconfig                            |   2 +
 drivers/thermal/Makefile                           |   1 +
 drivers/thermal/spacemit/Kconfig                   |  19 ++
 drivers/thermal/spacemit/Makefile                  |   3 +
 drivers/thermal/spacemit/k1_tsensor.c              | 280 +++++++++++++++++++++
 7 files changed, 482 insertions(+)
---
base-commit: 5a11253b34fde37ab9f899728bb1f7b19af5ee37
change-id: 20260409-k1-thermal-fa1a6bc8b65e

Best regards,
-- 
Shuwei Wu <shuwei.wu@mailbox.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
