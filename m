Return-Path: <SRS0=+l7Y=HK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F9EC433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 22:55:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A76064DDB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 22:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A76064DDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=xe5xST9AJwD66gPZkaCouMAZi3x/mwKkahAlSxA8KjI=; b=nf0boFGvmxW/tkP/XrCE4lKtd
	j+MQSZw+a1DmA0h80yCr5k4yz5OxSsQkuvMOYANmGoQ0CqRJaWd03c56HXW1tV226+eOtkSBT8LXg
	iSWwSHKYc7ZK/O9fd3I0M1V+FVHDxUeb9jGAdKhPErTqHDgb31Ru0fgmkbN7VCIkP3iCIFwWVP8jQ
	itnWfHfZFzDArUwOW/DXTYI5LW8xRLM3/GOHyAjJi1UzLsp6/eh29AxCLqt0Pmym6oIpTrneIiplP
	K8YkaVLKPYjGQlsjXn3W/H/VA5glCW0TPujQ28JlwEGrW4kT9/k9O37qxLsBKJKhOj3896aLuPVn2
	7VHjjIEQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9FRV-0008Df-F8; Mon, 08 Feb 2021 22:55:41 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9FRS-0008D8-Ok
 for linux-riscv@lists.infradead.org; Mon, 08 Feb 2021 22:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612825892; x=1644361892;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=ZbO5tX4OqWlF2QnuoUZu7oEX5qW1dIPxHLp+WTIJHV0=;
 b=kg0AbYOwil2H3p1Y8e5kRZMokf0vFG3WfkxOog7i0p8OFNaYTbN8LL9R
 9xh72zcIyNZDZNK45UxKmZzQ6VUKBmXn9Kz0pug8Iz9pdiKmMf84jozbe
 OcAa52sNYdnZzTcmkSuUhozP4pqqngAUi1K6zcCzQH9Un7uHMRkMYPeSK
 nbViyVRn5vRBojyQkCNT1rw4vzBE19Rqee2/DpkYlVZF+qR7qOHcXrLtC
 CBULDNMJtifeSQg3XMva+v+aVIVS17+gN1zlSluW024O7bc3AQj6JgNw9
 9T8/EZa49dyru0yQ3EqVrJxgweHVw/VpPLsjPbrlfvfedZ/vFSBI31bAp g==;
IronPort-SDR: H7ChgdvHd5URvpKFACIYerOCC3eWPUvIt33d0GJ6YGktPuf4TC3MZ4thUGvWtRatPlo5fv85/d
 e50hTCtAyEvnidm9kclbdbqLQYPvl76aY4dTU66vkYyHgIbhkJxKC3RTKkR3x750/KPNjAaEkz
 RDQEE3gngooU2iPwcKAE7kZNs4l5UmQMlhZwxDTTRuW0WT+mtzynQvJ+Hu3XE0OMcZ/jD6meHz
 pmmp1jQOiEZ8bPHUVNlwuvFMvNzC51kF5aoQjnJK2M3+AmZ8TdqaIHiBd4jc+w8YFHj/eD+esh
 EQQ=
