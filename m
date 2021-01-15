Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6E9C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 01:04:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E1D623A9D
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 01:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E1D623A9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=KWd1wprfziHqBzyOpNr2bFbVb3q4w5D2YynJix0eFM8=; b=j02PmVHUjcAhFQDB9Q2OY30lI
	3X13EA5bmIb1ZGNJi6s89PyUXRUXgUVd4BOluNWg3Wl3TvRG6G2oLuho1tKmQ1zmGhrZLUPrQ5ecT
	IWpfZ1RyXzucoqh860jZuun2vLxdkKpmAcdiZi5Np0C7RBjpfQIMpJc2JIlh+ljbIiF8BhL3BYWTE
	uTTaJF292YieNrihEe+VrRXiCuLakIp33aR9Jawf2hIByUBGVQx+EBP4cx9JGusqh4fShospG5a+E
	blWCkQ8z8WIiYpGbXoK9L2rIknhoHbZCTT7eb5r7z/g6zzMYtLOH6y+yxV0iVMnczGHU2DtjTn+r3
	Is68EqiVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0DWv-0002o7-1J; Fri, 15 Jan 2021 01:03:57 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0DWr-0002ng-Gz
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 01:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610672987; x=1642208987;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=Bt0X7kOLrasMeTiYN4U/DzJyYmW0bdK2S6oGdH1QoRI=;
 b=OpeVK0Rtbz/gS7apLxJRaBqSDJJ6oGxt/OkvpELY+c/S+fKHawUZO1uu
 hQGuTNbsY4z1dRqmfpjTwfgTRXWQufs2dUrmI4aJuCuTQjigY91bV7PKN
 dUUwk0jHKI53hHC1rNn5+lYhaEaCsfvMvblE4TQb818K+mdY4AydZLGCE
 Ub4XEleaCWOMTuEDk0E829rtz7+F+0dcQPJC3FtuKuQGBU/YgvARsLqs3
 yQAo3vjoK+R9yYgZXWUBOAEKQ485tDtXfAiMksa8crrUhT/twzBg1/7B6
 MlF6s0W7g4BN/ITH/1v9WGN2M5VwMQZsPGduViuddYe8TM6e1HqckiZYE g==;
IronPort-SDR: +ks8r1ZkdojDAmWfvK0D5Y1PsVn4eG3aZs/FdNY8xDdTBw2aPjjZQ3yHubgDCrtc1VAAMPBrfo
 rB2KK1iLeS/M6DVza7/HXhCmJuxaS9fidMlTYS+dYYK36OUjEh2Ty0Q250cYlIrlR0319avHCg
 QJUc2ahk8NfET0rEkZ5S0m6EOn5Q4YKosyddZka+7X4ozCM4y9QHLl3nKosFZdU9bji5x4jdWK
 4e3JlJ1D17Ze0U//6/9wL4VQR3Gt/hNboRjj4Dyjns6PCSdr1WNO014jGMtttUYEMyvPKlU82A
 ml4=
X-IronPort-AV: E=Sophos;i="5.79,347,1602518400"; d="scan'208";a="261390742"
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2021 09:09:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=me8GtCSXK7LSPE259xY4ARvD2Ih28TQLb99sRekPHfR6M2zbaxm5JGf/cVWxJ2RdmvnZKgEvylynvvsBdWnXFtzoJnSmWwOGnfO5uMivC0eDwAnRV6HouYqxUNYnCxEhcuZ6gqmdK+KkZBfqr2M3HqvBABfEbsMERz2mreA8oim3NS4W9Nzs8IU12NmDgtIOTXTT6DRv5wbT/V0v3TCyL0J+KW7MksNuHHLWZIfrDmhHH0acSh1FJLCOTGv2ejCVbclYS9WCLUMiIjPJIW21EJF4KmFfPSLKJhHMnkg290mk7iTV8GTKXofQCLttJ1SowC6UasmmCyRnUUmHRujXJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0h8SaOoxX/ZM8ENLtkVsGoXPTzIAQA+ljyg70zDV1Ec=;
 b=G6FYy5OD2iqBKD0b3NdQZq0Gmgsk+VadsZSczbeNv8BjlSPoYupncvcTNnvBEZaje2VpPbji2WnC7UC+PEAWbmcRedLMzQfWnaxvCWAvQ+Mn7jlQf+69oWcKE53o3X4E2gC7Cg4Kll5TxjWp/+AblWYpZJmTgwJKgHUpT5tdBIs30TZMDDFTqQdP3V1Kxio9qE/zvJdOkKNSZaWMxVQcMV4yaNDD/5goIYTfaA67++33LgQpIRiboSl67rBJ4v0Gwfbdd906+3bzNaiavEDk3VvQYISC0UDxhq6aMNv8o1rYMZChcEyF+Nr6YSYgK2zrJ5cPsIOgET8tIPRRKfjd3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0h8SaOoxX/ZM8ENLtkVsGoXPTzIAQA+ljyg70zDV1Ec=;
 b=TcFqtatpf7Zp1+qC8VqPzLfBiaUC31IkaJRO6vtM6nij7OcbVStnBVcUdCTBaD84mmKaws3U/gimFwy/pm9KbUo30Fg1ujlDgM+FL3OZAfIC3u4oYudi3gUb6qkyrVT7Lu++sgbbuEW/Cw4qE4UdtbPkWcGnK3az8GsQ+ttx9uY=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4739.namprd04.prod.outlook.com (2603:10b6:208:48::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Fri, 15 Jan
 2021 01:03:47 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%8]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 01:03:47 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Sean Anderson <seanga2@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v11 03/10] riscv: Update Canaan Kendryte K210 device tree
