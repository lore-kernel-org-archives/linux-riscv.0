Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C556C64EC4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 20:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s8yHq0LiNk1cdmr637+xS7T/5dzpVftg1JVYimGK8u0=; b=4V6oXrbnw+Z02d
	nsUTmjZHfeGujNGQTHnR9KdmdHBAJ2a1ctc8sUVMBORQ+8817p8Q7chFp2bIszp4waA4vULoQE8kM
	lLbOAeeaFRtnw6dK+J45Mij6WPnnNw1pbG0sOBUFZnZr+1NbV8ioUyBGtUjjxymMksuGDlav15fs3
	gSCBfMgUXVYNU+ce5XROQRryg4aH9/AqdPM8KD28McRVJEHOW/KxHctC+THUQnPw4+QPYo7yU/6VI
	pUUPx/10u6vfI2xEepq4ZrdsO73IwwlbArNAj8OoORH1tSzFHosXTbhSCFBBPap1ZrR7GwNpm+dtV
	CaY7+fLqK/WPdF9sg2ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paN8N-00Bnrr-0U; Thu, 09 Mar 2023 20:45:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paN8K-00BnrA-Q9
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 20:45:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7430661CE2;
	Thu,  9 Mar 2023 20:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599C0C433D2;
	Thu,  9 Mar 2023 20:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678394701;
	bh=u5HrkJoM01HJpWVGHj+Y7aE+TF4vFOZRUTxy1c4JAOc=;
	h=From:To:Cc:Subject:Date:From;
	b=MEA3brRST4Nj6JTrmoJEv+/Oy6Hy84lUH46wriyVP63sdzbXVTBdnOkk8UMMZz+sZ
	 n7YTcHbmjTKmDC7SFqSqMRDqa6QsKxdEB1ZzCePXjnS2KutyCpKm7sW7+5VDlnXVzg
	 3XJmtRbnolE2KxuGPsjuYbyopWbZpAkwuJbV3adTmvJxmvS3SV+vk4GE8knyx89avs
	 rf83gYNfny9D9MavVnOFdUeSM8uIZG7YyOpvCc8PXVa+DJt3SGMiUdky61JUMDDidy
	 7pjQa1PPjU3l2efovEShCdS6joME0lEiLGTEaTC6704Wt2WNK892YEgB693LB856A9
	 DwxGo+ZjIdpGQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	linux-clk@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-kernel@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v1 0/5] Convert users of SOC_MICROCHIP_POLARFIRE to ARCH_MICROCHIP_POLARFIRE
Date: Thu,  9 Mar 2023 20:44:47 +0000
Message-Id: <20230309204452.969574-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764; i=conor.dooley@microchip.com; h=from:subject; bh=fbsHV5OsNcnAsQ+2KHAjCrmCBL7OVWku43zpXUdUXc8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClcrs61rIlim8/kx+6V3+lmfedAZRcPwxmHmrulDGGuq QZ2Wxk6SlkYxDgYZMUUWRJv97VIrf/jssO55y3MHFYmkCEMXJwCMJGmAwx/eA892HH+wo3b5/pr jB7uZ/q0S21zt+KpCTPLEyx4JHml3zH809ZpZjz2UCypRaxye+w/btUDh1tv9/Yeitc2WyD352o kGwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_124504_951694_44C0BF92 
X-CRM114-Status: GOOD (  11.78  )
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

From: Conor Dooley <conor.dooley@microchip.com>

RISC-V's SOC_FOO symbols for micro-archs are going away, and being
replaced with the more common ARCH_FOO pattern that is used by other
archs (and by vendors with a history outside of RISC-V).
Kick the conversion off by converting the Microchip RISC-V bits to use
their replacement symbol
There are no dependencies here, everything can go via subsystem trees.
We've already added the replacement symbols to RISC-V's Kconfig bits.

Cheers,
Conor.

CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Claudiu Beznea <claudiu.beznea@microchip.com>
CC: linux-clk@vger.kernel.org
CC: Jassi Brar <jassisinghbrar@gmail.com>
CC: linux-kernel@vger.kernel.org
CC: Alessandro Zummo <a.zummo@towertech.it>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: linux-rtc@vger.kernel.org
CC: Bin Liu <b-liu@ti.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: linux-usb@vger.kernel.org
CC: Wolfram Sang <wsa@kernel.org>
CC: linux-i2c@vger.kernel.org
CC: Daire McNamara <daire.mcnamara@microchip.com>

Conor Dooley (5):
  clk: microchip: convert SOC_MICROCHIP_POLARFIRE to
    ARCH_MICROCHIP_POLARFIRE
  i2c: microchip-core: convert SOC_MICROCHIP_POLARFIRE to
    ARCH_MICROCHIP_POLARFIRE
  mailbox: mpfs: convert SOC_MICROCHIP_POLARFIRE to
    ARCH_MICROCHIP_POLARFIRE
  rtc: mpfs: convert SOC_MICROCHIP_POLARFIRE to ARCH_MICROCHIP_POLARFIRE
  usb: musb: mpfs: convert SOC_MICROCHIP_POLARFIRE to
    ARCH_MICROCHIP_POLARFIRE

 drivers/clk/microchip/Kconfig | 4 ++--
 drivers/i2c/busses/Kconfig    | 2 +-
 drivers/mailbox/Kconfig       | 2 +-
 drivers/rtc/Kconfig           | 2 +-
 drivers/usb/musb/Kconfig      | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
