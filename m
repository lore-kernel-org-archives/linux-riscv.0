Return-Path: <SRS0=guVx=FF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF97EC64E7B
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 12:21:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32F9D20679
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 12:21:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NnPbjRgg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Y0lFwrIL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="e4QvUsw/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32F9D20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=LrTDle96nEwF76c7gPvT4cQB1TE0D6/oq4sGfFstlpc=; b=NnPbjRggx7tN4rwTtGtm6YRSD
	i6qAfL0oVXjTY1q8YukgzpmvGNIkWdnNVutg5KaLLJaJRcXWSK1kSEYGvKU8QMpSizv3ZCLWkLq72
	Ul6ijok76viD5YIGT0abkjU/5IibUa917EwDiqfwdAa0vwHnG1dpq2rJZe/KnkWuWW1VuomlwnK7Q
	au0apgUPPfK7hBzX1iARMmsaDOlNCxO1zzYICxr8LiWrelkoxlZ5dK6g7yEUtXKhebsvPLtgE6iCE
	XO1LYbJz791OSxuhvcf06UbDXmsEmZU2Ls142JHoolQJJQtMuQxVcTCKKUY+O8LHZQN5TVXSxnaBG
	ijqAmbnEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk4ex-0008WN-LT; Tue, 01 Dec 2020 12:21:31 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk4et-0008U1-Cx
 for linux-riscv@lists.infradead.org; Tue, 01 Dec 2020 12:21:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606825599; x=1638361599;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=lklpcndLwRiTwpIHhz2Sbr9x2cA8j2vyaAIINKo8yis=;
 b=Y0lFwrILylhfcY8opdn4iqjJcx/PbfEz1gSK7ssHHy8v5j7wRLL779hk
 JFcib8HKv7xqT+75V4ocmzxNlicjJhtpsng7IjL9JtNK9Q4KkyTEOEgKr
 EunmUJIaXhT2wINQSbGSgFxAoiQ0ZEICDca10u0I4NdRFX05gwS7dEFsF
 ekYE2jSETDqKyy6T0d/k9BlaIghJiOqzVZAhbqlIznYtWiFSOevUQcxFV
 j9cn+RKovElTcl4zmrr0MHgQtshOFJfiRB4MJ4Tn1hWIbG2tkZPTEG+GG
 OfcsVkDxGVd5JRoNhR1q6vUK0bJEmMbcI3iqZSihuE/dWYUg8Oakan8AX Q==;
IronPort-SDR: fQ80MZx5twsgiBgsCuIOFBenlB8GlvGAH65+gUbtB87avL8Lgi9OpdzjIWhSrqeW/rL+5FDnq8
 ckcrlF5AIu7XGCPqVyDDktPehDe7NuKzm1GuOODXNKXI9GlgJXlT2okceAow6Sk8hhvVqGZk3V
 4N701EE7IbZR1lBfVWG9FyT4jVm19dD1z8xVvCXKPoDPJQ917lB90h1wKFeMBFConxPQ1DgQML
 53dNTP3ALt4lSK5qDC0m2ksBZeU+/jlR+FAU7kmxceB+JZSamfFv91Z98JJ705/YZZ9cl23OcR
 xO8=
