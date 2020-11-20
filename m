Return-Path: <SRS0=Au/l=E2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B135DC388F9
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2020 00:21:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3692822240
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2020 00:21:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g4oGAXmC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="HRXN0aQq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="auVVJCQh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3692822240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=Ms880rOa5HSQ0cHgXSHeHotVXWFXFLsVNCKPQmaO3aM=; b=g4oGAXmCQ0UTJlzON69EWQ1Yo
	aLgangnwIBIhNVf0tKzTRhHe5pegAfBR9fva0PH8jbeKHcoRh9wOY75WtvF5FGtjJ6iuuRJInPqHu
	kkQ69tbteYj07nIwYXPSQJcKMJayyUqj2t0xMhkBi2ri67O0ddRYVn5t62IqJcw9dEG8uIJXrwwni
	w74pgGQgF7QQQHXR+MWXfuiJD+Bq8YNchfYhgZuchC5bz6Hw5rDDgdqto/RLH5/utn9V/27MWbmrR
	2IwTgOnCc+a2bJTZI6+vgpO3s+fnAYwihRGaGxNF1B7B124m1R/kQsoA7E68NXR6WC63IZTj6kt3c
	KrIF/gd6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfuAZ-0005hm-Fi; Fri, 20 Nov 2020 00:20:55 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfuAR-0005fg-RU
 for linux-riscv@lists.infradead.org; Fri, 20 Nov 2020 00:20:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605831826; x=1637367826;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=bwxkwyXmLSHg9P0W5TO9tlqlXW073nFGE0bpPETD8Fk=;
 b=HRXN0aQqmxGaNIhOliEPux/JSVBvdQDHCCTXmla7KVgS0wscfwJsJLMl
 RmJl3dzQfcsMW+SPA4b+EeciV+tRZwVn20uAR9C7lma5+TFPjd/ZlvbDV
 G4KH3n7UzMpmdVlctQjciZGdgJqetPDCCo/SpOTMx20HntzgQWdIEearQ
 pyJ9PqnJ0bnBegvAXl4qS8H0K+OFSUArMtnCtnSLbjtkS+VENQu/+ViUR
 DkHhYUOC7pVWdUHNHVoYG5+VCYx9J1DechSm+yTB0p3DUsiXDBqNImkyb
 Z1Vm1wKbSN68dSPxWEy+52SmWLNb6ZB8iCU0v6+ERIs9/2kFHzoJm4vty g==;
IronPort-SDR: 4La6vlLM8hpxBSkOT4jUXktbvQ5M+uUTA++97cnWc4SF3oOVPXUS/U5LC/ailO0k5JLHhx7E3g
 oOow6UyWZMUORltK6EQ2u7s/3tlq3mNisaWSRPklC7oeNMt0e/8W3aYCqbI/sWQ6z8u1YzI/FH
 CaUFoyzBJWBGiQYb/L6kK9KlPQ+0LMbbkg7E8/TsWCByJvWXMLJbJpEsyPeiELgc8bN7UvHmfi
 59i63fz8BVmv1Hj9uxfbxbWd//zW+6dOYadRxwqlIX0XbqVl4qorlR8N0rQqAbiWIoueWBN8UE
 zRg=
