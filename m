Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4944C7619A
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Apr 2023 08:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5lj1PVrfRuIgGllqLHWYsFjvJTl/xpgTz+6nNLp2N1M=; b=QE8r4aQhVLHONT
	eA8A3iiKQvujgCCVH/hDeBUKIZFsixitccSxs57y3E+qRVcuABv8cFp2LsmsYnFIDt9gTmZOwnuvf
	UMitswFIQDtHFDFAeTZdG9tOi9itOZEffCTPAe08r/rQDsZRimsd+MHvfzk1Q/q2TK/d/fjWsott8
	GkrZNTjXgQfrMPG9oSbg8OxDbx7ixFqmlHjsek8aKxw362N2QaQWYPZ/q/5R3zPKBSsJS4eH3N4yG
	Hm18083T1/V2Kgx6hE4O8sWpy2VwGyVkJllFCP4LzLiBQ1StPVBc7cASVMDronxA+IQlXWC5n0jam
	O+6LfQWGoGXDqo4ndtsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piszZ-00C2Z9-2b;
	Sun, 02 Apr 2023 08:23:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piszX-00C2YU-0m
	for linux-riscv@lists.infradead.org;
	Sun, 02 Apr 2023 08:23:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E56386103B;
	Sun,  2 Apr 2023 08:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4D1C4339B;
	Sun,  2 Apr 2023 08:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680423788;
	bh=rqmI+2ncgqv8TeVA56uwwXT2fHfEv1PS7v4WdYAbJXw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=U03GhHvo77HswkSeu6SilRZCfbKYZ8VczUx+ZoWMRuVVCmcLL7PiM2mtrJaiIHLdq
	 Y9NwfQGrD2kBzXRX9J0Rw0g0yzmLQwGqDxnSQFRdoraT7iv8SzFgsu4V1QXnJTSuKo
	 oSGybFvAOiNCiKSWZtofVLER2qVUuckiul79YCLyRsolojJ7SltDyP5dmMrK3MM1zt
	 gOSIHj4VZmx7gsuuiIoY2gUT+UDwGSXT4obZkUtSMkxgqKXQS9AjPGHJjo+UnTDHWH
	 58aG/tYd+uM+1MhPM9pWdPC/YU/xIaUzssvW70fljgwKCJAiZwQyNjkYIGZTaXoZto
	 w/PIi0HK2AXiw==
Date: Sun, 02 Apr 2023 09:23:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Xu Yilun <yilun.xu@intel.com>, Conor Dooley <conor.dooley@microchip.com>
CC: linux-fpga@vger.kernel.org, Daire McNamara <daire.mcnamara@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
 Tom Rix <trix@redhat.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] PolarFire SoC Auto Update Support
User-Agent: K-9 Mail for Android
In-Reply-To: <ZCk2IgDjHRUlyD+t@yilunxu-OptiPlex-7050>
References: <20230331071823.956087-1-conor.dooley@microchip.com> <ZCk2IgDjHRUlyD+t@yilunxu-OptiPlex-7050>
Message-ID: <958EDDDE-B62D-4CCC-9851-0F01516D95CD@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_012311_388400_5DC1C336 
X-CRM114-Status: GOOD (  24.31  )
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



On 2 April 2023 09:00:34 IST, Xu Yilun <yilun.xu@intel.com> wrote:
>On 2023-03-31 at 08:18:16 +0100, Conor Dooley wrote:
>> Hey all,
>> 
>> This patchset adds support for the "Auto Update" feature on PolarFire
>> SoC that allows for writing an FPGA bistream to the SPI flash connected
>> to the system controller.
>> On powercycle (or reboot depending on how the firmware implements the
>> openSBI SRST extension) "Auto Update" will take place, and program the
>> FPGA with the contents of the SPI flash - provided that that image is
>> valid and an actual upgrade from that already programmed!
>> 
>> Unfortunately, this series is not really testable yet - the Engineering
>> Sample silicon on most dev boards has a bug in the QSPI controller
>> connected to the system controller's flash and cannot access it.
>> Pre-production and later silicon has this bug fixed.
>> 
>> I previously posted an RFC about my approach in this driver, since as a
>> flash-based FPGA we are somewhat different to the existing
>> self-reprogramming drivers here. That RFC is here:
>> https://lore.kernel.org/linux-fpga/20221121225748.124900-1-conor@kernel.org/
>> 
>> This series depends on the following fixes:
>> https://lore.kernel.org/all/d7c3ec51-8493-444a-bdec-2a30b0a15bdc@spud/
>
>Is that series already merged? If yes, just remove this line.
>If no, either put all of them in one series, or still make this series
>as RFC until the dependency is resolved.

Merged into what?
I'll be applying the dependencies tomorrow probably.

>
>Thanks,
>Yilun
>
>> 
>> The patch adding the driver depends on the soc patches earlier in the
>> series, so taking both through the same tree makes sense. Depending on
>> sequencing with the dependencies, me taking it through the soc tree
>> (with Acks etc of course) may make the most sense.
>> 
>> Cheers,
>> Conor.
>> 
>> Changes in v2:
>> - per Russ' suggestion, the driver has been switched to using the
>>   firmware-upload API rather than the fpga one
>> - as a result of that change, the structure of the driver has changed
>>   significantly, although most of that is reshuffling existing code
>>   around
>> - check if the upgrade is possible in probe and fail if it isn't
>> - only write the image index if it is not already set
>> - delete the now unneeded debugfs bits
>> 
>> CC: Conor Dooley <conor.dooley@microchip.com>
>> CC: Daire McNamara <daire.mcnamara@microchip.com>
>> CC: Rob Herring <robh+dt@kernel.org>
>> CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> CC: Moritz Fischer <mdf@kernel.org>
>> CC: Wu Hao <hao.wu@intel.com>
>> CC: Xu Yilun <yilun.xu@intel.com>
>> CC: Tom Rix <trix@redhat.com>
>> CC; Russ Weight <russell.h.weight@intel.com>
>> CC: linux-riscv@lists.infradead.org
>> CC: devicetree@vger.kernel.org
>> CC: linux-kernel@vger.kernel.org
>> CC: linux-fpga@vger.kernel.org
>> 
>> Conor Dooley (7):
>>   soc: microchip: mpfs: add a prefix to rx_callback()
>>   dt-bindings: soc: microchip: add a property for system controller
>>     flash
>>   soc: microchip: mpfs: enable access to the system controller's flash
>>   soc: microchip: mpfs: print service status in warning message
>>   soc: microchip: mpfs: add auto-update subdev to system controller
>>   fpga: add PolarFire SoC Auto Update support
>>   riscv: dts: microchip: add the mpfs' system controller qspi &
>>     associated flash
>> 
>>  .../microchip,mpfs-sys-controller.yaml        |  10 +
>>  .../boot/dts/microchip/mpfs-icicle-kit.dts    |  21 +
>>  arch/riscv/boot/dts/microchip/mpfs.dtsi       |  24 +-
>>  drivers/fpga/Kconfig                          |  11 +
>>  drivers/fpga/Makefile                         |   3 +-
>>  drivers/fpga/microchip-auto-update.c          | 494 ++++++++++++++++++
>>  drivers/soc/microchip/Kconfig                 |   1 +
>>  drivers/soc/microchip/mpfs-sys-controller.c   |  37 +-
>>  include/soc/microchip/mpfs.h                  |   2 +
>>  9 files changed, 591 insertions(+), 12 deletions(-)
>>  create mode 100644 drivers/fpga/microchip-auto-update.c
>> 
>> -- 
>> 2.39.2
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
