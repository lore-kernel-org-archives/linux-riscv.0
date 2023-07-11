Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30976EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 11:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HBMK69TDo6J2Z024TDd1yGMterkHA3xk629Qzuoa7RE=; b=cXDlhNAeOUZyCz
	e+KXMKfgNMgEABWxFFJPa0MPSZZPHmCS7cVVkmh6XKJp8P3tun64QY+WqB0gohRbjXRBsNuU2Bc8g
	KSRces6dImf8FfKcuCM4ypy2UVUMuV3AaSj1M6jxHcJE5+WucN3r4oFWHr6dpJfYtDF8q5+3r7RFW
	Fqz3T8HVl1XP9Y9ea7rWHlqiPA+HmUG1OSS+19Qfishqr86qbUlgny3pk4jGOqmewnAusY9lu4PWi
	EuXPvtB/nvoaRwp2KZa7tchIEgKUUZfUHH2w5ytU/TkxSgZ1WzoYN6kjLQiXWIygmkOp/mjXazn2/
	QGml1TdbdtmWx/GoUW4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJBV2-00ElDm-26;
	Tue, 11 Jul 2023 11:25:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJBUz-00ElCt-2R;
	Tue, 11 Jul 2023 11:25:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4312961479;
	Tue, 11 Jul 2023 11:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72ED6C433CC;
	Tue, 11 Jul 2023 11:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689074740;
	bh=ukUjCeCdruXdkiTh7KIF8MyySLBbuQHe+rPdQaoxZJU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=boJsxhUixxmLnT7F5Q4u//Lh5Xwjgp2OMmp6SpFQH9y2pmO0FF36ai6geFE8vFM9m
	 EbP3hWTRWiZ2F7a4HOIzC+9d4gQ1OMi+YODKPb+nPA6rRqGFEMrr14RYZH8nRDH25+
	 hJYDxwPMvOHowM+hoUZJwONVC2QOpfVQT4oiHPzFch2muFek67IUbGyRUU3BB8zBA0
	 ZU9ik4q8wvDZrX2jH9CxYasAoQosSGSwVEitAmFHwz/dRJW0vUliOlw0PAx5KqbPd1
	 yaTOFFrRWzYWke90zp5FI6ngKsnzV03a65skVHO5oW9BnoFQePGJA9Sm1s8r55h1gR
	 03xdWRsyWnb1Q==
From: Vinod Koul <vkoul@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Conor Dooley <conor@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Roger Quadros <rogerq@kernel.org>, Minda Chen <minda.chen@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Mason Huo <mason.huo@starfivetech.com>
In-Reply-To: <20230629075115.11934-1-minda.chen@starfivetech.com>
References: <20230629075115.11934-1-minda.chen@starfivetech.com>
Subject: Re: (subset) [PATCH v8 0/5] Add JH7110 USB PHY driver support
Message-Id: <168907473599.198426.16779806941255747951.b4-ty@kernel.org>
Date: Tue, 11 Jul 2023 16:55:35 +0530
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_042541_834694_147C4B4C 
X-CRM114-Status: UNSURE (   8.84  )
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


On Thu, 29 Jun 2023 15:51:10 +0800, Minda Chen wrote:
> This patchset adds USB and PCIe PHY for the StarFive JH7110 SoC.
> The patch has been tested on the VisionFive 2 board.
> 
> This patchset is base on v6.4-rc6
> 
> patch 1 is usb phy dt-binding document.
> patch 2 is Pcie PHY dt-binding document.
> patch 3 is USB 2.0 PHY driver.
> patch 4 is PCIe PHY driver.
> patch 5 is PCIe PHY dts
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: phy: Add StarFive JH7110 USB PHY
      commit: 6172141bf8ce6ec8f0b5d33533bf5a5646880e3c
[2/5] dt-bindings: phy: Add StarFive JH7110 PCIe PHY
      commit: 2b236fd4912141074a1cf34a7b3ef724d5bc8d8d
[3/5] phy: starfive: Add JH7110 USB 2.0 PHY driver
      commit: 7ac349186842972ee2b17413a0eee34231324eb1
[4/5] phy: starfive: Add JH7110 PCIE 2.0 PHY driver
      commit: 26cea0e28057d4ee440af4157f13a5312e3918b7

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
