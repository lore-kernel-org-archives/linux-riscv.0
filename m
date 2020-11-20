Return-Path: <SRS0=Au/l=E2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A4FC63777
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2020 00:06:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4677C22240
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2020 00:06:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CDxxm5Jx";
	dkim=permerror (0-bit key) header.d=wdc.com header.i=@wdc.com header.b="aEo76tnP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="PC4IWg4y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4677C22240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=VZkMpSeUnrBDFP8q8LiWLbKXCPqMOvUtiC8rjolCyBA=; b=CDxxm5JxhisvKK4p2sU0jF8J8
	DNIRpZdZApQXl2Gn991Uoim4XdmOVR5RMAuQqIruI1R8DWHSQwyHv1UpNMqTRxXl5efeul9RZvRuj
	tBeWACEew9g/tW+QXmoFpPbeZG3uX9pcNi8ZmV2zXxhu4uQpDFo9FP3K28uDOtj1PaCBsUTK5S14O
	QwQmq4beNSdz5N7lmyHkgU5MtqV1StPAYBDjKQqhCjMdto9KnXN3d7MRLjiKzUDu5StLjkeVuxxPE
	vyqftDYHB3853lEdYTB5zLE5I7xYS9vGcDt03Ps8en8yE9SZX/ZQWlmAXz8Gulq0fr6F86Cc2pZxF
	zaISjd7tQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kftwO-00049D-Nf; Fri, 20 Nov 2020 00:06:16 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kftwE-00045d-KP
 for linux-riscv@lists.infradead.org; Fri, 20 Nov 2020 00:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605831713; x=1637367713;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=Wwra0rOOeH6QWlFIIw81YBv1RBiMLNwe8SNUxew4OkM=;
 b=aEo76tnPhjK7aP0hEx//vAZtE3ZzOzOErU1VYXCXNbOtob+zMbsfcMuU
 AK1SH0JrERJw2gxL1aoiaL9R401bD4Q51axrO5MKv8On5OD9UvJkzVRY8
 zpPG3yX36C9GjDAZLJJqyOWDvZEQfZGlF88xigIksAjaTKeyoOxjjvD1Z
 vCHUTwi95CquCqs3y4d4swRCWLWgSgBPUNGp6YpyXpg17Je8xWMExBQ/s
 Fp48NeonCeBxyr5b2vH3+4zlXAf8VzFsohzFFHME+HH/ViXGutUYaYMnp
 ZfXB9h4fzMHsVhT844HJP5VoVxd5v/ca/5sDSfDtQvrAiJLzD71zy8Bz1 Q==;
IronPort-SDR: hrddj+5SWf2Jq7dgbUv3iOxqhR1fYttYye02sk2WcP97HXBi8qVJM0tsR1mk68bNeKzSRH4CEm
 mITnz1g0ScBCPD7D0MKjxn23EbaB73oPD7tf07h0fq5Mf0q7MqE9Ij8BoK90qelqhK5W7ygPeP
 0ylN1FgRa02RDint4F5qNObpVahh10wsurK9aRe2dpJ71kwRnScLpBcRxF5Us1Zl0DTE6TOGQ+
 HKEyMlqW3xP323F1oZBsyeBU0J6L6SWDSlGy5lfp/GrWU1d8rqTMWnYm9G9XUpr67jKcXghZZi
 mfg=
