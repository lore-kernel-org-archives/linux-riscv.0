Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC600E668AC
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 01:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fz9WJb8XBTb/vSjqBKapRJFvhttQD+OBv1jHnBtZqAc=; b=XaWEsr7Znyu6bw
	fqm0x0x3RMzmuP2yIGD8AlwcpSEsdFJ+Gdzh6ki6mNuuuaYyYG/rqWeqqvEDJ9uKCdjW7C5NzBdn/
	2bckl6YH6eW4zKah7K3uG3FyddHHo0C0T6HjT/JpR9iSs65xwWrEapB9NAKUDqZ8izCcAiaivd24Z
	S+Uymo/XNRm/p7ZBDrC2aUPOLjnUgbnesccW7V5PywexPwOqZo0REigv6j3WblAEY5k2cm1ILHvcH
	YllB5/dT6KDZ9WO5v8UZRBRvldmPhuziCVkRs6gDIGyvD7hx2vyWL7XceDoGHfv28SUNQ+pmxhmpT
	o0pcAZeQEpw3LuCPxnGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWlxR-0000000BAwg-0JKJ;
	Sat, 20 Dec 2025 01:40:33 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWlxO-0000000BAwL-3W8a
	for linux-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 01:40:32 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 67DA43415E7;
	Sat, 20 Dec 2025 01:40:25 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH RFC v2 0/4] Add clock support for SpacemiT K3 SoC
Date: Sat, 20 Dec 2025 09:39:54 +0800
Message-Id: <20251220-k3-clk-v2-0-1297b46a7340@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGz+RWkC/2XOS2rDMBCA4asErTtGM3ZiqatAoQfotmShyBNbO
 JJayTUtIXevkFsodDkPPv6byJwcZ/G4u4nEq8suhjLQw07YyYSRwQ1lFiRpjyQ7mFuw1xmGM0l
 UrdKGW1Ge3xJf3GeFXsXL85M4leXk8hLTV8VXrKfNQfx1VgQJirnrbS/t/myPI4clxiamUZzum
 5z4/aOULT+855xNLSuh1SMJ8gAzVtJG72PY5OFCykij8UD4Vy7ufwW1RFKom66TuidAcCHayRl
 vjqM37toUukTdvwEEa7L4NgEAAA==
X-Change-ID: 20251204-k3-clk-db2018389ae3
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Haylen Chu <heylenay@4d2.org>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2796; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=3hXRpQvFyucVlxMLGngwSvQY5C6Miw94XqZj97q0aI8=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpRf55LlAlPyhdM/vbDPipNg024LU0U722zw2+j
 ysQPPQ7DD2JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaUX+eRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0Rgw/8DWOgPhKFPbtrETwlA5Xg4P8rz0wsYQFQSR/KX0myK7RXyEDvHxNK9
 FqVveJan/3xQ9eWP+/aqvtk+SkkXmlD4h4+UwVvF8yOz+yDKaeL+HoyenkRiTVTK+wgznrEwsm5
 mKNUd1BWGW53m2rvKu00QkCR/MByks+2YAqdhaLdE11NgRSQq/bov48IS5D8QzkFAMjl/Myid4Q
 zJYmmm3bUloAJti/MjCM/7JmU1VzuMvVFBBYeMzRCjHNMklz5NCr1LR35R+IexsXZ/0RSYs4r94
 RQS+/Y/HA7zG3GEGc4yQv5jNSxiaJEC1CVQBepESFgIzTx32C829pNAKEoByuJ+jfLTjnyDIaGU
 2Y+zr7o4sPrCfEag24uZGLAufHyH2XY/BEnhpbmopXuBiA1rs2Q3qkC1E6Y9Nezfn+khEVVS7sO
 Mz/Lgxas3EQSeH9gQG6FaPcyAq5UW/RJxXSDaEsCb3BtvgZRieKixfi3boOSzFhQJXQ/3K7MQ7L
 wOee2q5cvEXQoH8bJbgq6jQE4q/IY+eJIH5eiR7jl2rNnbi+c8f45lXPF2tggCYL+gDTwwHR6kd
 qlOkDLFsaw3LSBbe53A55EWyfMEjO2bj8HsoB3mixGDEWH/P4t7ehH21iL5yR5HSNIGzq3qko3M
 8lUWtLUJ4VoPgP5aYWJvqHL2WrFNZM=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_174030_909420_164864A1 
X-CRM114-Status: UNSURE (   9.13  )
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

This patch will depend on two clock series a) fix building for modules [1],
b) refacor common ccu driver [2]

Link: https://lore.kernel.org/all/20251219012819.440972-1-inochiama@gmail.com/ [1]
Link: https://lore.kernel.org/all/20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org [2]

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v2:
- has dependency on ccu common patch
- fix wrong indention of DT docs
- fix kfree() missing header issue
- Link to v1: https://lore.kernel.org/r/20251211-k3-clk-v1-0-8ee47c70c5bc@gentoo.org

---
Yixun Lan (4):
      dt-bindings: soc: spacemit: add k3 syscon compatible
      clk: spacemit: ccu_mix: add inverted enable gate clock
      clk: spacemit: ccu_pll: add plla type clock
      clk: spacemit: k3: add the clock tree

 .../devicetree/bindings/clock/spacemit,k1-pll.yaml |    9 +-
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   13 +-
 drivers/clk/spacemit/Kconfig                       |    6 +
 drivers/clk/spacemit/Makefile                      |    3 +
 drivers/clk/spacemit/ccu-k3.c                      | 1482 ++++++++++++++++++++
 drivers/clk/spacemit/ccu_common.c                  |    3 +-
 drivers/clk/spacemit/ccu_common.h                  |    1 +
 drivers/clk/spacemit/ccu_mix.c                     |   12 +-
 drivers/clk/spacemit/ccu_mix.h                     |   12 +
 drivers/clk/spacemit/ccu_pll.c                     |  118 ++
 drivers/clk/spacemit/ccu_pll.h                     |   57 +-
 include/dt-bindings/clock/spacemit,k3-clocks.h     |  390 ++++++
 include/soc/spacemit/k3-syscon.h                   |  273 ++++
 13 files changed, 2359 insertions(+), 20 deletions(-)
---
base-commit: f2e01863fa4ca97dfd4b94654cadd805d34cf986
change-id: 20251204-k3-clk-db2018389ae3
prerequisite-message-id: 20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org
prerequisite-patch-id: 273ee04bcff7701d6645e78566d8624fd8a2cbd9
prerequisite-patch-id: 64047b0d0d79d767c9686cc7876316d983bea4e6
prerequisite-message-id: 20251219012819.440972-1-inochiama@gmail.com
prerequisite-patch-id: df430730ed961011cee5c5d47b7ace84b3c5ebb7
prerequisite-patch-id: 64003618c33be925602e46b7543f2c13d3f36474

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