X-IronPort-AV: E=Sophos;i="5.78,384,1599494400"; d="scan'208";a="257596610"
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2020 20:26:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxmrRpJLrttgG2MjoYYtbRYiMiYvUqOsx5Q8ms+gW9/ljyy5FwGdBP9opOmh4dfZj0gq0UxmC47Gxxx3PNQ1nN1DwatQ0Me7fetrEfri1Zcy/IfoCOR7v1b+FPN4QRRZO0tI9v+LNgcw336UX4JrpOxN2OUN2VbpjaXU2bsnV6ufKMhF6G9Zqnr7FL+dl+0zLSNADEVs9kWscfSkuHe5qJkXN0nRe1UVQ+AqUlVUmmyF4ZFSKr9Wm5bw9Ph9CB0M/VT4uLzfjcmOFh/r6dPJF3E+tfTqNKxVkJsm3Ve4XBilXWskXf9ne7h0k2jFXVJn1sdMFwjkWLvZlRUpFO4zgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AU3+gbsqjIaWKRjpPsOliHwKBm98t4xFO294/WymAs=;
 b=i4zuroODyg0V81etB88opSTEkGEpqoOStS70ZA+JTwJUpqeVADREUDf4qql8af7b3/guC/PMD6P+mz3jVdaznSKxMMvlAqmu1xk1O5Tjtq8QcujVCwJer8CooopWeHdPszHgRlVZH9dNrbQddM2jMufKH1kPcwEjVd+vSFidXduryj5dsZqOJlQG+LxbAo+VhQ7avfGZZwatvQuf3qOsjX4bymS23tJ44CI0J6oUXbnYmlze/nuZCUwwj7Lh4EXnXggL5TZxldBFdWBzRmmhd+QsSJblGQLpJLEoFZflQef3j0Fmlm5d7XzK0bYKo4OrRC5NvkhFsbX5z4kzkoE7Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AU3+gbsqjIaWKRjpPsOliHwKBm98t4xFO294/WymAs=;
 b=e4QvUsw/rTWs/nGzd8jr2vAzEkLPbabGL3qXfU/0EXJFUyXvV4VK1td0zv38nQuAZE2WE0clyfEyfeGSJk8rIz6VVpO2XRrf6y2RM0zQgv1PtgljXHAibwjkXyaSyuLaordZMd5PLpGZaeyHLgeSwcrNBykSsStgAHT4k/s2058=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6631.namprd04.prod.outlook.com (2603:10b6:610:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Tue, 1 Dec
 2020 12:21:21 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3589.022; Tue, 1 Dec 2020
 12:21:21 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>, "conor.dooley@microchip.com"
 <conor.dooley@microchip.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "paul.walmsley@sifive.com"
 <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 3/5] soc: add polarfire soc system controller
Thread-Topic: [PATCH v2 3/5] soc: add polarfire soc system controller
Thread-Index: AQHWx9GPBNmhkWSEf0arVrOyBIjWRw==
Date: Tue, 1 Dec 2020 12:21:21 +0000
Message-ID: <CH2PR04MB6522AA25CA6F470CF2DCBCB7E7F40@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201201110257.28507-1-conor.dooley@microchip.com>
 <CH2PR04MB6522C138E30D5E53FD1317F2E7F40@CH2PR04MB6522.namprd04.prod.outlook.com>
 <33138723-73d2-1460-2158-bdfc51b4c5c4@codethink.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codethink.co.uk; dkim=none (message not signed)
 header.d=none;codethink.co.uk; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:18de:edc1:5ede:e698]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 46fc3a95-8ca2-4d0b-d38a-08d895f39d13