X-IronPort-AV: E=Sophos;i="5.78,354,1599494400"; d="scan'208";a="256630278"
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hgst.iphmx.com with ESMTP; 20 Nov 2020 08:21:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IElYOiSIcYv1wQu++huEAEgFxFRZEZLBVu8ClchtHuIc4E6zpShoEif5/x+1riGBoV8AMU5m/cV3CgXRrFo7Vg8goJ0eVLgIhti3CYAyCo3QULspyWjgIZoH1knjWHgdW6kPzKRrOb2ipV42itll9kDpSGJY+PWIRpTymvMIGkJnggpJkH4cqrnWtxsCVGftRQlgJV6vkGKZKnF2bLQpvn/hXgzsnmxnRvmJzFdWg/cKrxJi27aaEjnLwOt4/SuagsAoipYc0aLnx0ipWuTpBnhIeF9a9G0Li/vWMWQWBUdlPa7t7Zn4tf/521FYCrBHzLOfCxRLajUOytmBtjfV9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1f8wQKYGhxLxt0YSvYrWm9VcQNn/50PkViD7DjmI0Bw=;
 b=FDsr3x3nAjETX7xqWN6/AgIJqDOcEf3JcBuy8wL68xE7OEoWLcpfDcEui3OGz3ONzXRU9cLVeH6vuTvxLwVlOWCQBOlOPrpY+fv/T4nwLf+o4kvo2maX/yO9/K/S2mmpx2codEKxfQe0AL2Z3IcGhMRDKypwZeCax79E5MEL3oQNymGs6OO8sbNRswnv/44gQMakA+TcP5J+qYk5/1v8xZRgVnXCoaHyM9jNH+N9qrmy/gHnuwEPkRoFVsGjMaJL5dgByeomqBojF+/YCekktFEm9RIa3gGNrCD8B/oRYIY4FX8p5gjungm9W87yq3Q/LFxfo4Sag51ZCNBSCMqG2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1f8wQKYGhxLxt0YSvYrWm9VcQNn/50PkViD7DjmI0Bw=;
 b=PC4IWg4yyso7Mpvxr06fT3uY67DObaaI38N3ZGK7YgzCtMU9QOf6cYiBM+6ReeVGMTZtUJHWa5SWtqefkpGM4uxN/PYD55BOZZxL7Cnu2kaS8okDDJT6rx+fsGL+FnmuMgWLEceX9/eikC3OusS9+XqlQspu6vYHa+v0euT4lPg=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB6531.namprd04.prod.outlook.com (2603:10b6:208:1c5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 20 Nov
 2020 00:05:59 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.034; Fri, 20 Nov 2020
 00:05:59 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "conor.dooley@microchip.com" <conor.dooley@microchip.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/6] mbox: add polarfire soc system controller mailbox
Thread-Topic: [PATCH 1/6] mbox: add polarfire soc system controller mailbox
Thread-Index: AQHWvpYfVU6mtg0xhkO8MWTEOL0QWg==
Date: Fri, 20 Nov 2020 00:05:59 +0000
Message-ID: <BL0PR04MB6514AA9B313828842F7EF0D8E7FF0@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201119170419.18272-1-conor.dooley@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:752d:4d55:43bb:285f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2d8f19f3-d434-4fbf-e88f-08d88ce80f6a
x-ms-traffictypediagnostic: BL0PR04MB6531:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR04MB653170D6AEE878AE4B4EAFC8E7FF0@BL0PR04MB6531.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:935;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7VKYcd840xI2XP3K4vPDgTSMIVBbuf4Uhh78dBUzeTmtkKydOOc+AG78CnyRXtQw6ZnzPNgVrUWpokSRVkNB6XzlMmNRBgk2sz0VOqbCG2Jf18Hs9zXatNrNR+q8l7/FThOJnQdbMff5q0afDJSQ3QwoCRCapmVLPbjyDX0X7OaRKyvVUuezzDKIAWr1Od7GHVDIqur5CIiS/zRc/XI8K1KcpYGXkxG2UJRECAIVvAbEz/ra7jqwIJ/riaCqPQfBHP1KEAt+SJvUAi3peQnNg0D4aFj/SNUMPQN4+Q9Vc9axRWBLCzmX0geUXG6ZaCYErlzQyXyzzevwDuiXQjefCw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(83380400001)(6506007)(5660300002)(33656002)(9686003)(53546011)(8676002)(110136005)(15650500001)(54906003)(71200400001)(52536014)(91956017)(2906002)(316002)(478600001)(86362001)(76116006)(66556008)(64756008)(186003)(66446008)(8936002)(7416002)(30864003)(66476007)(4326008)(7696005)(55016002)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: /3tvznOZb+nSNqk7lPcDj5R/M3l9fJJ9Wy3z29GYWbjz2Py+sRUYKy2aOAk4a1yALNN8rSq2rt2Qk0xfsHrNTGb+bMXjyzPdV0blHv37/Q/jqJelrwea+7SrJWA6d6Tk2w5xYKitpLIeJSJD7qZ3yMZ4hvF9JS8APwDukbVfmsDQ3OWGmzjxohqH1eUCeZ8s9XcI5BU6noGyLw5etruqDLWGUnGI+kx9YsXvZQyIYRXfGsCIXSKkjc/4e2tQ4SWUmCqn7IbYH8dhs63gZbI2fZ2K+MfL8DK5nOmbc0X1KpwbjzTSAMm8VHuC6BkBQlJXkEJx3xYe03zXFmTx6Oj1JGHfRcLEna58SUaFLJF/saWo+4XUN2I46cr4uoFiQF42zoHKN3k7MtvQRKJ1mUB5nu1dPqbhT1/JDeZmeitClHCALsuLwLxO8FlJuRR+U7vldbHRhn3vog+K7p33p2rB4YIRvJLG4HwbmrtYhpGhH//NkQFrrT2+1p1XAXiQIJxK6+U7fROtURCXbuvRDYzNciwLfTgxvyzQ7YiNo+/z1dhiAX+N10pNKlYw0Cv+NOGvkGcLHLURmJnjFtHvQrPDghqmm27rRkhcJGO+ZAY6502wLen6kT32qiZWStoDbhe+VyPjSKI9pgMNHQt2MYLZS6ZzoadcgvtSP/tpZ+7vQRKidnfGRRDpZJk2gkHyexNqBdOJoxEHnYIJ80PEfGA5Ug==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8f19f3-d434-4fbf-e88f-08d88ce80f6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2020 00:05:59.0616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0CTubeCfse9NmaUlNMfDp4BgK0XsGcc0BQ6Yt2pPMIHJp4xkiUyyV0gwL0monF+p2Ws5V1ejTnFyVFr5CpYBIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB6531
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_190606_922830_FC039914 
X-CRM114-Status: GOOD (  24.47  )
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
> This driver adds support for the single mailbox channel of the MSS
> system controller on the Microchip PolarFire SoC. 
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/mailbox/Kconfig        |  12 ++
>  drivers/mailbox/Makefile       |   2 +
>  drivers/mailbox/mailbox-mpfs.c | 296 +++++++++++++++++++++++++++++++++
>  3 files changed, 310 insertions(+)
>  create mode 100644 drivers/mailbox/mailbox-mpfs.c
> 
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index 05b1009e2820..4881a519683a 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -153,6 +153,18 @@ config MAILBOX_TEST
>  	  Test client to help with testing new Controller driver
>  	  implementations.
>  
> +config MPFS_MBOX
> +	tristate "MPFS Mailbox"
> +	depends on HAS_IOMEM

