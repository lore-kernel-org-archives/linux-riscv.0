Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92DCD6ACF0
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 15:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nawsTsXX2RlVU80wInAgINU+Osqkoyx9lzo2G6Kfl88=; b=ywSIjTn29+qUM6
	De161Rlnw7eqMZL2OArIghjSPexvGJkk403y+9zpukTmdNB2xA7PLDoBf3eSD4YXL3urI7PXAgGT4
	z80Bsfl2mjd4SNYxkgRw3Ap2Wy9Y/O08pOzrws9k5/Lfvz5isOK4r3CeijLn5hxGx0jM6VW2meXaa
	aNF5Jwrp1sRHlWGu1MpZZxISkET0Uk/S0dCN7ywf70Z1tdN+sLg8bAlBdNhBBVEiaCekdreTj9qza
	xlpo8/b6WB3tAx97hLvoVh+VVxLuQhvq997XPMR+fZKtniRmeZlc2k9P/P7JN2u7L4mpeUQ2V0rE5
	1jSs6DgejT6M0JfmF3kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGKJ8-0000000DYLp-1KVI;
	Wed, 27 Nov 2024 15:50:26 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGKJ5-0000000DYKw-22Sq
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 15:50:25 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c8:31de:bf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 22332B4B1E1F;
	Wed, 27 Nov 2024 16:50:17 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Henry Bell <dmoo_dv@protonmail.com>
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
Subject: [PATCH v6 0/1] riscv: dts: starfive: jh7110-milkv-mars: enable usb0 host function
Date: Wed, 27 Nov 2024 07:49:22 -0800
Message-ID: <20241127154958.71094-1-e@freeshell.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_075023_665769_7B1D6D5E 
X-CRM114-Status: UNSURE (   7.91  )
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
USB-A ports and the remaining three VL805-connected USB-A ports via PCIe are 
not changed.

Changes since v5:
 - Rebase on latest master
 - Addtional detail to commit description

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
