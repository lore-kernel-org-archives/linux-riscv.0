Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8A3C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Apr 2022 02:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JnnG8XsubBJyuN+zZL7rsmp04k43aV+5ekPl1iyD4/w=; b=No+fBkIvTFxIZ4
	ZgSlCSZRjVgo1yZdnyFkjwJ1nitR88WXcsa1BKEdMu9aeQmz5PAhFenPCVxwIlHijcJ8ik0Hw+YEh
	95xJEDy9JHeVVGE2JgBMke/Ru8UFP70Wats7/LOQX3b21OnFNicEE0gwDYT8DQv/YvEOXsOYmW5dS
	nFJT5eJlQV96Vv51WqT645TENVyV3cRN6U0jaDh/9V7ACaDM7iwbJfAiH3KWwd/vqajZj5Z93Uw6k
	6s7MPlDmn+0LkqHHxUOU9LEzyBMx+FdLfI2yBiqFUMLMv+VJXztkyLZMk5pBlK2G+2mV9sL6cfAmR
	c7kqT2FALQAoiMid3ndQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhj8k-00FjN8-2W; Fri, 22 Apr 2022 02:35:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhj8h-00FjJz-2p
 for linux-riscv@lists.infradead.org; Fri, 22 Apr 2022 02:35:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 87E4ACE26DC;
 Fri, 22 Apr 2022 02:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C01EEC385A7;
 Fri, 22 Apr 2022 02:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650594912;
 bh=9bdSIGjXftPYDw2zoU9ZhcnuKxacuGWiim8SFrqnmjs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=sbrNFO4vmmSoJtB15Y2pMJQoQO+TJ/xXFaKfzeInH6/UB5P6OiwHE9pduYriMmwSR
 jVe3v161VAk+RSDRT1XoX3PiO23AoMQqGg8uzNtRUuqatI290In5Zmp3GZ0++Pl34l
 EMUggPHDHAdETytdlKR1KYkcw0KbuPOU2MjvUsILDzjgNzJwZBX7UWLomaDidIfNLY
 XpMIhbWHfhWXZHmyfJKsi23fff4aLpfm5GIV6V+pic1UFTGdchIwIo4P7Gi0JIsT2S
 wsDut3kYv7lAjLvd3xqiUxyWpSC1LfSi+lIsge6UngEEgnhyUV+aSLDef2TPDfRqsn
 rHmJRN5wZxFXQ==
MIME-Version: 1.0
In-Reply-To: <20220411072340.740981-1-conor.dooley@microchip.com>
References: <20220411072340.740981-1-conor.dooley@microchip.com>
Subject: Re: [PATCH v2] clk: microchip: mpfs: don't reset disabled peripherals
From: Stephen Boyd <sboyd@kernel.org>
Cc: daire.mcnamara@microchip.com, linux-riscv@lists.infradead.org,
 palmer@rivosinc.com, andrew@lunn.ch, linux@armlinux.org.uk,
 Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org,
 mturquette@baylibre.com
Date: Thu, 21 Apr 2022 19:35:10 -0700
User-Agent: alot/0.10
Message-Id: <20220422023512.C01EEC385A7@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_193519_328736_D36999AE 
X-CRM114-Status: UNSURE (   9.11  )
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

Quoting Conor Dooley (2022-04-11 00:23:41)
> The current clock driver for PolarFire SoC puts the hardware behind
> "periph" clocks into reset if their clock is disabled. CONFIG_PM was
> recently added to the riscv defconfig and exposed issues caused by this
> behaviour, where the Cadence GEM was being put into reset between its
> bringup & the PHY bringup:
> 
> https://lore.kernel.org/linux-riscv/9f4b057d-1985-5fd3-65c0-f944161c7792@microchip.com/
> 
> Fix this (for now) by removing the reset from mpfs_periph_clk_disable.
> 
> Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire SoC")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-fixes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
