Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBA8C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 01:57:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 952AF23A5A
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 01:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 952AF23A5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=vI6BJnBu7YvLTkSHyY93QH6LYMWpzrEs9IwIq1fKGdk=; b=NIRzbr3sG8ehgXl+rDAYzv6Nl
	qsGsY1AY2GXUZS/+VIvtMwhsTldlxemQEFYwgOplAau5g1cw6xWAGxK7KoJoey9GJPwgLaZyFm7OB
	RsDowX+1yqFCslO+XcEItiETlRbiYLMKCCEbc5NFb3iSDVNoTbhM6GjnbmrHNsY1V8SJTH7ejORYW
	h1uK84fZ2V5kqcpUPg/Q2VQEqWVihEv2DMCr3pW0vJqci4u9r/RCvhJRIj80oARRNahh9hzka93Iu
	lZ07tYR8uELoEu3PhoyYeOsd9WYYAkCVYI4OFzl8EA9j2+Y62ebWKlGqby91YL3FGyq/zyrLmCQej
	OeErwJwyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Dlc-0003a0-6w; Fri, 15 Jan 2021 01:19:08 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0DlY-0003ZA-4K
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 01:19:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610673543; x=1642209543;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=aB+x8KA+QTkV/FGQaVaCIbfEdXUEijbDiTo2tme6qQk=;
 b=TX6DX6UeogUGW0a7kJc76V8Ip1MxaU5U5sxm4Xw4KjULw7s6b2mh3NV7
 oFTYaIVQrAv5MzApxNCx1qDDSUCOZa7mr9EyvbW4tbHeJ7J6ROwQaf+7O
 RyP/ZEfESbb7pMd+oh+bQu7teNtleTnb3DB9Hq2olCK3gecr4ZfXaOAHg
 2pifmTirQcLfzAabgEzm6sn4OAJ3jE0p/7Ac3Yseq3DoOhPJHS+kCSRYe
 w4gdyGXhgmSPrD03RwrL+6iFwqzUUqnKvzYTc8cD2qVo00oL+x0TPKmDv
 atqTMiTyePbNNUy7Z4CkACCUIy9r7hzbv5wFZ7OxmXdSORijjYiWnJmrT w==;
IronPort-SDR: NlVULC1pfRws6GgLtQMgH2RHq4oyrj/1JVRT3dvCjYvpTOkETrbRW69KAhPPdJiBlMie0/IQFx
 qHmFTC9eFzQXLgyzY8OLzuBrgDPH/gtwx0F3+GAn+a/xrGqq/KHldkq6TdqtiO5bZDhpD9UDf4
 2BSApjDvabMZGRdTLLr+wsUulniH1qzCU5VYnh2bfNghAHSIn1JbVVaOQ5BTcQZXNvSpRx7YI0
 V3VrLu1atkBtB1+x+CZXlhtPs2I8hwi/1vXWXeNi2t8zotsCeQXAoBumtakVsTs87poIQKFeqF
 //g=
