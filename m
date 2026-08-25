Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAE3C61CE3
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 06:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+x4LYZXo6CCuozLhYiOvgEf3gdzyYTOtocz7YSkBHg0=; b=EIFZ9Pw+kRX9r8
	Ri6Y0rV4Dzo+P7aa3m2tEse5W9wRcnzJjcgMGtQClxmURAq42chIK8aBgE0YogE3NrGPtscjVK/+q
	4WpIOcr6dlJMTkXwhGV/0NlRAw4Upxwdjx36u4DbB7z4IVP9I60WkTAcuIcUID7sW+KEMr9IhdSiz
	0/OyBhDQZge198bkjCX1cpQ05+mWwcpKdM9FaZ6SiOQyiuBIj+8QvbCp9kWrBvrpG/NE/aPHbwHDX
	WQYlh9VGGgM7vZWYXp4u+W2/A1uy5GlBVZ8xcBxXZ7inkyv6sCRgmdA94Bx6z7ullfUEgMYI+35AW
	93wIxNZCUS51AttN+Lww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wykzF-00000000F2p-1YPz;
	Tue, 25 Aug 2026 06:50:21 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wykzC-00000000F1M-0Qs8
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 06:50:19 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c15f020a223so643809466b.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Aug 2026 23:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787640616; x=1788245416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9QzWtIe+gxS6pJym3F3V1dPDGFuF/K6nAoOQWMJ97k=;
        b=FccpUO9mUd23vQLRuipVkQZa41B0i31AduhiFcUI5G/kQoMaeEmzjGvm/85XPLOPFz
         9Ry/EtO3iXhowqjiZ7aRB5wUnI+CZ4LUMZS1RC7ir2KGWGuR5QkbVfOruiJnDh9cW4un
         8RohHMinbV7LI19UlGdIl2DHcd6ZSyhEQnJgYoLcxqtwB9YkfEZXN2ufxQzGpn8p2jmR
         dn/zxWWNbU3y6hpx+rFL/XqKwFv8wOm0sEUzduXTX/l9M3MGdKhWSk/o8HKU114Vi3/0
         TtUgxN5ZxrzfFK9Fu6BZYzB7venuCNan4MMjYGj0qhdad4hPkbXxfLV0fgrbp2SZZTnT
         sZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787640616; x=1788245416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9QzWtIe+gxS6pJym3F3V1dPDGFuF/K6nAoOQWMJ97k=;
        b=AK1MZzjajM9rapxkAAYoLqofzv6HxCvGz0Qd9FwokfvMK+mB8reyEqXoPhPEDiB5N7
         rernxZoVt1yboYsG0cLwQmnS+1Kq6Q/A/v5TJVRqS2w5oe00QJoWQ3XTTqAkHqbkmLLX
         nKfMdyIS96voLVTui3nbqfbOccDYs1VVJQMy/nK7HzCk6KzTs7FpTjzTNKBJNu4qpZ74
         vmzHP7x7Y3frO0cN/+bRMru98hnXWSWjiyM8eZQQX8GMgt515Bra0AX0a34pAGBlNPLJ
         Z4TvddXWzOD9lIlPk265Q5y0xsrRQ2N/vHEz/jvM0cF7k4o2VORdqG+HMCX346FM+qxP
         D9bA==
X-Forwarded-Encrypted: i=1; AHgh+RrBgS8TevO/q8UnT3eEZDqYOSzZ9ifqpVbZXhrnHotgz5ENK4c5U16iU47xydXPyeteYIHmlhpzCau1DQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mVo65ODsMu6IiTTX0nqTAEUOsGrZNpRbrblUkjxHSHk7qu6Qo8
	/1QYdYX4Qp7yGFqrD3awmNnxSZgcLGNBxS2jemNCf15YY4OB2aBbjYMN
