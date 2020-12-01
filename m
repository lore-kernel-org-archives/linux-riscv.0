Return-Path: <SRS0=guVx=FF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75375C64E7B
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 12:00:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B69D920770
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 12:00:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IELEjZc9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="AnYcg215";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="zZ0W0YBd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B69D920770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=PfFFwTwvglyBM7IQDSdAKWbIDGPymfsANBVHGSb56P4=; b=IELEjZc99jtNGwFZehMU0a1bI
	fEGYopWC3W70jXmtBon5tVTsCFJ0mVJ4tw5zX+FknsmDPpnjZ76k9Jqp+8ZekxW2BITM1nw8asDyM
	ul4Y9CB4CfkNgT94TUaiDwhIlF6g2yX+e1E/D3kwb46UfH2E0GKsxZsbS9gQHRMtUXTg8zPBH8pcp
	BPnTdeche0YCB64raVxD9YTjMdSAm73qEHnI+5VTwhS6aTAe//UHb7KNZuOssPDUU8mg1zPW67sUd
	9xlBZdTnm0QKw6IbADh66IWoTG9wNYcOnHU6yEyW56aJqZBMDZ9oLGo+dXmQjfw0ykUyaqdmVOEhm
	O9HKCgJjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk4Ko-0005TP-3H; Tue, 01 Dec 2020 12:00:42 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk4Kl-0005SX-Ey
 for linux-riscv@lists.infradead.org; Tue, 01 Dec 2020 12:00:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606824039; x=1638360039;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=XDGeVpA0xql5NpkYgpFR1fViFuuB/gn5hYd6VV7rVHU=;
 b=AnYcg2155thKKlcElp70G7AkxCljmLEa3uLBb9KUQ2/gJ7utJ9u1WAOy
 ykCGtQ6wkx7toB2R1Nls9s/XTremVORDaCua7NxOFU+NuOPIC1/UtSTlV
 Hj4br+abGjjzMDOvIt6njvXK02Sl01vMXKGHgWPCI04sL1SSBWN5CFTPb
 hTE2TIdHWlAdtBrWuTICXmypak1+vE+2uLvWHbhCHN34531LUc/mL9K/T
 1/Wn8/OkHlpyslc/Qd2PpB+ti9ixbVYfr2gakZwF7fj2Mkf64TpcVJSoC
 3J9i4xoeR9k2gD6iytzCfybixtbe1/qDCik5kcA7OCizQa4bUeE4tDUw+ g==;
IronPort-SDR: UkzYL864FunG5DF6SOBgCMcUFLvLW3BZ2FudlwfJOptB1NTld10SUooFp+7KLLjcRjraMUv1Wb
 cxzOn9m7m1CCXfN/PzcioGKf9XnS9FDU3X/1ey9nPLhl3ZqBFA4uTqScVil7SjYyDOIDWfwzGW
 TzYoSwYRgAbENCxVZIx8UyzHWF03JoqzcyhFo7d73EcJqY7skzif0Yuc7VH80eASlxGq9xROVJ
 FyMjOm3f35d0rjxa5p3OQlw6K2SAN/2aq9dcXYIIvreKt5Oq9Pt8+8vUiy7h2VbK9Yw5zBB8G9
 AZY=