x-ms-traffictypediagnostic: CH2PR04MB6631:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR04MB66311C4A8F165EF21B8A7708E7F40@CH2PR04MB6631.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ocvcYx3pbW6UrP+4fWPL0nrKDUx42ZUIGXxCJB4SzhwtXcLAWNY4VBneM+z8ASX4Xf611LlfwFAbu1tiK41+o9GoFiAunwB+evCaIVmzqLZ0VNZYvG8RvTGVu8Cbe8ZtIT4B61xWJaKvGfOxpG3l/OiIGDG4oC7jRND1RWIU0pcfCRuvZCFMDystW6rJEXvH0Uo8JxOFMwX/CQrBXfxbXQrp5FmXDqpLGIirAL7UYUcpySDDNAypI9seQj827k4X/WnvhmqWFpuFgTZfpA7GQum1pWua1vBHNUOAXR7tDUKw5ykpTORN0GGRgiGwTBUA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7416002)(498600001)(76116006)(66446008)(66946007)(91956017)(33656002)(8676002)(66476007)(66556008)(64756008)(6506007)(52536014)(4326008)(8936002)(186003)(7696005)(53546011)(5660300002)(110136005)(55016002)(2906002)(54906003)(86362001)(71200400001)(83380400001)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ajFaem7Bx6wm1ig9yXXTuxBqgphTa4aD/AzXL8xCEX+OB8OqMdmRuZzE/BKh?=
 =?us-ascii?Q?1UJKtQpJl8962V5M1e+GDRle+lRh70rK21FNQvgkzp4PEZI99G6u8tlJlLvU?=
 =?us-ascii?Q?6X4bdeVIZMTetCaSlrZaBSYOnxktEjxUr2YvyJAqh4jtUmAq2FcgUdEVJxJx?=
 =?us-ascii?Q?ArJAvk0xFhoJogYLfFUlIw0bT6t23vErQW7dRC6LNA+8PWa63VUQp3LoT3eo?=
 =?us-ascii?Q?6CqQEdDqOD9hTviljaKlS1V69yDh+jkK9DEuw47mjRQpxWC9py0udTyGlTPq?=
 =?us-ascii?Q?1K+Yjq+DrLufVLo1wRXOBAhwAkULS4Z95w+coW92uG7SPvDyMszpYRZOhVkD?=
 =?us-ascii?Q?nt5FQ7CzXzFZDus7f8gt5VXZeSrP9McS0RQrychnCn6XLRRLZcXfg1p4SXul?=
 =?us-ascii?Q?l/RrdRRZjhKyW1FLn26z331TOxYdYWOYrFZOlVT6ziFdOG4z9sZyf/Ix6HWq?=
 =?us-ascii?Q?mS1rdn/UlxCYqeLxhRu1UAc+5R6QYZVSbH4Q5NAG3cCg8qEL2XSgBRcwMNmi?=
 =?us-ascii?Q?ImslqXRnmnFvVUWfM5TkpeMRjjPL77Q0RMUKCo1pr44Fckj0y0f0LtHUlV1W?=
 =?us-ascii?Q?3raCmwazzDSmRQTZvb+RC4E87CRJPo+JuddXpthqaS6hpvhyMOockGanes3K?=
 =?us-ascii?Q?tXRMLC436MyM5eJkjSILsh0KnHGL9Ndyd/xmnVmBBF75LdQ1lWkr2jMRjTq9?=
 =?us-ascii?Q?RwcllO+XhsWIg9JCRIje3FB1AW8bFbjAG1lL446Y2FwAd6Kv35YPc2jY/i0W?=
 =?us-ascii?Q?UOVpR6k8xTKs7LB8m9L5Ky5RStsNpmDx771mcFiX4A99546SrFyZzg1+ex01?=
 =?us-ascii?Q?b/OUy70ZfQ3/l0H0OeBJbz+m6Q7w+MzPZzd2DjoK/IKHGItQbCO8l0zscNF1?=
 =?us-ascii?Q?MKjYgGaUiumfQEkpSQsZfe/5OFe8Zns+kH6RiFli5x9R1JAEadzzO0MmikdH?=
 =?us-ascii?Q?2vuWR1qszWWlF9+3ARQ3fa+3rC1WUIxM+XrOgAYy6Alhz1b4PFSYdOKlSty7?=
 =?us-ascii?Q?5XyOccTNApgOTvD41KgKkOr4bUtHpmnDxaPyrUfiAtDzp2N2LNAA1JXXKjaZ?=
 =?us-ascii?Q?tSOSj8Ld?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46fc3a95-8ca2-4d0b-d38a-08d895f39d13
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 12:21:21.6853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3A0WBRjN0EIah29Q4AHz6RNoR+oxDeqfiD7naJ517tXyl5rJOIm+Y7cje0RzIJpohnf/Qy0qZxvAmqP7DctNyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6631
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_072127_753106_72438EFB 
X-CRM114-Status: GOOD (  17.64  )
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

