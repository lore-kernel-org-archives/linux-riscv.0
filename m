Return-Path: <SRS0=guVx=FF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4E9C64E7A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 11:55:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0FA42084C
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 11:55:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hkLOeLAj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="BnZNQtSX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="LeaLJKpD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0FA42084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=SuGCHTZ60fm/jjpIgVkxaSI97rEEZUPGeUuArfv3D3k=; b=hkLOeLAjk0+zH39/LfJunoGVa
	0HpGxtJ4UXxQw1uXb78uNHHJOG2lhmyNNOxlXvdZjlQ+7p/sBZVKO79MWfcMJVoDENZ+JtZBHam1w
	NJKi1cm26Z3x+8zDeplM/hik0z0E5YkqoevADtFLQeFqFah4y26dKe1+royaAnM3nnx6zaF2WN4RZ
	yN+SqF+pRdo7ANSdYHT+apg/hzI6efHhWyCZm2htyrn7QNUF7vI5Dd92YLI1oYXXAYLkhJ6ULggMb
	Z+6RnZP3MR18+/uYg/T6lSTSTAemkq3nU9jgMzB6RchPpHQkHqxgT8WqLPWLR9gw+0SDneRZRByLI
	fS67ft2sA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk4FR-0004bp-6F; Tue, 01 Dec 2020 11:55:09 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk4FM-0004b3-Vi
 for linux-riscv@lists.infradead.org; Tue, 01 Dec 2020 11:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606823704; x=1638359704;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=VBtogH41TvB7RTmd1Bqnli1ysL1Ikp1cICmqAPyvWW0=;
 b=BnZNQtSXoF9Cuy0nTuGhJ7tP5/R9FFvJ4ZIBIEwuwl16atcGQ44qHr8H
 9OPgeoWzFrVjatA9YlelG5ICt5b/2U/wwKoY+5y5aXaTfQwAO6L8jUBc8
 kJxfxNXgTvivgWyWxBfglGK49Dpd/L6EiTSWqoJwaxG37hzl0KCbuiE79
 +j2gbT2+G5yyLyPMsfUQ7DYlOf7GLW08wvi4H9CZeqnyutPU//aBS5xnp
 G9uRO/om9AB46qw55TvkvAwLmdniB3rAdIPOS6CuoSqfynItGsQGDMJFC
 K9zvbkq4E8P3xoEWltPDrbi9xPPgTuIAX8FgV83Km7ljXrImXkuOPDVQh w==;
IronPort-SDR: RdK6G7XjY7OqG+c60lhEjMWggJLaQ8uKy3b3iUYomNmqr1952VId8zYXyzLqpZyEDtZRPqf3GX
 RdayJIDdTY0XN7XRJoFTa5gEolQhI9v14aczEGiYZ5VwmoDusEFOh7ibBEfNal03Uv8Ow3bDAy
 NhyLwHyAXRZc2R01zioaczQXDIA+IJWIS++ug65Y34SYFla0No+iFplrAJaIeB4gnM5ELgSWco
 ymAxVIK2WFZvl/Ln8LQCqdK0T9d+ijd49ICFMRtj28zAQDT1zBS+DCX6nOkwjFPfHtF4/C1rSV
 nzI=