X-IronPort-AV: E=Sophos;i="5.81,163,1610380800"; d="scan'208";a="263591766"
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2021 07:11:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P++N5hUGhRNhw0lg0tHMov+LRttGV/OX6Y5nU503+RkIwQa6G6+CIOqSv7ft2qDMIrGAtavo5iCWK/dxbNwzYfH1uBuWBg3YTZDzL9lYFLtlw/v9Wvwq8jsPnmkaGmLgSmkGYQpDC+rtboN/v+5Uf3cfMBzJ5Mp8fh0HLpANBuY7g2fAArSBvH7q6hbWoUD7hdIUC6gexwM0EjgwLnJM0u4GX196/m8+yxr9zUctqSNl/np0B5SCcdqEx6M2kCwu5xtytiqiy308ruZ7dPeaGlF1a2xGiLc2ZpJUkUlPfajovK1xwpxLRV3ZJ8MVbEAaT3E8zQdCIu0QITLIuoI/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/yGedMC+RcXDHnKcDG1yzWNbST/rSrHhkJ4U18YymjM=;
 b=Q0TaXsoZXXSQIg4nOHHRhn9j0KUHDNOJaM/OyNgT0cFbHuH/fqbuu02GgxVfPvGK3AN9ovwAEwE2jVZ7SJTYFeWYLMNY8ZmIdW8wWzjTD4ACWNp+i5vlNbVYmb7HpGMWoUCJwS+KMT5ww3fUqdlK/mtiCk4Ne7ID833QBj34nmi5EWQRqmJREp5MGrGqXBsOi8L/x972X9HkuoicZqXA8dS6C90Hr+cUmDG5niohgGq7HXm5VHIdOEPt/82+9PCsGK9PM6hYgWRQs3u2op6OohmYQqWRa8W/4BT+DMkeGAa8gfeloPRVNDWCGELLBoBzrtz8XknLQdathp4IBgZXRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/yGedMC+RcXDHnKcDG1yzWNbST/rSrHhkJ4U18YymjM=;
 b=vz6dXmSy/057LpzXJ3ltZBYEpLnAIHIos/fX4TT3gwWWOY3C041tAXRioAAVeGU+hTAeD1MLdeJNeqFBeIGbsRbioRav4CRDcUhFyihfJhiBC7Ef83mPONuQzbOvPjhAZG/03aOC3MlV2IpOEWieG8EngK4NX3V/mYfrC3OeqnY=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB7070.namprd04.prod.outlook.com (2603:10b6:208:1e1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Mon, 8 Feb
 2021 22:55:35 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%7]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 22:55:35 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Sean Anderson <seanga2@gmail.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v16 09/16] riscv: Update Canaan Kendryte K210 device tree
Thread-Topic: [PATCH v16 09/16] riscv: Update Canaan Kendryte K210 device tree
Thread-Index: AQHW+4xeGC09t/jMzkSSVnIpB80beA==
Date: Mon, 8 Feb 2021 22:55:35 +0000
Message-ID: <BL0PR04MB6514747C7AD8FA7E56D61CB9E78F9@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210205065827.577285-1-damien.lemoal@wdc.com>
 <20210205065827.577285-10-damien.lemoal@wdc.com>
 <20210205202505.GA3625674@robh.at.kernel.org>
 <aab05bea310fbdbac38990656647dd0fbf3c8323.camel@wdc.com>
 <CAL_JsqLbMbMx3TLf+CPG-MdimHTz2sdzgQdmmuQkLfnsTJQAvQ@mail.gmail.com>
 <a924468e-9d6e-d66f-403c-77d7e0422651@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:f420:fabe:ea5e:e152]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2fc2f796-2379-4e96-d53e-08d8cc84a5a1
