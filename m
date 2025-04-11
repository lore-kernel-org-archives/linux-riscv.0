Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBA3C369A2
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 23:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F77p8ofJqh/PJ6TjTk47cVzxgRuOV7KR0F69Mui5RGo=; b=BQJ/18j6HMB8FW
	arHuuyMS9+vJeYJg2lOy3JLk0xhxXeP2zovy/9TJqOYzCLbn8CrHoQySiU+iu0b/TwessRvBa8bSG
	cH2XcUA4hfy60OGDTA56lvDefm4LSke6UVe9+tfFn6JHlDh2jiqQfxLhEvhb5fdJX1qYUS+1T6kwp
	9AsC1I48r75qkvpnYk9rzx3R5MKWh0d8gIW52gvClcloxi/oXW4oRge0mrwuIpYgIzR2Y+A7alJYu
	KHkRvjvcWK2sDFZ7AoMaZC5Wy6BZpy0LH//Br+8TbfyR9o34HrY9ARwDk7toTh0wgx2PYW2jSnAhn
	NKJ9gjG6vLwqvBxvtMsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3NrO-0000000F5M0-1Jv7;
	Fri, 11 Apr 2025 23:32:34 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3NrM-0000000F5KY-2nwV
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 23:32:33 +0000
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8BDB934386C;
	Fri, 11 Apr 2025 23:32:25 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 12 Apr 2025 07:31:30 +0800
Subject: [PATCH v8 3/5] riscv: defconfig: spacemit: enable gpio support for
 K1 SoC
MIME-Version: 1.0
Message-Id: <20250412-03-k1-gpio-v8-3-1c6862d272ec@gentoo.org>
References: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
In-Reply-To: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=706; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=KkY5WlJ4z8HcmbXSsfi0mS73OzuDsI8TBtLL7HqJfoc=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn+aZrd4vRG6XqpLripBnZDvJyHho8lTGa0XU5G
 HZA+mrwTKKJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ/mma18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277eDRD/4iuneZSWkd1X/wn6
 GSbkkKcY6zd4OMaXi5buW7nsTd4NPDbKfnytVoaHnh3QXf2iqVYD7+R99xxQdGJT0tCS6MuodxB
 rp5IahQFg2jtVGkGmygTkfRpa0pDo+Z4HubQNFt6ER4LplBauRVHgulGA+QzTMcw1cw3dDeyQ4U
 yj+zpxCJE3IEQGhPTye7EmW/2flfO9g/B0/R24FDrZIFh94TG7W0PccMNLUWkbYyfQbCK8QssZc
 7rQxRapwjzK3qzQJLu28S1uR/mKyE0wzg1aGn/pMbXF2hy55SL8B+/9npBhukM4qSV7hiai2VPt
 ayoMScxtyMSZcabMPUd7oaSFTUmD0BXgqPyRNriiPjVF5P5WLxHkSm1u2inWQg3DldCAga4YRdj
 /wZ3W8Iw6o+iBg8vSjFg9BTtbzuZS6xo/d4JmM0sJX/nUqGtaILsOJgML1mLkJ6wkNWmbz48pTl
 BlsPY+sml575pDivZB/uqH3DpZBagnOhRI07EezrfM0ozHXa0+A6BtHCqLLYRwlz7mO7Z2H0nW+
 M0UxIj8Rn7yQu7ogw7p5EqbHizQA+CHyMtgDYN4jyijQ0D7XghOIJGPJz1PZDVjtNyhtC87c7ay
 5bhuEnBSY2xObSECG28XjAvhIS8+24/nyRKCH7vTwly+NkXb16384xCd8MmWvQou7tIw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_163232_737123_865DFFB7 
X-CRM114-Status: UNSURE (   6.95  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable GPIO support, in order to activate follow-up GPIO LED,
and ethernet reset pin.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 3c8e16d71e175e0e4c27136c31761127ce6e1602..b8899d59dd345c50d877829c05d0330f2986895c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -169,6 +169,7 @@ CONFIG_PINCTRL_SOPHGO_SG2002=y
 CONFIG_PINCTRL_TH1520=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_SIFIVE=y
+CONFIG_GPIO_SPACEMIT_K1=y
 CONFIG_POWER_RESET_GPIO_RESTART=y
 CONFIG_SENSORS_SFCTEMP=m
 CONFIG_CPU_THERMAL=y

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