X-IronPort-AV: E=Sophos;i="5.78,384,1599494400"; d="scan'208";a="153980063"
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2020 19:55:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C78y0HkUWG3NMxT4A1X0hsZBhZTG6K9onJnbWTWVHb0jbmw0md0WN1J3/mEcpGruYSkTk3a+Np3b2LB8WAOtva8Z56ebwZHPMO7oo2VodiDzRqAYq+tVF4AmoQCprrRVQpm0S0TlWuv2neOzhyhZf+Sgjn5l8d8RN3QqDx1bZxjw6wJchzZG4POZonaphzH4Ax5tr7jRswukIsIiwveyARvz9jS0+MduZrtM+Fk37Q9nblxy+ETUI9EMUgZTVSam2A1ql5EBO483Lr2ArOObYvyfp7xQlHWQe83YuerpkR0QUkp4TBIVzuWk23PtJCq3NAyufngqWUd81am3GltsrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gw/wBbOQNd7cSRbm2ndked09D5fT9SmH8GEgtNGFh74=;
 b=jpn5BdE333n0azToePKF/ZZ5rCakUmy7xWbAz75r/mwl+JTAUM97xB8D03vXsy1YjHFPX06pdZmND+17l/n9iazXQZqsS4jiK6ueyu/VjQXVB2kaRgQotVA02RotPl6NnYrPTcmq6Y+ucQEYmAaxnZJRJepCIBg9GpwbtL7kaduq9EuF87z0tHEdMnYOZIoXD4ukadzu62TVT3m4AKs1MP4n9I5nkvIGMvg75sA3qsqCcZ5gF/BVQBqfRFgFj5H5Bo0iGkWLA1mSVzJjT7HqfAX7CJTct80xvbDSYO9MaSycdagPJ00Y/WtSDr5GEm87S0Ay5vo+5h7vUsK+8wzGpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gw/wBbOQNd7cSRbm2ndked09D5fT9SmH8GEgtNGFh74=;
 b=LeaLJKpDWlWHRNNsiSkQI1b0U2TGHnkDNoJ6cDQRM69Cld2CJWUSLMc9NZZdEHWZH5ekO15UsX2zJaCu0X0++dTl24iyS4OH2Gt1yJqZ+EXlgVN442z9q+vEwsoGOR+cuWCmVBq6Fd+JE1fj+8R+6ZesUqFAw6hNRBlez975gq8=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6508.namprd04.prod.outlook.com (2603:10b6:610:6a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Tue, 1 Dec
 2020 11:55:01 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3589.022; Tue, 1 Dec 2020
 11:55:01 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "conor.dooley@microchip.com" <conor.dooley@microchip.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/5] mbox: add polarfire soc system controller mailbox
Thread-Topic: [PATCH v2 1/5] mbox: add polarfire soc system controller mailbox
Thread-Index: AQHWx9GDLBgLLmQtpk6KysIzPcmCXA==
Date: Tue, 1 Dec 2020 11:55:01 +0000
Message-ID: <CH2PR04MB6522B0B3F824BFB01EE0C635E7F40@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201201110242.28369-1-conor.dooley@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.182.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c3a7d84f-b2db-4a1d-d8ea-08d895efef36
x-ms-traffictypediagnostic: CH2PR04MB6508:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR04MB650877C91470D788E7E5DA2BE7F40@CH2PR04MB6508.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:439;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FNfX+RCS4aBha4j3qoT0M7TzNAeaxSxQJBp2VR90jRObvEbDNYW1qGfYhqISR6Em8n6l66TOlAnrB8gLwJ6f54NgRcHcFDEq2J8UuqS1zsPYIqpAyT8KMIm3Xq0y0/5d6gXqsBkSTxbMNstJpQZ5mWvbbFiihhxeWaRm3e/OtgJxIa5eMGyZmpinMT2lHYx8slLPYZpiuM9N1v6MC9ZSUXNxLOCWu3Gr8WCTvy/E8TokTVW6lKn7qMq4/6AiBMKEMsG63ZKzRrFCDf0SEYjW38LjUzYho9zowidYipsZw+fNFeM/KSElwZCwN3lM222STgAfOT24lzXOSwmAyZe6Pg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(2906002)(52536014)(33656002)(15650500001)(30864003)(26005)(66556008)(186003)(66476007)(316002)(64756008)(66946007)(83380400001)(55016002)(478600001)(91956017)(76116006)(110136005)(54906003)(7416002)(66446008)(53546011)(7696005)(5660300002)(8676002)(71200400001)(4326008)(8936002)(6506007)(9686003)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?fJaQeSKt7ex6qRpj+teMovkJUNez74z082yIue3Hi6t/F/I/ZIUSr/8sQR9a?=
 =?us-ascii?Q?84g3fCNGrKDrw9HPeC4v/6NFk2POpvkOnHlqausVfTTRaYGQFzZvU4gWXddG?=
 =?us-ascii?Q?qWAEpFWkK4cqe+x8VV0FuxHdQKt3uiyaCGof4XSWsa4Llfd5jjJ9Cs51gAlo?=
 =?us-ascii?Q?/IgtdEeUVkdkVBANxVgR3mZg46IkM6SeloglFqS5kaB27EBWvMx30qSO3TzJ?=
 =?us-ascii?Q?RtjEEnMl/hO6yFXsI7m8jMsdpH0Hjv/PF1rXqvGNCJLt0uaQEyW3H5TNCnvY?=
 =?us-ascii?Q?HuHjW4EurvCq+I09qcIFaQAGI4CMNzvX/OIsN41G2SD4qt1eGvZgYxwPLe3d?=
 =?us-ascii?Q?cBF1pVq8fLqj4LnP23nhDDJZCuQO5QC9U+zWdTrs3xRNcglOFr1je4NpoAye?=
 =?us-ascii?Q?ByTJz3d2kSSEDP8on2Xys4stcimDdAhwddaLyKDdkSn/aLGfLGgvJr+GT32R?=
 =?us-ascii?Q?h7r55toTfyXjMeyh8wyZHJaBklyrJPxFhhV7ro3x63HDvgsrybQQQys5thI5?=
 =?us-ascii?Q?6gnPjAZymK+UQ3otDNWJz8T7fb3+a9W+yPKwsHfx5cF8Wh9f+v9AmRHTz9WM?=
 =?us-ascii?Q?rz/jwPlvUiC9jheA39P7W7ZCFaYz1V3A1K+Xk5dO5YZz3DUpnn8d/lU8pybo?=
 =?us-ascii?Q?36HPBQ/Qz7/W7nGdUhIyQIDF8J3sMtQPo5o5yM1Hr8BlA+zmXgrgQqqaE3VN?=
 =?us-ascii?Q?36fXT90hh4W+L/rewkyeVkRJw/PbI/L/39eKemJGU59HEQ6xTuoyyb9n9FV3?=
 =?us-ascii?Q?KWOWmraHxYFTy3sk78RFYTi2/CaGTkNxTS0e14uaWIl3rQ3fkO5/NE8O0dFj?=
 =?us-ascii?Q?oOI2S6AmrIl5zWmod+U8cW38USPPiLgz8b070c5gCakBzOzo3U0vU88YVWhL?=
 =?us-ascii?Q?nFAGATtT7G9RfYU4ItpnXDF0SrjAfNcegqrNpTIAnU0KWubeEYd+lPE1qHT7?=
 =?us-ascii?Q?ArX5Nt/5zrqGXE/r4EQ0hXth6hZFoL6IlXMt7Zc4WlPRHHEbhuDGJv5Qxhxc?=
 =?us-ascii?Q?WGA9?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a7d84f-b2db-4a1d-d8ea-08d895efef36
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 11:55:01.5001 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: espflEnm36mAQqzp7SPXFrc7lkS4tdc28dRUY8vJxaftSimjR8urE+TDZ05LOYQK+YFLgKUJq71GUqZ1YGzzmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6508
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_065505_612073_8FBE0C00 
X-CRM114-Status: GOOD (  23.99  )
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

