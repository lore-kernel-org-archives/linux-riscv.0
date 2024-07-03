Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DA6C30653
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 14:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=32tIIUH/FylW804rzJM/AwZKob1+DA4o9SDlKUpOkq4=; b=ZfE8FOW1dvnRTD
	sh2opOwwX5fWbmWoLe+PhFjZR3U1l0RZ+WYIjCfQtRR5PqPCCdhFnyzSxTjKbawiFgtfX9pBlZ3oE
	w0ns1nQVRky8k4CqNDIR6dQtWfAw7TpfgZPk6ueVc34v5q9JiWPcOlHa4c/yPJLpBhw7hq58szp5G
	vWw+FLMpa/S4PS0bZbjXswhPvnqPLJH5LuUrD65XfUBxbpy4CkZSigWI26FEj312O8RnAS+eeJ/DT
	2TPB7Scfw8ZBOjntDjDHPzctLU0JV7X87sXDfxApgYdwa8MN56qVA3kjGgV80DgCMCdYO/5fOGcVI
	D3XbKKs5n4aaj8xtJnAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1Qh-0000000AZTD-0xf3;
	Wed, 03 Jul 2024 14:57:55 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1Qd-0000000AZPj-3dbO
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 14:57:53 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 03 Jul 2024 14:55:13 +0000
Subject: [PATCH v3 10/11] riscv: defconfig: enable SpacemiT SoC
MIME-Version: 1.0
Message-Id: <20240703-k1-01-basic-dt-v3-10-12f73b47461e@gentoo.org>
References: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
In-Reply-To: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=750; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=0Z/hU8lufpDC3bNS6gDANBAxUb3C0VZ+rOZaNlFzgAc=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmhWaVu+0ghizB0jAfqPMoCqrKBWbOswgvQQ6YM
 ipoKFieAT+JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZoVmlV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277S8qEACdquJhrCpCrqi+ZG
 TqTXCTzTd0TrgGFczcCYM3RXTFKO050GasJlIbtdsLPiTde16mDThHZE2M2v2PNJbH2lxtuJwtX
 DlkZ2slMO0LoLRsHSjEDYDXBODuuJ+cxrMPo9Ew0vGa4hW0sC9BoLSe7eZYJ0MWBtsVVSkVsU7x
 FHbqv4fmOWb5wv/fAjmhdi7/1fkudtclumwY4IIB2XqUYIrfQzuu9CNenf0Dwf4U8iuGxSgGD3Y
 4fkXLnBpQy/g5x60dqhyJEA8jX83ubRQuwgaD6Obfp/DeZ64O9NoLmtWanT8izmCvLz8Vnh7sXQ
 fsWiG+vNByI/LXz9fZR4e7tMyLTfDSwVlx5xLi1DIhjVv7FkAunLESWEJF/z5v8F6U9556KYnBt
 eS3FW6VVJ26ifZ1p7tQeGYhhcyrIeGc2SoMi/zHJmZXZxnH4QqfvMT2sz4xL00IOedc0wlHQ2E2
 3xJBN/k6wetjULaaCLJlbRDt8kUewA4JU2kxrd3RwKodKzykgL4QBVI96dYOjOxDdfQz9MWH/b7
 hHrehF6KrEJgH3AVDTC7uyOfWDbzWg30eRKo3vss0RzF4Xe714FYJihg1RJGPafncLTu11+fFtG
 lRK9xgSB7c0rYjeGRlkfQgbYTZz4KmWGAbYM1vhU80IPjq2AC40KwE1d+rgEowSiJy2A==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_075752_001860_73B424ED 
X-CRM114-Status: UNSURE (   8.13  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@outlook.com>, linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Yangyu Chen <cyy@cyyself.name>

Enable SpacemiT SoC config in defconfig to allow the default upstream
kernel to boot on Banana Pi BPI-F3 board.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 12dc8c73a8acf..5287ae81bbb78 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -29,6 +29,7 @@ CONFIG_ARCH_MICROCHIP=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y
+CONFIG_ARCH_SPACEMIT=y
 CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_THEAD=y

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
