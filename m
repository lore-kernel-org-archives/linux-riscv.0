Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F88C55184
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 10:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OzLZgpjxh/xz08OxdbSCiGFmJcHWcaQFirsMroZS2Eo=; b=2GnMLqSmvpWmaH
	xLV9PixTnM23taP5bnyXAkFkl3kOxJ8s7mCiLA187U/ESTZG1sEjDOC9INq9Qkqv8DbXDalAv2Sdl
	u8CGmF3gBZh6r2XKblNUmNr418BmqW0IEx3bf3CGSHqnzop43OMlSGzjcKwudea/Q/QxRKv+RR/ya
	6v6rgSycWA/1L4JgwW5aFlpG+4mqkjp9c9jrRqJp5ZphBgxlo0ovK7hWLxetF6Y/Ol+pyqpeBh2cq
	++R399hCOzFuAdk9u2PvwcOm6dxVwctQvgjlYgGrqzYD4EOfuLRyqdvZpTpypsNveUq7PlWzv4AV1
	02dDybo1uE4O9do4f+UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpYq-0000000Gm99-0wOM;
	Mon, 03 Aug 2026 10:06:20 +0000
Received: from mail.nsa.green ([78.28.212.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpYn-0000000Gm8b-11fN
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 10:06:18 +0000
Authentication-Results: mail.nsa.green;
	dkim=pass (2048-bit key; unprotected) header.d=nsa.green header.i=@nsa.green header.a=rsa-sha256 header.s=dkim header.b=maWz57cv;
	dkim-atps=neutral
Received: from mailserver.lev (localhost [127.0.0.1])
	by mail.nsa.green (Postfix) with ESMTP id 4hDC4K1ssNzFsnL
	for <linux-riscv@lists.infradead.org>; Mon,  3 Aug 2026 13:06:09 +0300 (EEST)
Authentication-Results: mailserver.lev (amavis); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=nsa.green
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nsa.green; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:to:from; s=dkim; t=1785751568; x=
	1786615569; bh=lgALS20BpbCvMEPgTba+8kECHl+ezlecJiFTHB24QS4=; b=m
	aWz57cv93Ee1ypYTnAdO3QXOjXU0ncZGA5kvSDeklSl7ZmikEEYHV+GnanyePVk9
	UKUj+W0A/j5WLyr9gnnq5dSaz1+LAq5qBA86yJuUbxGibiILYmZzk8wJbonGSER4
	Te02unx+Le9wj+R6Fu/ukOridA49cuFFqUVivBihmUhY4uHM+PoxEnZ8F7dnWkSk
	tmlAEPC5LYHOFNyAOykz1E1q/vPabbJxdxVbggglu8/7ELDzgVyQGe/cmMoDy3Sf
	vv9N6Iz/aHZw0ly/brVs/cre3MYeLTK5iebuXppCYTmPT7X/J9CxCacs3Q727Z4P
	LcAHrC+4OD/wbm9SwKUDg==
X-Virus-Scanned: Debian amavis at mailserver.lev
Received: from mail.nsa.green ([127.0.0.1])
 by mailserver.lev (mailserver.lev [127.0.0.1]) (amavis, port 10026)
 with ESMTP id WvIYef7tlEat for <linux-riscv@lists.infradead.org>;
 Mon,  3 Aug 2026 13:06:08 +0300 (EEST)
From: Igor Sakulin <is@nsa.green>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Igor Sakulin <is@nsa.green>
Subject: Re: [PATCH 0/9] riscv: ultrarisc: add DP1000 SoC DT and pinctrl support
Date: Mon,  3 Aug 2026 13:05:26 +0300
Message-ID: <20260803100534.25017-1-is@nsa.green>
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_030617_498895_9396BB4D 
X-CRM114-Status: GOOD (  23.23  )
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

Hi Jia,

I have a Milk-V Titan V1.2 (UltraRISC DP1000) and rebased this series onto
v7.2-rc5 to get the board running on a mainline kernel. It works, and the
board now boots mainline with the upstream devicetree - but not with the
series exactly as posted. Three things needed fixing, and two of them come
from the series having been split during merge. Details below, and I am
happy to give a Tested-by on a v2.

Context for anyone reading this later: patches 4/9 (pinctrl binding), 6/9
(pinctrl driver) and 9/9 (defconfig) were taken and are in v7.2-rc5, while
every DTS patch was left behind. So mainline can currently drive this SoC
but cannot describe any board that uses it.


1. The DTS speaks a pinctrl dialect the merged driver rejects
=============================================================

The driver was revised in review; the DTS was not updated to match, and it
is the DTS that was dropped. Two independent skews:

  a) "pins" is a string list in the DTS:

       i2c0_pins: i2c0-pins {
               pins = "PA12", "PA13";
               function = "func0";
       };

     but the merged binding declares it as an integer array
     (items: minimum/maximum) and the merged driver registers pins by
     number - UR_DP1000_PIN(12, "PA12", ...).

  b) "function" uses the legacy generic names "func0"/"func1", while the
     merged driver only knows the semantic ones: gpio, i2c, uart, spi,
     pwm, lpc, espi. This is the point Krzysztof and Linus both raised on
     4/9 and 6/9; the driver was cleaned up in response, the DTS was not.

