Return-Path: <SRS0=IlQS=FI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8C2C433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 11:16:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4091922525
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 11:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4091922525
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=TxYnCmjAdvryn+bMSeTDMS0QiSf4dJCobmhyLTIZhhU=; b=PCM55gj2emocXKjqn4CsQKWeh
	cBfQrhGaL2gh4FPdrqqT/PZfPxT6wKGYYnSeO3V5u5q5eGnPEtOrYE9giSNwUUhQTECvv7MKThuf0
	C/43K3pAhbueowjKtg/0Ud80hvovkqSWgAynxH6JsCG4aoij68Fs5uUWdIyuNShH4rsxeF4518nv2
	xYV1scZwGDwMgNXZ9y8mPsK+xd0XpP/UFD60PEs9+T0Uka921vXrg1cz4K41tHKklrhO2ZZ4vY4PE
	V7KUv+DUgqSOuNfCKKM2udKFglnvkCDScGxycQSsX+zKyabuGJCSYTTpNkvYFfYso3s7izpqhI41c
	ydsMtWwaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl94r-0004Kb-0o; Fri, 04 Dec 2020 11:16:41 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl94j-0004Eh-N9
 for linux-riscv@lists.infradead.org; Fri, 04 Dec 2020 11:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607080593; x=1638616593;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=bMwc0U+y21r9jS550/W2g+CtKn3xMQEZBJcdLpF0/fk=;
 b=pO9maXmWKV+06GrYkfas7jU7MQItF68ac7TaHMsmQVddcZul4H9OI01D
 6SZxf5sH1rtdDvmNPWUSNhR0ntfc82/YUaQ8lisXkWXduZimJ0g7dj8BH
 2/zMoNVA9XkkDX39Y2YGXFcgEmLs/adlCtJE88lMC0HHmuI6lqQqQTWTM
 Ty+c+s/QnJM9FDn6bT+FOYC9TOyauCZC3BSjL0FNv/x9y/Fn2TI/DMybM
 eYbOw3FVx6FNaxUV7MFdYTw6/qqEKddZBhw6lqFYKaoNAmyi4ijfyDthd
 6HOR2SyvB8XFPQU9Dk614yT+1HscQoSLJO4mBx4DgoTQZlKECWI7ZaJ7x Q==;
IronPort-SDR: bNQLpeu2qcn0/muX+YxOx2B3CKCOGZZFQZtNiHoq/rsbPe9le65nSMt0Qo5AEX2g0A/cEGGzp/
 PUDFyM6tT0ueqNQ7OquiyJBHItzVWJajqicI7fsQCxiA3yosgxTTAfCbYeVNIHH7rxKz6qO9Uo
 UOvmOsVdQkTXSYNrDDp5TxunUNskxXyNj0G40MrSdPkgK0TCx7BsLHAS+xx0cEoj3nhIhVKZVR
 z/FjK5rx1x32keqUSq7y4/OtPkU97jSh24oNsg6nyShTyvKCJX28ltdTAQmY13BpJ4rX4dvfkk
 qqc=
