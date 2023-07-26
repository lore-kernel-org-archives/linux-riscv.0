Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3A1C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 16:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yTqJsaEbOnJCqW3piVjwSEX9bn5BSbRpnGAmW/sh91M=; b=PwZyBsq8mRIgk1
	WV97xX9xf3xunOF2V/Ny69RPtF0w1GxwYsvplopm6YqyyhmMFPYKtXsJhT9jE55NRkY1WFUGnaDtR
	3skBWS6bAyR/GyvRHF95EAJhz4DAqZUdafO/btEjcs+2CGQX/qYBvXoU4nXLS7lSSd2n7fl6bn8jF
	xghL9qkbm5Usr3zm/TOPi1KqFwwN9WBKZ5yZsfimK0wsM4+vxor4tBhlzg2c5JP9r5mJ/7YpDXy1O
	9cTuh6UTYScgYwIIBSG/bBO7tq/BDZi6ruaiJtuPqX1N7+Bwn5YqHXwVzXrNQhksJmb9JxRpB0Q2I
	ip1Sy5gI2pxwk/pvxhKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOhAk-00Ayzu-0R;
	Wed, 26 Jul 2023 16:15:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOhAh-00AyzO-1j
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 16:15:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 159FD61BB3;
	Wed, 26 Jul 2023 16:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16230C433CC;
	Wed, 26 Jul 2023 16:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690388130;
	bh=vVdBJUeDX9yPLWxR1KmOI9UTmYJhTaX/UmEjgL9xjjU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=acQ3pSymbk7OUBE2WwltvCn247oyA3bbQB8P8oc0nlm5IEP7FPAMgds6LG4GKAyLU
	 QO2hZNjCyKnU2oxkphxqmXREUbxE8+yFjWXB1my+x5UURG7J+n+f6od9OUzTa0pa5K
	 K1vpLAJqubfkqzwMotou1CUSueTFntjUmNI5ESQyWfXogwjbX3Oh4ZPlqHcYsClPm3
	 HXPPHcYwSjiDLDG13fbH/RIPaiAKUSmhoS0B+WjKQareNBwT2TeCv1LEz2uF4J6NQu
	 Sa4yKAfcCxjjhcbUBvgaekaAhMVNKNzgJpHaYw7v5LIC2mfL/0bu0tr+H4M57qUyg6
	 G0RWudtRw9kpw==
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Minda Chen <minda.chen@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	William Qiu <william.qiu@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mark Brown <broonie@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: (subset) [PATCH v3 0/2] Add SPI module for StarFive JH7110 SoC
Date: Wed, 26 Jul 2023 17:15:20 +0100
Message-Id: <20230726-sixth-uphill-66fbc1b5e5ce@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724101054.25268-1-william.qiu@starfivetech.com>
References: <20230724101054.25268-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=688; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=KWl97tOyRAl6hm4I/TsKzqcKez1byYACmfzfwtLiPf4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkH3aatPiJvwipi+6yq40mLD1OSTaz4Gr4XmwNMNwRWP 2nPK+/pKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwERiFBn+qdz5VeR4fqWe96bV Jsv0z348v2HPWQavk3KeIRcKKj9W7WJk2BrElLFl8tZHhw4/a219xvF/lr6sy703px9tWDJ74ix lPi4A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_091531_619495_C6AB8251 
X-CRM114-Status: GOOD (  13.06  )
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

On Mon, 24 Jul 2023 18:10:52 +0800, William Qiu wrote:
> This patchset adds initial rudimentary support for the StarFive
> SPI controller. And this driver will be used in StarFive's
> VisionFive 2 board. The first patch constrain minItems of clocks
> for JH7110 SPI and Patch 2 adds support for StarFive JH7110 SPI.
> 
> Changes v2->v3:
> - Rebaed to v6.5rc3.
> - Registered one more clock.
> - Dropped commit that changed the number of clocks in YAML.
> - Rewrited the commit comment.
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[2/2] riscv: dts: starfive: Add spi node and pins configuration
      https://git.kernel.org/conor/c/74fb20c8f05d

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