Booting v7.2-rc5 with the unmodified DTB gives, in order:

  OF: size of pins in node /soc/pinmux@11081000/i2c0-pins is not a multiple of 4
  dw-apb-uart 20300000.serial: error -EINVAL: Error applying setting, reverse things back
  (the same for all four UARTs and all four I2Cs)
  Warning: unable to open an initial console.
  ...
  Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000100

The panic points nowhere near the cause. The chain is: string "pins" are
parsed as a u32 array, so every pinmux group fails, so all four UARTs fail
to apply their pinctrl, so there is no console device, so init cannot open
one and exits. Storage and networking are fine throughout - the machine
dies over a devicetree property format.

Worth noting for anyone bisecting this: fixing "pins" alone is not enough.
The "not a multiple of 4" messages go away and "Error applying setting"
remains, because func0 is still not a function the driver knows. Both
changes are required, which is why this needed hardware rather than review
to find - each fix on its own still produces an unbootable board.

The fix is mechanical. Pin numbering taken from the merged driver rather
than typed by hand: PA0..PA15 = 0-15, PB0..PB7 = 16-23, PC0..PC7 = 24-31,
PD0..PD7 = 32-39, LPC0..LPC12 = 40-52. Functions by group: i2c*-pins ->
"i2c", uart*-pins -> "uart", spi*-pins -> "spi", the rest are already
"gpio". So the example above becomes:

       i2c0_pins: i2c0-pins {
               pins = <12 13>;
               function = "i2c";
               bias-pull-up;
               drive-strength = <33>;
       };

Both dp1000-milkv-titan-pinctrl.dtsi and dp1000-rongda-m0-pinctrl.dtsi
need this. I can only test the Titan.


2. riscv,cbop-block-size is missing
===================================

This one is independent of the merge split - it is in the series as posted
and also in the vendor's own devicetree, so it looks like an omission
rather than something the rebase introduced.

The CPU nodes advertise "zicbop" in riscv,isa-extensions but never state
the prefetch block size, so the kernel refuses the extension, once per
hart:

  Zicbop detected in ISA string, disabling as no cbop-block-size found

Every other cache block size on this SoC reads 64 - riscv,cbom-block-size,
riscv,cboz-block-size, i-cache-block-size, d-cache-block-size and the
L2/L3/LLC cache-block-size properties - so 64 is not a guess. Adding

  riscv,cbop-block-size = <64>;

to all eight CPU nodes in dp1000.dtsi silences it and Zicbop then appears
in /proc/cpuinfo:

  rv64imafdch_zicbom_zicbop_zicboz_ziccrse_zicntr_...
                     ^^^^^^ absent before

Verified on hardware: message count 8 -> 0.


3. cpu@4..cpu@7 unit-addresses do not match reg
===============================================

In dp1000.dtsi the second cluster is:

  cpu4: cpu@4 { reg = <0x10>; ... }
  cpu5: cpu@5 { reg = <0x11>; ... }
  cpu6: cpu@6 { reg = <0x12>; ... }
  cpu7: cpu@7 { reg = <0x13>; ... }

The reg values are right - OpenSBI on this board reports
"Domain0 HARTs 0*,1*,2*,3*,16*,17*,18*,19*", so hart IDs really are 0-3
and 16-19 - but the unit-addresses should follow reg, i.e. cpu@10..cpu@13.
Harmless at runtime, but it is a dtc/dtbs_check complaint waiting to
happen.


What I would suggest
====================

This is your series and you are active upstream, so I would rather hand you
the fixes than post a competing v2. Happy to do either:

  - send you the three diffs off-list or as a reply here, or
  - post a v2 with you as author and the fixes folded in, if you prefer.

Either way, on a v2 that carries fixes 1 and 2 you can add:

Tested-by: Igor Sakulin <is@nsa.green>

Tested on Milk-V Titan V1.2 (UltraRISC DP1000, 8 harts, 62 GiB), Linux
v7.2-rc5 with the upstream DTB: boots to userspace, NVMe root, eth0 up,
all four i2c controllers present (all four failed before), RTC bound
(rtc-ds1307 on i2c2 as the DTS declares), and a Mellanox card on RC0
training at Gen3 x16 with 17 MSI-X vectors. Zero "Error applying setting",
zero "unable to open an initial console", no panic.

The other review comments on the v1 thread (shenrongda vendor prefix on
1/9, fixed-clock node naming on 5/9, the disabled gpio-poweroff/gpio-restart
nodes on 7/9) I have not touched - they are yours to resolve and none of
them affect booting.

Thanks,
Igor

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
