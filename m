Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B92C369D1
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 10:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F77p8ofJqh/PJ6TjTk47cVzxgRuOV7KR0F69Mui5RGo=; b=rLltRmAMWHeCEj
	4AoBkeZzf4Hoat7DQf9R3XB36vcOjo0AHViFk/PMipw1ErLGKFhX2CdOs/e3BM+VKSZWXZDEIUT5c
	rV5utLGKYk75O1Po2tHbz3YR43Nzrw04oA7wX7p/LAec75yb/MlGNsgTrz8eQ2wT63GcipO1r4eKo
	HpZs1vsp9m7LosP7FDleBmrs91sOG4MJGoVTV3r7U5512ivmGjTVE730OxkVzrFxZG5SkgnqqnNWW
	tw1YCEe4BMdrExMthbhcinKgbWnd6XKyY7M5f7jenKyYoeglMGoXAD0yiDplsz0OeLIO85omJv0tV
	LkY10Ssj4uQWMhF4rTOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7u1A-0000000DiWr-0ef8;
	Thu, 24 Apr 2025 10:41:20 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7t5L-0000000DXpW-1pQq
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 09:41:36 +0000
Received: from [127.0.0.1] (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 79ABE340BEA;
	Thu, 24 Apr 2025 09:41:29 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 24 Apr 2025 17:40:49 +0800
Subject: [PATCH v9 1/3] riscv: defconfig: spacemit: enable gpio support for
 K1 SoC
MIME-Version: 1.0
Message-Id: <20250424-03-k1-gpio-v9-1-eaece8cc5a86@gentoo.org>
References: <20250424-03-k1-gpio-v9-0-eaece8cc5a86@gentoo.org>
In-Reply-To: <20250424-03-k1-gpio-v9-0-eaece8cc5a86@gentoo.org>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=706; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=KkY5WlJ4z8HcmbXSsfi0mS73OzuDsI8TBtLL7HqJfoc=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoCgc5jnsk1zmpU0pul+l9kHKpeFFACs0CNnTBp
 h9UJsUCq5GJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAoHOV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277QyoEACE8VmsVGRTeefDvb
 FhSZ734jG898yX1+/8BQl3+/fLZf2PK8e6L3Cz1kO7ijGMtVwjjjWNJcqnlTRLKTSd59Z49Q2QE
 5HGexZUZqXFyuHaPmFDUQZ1Xg/t8YfdUWYLrYQRHlZ1niaCdl3YHMWlHSjn/sU1lcx+9HZ20/yJ
 Opk2cINGqWc8A5se0V5nwGwfFmEC+k8S8xiOxPKRmAUM+nml+yEePzWVNCdQ2tGZK2WXsqQ34W0
 Fv6KaKtOrHf2jiTsmaPExb0ESzLcGgaxStjQubDMgeq40daVBDpFHQK7cdMFXVkFWPXyVe1UbhP
 /r5x9aaPF9IzJwrE1n5/Rsl3xgJrBEZhKzT88f2UdSHvGkILc7zjSQkY1b+dhg+EKqE0LLAJYK/
 coKI9OuKqpq5T3ITMAhDxNzlR4+SwZJq8wjubapZQ9643ocskkOT0MOwu+gGv9LwY5ByJUucPae
 H/R/SYMWUkeJk5tX+fIoaYvJK3emnfcH5QH4f7aKF2eW47NtRc87p5IrgHUysFeejxsSTktVwLK
 M6z8ksg1lgWBkWDOq0EtTfTFuYGckQcWeWwTBvnfXUIPA56C0K995COmsNGE89DMQk8wvz14XEZ
 KeMTHKJqZpxU+ZbXICPf/DFWdjJsj70FXwHxs0ny9VJ4rvSXZSpfNaDmEkKL6z0+C+uw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_024135_516765_7D5A85BC 
X-CRM114-Status: UNSURE (   6.14  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
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