Shouldn't this dependency be on SOC_MICROCHIP_POLARFIRE ?

> +	depends on SOC_MICROCHIP_POLARFIRE
> +	help
> +	  This driver adds support for the Polarfire SoC mailbox controller.
> +
> +	  To compile this driver as a module, choose M here. the
> +	  module will be called mailbox-mpfs.
> +
> +	  If unsure, say Y.
> +
>  config QCOM_APCS_IPC
>  	tristate "Qualcomm APCS IPC driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index 2e06e02b2e03..63f49b5bcc43 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -39,6 +39,8 @@ obj-$(CONFIG_BCM_PDC_MBOX)	+= bcm-pdc-mailbox.o
>  
>  obj-$(CONFIG_BCM_FLEXRM_MBOX)	+= bcm-flexrm-mailbox.o
>  
> +obj-$(CONFIG_MPFS_MBOX)	+= mailbox-mpfs.o
> +
>  obj-$(CONFIG_QCOM_APCS_IPC)	+= qcom-apcs-ipc-mailbox.o
>  
>  obj-$(CONFIG_TEGRA_HSP_MBOX)	+= tegra-hsp.o
> diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
> new file mode 100644
> index 000000000000..686ccd3317f9
> --- /dev/null
> +++ b/drivers/mailbox/mailbox-mpfs.c
> @@ -0,0 +1,296 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Microchip MPFS system controller/mailbox controller driver
> + *
> + * Copyright (c) 2020 Microchip Corporation. All rights reserved.
> + *
> + * Author: Conor Dooley <conor.dooley@microchip.com>
> + *
> + */
> +
> +#include <linux/io.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/interrupt.h>
> +#include <linux/platform_device.h>
> +#include <linux/mailbox_controller.h>
> +#include <soc/microchip/mpfs.h>
> +
> +#define SERVICES_CR_OFFSET			0x50u
> +#define SERVICES_SR_OFFSET			0x54u
> +#define MAILBOX_REG_OFFSET			0x800u
> +#define MSS_SYS_SUCCESS				0u