X-IronPort-AV: E=Sophos;i="5.78,384,1599494400"; d="scan'208";a="158379873"
Received: from mail-sn1nam02lp2056.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.56])
 by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2020 20:00:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNp4N6e7Yc3ZgVqWjcNoh4GMbSUgBl53BOdKrI0qP14lsBx0XLUSogqL6C+yM/sDgRgoG1lgCq0VbNDQDHkOBMPdyYSF+OroXnqeROJgXJYO6g1X4UxDvpxg5I1HYyUWQ4wRLuURk4lzGPMoPLh2qcr2Dj7QfadXjoIn6OKEgvvTIAz6On9ztSz9B90Ei4BnzuA/T75lXJlqxuZNUHR/vpaHs4koME8hBOffqVvZ//EaDp4pU8UwHwcgEHlMl8L1RFdIbPjKmoP6/qCg08vRnW8nX/iifLUapK6UOA0NHug8/2n4Bk3GGbMKnCYQ5Owdigz403Ci3RAXFbr47wBHtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V43vZdn7/y8vMofipXCMaXlSji92N3wAMbBQ0mC5qqo=;
 b=EpbZrqfgiAYHYq2wFLukkmqw5JVZ1aOinYikPifnptayxh8Yu8GqML4RilOM/8q9pyyENmPTlUCLpZUEq9TAUnKYNcqVtlf1rd0OPY//MeCxmn8i8+2hzR7EVRts5Ch9KngKOaxzi5O+bQ4419aAO4S1JdszY+XB/AG7aCeFGvt3qMiX9xGMBnFyLcNGHgguy5EoKKxk4DROrfMxttz0BoHcFVL09j9xgOBwz38j4LFvAiVi9o6lW4/Dunhg7URERNy5w+8ka4GW0dm2ovwOHk4rmJa/hNUidLajDOKbg1i9BSf4dHSD/3148XRlkn8pjoFolf4qs+a0ivt7KVHsCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V43vZdn7/y8vMofipXCMaXlSji92N3wAMbBQ0mC5qqo=;
 b=zZ0W0YBdpkhelqfxNor6UINJOXQr4FJSTB0/xf+W7ckRNvZbYAglxv190iUyOY1qgFDRQfTiR6uPXWmdkvhe0Gah9G4Dl7u3QjwbFY0g/Ef/04ySijfRk3PR+z8gg/yjoG6uLQbUaDvp/DScBau/g6VXmu8iNtVRBlF1vG4T+Kk=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6663.namprd04.prod.outlook.com (2603:10b6:610:99::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Tue, 1 Dec
 2020 12:00:34 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3589.022; Tue, 1 Dec 2020
 12:00:34 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "conor.dooley@microchip.com" <conor.dooley@microchip.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 3/5] soc: add polarfire soc system controller
