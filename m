Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F70C6FA83
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 19:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+sTAi47qQub+Uxj+DaJwiXOONxhuht7FHaMy3o9OMBM=; b=rknkBIMrU0mYZe
	8dZKYLSScWlrYV9dHshNXesca0221lFipuWRgZVV92fywFYju15OyciJShhYQRHCxWSBt9KA3O4nP
	aV0T9PS0H8b4dZ7dv70Zc5aasZv6nYteOrxEWCwggyLst7W8aBb/us8bZb+Vs0YQ99qFIXCV4q72S
	vnPbIsyF1633194XGXKIEAMcFEzqbxPY+QgCx0BFEOSz4n1cduQjVlRyF6J/yjYNXEuc3TWTAuRZh
	A5Z3P5aJFfqXrhrAVVBO6kkFi0EJZzIrQ7Tfke65zqlv3gJji0aHSETf1Lqo0m1CJ5hWBVkowTONi
	WkEusE65z7eaaMbtW2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnuO-005SzQ-5r; Fri, 23 Sep 2022 19:00:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnuM-005Sx1-2y
	for linux-riscv@bombadil.infradead.org; Fri, 23 Sep 2022 19:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wnbtOnrW9/9C0Ol6wG8YVLNtsVOYFpBw5t7NA768iiE=; b=XQjG1AwmqZPynkGeTQKvsnRLak
	EWuZCf/B3S31LHvF3uur4SkTq7y4KNlzmf2/RtP8Qc1VKX0hOQmizDsxJ64JEZnBhz2GP42jHxykv
	kPOxBCM1R128lLyrgGTEiVfJUZMcIW7TZ64EPhSMzeHFb2CqBZlsd9b9SZ/hch1GPHsCF4oxKTAsZ
	XpX/zsI6zCp9KjL4ZRvHPnJPWhk7xpAfiWJk8KBKs4ouXVzuSNZR4XVVJ7hHtgPuFRlHDwZDmabFs
	CJYpARBrs972GZUswViZDC4nDUOZMphrCLVRgj8fWsAhKv6I9SGOM9rDPw9J+UNQNSnamLBnjmvDd
	6MpGDDww==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnuD-00FHtC-KO
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 19:00:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E94C062427;
	Fri, 23 Sep 2022 18:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D56C433D6;
	Fri, 23 Sep 2022 18:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959599;
	bh=6V7P9Gox2eR3ksmbHquTa1QllY8UYGEMlod5U5Q3i5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tsBnmb1AHseRjQG9JP7CawF6ayKfxZmOlSVMr08RvBU5nPeS24PNSrrUAaojvH/au
	 q4ZqtUUs0FM2H3IzV8LTmfhxUas5rmrrVdqRDjquuYdRpU5wlJKhT1TBx524FV0q6k
	 9valrivHqq+FcP8zyJfA/a/uouMG7CsDTscoX5xOdwpLGQXKGsvsL/EWl8WUgnp5/u
	 BeB9csWdSkcBKIuo2bcnczyYMGWqUAZLPmUaUo0X/7x2HScoS4zmcVRTl7UaOje0qv
	 FLsodifSTirfLGnn9QBIYPSRgO3CxpKVatTdatdc3PvGdEo6qFbD9+4qoDQQlC6U71
	 oOYroEUb82WVw==
Date: Fri, 23 Sep 2022 19:59:54 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com, damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org, heiko@sntech.de, kernel@esmil.dk,
	arnd@arndb.de, Conor Dooley <conor.dooley@microchip.com>,
	geert@linux-m68k.org
Subject: Re: [RFC 00/27] RISC-V: Convert SOC_FOO symbols to ARCH_FOO
Message-ID: <Yy4CKuw0i8yMQmVO@spud>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_200013_076811_1AA49B35 
X-CRM114-Status: GOOD (  28.70  )
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

+CC Geert whose email I typo'd...