X-IronPort-AV: E=Sophos;i="5.78,354,1599494400"; d="scan'208";a="256631481"
Received: from mail-bn8nam08lp2042.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.42])
 by ob1.hgst.iphmx.com with ESMTP; 20 Nov 2020 08:23:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jI3ER1QzVOfGk+xTRMKUaRMfyHsCwmjrh9J5w2X0je9XOKMPpMq9+5ntizHR/yZ9VAwObDoYfcV78xA/ZupDfhqIvdz+I3mqTUVFj8jfgYiiFsbSvbHCKXIVh2pW+XGYqVECHucTrI4jdT5Oy0c4A4x+C3oVyq1PLVR+IKSlBaIyKM4LKlVYBE4BDkfD2Tvb7xkauMSn2rD0yh19TJc+egqI6kH68HvntUnM0SdBBhetQTvZ7Fz06Mh9eKBKAfny/eBJStuHyX/1/tDzXN+6+z4vshvsmv+PAA36qSc11UGiqXRGXHCxM36VGM2K0nrljM9ugdqyDT4Y4wAkQPvwBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqMkfA2rapcuM1s5pKVgiY7gGfJu04GUaa074Xg++IQ=;
 b=A3tNDLi9eC71/7hEO6sRsx+/FZez/SslH3are+cbei4FwZZrduffDVyFwCNAg65xVWFzETiBzI4rsVVqXJZz9MAAYorEqAY+QGYcK7HChQsR+V/VmEbPNu5duMnZA2vQ95agONqBjAT7uCxOgdUY/AMPA6/PJ2I1+l+2OpYgP/vE92rmvXJRLwqeo5nXkdsd2NnXwAjkULBXxJ/kqqm4t1erVbLh4pF3w+6CihwoX2TgfZHmUKlKcrMbNwR9El/kNX+yWvv7dDMVdssUtFnG9svUfqNKQyLmddxE+ockfUdcVwf87aKuK+elP6U3vodoYBNSjJwWNHf9asRXZaFSyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqMkfA2rapcuM1s5pKVgiY7gGfJu04GUaa074Xg++IQ=;
 b=auVVJCQhwHS04rMPFKsWb10flcN+F3ecU3Dbvoeh0p0G7TJ3bx3noB1dbr9RII0v2jiQQ2RK7CBJkWoUpDLl2iPhHFJWtvVYLladNnLPWes5ZiOaWv2LBFVWqq9nifBeSpITEgbJJmlENPTtBpU967cx/4PlANw0gSvJiJehYIc=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB5058.namprd04.prod.outlook.com (2603:10b6:208:58::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 20 Nov
 2020 00:20:44 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.034; Fri, 20 Nov 2020
 00:20:44 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "conor.dooley@microchip.com" <conor.dooley@microchip.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 4/6] soc: add polarfire soc system controller
