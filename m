Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994E9CD343F
	for <linux-riscv@archiver.kernel.org>; Sat, 16 May 2026 02:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LVj9u7cIagibwz8+8yW2fhReT5aTDGOcruZup72+fes=; b=EO7p1fC/8mSZDw
	78fAXdD+XLav2BOV3Of5UJUv059xugT9UBooMhOMZA4fECc5+EHhRXHj82OhSLNCNQ/YIjeXMcNB7
	Pm8qaDG6g/DcYWDnOV841z5FIh/acNsuvakoKN14hU2I6MFDpWeAxOYx3VqiiseKUekkvkXerwdtP
	XStSXKNMzn4iT33sHzrhJeB6FXxWhdVJh/ChXCl7T8gSin9cNT7XIiIcplzHEEJfSDGuGVKCffzjI
	NNLdTpvjlkWY9c80JFpvy0H4URSP1GkqEhUXbPSkfyTYxSdNVgzhhxEF3vE0ubWVSqeShXFikAnTz
	40hBM2vX4kW60Tz9yjFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO5DD-00000009zY8-3d5a;
	Sat, 16 May 2026 02:57:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO5DC-00000009zXw-2HCO
	for linux-riscv@lists.infradead.org;
	Sat, 16 May 2026 02:57:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 553F560138;
	Sat, 16 May 2026 02:57:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258BDC2BCB0;
	Sat, 16 May 2026 02:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778900228;
	bh=M6nGzuhtuydJTS24X+joMHBqfjHReQnk/JS+UtPAYmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nQj0ikvAvGebOjidCeb4lbqYeg8nWzV8uPsr0sQVf3ecOhvzKxj98lVehAxGLs1c5
	 51IWimbv16mI2OvpE9Q15vyhAg2Pu2g3PVUHLImA6Pz6xLGojlP5/f2Gh0kWWhGt0l
	 pg0b8R38jUAt26+e+4xjtGctsO9kyUkG+DQyLeexwd4O1oLT2maxfcfgTLWJAHCWfT
	 4zpzx+Cxaq8uFzLbVsYPDtdDQcQGcIvqEtN6AGw4XvEijH7ed1SqcCznvoCsHvvz0m
	 n44CEczj0bsaAoin7ZIS0jwy38kxzSmdO5DRs5k9a/5uXack3vocg9bK2zDodzqqwA
	 Ug82cbfcDkJIw==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Ulf Hansson <ulfh@kernel.org>,
	Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: Re: (subset) [PATCH v10 0/4] riscv: spacemit: enable SD card support with UHS modes for OrangePi RV2
Date: Sat, 16 May 2026 02:57:00 +0000
Message-ID: <177889984452.2298656.1074391459031404894.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
MIME-Version: 1.0
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
Cc: Trevor Gamblin <tgamblin@baylibre.com>, devicetree@vger.kernel.org, Margherita Milani <margherita.milani@amarulasolutions.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Troy Mitchell <troy.mitchell@linux.dev>, Andre Heider <a.heider@gmail.com>, linux-mmc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org, Vincent Legoll <legoll@online.fr>, Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Fri, 15 May 2026 12:48:58 +0200, Iker Pedrosa wrote:
> This series enables complete SD card support for the Spacemit K1-based
> OrangePi RV2 board, including UHS (Ultra High Speed) modes for
> high-performance SD card operation.
> 
> Background
> 
> The Spacemit K1 SoC includes an SDHCI controller capable of supporting
> SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
> currently lacks basic SD controller configuration, SDHCI driver
> enhancements for voltage switching and tuning, and power management
> infrastructure.
> 
> [...]

Hi Iker,
I've picked patch 1-3, for [4/4] I think it should be merged after
https://lore.kernel.org/all/20260513071958.29574-1-a.heider@gmail.com/

Applied, thanks!

[1/4] riscv: dts: spacemit: k1: add SD card controller and pinctrl support
      https://github.com/spacemit-com/linux/commit/2d77e577109967ef65f269c1fc1d6a659d4260fb
[2/4] riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
      https://github.com/spacemit-com/linux/commit/2585c60ce2f977b13f14a67d1e3ed9c73fd7f381
[3/4] riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes
      https://github.com/spacemit-com/linux/commit/c76e2f058cbcab84e4a703f26857a58bdf6a0042

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