x-ms-traffictypediagnostic: MN2PR04MB7070:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB70706C9CD10F821ED050D88CE78F9@MN2PR04MB7070.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UFdfUnNDAXpSIEDFGoLqRTguSRWTtWbW2lgKi138tu2lbGq5nvhZUYt5JCf7qYovLELa5sj9chP3zSu4JJT2V8znmCh5Uei44l2wFKI263Q2YJSPrz8m1+kwNAPST7qvHsHjLtwPP+O3+rgAQK0cCY4ErwlrOo7Dd7KdqLR7O/3lr6zNM/vM0TAIZ5Q39jJJtybbHESonihObiNoR2DFHGErg67eApBe95hYfHfY3eoCp1VkTKXFgqDChnKdN94GynD6mMrjWLbTLQhtT+o2H9BCJRHRB1sX1Kl1LFSUvK9o/U1ojtWUhgkeNahyC0lqODdrE4JPhNqyBFBTpdKmHU84P5PzG+/1rqKwW0ykKUTrOleJ3qNIl1lzTkfsIf/UStTU1JQrV12Q7OzilZcFrStT2ZRiUqsq2wAGjiudaTWlRbY+nG+huecswfC2kSxO+Axsv5pY2KQiZkpclCl8vxxACTR2DUPpohYYymyNND8AF7QyPoBVLekEuPeT2vgVTBsjJtSNnU1zkfs77eXLgQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(2906002)(54906003)(53546011)(6506007)(110136005)(8936002)(316002)(8676002)(55016002)(83380400001)(33656002)(186003)(4326008)(7696005)(66476007)(9686003)(5660300002)(478600001)(52536014)(76116006)(91956017)(64756008)(66556008)(66946007)(66446008)(86362001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?giW0gYrPnAo4kYWdh0TA6GKkdcvmX28v+0hj4kMSOQL9Ad0UUuwm8Sc/Bofq?=
 =?us-ascii?Q?h48MnI8h/YZHUwUf6znmU9C/YciAPTwjyPST0Q+fF7j7Lk5ZZFPOidCU1RDc?=
 =?us-ascii?Q?6eFZJ49oKb3nRD2QhoyII4RGXbDNYtEZwZZ5BxT4Vso94/dIZVoHfK13M/Tx?=
 =?us-ascii?Q?JCDEdUZRozuWCCrXgZu7JYrTqNhay9v3xU4WB2PQJufxBQdS5kiUQ9n3wpAM?=
 =?us-ascii?Q?McEWWr8ejzb4Y9gR8Njil1wfpUWbIVw18CbqJFQdns4q7eOIZDSRPaBy/Zsy?=
 =?us-ascii?Q?qj8pvgt6LBsYzNV7sCHluaGMJgoFNv+QGTD6iSvihqgnLZ7iDBfPPEjK0ZvV?=
 =?us-ascii?Q?tV/w6Rfqxlxz+cLKqQRlCA1+rjoTEKk3xq+bAaT40rjVwsTuRBgLtzAUwuBu?=
 =?us-ascii?Q?XJEUT03pyADpDqrMhk2lnNmK1U1h1iAidaykbqRFp9UzditSCQ2p4mcS8Edr?=
 =?us-ascii?Q?jpuiMBu8cFQ/fd3FKY+2L9bLJLozlnR1ueuXpq0b0VmHdRPw+ug0xCdmx2FS?=
 =?us-ascii?Q?yH2apIZLhw87X94cMt/ZUipG0cb/2RmUVb7uW/ReH4iF2dB1pKTSf3YzCpQs?=
 =?us-ascii?Q?taKzwMar56v6qMa5fl3KtS5O9JR15xkA5cgPcTfpHS1OiQb7i4c3cbvybC0g?=
 =?us-ascii?Q?uVOqJIopskLV2j8n7nGMnrjsM3Ia/dc3dhehX2Oz3I7tkYSFXH6T2RqIyTOH?=
 =?us-ascii?Q?7SBSX/FZ0TnWmmr5LqphUCVCc8ev2ZR7eP73cZq1zgpaVaFnLUHfEaSQGIe1?=
 =?us-ascii?Q?0WvcrnImeIoZGUSMdP5LF8dVZ97G8d1eEIXP7nyk9svhSyLqaaaYavBeDQwU?=
 =?us-ascii?Q?IoyBR8RJFY6PIccq3KbnBfY1sL8MOj3JujlXeq5SHGDXOpJlPzkVqymSSCSp?=
 =?us-ascii?Q?aDKxYUw7hOO/pxNldeVtbWQtsnJF/ZldQIl8izBPPcstE9TceG3MhQQSqMrS?=
 =?us-ascii?Q?QuqfcaHqMfO7H38X/M+mLcfJ3niVhwvpp+xhkumIUauw2PzzFqsC1h5vdAT/?=
 =?us-ascii?Q?mKG/EfmPi2RtktVyiX5JvEBNc3LEY6bIrfgJco/SahKQOnYlypiTUMxM83NV?=
 =?us-ascii?Q?lCpEjZyg8W2O3LH8kYYYXlum8mZXRJ7rBU/7SLa6zPiVUkh3l/+AwaKM5Qhf?=
 =?us-ascii?Q?p1gKZZszm+D5d1ursu/KEMstDAdZBPBPKHF64JBg0BmK5JHwCnIlg7z3uCWy?=
 =?us-ascii?Q?/WmEdcDclpsTRbAC/wpmdJl8iywNZaHx22o7a09z8vlwNpV2mNlYrfFv67Ou?=
 =?us-ascii?Q?z+DXIrgxt7VFepKBo74hh9f9hGUrMXSrIFBjmLMw87XWU91MoKghaprczy44?=
 =?us-ascii?Q?PzfgH8m0p9siZRs2m/s8LETl/fOQ1UqRE17dqYvdtxZRHfONuT5vBcb2vn//?=
 =?us-ascii?Q?qsLR8THbdstzdUkj5cVdq6MScjfCtPhdqQLOX/txF75jbU4nqA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc2f796-2379-4e96-d53e-08d8cc84a5a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 22:55:35.8176 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kZgy9+BsgE7PvlpmdOm1ddc2JFh/666E1h7bL5YMb6m6cu73qVzeQJxyOePaifaufxZHyoJ5YbVRvoo62VovFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB7070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_175539_098932_D619438D 
X-CRM114-Status: GOOD (  22.49  )
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
Cc: Atish Patra <Atish.Patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/02/09 7:53, Sean Anderson wrote:
> On 2/8/21 3:00 PM, Rob Herring wrote:
>> On Fri, Feb 5, 2021 at 6:13 PM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>>>
>>> On Fri, 2021-02-05 at 14:25 -0600, Rob Herring wrote:
>>> [...]
>>>>> +                   otp0: nvmem@50420000 {
>>>>> +                           #address-cells = <1>;
>>>>> +                           #size-cells = <1>;
>>>>> +                           compatible = "canaan,k210-otp";
>>>>> +                           reg = <0x50420000 0x100>,
>>>>> +                                 <0x88000000 0x20000>;
>>>>> +                           reg-names = "reg", "mem";
>>>>> +                           clocks = <&sysclk K210_CLK_ROM>;
>>>>> +                           resets = <&sysrst K210_RST_ROM>;
>>>>> +                           read-only;
>>>>> +                           status = "disabled";
>>>>
>>>> Your disabled nodes seem a bit excessive. A device should really only be
>>>> disabled if it's a board level decision to use or not. I'd assume the
>>>> OTP is always there and usable.
>>>
>>> Please see below.
>>>
>>>>
>>>>> +
>>>>> +                           /* Bootloader */
>>>>> +                           firmware@00000 {
>>>>
>>>> Drop leading 0s.
>>>>
>>>> Is this memory mapped? If so, you are missing 'ranges' in the parent to
>>>> make it translateable.
>>>>
>>>>> +                                   reg = <0x00000 0xC200>;
>>>>> +                           };
>>>>> +
>>>>> +                           /*
>>>>> +                            * config string as described in RISC-V
>>>>> +                            * privileged spec 1.9
>>>>> +                            */
>>>>> +                           config-1-9@1c000 {
>>>>> +                                   reg = <0x1C000 0x1000>;
>>>>> +                           };
>>>>> +
>>>>> +                           /*
>>>>> +                            * Device tree containing only registers,
>>>>> +                            * interrupts, and cpus
>>>>> +                            */
>>>>> +                           fdt@1d000 {
>>>>> +                                   reg = <0x1D000 0x2000>;
>>>>> +                           };
>>>>> +
>>>>> +                           /* CPU/ROM credits */
>>>>> +                           credits@1f000 {
>>>>> +                                   reg = <0x1F000 0x1000>;
>>>>> +                           };
>>>>> +                   };
>>>>> +
>>>>> +                   dvp0: camera@50430000 {
>>>>> +                           compatible = "canaan,k210-dvp";
>>>>
>>>> No documented. Seems to be several of them.
>>>
>>> There are no Linux drivers for these undocumented nodes. That is why I did not
>>> add any documentation.
>>
>> Documentation is required when dts files OR Linux drivers use them.
>>
>>> make dtbs_check does not complain about that as long as
>>> the nodes are marked disabled.
>>
>> 'disabled' should only turn off required properties missing checks.
>> Undocumented compatible strings checks are about to get turned on now
>> that I've made it work without false positives.
>>
>>> I kept these nodes to have the DTS in sync with
>>> U-Boot which has them.
>>
>> That's a worthwhile goal. Doesn't u-boot require documenting bindings?
> 
> Generally, no. Usually if the bindings differ from the kernel they are
> documented, but usually the device trees are just imported straight from
> the kernel. This is a bit of an unusual case in that the device tree is
> being imported from U-Boot instead of the other way around.
> 
>>
>>> Keeping them also creates documentation for the SoC
>>> since this device tree is more detailed than the SoC specsheet...
>>
>> It's already 'documented' in u-boot it seems...
> 
> I would like to keep Kernel and U-Boot device trees in-sync. However, if
> there are significant divergences, that becomes more difficult.

Sean,

Are you OK with removing the nodes without a driver ? I think they are the same
for the kernel and U-Boot but I have not checked in detail.

> 
> --Sean
> 
>>
>> Rob
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