Thread-Topic: [PATCH 4/6] soc: add polarfire soc system controller
Thread-Index: AQHWvpYnwNtFLYxODk28dCxfuD0bUQ==
Date: Fri, 20 Nov 2020 00:20:44 +0000
Message-ID: <BL0PR04MB6514CA00C893EB9E23561860E7FF0@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201119170437.18519-1-conor.dooley@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:752d:4d55:43bb:285f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 24c391de-27be-4fd7-ca07-08d88cea1ef2
x-ms-traffictypediagnostic: BL0PR04MB5058:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR04MB505856A891B5A3C264876A72E7FF0@BL0PR04MB5058.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /p5r1VOcRVqHQrdoicrEEsCoowNot9rWzSQJmAQLmqFF/RS3G37ISSqf+7WvXcDEVBz1txtUyMQ4pyVNiyYHoSTKpfyg3hPIflO3U0+LvvnYPaBmQ8FK9pgYJhevf7DyWvHDS1y55oODqjlf3q41+ouojWFy8zOd5/Yv4UUi+tJibtRoc7IjnSWACyXIE8KYUQFgx72JGHhaARHw4wq3W2lsmkNIm58speLrKtmo4vvQxzd70IE/vfwFRQ+qRVQUq6+tTxmGxBMvcKNGGrs9FXuNSS+t0T9z9M9n1z/X2WkDpbWI/KszkJbl0N2J8JjG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(71200400001)(7416002)(8676002)(5660300002)(4326008)(9686003)(55016002)(186003)(110136005)(33656002)(54906003)(2906002)(478600001)(86362001)(7696005)(83380400001)(66476007)(53546011)(52536014)(316002)(76116006)(64756008)(91956017)(66946007)(66446008)(66556008)(8936002)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: L6qpHul4sS8xaJV7Jd7vnmrdomGVCrISTN1jk3WgKV7WfEf9iZDBcO0UbUQ7T8MLj53yf/XLVS+c/Rv0N2UbWMAXJwLgakIz1dDfiTtki6Nd8DvKxatdxBA5/tWWThd+JdZqABS1dJRMoqnhZVkXLD6XxNkNjpLTAXHmJINWETEqIBbOAgRYpYkMFGQASb4to/+C9YPY7hgfAHHL66NV/SmZT5fZZA39ynTJPKA2Ik9fBvocbZGTs5kRKjeuMFgK5Sf32TwdOWHIcvpkWoflGEneEzDNuaYKRubEaZmeHmbI1mfG9K6XpxGYblKzZMUzC+cz21HZ/qEelGhLQ+UF8HqZBR84U/VC3kKueS2RReeCu0euKDOCGgy8KRB6Y6MyFv/pTHBfKaH4nDvpj547K7JvF0YqygmZlrX9SmGp+UaQGP5mh8z4BTUBkDXWmAA28XnHlnKAUJ+qnDfHBeLkjOikFe7QqkgeBDb/Y/6tSJMTwx80QxTMcF88J/63GZcq+WlfA1nHVhX7HDkB35gQombq970XfiZ372YaLh//nLVKuIYocNn4nrpyywrBZBIdzw1us/+NBM4vKikc6G1B/lBEcCEkDkwbHZCkqKCO3Pu9C18+m34UXv/bBe7tS5oyjA+BJ+rQkpk1SGtn35/brPeys9g3LwfKeAWfXmYZOAVJl3TiqXezK+ppxE7xEIM0vGY5QW0t9aSPh37GOn0drQ==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c391de-27be-4fd7-ca07-08d88cea1ef2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2020 00:20:44.0606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WepkCaSYSjFNjlbakemjvtTp2L1hVLyXhrVFr4nY20vYBayoazo/Hd7kXkR2rG9TEvbP4DxK5KbCpfjeQ4wPnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB5058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_192048_129759_E98C9011 
X-CRM114-Status: GOOD (  23.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/11/20 2:05, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> This driver provides an interface for other drivers to access the
> functions of the system controller on the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/soc/Kconfig                         |   1 +
>  drivers/soc/Makefile                        |   1 +
>  drivers/soc/microchip/Kconfig               |  10 ++
>  drivers/soc/microchip/Makefile              |   1 +
>  drivers/soc/microchip/mpfs_sys_controller.c | 136 ++++++++++++++++++++
>  5 files changed, 149 insertions(+)
>  create mode 100644 drivers/soc/microchip/Kconfig
>  create mode 100644 drivers/soc/microchip/Makefile
>  create mode 100644 drivers/soc/microchip/mpfs_sys_controller.c
> 
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index 425ab6f7e375..22cb097bcbdc 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -9,6 +9,7 @@ source "drivers/soc/bcm/Kconfig"
>  source "drivers/soc/fsl/Kconfig"
>  source "drivers/soc/imx/Kconfig"
>  source "drivers/soc/ixp4xx/Kconfig"
> +source "drivers/soc/microchip/Kconfig"
>  source "drivers/soc/mediatek/Kconfig"
>  source "drivers/soc/qcom/Kconfig"
>  source "drivers/soc/renesas/Kconfig"
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index 36452bed86ef..fb084cf2d12e 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_ARCH_GEMINI)	+= gemini/
>  obj-y				+= imx/
>  obj-$(CONFIG_ARCH_IXP4XX)	+= ixp4xx/
>  obj-$(CONFIG_SOC_XWAY)		+= lantiq/
> +obj-$(CONFIG_SOC_MICROCHIP_POLARFIRE)	+= microchip/
>  obj-y				+= mediatek/
>  obj-y				+= amlogic/
>  obj-y				+= qcom/
> diff --git a/drivers/soc/microchip/Kconfig b/drivers/soc/microchip/Kconfig
> new file mode 100644
> index 000000000000..8fdba8b5eae3
> --- /dev/null
> +++ b/drivers/soc/microchip/Kconfig
> @@ -0,0 +1,10 @@
> +config MPFS_SYS_CONTROLLER
> +	tristate "MPFS_SYS_CONTROLLER"
> +	depends on MPFS_MBOX
> +	help
> +	  This driver adds support for the Polarfire SoC system controller.
> +
> +	  To compile this driver as a module, choose M here. the
> +	  module will be called mpfs_system_controller.
> +
> +	  If unsure, say Y.

Say Y if unsure ? If someone is unsure they are using a polarfire, they I would
say all hope is lost, so "say N" sound like a better idea to avoid compiling
unnecessary drivers...

