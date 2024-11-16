Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC35D68BE3
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Nov 2024 06:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q9B+6ZEqWlzaO+Ew+Xmhj3c9hAWKzq8e+cS1PtuvauM=; b=LWdVqIo4vACoUx
	TXUqMFYixNtZ8PUtdO3gGRXA3peFE6DvaNOSYJ1c8jpScKW0zmdC64Us2MbgI89OpPC1y5ZyE7OKN
	nAx0iiiaPOPypZDGTwVGIiuyp3U+ROg87bZx0bDJf9Ct1XQF3f7B8IHB8aSlD2T6sXZFUx5Mpoa6u
	XybCYs/m8sYjl5SqXrSUmqUepIlnwHfH0L8NsHxkx22Y8dOozJmb6unpoAtVyRc/JQvFYo5Ofx1ID
	uHh/1pvGYn+DnH1VOyrugkhsJBO7c62V9xLouzIoZAftrK3m7xjxMMY5opqPx8pAzf+V7ogYF5hmb
	LTZnojreG3RrUONMi5Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCC9X-000000054Bb-0sLf;
	Sat, 16 Nov 2024 06:19:27 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCC9U-000000054Ax-1htk
	for linux-riscv@lists.infradead.org;
	Sat, 16 Nov 2024 06:19:26 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c8:31de:bf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 654F9B4B0612;
	Sat, 16 Nov 2024 07:19:16 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: E Shattow <e@freeshell.de>,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] riscv: dts: starfive: jh7110-milkv-mars: enable usb0 host function
Date: Fri, 15 Nov 2024 22:17:07 -0800
Message-ID: <20241116061719.36409-2-e@freeshell.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_221924_634707_A37CA84E 
X-CRM114-Status: UNSURE (   6.88  )
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

This functionality depends on:

1. commit e10c52e7e064038d9bd67b20bf4ce92077d7d84e
"phy: starfive: jh7110-usb: Fix link configuration to controller"

2. Setting the USB over-current register to disable. This is done at
bootloader phase, for example U-Boot:
https://patchwork.ozlabs.org/project/uboot/patch/20241012031328.4268-6-minda.chen@starfivetech.com/

If the over-current register is not prepared for us then the result is no
change in functional outcome with this patch applied; there is an error
visible to the user and this additional usb configuration fails (same as
it is now). The existing three VL805 connected USB ports via PCIe on 
Milk-V Mars are not affected.

Changes since v1:
 - series name (was "[PATCH] riscv: dts: starfive: jh7110-milkv-mars: set host mode and vbus pin for on-chip USB 2.0")
 - adjust pin label to obey dtschema
 - use cover letter

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
