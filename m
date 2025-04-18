Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E97C369C2
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 00:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=reQ+1IRVXGeYld0tKNHiSgOZ3xLC7Q3TI7D4VBKjmWQ=; b=y68hwj9EqC0m7y
	FZkrTRJ/4kJInkPMPfpCPZi7LPUhAoEFVCnMyZ2f/zf0d6n8LYFCD3AR9gmSKnRkn3Y9TyBaysc8U
	f4fuGtMTirlq+9dwPJU3gHpysSdFhuQZJJELQzWyYPAT7ZO8PeVTcsMb8fBhNG+AoAs+NcYiKV1vb
	jVnYp0p+MkB37ZRB74TaBRJc9bvKCyQQ99TBZbBghfkMLBYBInHAap0GkZm22KX/JrEZuIlNliJGh
	F7fXH3mkHBksmDJKLk9yjlhLEBMH9jC2bUktJvZ/PoWLG+Q5z3qWHisAdOA7jyvgXFTTQbmFNtS+J
	qIuPdrZN9vcvqELsVw+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ZVL-0000000EfmE-0BKY;
	Fri, 18 Apr 2025 00:22:51 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ZVF-0000000EflJ-1rhm
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 00:22:49 +0000
Received: from localhost.localdomain (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 624F7342FE7;
	Fri, 18 Apr 2025 00:22:37 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Haylen Chu <heylenay@4d2.org>
Cc: Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: (subset) [PATCH v8 0/6] Add clock controller support for SpacemiT K1
Date: Fri, 18 Apr 2025 08:22:03 +0800
Message-ID: <174484549885.160158.3249067849153986093.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416135406.16284-1-heylenay@4d2.org>
References: <20250416135406.16284-1-heylenay@4d2.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_172245_501444_8B24F000 
X-CRM114-Status: UNSURE (   6.29  )
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


On Wed, 16 Apr 2025 13:54:00 +0000, Haylen Chu wrote:
> The clock tree of SpacemiT K1 is managed by several independent
> multifunction devices, some of them are
> 
> - Application Power Manage Unit, APMU
> - Main Power Manage Unit, MPMU
> - APB Bus Clock Unit, APBC
> - APB Spare, APBS
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: soc: spacemit: Add spacemit,k1-syscon
      https://github.com/spacemit-com/linux/commit/61e312a001a394a93998c353af859841ddf50d5d
[2/6] dt-bindings: clock: spacemit: Add spacemit,k1-pll
      https://github.com/spacemit-com/linux/commit/8090804045066ab8cd92737c8e2adfb46f166c0f
[3/6] clk: spacemit: Add clock support for SpacemiT K1 SoC
      https://github.com/spacemit-com/linux/commit/1b72c59db0add8e47fa116b21f78ed0b09a264f3
[4/6] clk: spacemit: k1: Add TWSI8 bus and function clocks
      https://github.com/spacemit-com/linux/commit/49625c6e4d90a9221127c49a11eb8c95732bb690

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
