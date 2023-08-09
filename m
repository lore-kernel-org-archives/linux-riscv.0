Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BD7C04E69
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 18:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xSSPhJymgu1iGslp4Q2FPvEnpsj4cZE/uSls9ZSUjz4=; b=JOcbdbgexZoFbd
	42KzOtT2OChJ3lHRxMYfzSJoGtxjHGAeq3RyUr45A1m7n5MIRrkzMHRM7/1XIIQGYpTRNBHmzH1aK
	TitHH/rgnrt0IEOkJ9sZd8m64S8951V42+1OHcC5bwL7gWf5XmPu5dDBwel+k617exEc//RIDHf+d
	rwv8PcjGdzNPukHiFdSZutV9Yn4oeTiOvOrT27prwH+WEXKk3GiaDvVFDZDO08W732xtjrXCNn+4h
	8/kIq5YCfudulL8PB/mvUN2Mz5YGVuuR9ivzPylJC016WYIDW2FKbrEBARt+9S1aUvDYd8Ufzgs7j
	TrixRB7pG4f9DYPptB0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qToCd-005dwA-0k;
	Wed, 09 Aug 2023 18:46:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qToCa-005dvZ-2n
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 18:46:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 652D26445F;
	Wed,  9 Aug 2023 18:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F390C433C7;
	Wed,  9 Aug 2023 18:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691606795;
	bh=Um8a+x8zH6+ISCWLsHPay+8YxzqXFDUhzAQSK7LjmM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b8aF5whmRU21o9ivGxIz7/0T53ExzQ/qIT3hY8thUnGgBrHmUvfZmLVIqPCgr7W0h
	 HRyC5B7H9tJn039Yeqo9H1L/xFsn1ZMkwcxcdjEDE7PSOB9tSehKbYEdRHQ2r+WRiK
	 83ew3ZaEuYoaE5Dk3d+1eAF+mfdIQyd5pJibCW08u1pb9yMtOOljfzbXT//xGTUPdi
	 B+SK6iKb0KaHcMCsSLB5FditWjuVnSDkqK9j4l3s5EslLtCTq/g1F+Z+BlOYhfq7OU
	 dJ9uzWe0FEQuYISw+OMClAv+SYV2pgJfS0uqMKznN7lUlDMjxfE1Wubu3CZenR86+M
	 wTFy6zwab40ug==
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jia Jie Ho <jiajie.ho@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	William Qiu <william.qiu@starfivetech.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v1 0/2] StarFive's MMC nodes support
Date: Wed,  9 Aug 2023 19:46:25 +0100
Message-Id: <20230809-bogged-untamed-2c106d5ca10a@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809013917.81674-1-william.qiu@starfivetech.com>
References: <20230809013917.81674-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=680; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=FQc3FS1DP6Zqa0ZQlMffIHgL7THZeM1l8qkWeMIVyr0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmX7/0X8ti0p+2w+AXXVs66hr3xPef+x5vsfabbk/+J6 cZVtpV+HaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjI9YkMfzivRvH+tZh+P7Xq 9ducvmV1/9c6K6emvOH9unr70unRlbsYGZ4qel/lkfP5LxVSvO2yuViq6Rrxv9tfuPK5X2iYFPB 2OicA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_114636_949550_0DFEB0FA 
X-CRM114-Status: UNSURE (   8.39  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Wed, 09 Aug 2023 09:39:15 +0800, William Qiu wrote:
> This patchset adds dts nodes for the StarFive designware mobile storage
> host controller driver. In device tree, we set mmc0 to eMMC, and set
> mmc1 to sd card.
> 
> William Qiu (2):
>   riscv: dts: starfive: enable DCDC1&ALDO4 node in axp15060
>   riscv: dts: starfive: Add mmc nodes on VisionFive 2 board
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/2] riscv: dts: starfive: enable DCDC1&ALDO4 node in axp15060
      https://git.kernel.org/conor/c/7dafcfa79cc9
[2/2] riscv: dts: starfive: Add mmc nodes on VisionFive 2 board
      https://git.kernel.org/conor/c/b127dbf9e1eb

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
