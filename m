Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68942C43602
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 12:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BhxmZlTJxsMpyXlmWgf7FccO9s+i4Z6twJxTlYWj5uo=; b=d7AZ/Fn06+e83a
	NRQumwQrph6yhR0YWDvnmznHYWyDFB2+U6joTjFRePerKZpL/16zmclKQAKm3GGkbeX5SezO2wA2w
	YufVbgR9L5L/7qRDS4fAT7LHfFmBS/sMDV68KhSs9V/9JG+y+nkCrFoW/rSkO//tp8vQZmFcu6IKk
	yReH3hSHYRNa1XL5uAllRpprfq3HjHw6O9w4dkPzJjMJ0IZS8S2TUTc/1C2eFdsVBXCxbg0sYMhyO
	uCzs19+lg2iSnGawl01U5W/LrztuW+b0eC3Vbmx6ioD5asJGDpNvLWZKr5U/JTSWbF/WwGoylMmK7
	+53HI0lilt00msxt1s/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBTU-0000000EdF0-1hy0;
	Mon, 29 Jun 2026 12:52:32 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBTS-0000000EdE2-0PVq
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 12:52:31 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so29038425e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 05:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782737548; x=1783342348; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0G67qeINcThvr9unh9wEXsyMZVKpN32CweVhhELeDY0=;
        b=GQtrgq/G6wv85ZNUT3VnD/3F77UFYSp2SkGyX7fXh5QIMKFa8ewZf2iBeXAzfD3eDU
         kCulE0PJ24H30blkh4LTkZbc5T6BL0FO+yG3aQtNrNdHZas7cIfy+Z3kePlyJD3I5gCN
         CDVTG4S/5dAKQUWdSgp7S1sCEzoVEPsai1iaFHgDBa+bN2unyiKAlYEGf5funqSPs9he
         HhibBRsN/n4u+a8Jh5PUSp5pI0nJFfTmUqjQgRwM4RnQJHBi4nG8FCYqMY4TQrggNwJz
         fm3+3aNUxtF3jxAGDzedjJxxnd28CNny3ul7koNNhcjwpVDZaEyvZfWOASIg9LC9NhBU
         2YkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782737548; x=1783342348;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0G67qeINcThvr9unh9wEXsyMZVKpN32CweVhhELeDY0=;
        b=Qwn0Iaiy8JrkYhhjRYVOpZIL3xjHjTBpPNmaycjKkYEgBusl37Wgw7oPPpk6xKR5/u
         B5e+z1WHmW3r4dVKWAfzOaeix3dYQFWSi0CWbC1lbEDag0RO1MxvHSIKPlh2p/Wtl6/D
         hkUkXqKTTgMnIO/JRhYAGKAiOtnIfGqWOugMWpcZVHFLp5fuPY06SDoHR7cko70SG5mr
         Gag8FDsXiSIL5tFkdF/KVnGFgwPipL16ODyGPiuiFWYyZv01iMJro74Tq8sgutDxdhYL
         ATKPN0EcVcRraKrmqK/PLVoPqt0OfBvkM9MB3vuvNzzM4fUTmB9Au+DsRzgpa12yPju/
         dy+A==
X-Forwarded-Encrypted: i=1; AFNElJ9sKxXvWs2Ub51ggr3uNxgg5vJY9fubTdWP/7NXMItrdN7qH43GKRtg9L8TSwt51125qnH0GYz+74IHLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWs/0mDLb0z/bz+LJQ6edpR39EBw0zY3WjBNmV4//TZ4pQzX2u
	WUFmGGbYIunB0zmsl/+lxMOTbMLyov4qUCtk59EtrisAcf4unLWv6lXK64DsOph9tr4=
X-Gm-Gg: AfdE7ckQZK+I4MP1vUAt8xJstvqtS4SSK97uwUQXXb5jUX+4GHZHHhyvoM+pq6ldq5f
	iLgEPCLUc4om6T69wEfO69a+UYTTwbQiv0Nf5O728/4QzgkWvEOitjtkvsVrzG2ngaDkS5IKBhe
	mzLXhnWCAEQ/MbnYJ1XvsgFIVtkSBAef06ZQmx8he2Nl7cfOT2Q8ews2O54+9Iw0nKyGPrbuEI7
	xJJIvHG3EZ5ulwaCWTV0wgD+pOvL7MSt5SSUEISGqG01sn+QkSF2A7NQ+HtAwHv9HInlxGHky78
	i1RJRFysmcvhb75IAGEPV4cYZ4HtGY8ntEP/m904OtJg2JgJ318mQh+3A5f8DrrtZ5Vq3AIjXM0
	LsXAEdHnlgBKOANb7A9ZWOWMePj7r+09rD5FCMYDQ2/UFSAiDQZP0d0gs1K3Gl+IY9jVTx7Mari
	29z1lAl+ZW5iI=