X-IronPort-AV: E=Sophos;i="5.79,347,1602518400"; d="scan'208";a="157468074"
Received: from mail-cys01nam02lp2058.outbound.protection.outlook.com (HELO
 NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.58])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2021 09:19:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ty/0NYeaQ0+upiGrQcd33pffPdnXSdPubsUxsL7MBD9v3fthCDg/ug5V86dsejkHa0tEG8s9T8jVO88eCcBEgEP/8snVJbTt7LEdP0yBS9rbyQNFRIPzBc8RykZXE2DdCLOxr+5qiOi6wUxuwVeFK10+k35GXdVgC055WBfTzTmYlXZSD6jZBgQvjfq5HX3OZR7cmq+ioUxTLJShX30sdjUv+xXWhl++Yj+1NrEKmXjI1++1C1LwTe9Z+dxvl3l1tZraIECCIN9OtVoPpH2D9J6DZ/cKPOuXAqqCk5WobFPu0ra0Dwbcjgv56QC2xDjzkhDgGrBMWV7fl5RK/D+ojA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ID2Ad183FZLlF+l4ppzwKbmHpIVs8j1CDMDsoPvmotY=;
 b=bwt0FShCsdfBPgJHs2tngzThk1g4el6RPr1esRiaD/VpPh3o48PWyaxcKbr2RRA1FWMGqSMIbeoLkjpmphVkKJ3ZAIMQioeikIMwOIaTyhiWETsWTMaB711V8lCYnJD5bIorfp6nQPLNvfy+ZCUjfQ6bLOIoWQ3IiIGs6XuY7aJ6KnFu28n9qxLbD6jZde3YW1XNIUwCfmv+kK7dj+wBn2O/9IO/b0zE7N1ZZ3Z2EssbhrFJgZv7tY4KsSdekaMif5CSmD0IQHMlpVLOWmkzS0i59/mg8JOOgbIoFAa/DyyRfWj3nTE2SMGcG3sr5jgR5qczYU7AB1RBL5zcQTidUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ID2Ad183FZLlF+l4ppzwKbmHpIVs8j1CDMDsoPvmotY=;
 b=CPK0Im8Fa0qEp9Af3uLzJct4p7h7Ow4/dm0Ces024z+fgAS19311P7WZQAi6wwVcB8K9Ou0L/K0Gi7PEp5KIEledvVyLWd0F1Q+KveHPKiRuqeLESLxtSeRbAzoH532j2QlUDFNOHdqI03Zu4TXrKb+nzO3OSraAczxNJUbbde4=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6735.namprd04.prod.outlook.com (2603:10b6:208:1ec::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Fri, 15 Jan
 2021 01:18:58 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%8]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 01:18:58 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Sean Anderson <seanga2@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v11 03/10] riscv: Update Canaan Kendryte K210 device tree
Thread-Topic: [PATCH v11 03/10] riscv: Update Canaan Kendryte K210 device tree
Thread-Index: AQHW6H4ffzJIz+L53U2eOGwbaV2KdQ==
Date: Fri, 15 Jan 2021 01:18:58 +0000
Message-ID: <BL0PR04MB65141F6FB783D5035D83E30BE7A70@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <mhng-b30be63a-5293-4d18-85cb-fb2c62b3188e@palmerdabbelt-glaptop>
 <9d32abd1-ffb4-a887-a40d-fc173a371d23@gmail.com>
 <484787f2-558c-1eb4-7ab0-23f0ac5e6cd5@gmail.com>
 <fbff79af-deb7-e400-4e1b-cc1ef814451d@gmail.com>
 <BL0PR04MB6514593E3235BBFE84D74BB2E7A70@BL0PR04MB6514.namprd04.prod.outlook.com>
 <d6cbb729-0824-1527-f749-e45b55c8840f@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8c78:be0:63f5:4b05]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3c6f03d2-6f47-4574-eaba-08d8b8f388df