On 2020/12/01 20:02, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> This driver adds support for the single mailbox channel of the MSS
> system controller on the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/mailbox/Kconfig        |  12 ++
>  drivers/mailbox/Makefile       |   2 +
>  drivers/mailbox/mailbox-mpfs.c | 285 +++++++++++++++++++++++++++++++++
>  include/soc/microchip/mpfs.h   |  51 ++++++
>  4 files changed, 350 insertions(+)
>  create mode 100644 drivers/mailbox/mailbox-mpfs.c
>  create mode 100644 include/soc/microchip/mpfs.h
> 
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index 05b1009e2820..fbf6902c3541 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -153,6 +153,18 @@ config MAILBOX_TEST
>  	  Test client to help with testing new Controller driver
>  	  implementations.
>  
> +config MPFS_MBOX
> +	tristate "MPFS Mailbox"
> +	depends on HAS_IOMEM
> +	depends on SOC_MICROCHIP_POLARFIRE || COMPILE_TEST
> +	help
> +	  This driver adds support for the Polarfire SoC mailbox controller.
> +
> +	  To compile this driver as a module, choose M here. the
> +	  module will be called mailbox-mpfs.
> +
> +	  If unsure, say N.
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
> index 000000000000..e1ecf3081312
> --- /dev/null
> +++ b/drivers/mailbox/mailbox-mpfs.c
> @@ -0,0 +1,285 @@
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
> +#define SERVICES_CR_OFFSET		0x50u
> +#define SERVICES_SR_OFFSET		0x54u
> +#define MAILBOX_REG_OFFSET		0x800u
> +#define MSS_SYS_BUSY			-EBUSY
> +#define MSS_SYS_PARAM_ERR		-EINVAL
> +#define MSS_SYS_MAILBOX_DATA_OFFSET	0u
> +#define SCB_MASK_WIDTH 			16u

Value identation seems off here. Aligning it would be nice.