Is this really necessary ?

> +#define MSS_SYS_BUSY				0xefu
> +#define MSS_SYS_PARAM_ERR			0xffu

-EBUSY ? -EINVAL ?

> +#define MSS_SYS_MAILBOX_DATA_OFFSET 0u
> +
> +/***************SCBCTRL  SERVICES_CR register*************************/

I personally prefer more sober comments :)
May be drop the "*********************" ?

> +
> +#define SCBCTRL_SERVICESCR_REQ (0u)
> +#define SCBCTRL_SERVICESCR_REQ_MASK BIT(SCBCTRL_SERVICESCR_REQ)
> +
> +#define SCBCTRL_SERVICESCR_BUSY (1u)
> +#define SCBCTRL_SERVICESCR_BUSY_MASK BIT(SCBCTRL_SERVICESCR_BUSY)
> +
> +#define SCBCTRL_SERVICESCR_ABORT (2u)
> +#define SCBCTRL_SERVICESCR_ABORT_MASK BIT(SCBCTRL_SERVICESCR_ABORT)
> +
> +#define SCBCTRL_SERVICESCR_NOTIFY (3u)
> +#define SCBCTRL_SERVICESCR_NOTIFY_MASK BIT(SCBCTRL_SERVICESCR_NOTIFY)
> +
> +#define SCBCTRL_SERVICESCR_COMMAND (16u)
> +#define SCBCTRL_SERVICESCR_COMMAND_MASK (0xffffu << SCBCTRL_SERVICESCR_COMMAND)

If you use BIT(), then it would be better to use GENMASK() here.

> +
> +/***************SCBCTRL  SERVICES_SR registers*************************/
> +
> +#define SCBCTRL_SERVICESSR_REQ (0u)
> +#define SCBCTRL_SERVICESSR_REQ_MASK BIT(SCBCTRL_SERVICESSR_REQ)
> +
> +#define SCBCTRL_SERVICESSR_BUSY (1u)
> +#define SCBCTRL_SERVICESSR_BUSY_MASK BIT(SCBCTRL_SERVICESSR_BUSY)
> +
> +#define SCBCTRL_SERVICESSR_ABORT (2u)
> +#define SCBCTRL_SERVICESSR_ABORT_MASK BIT(SCBCTRL_SERVICESSR_ABORT)
> +
> +#define SCBCTRL_SERVICESSR_NOTIFY (3u)
> +#define SCBCTRL_SERVICESSR_NOTIFY_MASK BIT(SCBCTRL_SERVICESSR_NOTIFY)
> +
> +#define SCBCTRL_SERVICESSR_STATUS (16u)
> +#define SCBCTRL_SERVICESSR_STATUS_MASK (0xffffu << SCBCTRL_SERVICESSR_STATUS)

GENMASK().

> +
> +struct mpfs_mbox {
> +	struct mbox_controller controller;
> +	struct device *dev;
> +	int irq;
> +	void __iomem *mailbox_base;
> +	void __iomem *int_reg;
> +	struct mbox_chan *chan;
> +	u16 response_size;
> +	u16 response_offset;
> +};
> +
> +static int mpfs_mbox_busy(struct mpfs_mbox *mbox)

Return bool ?

> +{
> +	u32 status;
> +
> +	status = readl_relaxed(mbox->mailbox_base + SERVICES_SR_OFFSET);
> +
> +	return status & SCBCTRL_SERVICESSR_BUSY_MASK;
> +}
> +
> +static struct mpfs_mbox *mbox_chan_to_mpfs_mbox(struct mbox_chan *chan)
> +{
> +	if (!chan || !chan->con_priv)
> +		return NULL;

Is this ever called with chan == NULL ?

> +
> +	return (struct mpfs_mbox *)chan->con_priv;
> +}
> +
> +static int mpfs_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +	u32 index;
> +	u32 *word_buf;
> +	u8 *byte_buf;
> +	u8 byte_off;
> +	u8 byte_index;
> +	u32 mailbox_val = 0u;
> +	u16 mb_offset;
> +	u16 mbox_options_select;
> +	u32 mbox_tx_trigger;
> +
> +	struct mpfs_mss_msg *msg = data;
> +
> +	struct mpfs_mbox *mbox = mbox_chan_to_mpfs_mbox(chan);

