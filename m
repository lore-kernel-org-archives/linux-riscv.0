Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CB6C52D73
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 17:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QmneaigkpXjfGHeW56CboJvtdPEVyjhkDsJ7hgZLXIY=; b=mcXtbFxAaS0chk
	bOIJE9wN998fsgzB+5oPnk8xwxChivgJdAaezq0NSGGISEPpSzOm/DY9t7xEwPB1/jlAs554F1HGo
	q1tRQiBiLA79vK3whbBAnINoF5BM+5YFcmFR1cXBTeJqs+Quj8yS5hcYPBddRBC0S2BoeHlmJDbiM
	T5dszjTn5kRdIYBxn4qjZVqOe5NeSzSrrbXLWbhQBCcALdfZwUj1lZkHbK/a8QTwS+I6+67QuzyeT
	Hi1owok1oFlch1cUsgQHLIPf0LO4caMbprKozeMIkuJcySypPhucA+QIZXzVu7yY6ttYXLCEkiL/y
	l3q8TYWaHioSdDTF38Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbkR3-00000005ori-16k2;
	Wed, 07 Aug 2024 17:26:53 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbkR0-00000005orG-2phD
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 17:26:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E511BCE0D85;
	Wed,  7 Aug 2024 17:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95145C32781;
	Wed,  7 Aug 2024 17:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723051608;
	bh=67G5aM7r5ENe4kk3e8NhN3hbML0eenyJjRuPNLwAPVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZoIcQDvlcEHtdyWUFRo2Nc2cTlChZqrGRuVBJJ49mFUyxN9Rb+cmcH/wTNIwPYmED
	 Xl0rf+MdjjcamcIfknkCSXy6o1it5yrb6Y1KJK3MKbYB1pRpwUnQB6Q/zm83nHHvet
	 Mq/NAzPyrBhYXKxdgy7mv80caxRu5VIIsozJOE4AHHHe+f+4HpM4MAyyDVSmDhcScY
	 kexVIUod3Yj1KgQPYciEhZb01c4SZ3SGnihOJGlsBmJ+dVbMTJ501j2BXaORTWlbps
	 GI2AZ0Ks2kTy6W4wV8wKPBIwELps0WRVjI92+Ein0YIYxOOjvAgWBkeff8WeLhzlzs
	 pnYqR65woSN8w==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Cc: conor@kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	William Qiu <william.qiu@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: dts: starfive: remove non-existant spi device from jh7110-common.dtsi
Date: Wed,  7 Aug 2024 18:26:40 +0100
Message-ID: <20240807-recital-elixir-f5951f6760d7@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716-majesty-antler-d9bedc7fd0af@wendy>
References: <20240716-majesty-antler-d9bedc7fd0af@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=706; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Z1y/ge0Wkp4E+XvuMKkTCYFUccqMsIcn9c8BhZA7u+U=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGmb1wUmbufI2u319+7uw70S4rqMmzfv9nwbfr77saGkz /d1LkLCHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZgI7wxGhrPBjVn/5/369DxC 5+6KxOcGm3kvpP18KjLh6cf9H25/Zc9m+J9lx3ta6rdG5Lll1edmfQmx4PT3DlmilXLo9fcQ5W2 uzdwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_102650_922862_ACE4B601 
X-CRM114-Status: GOOD (  11.29  )
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

On Tue, 16 Jul 2024 11:54:00 +0100, Conor Dooley wrote:
> There is no rohm,dh2228fv on any of supported JH7110 boards - in fact
> the dh2228fv almost certainly does not exist as it is not a valid Rohm
> part number. Likely a typo by Maxime when adding the device originally,
> and should have been bh2228fv, but these boards do not have a bh2228fv
> either! Remove it from jh7110-common.dtsi - pretending to have a device
> so that the spidev driver will be bound by Linux is not acceptable.
> 
> [...]

Applied to riscv-dt-fixes, thanks!

[1/1] riscv: dts: starfive: remove non-existant spi device from jh7110-common.dtsi
      https://git.kernel.org/conor/c/db6efa5e81a5

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
