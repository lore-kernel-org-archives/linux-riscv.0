Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EE3D10F57
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Nov 2024 03:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nHQ6j/Qr/CQ5UK2v7p2NNfOWcyRXUJP1jZkoxpwXvss=; b=yNs4s0mdkYed2G
	5u3EGr2+c1FxhVYRLjXHCREC7UatCUCA1YFPdGiRS8661wEBWcrjo6rJBmoH/DlVLn9tElSmNvzlj
	1hOpVXgBj4GDR48kg55r+oO0qJDy/iz4uYC5AWIuBq1WGJT5ebZANUHVmIYqAxffqPEXxrspVi27Q
	5a/sCRdYbRGqFVecyAwUXp0CSrQ5SiqKWs6sK1/hckF3qS1vFhloRzthyQfjyju0U/t4KFzD2mars
	QkMMPiOfQyj7u9cbgypc4Bf4lJmtcTCYUGXW5QjOe2uhE6AVdl5adHn151Dq5CQ4j4b+1SjbFgI+T
	2dvaAZNM/Tr2+eDkyU3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCsjv-00000008Fyv-1oHM;
	Mon, 18 Nov 2024 03:47:51 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCsjs-00000008FyO-1rkm
	for linux-riscv@lists.infradead.org;
	Mon, 18 Nov 2024 03:47:50 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c8:31de:bf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id B6601B4B0646;
	Mon, 18 Nov 2024 04:47:39 +0100 (CET)
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
Subject: [PATCH v3 0/1] riscv: dts: starfive: jh7110-milkv-mars: enable usb0 host function
Date: Sun, 17 Nov 2024 19:45:07 -0800
Message-ID: <20241118034558.43226-2-e@freeshell.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_194748_650148_AD31BE91 
X-CRM114-Status: UNSURE (   7.46  )
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

This functionality depends on setting the USB over-current register to disable at bootloader phase, for example U-Boot:
https://patchwork.ozlabs.org/project/uboot/patch/20241012031328.4268-6-minda.chen@starfivetech.com/

If the over-current register is not prepared for us then the result is no
change in functional outcome with this patch applied; there is an error
visible to the user and this additional usb configuration fails (same as
it is now). The existing three VL805 connected USB ports via PCIe on
Milk-V Mars are not affected.

Changes since v2:
 - Rebase on 6.12

Changes since v1:
 - series name (was "[PATCH] riscv: dts: starfive: jh7110-milkv-mars: set host mode and vbus pin for on-chip USB 2.0")
 - adjust pin label to obey dtschema
 - use cover letter

E Shattow (1):
  riscv: dts: starfive: jh7110-milkv-mars: enable usb0 host function

 .../boot/dts/starfive/jh7110-milkv-mars.dts   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