X-Received: by 2002:a05:600c:4f8f:b0:493:a75e:cf2e with SMTP id 5b1f17b1804b1-493a75ed171mr81258945e9.25.1782737548101;
        Mon, 29 Jun 2026 05:52:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4926f94f213sm276984895e9.12.2026.06.29.05.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:52:27 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Philipp Zabel <p.zabel@pengutronix.de>,
  Paul Walmsley <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,
  Richard Cochran <richardcochran@gmail.com>,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org,  netdev@vger.kernel.org
Subject: Re: [PATCH RFC 0/8] clk: sunxi-ng: Add support for Allwinner A733
 CCU and PRCM
In-Reply-To: <20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech> (Junhui Liu's
	message of "Tue, 10 Mar 2026 16:33:53 +0800")
References: <20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 29 Jun 2026 14:52:25 +0200
Message-ID: <1jo6gta4qe.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_055230_167138_20B2A05E 
X-CRM114-Status: GOOD (  20.25  )
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

On mar. 10 mars 2026 at 16:33, Junhui Liu <junhui.liu@pigmoral.tech> wrote:

> Add support for the main CCU and the PRCM module (R-CCU) found in the
> Allwinner A733 SoC. The clock architecture of the A733 is an evolution
> of the previous A523 design but introduces several significant changes.
>
> One of the key changes is the introduction of a "pll-ref" clock that
> normalizes the physical oscillator frequency (which can be 19.2MHz,
> 24MHz, or 26MHz) into a consistent 24MHz reference for the entire clock
> tree. Additionally, while the A733 inherits many module clock structures
> from the A523, the MCU_CCU has been removed, and the overall clock tree
> has been expanded to support more new functional units.
>
> Also update the sunxi-ng SDM (Sigma-Delta Modulation) helper to support
> a new dual-pattern register design. On the A733, the SDM enable bit has
> been moved from the main PLL register to a second pattern register
> (PATTERN1). The driver is updated to handle this register layout to
> ensure accurate frequency synthesis for "pll-audio0".
>
> This is marked as RFC because the parent clocks for several instances in
> the main CCU are difficult to determine as the user manual provides
> limited information on their specific clock sources. In these cases, the
> implementation follows vendor practices and previous SoC designs,
> generally defaulting to "hosc" where documentation is lacking. In
> contrast, the bus clock gates in the PRCM (R-CCU) are explicitly defined
> based on the Memory Map in the manual, which clearly associates each
> module with its respective bus. Feedback or insights on these specific
> clock parents would be greatly appreciated.
>
> This functionally relies on the RTC series for the A733 SoC [1].
>
> Link: https://lore.kernel.org/all/20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech/ [1]
>

Tested-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
> Junhui Liu (8):
>       dt-bindings: clk: sun60i-a733-ccu: Add allwinner A733 support
>       clk: sunxi-ng: sdm: Add dual patterns support
>       clk: sunxi-ng: a733: Add PRCM CCU
>       clk: sunxi-ng: a733: Add PLL clocks support
>       clk: sunxi-ng: a733: Add bus clocks support
>       clk: sunxi-ng: a733: Add mod clocks support
>       clk: sunxi-ng: a733: Add bus clock gates
>       clk: sunxi-ng: a733: Add reset lines
>
>  .../bindings/clock/allwinner,sun60i-a733-ccu.yaml  |  107 +
>  drivers/clk/sunxi-ng/Kconfig                       |   10 +
>  drivers/clk/sunxi-ng/Makefile                      |    4 +
>  drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c           |  276 +++
>  drivers/clk/sunxi-ng/ccu-sun60i-a733.c             | 2375 ++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu_sdm.c                     |   51 +-
>  drivers/clk/sunxi-ng/ccu_sdm.h                     |   32 +-
>  include/dt-bindings/clock/sun60i-a733-ccu.h        |  289 +++
>  include/dt-bindings/clock/sun60i-a733-r-ccu.h      |   39 +
>  include/dt-bindings/reset/sun60i-a733-ccu.h        |  131 ++
>  include/dt-bindings/reset/sun60i-a733-r-ccu.h      |   23 +
>  11 files changed, 3311 insertions(+), 26 deletions(-)
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260202-a733-clk-0d4fc00a9f9c
>
> Best regards,

-- 
Jerome

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
