Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A1BC04A95
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Sep 2022 01:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dW9Av7n1gFjvWBO/1Ni+KcIY3xWMetcV6hYn87iVnJI=; b=HdziOYcV9FjQP9
	F97ePeuJc8K8ahgXUwRZionvBt4bzbwyA3/FzHnFwHgV/yfJQPZjKvRbPYE/hBGPEHmiYADWmgOZ6
	4VUFL2AHTBUDm700nJVOZMRK5VPIxfrbl0km7a+mMwIFJbZGSrGO3cOBkmB/4b7SyHdL+H71IySoz
	n9x9qShSDDI2zhJopfFcJ5KJ/yHVq3UriGeHn/fyJvz4EFCoYq3azA3HTHADrwVjNrRj1/Fiwfmw1
	rSt/+fnF/UI4o6mzXDnNouDzD4aIETL+SiHZogiB7mIGowCTHJRH1DNXBrnfJ+dCD5sYMsaCfaXMj
	TfzOKVa1AXy+u0G+1EpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocdGz-000pyI-3I; Mon, 26 Sep 2022 01:51:05 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocdGl-000pnT-GV
	for linux-riscv@lists.infradead.org; Mon, 26 Sep 2022 01:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1664157051; x=1695693051;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Z9M6i/f3yklY/j0IsAGUJ+bKuDQuTWxIST5SqjeVyXs=;
  b=aUZgyjKxoXI1BmPzO9FfPQsJDo+S+gDiZNpY5V7zMGoj73Q6nzp/NFnA
   q8JjtoCflBqZpToK1DxbksbTpIoyaQMcJO9/lS+9mr731TEbZYUbpmFyJ
   DfP2hvjirt/981ZSHC44Y4yvlP2eP/uLWD7dsGhsvDf2um+xxZougf7Ib
   pHNQ+BM+BXkMfmCKK8aVFoEMZQz8kWPTHCeTdbYG18ZV4lXaoykJCKX2Q
   WoIKZ36FwtmRjn5gw69QwyP+0WLxAeCh7KbA3Vz9+pbN4DRXbd/NPpR+6
   SDV2SQ/SvLWAyB3RL6gXtuNd2JWQjsiazJHlVqapUqT7oOJBjVPMh9e9y
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,345,1654531200"; 
   d="scan'208";a="217423307"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 26 Sep 2022 09:50:47 +0800
IronPort-SDR: ymb6N1Cm79uRWk+66HBswzX/Es0Z0d3Gevkrk/GgBYKMDIfgZmZ4USsoFM+XDXhNBuy6TIYtD7
 pxd4QsCkCQm0/d8CNneZrGub72v7jiotrO9n7Y/Tj2brAniA+/3INmLxOwydtT1n+s1b338qAH
 UNPvUCBOS/xMz+TXM7nLwuFRi8ts77pZDaLqOhqFYT8VjUYvqsq2Oda41PmWOFLvf+uDqlJrQm
 +n3vAEl7V5eVVJmKNCdttfCT0fnO5iiYQnElqqKLLF46jgMuj1yboJGa0/MY+oI4l/guVs/afc
 K2MLqvWlx907YY4QGgXL09LH
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Sep 2022 18:05:15 -0700
IronPort-SDR: XOdY/Fnua987FuBWKx30UEHPG36ymwZt36TwOtO2BGuHlKhDGKVFks8m05+bV3frQ7y5YzA01L
 JCGjtbRy1YBM7h5uQwDaZB4PknmFNLaY9w4n6MlR1NIsH0bUuAolSIQzxCKqbKVzw34L4STKs0
 CbgkpydPfJkChDp1+EXR3/3CuednXVEepPgIZZJ6NjC3LfWc5Bb713XZ8hPNgr1ewkh2Z+ZQ+z
 muJlc5pWhb8bUKCO4JJfTWJPTJDv15kuv1Fw+nutWgml94HBtctpF8xZj1JN2+45ueyC+cQYJy
 wN8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Sep 2022 18:50:48 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MbQh72CQzz1RvTp
	for <linux-riscv@lists.infradead.org>; Sun, 25 Sep 2022 18:50:47 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1664157046; x=1666749047; bh=Z9M6i/f3yklY/j0IsAGUJ+bKuDQuTWxIST5
	SqjeVyXs=; b=N6XOWR9pJca7tTo/JAdzc2ZhE834yjm4e1sSfsn7+3r6htKwuqj
	sw3BqRENsOlVLq7dqpFAxbiPbjO4d2jkXDzZneOOtHeRnifYLnJ/cVefL5gRwlzG
	YlUaPakoaEHe75py8lcL0f/bG9u9Wu8JS3rKXTG+sTL9ZBeQSQL5q0AZz1EUwoMK
	SaS06RfsHKfm5uBrVJxZYFdpyA1e9XeqhUB7duSV2qgIF41iLjARQEkbSLDuFWd0
	bZW89cjjrBMDI8VgYZCuo7ZpzHftqrDxJiozqfW99pGMVZFvL7/SgsZbLFLQFOLl
	EWpql8EvXqehat06TlBcBDexVZvWRP72qBQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qmPW2juNQKGW for <linux-riscv@lists.infradead.org>;
	Sun, 25 Sep 2022 18:50:46 -0700 (PDT)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MbQh46BlWz1RvLy;
	Sun, 25 Sep 2022 18:50:44 -0700 (PDT)
Message-ID: <915949be-ab11-8364-4ac2-07d964d66560@opensource.wdc.com>
Date: Mon, 26 Sep 2022 10:50:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [RFC 00/27] RISC-V: Convert SOC_FOO symbols to ARCH_FOO
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com, geert@linux-mk68.org, heiko@sntech.de,
 kernel@esmil.dk, arnd@arndb.de, Conor Dooley <conor.dooley@microchip.com>
References: <20220923185605.1900083-1-conor@kernel.org>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_185051_655519_B8AD1749 
X-CRM114-Status: GOOD (  30.45  )
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

On 9/24/22 03:55, Conor Dooley wrote:
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

It is not very nice to change the config option names as that can break
user build environments, e.g. buildroot setups that have tweaked kernel
configs.

What's wrong with the SOC_XXX names ? Changing these to ARCH_XXX is
weird since the ARCH prefix is generally used for ISA differentiation
rather than boards/SoCs.

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

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
