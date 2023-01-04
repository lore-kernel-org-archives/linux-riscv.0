Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD096C46467
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 15:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PvxqlevhsVTUemm0/vrFLUos4uyOHLJyXtZeOUrW4X8=; b=Se17mZ09aFvuB0
	emrWRszQEQlhITAZj5ZhViZglwfj5AlVgNQs2UmkIrrFdJmNOHpb0nOCggD6JSbWHoitrIBdTsUZj
	JGzIwTR7b7PnNgb6z1CG6sJFan8VMCsiXd+vqFqR44lNM/xkJkRIG3UBdLuxuJn4gS4+fKBggZ6yO
	gDW3d0ASXJhNwk8zy6ZhPblPx5h9qTeriT6ACcTiWuJs5CPctVEUA4XknCmX00tdPHOnNLEgkcs9z
	l4w+rUlFAdGATLvxkEeayQM7iZsQYjUUDkJFhA11c39KwBmXfY14My0urqFXwUgWNH6UH8ZSafmu3
	yQFVsJsBQar1aH5HP5ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5XE-00A2iO-Is; Wed, 04 Jan 2023 15:18:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD0rJ-008Lvz-45
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 10:18:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 43E29615F6;
	Wed,  4 Jan 2023 10:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECCA3C433D2;
	Wed,  4 Jan 2023 10:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672827535;
	bh=T7RuvxLnIRG+f/lbtUQ7s/m4Z+FmbsOtM4nx99txaPg=;
	h=Date:From:To:List-Id:CC:Subject:In-Reply-To:References:From;
	b=aH2Qs0dqvBlMBMXoZCBzba6k8douc1XjAEqa4ZKrgzRjoZcFzjJhCA4RnpR17NghF
	 Jv+lfOE2R9ggVhU/0aspr66RYQuoLUYcZH3Iz1u3Z8W/1rRo3WuCclIK+Ho4jl8V0T
	 591zWzQ7fSNTXqRGoHtmVH66gXIuLUwtHVFyLixJ6MiALUBcj8dOjETKeV9UUzH1yZ
	 Ko/tPOoVcWqiuLJnEKEGQWbfbjNZSYboHGxYVxk/djpDSAlZacGhhCv8MVM6Uoe7nA
	 VRcntL7EuqhC6Q3hBxxP7ySmnD3rWc4vdnTf2rAEZgkzhfnG7epT9qcYvGjug8NPM4
	 5822s9m8vNbvQ==
Date: Wed, 04 Jan 2023 10:18:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>, arnd@arndb.de, palmer@dabbelt.com,
 prabhakar.csengg@gmail.com
CC: Conor Dooley <conor.dooley@microchip.com>, ajones@ventanamicro.com,
 aou@eecs.berkeley.edu, apatel@ventanamicro.com, atishp@rivosinc.com,
 biju.das.jz@bp.renesas.com, devicetree@vger.kernel.org, geert@linux-m68k.org,
 guoren@kernel.org, hch@infradead.org, heiko@sntech.de, jszhang@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 magnus.damm@gmail.com, nathan@kernel.org, paul.walmsley@sifive.com,
 philipp.tomsich@vrull.eu, prabhakar.mahadev-lad.rj@bp.renesas.com,
 robh+dt@kernel.org, samuel@sholland.org, soc@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_v5=2E1_6/9=5D_cache=2Csoc=3A_Move_SiFi?= =?US-ASCII?Q?ve_CCache_driver_=26_create_drivers/cache?=
User-Agent: K-9 Mail for Android
In-Reply-To: <49bd7b4a-b0e1-3213-8aed-9f39604f3935@codethink.co.uk>
References: <Y62nOqzyuUKqYDpq@spud> <20230103210400.3500626-7-conor@kernel.org> <49bd7b4a-b0e1-3213-8aed-9f39604f3935@codethink.co.uk>
Message-ID: <AA57B670-C952-47FE-9355-B4B1E4305CF6@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_021857_305034_D77C158C 
X-CRM114-Status: GOOD (  17.20  )
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