Thread-Topic: [PATCH v2 3/5] soc: add polarfire soc system controller
Thread-Index: AQHWx9GPBNmhkWSEf0arVrOyBIjWRw==
Date: Tue, 1 Dec 2020 12:00:34 +0000
Message-ID: <CH2PR04MB6522C138E30D5E53FD1317F2E7F40@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201201110257.28507-1-conor.dooley@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.182.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3c5cdfac-b21c-4882-4145-08d895f0b5cd
x-ms-traffictypediagnostic: CH2PR04MB6663:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR04MB66634ED4B4160FF4BE39B9AEE7F40@CH2PR04MB6663.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cQnlPA2midNBCkwW+p/CZ1Ky3+fByqkpLidHUBmABzFvlJTEn3AJGuo1xak7xG9LtAcZgF8TckouvKJUpZUf/iE1b0x0l1k21vzmJAOryOTO5UQDW8N1erFN1RD8eSWHwS5r8CiBVsValZPPAFjazC/gSooUUIJJDbOnvZ8HWchf66kPR6CBgzwSghJ5q8lt9MGN38xWCq5xn2rJkwJu4pwzb3Cd9Nsu+7LhbEi6dA18TiNqN1bbwxkhFTzU+F1X6JgeipLjM+yVLy2/yMAQ2aA/sf/7HGDKSgogeymlywoJyUA8sMXkqOBSMM0CwiTr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(316002)(26005)(71200400001)(54906003)(33656002)(83380400001)(110136005)(8936002)(76116006)(55016002)(7696005)(478600001)(4326008)(91956017)(186003)(8676002)(66446008)(6506007)(53546011)(64756008)(66556008)(9686003)(66946007)(7416002)(66476007)(86362001)(5660300002)(52536014)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?YLzFyoxzXjf7s8iW79WBoMKYOL0fvXFYrXLYcu83UunQD9TJFeJ4D8Xc7xqf?=
 =?us-ascii?Q?I34XnaCqRpn2RXJonCveLnIfGZZexQc7swRQIyvpR/kMMH7zricT+fdjTE9k?=
 =?us-ascii?Q?+4Kl+L3wUQLL0SXhyUciB3qHxcxAj9S5f/3MMTt0uaTBSfkqPGpYjoIMi1PM?=
 =?us-ascii?Q?IoBUIsKyYNFdtUi99STf4TmEVS560kTeKH47HHGTRZclgFKS0xAt1Z0I+bRb?=
 =?us-ascii?Q?7N+QbGyjZH+T8fB+VKAyGRppiCNrEeMoO9wGa4qKkl89E35+jnHPe9v7va41?=
 =?us-ascii?Q?0SdwhYTeRZ0b88cMI73BvDmOrTCiXyNuuJtMPANb3vSLeI8vaK8afRJ+by7l?=
 =?us-ascii?Q?0ksymW97b7nA6XfecbdMVlSMifCr873+ioHavLHMjiETjMvgg7LntaC5hcm7?=
 =?us-ascii?Q?IgnnQVZtj6jClnfwGbvgccOErQbQduEueLMXVvuuinutakQ98QWKGtfBdJZ4?=
 =?us-ascii?Q?WdHuv5Em29eooB2N7YEu3g2mR5r4tt1nn9eq9mv5DnuicE67cF9HFaZd1UFW?=
 =?us-ascii?Q?nJ4Ru5+PfsM+mrtqeU7lF+5yZzRMMMQCuoTT0NGscxa8k9OwLRaOHpYgSUCH?=
 =?us-ascii?Q?9UhKPEwfUpmwQCv60a2uNJe0BANxHTQplFIJYwb2d9cYZ7nPmOfhN+hISTVh?=
 =?us-ascii?Q?blh0sDGvi5VgeQiyNmuzvBOkNg92i4GBAg7ZcVPoPkhc6kc5Me6B7FfCysac?=
 =?us-ascii?Q?2FXhC+cdnHBv+OTtJxvA03UaKZpA5E/q0eAtDEGJ8sQ9wO32BnPkQWV67Jkv?=
 =?us-ascii?Q?QGAek9836IG7gFXIgxsp+Rj2X2QQfEULyYE+D2UebcDQtK/AgU8vd5d1i15u?=
 =?us-ascii?Q?HuSYqeqtW9ADiCq8uv5/TDEyuNXFy1kaDgjdfIXPqSNkdB1mlDqzpF/72qyR?=
 =?us-ascii?Q?yfJcYPvPl0YtD0YeKdXUb3aGkiHF/8CD4ILIdW6WeSnvpxxNZSJdc2qfbm8u?=
 =?us-ascii?Q?IvNlE4NkpA5jYFJ4vLR1CSZRrdWKk4d7xRcY4DdhNPFBxFifiTmQg1ZtxQZw?=
 =?us-ascii?Q?GeGV?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5cdfac-b21c-4882-4145-08d895f0b5cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 12:00:34.6816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XvbsR2lzglGbX4TnpIBL6S+KnIce/xIk3VngePvR5ilR5kefmEEqQOR7F54o8fJ0k/UbiYhtnaQEB4bjbtfjBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6663
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_070039_712462_7D76A4B6 
X-CRM114-Status: GOOD (  22.30  )
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

On 2020/12/01 20:03, conor.dooley@microchip.com wrote:
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
>  drivers/soc/microchip/mpfs_sys_controller.c | 135 ++++++++++++++++++++
>  5 files changed, 148 insertions(+)
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
> index 000000000000..40e5203c8ba0
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
> +	  If unsure, say N.
> diff --git a/drivers/soc/microchip/Makefile b/drivers/soc/microchip/Makefile
> new file mode 100644
> index 000000000000..23b1f42a37db
> --- /dev/null
> +++ b/drivers/soc/microchip/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_MPFS_SYS_CONTROLLER)	+= mpfs_sys_controller.o
> diff --git a/drivers/soc/microchip/mpfs_sys_controller.c b/drivers/soc/microchip/mpfs_sys_controller.c
> new file mode 100644
> index 000000000000..875a0671e196
> --- /dev/null
> +++ b/drivers/soc/microchip/mpfs_sys_controller.c
> @@ -0,0 +1,135 @@
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
> +	if (ret >= 0) {
> +		if (wait_for_completion_timeout(&mpfs_client->c, HZ)) {
> +			ret = 0;
> +		} else {
> +			ret = -ETIMEDOUT;
> +			dev_warn(mpfs_client->client.dev, "MPFS sys controller transaction timeout");
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

You can replace all of this with

		return dev_err_probe(dev, PTR_ERR(mpfs_client->chan),
				     ""Failed to get mbox channel\n");

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
