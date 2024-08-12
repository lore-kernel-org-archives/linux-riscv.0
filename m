Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3729EC3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 15:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3CQFJBwMFJw7Fzk+M0QOhXX81CVWXRCv0qnC4xx6iZc=; b=I6kPSEdpDjxSJt
	aTqc4mHG2zYzBvPo565dHaCXw/RBAwJTf9tT44redi+sb3GGhhNrhyi92hMZRI3aiXGGidGcD4vNu
	izW/t2Hhg4XOvOzTyp75qPZ1LplIj1vOoETfr2AlJEoB56D+dF1v8psVQCb4Z01Etkle+2VpRp0La
	Tn+PdhCs2qRyDof5gWF7L7zG7dof5mYYgY0gWiCOex8UUkg8EXBoLzVOJCSDbpTk3meoEwMkHlO6y
	yS275NVBjQbQfRDsGtx/k5AAYJk3nODxNWn3CgCP3eKtJHohWBRqmzkhpdT+3PGyyYAkpUeORW6Ne
	xrTYP3ygmgDy7JstINSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdX08-00000000jqc-1Jb7;
	Mon, 12 Aug 2024 15:30:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdVq9-00000000YHn-465p
	for linux-riscv@bombadil.infradead.org;
	Mon, 12 Aug 2024 14:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=pd/VpIRV516pqsgMsPuysNVtHzsHKVyjXVwp6LAdEi8=; b=JroDSEtxy0u2gdVpfUUVcSYgKQ
	neETp5k5XVZgr2z3my2Xa95V88+iC9z1ARQUUtnsHnjNpx4yOG6L3xcil8ZunM+V//RLTTKfmg7l6
	nzXX5Is8E8UBqbok1t5k+CdQXGJ4+uPSqem9UuPaBi/5FtXm8C2QOgMsgt3ud7QEsVtWLRdM3vAXO
	9O6Hk55UJFz+sr2qz5H1J7+frYyseReHUZg6IhWHjymJLBuLrNv7ukGLTofXW7JY9TwJS0+jOinhD
	mM0JEMFD3sYoPpckrAPAsgk5A/Co3RsfC8VaD3csRT3pCsYQftq6y1+XXuZ7xhJ0zUduBZPGwRLgZ
	1Ps2B6vA==;
Received: from mta-65-225.siemens.flowmailer.net ([185.136.65.225])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdVq4-00000007aLv-2W8m
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 14:16:04 +0000
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20240812141554103695d090e5b6af2f
        for <linux-riscv@lists.infradead.org>;
        Mon, 12 Aug 2024 16:15:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=jan.kiszka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=pd/VpIRV516pqsgMsPuysNVtHzsHKVyjXVwp6LAdEi8=;
 b=hLKWZiAse5JNnpzONR2N3Qr9k8QD8eToGyE3sS7yIaom9QuW26iJLSAEPUN9l4vChF14QR
 dz+JHQEAFK9bAgoTPOmcPAuIdkxfoLYUnCyeGt5AQ5yfpA9Hz7xHleTa83DWuKniD4N8Xglf
 2dHWVqUfhK+aX689K19w3COLiqcwp4/0qVTUotmoYy5q4vgzIVp2b6tVKF78ZRgwb4RJuKH1
 WyEzRMC9bagza537JMGkVnCoL6EYw09geoQJn68qwqw8lrYbmOY5F1QCUpkca7OtrJbfZ8Jf
 Dl0XkV+BGZmyTK3sQTHI63gpUtiFu47ah+9OYuKw0If2nW6JX+QqRDwg==;
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Minda Chen <minda.chen@starfivetech.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 0/3] riscv: jh7110: Fix configuration for on-chip USB 2.0 support
Date: Mon, 12 Aug 2024 16:15:50 +0200
Message-ID: <cover.1723472153.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_151600_944666_8E8F6D0F 
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

While mainline has support for the USB controller of the JH7110 since 6.5,
this never really worked, even not with latest downstream kernels by Starfive -
unless you were also using an old downstream U-Boot version. The reason for
that was a missing syscon setting that prevented the connection between USB
2.0 PHY and the controller. This series finally fixes the issue.

Changes in v2:
 - fix copy&paste mistake in error patch found by kernel test robot and Dan Carpenter

Jan

CC: Conor Dooley <conor+dt@kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Rob Herring <robh@kernel.org>

Jan Kiszka (3):
  dt-bindings: phy: jh7110-usb-phy: Add sys-syscon property
  riscv: dts: starfive: jh7110: Add sys-syscon property to usbphy0
  phy: starfive: jh7110-usb: Fix link configuration to controller

 .../bindings/phy/starfive,jh7110-usb-phy.yaml | 11 ++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  1 +
 drivers/phy/starfive/phy-jh7110-usb.c         | 20 +++++++++++++++++++
 3 files changed, 32 insertions(+)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
