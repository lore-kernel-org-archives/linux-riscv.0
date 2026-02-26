Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC4DFD8FE4
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 17:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWq6ZIjI9vGmUVsH4AvWqmMBWqlNQR801+hCmcPAqCs=; b=iFUS3fw/L60Tsu
	o4Qsse7mZGvq06myO8Xg+RoELAz6tUaZg77bHkB+ns6p3DVKjvkSojoUHmKx7AH+P7S7l+CWP6kFc
	94xJf7BLo9gU6uNGj9DXaY0/qiL8xFhUVj+EbhhegPq+KFvJcGzXe/KjfTrUth8H6LQUxudOHZWbT
	OwDRXVs4FlQK63FjKvbkYr62binUGIpy9S+tcB30dWrLzV0Nd0mcbt9ntiNem9PBGJ/IYU7hde4wS
	vtv0pFAcrikctwBZrglM/vNJmvCEP1/NdWKq9S0oCDoi8V9vhw5dUdWBzZyDb5tjzeGhH3TQNOnyw
	gGABGBKKcIw17WJb+OBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfeL-00000006tnq-16kb;
	Thu, 26 Feb 2026 17:59:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfeI-00000006tmd-1BHK
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 17:59:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A2B043A58;
	Thu, 26 Feb 2026 17:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C25F9C19423;
	Thu, 26 Feb 2026 17:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772128781;
	bh=MguRNIbhWjylL2SWFqbE8eKjOmldrw1McpuJdNzjLFo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lBA/plYJDAFSdNwwVIXtZswUeU35DMBZZ8TJu/WVjevrHxn23zh2lMnnE1jtAL1Ob
	 FVffAg8Nw7YGdRMjDSDyJut5OSB6SqFvn2Bne0m8B10y+Wxn/1Msb9f0v1F0rJKQz5
	 ppUOyIFx01v519AcXGN8hD3pzbC8o7tEyg2LC0Frv9VxKylF5fbMJK1Vwsk2nS4VF1
	 znbpVxhWeEnpDb78xoYM6foW0tg5UEjLLV2SHD/D4SV7qtRP/pUgqwTEfVwQiZaiJ4
	 xyN+9huOecMHT11tCa6WgLc8qFRjUFWOikygmiP7cZnSnnF4uv0Zt3JhtNyMLB1GAo
	 nZu71U+jIQvpQ==
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] riscv: dts: starfive: Milk-V Mars CM Lite broken-cd
Date: Thu, 26 Feb 2026 17:58:44 +0000
Message-ID: <20260226-hummus-quarry-41b06f24b38c@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260204101602.30184-1-heinrich.schuchardt@canonical.com>
References: <20260204101602.30184-1-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=681; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Of9jy6dFEc4+vh/AWYv8ShbYQCg6TOxPo2P11DOihTk=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkLOq+k104oWarIernY4XBV5l95sUPvfKqN5OcLXtrqv 79VZKNTRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACYiMpnhf5r0NeXaK6fn/7/k qLnzpJVQ6dQvgrq/r5V+XfCdSSAnj4fhn/KjFSIhh/9q9i1+usH8lDprY/ZtvXdBjivmtLvZb62 6yQQA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_095942_342547_1B9FBC46 
X-CRM114-Status: UNSURE (   8.85  )
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

On Wed, 04 Feb 2026 11:16:02 +0100, Heinrich Schuchardt wrote:
> The card detect GPIO depends on support by the base board.
> 
> Detecting an SD-card did not work for me with a Milk-V Mars CM Lite
> mounted on an Waveshare CM4-IO-BASE-A board.
> 
> According to [1] SD_SDIO0_CD_GPIO41 is connected to pin 76 reserved.
> The Raspberry Pi Compute Module 4 IO Board documentation marks that pin as
> reserved. The Raspberry Pi Compute Module 5 IO Board documentation
> marks the pin as VBAT.
> 
> [...]

I agree with the stance that the "default value without any overlay
should be one that allows to use  the SD-card on all IO-boards,
i.e. 'broken-cd'.", applied to riscv-dt-fixes, thanks!

[1/1] riscv: dts: starfive: Milk-V Mars CM Lite broken-cd
      https://git.kernel.org/conor/c/4ade402d5d89

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