On Fri, Sep 23, 2022 at 07:55:39PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Following on from LPC, here's the start of my efforts to clean up
> Kconfig.socs.
> 
> My preference would be to take the whole thing through the RISC-V tree
> for v6.2 to make things a bit less fiddly, but I am sending this as an
> RFC in the hopes of getting some opinions on how the series should be
> split up & merged. I guess it would always be possible to create a few
> immutable branches for the individual subsystems that are being modified
> & take the series through the riscv tree unless we hit a conflict in
> -next. Obiviously for that route, maintainer acks will be needed.
> 
> The only SoCs I have, at the moment ;), are the jh7100, mpfs, fu540 and
> the k210 so I've given those a whirl to make sure I didn't break
> something.
> 
> I have also yet to deal with ARCH_VIRT, but just throwing this out for
> some opinions on how to apply/split up the set before finalising a v1.
> 
> I've CCed a few people that may have an opinion here, but anyone that
> has an opinion here - please shout!
> 
> One other point, is it worth adding something to the patch acceptance
> policy to say "do your kconfig xyz way" or is that not something that's
> worth doing since it is easy to push people in the right direction
> during review?
> 
> The series is currently on top of:
> https://lore.kernel.org/all/20220908142914.359777-1-cristian.ciocaltea@collabora.com/
> 
> Thanks,
> Conor.
> 
> Conor Dooley (27):
>   clk: microchip: replace SOC_MICROCHIP_POLARFIRE with ARCH_MICROCHIP
>   i2c: microchip-corei2c: replace SOC_MICROCHIP_POLARFIRE with
>     ARCH_MICROCHIP
>   mailbox: mpfs: replace SOC_MICROCHIP_POLARFIRE with ARCH_MICROCHIP
>   usb: musb: mpfs: replace SOC_MICROCHIP_POLARFIRE with ARCH_MICROCHIP
>   rtc: mpfs: replace SOC_MICROCHIP_POLARFIRE with ARCH_MICROCHIP
>   riscv: stop selecting the PolarFire SoC clock driver
>   riscv: replace SOC_STARFIVE with ARCH_STARFIVE
>   clk: starfive: replace SOC_STARFIVE with ARCH_STARFIVE
>   pinctrl: starfive: replace SOC_STARFIVE with ARCH_STARFIVE
>   reset: starfive: replace SOC_STARFIVE with ARCH_STARFIVE
>   riscv: replace SOC_SIFIVE with ARCH_SIFIVE
>   soc: sifive: convert SOC_SIFIVE to ARCH_SIFIVE
>   clk: sifive: convert SOC_SIFIVE to ARCH_SIFIVE
>   clk: sifive: select by default if ARCH_SIFIVE
>   serial: sifive: select by default if ARCH_SIFIVE
>   PCI: dwc: fu740: convert SOC_SIFIVE to ARCH_SIFIVE
>   riscv: stop selecting SiFive clock and serial drivers directly
>   riscv: convert SOC_VIRT to ARCH_VIRT
>   kunit: tool: rename SOC_VIRT to ARCH_VIRT in riscv's QEMU config
>   wireguard: selftests: swap SOC_VIRT for ARCH_VIRT on riscv
>   riscv: convert SOC_CANAAN to ARCH_CANAAN
>   clk: k210: convert SOC_CANAAN to ARCH_CANAAN
>   pinctrl: k210: convert SOC_CANAAN to ARCH_CANAAN
>   soc: k210: convert SOC_CANAAN to ARCH_CANAAN
>   reset: k210: convert SOC_CANAAN to ARCH_CANAAN
>   serial: sifive: select by default if ARCH_CANAAN
>   riscv: stop directly selecting drivers for ARCH_CANAAN
> 
>  arch/riscv/Kconfig.socs                       | 30 +++++++------------
>  arch/riscv/Makefile                           |  2 +-
>  arch/riscv/boot/dts/Makefile                  |  2 +-
>  arch/riscv/boot/dts/canaan/Makefile           | 14 ++++-----
>  arch/riscv/boot/dts/sifive/Makefile           |  2 +-
>  arch/riscv/boot/dts/starfive/Makefile         |  2 +-
>  arch/riscv/configs/defconfig                  |  6 ++--
>  arch/riscv/configs/nommu_k210_defconfig       |  2 +-
>  .../riscv/configs/nommu_k210_sdcard_defconfig |  2 +-
>  arch/riscv/configs/nommu_virt_defconfig       |  2 +-
>  arch/riscv/configs/rv32_defconfig             |  4 +--
>  drivers/clk/Kconfig                           |  4 +--
>  drivers/clk/Makefile                          |  2 +-
>  drivers/clk/microchip/Kconfig                 |  3 +-
>  drivers/clk/sifive/Kconfig                    |  4 ++-
>  drivers/clk/starfive/Kconfig                  |  6 ++--
>  drivers/i2c/busses/Kconfig                    |  2 +-
>  drivers/mailbox/Kconfig                       |  2 +-
>  drivers/pci/controller/dwc/Kconfig            |  2 +-
>  drivers/pinctrl/Kconfig                       |  8 ++---
>  drivers/reset/Kconfig                         |  8 ++---
>  drivers/rtc/Kconfig                           |  2 +-
>  drivers/soc/Makefile                          |  4 +--
>  drivers/soc/canaan/Kconfig                    |  4 +--
>  drivers/soc/sifive/Kconfig                    |  2 +-
>  drivers/tty/serial/Kconfig                    |  2 ++
>  drivers/usb/musb/Kconfig                      |  2 +-
>  tools/testing/kunit/qemu_configs/riscv.py     |  2 +-
>  .../wireguard/qemu/arch/riscv32.config        |  2 +-
>  .../wireguard/qemu/arch/riscv64.config        |  2 +-
>  30 files changed, 64 insertions(+), 67 deletions(-)
> 
> -- 
> 2.37.3
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