Please remove the empty lines before the declarations.

> +
> +	mb_offset = msg->mailbox_offset;
> +	mbox->response_size = msg->response_size;
> +	mbox->response_offset = msg->response_offset;
> +
> +	mbox_options_select = ((mb_offset << 7u) | (msg->cmd_opcode & 0x7fu));
> +	mbox_tx_trigger = (((mbox_options_select << SCBCTRL_SERVICESCR_COMMAND) &
> +		SCBCTRL_SERVICESCR_COMMAND_MASK) |
> +		SCBCTRL_SERVICESCR_REQ_MASK | SCBCTRL_SERVICESSR_NOTIFY_MASK);
> +
> +	if (mpfs_mbox_busy(mbox))
> +		return MSS_SYS_BUSY;

You can probably move this before the previous hunk, no ? If you are going to do
nothing, then let's detect it earlier.

> +
> +	/* Code for MSS_SYS_PARAM_ERR is not implemented with this version of driver. */
> +
> +	writel_relaxed(0x0U, mbox->int_reg);
> +
> +	if (msg->cmd_data_size > 0u) {

0u ? Seriously ?

> +		byte_buf = (u8 *)(msg->cmd_data);
> +
> +		for (index = 0u; index < (msg->cmd_data_size / 4u); index++) {
> +			writel_relaxed(word_buf[index],
> +				       mbox->mailbox_base + MAILBOX_REG_OFFSET + index);
> +		}
> +
> +		if ((msg->cmd_data_size % 4u) > 0u) {
> +			byte_off = (((msg->cmd_data_size / 4u) * 4u));

There are in my opinion far too many "u"s... Many of them are not necessary and
just make the code harder to read.

> +			byte_buf = (u8 *)(msg->cmd_data + byte_off);
> +
> +			mailbox_val = readl_relaxed(mbox->mailbox_base +
> +					    MAILBOX_REG_OFFSET + index);
> +
> +			for (byte_index = 0u;
> +			     byte_index < (msg->cmd_data_size % 4u);
> +			     byte_index++) {

s/byte_index/i and your line would become shorter and easier to read.

> +				mailbox_val &= ~(0xffu << (byte_index * 8u));
> +				mailbox_val |= (byte_buf[byte_index]
> +						<< (byte_index * 8u));
> +			}
> +
> +			writel_relaxed(mailbox_val,
> +				       mbox->mailbox_base + MAILBOX_REG_OFFSET + index);
> +		}
> +	}
> +
> +	writel_relaxed(mbox_tx_trigger, mbox->mailbox_base + SERVICES_CR_OFFSET);
> +
> +	return MSS_SYS_SUCCESS;
> +}
> +
> +static inline int mpfs_mbox_pending(struct mpfs_mbox *mbox)

return bool ?