> +/* SCBCTRL service control register */
> +
> +#define SCB_CTRL_REQ (0u)
> +#define SCB_CTRL_REQ_MASK BIT(SCB_CTRL_REQ)
> +
> +#define SCB_CTRL_BUSY (1u)
> +#define SCB_CTRL_BUSY_MASK BIT(SCB_CTRL_BUSY)
> +
> +#define SCB_CTRL_ABORT (2u)
> +#define SCB_CTRL_ABORT_MASK BIT(SCB_CTRL_ABORT)
> +
> +#define SCB_CTRL_NOTIFY (3u)
> +#define SCB_CTRL_NOTIFY_MASK BIT(SCB_CTRL_NOTIFY)
> +
> +#define SCB_CTRL_POS (16u)
> +#define SCB_CTRL_MASK GENMASK(SCB_CTRL_POS+SCB_MASK_WIDTH, SCB_CTRL_POS)

Please add spaces before and after the "+" operator.

And I am really not a big fan of the (useless in my opinion) "u" for unsigned
for all of these.

> +
> +/* SCBCTRL service status registers */
> +
> +#define SCB_STATUS_REQ (0u)
> +#define SCB_STATUS_REQ_MASK BIT(SCB_STATUS_REQ)
> +
> +#define SCB_STATUS_BUSY (1u)
> +#define SCB_STATUS_BUSY_MASK BIT(SCB_STATUS_BUSY)
> +
> +#define SCB_STATUS_ABORT (2u)
> +#define SCB_STATUS_ABORT_MASK BIT(SCB_STATUS_ABORT)
> +
> +#define SCB_STATUS_NOTIFY (3u)
> +#define SCB_STATUS_NOTIFY_MASK BIT(SCB_STATUS_NOTIFY)
> +
> +#define SCB_STATUS_POS (16u)
> +#define SCB_STATUS_MASK GENMASK(SCB_STATUS_POS+SCB_MASK_WIDTH, SCB_STATUS_POS)

Spaces around "+".

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
> +static bool mpfs_mbox_busy(struct mpfs_mbox *mbox)
> +{
> +	u32 status;
> +
> +	status = readl_relaxed(mbox->mailbox_base + SERVICES_SR_OFFSET);
> +
> +	return status & SCB_STATUS_BUSY_MASK;
> +}
> +
> +static struct mpfs_mbox *mbox_chan_to_mpfs_mbox(struct mbox_chan *chan)
> +{
> +	if (!chan || !chan->con_priv)
> +		return NULL;

You do not need the "|| !chan->con_priv" here. The return below will return NULL.

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
> +	u8 i;
> +	u32 mailbox_val = 0u;
> +	u16 mb_offset;
> +	u16 mbox_options_select;
> +	u32 mbox_tx_trigger;
> +	struct mpfs_mss_msg *msg = data;
> +	struct mpfs_mbox *mbox = mbox_chan_to_mpfs_mbox(chan);
> +	mb_offset = msg->mailbox_offset;
> +	mbox->response_size = msg->response_size;
> +	mbox->response_offset = msg->response_offset;
> +
> +	if (mpfs_mbox_busy(mbox))
> +		return MSS_SYS_BUSY;
> +
> +	mbox_options_select = ((mb_offset << 7u) | (msg->cmd_opcode & 0x7fu));
> +	mbox_tx_trigger = (((mbox_options_select << SCB_CTRL_POS) &
> +		SCB_CTRL_MASK) | SCB_CTRL_REQ_MASK | SCB_STATUS_NOTIFY_MASK);
> +
> +	/* Code for MSS_SYS_PARAM_ERR is not implemented with this version of driver. */
> +
> +	writel_relaxed(0x0u, mbox->int_reg);

0x0u seems like an awfully complicated way of writing 0. Less characters for the
brain to decode makes reading easier :)

