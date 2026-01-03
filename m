Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D13FC6175
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 07:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zA0H3iWFMGFMEksWOyFqiJ5Fbv4WQ+VMLUf+30B9EbM=; b=G0vkGdKHJ8BHpO
	AOHxzroIdA0BpB3hdUoQgfHJy1xWCVIt1Mu0Cw3lO2UsdoK3P0QORRUN68mH1LeX2eE54Lm4G+wJm
	efVWtqsCPFq+yYBgDk9BHXBrxz7JAwouSU5YXqhyAu3hWv/kWxuK7S874FSpK9bKoTjEu+gJcBUPD
	Gbr5Ink7ELza1py4i9tzmu7upC4SfkmzNW6y5jXoVWhVZCRzHGZx41khtHlc2g4NxQLcHBZULNepv
	pDkqvbRz0spx+X9zVNn8xCXqGJYVVD/Jyf8kqKEQxcV6cXd7ZbnEO0nH0ZyvUU9v5jRxKEV9RJxSf
	bqDJYMfRZjwV9SLfQ/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbw2F-000000093So-3vDe;
	Sat, 03 Jan 2026 07:26:51 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbw2C-000000093SV-3wqE
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 07:26:50 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E96C7340FC1;
	Sat, 03 Jan 2026 07:26:40 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v3 0/4] clk: spacemit: refactor common ccu driver
Date: Sat, 03 Jan 2026 15:26:11 +0800
Message-Id: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJTEWGkC/23OwU7EIBAG4FdpODsNM9IW9rTvYTywlLZkF1Coj
 WbTdxepB40e/0nm+/87yzY5m9mpubNkN5ddDCU8PjTMLDrMFtxYMiNOHRIOwHu4IpjbFUz0Pga
 QI5puUKrjYmDl7SXZyb1X8un5yMm+vhV5PY7M25x1lU/Nt6s4kkTVCsHVQIDgQjSL016fZ6/dr
 S1l7EtbXF5j+qh7N6zcQRD/O21D4DBOJDXXCnvC82zDGmMb01y1jX4K/T8CFYHkpVMC5UWM0y9
 h3/dPXMw+SEEBAAA=
X-Change-ID: 20251217-06-k1-clk-common-8d1c57995047
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, Yao Zi <me@ziyao.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=2UBPL2Yd1+yxV1XJdoGNsQHljb9tjz7tzWyKUEq7MBk=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpWMSgZ6lZNd20/VmyN2CFgIClwQKAnNpSevaIR
 JVJEjknD9GJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVjEoBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3VwRAAm0p9O+pUjjGDtkLvJfflAyKfliyq6r189UJNV9UCe9L2A/kvs8pg+
 yiue77H9fhmQOfN5Z2ZyIhm2nEjwynB5UBIllXwy7pfxywS9riRRCW5l3UTZNFctJ8ivKJnun8V
 tAf5AaT/XFvqAehJ2Qhdv7hmKW3rVQxX03onWMYiq891fyG3BTkO4GesWcafDiPoxcQQI8S5Ili
 moN7ZUWt+HmgaiBkARsyHrqlWPWaqpgoVEgq+XIJZI2yMbogNC7EOY44eDWLn4qWezvpeX1O+X+
 33tJkqayEJD2parIsC67mZoVY5oRXOzhudJ+Rf0EK77ESvlUy6ZA+W8dDIvYprRQ60P8V4hRltf
 VSVwUTTYx519UR4KqCZUSQLo7G79HSQxITepyv4CC1/wBh2IYT5gLoDS/5UPPBmweD6vlqNpj2X
 PSZmtm2ixk9QbDk1eDN2qVSI3vnaURRASGg5FgDyD9oyWAAMg9hIeArk0yj5kf7zSuDYuFI6UCk
 SrNPeACxnKIisDNnk3xNWarkt3B6ph8nHwRZc6l2Oc4eg90faPaxRoh+0pdBn9qlbj31/TyW2+i
 LXaB1WPi1P8YCEE7ip8hrOHPqhNc1ZclsNtSlDGPYESX793LkP63vWzSSR8yEjWXxamVFREeSYc
 2VATG8HPTZ9/UZh7ksrvaSXIRMZtBI=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_232649_013556_C89A10BE 
X-CRM114-Status: UNSURE (   9.72  )
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

The goal here is to refactor the clock driver to extract common part, and
reuse it, so in the future, we can maximize the source code usage once
adding new clock driver (specifically, for the SpacemiT K3 SoC here)

Since reset driver register via auxiliary bus which requires a adjustment
of the auxiliary device id accordingly.

This patch will depend on Kconfig fix for building modules [1], and the idea
come from K3 clock's review[2]

Please note, Patch 1 is needed for both clock and reset driver, so extract it
out as single independent patch. Then it can be pulled into both subsystem.

Link: https://lore.kernel.org/all/20251219012819.440972-1-inochiama@gmail.com/ [1]
Link: https://lore.kernel.org/all/aTo8sCPpVM1o9PKX@pie [2]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v3:
- drop reset macro, and have separate patch for changing reset name
- extract common spacemit_ccu_probe(), leave SoC specific change out
- improve commit message
- Link to v2: https://lore.kernel.org/r/20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org

Changes in v2:
- extract common header file which shared by clock and reset
- add SoC namespace to differentiate reset for auxiliary bus
- Link to v1: https://lore.kernel.org/r/20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org

---
Yixun Lan (4):
      clk: spacemit: prepare common ccu header
      clk: spacemit: extract common ccu functions
      clk: spacemit: add platform SoC prefix to reset name
      reset: spacemit: fix auxiliary device id

 drivers/clk/spacemit/ccu-k1.c     | 191 +++-----------------------------------
 drivers/clk/spacemit/ccu_common.c | 171 ++++++++++++++++++++++++++++++++++
 drivers/clk/spacemit/ccu_common.h |  10 ++
 drivers/reset/reset-spacemit.c    |   2 +-
 include/soc/spacemit/ccu.h        |  21 +++++
 include/soc/spacemit/k1-syscon.h  |  12 +--
 6 files changed, 215 insertions(+), 192 deletions(-)
---
base-commit: 99735a742f7e9a3e7f4cb6c58edf1b38101e7657
change-id: 20251217-06-k1-clk-common-8d1c57995047
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
