Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B788C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 01:56:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19D3C238E9
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 01:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19D3C238E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=Ur64ji0LlKCsh8IeKX2ZLc3ia0UX8lgzRYZ/0hzs8K8=; b=fsbyrV6KQahaeiOMmiQqk6C70
	BLVKNiL+BYx61ytEEQ8rFSLgQUAgdmkoQZpmB83bAtTPOZYIqHNAjfo9W8HfDGIIldp0CGEoRlL6S
	+77RZ+p9eSARf2G9scihcDyeQgWle7bDI1c5KCHgqMpWbUt70E5k0W1lCByxIUs/K1LWwLlGsQSQl
	XWnYeUs9uLbZILWZtKpivxpbZvx9poee1awkyUj6UjAHf4ElWHpsBFvII35MxJAnrqXWv3yAQmkod
	pdLb1LAJ02o5sbiYf+fsfn4He1xjRtcJyG+CR99hMXZUVup4D0JdK7mT2F5fLh6hXVL1c+GPe2ZTE
	sdjxxmntw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmSEu-0007bp-Kx; Tue, 08 Dec 2020 01:56:28 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmSEr-0007bL-Gr
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 01:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607392585; x=1638928585;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=Va+fTVUSu5JzARFQdBkS3uPEySaCA4Vk/nFIFUoaAt8=;
 b=DAk7o+aubdXw+MQfjQTIK1cS7Lnn+c4fPutrINPCHmZp005aj0r6lFeW
 1W0W0n9NOG3afT1OLQOz1iTDFgLQlzME4gaW3LJxZ0Ex6XZS581qwV1sU
 tfhQYuh/XcNBrBTIROZxduWZ30+zt9acwa+SBOEofDA5ZgMuh9V2FhHHu
 1GOs7vAJXp60NSi19ZR9sIYk0u/nY24+WRTK8aC9OPjrtsAo3OCPTssP0
 Rg0/pD5KVcd+dNq4ZPY6HloF7nd3hN1Gm/tiAOJHBELCJaGidqI5FJmcT
 TrUEB8236kSh/0KWJR2oqN3tLkF9Gqeo/puzifjc/jz5nszwAroN04WZb Q==;
IronPort-SDR: WkRcgZUCf/P9413+cHstesIo2k57JE05O4yqxGYKHrGW7TdlxAEQF37KgQ25KZN3WgmgCXjYFD
 rksRe/4kw7YFepOnk/dqZ6AKYLEdR/bz5DjnFhjF1j+vgZoNlt7bLQqJOTKOnUcKmYHdpeFwmM
 N2KGkwD8uDqlHRj/z/fZjrLv7n88skBqrg2JvQMrXyfRiUAdE5zqJOwiAY7ggT07OyJfTdXQ3t
 PHSW1bKLr21VxGLmJVRjFA16r4Iaf9a+nJFIea+tiERb6leW8LvwrSla4BB6WBBeGQIbkfJD/a
 h1o=
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; d="scan'208";a="264802027"
Received: from mail-bl2nam02lp2054.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.54])
 by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2020 09:56:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXZZGIS0XnUKYYT7/Zr9cqpVk7/vgo0t1xmbCkHaM3Lk0dR3ek7yI51YfO+rDBbYclegS/F+dBtIaQR/emkaM6qBnCoOzs4QsSlFEmARrXQnkMdKCEYEkG6nYTzxWSqpoWDwQ/95euciqQRB0eZACa2RNlm1kbKxQkwTHkSFmQ2zq88NSnNkgFgeHelukyYBCrW7JMPPGIQbmPiIt9gKL01YOC1KnKhJ41EFza2nyBtug3XnX0h3ZomBDbOrSnnF5dUTOQWOCFvk4X83KZ05rbs7wDiDII6i9BVeQwPy4oIgyy+4WJGMagPfeJsVhLdvov8pG3LAiURf4YBRYiJUzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRPOYIGc5dKhkqb8F7rhXM/TtEQJME450JqOhIlftnw=;
 b=WvD8qzAHQsFF7oCxnYjzbHxdyUHkzCBNuUHKDaxPvCWtaxD2KeONv6nErqAzk55j6I03AR7GgCwaqCwcjewkfb5PjPHLOzS/at8nc+HH8oLbn1JvZ2e39L5ijJZYlb8JxFAE4tytWEkK6G24L5S34vhHaOtdyoH+uXnF4Dy8tH0/CVyJ2VvFnXbGKor3YIFaY79YRTPYAbTTg7Aq98xeWOTKJNXjDaqwlVZLEnl9GLxcRt11JxQeLBAr/j8U5hvYPI2y2EWQdSlrvQcQzJkqMO0ZL2ntm9WUdCjnUxzCwFw67GG6ExkuT9KuHQq3rYlrdyDJ+aT76vH7cePP6Uyr3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRPOYIGc5dKhkqb8F7rhXM/TtEQJME450JqOhIlftnw=;
 b=wzMdQY46XNb1h7a3NJ3EJtTHKZ3qcvoQ4a88RgKCefEqJ/hokjeE+vDoyvmAh07qvQVYBRz+VstCRaG7qcJrEfOgk2e3MlLZFxOw4d4BFaHcsfkYvG2CW2ernloTwEXyH0cVAGuuAOfMzARICU2S6WBdKvUUM7JeqTpjPMRr25E=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB7127.namprd04.prod.outlook.com (2603:10b6:610:99::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Tue, 8 Dec
 2020 01:56:19 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 01:56:19 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Vitaly Wool <vitaly.wool@konsulko.com>, Atish Patra <Atish.Patra@wdc.com>
Subject: Re: [PATCH v3 3/5] RISC-V: Initial DTS for Microchip ICICLE board
Thread-Topic: [PATCH v3 3/5] RISC-V: Initial DTS for Microchip ICICLE board
Thread-Index: AQHWzLFoNCEiQFsA+0KpthzSK8ogLA==
Date: Tue, 8 Dec 2020 01:56:19 +0000
Message-ID: <CH2PR04MB6522D707AC3D7079259691CAE7CD0@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <CAM4kBBKVuyzb69jKWc_oWG8Y1u74Twv+67-8277N4rrOSXNo_A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: konsulko.com; dkim=none (message not signed)
 header.d=none;konsulko.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:1cf3:4043:c21d:e871]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4d4f9e5a-f0df-4ebe-6584-08d89b1c751e