> +
> +	if (msg->cmd_data_size) {
> +		byte_buf = (u8 *)(msg->cmd_data);
> +
> +		for (index = 0; index < (msg->cmd_data_size / 4); index++) {
> +			writel_relaxed(word_buf[index],
> +				       mbox->mailbox_base + MAILBOX_REG_OFFSET + index);
> +		}

You do not need the braces here.

> +
> +		if ((msg->cmd_data_size % 4) > 0) {

s/% 4/& 3. And you do not need the "> 0".

> +			byte_off = (((msg->cmd_data_size / 4) * 4));

Extra outside parenthesis not needed.
byte_off = msg->cmd_data_size & (~3);
or
byte_off = ALIGN_DOWN(msg->cmd_data_size, 4);

> +			byte_buf = (u8 *)(msg->cmd_data + byte_off);

cmd_data is already u8 *, so you do not need the cast.

> +
> +			mailbox_val = readl_relaxed(mbox->mailbox_base +
> +					    MAILBOX_REG_OFFSET + index);
> +
> +			for (i = 0u; i < (msg->cmd_data_size % 4u); i++) {

% 4 -> & 3
And since you already have taht in the if above, why not use a local variable ?

> +				mailbox_val &= ~(0xffu << (i * 8u));
> +				mailbox_val |= (byte_buf[i] << (i * 8u));
> +			}
> +
> +			writel_relaxed(mailbox_val, mbox->mailbox_base + MAILBOX_REG_OFFSET + index);
> +		}
> +	}
> +
> +	writel_relaxed(mbox_tx_trigger, mbox->mailbox_base + SERVICES_CR_OFFSET);
> +
> +	return 0;
> +}
> +
> +static inline bool mpfs_mbox_pending(struct mpfs_mbox *mbox)
> +{
> +	u32 status;
> +
> +	status = readl_relaxed(mbox->mailbox_base + SERVICES_SR_OFFSET);
> +
> +	return !(status & SCB_STATUS_BUSY_MASK);
> +}
> +
> +static void mpfs_mbox_rx_data(struct mbox_chan *chan)
> +{
> +	struct mpfs_mbox *mbox = mbox_chan_to_mpfs_mbox(chan);
> +	u32 *data;
> +	u32 i;
> +	u32 response_limit;
> +
> +	data = devm_kzalloc(mbox->dev, sizeof(*data) * mbox->response_size, GFP_ATOMIC);
> +	if (!data)
> +		dev_err(mbox->dev, "failed to register mailbox interrupt:%d\n", -ENOMEM);
> +
> +	response_limit = (mbox->response_size) + (mbox->response_offset);
> +	if (mpfs_mbox_pending(mbox) && mbox->response_size > 0U) {
> +		for (i = (mbox->response_offset); i < response_limit; i++) {

Parenthesis not needed around (mbox->response_offset).

> +			data[i - (mbox->response_offset)] =

Same here.

> +				readl_relaxed(mbox->mailbox_base + MAILBOX_REG_OFFSET + i * 0x4);
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

0x0U == 0...

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
> +	ret = devm_request_irq(mbox->dev, mbox->irq, mpfs_mbox_inbox_isr, 0, "mpfs-mailbox", chan);
> +	if (ret) {
> +		dev_err(mbox->dev, "failed to register mailbox interrupt:%d\n", ret);
> +	}

No need for the curly braces.

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
> +	if (mbox->irq < 0)
> +		return mbox->irq;
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
> +		return ret;
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

The typical way of writing this is:

static const struct of_device_id mpfs_mbox_of_match[] = {
	{ .compatible = "microchip,polarfire-soc-mailbox", },
	{}
};


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
> diff --git a/include/soc/microchip/mpfs.h b/include/soc/microchip/mpfs.h
> new file mode 100644
> index 000000000000..b231f39f32eb
> --- /dev/null
> +++ b/include/soc/microchip/mpfs.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + *
> + * Microchip MPFS mailbox
> + *
> + * Copyright (c) 2020 Microchip Corporation. All rights reserved.
> + *
> + * Author: Conor Dooley <conor.dooley@microchip.com>
> + *
> + */
> +
> +#ifndef __SOC_MPFS_H__
> +#define __SOC_MPFS_H__
> +
> +#include <linux/types.h>
> +#include <linux/of_device.h>
> +
> +struct mpfs_sys_controller;
> +
> +struct mpfs_mss_msg {
> +	u8 cmd_opcode;
> +	u16 cmd_data_size;
> +	u16 response_size;
> +	u8 *cmd_data;
> +	u16 mailbox_offset;
> +	u16 response_offset;
> +};
> +
> +#if IS_ENABLED(CONFIG_MPFS_SYS_CONTROLLER)

A simple #ifdef would do.

> +
> +int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg,
> +			      void *response, u16 response_size_bytes);
> +
> +struct mpfs_sys_controller *mpfs_sys_controller_get(struct device_node *mailbox_node);
> +
> +#else
> +
> +static int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg,
> +				     void *response, u16 response_size_bytes)
> +{
> +	return -ENOSYS;
> +};
> +
> +struct mpfs_sys_controller *mpfs_sys_controller_get(struct device_node *mailbox_node)
> +{
> +	return NULL;
> +}
> +
> +#endif /* IS_ENABLED(CONFIG_MPFS_SYS_CONTROLLER) */
> +
> +#endif /* __SOC_MPFS_H__ */
> 
-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
