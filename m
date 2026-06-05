Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A491CD6E5D
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 10:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AnxZrK4krC/JlXmv6LDmZLNX6nScs5DERY4S3UGrPfE=; b=hXgc2iaedMAmBH
	PsJpu64vmBc/sslNRV0qxTNUPRS8sx49icuUnvVI7j3W13FH30vIbzlMgmwGKf6e9ANjCRia3B4AZ
	LI27WIf5gCcDBnY2EdYLkLKY3XZbsYdEA177hy7qpZqwbSOYgjTlI0cnDin1UzYTpnmcHy9NNIPL3
	nfIAmaFNb3qDQ2cTKXYHOsyI2IGa/pnJ+O43wV43rG6p263RxlXnBKGdFXsXPT98TY1G1aUmw3x8c
	h3APD5bxa15EP1ywFk8AnV8UqqhElLSjYk+stkwPi3oiMd+f31aHFwItjpVj8hneP2o5XwhDSvqdZ
	svdzhKTB/JuG5V0wwEDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVRY1-00000000Syp-25Bo;
	Fri, 05 Jun 2026 10:13:05 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVRXy-00000000SyQ-1Qev
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 10:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1780654354;
	bh=0lr/zu4IPfaQqyGBv4gvTpdr4/Ndpx8k3h5r0Jez7fY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nQcW91k/M1H0NM2NzjsUaNEMoqJt6rlag5zt1j8Q6ZipM4Q6fKQIm7weISZAsAGsg
	 RWI5CY6VzERPkp/GRn+3rwsL6vfb0FalvGBFTtbnrCuGhMUk9jcVb0YFr5Z1XhmclZ
	 Aj4BiFlzT9umvxCHfYn3H2TLc5xP2ZECa1l2XRpXzFYbnxxu1J4U7GW5RdgxhrO/LX
	 InheyCF8HfmoiU6r0jA54Movha8YBPfHUUCcgyVkiMwQO4ha3CQxvNezSIg8M8PQPb
	 97xZRWLaA/g/LcYCj/LyNjsaSQOi3Hu4EToZ9v1cRVsy90hfED6pGfmpVSurSEA5Z2
	 1XC+58DNCFF9g==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id BE0C7B22013F;
	Fri,  5 Jun 2026 12:12:31 +0200 (CEST)
Message-ID: <7ff3ec2b-fbc3-46b3-9dd8-71c193db4059@freeshell.de>
Date: Fri, 5 Jun 2026 03:12:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dts: riscv: spacemit: k3: Fix I/O power settings
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Inochi Amaoto <inochiama@gmail.com>,
 Han Gao <gaohan@iscas.ac.cn>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260518-07-dts-pinctrl-io-power-v1-1-abe19c14a726@kernel.org>
 <9585b7c7-100c-4d77-bed1-d2b6b25b3940@freeshell.de>
 <20260605085802-GKD3727415@kernel.org>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260605085802-GKD3727415@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_031302_847614_54F92302 
X-CRM114-Status: GOOD (  22.33  )
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



On 6/5/26 01:58, Yixun Lan wrote:
> Hi E Shattow,
> 
> On 13:17 Wed 03 Jun     , E Shattow wrote:
>>
>> Hi Yixun,
>>
>> This property on its own does not seem to be enough to get the ethernet
>> network port functional on Sipeed K3 Pico-ITX 32GB model that I have,
>> when it is loading Debian 13 Trixie debian-installer netinst initramfs
>> (with cross-compiled Linux kernel and modules from -next 20260602).
>>
> I don't think your problem directly connect to this pacth..
> 
>> Reproducer instructions for cross-compiling and debian-installer netinst
>> initramfs modification at:
>> https://wiki.debian.org/InstallingDebianOn/SpacemiT/K3PicoITX?action=recall&rev=2
>>
>> In addition to those instructions above I am using within the factory
>> pre-installed vendor U-Boot the following commands to try what your
>> patch does:
>>
>> fdt addr $fdt_addr_r
>> fdt resize
>> fdt header get filesize totalsize
>> fdt rm /soc/pinctrl@d401e000 spacemit,apbc
>> fdt get value spacemit_apbc_phandle /soc/system-controller@d4015000 phandle
>> fdt set /soc/pinctrl@d401e000 spacemit,apbc <$spacemit_apbc_phandle>
>>
>> I then verify within Linux environment the presence of
>> /sys/firmware/devicetree/base/soc/pinctrl@d401e000/spacemit,apbc
>>
>> The same Linux kernel and modules as modified into the installer then do
>> have functional ethernet networking on that board if running from the
>> installed system and with the spacemit,apbc devicetree property. Is this
>> a dependency or ordering issue of the modules, or the Kconfig options?
>>
> I've checked with the failure kernel dmesg log (you provided offline),
> the dwmac driver has been probed twice, with first time failed, it
> might be the PHY driver not been initialized, adjust following 
> configuration works for me..
> 
> CONFIG_STMMAC_ETH=y
> CONFIG_REALTEK_PHY=y
> CONFIG_I2C_K1=y
> 
> the PMIC/Power Regulator rely on I2C driver..
> 
>> Also, the more general problem is that cycling rmmod and modprobe on the
>> ethernet networking related modules fails:
>>
>> rmmod dwmac_spacemit
>> rmmod stmmac_platform
>> rmmod stmmac
>> rmmod mdio
>> modprobe dwmac_spacemit
>>
>> [ 1487.618517] mdio_bus stmmac-0: MDIO device at address 1 is missing.
>>
>> [ 1487.623815] spacemit-dwmac cac80000.ethernet end0: renamed from eth0
>>
>> rmmod dwmac_spacemit
>> rmmod stmmac_platform
>> rmmod stmmac
>> rmmod mdio
>> modprobe dwmac_spacemit
>>
> Need to investigate, could be problem of resource deinitialization issue..
> 
>> [ 1539.374486] spacemit-dwmac cac80000.ethernet end0: cannot attach to
>> PHY (erro
>> r: -ENODEV)
>> [ 1615.299451] spacemit-dwmac cac80000.ethernet end0: stmmac_dvr_remove:
>> removin
>> g driver
>>
>> Please advise how to troubleshoot?  Thanks,
>>
>> - E Shattow
>>
> 

