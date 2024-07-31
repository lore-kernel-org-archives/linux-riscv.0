Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B9AC3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 20:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FRsqBvjtVwZ/E6W2UxAHNpm0Ca+Jlu7u9iwf25Z9dfQ=; b=vx1OW5bNNauT0R
	zmy938nrz8lyXzZVXiyxTehSmIQu0/8AJqykcuT2V8dYUmokfI6t82cof8dW4+DB67e+27/+Mt4Ck
	ibZW5EKePYlGg06KKdO2ar13V6/pwm0sGbsZ3L17xP4rLmuICM5ztqAhJz+K3NoWGOUdmyvbO/ZCR
	SOAHhn3yHzNTI4fqjpdSsrF3GivjWNS1SsL6nbOKShXDvcPdjMvWDZ3LTUM8EkTWe9dv8lMcFO1hJ
	cSjDpHwmqfK/CYr1VCl3TvlJntZrKT6lOdzu2nLw24qfZnWWOJ9a/SojQwz6DwhbAtzbRqRr9ci1E
	evm5g5nu7jxbwCq9OCAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZFmg-00000002Qz8-3jo9;
	Wed, 31 Jul 2024 20:18:54 +0000
Received: from mta-65-227.siemens.flowmailer.net ([185.136.65.227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZFmb-00000002QvX-3TRU
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 20:18:53 +0000
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202407312018434e5351a89969607a36
        for <linux-riscv@lists.infradead.org>;
        Wed, 31 Jul 2024 22:18:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=jan.kiszka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=K3tmAYtJFHQxY5Qv/OUlau8tmffz0uL7OeNMBjM/53c=;
 b=Uthw2ChLh6B6H9OCSMfUcqx0SSLb85YAR4qUN3Un1UYTseoTkiS4sfVAy7eiLibnxSLp5n
 tHwhxfc+ueSKtboIwxwXOuLfMm7CLslHWlnZS4fRg3u4pZR8QQnRbW+TeksGly88MpdACENG
 YVdtpYmS/G/1u8OI1pUf/dhvpzlSI77cSqn+PBNH3Iy4v2GSDSpB2GqAgiop78P0IPdGtkqh
 0euVB5h9r/6Lc9m9iQtw1MJiRyzzrvVcbz7vDeLUxHfv/bKizsrs4F5zYcGHrbUKciDPY9QU
 JVk/W7aCxTyNPW71XT+LbSe+SyOkFoDhXOn+Gc2kSidfjczxIfyfTHjA==;
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Minda Chen <minda.chen@starfivetech.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/3] riscv: jh7110: Fix configuration for on-chip USB 2.0 support
Date: Wed, 31 Jul 2024 22:18:40 +0200
Message-ID: <cover.1722457123.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_131850_558452_148C8F12 
X-CRM114-Status: UNSURE (   6.71  )
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
