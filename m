Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D20E668AA
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 01:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YW7f5yePAmAC+7DnG+9KF8KrkmlSfmcxsnerFLX/CzA=; b=aeJDwON4rnXIdR
	8LHJJnrVUt/sJqERNgnv0s9UnkiX7OLalZOSjpKwM9u9kft4mzLZ0xZ3RLpfBo/YW1aYnD99eVurJ
	rAVo5O/3Wa+EZTEIZvpaE47Pkvelwh4azy6myTYg1g6cwcZWlYDxxD9i85oUgJMCRf3mv3GhNtBB2
	Fb66KCQKLpJycMCP+VDyuyD/MKn/v/5xM6uT7ZCgwp8WOiy26/b6Mx+0gLAyPrkytf6VP3I5rtoAT
	8uE6+BxNE78IFlJ+JhXZl4zleK7S66mPE/lKjnzxkxUw7WriHt15GDMcgjsQVhhZAGFo7gzJquemC
	8N63FGrE8scwZthGqWPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWlVb-0000000B9kD-1z4H;
	Sat, 20 Dec 2025 01:11:47 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWlVY-0000000B9jq-1dt3
	for linux-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 01:11:45 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 588CD340E69;
	Sat, 20 Dec 2025 01:11:38 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/2] clk: spacemit: refactor common ccu driver
Date: Sat, 20 Dec 2025 09:11:18 +0800
Message-Id: <20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALb3RWkC/y3NQQ6CMBCF4auQWTuk04ClrLyHYdGUChNoq60aE
 8PdbcDl/5L55gvZJXYZ+uoLyb05cwwl6FSBnU2YHPJYGqSQLUlSKM64ENp1QRu9jwG7kWyrtG5
 Fo6Cc3ZO78Wcnr8PRyT1eRX4eI3iXs9nlvvq7WpDsSNdNI7SSSMgh2pmNN5fJG17r8gyGbfsBx
 Lo8TrAAAAA=
X-Change-ID: 20251217-06-k1-clk-common-8d1c57995047
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, Yao Zi <me@ziyao.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1503; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=LE5+CKwGJWaNVtCNdjn0NY23TOyRwRWlfF4GEP2w9qo=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpRffAcyYEULrDYZEm8BPhkKkxwSgkKVyx74t9q
 n5TlkdSKsaJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaUX3wBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+182w//dkCcQzR+idlS9IC2GC9rh1ArJiMPYgJSrPAUuDDrhtALE0tTfudbw
 A/2ftD1sx48cPKGvrj+ni/Z2jJ5KmX5MNZ114yGbpGNPdrfPEE1gLr5bpW/gr1VH1yuq3dkOTXb
 FtyX8kJQD9hfQ+k8DiRvIlXva744zCgUmjtN/fv5bc5XoiLekzj20l8G9hRJWAc1l7nAlzT8EwV
 i3F/jPNk2J3w+IFqb0ASUnO2wjhFJvMgW/44yNYLGZ30oLblLXBsJgbmPjIHxjlLYIYmzr1HXxa
 cdZwc46gGBwkmfcUfBwsFSY5Vy6IXQZ4ZOsZGRYZfaB3zsiWySF9BD+ibZ9H0of4w9SQAgr6nuR
 spqJDs+dQAD3nKOvQj5otG6vHmbrAokbOkZTWlYmsPztUhxj0VFYCqLm3k4wtut8w8W/3Uv0Z2r
 yPKP4s7s/e23mwU23k5octQFBC57fdSZQe7G6VLLMX/lo/AHkeN+6xQQxZwKoKK9e36IU930+sb
 OGOz8b4xj8H0BP+yBQ9qsoOMxq29+7/xND0It9Pglek40GIdxs2MGnI8UpZQQbd+MDhblhpnOrz
 XLkB551pRVLxj0bsF3vJXaDNCaju8D01taFEhGYu3S344RIrF74vewTM+xyRONDHJvVDdvB/SVc
 wM3Q/QPQ5aDcOm1StHHBsu6m9A/7Bc=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_171144_462295_28463E91 
X-CRM114-Status: UNSURE (   6.79  )
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

Link: https://lore.kernel.org/all/20251219012819.440972-1-inochiama@gmail.com/ [1]
Link: https://lore.kernel.org/all/aTo8sCPpVM1o9PKX@pie [2]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Yixun Lan (2):
      clk: spacemit: extract common ccu functions
      reset: spacemit: fix auxiliary device id

 drivers/clk/spacemit/ccu-k1.c     | 176 +-------------------------------------
 drivers/clk/spacemit/ccu_common.c | 171 ++++++++++++++++++++++++++++++++++++
 drivers/clk/spacemit/ccu_common.h |  10 +++
 drivers/reset/reset-spacemit.c    |   2 +-
 include/soc/spacemit/ccu.h        |  21 +++++
 include/soc/spacemit/k1-syscon.h  |  12 +--
 6 files changed, 205 insertions(+), 187 deletions(-)
---
base-commit: fb964a99ad6848a9022c6909365aad23e177387c
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