> diff --git a/drivers/soc/microchip/Makefile b/drivers/soc/microchip/Makefile
> new file mode 100644
> index 000000000000..23b1f42a37db
> --- /dev/null
> +++ b/drivers/soc/microchip/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_MPFS_SYS_CONTROLLER)	+= mpfs_sys_controller.o
> diff --git a/drivers/soc/microchip/mpfs_sys_controller.c b/drivers/soc/microchip/mpfs_sys_controller.c
> new file mode 100644
> index 000000000000..0074ae529a2e
> --- /dev/null
> +++ b/drivers/soc/microchip/mpfs_sys_controller.c
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Microchip MPFS system controller driver
> + *
> + * Copyright (c) 2020 Microchip Corporation. All rights reserved.
> + *
> + * Author: Conor Dooley <conor.dooley@microchip.com>
> + *
> + */
> +
> +#include <linux/slab.h>
> +#include <linux/module.h>
> +#include <linux/interrupt.h>
> +#include <linux/of_platform.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/platform_device.h>
> +#include <soc/microchip/mpfs.h>
> +
> +static DEFINE_MUTEX(transaction_lock);
> +
> +struct mpfs_sys_controller {
> +	struct mbox_client client;
> +	struct mbox_chan *chan;
> +	struct completion c;
> +	u32 enabled;
> +	void *response;
> +	u16 response_size_bytes;
> +};
> +
> +int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg,
> +			      void *response, u16 response_size_bytes)
> +{
> +	int ret;
> +
> +	mpfs_client->response = response;
> +	mpfs_client->response_size_bytes = response_size_bytes;
> +
> +	mutex_lock_interruptible(&transaction_lock);
> +
> +	reinit_completion(&mpfs_client->c);
> +
> +	ret = mbox_send_message(mpfs_client->chan, msg);
> +

No need for this empty line.

> +	if (ret >= 0U) {

Please stop with the 0u and 0U... Just use "0".

> +		if (wait_for_completion_timeout(&mpfs_client->c, HZ)) {
> +			ret = 0U;
> +		} else {
> +			ret = -ETIMEDOUT;
> +			WARN_ONCE(1, "MPFS sys controller transaction timeout");

Why not dev_warn() ?

> +		}
> +	} else {
> +		dev_err(mpfs_client->client.dev,
> +			"mpfs sys controller transaction returned %d\r\n", ret);
> +	}
> +
> +	mutex_unlock(&transaction_lock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(mpfs_blocking_transaction);
> +
> +static void rx_callback(struct mbox_client *client, void *msg)
> +{
> +	struct mpfs_sys_controller *mpfs_client =
> +		container_of(client, struct mpfs_sys_controller, client);
> +
> +	memcpy(mpfs_client->response, (u8 *)msg,
> +	       mpfs_client->response_size_bytes);
> +
> +	complete(&mpfs_client->c);
> +}
> +
> +static int mpfs_sys_controller_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mpfs_sys_controller *mpfs_client;
> +
> +	mpfs_client = devm_kzalloc(dev, sizeof(*mpfs_client), GFP_KERNEL);
> +	if (!mpfs_client)
> +		return -ENOMEM;
> +
> +	mpfs_client->client.dev = dev;
> +	mpfs_client->client.rx_callback = rx_callback;
> +	mpfs_client->client.tx_block = 1U;
> +
> +	mpfs_client->chan = mbox_request_channel_byname(&mpfs_client->client,
> +							"mbox-mpfs");
> +	if (IS_ERR(mpfs_client->chan)) {
> +		int ret = PTR_ERR(mpfs_client->chan);
> +
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get mbox channel: %d\n", ret);
> +		return ret;
> +	}
> +
> +	init_completion(&mpfs_client->c);
> +
> +	platform_set_drvdata(pdev, mpfs_client);
> +
> +	dev_info(&pdev->dev, "Registered MPFS system controller driver\n");
> +
> +	return 0;
> +}
> +
> +struct mpfs_sys_controller *
> +mpfs_sys_controller_get(struct device_node *mss_node)
> +{
> +	struct platform_device *pdev = of_find_device_by_node(mss_node);
> +
> +	if (!pdev)
> +		return NULL;
> +
> +	return platform_get_drvdata(pdev);
> +}
> +EXPORT_SYMBOL(mpfs_sys_controller_get);
> +
> +static const struct of_device_id mpfs_sys_controller_of_match[] = {
> +	{
> +		.compatible = "microchip,polarfire-soc-sys-controller",
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mpfs_sys_controller_of_match);
> +
> +static struct platform_driver mpfs_sys_controller_driver = {
> +	.driver = {
> +		.name = "mpfs-sys-controller",
> +		.of_match_table = mpfs_sys_controller_of_match,
> +	},
> +	.probe = mpfs_sys_controller_probe,
> +};
> +module_platform_driver(mpfs_sys_controller_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
> +MODULE_DESCRIPTION("MPFS system controller driver");
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