x-ms-traffictypediagnostic: CH2PR04MB7127:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR04MB71276050F61EE551D1539C19E7CD0@CH2PR04MB7127.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SeUNApDFV5N7N/Io3uqDDQ2kTIieyjXMXPruiqNu5K3O6V8jFPdPTUq0xhFAyBA2ngr5wZ3FuRPxTJa1qE6jwD1Bxdmok4ABjbXKsMwQxXtalAI8IiOusThV3zYIw/RO8C/p973SIsBE4PTh/6XLvJXw5Ov6Yumr13ECkwsjHEva6m3KlVnzgT7Cz7VR5B1LQBFtWw39jvtTkK4xnaxajftOd/y3e5EYDAu+B1H94NF6e+EWoXL+amAKlTXdla3wkSLj/hXLMR/yHzVqwVynESBMFJADlr2iQBBq8W0nxW71I2BlaPGJbtYftFwBXKZMnbqx1vHgyuGiw/oPrf3EHtn6XrIGknWW4UjVZCkOBReoaWkBpZAw2cMTEmPNHllOZNvLj4ZX77Y0cST+2/X0zg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(9686003)(83380400001)(5660300002)(478600001)(71200400001)(52536014)(66476007)(76116006)(66946007)(66446008)(966005)(7696005)(33656002)(91956017)(4326008)(6506007)(86362001)(55016002)(8676002)(64756008)(66556008)(110136005)(186003)(316002)(8936002)(6636002)(2906002)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?/CKAbIZfpyWXXqlHw9RCKxQ4qfNZ5kJDrTd5A/daRPn4/JDv0oGUI15jWaje?=
 =?us-ascii?Q?suZZt0vyg7zfdBG5xDX3JOu5OgHLUt07xed3sphll7GZgHHfdZVV6A/k++O5?=
 =?us-ascii?Q?II5+ZyZwYO7qowzagUtngSdOdKLB08hVlTcHDCGzFYFk/vGHEEiuuqKtvjw/?=
 =?us-ascii?Q?WdW24kC8xj/h21Zi6Lz2dp1MTzjRVPlM/sJAJ4tjr+QZnr+y3sDYF5uJeJzL?=
 =?us-ascii?Q?BQRFyoUTFKtNDk8Uym6WjQNRHNYWjU+71QdFsptATyckqTR6GsqYtW4IdAmG?=
 =?us-ascii?Q?pOs7qTxWtj+XiHddOUf4K+/NP/srPAdY45+Zu6RXJFU1FtJbN4uEIPx02nfR?=
 =?us-ascii?Q?RgMsvJ3K0oN02fdJ6D01Z5W2gqufvgFRw/VixK7X6yOuGyiFGyOok2wXwsRD?=
 =?us-ascii?Q?CHJoksZPJml2Z1KANRym12br7hw9RH1EnnxFGqGSK1pLYOO96Ab/9aJjHtpo?=
 =?us-ascii?Q?ZreV339DoPkdQAI5QqRlgE7QOWu8sNCs66NpT6Eb6DSKX5roIBkiQuxx/Agx?=
 =?us-ascii?Q?/VDXsh0wWdRB0ut8UpZgH1hkUW49UPUKDQh3RDaK1B62lVc5xIFVxtmdULdC?=
 =?us-ascii?Q?Ux6hcJolyJiitfmhrRutlR34CZOjBeJ+AnDpNDclTyOxgk0SqEIzTae+4Xxq?=
 =?us-ascii?Q?Svy4ckSJj1fN+7YG0S5v6QKllul47lr4+shbQG3lVcknhTJq/1QUvMa1BhR7?=
 =?us-ascii?Q?gOLupEM05peKfr7DKudaDyKBxHl/4qwmLQx35LTVlnOEFj87VL3mQ4NLe/L8?=
 =?us-ascii?Q?guFhP6cEbbQU38MzDpDVr0syKqYFvLCN8Tkb3Zu6mN2F7CsfEn+qTG0EkjjG?=
 =?us-ascii?Q?Vz2NefaozzXmZsjdHxZ1m42lUeTQDg8oiDAAKgZnOQXFvskIRAN1k5GN2aE/?=
 =?us-ascii?Q?+MV7iarcduWWMkAiF1AVOjJKh28VApEjFrVkIMuTqNa4ap8N95801Jl04THv?=
 =?us-ascii?Q?4EK8k3hQ+Dl0WAo3LgDdOrq2N7CT/QNLvbLZScBoGYuNiyISQ4SlSAfR7QA7?=
 =?us-ascii?Q?9v/aWKVl2ZcDbQTSdjSrxv90VfKg9xeU0G1F0aSLaG3HpL/x1Joc2CZvpJ2u?=
 =?us-ascii?Q?DnWR1Fh0?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4f9e5a-f0df-4ebe-6584-08d89b1c751e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2020 01:56:19.8145 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ogba2Ni6EfBFgjZ8izdbhsABsklIv9fHmkRyQdCj9JVOID86XfAWpRcbgdThxI5X0F8vUqZAsLNpcgX7wLkV7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB7127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_205625_876439_3D96452F 
