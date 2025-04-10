Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605BDC369A2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 01:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WyjqLKm655yN7G/y5Njx62SYkUtXId84qAa4ICs8EY4=; b=BoNzQ4fAECjWkn
	LxjlKAU52ASeSNP0R7s911C9y+OkzL/VYJ0F3xh+70IWcBtDmuNU59Z0SX1CzMcaVLiEC+KmgHxYH
	DiUu67e4LfGSSRTttG0F/hzEdkt393lf1SKOWUAytt6AuKLmrhcbryitv95LCkE3Obl9h8wSmVzu5
	hDI5pBNiT4T9b0ETUe4oCcAj70AcGk7Y0PdL8ZWooeNYQ2hacTCyEcGM8xT0PQ30yZ0Grt5QPoeaI
	EEBF/xgLR7n37Q8vBf630KPhUP4Qj4bh5tTSdebzoPECW0uussncKw+wGoDlInbcqARDlUFb943Mu
	IblCUK7wRUWxvg4ULbiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gy6-00000008y6j-0NPf;
	Thu, 10 Apr 2025 01:44:38 +0000
Received: from mail-m81158.xmail.ntesmail.com ([156.224.81.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2god-00000008wqE-36H1;
	Thu, 10 Apr 2025 01:34:53 +0000
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [27.18.106.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 114dfc3d8;
	Thu, 10 Apr 2025 09:34:38 +0800 (GMT+08:00)
Message-ID: <d500b879-a4fe-4f29-a9d0-c29826d21e31@whut.edu.cn>
Date: Thu, 10 Apr 2025 09:34:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] usb: dwc3: add spacemit dwc3 glue layer driver
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
 <20250407-b4-k1-usb3-v3-2-v1-6-bf0bcc41c9ba@whut.edu.cn>
 <20250409223452.svwckotac4dbze6v@synopsys.com>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <20250409223452.svwckotac4dbze6v@synopsys.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGUNPVh9LTkoYTBpKQk4fTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS01VSUhMWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxPVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a961d55b85703a1kunm114dfc3d8
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ogg6OTo4MTJNDjJKEiIDSwwp
	LjQwCh5VSlVKTE9PSU9DQ0NOTUNIVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS01VSUhMWVdZCAFZQU5KQ0w3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_183452_062418_115FC537 
X-CRM114-Status: GOOD (  16.19  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/10/25 6:34 AM, Thinh Nguyen wrote:
> On Mon, Apr 07, 2025, Ze Huang wrote:
>> Add SpacemiT glue logic to support dwc3 HC on K1 SoC. The driver manages
>> clock, reset and interrupt resource.
>>
>> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
>> ---
>>   drivers/usb/dwc3/Kconfig         |   7 +++
>>   drivers/usb/dwc3/Makefile        |   1 +
>>   drivers/usb/dwc3/dwc3-spacemit.c | 127 +++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 135 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
>> index 310d182e10b50b253d7e5a51674806e6ec442a2a..3c30680fa4f83565fc03c6800e867c6ced0fe101 100644
>> --- a/drivers/usb/dwc3/Kconfig
>> +++ b/drivers/usb/dwc3/Kconfig
>> @@ -189,4 +189,11 @@ config USB_DWC3_RTK
>>   	  or dual-role mode.
>>   	  Say 'Y' or 'M' if you have such device.
>>   
>> +config USB_DWC3_SPACEMIT
>> +	tristate "Spacemit Platforms"
> Does this depend on other configs like OF and COMMON_CLK?

Yes, depends on them, will fix Kconfig entries in next version

>
>> +	default USB_DWC3
>> +	help
>> +	  Support SPACEMIT platforms with DesignWare Core USB3 IP.
>> +	  Say 'Y' or 'M' here if you have one such device
>> +
>>   endif
>> diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
>> index 124eda2522d9c1f4caab222ec9770d0deaf655fc..61a87765c0c591e0a53c33b5a6544db056166f96 100644
>> --- a/drivers/usb/dwc3/Makefile
>> +++ b/drivers/usb/dwc3/Makefile
>> @@ -56,3 +56,4 @@ obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
>>   obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
>>   obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
>>   obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
>> +obj-$(CONFIG_USB_DWC3_SPACEMIT)		+= dwc3-spacemit.o
...
>> +
>> +#ifdef CONFIG_PM_SLEEP
>> +static int dwc3_spacemit_suspend(struct device *dev)
>> +{
>> +	struct dwc3_spacemit *spacemit = dev_get_drvdata(dev);
>> +
>> +	clk_disable_unprepare(spacemit->clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static int dwc3_spacemit_resume(struct device *dev)
>> +{
>> +	struct dwc3_spacemit *spacemit = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = clk_prepare_enable(spacemit->clk);
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct dev_pm_ops dwc3_spacemit_dev_pm_ops = {
>> +	SET_SYSTEM_SLEEP_PM_OPS(dwc3_spacemit_suspend, dwc3_spacemit_resume)
>> +};
>> +#endif /* CONFIG_PM_SLEEP */
>> +
> Use DEFINE_SIMPLE_DEV_PM_OPS to remove the CONFIG_PM_SLEEP guards.

thanks

>
>> +static struct platform_driver dwc3_spacemit_driver = {
>> +	.probe		= dwc3_spacemit_probe,
>> +	.remove		= dwc3_spacemit_remove,
>> +	.driver		= {
>> +		.name	= "spacemit-dwc3",
>> +		.of_match_table = spacemit_dwc3_match,
>> +#ifdef CONFIG_PM_SLEEP
>> +		.pm	= &dwc3_spacemit_dev_pm_ops,
>> +#endif /* CONFIG_PM_SLEEP */
>> +	},
>> +};
>> +module_platform_driver(dwc3_spacemit_driver);
>> +
>> +MODULE_AUTHOR("Wilson <long.wan@spacemit.com>");
> The author is different than the commiter? Also, is there a last name?

You're right, I missed Signed-off-by tag for Wilson in commit message

>
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("DesignWare USB3 Spacemit Glue Layer");
>>
>> -- 
>> 2.49.0
>>
> The logic in this glue driver looks quite simple. Can this platform work
> as dwc3-of-simple?

Yes, indeed simple.
As Krzysztof mentioned, creating glue nodes is not ideal for DWC USB. I
would drop the glue driver and use dwc3/core.c as fallback, similar to
what Rockchip did[1].

[1] 
https://www.kernel.org/doc/Documentation/devicetree/bindings/usb/rockchip%2Cdwc3.yaml

>
> Thanks,
> Thinh


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