X-IronPort-AV: E=Sophos;i="5.78,392,1599494400"; d="scan'208";a="155639743"
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hgst.iphmx.com with ESMTP; 04 Dec 2020 19:16:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6UxjqKBdmuI+mKITdWJp6amYvf1QxPG3atrh+Navs58HySiHLZdHAn9rPftwkOUefWxTziLf91pktzP1IjuaMRD7U18BiR+0nyEgKQ+tqd8SRkudd5MHWD2oZJs7kIRJptH5C2BvmC3t5LNMKyZ7T6U/5I2Oc7fD1dL8N3dV7mKmgpNkhZyRBg8FoFuUSHcJPszbDaFfWWTM2BEsTQCoBoyoXr3uDV/C4RjVAlMd6YUg3+Q/nJicdOITf3FvDvQrJ/aSqeHmsq/0w3FRD4lZFjgyU/2T14/II5gnN0g8zD8DnMfe+Kzvxqa002FL3U878NlpTPtdtjyt++7dLJ98g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHz7DwbMe69Eo0JCHAY5lR9DvzKdrXcoQmJ+FQ0uMvI=;
 b=Hc4bTZsEMFn1XUGfsQGD7c4iShSBjiuJp+v+uirAmKFjypkEIgcplPoBJM7EpbNlO1tTkhldDSbzdUFtwwLMCHh4WZdVwjx1iyWb7QhTcsnwdwysidbU7kx0DI1AJPDfDwnSnyaLBLXkMgiVKVUW+aO5cRbSCM9Fu3qDbZykH2k/pM8Il6zPxupA4wPM4Y+TbS6eDAC3dcGXGnq9sXmzxic30+5SwKRDHzmbyGwmJ6sFJTmZ/Ohtu/z8UaVKMr6DkxLgoAMOfe4rrRRRKeq5mQakeR3S/uujmC9E5mjsIe8SE4DGeG8E2qbrJbtFE5s4t3UUL2OsXVA6f2hBzNQW7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHz7DwbMe69Eo0JCHAY5lR9DvzKdrXcoQmJ+FQ0uMvI=;
 b=ao3c9RJOGR/DzvXaOciGewhFbS7axJkg0Y2NyG0uI0RPKO61YksrlusmDH5nGpO48hAKKtwPn9SfYkFhME95hsKnqj7gCZvDaGB4mMvkQD388iUs4z5bbEF/w3r6I/KC9C3/E0UZcbuziL3I5s4Vn42ohrj84Way/eMcCOKgYkw=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6773.namprd04.prod.outlook.com (2603:10b6:610:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 4 Dec
 2020 11:16:26 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3589.022; Fri, 4 Dec 2020
 11:16:26 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Palmer Dabbelt
 <palmer@dabbelt.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Boyd
 <sboyd@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v4 13/21] riscv: Add Canaan Kendryte K210 reset controller
Thread-Topic: [PATCH v4 13/21] riscv: Add Canaan Kendryte K210 reset controller
Thread-Index: AQHWyFrMRZLrAom12ECLCBYtCSIvPg==
Date: Fri, 4 Dec 2020 11:16:26 +0000
Message-ID: <CH2PR04MB6522E593461E7BE610ECFB3FE7F10@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
 <20201202032500.206346-14-damien.lemoal@wdc.com>
 <aad38b7cbaa2b22092ad466cf01ec7e0c1f08b72.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:5458:21bf:70ee:2847]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 66ec5d8a-9e72-44d5-095c-08d898460aa3