On 4 January 2023 09:50:58 GMT, Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>On 03/01/2023 21:03, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>> 
>> The Zicbo* set of extensions for cache maintenance arrived too late &
>> several SoCs exist without them that require non-coherent DMA.
>> As things stand, the StarFive JH7100, Microchip PolarFire SoC & Renesas
>> RZ/Five all require cache maintenance and lack instructions for this
>> purpose.
>> Create a subsystem for cache drivers so that vendor specific behaviour
>> can be isolated from arch code, but keep the interfaces etc consistent.
>> Move the existing SiFive CCache driver to create drivers/cache.
>> 
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   MAINTAINERS                                   | 15 ++++++++-------
>>   drivers/Kconfig                               |  2 ++
>>   drivers/Makefile                              |  2 ++
>>   drivers/{soc/sifive => cache}/Kconfig         |  8 +++++++-
>>   drivers/{soc/sifive => cache}/Makefile        |  0
>>   drivers/{soc/sifive => cache}/sifive_ccache.c |  2 +-
>>   drivers/edac/sifive_edac.c                    |  2 +-
>>   drivers/soc/Kconfig                           |  1 -
>>   drivers/soc/Makefile                          |  1 -
>>   include/{soc/sifive => cache}/sifive_ccache.h |  0
>>   10 files changed, 21 insertions(+), 12 deletions(-)
>>   rename drivers/{soc/sifive => cache}/Kconfig (56%)
>>   rename drivers/{soc/sifive => cache}/Makefile (100%)
>>   rename drivers/{soc/sifive => cache}/sifive_ccache.c (99%)
>>   rename include/{soc/sifive => cache}/sifive_ccache.h (100%)
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index f61eb221415b..4437e96a657b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -19054,13 +19054,6 @@ S:	Maintained
>>   F:	Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
>>   F:	drivers/dma/sf-pdma/
>>   -SIFIVE SOC DRIVERS
>> -M:	Conor Dooley <conor@kernel.org>
>> -L:	linux-riscv@lists.infradead.org
>> -S:	Maintained
>> -T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
>> -F:	drivers/soc/sifive/
>> -
>>   SILEAD TOUCHSCREEN DRIVER
>>   M:	Hans de Goede <hdegoede@redhat.com>
>>   L:	linux-input@vger.kernel.org
>> @@ -19873,6 +19866,14 @@ S:	Supported
>>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
>>   F:	drivers/staging/
>>   +STANDALONE CACHE CONTROLLER DRIVERS
>> +M:	Conor Dooley <conor@kernel.org>
>> +L:	linux-riscv@lists.infradead.org
>> +S:	Maintained
>> +T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
>> +F:	drivers/cache
>> +F:	include/cache
>I thought the riscv list was subscribers only?

Shouldn't be. At least, I'm not one on this account and I don't get complaints!

>Maybe if we do the suggestion of other cache drivers here we should
>either use the main kernel one or find some arch non-specific list.

Yah, good point. I just moved the existing one, otherwise my script would yell at me about the maintainers pattern ;)

>
>> +
>>   STARFIRE/DURALAN NETWORK DRIVER
>>   M:	Ion Badulescu <ionut@badula.org>
>>   S:	Odd Fixes
>> diff --git a/drivers/Kconfig b/drivers/Kconfig
>> index 968bd0a6fd78..e592ba5276ae 100644
>> --- a/drivers/Kconfig
>> +++ b/drivers/Kconfig
>> @@ -241,4 +241,6 @@ source "drivers/peci/Kconfig"
>>     source "drivers/hte/Kconfig"
>>   +source "drivers/cache/Kconfig"
>> +
>>   endmenu
>> diff --git a/drivers/Makefile b/drivers/Makefile
>> index bdf1c66141c9..6ff60cf21823 100644
>> --- a/drivers/Makefile
>> +++ b/drivers/Makefile
>> @@ -38,6 +38,8 @@ obj-y				+= clk/
>>   # really early.
>>   obj-$(CONFIG_DMADEVICES)	+= dma/
>>   +obj-y				+= cache/
>> +
>>   # SOC specific infrastructure drivers.
>>   obj-y				+= soc/
>>   diff --git a/drivers/soc/sifive/Kconfig b/drivers/cache/Kconfig
>> similarity index 56%
>> rename from drivers/soc/sifive/Kconfig
>> rename to drivers/cache/Kconfig
>> index ed4c571f8771..bc852f005c10 100644
>> --- a/drivers/soc/sifive/Kconfig
>> +++ b/drivers/cache/Kconfig
>> @@ -1,9 +1,15 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   -if SOC_SIFIVE
>> +menuconfig CACHE_CONTROLLER
>> +	bool "Cache controller driver support"
>> +	default y if RISCV
>> +
>> +if CACHE_CONTROLLER
>>     config SIFIVE_CCACHE
>>   	bool "Sifive Composable Cache controller"
>> +	depends on RISCV
>> +	default y
>>   	help
>>   	  Support for the composable cache controller on SiFive platforms.
>>   
>
>Maybe we should find and move the ARM PL cache controllers and
>have them here too?

What to do there is up to Arnd et al :)
The maintainers entry would certainly have to look significantly different then.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