On 2020/12/01 21:18, Ben Dooks wrote:
> On 01/12/2020 12:00, Damien Le Moal wrote:
>> On 2020/12/01 20:03, conor.dooley@microchip.com wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> This driver provides an interface for other drivers to access the
>>> functions of the system controller on the Microchip PolarFire SoC.
>>>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>   drivers/soc/Kconfig                         |   1 +
>>>   drivers/soc/Makefile                        |   1 +
>>>   drivers/soc/microchip/Kconfig               |  10 ++
>>>   drivers/soc/microchip/Makefile              |   1 +
>>>   drivers/soc/microchip/mpfs_sys_controller.c | 135 ++++++++++++++++++++
>>>   5 files changed, 148 insertions(+)
>>>   create mode 100644 drivers/soc/microchip/Kconfig
>>>   create mode 100644 drivers/soc/microchip/Makefile
>>>   create mode 100644 drivers/soc/microchip/mpfs_sys_controller.c
>>>
>>> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
>>> index 425ab6f7e375..22cb097bcbdc 100644
>>> --- a/drivers/soc/Kconfig
>>> +++ b/drivers/soc/Kconfig
>>> @@ -9,6 +9,7 @@ source "drivers/soc/bcm/Kconfig"
>>>   source "drivers/soc/fsl/Kconfig"
>>>   source "drivers/soc/imx/Kconfig"
>>>   source "drivers/soc/ixp4xx/Kconfig"
>>> +source "drivers/soc/microchip/Kconfig"
>>>   source "drivers/soc/mediatek/Kconfig"
>>>   source "drivers/soc/qcom/Kconfig"
>>>   source "drivers/soc/renesas/Kconfig"
>>> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
>>> index 36452bed86ef..fb084cf2d12e 100644
>>> --- a/drivers/soc/Makefile
>>> +++ b/drivers/soc/Makefile
>>> @@ -14,6 +14,7 @@ obj-$(CONFIG_ARCH_GEMINI)	+= gemini/
>>>   obj-y				+= imx/
>>>   obj-$(CONFIG_ARCH_IXP4XX)	+= ixp4xx/
>>>   obj-$(CONFIG_SOC_XWAY)		+= lantiq/
>>> +obj-$(CONFIG_SOC_MICROCHIP_POLARFIRE)	+= microchip/
>>>   obj-y				+= mediatek/
>>>   obj-y				+= amlogic/
>>>   obj-y				+= qcom/
>>> diff --git a/drivers/soc/microchip/Kconfig b/drivers/soc/microchip/Kconfig
>>> new file mode 100644
>>> index 000000000000..40e5203c8ba0
>>> --- /dev/null
>>> +++ b/drivers/soc/microchip/Kconfig
>>> @@ -0,0 +1,10 @@
>>> +config MPFS_SYS_CONTROLLER
>>> +	tristate "MPFS_SYS_CONTROLLER"
>>> +	depends on MPFS_MBOX
>>> +	help
>>> +	  This driver adds support for the Polarfire SoC system controller.
>>> +
>>> +	  To compile this driver as a module, choose M here. the
>>> +	  module will be called mpfs_system_controller.
>>> +
>>> +	  If unsure, say N.
>>> diff --git a/drivers/soc/microchip/Makefile b/drivers/soc/microchip/Makefile
>>> new file mode 100644
>>> index 000000000000..23b1f42a37db
>>> --- /dev/null
>>> +++ b/drivers/soc/microchip/Makefile
>>> @@ -0,0 +1 @@
>>> +obj-$(CONFIG_MPFS_SYS_CONTROLLER)	+= mpfs_sys_controller.o
>>> diff --git a/drivers/soc/microchip/mpfs_sys_controller.c b/drivers/soc/microchip/mpfs_sys_controller.c
>>> new file mode 100644
>>> index 000000000000..875a0671e196
>>> --- /dev/null
>>> +++ b/drivers/soc/microchip/mpfs_sys_controller.c
>>> @@ -0,0 +1,135 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Microchip MPFS system controller driver
>>> + *
>>> + * Copyright (c) 2020 Microchip Corporation. All rights reserved.
>>> + *
>>> + * Author: Conor Dooley <conor.dooley@microchip.com>
>>> + *
>>> + */
>>> +
>>> +#include <linux/slab.h>
>>> +#include <linux/module.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/of_platform.h>
>>> +#include <linux/mailbox_client.h>
>>> +#include <linux/platform_device.h>
>>> +#include <soc/microchip/mpfs.h>
>>> +
>>> +static DEFINE_MUTEX(transaction_lock);
>>> +
>>> +struct mpfs_sys_controller {
>>> +	struct mbox_client client;
>>> +	struct mbox_chan *chan;
>>> +	struct completion c;
>>> +	u32 enabled;
>>> +	void *response;
>>> +	u16 response_size_bytes;
>>> +};
>>> +
>>> +int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg,
>>> +			      void *response, u16 response_size_bytes)
>>> +{
>>> +	int ret;
>>> +
>>> +	mpfs_client->response = response;
>>> +	mpfs_client->response_size_bytes = response_size_bytes;
>>> +
>>> +	mutex_lock_interruptible(&transaction_lock);
>>> +
>>> +	reinit_completion(&mpfs_client->c);
>>> +
>>> +	ret = mbox_send_message(mpfs_client->chan, msg);
>>> +	if (ret >= 0) {
>>> +		if (wait_for_completion_timeout(&mpfs_client->c, HZ)) {
>>> +			ret = 0;
>>> +		} else {
>>> +			ret = -ETIMEDOUT;
>>> +			dev_warn(mpfs_client->client.dev, "MPFS sys controller transaction timeout");
>>> +		}
>>> +	} else {
>>> +		dev_err(mpfs_client->client.dev,
>>> +			"mpfs sys controller transaction returned %d\r\n", ret);
>>> +	}
>>> +
>>> +	mutex_unlock(&transaction_lock);
>>> +
>>> +	return ret;
>>> +}
>>> +EXPORT_SYMBOL(mpfs_blocking_transaction);
>>> +
>>> +static void rx_callback(struct mbox_client *client, void *msg)
>>> +{
>>> +	struct mpfs_sys_controller *mpfs_client =
>>> +		container_of(client, struct mpfs_sys_controller, client);
>>> +
>>> +	memcpy(mpfs_client->response, (u8 *)msg,
>>> +	       mpfs_client->response_size_bytes);
>>> +
>>> +	complete(&mpfs_client->c);
>>> +}
>>> +
>>> +static int mpfs_sys_controller_probe(struct platform_device *pdev)
>>> +{
>>> +	struct device *dev = &pdev->dev;
>>> +	struct mpfs_sys_controller *mpfs_client;
>>> +
>>> +	mpfs_client = devm_kzalloc(dev, sizeof(*mpfs_client), GFP_KERNEL);
>>> +	if (!mpfs_client)
>>> +		return -ENOMEM;
>>> +
>>> +	mpfs_client->client.dev = dev;
>>> +	mpfs_client->client.rx_callback = rx_callback;
>>> +	mpfs_client->client.tx_block = 1U;
>>> +
>>> +	mpfs_client->chan = mbox_request_channel_byname(&mpfs_client->client,
>>> +							"mbox-mpfs");
>>> +	if (IS_ERR(mpfs_client->chan)) {
>>> +		int ret = PTR_ERR(mpfs_client->chan);
>>> +
>>> +		if (ret != -EPROBE_DEFER)
>>> +			dev_err(dev, "Failed to get mbox channel: %d\n", ret);
>>> +		return ret;
>>
>> You can replace all of this with
>>
>> 		return dev_err_probe(dev, PTR_ERR(mpfs_client->chan),
>> 				     ""Failed to get mbox channel\n");
> 
> you'll spam the error log if you get a lot of probe defferals.
> I think the code as is fine.

Please look at that function code: it does not print anything if the error is
-EPROBE_DEFER.

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