> +{
> +	u32 status;
> +
> +	status = readl_relaxed(mbox->mailbox_base + SERVICES_SR_OFFSET);
> +
> +	return !(status & SCBCTRL_SERVICESSR_BUSY_MASK);
> +}
> +
> +static void mpfs_mbox_rx_data(struct mbox_chan *chan)
> +{
> +	struct mpfs_mbox *mbox = mbox_chan_to_mpfs_mbox(chan);
> +	u32 *data;
> +	u32 index;
> +	u32 response_limit;
> +
> +	data = devm_kzalloc(mbox->dev, sizeof(*data) * mbox->response_size,
> +			    GFP_ATOMIC);

check the result please. What if that fails ? That is a GFP_ATOMIC. It can fail...

> +
> +	response_limit = (mbox->response_size) + (mbox->response_offset);
> +	if (mpfs_mbox_pending(mbox) && mbox->response_size > 0U) {
> +		for (index = (mbox->response_offset); index < response_limit;
> +		     index++) {

s/index/i

> +			data[index - (mbox->response_offset)] =
> +				readl_relaxed(mbox->mailbox_base + MAILBOX_REG_OFFSET +
> +				      index * 0x4);
> +		}
> +	}
> +
> +	mbox_chan_received_data(chan, (void *)data);
> +	devm_kfree(mbox->dev, data);
> +}
> +
> +static irqreturn_t mpfs_mbox_inbox_isr(int irq, void *data)
> +{
> +	struct mbox_chan *chan = (struct mbox_chan *)data;
> +	struct mpfs_mbox *mbox = mbox_chan_to_mpfs_mbox(chan);
> +
> +	writel_relaxed(0x0U, mbox->int_reg);
> +
> +	mpfs_mbox_rx_data(chan);
> +
> +	mbox_chan_txdone(chan, 0);
> +	return IRQ_HANDLED;
> +}
> +
> +static int mpfs_mbox_startup(struct mbox_chan *chan)
> +{
> +	struct mpfs_mbox *mbox = mbox_chan_to_mpfs_mbox(chan);
> +	int ret = 0;
> +
> +	if (!mbox)
> +		return -EINVAL;
> +	ret = devm_request_irq(mbox->dev, mbox->irq, mpfs_mbox_inbox_isr, 0,
> +			       "mpfs-mailbox", chan);
> +	if (unlikely(ret)) {

I do not think the unlikely is needed here. This is not hot-path.

> +		dev_err(mbox->dev, "failed to register mailbox interrupt:%d\n",
> +			ret);
> +		return ret;

you do not need this return. Or at least change the next return to 0.

> +	}
> +
> +	return ret;
> +}
> +
> +static void mpfs_mbox_shutdown(struct mbox_chan *chan)
> +{
> +	struct mpfs_mbox *mbox = mbox_chan_to_mpfs_mbox(chan);
> +
> +	devm_free_irq(mbox->dev, mbox->irq, chan);
> +}
> +
> +static const struct mbox_chan_ops mpfs_mbox_ops = {
> +	.send_data = mpfs_mbox_send_data,
> +	.startup = mpfs_mbox_startup,
> +	.shutdown = mpfs_mbox_shutdown,
> +};
> +
> +static int mpfs_mbox_probe(struct platform_device *pdev)
> +{
> +	struct mpfs_mbox *mbox;
> +	struct resource *regs;
> +	struct mbox_chan *chans;
> +	int ret;
> +
> +	mbox = devm_kzalloc(&pdev->dev, sizeof(*mbox), GFP_KERNEL);
> +	if (!mbox)
> +		return -ENOMEM;
> +
> +	chans = devm_kzalloc(&pdev->dev, sizeof(*chans), GFP_KERNEL);
> +	if (!chans)
> +		return -ENOMEM;
> +
> +	mbox->mailbox_base = devm_platform_get_and_ioremap_resource(pdev, 0, &regs);
> +	if (IS_ERR(mbox->mailbox_base))
> +		return PTR_ERR(mbox->mailbox_base);
> +
> +	mbox->int_reg = devm_platform_get_and_ioremap_resource(pdev, 1, &regs);
> +	if (IS_ERR(mbox->int_reg))
> +		return PTR_ERR(mbox->int_reg);
> +
> +	mbox->irq = platform_get_irq(pdev, 0);

No error check ? Or did you mean to use platform_get_irq_optional() ?

> +
> +	mbox->dev = &pdev->dev;
> +
> +	chans[0].con_priv = mbox;
> +	mbox->controller.dev = mbox->dev;
> +	mbox->controller.num_chans = 1;
> +	mbox->controller.chans = chans;
> +	mbox->controller.ops = &mpfs_mbox_ops;
> +	mbox->controller.txdone_irq = true;
> +
> +	ret = devm_mbox_controller_register(&pdev->dev, &mbox->controller);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Registering MPFS mailbox controller failed\n");
> +		return -1;

return ret;

> +	}
> +	dev_info(&pdev->dev, "Registered MPFS mailbox controller driver\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mpfs_mbox_of_match[] = {
> +	{
> +		.compatible = "microchip,polarfire-soc-mailbox",
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mpfs_mbox_of_match);
> +
> +static struct platform_driver mpfs_mbox_driver = {
> +	.driver = {
> +		.name = "mpfs-mailbox",
> +		.of_match_table = mpfs_mbox_of_match,
> +	},
> +	.probe = mpfs_mbox_probe,
> +};
> +module_platform_driver(mpfs_mbox_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
> +MODULE_DESCRIPTION("MPFS mailbox controller driver");
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