Thread-Topic: [PATCH v11 03/10] riscv: Update Canaan Kendryte K210 device tree
Thread-Index: AQHW6H4ffzJIz+L53U2eOGwbaV2KdQ==
Date: Fri, 15 Jan 2021 01:03:47 +0000
Message-ID: <BL0PR04MB6514593E3235BBFE84D74BB2E7A70@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <mhng-b30be63a-5293-4d18-85cb-fb2c62b3188e@palmerdabbelt-glaptop>
 <9d32abd1-ffb4-a887-a40d-fc173a371d23@gmail.com>
 <484787f2-558c-1eb4-7ab0-23f0ac5e6cd5@gmail.com>
 <fbff79af-deb7-e400-4e1b-cc1ef814451d@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8c78:be0:63f5:4b05]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: eb626748-2e0d-4934-bd82-08d8b8f16a14
x-ms-traffictypediagnostic: BL0PR04MB4739:
x-microsoft-antispam-prvs: <BL0PR04MB4739C0C7F4547E9AAF13506AE7A70@BL0PR04MB4739.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BkZpYRTILDoTSZ2BNyHFwr1BEZ7iPes+ROzpc9gW63nmRfhjW9jgcZGwB1n5QMnRHbWp9GFxED9pDoWfnKgagrH7IUltFFEs9DlEYkVf7CUWnX23IctRarxSigqAyGgp9rPyVwaC60W9feoshVwC2DTk4Z4D0Mt+ewvbhDfFv7uaN/TqDpm9nsxaj3k3ZB6r+eO7Tc1o1m1I0ttLu02HB/AR+pXD9pvgF4OxhlG9qt9jTOAd/jKrR5KtnbyaLj3hBX2+8H7bk4kbNhuFGyBcBgNB8wd6sgNIQ88wEz97wiobGkxW0z13EQg15Ohs3IoDP8qc4hvwXahDM/FzZ3igyAdvT1ZMQjW8W806Z2oxkdvh6e7OT/TnT9Wl6ffooUjpVfO4UUUCIosArX5sA/Bf1w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(54906003)(33656002)(316002)(83380400001)(478600001)(110136005)(9686003)(76116006)(55016002)(66946007)(8676002)(8936002)(186003)(15650500001)(66446008)(86362001)(4326008)(30864003)(5660300002)(71200400001)(52536014)(2906002)(7696005)(6506007)(66556008)(66476007)(53546011)(64756008)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?fYngRY5OUfeR8+Qdy3aZYRG/tLdVtFuzq3LM7pMuFfeJ6VCQtBAGOmHpREw9?=
 =?us-ascii?Q?JPwObiDrpk31pVVRkHP4GmWIo1/QkN6MTNLrS35PWape8zu6J8rlfPBYRg/7?=
 =?us-ascii?Q?tV16so3RsJbTc2XISn7t5MqwpKlfxVkFnTfzwu8ZAnVy1kP0sSEwFYBA9wxH?=
 =?us-ascii?Q?gA1/6WxfbsbJAMgN/aFpv0eBL5uZ0WAR62gbu2mkX3G8peJC55/rKyHvzeen?=
 =?us-ascii?Q?mTQ2Ksg1Qp7KzWfh8rbMkH/opOmmT549VNO7B9w/6ftH4Pb8TrOlmvYc8cOm?=
 =?us-ascii?Q?60lccLhUs3AovFgF//87xvkre6zpOvOOT5Oj3loojpm6+VxsxpyoEl8EJynD?=
 =?us-ascii?Q?EUrgx/q6cu3Wpk956yCLOstPa0q/kjAIxlZXPNfcarA9Fs1wTlzRNVperoLC?=
 =?us-ascii?Q?NeIEb/8CSME8dfN9cWTauPi6UgHWO9dX8fKIjOgI4XK2RLFYFa00RNKiiVOt?=
 =?us-ascii?Q?rQWc2FRLcBa8+yDGXahxomf299UjMqkGLYVsGQsOMfko9PZgfcwAv8oLzYkg?=
 =?us-ascii?Q?X9mmfmncaAHMzS/VkJtlO3AWiSIf0mHUbZZrGkDq5ArCBnML3BzM72oQC75W?=
 =?us-ascii?Q?kYCteu1Hh1pc2abgy28YTMtKdOCnVQT0K2wHigsuUTUnTP0M/nQTqowFuQbA?=
 =?us-ascii?Q?TbyBxfVlupUQ6beTlsFjIaQ1WJKu0wvBeaWUeX0a/MLP/uR4Btq8VHhJqsYF?=
 =?us-ascii?Q?WJdlQf2QfwggCsBmHKK3phf7uyxKg7Euimcba/6h3QJMi5Pzju+t8PG4Iz+M?=
 =?us-ascii?Q?xMnRbcMoOsoREOce7IhbRO8LyM2SFRB8kG6CC//eCNlsA+3rUZ0orpqfNr4Y?=
 =?us-ascii?Q?dm519XRN1ME5lJ5fhazI13cuGcUQimPu8LAvdoN+dEhEu19R023hua10fdU1?=
 =?us-ascii?Q?I3fX8iLfkNM7B1Y9rsYvH2k6g3i+SFcICZ+t8FZffBfnIVS+2mx8xdtGeoc4?=
 =?us-ascii?Q?QkdyM6FSAsAbwbIG4r6JI3+Nhnvbd/jFd0pMlr5bvpmFxoxOHG4+XXomtVM2?=
 =?us-ascii?Q?1n3UYqFWCkmknl73lSMdAPpkxHGJYwi9M0CNqjWzn9BHFNQpNrNG9qfrAftQ?=
 =?us-ascii?Q?0e7rrxlT?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb626748-2e0d-4934-bd82-08d8b8f16a14
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 01:03:47.8073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iqkxb5Zkm3hh2TTkiU46yLimYY+kj/fL+nRjnR9siSvtZsULqNAGKK8OraF+dCoY6I3ANN+wB6slaoL2yUXj7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4739
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_200353_960383_67F08EF1 
X-CRM114-Status: GOOD (  22.71  )
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