X-Gm-Gg: AR+sD13r1amnFQzefrE08uqclxV8SkygDrk5QteoqFOzGesNa4v9XZ9onDBAMqwZey+
	Lif1ia6qNmpeq18M+H988DNQPCXC2SpgfcoznjakQjtwQnYIwDDhNYtJtUljsZ6KOiJPFDAFalM
	GSLXLxPex5Oyx+hnD7hVnx1S0YeXRqdi8rdcoTPkAdLRJPsgktGgQ+BGHzFjyHTgl3Mdx9PgjJT
	9A7HbjXS6r6GfM8TqWu1Z/YNHpl8zldJOP/vpUSs1HUwzwqFQz59el939PqO+kwidTJrmQMnVxM
	zCvyqXtuuophTf54WphxY2jGQBWv4IgrmkmOaePvKHeDMO2bvcqvNoB7NGEJwcGeN/cgxnex6EM
	CCgWVfluJAaKlia0J8BikagcImHK06+He2JKg+yB6fGb1b6qywfX31fUx2NSdMCslkNmh0sWPMk
	98rI1GY34HGkRp4kblPdoSaGeODoBz7cgr5MCeSSFpye02vlLTZ1B6Zf731VdORNG3XupnQiGTa
	u5SxCYSNJfdimUTtwkSZUjDCbUpAZkgEopeS2f07xczBqalUSOyD3yTgX8cc8xzfz3q
X-Received: by 2002:a17:906:d8d6:b0:c21:34a3:4d9c with SMTP id a640c23a62f3a-c246a72174bmr2767472766b.21.1787640616006;
        Mon, 24 Aug 2026 23:50:16 -0700 (PDT)
Received: from GOLDENAXE.office-radnicka.localarea.network (c82-214-103-66.loc.akton.net. [82.214.103.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1658627666b.42.2026.08.24.23.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:50:15 -0700 (PDT)
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
Subject: [PATCH v2 1/2] phy: spacemit: fix K1 USB 2.0 PHY Kconfig dependencies
Date: Tue, 25 Aug 2026 08:50:06 +0200
Message-ID: <20260825065007.69353-2-bbanelli@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825065007.69353-1-bbanelli@gmail.com>
References: <20260825065007.69353-1-bbanelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_235018_156231_AAE55EBC 
X-CRM114-Status: GOOD (  11.40  )
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

phy-k1-usb2.c maps its registers with devm_platform_ioremap_resource()
and wraps them with devm_regmap_init_mmio(), but PHY_SPACEMIT_K1_USB2
neither depends on HAS_IOMEM nor selects REGMAP_MMIO.

REGMAP_MMIO has no prompt and can only be enabled by select, so a
configuration that leaves it off fails to link.  In practice the symbol
is usually pulled in indirectly, which is why this has gone unnoticed.

PHY_SPACEMIT_K1_PCIE, directly above it in the same file, already has
the HAS_IOMEM dependency; without it PHY_SPACEMIT_K1_USB2 can be built
under COMPILE_TEST on architectures that provide no I/O memory.

Fixes: fe4bc1a08638 ("phy: spacemit: support K1 USB2.0 PHY controller")
Signed-off-by: Bruno Banelli <bbanelli@gmail.com>
---
 drivers/phy/spacemit/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/spacemit/Kconfig b/drivers/phy/spacemit/Kconfig
index 5fdf18fce..cd7ae48d8 100644
--- a/drivers/phy/spacemit/Kconfig
+++ b/drivers/phy/spacemit/Kconfig
@@ -18,8 +18,10 @@ config PHY_SPACEMIT_K1_USB2
 	tristate "SpacemiT K1 USB 2.0 PHY support"
 	depends on (ARCH_SPACEMIT || COMPILE_TEST) && OF
 	depends on COMMON_CLK
+	depends on HAS_IOMEM
 	depends on USB_COMMON
 	select GENERIC_PHY
+	select REGMAP_MMIO
 	help
 	  Enable this to support K1 USB 2.0 PHY driver. This driver takes care of
 	  enabling and clock setup and will be used by K1 udc/ehci/otg/xhci driver.
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
