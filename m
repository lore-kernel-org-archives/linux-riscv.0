Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E045C44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 10:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4blHG6YDkcf8vJuA6XU/V1d+IcfOXJLI4QqZ00O9Bg=; b=gYpT1PkCNR1iA8
	8zDaQJzmv0+Zpb7I7LR28+jzJR5SajoLOsX/IWg8jRjZPJvrPIby+2gEalweJmkUQtMD41KLAzsrX
	wnIcJKT2GRwwJs7hwJ8mm9QLLsxIqE3AzZVXwj6hQIAd5QQAeKOiPkISYtefwc4m/qo7ss1c4/aIN
	zEYMuTPMTGNUKzePGmdXWq1QoxqxqWJQc+1No5g9W/cHTP3YH4G39aPRgaG8AeBjk4ly0MLQDuLNt
	TZdtkgEfDhSD/WCzsuzZynXe5JLX+6E5xbk3eKK93ELq2DaRnxofkSxce5AZpRhjWAnyUtNb5u3G7
	Hem2klvsUO/T+ZshinlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virfF-00000006o8T-45E8;
	Thu, 22 Jan 2026 10:11:45 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virfE-00000006o7V-0wRK
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 10:11:45 +0000
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 603E0341E75;
	Thu, 22 Jan 2026 10:11:34 +0000 (UTC)
Date: Thu, 22 Jan 2026 18:11:22 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
Message-ID: <20260122101122-GYA63789@gentoo.org>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_021144_291753_C11FA77F 
X-CRM114-Status: GOOD (  14.93  )
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

Hi Guodong,

On 17:43 Thu 22 Jan     , Guodong Xu wrote:
> This series fixes hardware voltage constraints and enables flexible power
> tree configurations for the SpacemiT P1 PMIC.
> 
> Patch 1, n_voltages is corrected to match hardware register widths, as the
> previous values prevented regulators from reaching higher operational
> voltages (e.g., 3.3V on LDOs).
> 
> Patch 2-4, hardcoded supply assumptions are replaced with explicit
> devicetree properties. PMIC supply connections are board-design decisions.
> Moving this to DT allows supporting varied topologies without driver
> modifications.
> 
> Note: Patch 3 introduces a bisect breakage by transitioning to
> pin-specific supply names. Probe failures will occur on existing board
> (K1 Bananapi F3) until Patch 4 updates the corresponding DTS file.
This patch bring system-wide change that not only affect Bananapi F3..

Please also provide fix for other boards, I think you may not be able
to test all boards, but make sure the patches are available, so people
who interested can test, P.S I can help on milkv jupiter board

> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> Guodong Xu (4):
>       regulator: spacemit-p1: Fix n_voltages for BUCK and LDO regulators
>       dt-bindings: mfd: spacemit,p1: Add individual regulator supply properties
>       regulator: spacemit-p1: Update supply names
>       riscv: dts: spacemit: k1-bananapi-f3: Update PMIC supply properties
> 
>  .../devicetree/bindings/mfd/spacemit,p1.yaml       | 58 +++++++++++++++++++++-
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 12 ++++-
>  drivers/regulator/spacemit-p1.c                    | 25 ++++++----
>  3 files changed, 80 insertions(+), 15 deletions(-)
> ---
> base-commit: c8a4a774a9b0d2c86593492625874e27e9cbc9a9
> change-id: 20260122-spacemit-p1-ae596efe885f
> 
> Best regards,
> -- 
> Guodong Xu <guodong@riscstar.com>
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