x-ms-traffictypediagnostic: MN2PR04MB6735:
x-microsoft-antispam-prvs: <MN2PR04MB673563A912D53047D9776872E7A70@MN2PR04MB6735.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4hJ2GSl9VqiddTj1O9WR3/uusYwBP1aWKQDYYN3XfTmlFZCiKOafFdEny2JOAKwoTANMoqj4W7HTD2GVMi/gf4ylL8U/VvlACduy1UqSWHTa/vvtFwrx3TN9fCdbB4A+0ayzFlkR1AbLApjwJSDWfsfcf/+E8YXsmcaVc5gQ+kODYQAVrXjnh250ZJHhswA/XjZprkMPDu+i+k5ceO0AKLjraJGmMiwH3gUTuaN0fc1vTf1A2gg09ARsHmtbd7GFCUHo17l8zs1+Hb2IaMm4+l1Hr096qO4/olh9KFluRtoIty2sXlgylMri41NR+Ob5VdWX+JkV5DM+oP7L+8OxT4LDQz4yzjGLO8mMEUlGUOArZPjzKsYKu+MzWS1rxh1YAzHSxT+ZvpqhTToFGyUgsg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(52536014)(478600001)(186003)(55016002)(71200400001)(91956017)(76116006)(66946007)(7696005)(66556008)(64756008)(110136005)(86362001)(66476007)(83380400001)(66446008)(316002)(8676002)(6506007)(54906003)(5660300002)(15650500001)(8936002)(2906002)(9686003)(53546011)(33656002)(4326008)(30864003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?lk1lk7fcWwg4XVgpnI1JncTwTLAKzwsL53844G8fVYU/g6z7/JB05Qgyx5Av?=
 =?us-ascii?Q?D+97l5bjmi/ePCAo995oC7Q24DDT70mWGOxPBoEey5D9WUjNgFIJOYk5R1Dl?=
 =?us-ascii?Q?zoJ7AJdHvzi/B802koC7e57fa3p0BT5VcCNwWNzHc4HwR2kbqvBAAxJq0l6l?=
 =?us-ascii?Q?c3tFStG4sO9pfMdQcr2doM9QOQol6beIhhCsnC75oEATz5J2uWSMj2zWTOTy?=
 =?us-ascii?Q?ME0yoVa3f4JMkefIOyYDenENCFlzoLTf+HYEGnPwc/zXPgCVaM/8byY2E+jf?=
 =?us-ascii?Q?b8j/4FPXSCBleN8hm/MTsOO0QyzN4kb5Q78LZlDYld1J1nJKuqGtO8rhwI54?=
 =?us-ascii?Q?0kq2BifPZ789zlYURicXqNciOi0bwTwPjEUavkMyhF6sQC7xt4Q3jUUJ7D4I?=
 =?us-ascii?Q?08T7unsjD3fIL+YAO9RzsrGGhmVIro3lOYcAJbr0vzgI/oj4wSYdKbuqbK23?=
 =?us-ascii?Q?0tonR8Q7CHSVOsq80zRAoOAWa6+qaayy/iC0N1M0Wg3SXPXN5zrl2wswHi/R?=
 =?us-ascii?Q?9nQXeNf8pH5GPUXRXF9xxNuEujl3IhhJa9QJtZ1TzunePwwcHCcZr+uRGyFB?=
 =?us-ascii?Q?ztwtDnRssU/EV87/TtsYFJIuM7Ol7ZlKRr0nJTpQ+1rHjlJJi0tVz0JuZg9U?=
 =?us-ascii?Q?gNutIkMU18JTFscF7Fyy8CLjwEUNvoJxaXocvGkRFKUQdggDqKWKf9dki8gz?=
 =?us-ascii?Q?SlB6pxdriEapwyLq/TYoXx4FyPSrBkSA1VLApUcqG9mfwMaTY37K4EpeLP1e?=
 =?us-ascii?Q?zfAN3RJ4euggt9BcFaWqa+cZJCSdUgtjoX+o0n1k8800YpyNG/7Ye52qfeBB?=
 =?us-ascii?Q?B9BC6BeUkn9+x705NlpN3eQhEQ6x/PVIshLbgbU/PGGzB8WKdZtBqMLuc3Ci?=
 =?us-ascii?Q?V7DOI2Eykx/4e3CcJz+H/fPqv4gjXdW8rC3TpxxcdzTwqu+owoXEZRAQhqQT?=
 =?us-ascii?Q?3Iir9hjhpvCrNKZTh7eWb1o0t7n/GQMtby+3jjtt9NreAFUTa9X6qyDEqzAx?=
 =?us-ascii?Q?4b7m8sjjx/taC0wVP8Leue2mZqAJrVYjpF19eUta4wY3vQ0smEv4Kky0tB6m?=
 =?us-ascii?Q?AfaNK8tr?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c6f03d2-6f47-4574-eaba-08d8b8f388df
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 01:18:58.5297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LPjW13FLMKm+D37s5Sqz2QpW78/dDrRp1EZcA7yd74JqXTQiq8PVuTaES7lnA7yGMmTUuVVJ9iwkPRp3YapQHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6735
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_201904_927051_8148602E 
X-CRM114-Status: GOOD (  18.00  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/01/15 10:14, Sean Anderson wrote:
> On 1/14/21 8:03 PM, Damien Le Moal wrote:
>> On 2021/01/15 9:35, Sean Anderson wrote:
>>> On 1/14/21 7:06 PM, Sean Anderson wrote:
>>>>
>>>> On 1/14/21 7:01 PM, Sean Anderson wrote:
>>>>>
>>>>> On 1/14/21 6:32 PM, Palmer Dabbelt wrote:
>>>>>> On Mon, 11 Jan 2021 16:58:41 PST (-0800), Damien Le Moal wrote:
>>>>>>> Update the Canaan Kendryte K210 base device tree k210.dtsi to define
>>>>>>> all peripherals of the SoC, their clocks and reset lines. The device
>>>>>>> tree file k210.dts is renamed to k210_generic.dts and becomes the
>>>>>>> default value selection of the SOC_CANAAN_K210_DTB_BUILTIN_SOURCE
>>>>>>> configuration option. No device beside the serial console is defined by
>>>>>>> this device tree. This makes this generic device tree suitable for use
>>>>>>> with a builtin initramfs with all known K210 based boards.
>>>>>>>
>>>>>>> These changes result in the K210_CLK_ACLK clock ID to be unused and
>>>>>>> removed from the dt-bindings k210-clk.h header file.
>>>>>>>
>>>>>>> Most updates to the k210.dtsi file come from Sean Anderson's work on
>>>>>>> U-Boot support for the K210.
>>>>>>>
>>>>>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>>>>>>> Reviewed-by: Anup Patel <anup@brainfault.org>
>>>>>>> ---
>>>>>>>   arch/riscv/Kconfig.socs                     |   2 +-
>>>>>>>   arch/riscv/boot/dts/canaan/k210.dts         |  23 -
>>>>>>>   arch/riscv/boot/dts/canaan/k210.dtsi        | 551 +++++++++++++++++++-
>>>>>>>   arch/riscv/boot/dts/canaan/k210_generic.dts |  46 ++
>>>>>>>   include/dt-bindings/clock/k210-clk.h        |   1 -
>>>>>>>   5 files changed, 573 insertions(+), 50 deletions(-)
>>>>>>>   delete mode 100644 arch/riscv/boot/dts/canaan/k210.dts
>>>>>>>   create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts
>>>>>>
>>>>>> [Snipping this to the relevant bits, in case you missed it before.]
>>>>>>
>>>>>>> @@ -81,40 +107,515 @@ in0: oscillator {
>>>>>>>       soc {
>>>>>>>           #address-cells = <1>;
>>>>>>>           #size-cells = <1>;
>>>>>>> -        compatible = "kendryte,k210-soc", "simple-bus";
>>>>>>> +        compatible = "canaan,k210-soc", "simple-bus";
>>>>>>>           ranges;
>>>>>>>           interrupt-parent = <&plic0>;
>>>>>>>
>>>>>>> -        sysctl: sysctl@50440000 {
>>>>>>> -            compatible = "kendryte,k210-sysctl", "simple-mfd";
>>>>>>> -            reg = <0x50440000 0x1000>;
>>>>>>> -            #clock-cells = <1>;
>>>>>>> +        debug0: debug@0 {
>>>>>>> +            compatible = "canaan,k210-debug", "riscv,debug";
>>>>>>
>>>>>> I'm still getting lots of warnings about undocumented DT compatible strings
>>>>>> from checpatch.  Some of them might be in flight, but I don't see many of them
>>>>>> (including both of these debug ones) having been defined anywhere.  We went
>>>>>> through a whole process to sort out the SiFive DT naming conventions, I don't
>>>>>> want to just circumvent that for the Canaan stuff by merging it as-is.
>>>>>
>>>>> As far as I'm aware, it's recommended practice to add device-specific compatible
>>>>>
>>>>
>>>> Here it's because "riscv,debug" doesn't exist. This is the "debug"
>>>> device as described in the debug spec. AFAIK Linux never needs to
>>>> configure this device. It could probably be removed.
>>>>
>>>> I am going to try and go through the list of nonexistant compatibles and
>>>> see if there are any other devices like this (nothing else like it in
>>>> Linux).
>>>>
>>>> --Sean
>>>
>>> Ok, here is the (abbreviated) output:
>>>
>>>
>>>> cpu@0: compatible: ['canaan,k210', 'sifive,rocket0', 'riscv'] is not valid under any of the given schemas (Possible causes of the failure):
>>>> cpu@0: compatible: ['canaan,k210', 'sifive,rocket0', 'riscv'] is too long
>>>> cpu@0: compatible:0: 'canaan,k210' is not one of ['sifive,rocket0', 'sifive,bullet0', 'sifive,e5', 'sifive,e7', 'sifive,e51', 'sifive,e71', 'sifive,u54-mc', 'sifive,u74-mc', 'sifive,u54', 'sifive,u74', 'sifive,u5', 'sifive,u7']
>>>
>>> This is a device-specific compatible string as recommended by the
>>> current DT docs.
>>>
>>>> cpu@0: mmu-type:0: 'none' is not one of ['riscv,sv32', 'riscv,sv39', 'riscv,sv48']
>>>
>>> This should be added (though it is technically incorrect).
>>
>> will do.
>>
>>>
>>> (perhaps a version number should be added like 'riscv,sv39-1.10')
>>>
>>>> cpu@0: riscv,isa:0: 'rv64imafdgc' is not one of ['rv64imac', 'rv64imafdc']
>>>
>>> Should probably be fixed, as the g is redundant. However, this is
>>> probably not a good warning going forward, as more exotic combinations
>>> of extensions are implemented.
>>
>> I had removed the "g" here. I guess I messed up a rebase and it is back. Will
>> fix that.
>>
>>>
>>>> cpu@1: compatible: ['canaan,k210', 'sifive,rocket0', 'riscv'] is not valid under any of the given schemas (Possible causes of the failure):
>>>> cpu@1: compatible: ['canaan,k210', 'sifive,rocket0', 'riscv'] is too long
>>>> cpu@1: compatible:0: 'canaan,k210' is not one of ['sifive,rocket0', 'sifive,bullet0', 'sifive,e5', 'sifive,e7', 'sifive,e51', 'sifive,e71', 'sifive,u54-mc', 'sifive,u74-mc', 'sifive,u54', 'sifive,u74', 'sifive,u5', 'sifive,u7']
>>>>
>>>> cpu@1: mmu-type:0: 'none' is not one of ['riscv,sv32', 'riscv,sv39', 'riscv,sv48']
>>>> cpu@1: riscv,isa:0: 'rv64imafdgc' is not one of ['rv64imac', 'rv64imafdc']
>>>
>>> see above
>>>
>>>> serial@38000000: compatible:0: 'canaan,k210-uarths' is not one of ['sifive,fu540-c000-uart', 'sifive,fu740-c000-uart']
>>>
>>> device-specific, and intentional
>>
>> We can add this one to the sifive serial yaml.
>>
>>>
>>>> gpio-controller@38001000: compatible:0: 'canaan,k210-gpiohs' is not one of ['sifive,fu540-c000-gpio', 'sifive,fu740-c000-gpio']
>>>
>>> ditto
>>>
>>>> gpio-controller@38001000: 'ngpios' does not match any of the regexes: 'pinctrl-[0-9]+'
>>>
>>> known shortcoming with this dt property, but alas
>>
>> Yes. The driver was fixed. But the yaml is behind I guess. Will send a patch for
>> this one.
>>
>>>
>>>> gpio-controller@50200000: $nodename:0: 'gpio-controller@50200000' does not match '^gpio@[0-9a-f]+$'
>>>
>>> This matches devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
>>
>> This may be similar to the ngpios problem: the core expect something while the
>> yaml defines something older... Will have a look.
>>
>>>
>>>> gpio-controller@50200000: compatible: ['canaan,k210-gpio', 'snps,dw-apb-gpio'] is too long
>>>> gpio-controller@50200000: compatible: Additional items are not allowed ('snps,dw-apb-gpio' was unexpected)
>>
>> I wonder if we can just remove 'canaan,k210-gpio' here ?
>>
>>>> gpio-controller@50200000: 'gpio1@0' does not match any of the regexes: '^gpio-(port|controller)@[0-9a-f]+$', 'pinctrl-[0-9]+'
>>
>> Not sure what to do about this one.
>>
>>>> serial@50210000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is not valid under any of the given schemas (Possible causes of the failure):
>>>> serial@50210000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is too long
>>>> serial@50210000: compatible:0: 'canaan,k210-uart' is not one of ['renesas,r9a06g032-uart', 'renesas,r9a06g033-uart']
>>>> serial@50210000: compatible:0: 'canaan,k210-uart' is not one of ['rockchip,px30-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rv1108-uart']
>>>> serial@50210000: compatible:0: 'canaan,k210-uart' is not one of ['brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart']
>>>>
>>>> serial@50220000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is not valid under any of the given schemas (Possible causes of the failure):
>>>> serial@50220000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is too long
>>>> serial@50220000: compatible:0: 'canaan,k210-uart' is not one of ['renesas,r9a06g032-uart', 'renesas,r9a06g033-uart']
>>>> serial@50220000: compatible:0: 'canaan,k210-uart' is not one of ['rockchip,px30-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rv1108-uart']
>>>> serial@50220000: compatible:0: 'canaan,k210-uart' is not one of ['brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart']
>>>>
>>>> serial@50230000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is not valid under any of the given schemas (Possible causes of the failure):
>>>> serial@50230000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is too long
>>>> serial@50230000: compatible:0: 'canaan,k210-uart' is not one of ['renesas,r9a06g032-uart', 'renesas,r9a06g033-uart']
>>>> serial@50230000: compatible:0: 'canaan,k210-uart' is not one of ['rockchip,px30-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rv1108-uart']
>>>> serial@50230000: compatible:0: 'canaan,k210-uart' is not one of ['brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart']
>>>
>>> More device-specific strings.
>>>
>>>> spi@50240000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is not valid under any of the given schemas (Possible causes of the failure):
>>>> spi@50240000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is too long
>>>> spi@50240000: compatible:0: 'canaan,k210-spi' is not one of ['snps,dw-apb-ssi', 'snps,dwc-ssi-1.01a']
>>>> spi@50240000: compatible:0: 'canaan,k210-spi' is not one of ['mscc,ocelot-spi', 'mscc,jaguar2-spi']
>>>
>>> ditto
>>
>> Actually a false warning from checkpatch. canaan,k210-spi was already added to
>> the DW spi yaml.
>>
>>>
>>>> i2c@50280000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is not valid under any of the given schemas (Possible causes of the failure):
>>>> i2c@50280000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is too long
>>>>
>>>> i2c@50290000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is not valid under any of the given schemas (Possible causes of the failure):
>>>> i2c@50290000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is too long
>>>>
>>>> i2c@502A0000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is not valid under any of the given schemas (Possible causes of the failure):
>>>> i2c@502A0000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is too long
>>>
>>> ditto
>>>
>>>> timer@502D0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is not valid under any of the given schemas (Possible causes of the failure):
>>>> timer@502D0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is too long
>>>> timer@502D0000: compatible:0: 'canaan,k210-timer' is not one of ['snps,dw-apb-timer-sp', 'snps,dw-apb-timer-osc']
>>>>
>>>> timer@502D0000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
>>>
>>> `resets` is the correct name for this property.
>>>
>>>> timer@502E0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is not valid under any of the given schemas (Possible causes of the failure):
>>>> timer@502E0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is too long
>>>> timer@502E0000: compatible:0: 'canaan,k210-timer' is not one of ['snps,dw-apb-timer-sp', 'snps,dw-apb-timer-osc']
>>>
>>> More device-specific.
>>>
>>>> timer@502E0000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
>>>> timer@502F0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is not valid under any of the given schemas (Possible causes of the failure):
>>>> timer@502F0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is too long
>>>> timer@502F0000: compatible:0: 'canaan,k210-timer' is not one of ['snps,dw-apb-timer-sp', 'snps,dw-apb-timer-osc']
>>>>
>>>> timer@502F0000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
>>>> watchdog@50400000: compatible: ['canaan,k210-wdt', 'snps,dw-wdt'] is not valid under any of the given schemas (Possible causes of the failure):
>>>> watchdog@50400000: compatible: ['canaan,k210-wdt', 'snps,dw-wdt'] is too long
>>>> watchdog@50400000: compatible:0: 'canaan,k210-wdt' is not one of ['rockchip,rk3066-wdt', 'rockchip,rk3188-wdt', 'rockchip,rk3288-wdt', 'rockchip,rk3368-wdt']
>>>>
>>>> watchdog@50410000: compatible: ['canaan,k210-wdt', 'snps,dw-wdt'] is not valid under any of the given schemas (Possible causes of the failure):
>>>> watchdog@50410000: compatible: ['canaan,k210-wdt', 'snps,dw-wdt'] is too long
>>>> watchdog@50410000: compatible:0: 'canaan,k210-wdt' is not one of ['rockchip,rk3066-wdt', 'rockchip,rk3188-wdt', 'rockchip,rk3288-wdt', 'rockchip,rk3368-wdt']
>>>>
>>>> spi@52000000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is not valid under any of the given schemas (Possible causes of the failure):
>>>> spi@52000000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is too long
>>>> spi@52000000: compatible:0: 'canaan,k210-spi' is not one of ['snps,dw-apb-ssi', 'snps,dwc-ssi-1.01a']
>>>> spi@52000000: compatible:0: 'canaan,k210-spi' is not one of ['mscc,ocelot-spi', 'mscc,jaguar2-spi']
>>>>
>>>> spi@53000000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is not valid under any of the given schemas (Possible causes of the failure):
>>>> spi@53000000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is too long
>>>> spi@53000000: compatible:0: 'canaan,k210-spi' is not one of ['snps,dw-apb-ssi', 'snps,dwc-ssi-1.01a']
>>>> spi@53000000: compatible:0: 'canaan,k210-spi' is not one of ['mscc,ocelot-spi', 'mscc,jaguar2-spi']
>>
>> canaan,k210-spi is already added to the dw spi doc. Will check that again.
>> canaan,k210-ssi is missing though but since there is no quirk associated with
>> it, we should not need to mention it in the yaml.
>>
>>>>
>>>> spi@54000000: compatible: ['canaan,k210-ssi', 'snps,dwc-ssi-1.01a'] is not valid under any of the given schemas (Possible causes of the failure):
>>>> spi@54000000: compatible: ['canaan,k210-ssi', 'snps,dwc-ssi-1.01a'] is too long
>>>> spi@54000000: compatible:0: 'canaan,k210-ssi' is not one of ['snps,dw-apb-ssi', 'snps,dwc-ssi-1.01a']
>>>> spi@54000000: compatible:0: 'canaan,k210-ssi' is not one of ['mscc,ocelot-spi', 'mscc,jaguar2-spi']
>>>
>>> Ok, so the vast majority of these warnings are from unknown compatible
>>> strings. IMO this is not an issue, but the simple fix is to just add
>>> these strings to the yaml files.
>>
>> We could, but given that checkpatch spits out warnings for the ones already
>> added, we should probably start with fixing checkpatch :)
> 
> Well, it could also be that I was on the wrong branch, or had some old
> build artifacts.

Any branch based on 5.11 has the DW SPI fixes already. That was queued during
the last cycle.

> 
>>
>> And there are some nodes that have no drive in Linux, so no yaml. So a warning
>> will remain for these but I do not want to remove the nodes.
>>
>> Thansk for checking all this !
> 
> Just install dt-schema and you can check it too ;)

I have that installed already. Will rerun the check to reduce the amount of
warnings.

> 
> --Sean
> 
>>
>>
>>>
>>> --Sean
>>>
>>
>>
> 
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
