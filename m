Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307FBC61CE3
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 06:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqzylrnRbI1tqaxSdZZp/Wje4cxoTgDdE4LA2yq6OIs=; b=tSeeHPENLs+YXb
	bceTzSgZn6/X4DJzDMth9jqpfml4d3GGd/IBha4yEzwlQsNzrJ8STUGc6svcRrOIqgLlDWahLAA6B
	+8ab2XbkkQlRjVhMrMR+OX+sLx2VUPNqBLrJtBNa1eCxZwRPAoeaNd3fZJdWZwtedJre9TSnp+bDc
	Bjmg5VNweHEjLp27Dg0aO7dg53f3iP09qfC2MdOKn273wVWGLld9rpQepTxWX2Ox4GW+XGIdLnJ6x
	cHdQEEaCG5rIJoJmd5B/4+LVNA/rdLFaNxWRUj5SFwxy0hENLvu5zifpgjR7beYmkUSE2Dn1w3juS
	VAsyfMTRTKd5AkOWlFQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wykzK-00000000F4M-0Kdt;
	Tue, 25 Aug 2026 06:50:26 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wykzH-00000000F3M-2bio
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 06:50:24 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c15d47266baso504946166b.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Aug 2026 23:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787640622; x=1788245422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DHRKCZWzr+4UjNiYIgWaDbN/EmFdXfmYAEs5enyKkY=;
        b=cVkmhvHeE2oAQZ1kEMv6UOr4Uqmj792fqBqeIrCvJ0L3a5uXV37UjCwW78TIbF/m8C
         GLo93AoiIoj1dEBWQG1wkvxedk8fR6n3paB/j4mjzCJatQgoMUJM0IUEiOPErIZYOv2s
         Gor8PsDDRZU9kqYHETsbWa1BR62/4VV4echHEh7lqiIXAdzW3f2AyIk/qsrQqrMaP46n
         2umMfA178O9qgwvSFpPdQSho7JQubjV4MywHGm+tvYBZ/N3hTwMqhkwd6+jVQLVyYJ/i
         QHlry5Al/Vg2b+6QhNyBSjZLEXosM3psaOvwWIX8aItSCi+uYuWTwOo7AM68tThNhdcV
         KTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787640622; x=1788245422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DHRKCZWzr+4UjNiYIgWaDbN/EmFdXfmYAEs5enyKkY=;
        b=E9SKfOS+uG1cR7pS2bi5ReFZyxVX4FQqyfdi5nyerJBjQUSddTTudgjGOApqSvz5lG
         uz6wSsdU45ckZCVGku4kUNIPSovuI4KiVkymnZPqOj0hQpmT7o4/wysUJKx84GFSoebi
         e7eT6B3jPt15k6KFCBdI+NVqwNOX8txRW/M5qr49E0NkMs4AN807z8qzawMfC7JdHt5B
         xIDVLKeiK7mCkwZFhE+2Q2U7N5jQtYUv8DT8oizR1VTo+t8WtKvsTpMKeBeP99xrJIh7
         01D2CYDf8swU88408YS9iHESWbe/HXqmy3UoS69YxSXULGPfIX+ttQf79DvRsu+0ak4m
         +Pow==
X-Forwarded-Encrypted: i=1; AHgh+RqWgDfHMAHd8Zuvs8mOoePfenb2XPvSIQXbKnc8qWuvJhHShfdkmwdWPhcIqTE59UG33kNwu4nzHkOkPw==@lists.infradead.org
X-Gm-Message-State: AFuF++nOIN58bakaDLN8Dihs3+a0CGaBKnv3LiG1kNxlGrLjm6rGL9gW
	y1oeN1g6PzbEWTT89H4QhIqGd8TohxvQJ73B9LzIJUYjcadqXXoXThCN
X-Gm-Gg: AR+sD137zxcv9dGirdhxP6uUsZaROswyDCNuwMuhbjU9cQkjbv5+1xaOuOhg17/ADp6
	FcayZlPYphHtBzkqu18/PKYV4JbiKgHSxFq1mRuyGU/3+2rrDs8xMv5Rr8Si2a4ctHC7WBRHwuY
	x/Mx6TwPR9xaqkXYX4x9So+1uRDwHVfVB0xDE/fNtDNt8N++8+w8kXWCBrSLlPzB/+7rysbnJrV
	sl2kyQ5bKpJbJmqp8BYl9gxR2qP19R+1K96fzEewXVB+B0VsxK2lSL+ZGPhAv6FCu0FvZJfgCnL
	qe8L/61Mab5sR4FjMNjTbDdzuPGKpFD+HIczBZG8hGR5j1MQReZdDJ0IXhiu5YT8LPYizyoTX0t
	1kAtJJcxRA9E16luODx0d8EXIU31pfrTonE8RyY0cFHCX0ErwJlt0iArd6jdf3Y48uGkyYaCLo2
	uPhPSs7RUVkrKHBC/Zg965NnJ+kCyeOs5XvB244+n0jQ/U9rRm2E9T1tKI4ynwkmyJAwa35Lm4W
	JsKWxIHZ/gd4P2J8wEkP2r0i9CKGqwhBYzRZpKTyw3EeM3LL3gEDCUb7YmdPd6hQ/zQ
X-Received: by 2002:a17:907:9304:b0:c17:cf99:6154 with SMTP id a640c23a62f3a-c24e5b28879mr442783166b.16.1787640621284;
        Mon, 24 Aug 2026 23:50:21 -0700 (PDT)
Received: from GOLDENAXE.office-radnicka.localarea.network (c82-214-103-66.loc.akton.net. [82.214.103.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1658627666b.42.2026.08.24.23.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:50:20 -0700 (PDT)
From: Bruno Banelli <bbanelli@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Yixun Lan <dlan@kernel.org>,
	Ze Huang <huang.ze@linux.dev>,
	Alex Elder <elder@riscstar.com>,
	linux-phy@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bruno Banelli <bbanelli@gmail.com>
Subject: [PATCH v2 2/2] phy: spacemit: enable K1 USB 2.0 PHY by default on ARCH_SPACEMIT
Date: Tue, 25 Aug 2026 08:50:07 +0200
Message-ID: <20260825065007.69353-3-bbanelli@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825065007.69353-1-bbanelli@gmail.com>
References: <20260825065007.69353-1-bbanelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_235023_669357_E358496F 
X-CRM114-Status: GOOD (  11.63  )
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
PHY_SPACEMIT_K1_USB2, directly below it in the same file, does not.
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
index cd7ae48d8..b5f36621b 100644
--- a/drivers/phy/spacemit/Kconfig
+++ b/drivers/phy/spacemit/Kconfig
@@ -22,6 +22,7 @@ config PHY_SPACEMIT_K1_USB2
 	depends on USB_COMMON
 	select GENERIC_PHY
 	select REGMAP_MMIO
+	default ARCH_SPACEMIT
 	help
 	  Enable this to support K1 USB 2.0 PHY driver. This driver takes care of
 	  enabling and clock setup and will be used by K1 udc/ehci/otg/xhci driver.
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
