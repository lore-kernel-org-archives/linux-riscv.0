Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7581C5DF9C
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 05:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Yd9KtzHratQoAEUsZjA8iig7rIIZkrKOu1SYyfXltok=; b=PbkqmgJxqQNviH
	W5iAHDtPTr61M8EByo0gwaPUtb1/RQ/LiYU3ZpgtBiiRvmae5zYc/r7YumQGu0SrGYDecObOzX7iI
	Qq/YKw68k9fLBtJa4vJW3WJOkF+RZy6f8j6i3uFuJhB+1poOrRD6IUpZiEsuJLIm7o6XuH0DAI0UQ
	StSVIft4dbHIzxd4jJICfuvs614GMl5pM6maqFdBPucYEVtvQSxJwQeM4h72AYPfZEekbdzpH2GVv
	IhYAO879Y9XlwC5Uu0dClJ5Gc1l1bDftP+CldzBreB68uYScO8v6ZcP1g1LPjYPV0u/jOwtPPkMYx
	cbrKPSZGJh38+pkmV6ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyjbs-00000000B8N-06tO;
	Tue, 25 Aug 2026 05:22:08 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyjbp-00000000B7b-1R9k
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 05:22:06 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c15d47266baso496792766b.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Aug 2026 22:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787635323; x=1788240123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ryfq8ZlJaF8dkUkfOTfrmP2SiE+/6PCtICjVZMb1cA=;
        b=IZtAFzMNg9zsZ/wCMGbO3bneqlhIamnLKzf/Oupf8OCVZeqTsPXul6H+1JXqT9RNOK
         way/zCY7EpXc5lkR2s63fYbjI7eVdXlu5vd6X4IDpYO3TpOqgaa6vLiUFCZ3y/+nUBSA
         aF4Y4ZM57SNUIptI9wQJJREMbfUaluVK7ab+RflHTu/wziNwAIzO6+dwpUxAhphha0Co
         biRj0wWROvTwfJ4xVN7QeP+KeuLVBe5u50fviKVvGfRZRKteigz+8QlbEyEgMkgE0tpO
         ak90h+MqTKxf3sljmqDr4gfK23fMg4iUvRE3avOLWPG+M2/+wCCgo4OsFGfoZWf0NaZR
         SBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787635323; x=1788240123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ryfq8ZlJaF8dkUkfOTfrmP2SiE+/6PCtICjVZMb1cA=;
        b=CzYSQ0+W77xGObLbdH41SHDlQr15u7ufq/fOFOxTD1AlaIq9DozW1pmYnsTrilRhxi
         bMptunu5O+jNxKVIThkdOwDvWmWyd+sOI13/J5iWDun6hvrhBfs4uhK/caqbM9brn2Oi
         6GeqX2l6JpCdTEi+B38oUc/FE8a47hEGgsiKsbXa+A1zREXezmGM8x0Uhww1GvOo3vuO
         7vLP8dHtTeMvHggwobmtfnLlOuTjkwlrDRbMomQdceRAkYfSK+Sh1TTaW9xqk4DfgW8y
         cI9GhF9KKOjbLAY2ln+ROqag+IjZamN7KwBZ/joIs4twvuhgv3+6p4ICIjAcauPw5unW
         tEjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZN0TGsZRS6oKjJWwMvNDXFCAf/nJK0lP+5CdSBO2ayNkRNnXyORzjwVWbVQuv4CLVU1RmRMrPrRcjHw==@lists.infradead.org
X-Gm-Message-State: AFuF++k1aHN1OSs3cLc5ejxLPG9fsuK7Jds6/1xhsVkWaGOncfAAyLjP
	ZJemaB6Dl4O6V4sE18UBP3o8ZF9HG1KdlZzzyMWNg5OWLs7GwLNY0L7yfHRJXNwy
X-Gm-Gg: AR+sD13N6KHWl76RKhYh7LBdbfRDGjT0oesOi5tMhsp/gH12+1nPvrE8/qhy9n2JTTu
	OhszWBbgICPo0i2/wMGa/CZTyfmeg9IYa4+DV9tDASNMpmzS/81OYKvOSTn7KNA6uGMRd0g7DKu
	azgNZyLfZuphkdP81ZjV/bCKdIQP+9VncmL4ufVWOvLIVaBfBotJKs391SmoRGqXoehCaSNo8rC
	ajkbm7F6WOu0mgDm+AK2HXtSWjt07FydKNWbVVLu1U7YXWUfGEfS2FbNVcoSA88hT3kw6LZMAZA
	NwipcxYzl0znmbIYDOzqdh5lln85hjYrcbpz0atG0+ICxh8eDRXUip/y3+mAF0T4ij6V4nMGqg/
	+czMeAMEBHxSqum4qAu5eE511OOawRzuI7lJFEpaZOwbrKa4FqWfc9KhYEiM/M4UCYK4nydz64j
	WOZ0bzKz0V06rxMmV7T7p9MbK7g6Ed9oO91bADTmibeRilGbO8bPVWirF/8YYML9qVcEMyQiz2D
	UPOGQ7+IuqZUEKC1mBWcKBKEF28WkqZaodSl7hAa/wA5FIVT6WEAfYAFg==
X-Received: by 2002:a17:907:8995:b0:c24:4128:c19d with SMTP id a640c23a62f3a-c24e584dc37mr325956566b.4.1787635322840;
        Mon, 24 Aug 2026 22:22:02 -0700 (PDT)
Received: from GOLDENAXE.office-radnicka.localarea.network (c82-214-103-66.loc.akton.net. [82.214.103.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606a8fasm1733198866b.8.2026.08.24.22.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 22:22:02 -0700 (PDT)
From: Bruno Banelli <bbanelli@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Yixun Lan <dlan@kernel.org>,
	Ze Huang <huang.ze@linux.dev>,
	Alex Elder <elder@riscstar.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-phy@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bruno Banelli <bbanelli@gmail.com>
Subject: [PATCH] phy: spacemit: enable K1 USB 2.0 PHY by default on ARCH_SPACEMIT
Date: Tue, 25 Aug 2026 07:21:58 +0200
Message-ID: <20260825052158.66367-1-bbanelli@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_222205_397234_02F19815 
X-CRM114-Status: GOOD (  11.39  )
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

PHY_SPACEMIT_K1_PCIE has "default ARCH_SPACEMIT", but
PHY_SPACEMIT_K1_USB2, twelve lines below it in the same file, does not.
Since the symbol is also absent from arch/riscv/configs/defconfig, a
plain "make defconfig" build for a SpacemiT K1 board ends up with the
USB 2.0 PHY driver disabled.

dwc3-generic-plat needs that PHY, so the result is a kernel with no
working USB at all on boards such as the Milk-V Jupiter, where all four
USB 3.0 type-A ports hang off the single dwc3 controller.

Give it the same default as its sibling.

Signed-off-by: Bruno Banelli <bbanelli@gmail.com>
---
 drivers/phy/spacemit/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/spacemit/Kconfig b/drivers/phy/spacemit/Kconfig
index 5fdf18fce..dd74a3faf 100644
--- a/drivers/phy/spacemit/Kconfig
+++ b/drivers/phy/spacemit/Kconfig
@@ -20,6 +20,7 @@ config PHY_SPACEMIT_K1_USB2
 	depends on COMMON_CLK
 	depends on USB_COMMON
 	select GENERIC_PHY
+	default ARCH_SPACEMIT
 	help
 	  Enable this to support K1 USB 2.0 PHY driver. This driver takes care of
 	  enabling and clock setup and will be used by K1 udc/ehci/otg/xhci driver.

base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