x-ms-traffictypediagnostic: CH2PR04MB6773:
x-microsoft-antispam-prvs: <CH2PR04MB67737D6DDE7748BDF752ACD8E7F10@CH2PR04MB6773.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7O8xTO+JVlVsmb5+wdB2DvCGFNJ7oNzvQd0hnjuooALL+hTQVOtrnsaP1gMSLv7YFHlwroCaz0i9Czi7UGIEkO/rAcYSCqqgTT9Llj8dz3/J/+81JyBFAPgRRXYTFE8dbXIVQt2KFu4PqKcNskSG5dNwpLKzUmJXAvCeN3zvKg5ORXl6uqJeOO5vbeqxqdQ4WDgzOTDinC9qzVkk2HXddGnztRWbAyv+5Z0mxV3cSULWdlc62g8dMJBHTlG5BJ8l9/0lzQFr6tuUNG+lw+d2B2VbXePbwKlel/9DB+bnR7rmlxF+YwteZ0/Le2Ih3KddtouJTo5DvuhGOP6CcaIX7Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(66476007)(316002)(76116006)(66946007)(91956017)(66556008)(83380400001)(4326008)(9686003)(7416002)(186003)(55016002)(8936002)(8676002)(2906002)(33656002)(6506007)(5660300002)(53546011)(110136005)(7696005)(66446008)(52536014)(64756008)(71200400001)(86362001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?euUO0OcNMaWUMPP16QyvQAkhtSSxO4gRSz/Mod4+4vQGx/yFjx1nsa9atwyx?=
 =?us-ascii?Q?cgB2x5Ex9afirLEblsNeq1mt5SX3XMB7lef72OwqsxAisub8DADdsUaMCNha?=
 =?us-ascii?Q?ZSj7S+OxARhJGqSJvsZvaAVKarAjDwHbBcu271gmjsC67JyfvbGjcvwZ5VPt?=
 =?us-ascii?Q?qSDRi0GexAgb0XFD7B2HEeuxCyaKNI5QNLxwpyU/cJgR1W3zydzhBdgwrxk8?=
 =?us-ascii?Q?WO3E94zoXFgBYP00FwF9fEMYrykCx4Ib9XaXbzgD9PY0g/LI8xeFBua8qw2+?=
 =?us-ascii?Q?6GcqkxvFLAYBlIZv3Y9+T+yPRrGVLtU1OZ3B+xnIpV5zr7sreCPvjYU6sAlA?=
 =?us-ascii?Q?uf/Q22m2L1LBj0g/4Xhet58Nha213hQbPbduU+DbLsA4rCD1YD+Iz2bimgHj?=
 =?us-ascii?Q?kQlIgUl+DBGcmDl7nXYhVr0/J4kaGmAHNYVU1EVJ1+UzfDsB6Jd30awbS8PN?=
 =?us-ascii?Q?NpuOs/7mYn8+TKm/Zs1P/Op73g5JCj/rGXFOU5bNiFe33sZQg+wYFV7v7gBm?=
 =?us-ascii?Q?ED6E76HxvE/Uji5LCtJ4GLRyO5D3/mjUK1FQpp/+UzHM1gBGSuGGnCgpFbL1?=
 =?us-ascii?Q?EdGdO5zcg4E00SoSsN1Qi2v+trn4i92Nu0UOuJI5N2McD6o7sIAV+Jozli31?=
 =?us-ascii?Q?m8H2UcVr2SpesGufo7LbpmhM1C5BMz+MLW9hwh/P1378Kpzl23D3jYI010/d?=
 =?us-ascii?Q?dKmUBkC6MjqqDtYZhb8IO9fg5FmHo7f0vGGjTH5J03yU5H9vFu2UJn8Q4t7t?=
 =?us-ascii?Q?gpsh00PnK6zsAWsigQmPemhwESA4MGhEtsEIQugTNw0B099eO3oLMsXA19Zw?=
 =?us-ascii?Q?vHq+zF2Dxy27SukyjR+r9tb/dk0EwDHU3Nqji5GaLbU5eHjgt2cmMW9HQTp5?=
 =?us-ascii?Q?95gMcmJ3Slb/qxZ/VMYqHILUAeDURjqWRCqVob0uD/N0BcupskdAj2QFQcyW?=
 =?us-ascii?Q?WChl9mq4f6xpEHnqES1uDe56Q1NcPUVAV9DYWC8mOdUOFggL+uMy9wFeBCXP?=
 =?us-ascii?Q?gWUeGapN2w4Zu2h8WheQ9pVbkaGjlEZ8PVjagQwTvpWtvGasEbDjcdr7UqLZ?=
 =?us-ascii?Q?baddENvX?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ec5d8a-9e72-44d5-095c-08d898460aa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2020 11:16:26.5329 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SZdBr8Ve9usApK9ZtwXkjFV/Nm68sM5Qk4VX8QVBfoLkdaM0n/Bs5KLlJ66/O2pNyCC9zNtTXNgumU5OlmhSbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_061634_098365_E3C5761F 
X-CRM114-Status: GOOD (  21.28  )
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
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/12/04 19:49, Philipp Zabel wrote:
> Hi Damien,
> 
> On Wed, 2020-12-02 at 12:24 +0900, Damien Le Moal wrote:
>> Add a reset controller driver for the Canaan Kendryte K210 SoC. This
>> driver relies on its syscon compatible parent node (sysctl) for its
>> register mapping. Automatically select this driver for compilation
>> when the SOC_CANAAN option is selected.
>>
>> The MAINTAINERS file is updated, adding the entry "CANAAN/KENDRYTE K210
>> SOC RESET CONTROLLER DRIVER" with myself listed as maintainer for this
>> driver.
>>
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> ---
>>  MAINTAINERS                |   8 +++
>>  arch/riscv/Kconfig.socs    |   3 +
>>  drivers/reset/Kconfig      |   9 +++
>>  drivers/reset/Makefile     |   1 +
>>  drivers/reset/reset-k210.c | 141 +++++++++++++++++++++++++++++++++++++
>>  5 files changed, 162 insertions(+)
>>  create mode 100644 drivers/reset/reset-k210.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index a059ab02fa8a..c2b3d6e48cd5 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3837,6 +3837,14 @@ L:	linux-gpio@vger.kernel.org (pinctrl driver)
>>  F:	Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
>>  F:	drivers/pinctrl/pinctrl-k210.c
>>  
>> +CANAAN/KENDRYTE K210 SOC RESET CONTROLLER DRIVER
>> +M:	Damien Le Moal <damien.lemoal@wdc.com>
>> +L:	linux-kernel@vger.kernel.org
>> +L:	linux-riscv@lists.infradead.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
>> +F:	drivers/reset/reset-k210.c
>> +
>>  CANAAN/KENDRYTE K210 SOC SYSTEM CONTROLLER DRIVER
>>  M:	Damien Le Moal <damien.lemoal@wdc.com>
>>  L:	linux-riscv@lists.infradead.org
>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>> index 68bdd664b5c2..b3cd253ec2c2 100644
>> --- a/arch/riscv/Kconfig.socs
>> +++ b/arch/riscv/Kconfig.socs
>> @@ -33,6 +33,9 @@ config SOC_CANAAN
>>  	select CLK_K210
>>  	select PINCTRL
>>  	select PINCTRL_K210
>> +	select ARCH_HAS_RESET_CONTROLLER
>> +	select RESET_CONTROLLER
>> +	select RESET_K210
>>  	help
>>  	  This enables support for Canaan Kendryte K210 SoC platform hardware.
>>  
>> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
>> index 07d162b179fc..529d206cfdfd 100644
>> --- a/drivers/reset/Kconfig
>> +++ b/drivers/reset/Kconfig
>> @@ -245,6 +245,15 @@ config RESET_ZYNQ
>>  	help
>>  	  This enables the reset controller driver for Xilinx Zynq SoCs.
>>  
>> +config RESET_K210
>> +	bool "Reset controller driver for Canaan Kendryte K210 SoC"
>> +	depends on RISCV && SOC_CANAAN
>> +	depends on OF && MFD_SYSCON
>> +	help
>> +	  Support for the Canaan Kendryte K210 RISC-V SoC reset controller.
>> +	  Say Y if you want to control reset signals provided by this
>> +	  controller.
>> +
>>  source "drivers/reset/sti/Kconfig"
>>  source "drivers/reset/hisilicon/Kconfig"
>>  source "drivers/reset/tegra/Kconfig"
>> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
>> index 16947610cc3b..1730a31e6871 100644
>> --- a/drivers/reset/Makefile
>> +++ b/drivers/reset/Makefile
>> @@ -33,4 +33,5 @@ obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
>>  obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
>>  obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
>>  obj-$(CONFIG_ARCH_ZYNQMP) += reset-zynqmp.o
>> +obj-$(CONFIG_RESET_K210) += reset-k210.o
>>  
>> diff --git a/drivers/reset/reset-k210.c b/drivers/reset/reset-k210.c
>> new file mode 100644
>> index 000000000000..2cf9a63c763d
>> --- /dev/null
>> +++ b/drivers/reset/reset-k210.c
>> @@ -0,0 +1,141 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2020 Western Digital Corporation or its affiliates.
>> + */
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset-controller.h>
>> +#include <linux/delay.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/regmap.h>
>> +#include <soc/canaan/k210-sysctl.h>
>> +
>> +#include <dt-bindings/reset/k210-rst.h>
>> +
>> +#define K210_RST_MASK	0x27FFFFFF
>> +
>> +struct k210_rst {
>> +	struct regmap *map;
>> +	struct reset_controller_dev rcdev;
>> +};
>> +
>> +static inline struct k210_rst *
>> +to_k210_rst(struct reset_controller_dev *rcdev)
>> +{
>> +	return container_of(rcdev, struct k210_rst, rcdev);
>> +}
>> +
>> +static inline int k210_rst_assert(struct reset_controller_dev *rcdev,
>> +				  unsigned long id)
>> +{
>> +	struct k210_rst *ksr = to_k210_rst(rcdev);
>> +	u32 bit = BIT(id);
>> +
>> +	if (!(bit & K210_RST_MASK))
>> +		return -EINVAL;
> 
> Instead of checking this mask in the k210_rst_assert/deassert/status()
> functions, you could implement a custom .of_xlate callback and disallow
> requesting invalid resets in the first place.

OK. I did not know about this. Will look into it and send a v5.

Thanks !

> 
> regards
> Philipp
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