X-CRM114-Status: GOOD (  16.13  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/12/08 0:55, Vitaly Wool wrote:
> Hi Atish,
> 
>> Add initial DTS for Microchip ICICLE board having only
>> essential devices (clocks, sdhci, ethernet, serial, etc).
>> The device tree is based on the U-Boot patch.
>>
>> https://patchwork.ozlabs.org/project/uboot/patch/20201110103414.10142-6-> padmarao.begari@microchip.com/
>>
>> Signed-off-by: Atish Patra <atish.patra at wdc.com>
>> ---
>>  arch/riscv/boot/dts/Makefile                  |   1 +
>>  arch/riscv/boot/dts/microchip/Makefile        |   2 +
>>  .../microchip/microchip-mpfs-icicle-kit.dts   |  72 ++++
>>  .../boot/dts/microchip/microchip-mpfs.dtsi    | 331 ++++++++++++++++++
> 
> would it be possible to rename dts file to
> microchip_mpfs_icicle_kit.dts? Dashes will not work with
> SOC_BUILTIN_DTB_DECLARE(), and I do want to use built-in device tree
> for XIP on Icicle. Thanks! :)

Please see the patch series I sent for the Canaan Kendryte K210 support: I want
to retire SOC_BUILTIN_DTB_DECLARE() as it is broken: the arch, vendor and imp ID
given by an SOC does not necessarily reflect the fact that the SoC is used on
different boards that need different DT. That makes differentiation of the
builtin DT for different boards using multiple SOC_BUILTIN_DTB_DECLARE()
declaration impossible. In short, SOC_BUILTIN_DTB_DECLARE() does not work.

http://lists.infradead.org/pipermail/linux-riscv/2020-December/003497.html

In the K210 series, I have this patch:

http://lists.infradead.org/pipermail/linux-riscv/2020-December/003498.html

that replaces SOC_BUILTIN_DTB_DECLARE() with a more traditional
BUILTIN_DTB_SOURCE config option. That is a lot more simple and a lot more solid.

> 
> Best regards,
>    Vitaly
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
