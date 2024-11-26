Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B74D5A6EC
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Nov 2024 07:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uBkESy8G1vXXJT8LqTJv7k7Z0X75kdCbI82czY1s++w=; b=aQeK5EPiFv6Kpd
	GM71nmhtG2jDHGH2dbdLO0XWQiqwo070wBS9CvQ5PXzuOT7SVZd39wYW3jv6ty4Xmeiz2lkPp3aPT
	H4wNyGFd3ahOQeLiu4mMaYY1ZRD1u2hsyIqdUFygkrJYRvF9Tgd2Nz2vXnOEP0S1ryqGM9g0p8ZqF
	xoOXhWKON+S+JgpsIUn48c77LwtRTkeTwzVp+uD3EeYqgNCPyoeB8Dzs5LhL6qGOz+RWBSm+3JT9E
	W3qeCoOt15Sm1KKy9RuV8kUVmIu13NaZjvevYFcw6FqLde6tm8NHmy5MuWpZ7Xq1qq6a4cgLfo/9K
	aEf0kws6cB0aS48NFAOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFqFx-00000009sNq-29XI;
	Tue, 26 Nov 2024 07:45:09 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFqFt-00000009sMc-1Qti
	for linux-riscv@lists.infradead.org;
	Tue, 26 Nov 2024 07:45:07 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c8:31de:bf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id C5DD6B2C2027;
	Tue, 26 Nov 2024 08:39:35 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Henry Bell <dmoo_dv@protonmail.com>
Cc: E Shattow <e@freeshell.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/1] riscv: dts: starfive: jh7110-pine64-star64: enable usb0 host function
Date: Mon, 25 Nov 2024 23:38:16 -0800
Message-ID: <20241126073836.17208-1-e@freeshell.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_234505_517532_482C4ADF 
X-CRM114-Status: UNSURE (   8.46  )
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

Enable host mode JH7110 on-chip USB for Pine64 Star64 by setting host mode 
and connect vbus pinctrl.

This functionality depends on setting the USB over-current register to 
disable at bootloader phase, for example U-Boot:
https://patchwork.ozlabs.org/project/uboot/patch/20241012031328.4268-6-minda.chen@starfivetech.com/

If the over-current register is not prepared for us then the result is no 
change in functional outcome with this patch applied; there is an error 
visible to the user and this usb configuration fails (same as it is now).

Changes since v2:
 - Rebase on latest master

Changes since v1:
 - Rebase on linux-next/master
 - use tabs for code indent

E Shattow (1):
  riscv: dts: starfive: jh7110-pine64-star64: enable usb0 host function

 .../boot/dts/starfive/jh7110-pine64-star64.dts | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
