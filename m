Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D02D3E784
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Dec 2025 01:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wlHoSl6x5hp80zPz0kInZfWhO0XUpF5svI404pN591c=; b=Bj+Od+KP9QK+FW
	btcqUcaR2kT57IxyJXCJqe0JY/WpO88AgL2BMlpVX3hSIU1oWlEADbeh9l7E6VxYwU5+WNmgqzs9c
	4jaIvOYjwKNtxNRaqTA3NOcBTPk1Uf2V1dauRHjzgc6CN8iOZD65Kh9USqCobm0JY8/S59fy8gYcV
	uJuaxI5ZWPULgf8nSk4pLbVI6hRKtXbaKgCX1saewUOy+Gkr0+/6CGqgnzQ9Wfx6nzOzl6rnvj52M
	VMsKlKwo45tbMzQIWLZwI5ij3aUHx57DzJ7Ccfb60RmC+JurwV/Zx6iOFAzTewwWbaC5rrjdZbPXp
	G4+e4ERV/zVus0y7bY/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVML-0000000G3ZM-2FYl;
	Thu, 11 Dec 2025 01:20:45 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVMI-0000000G3Yi-1nRP
	for linux-riscv@lists.infradead.org;
	Thu, 11 Dec 2025 01:20:44 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 68C9E34076D;
	Thu, 11 Dec 2025 01:20:34 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH RFC 0/4] Add clock support for SpacemiT K3 SoC
Date: Thu, 11 Dec 2025 09:19:40 +0800
Message-Id: <20251211-k3-clk-v1-0-8ee47c70c5bc@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACwcOmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwMT3Wxj3eScbN2UJCMDQwtjC8vEVGMloOKCotS0zAqwQdFKQW7OSrG
 1tQC/nYvtXQAAAA==
X-Change-ID: 20251204-k3-clk-db2018389ae3
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Haylen Chu <heylenay@4d2.org>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1937; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=7wM8kl3qX0xkz3vzrVtu3bOKqohyKqDnNPPd+XJd05Y=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpOhxSgE8RY7oRxus5DTWEvVfuqPsiOXvJ/5p24
 ZzRX/jullqJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaTocUhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3jqxAAjcVO0Kp1VVSuADxzZ9oL4tR0X0qeWU3MKw5I6T7EEcs+5T1qm+YVE
 mv1Yry8Im1G5gR49icpkDbLjEknypIijczfs28aDdxfOEIyaBXKqclMQN66x0/5X7l0sUOzhKi8
 /9lf2kFC8fA3afu3xGeE+JDabx05+B3fZvrB3eAnilzdBHEGjBsY38zLVmjm4tW//tmwTJcqwZB
 z7IQ0QkaH3H90MUNDOYxee7yrENiRNK3PYzeuPCThbMPmVli7VxbDlaQ0kXSgfejfdLGWIKBsSC
 Ls8V81iqP2ojjEDZaHJU97vJ1cFZsachOv1aCJH69M2eFsljOBIOX6GMP9ccwFdnClScUXa2C+I
 5v2atu9teYxzamZAxl2PVyzydcg7Aa+GlVDtErxGn61LFcm2VxFmF3PD90XttSmqh909hijqiiS
 ms6+3JEmhK1tyblAipf9dYOMiM0d4BMJ8mMLof3lSq7on4GhgcLFRyqWGMW9PCa5Cb7Gxe1T68/
 4BDvX89KAANgu06V8BxfpVFqLZuE6xmTnzfaGrR7VMB758rahOHcUld8/L3aisTMZvx341T4clY
 Z1cHBBU+VwAHdV9bkdZqcmXwhZlB8gqbGfbvXgy3BTUItpzJxMLr1agJEe4YLNhszq5srdjuPjY
 XofTqLD7cYbTrePjKJjmsipreaBR7o=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_172042_618710_BDDE6802 
X-CRM114-Status: UNSURE (   7.67  )
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

I'm marking this series as RFC for now, as the driver is based on vendor code,
and only tested on FPGA, the production SoC chip isn't ready yet.

The SpacemiT K3 SoC's CCU (clock control unit) is similar to old K1 generation,
the clock and reset functionalities are distributed across several IP blocks,
therefore, we model them as several clock tree accordingly.

The PLL clocks has changed register setting layout, so introduce a PLLA type.
Some gate clocks has inverted enable/disable logic which writing 1 to disable,
while writing 0 to enable.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Yixun Lan (4):
      dt-bindings: soc: spacemit: add k3 syscon compatible
      clk: spacemit: ccu_mix: add inverted enable gate clock
      clk: spacemit: ccu_pll: add plla type clock
      clk: spacemit: k3: add the clock tree

 .../devicetree/bindings/clock/spacemit,k1-pll.yaml |    9 +-
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   13 +-
 drivers/clk/spacemit/Kconfig                       |    6 +
 drivers/clk/spacemit/Makefile                      |   11 +-
 drivers/clk/spacemit/ccu-k3.c                      | 1641 ++++++++++++++++++++
 drivers/clk/spacemit/ccu_common.h                  |    1 +
 drivers/clk/spacemit/ccu_mix.c                     |   12 +-
 drivers/clk/spacemit/ccu_mix.h                     |   12 +
 drivers/clk/spacemit/ccu_pll.c                     |  117 ++
 drivers/clk/spacemit/ccu_pll.h                     |   57 +-
 include/dt-bindings/clock/spacemit,k3-clocks.h     |  390 +++++
 include/soc/spacemit/ccu.h                         |   18 +
 include/soc/spacemit/k1-syscon.h                   |   12 +-
 include/soc/spacemit/k3-syscon.h                   |  273 ++++
 14 files changed, 2539 insertions(+), 33 deletions(-)
---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251204-k3-clk-db2018389ae3

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
