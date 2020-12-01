Return-Path: <SRS0=guVx=FF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BD9C64E7A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 12:18:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A6AC20663
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 12:18:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y9svc7mX"
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E4hh4wDGwl6IjFEgu+lLVEmJWNBUbuVRX/fEYZ/eGAI=; b=Y9svc7mX81TWqWX0JQdY3x+IK
	6Olg0hwEAwIHvYTYCmvkT9RxQ60gB8uL1t7ZtjL6fcUeT45Ramb/MOfgvtDyXs/+q32/iX3bIfld4
	xtXWv+bZiKth8sZr3m9X+4Ftg1Se3BT9ny4EVXpbIeluLOeuVNJEqXhwHLWTewhDJJwiAHtiAglIR
	eptnefMCLXxsedV1zQQKQ02R2JLF6sEbNcvqqC3Ib4FeMZg6j8Qg+HXd2grSgxrpfSQ6ILo3uhN+9
	OXFA5KdDLCOpR6JjYWb7fvc8u0khHY7feL1SvjLsSVDWHmVZax0K4r6XXIxFsrC9q5ZDmpOOVRmf4
	xnQ9MZpGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk4c2-0007uI-GJ; Tue, 01 Dec 2020 12:18:30 +0000
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk4by-0007tP-9G
 for linux-riscv@lists.infradead.org; Tue, 01 Dec 2020 12:18:27 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.18])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1kk4bp-0007er-Sa; Tue, 01 Dec 2020 12:18:17 +0000
Subject: Re: [PATCH v2 3/5] soc: add polarfire soc system controller
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "conor.dooley@microchip.com" <conor.dooley@microchip.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20201201110257.28507-1-conor.dooley@microchip.com>
 <CH2PR04MB6522C138E30D5E53FD1317F2E7F40@CH2PR04MB6522.namprd04.prod.outlook.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <33138723-73d2-1460-2158-bdfc51b4c5c4@codethink.co.uk>
