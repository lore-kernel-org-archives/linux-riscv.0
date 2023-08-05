Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75657C001DB
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Aug 2023 09:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vcaEkoNtnsjUTa+gPuNKMQ2Xc4mD9rdKiGajt06pID8=; b=gjwb3iZLVWR7Tu
	oMEQat8CmUkDJS50kV/nFtbVGwXQGuSwyVMMFlrP2hruF0OQZYc60fYINEetoOZPtLBDYkn6QkRWh
	f0VLo6eTQiRkaPh3jPH9craljQMwJf437x4UP0EXBB4I8agpRq3dGilxkPKgRY0x9czERazb8qwM6
	kLQEWL0/GGxl5ElUCSMvmZYtU5AS0d7Q+bRU6dzWbqkwn2s9RlDD7CPicZjJu/AdekUVFcs/V/QNl
	OJZY6sx9jL+xf9ZykV4WaKFcnh2Rpzak7KU+I9FhlRzwzAYERC6ti/572uaDAZ/R5+qvoX6BVybko
	30zMI1QK571QoYw5KBow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSDHp-00DsJZ-1y;
	Sat, 05 Aug 2023 09:09:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSDHn-00DsJD-1L
	for linux-riscv@lists.infradead.org;
	Sat, 05 Aug 2023 09:09:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6E3D260C1F;
	Sat,  5 Aug 2023 09:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32CE8C433C7;
	Sat,  5 Aug 2023 09:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691226561;
	bh=xB1qV0PaGAB6f8kCo0AnFgu5p9Cp/WAx3pDQIkj8gvw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TSDTIZwLIkaJcXHl8Jm/Q5FAMwzyUKv/7XjD+IoTDfF5y8Hwiz2TmlbCSRzXn+e85
	 fANhCb4VJC543oXGUNbTuqbUWyjje2r6d8V3Ep7DBaFxPZoCtzPZJ+6iL0r1Zn80l0
	 of+rl87SEt/z8Ca+CDW01Qr1SpC8Y26T8bgMLNowAdaFat0slLBcHe4VVHCpeT3SkR
	 D0l3YZV8k5YdaBKxxic+52OUJaNrZRCcQ+sJlw4yQYuEddjM+pO8JzhCMVc7zVCPfO
	 gM+1af20AohCgXT0FvIuVi0tWADQk6guBPTigCOR8Xpi4U9MCwL4oxfGA33Cu2BpHS
	 6O7jOBomHYGiQ==
From: Conor Dooley <conor@kernel.org>
To: devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	William Qiu <william.qiu@starfivetech.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Ziv Xu <ziv.xu@starfivetech.com>
Subject: Re: (subset) [PATCH v6 0/3] Add initialization of clock for StarFive JH7110 SoC
Date: Sat,  5 Aug 2023 10:09:04 +0100
Message-Id: <20230805-imaginary-paramedic-deb52367e36a@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230804020254.291239-1-william.qiu@starfivetech.com>
References: <20230804020254.291239-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=636; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=zMQM4BLLWfbMwoqkkncDlkVcxjGVicpsbkXv343HcXM=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnnBNcJHhfYa9mb+u0f+58DGy48nlB7clXLsV9TM5Q2x XXMK9lwsqOUhUGMg0FWTJEl8XZfi9T6Py47nHvewsxhZQIZwsDFKQATKcxm+Gf9Ku6Nb6z17/oO V+5riQxfD8+L5tx6KClSNPwVw42yidMYGfb0Wd1NZ783ue7Jwvdf6xPb88ojOZUfrq6bdXmd/Nw eFk4A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_020923_499394_00A50BAC 
X-CRM114-Status: GOOD (  11.05  )
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

On Fri, 04 Aug 2023 10:02:51 +0800, William Qiu wrote:
> This patchset adds initial rudimentary support for the StarFive
> Quad SPI controller driver. And this driver will be used in
> StarFive's VisionFive 2 board. In 6.4, the QSPI_AHB and QSPI_APB
> clocks changed from the default ON state to the default OFF state,
> so these clocks need to be enabled in the driver.At the same time,
> dts patch is added to this series.
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[3/3] riscv: dts: starfive: Add QSPI controller node for StarFive JH7110 SoC
      https://git.kernel.org/conor/c/fc3d49f970d2

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
