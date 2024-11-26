Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C258CD5A6EC
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Nov 2024 08:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3VCn3zP0ktx2DySI/9zZyWTqpI6ET2yPim1gxWP1C+Q=; b=hXhSbFLqU2iSbx
	FJsUetjm0psV7Yc8Y1Pod+MZEb/ktXnLL5FTt9Wpvm/mod98YP1e5pNZsji+dbj0nPp+2rZvux+Iv
	2SaKxRRlwWywyqhkNl7GFJkUfc+nnDJXzdnCFLITXuAlcw8PKRsw6kYvzSxM4sBokybESmj/3BKgU
	lqfy2/2twamaX2lNsbtqQjs99c5zB6O0KBa9WISwbD1FsOfbWD3/5zNfBVT3UBw7OPEFv+d5/23c/
	F71lsGnM3hvaqFhTHmpNXHMG6aNJNIQihP/TriuJd0LQcxRLhJR0aS9YlF/Z9Asb4p1GgRdETT8CY
	G9D7vpCqmo1EwE9GUing==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFqUp-00000009uJB-3Cnl;
	Tue, 26 Nov 2024 08:00:31 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFqSJ-00000009tVd-1mIX
	for linux-riscv@lists.infradead.org;
	Tue, 26 Nov 2024 07:57:57 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c8:31de:bf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 98EC7B4B1D7C;
	Tue, 26 Nov 2024 08:57:50 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Jisheng Zhang <jszhang@kernel.org>
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
Subject: [PATCH v5 0/1] riscv: dts: starfive: jh7110-milkv-mars: enable usb0 host function
Date: Mon, 25 Nov 2024 23:57:24 -0800
Message-ID: <20241126075740.17419-1-e@freeshell.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_235755_601908_8EDF4F3F 
X-CRM114-Status: UNSURE (   8.06  )
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

Enable host mode JH7110 on-chip USB for Milk-V Mars by setting host mode
and connect vbus pinctrl.

This functionality depends on setting the USB over-current register to 
disable at bootloader phase, for example U-Boot:
https://patchwork.ozlabs.org/project/uboot/patch/20241012031328.4268-6-minda.chen@starfivetech.com/

If the over-current register is not prepared for us then the result is no 
change in functional outcome with this patch applied; there is an error 
visible to the user and this additional usb configuration fails (same as
it is now). On Milk-V Mars with four USB-A ports this applies to one of the 
ports and the remaining three VL805-connected ports via PCIe are not changed.

Changes since v4:
 - Rebase on latest master

Changes since v3:
 - Rebase on linux-next/master
 - use tabs for code indent

Changes since v2:
 - Rebase on 6.12

E Shattow (1):
  riscv: dts: starfive: jh7110-milkv-mars: enable usb0 host function

 .../boot/dts/starfive/jh7110-milkv-mars.dts    | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