Yes, confirming now that the network is functional (with -next 20260603
from 4th Jun 2026, inclusive of this patch as-is) in debian-installer
netinst by manually configure and ping the network interface before the
application begins the network probe action. After the network probe
action the network device is not reachable.

I'm not experienced with internals of debian-installer to know if the
module is rmmod/modprobe cycled or how else this may be triggered by the
debian-installer application and its network probe action. I do note the
following, that 'lsmod' output has changed:

 Module                  Size  Used by
 sd_mod                167936  0
 uas                    36864  0
 usb_storage           110592  1 uas
 scsi_mod              405504  3 sd_mod,usb_storage,uas
 scsi_common            20480  4 scsi_mod,sd_mod,usb_storage,uas
 onboard_usb_dev        24576  0
 xhci_plat_hcd          24576  0
 xhci_hcd              569344  1 xhci_plat_hcd
 dwc3_generic_plat      12288  0
 dwc3                  471040  1 dwc3_generic_plat
-realtek                61440  0
+realtek                61440  1
 phy_package            16384  1 realtek
 udc_core              114688  1 dwc3
 roles                  20480  1 dwc3
 dwmac_spacemit         12288  0
 stmmac_platform        40960  1 dwmac_spacemit
 stmmac                495616  2 stmmac_platform,dwmac_spacemit
 usbcore               536576  6
xhci_hcd,onboard_usb_dev,usb_storage,uas,xhci_pl
 at_hcd,dwc3
 pcs_xpcs               36864  1 stmmac
 phylink               118784  2 stmmac,pcs_xpcs
 i2c_k1                 28672  0
 usb_common             24576  6
xhci_hcd,usbcore,dwc3_generic_plat,xhci_plat_hcd
 ,dwc3,udc_core
 phy_k1_usb2            12288  2

before and after probe respectively. There is no other change in the
'lsmod' output. The corresponding change in dmesg as follows:

 [    4.911996]  sda: sda1

 [    4.912160] sd 0:0:0:0: [sda] Attached SCSI removable disk

 [   14.820291] workqueue: work func deferred_probe_timeout_work_func
enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.

+[   33.767106] dldo4: disabling

+[   47.890240] spacemit-dwmac cac80000.ethernet end0: Register
MEM_TYPE_PAGE_POOL RxQ-0
+[   47.920334] spacemit-dwmac cac80000.ethernet end0: PHY [stmmac-0:01]
driver [RTL8211F Gigabit Ethernet] (irq=POLL)

+[   47.921411] dwmac4: Master AXI performs any burst length

+[   47.921426] spacemit-dwmac cac80000.ethernet end0: No Safety
Features support found
+[   47.921791] spacemit-dwmac cac80000.ethernet end0: IEEE 1588-2008
Advanced Timestamp supported

+[   47.921958] spacemit-dwmac cac80000.ethernet end0: registered PTP
clock
+[   47.921966] spacemit-dwmac cac80000.ethernet end0: configuring for
phy/rgmii-id link mode

+[   49.087144] spacemit-dwmac cac80000.ethernet end0: Register
MEM_TYPE_PAGE_POOL RxQ-0
+[   49.128304] spacemit-dwmac cac80000.ethernet end0: PHY [stmmac-0:01]
driver [RTL8211F Gigabit Ethernet] (irq=POLL)

+[   49.238342] dwmac4: Master AXI performs any burst length

+[   49.238357] spacemit-dwmac cac80000.ethernet end0: No Safety
Features support found
+[   49.238400] spacemit-dwmac cac80000.ethernet end0: IEEE 1588-2008
Advanced Timestamp supported

+[   49.238580] spacemit-dwmac cac80000.ethernet end0: registered PTP
clock
+[   49.238588] spacemit-dwmac cac80000.ethernet end0: configuring for
phy/rgmii-id link mode

+[   52.325163] spacemit-dwmac cac80000.ethernet end0: Link is Up -
1Gbps/Full - flow control rx/tx

Thanks for looking into this,

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