Date: Tue, 1 Dec 2020 12:18:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CH2PR04MB6522C138E30D5E53FD1317F2E7F40@CH2PR04MB6522.namprd04.prod.outlook.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_071826_418171_9B300E9F 
X-CRM114-Status: GOOD (  23.66  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "cyril.jean@microchip.com" <cyril.jean@microchip.com>,
 "david.abdurachmanov@gmail.com" <david.abdurachmanov@gmail.com>,
 "daire.mcnamara@microchip.com" <daire.mcnamara@microchip.com>,
 Anup Patel <Anup.Patel@wdc.com>, Atish Patra <Atish.Patra@wdc.com>,
 "lewis.hanly@microchip.com" <lewis.hanly@microchip.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 01/12/2020 12:00, Damien Le Moal wrote:
> On 2020/12/01 20:03, conor.dooley@microchip.com wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> This driver provides an interface for other drivers to access the
>> functions of the system controller on the Microchip PolarFire SoC.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   drivers/soc/Kconfig                         |   1 +
>>   drivers/soc/Makefile                        |   1 +
>>   drivers/soc/microchip/Kconfig               |  10 ++
>>   drivers/soc/microchip/Makefile              |   1 +
>>   drivers/soc/microchip/mpfs_sys_controller.c | 135 ++++++++++++++++++++
>>   5 files changed, 148 insertions(+)
>>   create mode 100644 drivers/soc/microchip/Kconfig
>>   create mode 100644 drivers/soc/microchip/Makefile
>>   create mode 100644 drivers/soc/microchip/mpfs_sys_controller.c
>>
>> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
>> index 425ab6f7e375..22cb097bcbdc 100644
>> --- a/drivers/soc/Kconfig
>> +++ b/drivers/soc/Kconfig
>> @@ -9,6 +9,7 @@ source "drivers/soc/bcm/Kconfig"
>>   source "drivers/soc/fsl/Kconfig"
>>   source "drivers/soc/imx/Kconfig"
>>   source "drivers/soc/ixp4xx/Kconfig"
>> +source "drivers/soc/microchip/Kconfig"
>>   source "drivers/soc/mediatek/Kconfig"
>>   source "drivers/soc/qcom/Kconfig"
>>   source "drivers/soc/renesas/Kconfig"
>> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
>> index 36452bed86ef..fb084cf2d12e 100644
>> --- a/drivers/soc/Makefile
>> +++ b/drivers/soc/Makefile
>> @@ -14,6 +14,7 @@ obj-$(CONFIG_ARCH_GEMINI)	+= gemini/
>>   obj-y				+= imx/
>>   obj-$(CONFIG_ARCH_IXP4XX)	+= ixp4xx/
>>   obj-$(CONFIG_SOC_XWAY)		+= lantiq/
>> +obj-$(CONFIG_SOC_MICROCHIP_POLARFIRE)	+= microchip/
>>   obj-y				+= mediatek/
>>   obj-y				+= amlogic/
>>   obj-y				+= qcom/
>> diff --git a/drivers/soc/microchip/Kconfig b/drivers/soc/microchip/Kconfig
>> new file mode 100644
>> index 000000000000..40e5203c8ba0
>> --- /dev/null
>> +++ b/drivers/soc/microchip/Kconfig
>> @@ -0,0 +1,10 @@
>> +config MPFS_SYS_CONTROLLER
>> +	tristate "MPFS_SYS_CONTROLLER"
>> +	depends on MPFS_MBOX
>> +	help
>> +	  This driver adds support for the Polarfire SoC system controller.
>> +
>> +	  To compile this driver as a module, choose M here. the
>> +	  module will be called mpfs_system_controller.
>> +
>> +	  If unsure, say N.
>> diff --git a/drivers/soc/microchip/Makefile b/drivers/soc/microchip/Makefile
>> new file mode 100644
>> index 000000000000..23b1f42a37db
>> --- /dev/null
>> +++ b/drivers/soc/microchip/Makefile
>> @@ -0,0 +1 @@
>> +obj-$(CONFIG_MPFS_SYS_CONTROLLER)	+= mpfs_sys_controller.o
>> diff --git a/drivers/soc/microchip/mpfs_sys_controller.c b/drivers/soc/microchip/mpfs_sys_controller.c
>> new file mode 100644
>> index 000000000000..875a0671e196
>> --- /dev/null
>> +++ b/drivers/soc/microchip/mpfs_sys_controller.c
>> @@ -0,0 +1,135 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Microchip MPFS system controller driver
>> + *
>> + * Copyright (c) 2020 Microchip Corporation. All rights reserved.
>> + *
>> + * Author: Conor Dooley <conor.dooley@microchip.com>
>> + *
>> + */
>> +
>> +#include <linux/slab.h>
>> +#include <linux/module.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/mailbox_client.h>
>> +#include <linux/platform_device.h>
>> +#include <soc/microchip/mpfs.h>
>> +
>> +static DEFINE_MUTEX(transaction_lock);
>> +
>> +struct mpfs_sys_controller {
>> +	struct mbox_client client;
>> +	struct mbox_chan *chan;
>> +	struct completion c;
>> +	u32 enabled;
>> +	void *response;
>> +	u16 response_size_bytes;
>> +};
>> +
>> +int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg,
>> +			      void *response, u16 response_size_bytes)
>> +{
>> +	int ret;
>> +
>> +	mpfs_client->response = response;
>> +	mpfs_client->response_size_bytes = response_size_bytes;
>> +
>> +	mutex_lock_interruptible(&transaction_lock);
>> +
>> +	reinit_completion(&mpfs_client->c);
>> +
>> +	ret = mbox_send_message(mpfs_client->chan, msg);
>> +	if (ret >= 0) {
>> +		if (wait_for_completion_timeout(&mpfs_client->c, HZ)) {
>> +			ret = 0;
>> +		} else {
>> +			ret = -ETIMEDOUT;
>> +			dev_warn(mpfs_client->client.dev, "MPFS sys controller transaction timeout");
>> +		}
>> +	} else {
>> +		dev_err(mpfs_client->client.dev,
>> +			"mpfs sys controller transaction returned %d\r\n", ret);
>> +	}
>> +
>> +	mutex_unlock(&transaction_lock);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(mpfs_blocking_transaction);
>> +
>> +static void rx_callback(struct mbox_client *client, void *msg)
>> +{
>> +	struct mpfs_sys_controller *mpfs_client =
>> +		container_of(client, struct mpfs_sys_controller, client);
>> +
>> +	memcpy(mpfs_client->response, (u8 *)msg,
>> +	       mpfs_client->response_size_bytes);
>> +
>> +	complete(&mpfs_client->c);
>> +}
>> +
>> +static int mpfs_sys_controller_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct mpfs_sys_controller *mpfs_client;
>> +
>> +	mpfs_client = devm_kzalloc(dev, sizeof(*mpfs_client), GFP_KERNEL);
>> +	if (!mpfs_client)
>> +		return -ENOMEM;
>> +
>> +	mpfs_client->client.dev = dev;
>> +	mpfs_client->client.rx_callback = rx_callback;
>> +	mpfs_client->client.tx_block = 1U;
>> +
>> +	mpfs_client->chan = mbox_request_channel_byname(&mpfs_client->client,
>> +							"mbox-mpfs");
>> +	if (IS_ERR(mpfs_client->chan)) {
>> +		int ret = PTR_ERR(mpfs_client->chan);
>> +
>> +		if (ret != -EPROBE_DEFER)
>> +			dev_err(dev, "Failed to get mbox channel: %d\n", ret);
>> +		return ret;
> 
> You can replace all of this with
> 
> 		return dev_err_probe(dev, PTR_ERR(mpfs_client->chan),
> 				     ""Failed to get mbox channel\n");

you'll spam the error log if you get a lot of probe defferals.
I think the code as is fine.




-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