On 2021/01/15 9:35, Sean Anderson wrote:
> On 1/14/21 7:06 PM, Sean Anderson wrote:
>>
>> On 1/14/21 7:01 PM, Sean Anderson wrote:
>>>
>>> On 1/14/21 6:32 PM, Palmer Dabbelt wrote:
>>>> On Mon, 11 Jan 2021 16:58:41 PST (-0800), Damien Le Moal wrote:
>>>>> Update the Canaan Kendryte K210 base device tree k210.dtsi to define
>>>>> all peripherals of the SoC, their clocks and reset lines. The device
>>>>> tree file k210.dts is renamed to k210_generic.dts and becomes the
>>>>> default value selection of the SOC_CANAAN_K210_DTB_BUILTIN_SOURCE
>>>>> configuration option. No device beside the serial console is defined by
>>>>> this device tree. This makes this generic device tree suitable for use
>>>>> with a builtin initramfs with all known K210 based boards.
>>>>>
>>>>> These changes result in the K210_CLK_ACLK clock ID to be unused and
>>>>> removed from the dt-bindings k210-clk.h header file.
>>>>>
>>>>> Most updates to the k210.dtsi file come from Sean Anderson's work on
>>>>> U-Boot support for the K210.
>>>>>
>>>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>>>>> Reviewed-by: Anup Patel <anup@brainfault.org>
>>>>> ---
>>>>>  arch/riscv/Kconfig.socs                     |   2 +-
>>>>>  arch/riscv/boot/dts/canaan/k210.dts         |  23 -
>>>>>  arch/riscv/boot/dts/canaan/k210.dtsi        | 551 +++++++++++++++++++-
>>>>>  arch/riscv/boot/dts/canaan/k210_generic.dts |  46 ++
>>>>>  include/dt-bindings/clock/k210-clk.h        |   1 -
>>>>>  5 files changed, 573 insertions(+), 50 deletions(-)
>>>>>  delete mode 100644 arch/riscv/boot/dts/canaan/k210.dts
>>>>>  create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts
>>>>
>>>> [Snipping this to the relevant bits, in case you missed it before.]
>>>>
>>>>> @@ -81,40 +107,515 @@ in0: oscillator {
>>>>>      soc {
>>>>>          #address-cells = <1>;
>>>>>          #size-cells = <1>;
>>>>> -        compatible = "kendryte,k210-soc", "simple-bus";
>>>>> +        compatible = "canaan,k210-soc", "simple-bus";
>>>>>          ranges;
>>>>>          interrupt-parent = <&plic0>;
>>>>>
>>>>> -        sysctl: sysctl@50440000 {
>>>>> -            compatible = "kendryte,k210-sysctl", "simple-mfd";
>>>>> -            reg = <0x50440000 0x1000>;
>>>>> -            #clock-cells = <1>;
>>>>> +        debug0: debug@0 {
>>>>> +            compatible = "canaan,k210-debug", "riscv,debug";
>>>>
>>>> I'm still getting lots of warnings about undocumented DT compatible strings
>>>> from checpatch.  Some of them might be in flight, but I don't see many of them
>>>> (including both of these debug ones) having been defined anywhere.  We went
>>>> through a whole process to sort out the SiFive DT naming conventions, I don't
>>>> want to just circumvent that for the Canaan stuff by merging it as-is.
>>>
>>> As far as I'm aware, it's recommended practice to add device-specific compatible
>>>
>>
>> Here it's because "riscv,debug" doesn't exist. This is the "debug"
>> device as described in the debug spec. AFAIK Linux never needs to
>> configure this device. It could probably be removed.
>>
>> I am going to try and go through the list of nonexistant compatibles and
>> see if there are any other devices like this (nothing else like it in
>> Linux).
>>
>> --Sean
> 
> Ok, here is the (abbreviated) output:
> 
> 
>> cpu@0: compatible: ['canaan,k210', 'sifive,rocket0', 'riscv'] is not valid under any of the given schemas (Possible causes of the failure):
>> cpu@0: compatible: ['canaan,k210', 'sifive,rocket0', 'riscv'] is too long
>> cpu@0: compatible:0: 'canaan,k210' is not one of ['sifive,rocket0', 'sifive,bullet0', 'sifive,e5', 'sifive,e7', 'sifive,e51', 'sifive,e71', 'sifive,u54-mc', 'sifive,u74-mc', 'sifive,u54', 'sifive,u74', 'sifive,u5', 'sifive,u7']
> 
> This is a device-specific compatible string as recommended by the
> current DT docs.
> 
>> cpu@0: mmu-type:0: 'none' is not one of ['riscv,sv32', 'riscv,sv39', 'riscv,sv48']
> 
> This should be added (though it is technically incorrect).

will do.

> 
> (perhaps a version number should be added like 'riscv,sv39-1.10')
> 
>> cpu@0: riscv,isa:0: 'rv64imafdgc' is not one of ['rv64imac', 'rv64imafdc']
> 
> Should probably be fixed, as the g is redundant. However, this is
> probably not a good warning going forward, as more exotic combinations
> of extensions are implemented.

I had removed the "g" here. I guess I messed up a rebase and it is back. Will
fix that.

> 
>> cpu@1: compatible: ['canaan,k210', 'sifive,rocket0', 'riscv'] is not valid under any of the given schemas (Possible causes of the failure):
>> cpu@1: compatible: ['canaan,k210', 'sifive,rocket0', 'riscv'] is too long
>> cpu@1: compatible:0: 'canaan,k210' is not one of ['sifive,rocket0', 'sifive,bullet0', 'sifive,e5', 'sifive,e7', 'sifive,e51', 'sifive,e71', 'sifive,u54-mc', 'sifive,u74-mc', 'sifive,u54', 'sifive,u74', 'sifive,u5', 'sifive,u7']
>>
>> cpu@1: mmu-type:0: 'none' is not one of ['riscv,sv32', 'riscv,sv39', 'riscv,sv48']
>> cpu@1: riscv,isa:0: 'rv64imafdgc' is not one of ['rv64imac', 'rv64imafdc']
> 
> see above
> 
>> serial@38000000: compatible:0: 'canaan,k210-uarths' is not one of ['sifive,fu540-c000-uart', 'sifive,fu740-c000-uart']
> 
> device-specific, and intentional

We can add this one to the sifive serial yaml.

> 
>> gpio-controller@38001000: compatible:0: 'canaan,k210-gpiohs' is not one of ['sifive,fu540-c000-gpio', 'sifive,fu740-c000-gpio']
> 
> ditto
> 
>> gpio-controller@38001000: 'ngpios' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> known shortcoming with this dt property, but alas

Yes. The driver was fixed. But the yaml is behind I guess. Will send a patch for
this one.

> 
>> gpio-controller@50200000: $nodename:0: 'gpio-controller@50200000' does not match '^gpio@[0-9a-f]+$'
> 
> This matches devicetree/bindings/gpio/snps,dw-apb-gpio.yaml

This may be similar to the ngpios problem: the core expect something while the
yaml defines something older... Will have a look.

> 
>> gpio-controller@50200000: compatible: ['canaan,k210-gpio', 'snps,dw-apb-gpio'] is too long
>> gpio-controller@50200000: compatible: Additional items are not allowed ('snps,dw-apb-gpio' was unexpected)

I wonder if we can just remove 'canaan,k210-gpio' here ?

>> gpio-controller@50200000: 'gpio1@0' does not match any of the regexes: '^gpio-(port|controller)@[0-9a-f]+$', 'pinctrl-[0-9]+'

Not sure what to do about this one.

>> serial@50210000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is not valid under any of the given schemas (Possible causes of the failure):
>> serial@50210000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is too long
>> serial@50210000: compatible:0: 'canaan,k210-uart' is not one of ['renesas,r9a06g032-uart', 'renesas,r9a06g033-uart']
>> serial@50210000: compatible:0: 'canaan,k210-uart' is not one of ['rockchip,px30-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rv1108-uart']
>> serial@50210000: compatible:0: 'canaan,k210-uart' is not one of ['brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart']
>>
>> serial@50220000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is not valid under any of the given schemas (Possible causes of the failure):
>> serial@50220000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is too long
>> serial@50220000: compatible:0: 'canaan,k210-uart' is not one of ['renesas,r9a06g032-uart', 'renesas,r9a06g033-uart']
>> serial@50220000: compatible:0: 'canaan,k210-uart' is not one of ['rockchip,px30-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rv1108-uart']
>> serial@50220000: compatible:0: 'canaan,k210-uart' is not one of ['brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart']
>>
>> serial@50230000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is not valid under any of the given schemas (Possible causes of the failure):
>> serial@50230000: compatible: ['canaan,k210-uart', 'snps,dw-apb-uart'] is too long
>> serial@50230000: compatible:0: 'canaan,k210-uart' is not one of ['renesas,r9a06g032-uart', 'renesas,r9a06g033-uart']
>> serial@50230000: compatible:0: 'canaan,k210-uart' is not one of ['rockchip,px30-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rv1108-uart']
>> serial@50230000: compatible:0: 'canaan,k210-uart' is not one of ['brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart']
> 
> More device-specific strings.
> 
>> spi@50240000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is not valid under any of the given schemas (Possible causes of the failure):
>> spi@50240000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is too long
>> spi@50240000: compatible:0: 'canaan,k210-spi' is not one of ['snps,dw-apb-ssi', 'snps,dwc-ssi-1.01a']
>> spi@50240000: compatible:0: 'canaan,k210-spi' is not one of ['mscc,ocelot-spi', 'mscc,jaguar2-spi']
> 
> ditto

Actually a false warning from checkpatch. canaan,k210-spi was already added to
the DW spi yaml.

> 
>> i2c@50280000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is not valid under any of the given schemas (Possible causes of the failure):
>> i2c@50280000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is too long
>>
>> i2c@50290000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is not valid under any of the given schemas (Possible causes of the failure):
>> i2c@50290000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is too long
>>
>> i2c@502A0000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is not valid under any of the given schemas (Possible causes of the failure):
>> i2c@502A0000: compatible: ['canaan,k210-i2c', 'snps,designware-i2c'] is too long
> 
> ditto
> 
>> timer@502D0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is not valid under any of the given schemas (Possible causes of the failure):
>> timer@502D0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is too long
>> timer@502D0000: compatible:0: 'canaan,k210-timer' is not one of ['snps,dw-apb-timer-sp', 'snps,dw-apb-timer-osc']
>>
>> timer@502D0000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> `resets` is the correct name for this property.
> 
>> timer@502E0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is not valid under any of the given schemas (Possible causes of the failure):
>> timer@502E0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is too long
>> timer@502E0000: compatible:0: 'canaan,k210-timer' is not one of ['snps,dw-apb-timer-sp', 'snps,dw-apb-timer-osc']
> 
> More device-specific.
> 
>> timer@502E0000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
>> timer@502F0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is not valid under any of the given schemas (Possible causes of the failure):
>> timer@502F0000: compatible: ['canaan,k210-timer', 'snps,dw-apb-timer'] is too long
>> timer@502F0000: compatible:0: 'canaan,k210-timer' is not one of ['snps,dw-apb-timer-sp', 'snps,dw-apb-timer-osc']
>>
>> timer@502F0000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
>> watchdog@50400000: compatible: ['canaan,k210-wdt', 'snps,dw-wdt'] is not valid under any of the given schemas (Possible causes of the failure):
>> watchdog@50400000: compatible: ['canaan,k210-wdt', 'snps,dw-wdt'] is too long
>> watchdog@50400000: compatible:0: 'canaan,k210-wdt' is not one of ['rockchip,rk3066-wdt', 'rockchip,rk3188-wdt', 'rockchip,rk3288-wdt', 'rockchip,rk3368-wdt']
>>
>> watchdog@50410000: compatible: ['canaan,k210-wdt', 'snps,dw-wdt'] is not valid under any of the given schemas (Possible causes of the failure):
>> watchdog@50410000: compatible: ['canaan,k210-wdt', 'snps,dw-wdt'] is too long
>> watchdog@50410000: compatible:0: 'canaan,k210-wdt' is not one of ['rockchip,rk3066-wdt', 'rockchip,rk3188-wdt', 'rockchip,rk3288-wdt', 'rockchip,rk3368-wdt']
>>
>> spi@52000000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is not valid under any of the given schemas (Possible causes of the failure):
>> spi@52000000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is too long
>> spi@52000000: compatible:0: 'canaan,k210-spi' is not one of ['snps,dw-apb-ssi', 'snps,dwc-ssi-1.01a']
>> spi@52000000: compatible:0: 'canaan,k210-spi' is not one of ['mscc,ocelot-spi', 'mscc,jaguar2-spi']
>>
>> spi@53000000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is not valid under any of the given schemas (Possible causes of the failure):
>> spi@53000000: compatible: ['canaan,k210-spi', 'snps,dw-apb-ssi-4.01', 'snps,dw-apb-ssi'] is too long
>> spi@53000000: compatible:0: 'canaan,k210-spi' is not one of ['snps,dw-apb-ssi', 'snps,dwc-ssi-1.01a']
>> spi@53000000: compatible:0: 'canaan,k210-spi' is not one of ['mscc,ocelot-spi', 'mscc,jaguar2-spi']

canaan,k210-spi is already added to the dw spi doc. Will check that again.
canaan,k210-ssi is missing though but since there is no quirk associated with
it, we should not need to mention it in the yaml.

>>
>> spi@54000000: compatible: ['canaan,k210-ssi', 'snps,dwc-ssi-1.01a'] is not valid under any of the given schemas (Possible causes of the failure):
>> spi@54000000: compatible: ['canaan,k210-ssi', 'snps,dwc-ssi-1.01a'] is too long
>> spi@54000000: compatible:0: 'canaan,k210-ssi' is not one of ['snps,dw-apb-ssi', 'snps,dwc-ssi-1.01a']
>> spi@54000000: compatible:0: 'canaan,k210-ssi' is not one of ['mscc,ocelot-spi', 'mscc,jaguar2-spi']
> 
> Ok, so the vast majority of these warnings are from unknown compatible
> strings. IMO this is not an issue, but the simple fix is to just add
> these strings to the yaml files.

We could, but given that checkpatch spits out warnings for the ones already
added, we should probably start with fixing checkpatch :)

And there are some nodes that have no drive in Linux, so no yaml. So a warning
will remain for these but I do not want to remove the nodes.

Thansk for checking all this !


> 
> --Sean
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
