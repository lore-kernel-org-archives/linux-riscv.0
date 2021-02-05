Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787C4C433DB
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 23:49:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D498A64FA9
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 23:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D498A64FA9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=WhYpCLolfqanUjOVTCbsfA2BcpGRIFP03Yg7h7sTJ6Q=; b=2yTXtAUWFJsT4ZgNAuNln1XG3
	0IWgMDCjUfkE/1U+WnHE4cs3kRzSltZb72cTXnq9QSvGfzdNDV7tRrD/v605nECjNgw5CTHDV29h/
	SwKRgIlykToe+Djd2rrnZYjZ59n5k3gy4RZsAWLttlHyzkWV5gOBQdTB7NqV8LfBsFiITkAPRRNeI
	u5oorxC8m52FM4888Ks+uzhLA2WMWfZ7DMn/FxfX5wrfi0MT1IALwyq0pCJOARvOguyo6Jxda54ek
	9Rv0WgNuy7qplWY68DDbI94UcgFIFPJk0cNK0d4STJ6P8tpf66e1K/utwQ0hnyila3EQps0ZEdSjp
	IUfO5RvJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8ArC-0008D5-Dc; Fri, 05 Feb 2021 23:49:46 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8Ar8-0008Cg-J4
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 23:49:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612568982; x=1644104982;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=L551jv9hOynmnDi4CvdOOwie8BskVWuInP7vacv2H9E=;
 b=Qa2mqdx6e1/Lty0OGK+AaZBaGQewx8KcqALnXR32GiNk+y3r5DDOAUJL
 F4RooRPNWtGkPSxm8+DWKIHdfqVDQHqydJoCGuhXUlK/A/mftxJ0GdnXL
 bpitgriTHSWavrnpOBW4lRBuhusdoaU7mhWsaqckgnRdMIP+5EJXkfxTX
 HOyvbO0FyxyseN8X2AdjVZCDnujbw6Ao0IZNzd3kda3ayCj0Z27KPglbi
 dxTVQqwOAHYbrVpI/AZHqJFSI2+AbpTkKI0rcOzp6dsn4Rpm7Gkkmy7+u
 7Gbc3kA1x7S4k8nXPe9Y1zAOSe+wDdOGhV0ky9j+6AlPkFbL9f5ATASrQ Q==;
IronPort-SDR: CfH+PUuZUWktox2uoVqrQK6n4scVbBxjG2RSrD71VgWULakGSQL12ZsKxt4pYAbpX8SW2qZFKZ
 PHBSh41BLnun7U09MC0doxgRNkZn4u0OucttTUO4gJrSgzav81A0gvmmz/ZQCJpJR1Qb1NOYXs
 jozItgn9SCSfDdEt9Co/eQcamL7uFfcSM4vyDSmNlVzv9l+oSJ1hzw/Mvz1b0tRY8pPTYT97pm
 sLGV2evhIpcVefNgOoS1ZolM3R7RxjF5gqT/cQqtC3vrrCeyMDgio69ouIhQPMiolg8tkOwwKX
 1dc=
X-IronPort-AV: E=Sophos;i="5.81,156,1610380800"; d="scan'208";a="159263138"
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hgst.iphmx.com with ESMTP; 06 Feb 2021 07:49:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKIFDyHI0L0o3LEXh+2W3qZKLxe6nMZ5g+yH33I2XRn1hjtj8I7hZiyBtQF4zRM6fqr/feKlTS9aVqye2Jff2C5OEf9AVCoTVZ/lVyspQ2G2av1E2a9D/0YXWXmYOy06joxt7ije8ktJPCRmJPj/di+whJqrYdapevtLGF6ayMIkOiqyDipJFckIU4mJk/HZvQQyH4mfWxWx8K6MukIb02Yp9suAgpIQW21yJbLkjwrkGognuHkmPPjke0emlctfIYF1u5AQp0SL0F/gNNpc2tCQ+9R3Kam8oXH1wI7OgnFgu8fQEEuhXGcKEHH51HiWoXF1csqaozc789+mv4U+nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2J7vj8uwFWPRqPrk/LRckpVvEyXbjmlscxNXRGnGPLc=;
 b=UC7HWjqLQbCnUbpzC5icfKc7wu4Lhvkr73UhLmByXrSYuaZvZeysDx2O8A+eG1m/GT9M5+d42qRl1+NxaPG2umfVvjj32W9eedZq/esSfcxaDSgaxg5W/LBuTNuOvXgzLPHUyni0/6oU+orL7Br7bUXvVWMB0kyrtvSGiQzCUYaeH9MBkNovGJh+pCkRWZz1VjMnca3M6Lz5aKCyzzrM+o3RqC606++OU6rojtKO/hIfNxl2VlbIXITj0Z+yEOowW7G6xdkTadeg1bIDeiAiPswGfK8497fAHinXdhOiBVX7V2OSoW7TCjWXsnjg17Iy8XxNBsZ8u4Bigo50A1Okzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2J7vj8uwFWPRqPrk/LRckpVvEyXbjmlscxNXRGnGPLc=;
 b=KKu23+HDTDDFp/D+IwUhVZL95aEMmnaYeKb9Oe2/dQ3uOhiQ1iusLzR+igIqxLa2WedkYhTiLCkMDLomgxf4bZBue/x83XMBWkh339lN5glWw4Tc0Zu5LLW1j1eH8WG98pQtnQWFwesslYSBQDz86wwqyp7pkiBjAoaHsMrBBSM=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6350.namprd04.prod.outlook.com (2603:10b6:208:1a1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Fri, 5 Feb
 2021 23:49:36 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%7]) with mapi id 15.20.3825.025; Fri, 5 Feb 2021
 23:49:36 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Sean Anderson <seanga2@gmail.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v16 09/16] riscv: Update Canaan Kendryte K210 device tree
Thread-Topic: [PATCH v16 09/16] riscv: Update Canaan Kendryte K210 device tree
Thread-Index: AQHW+4xeGC09t/jMzkSSVnIpB80beA==
Date: Fri, 5 Feb 2021 23:49:36 +0000
Message-ID: <BL0PR04MB65146BD4DF1C3BA208AFC198E7B29@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210205065827.577285-1-damien.lemoal@wdc.com>
 <20210205065827.577285-10-damien.lemoal@wdc.com>
 <20210205202505.GA3625674@robh.at.kernel.org>
 <52dc2537-7668-4409-f35b-bfddfd09059b@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:50f7:ee01:712b:bf92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2deda642-09f7-4b88-5b5b-08d8ca30b1ef
x-ms-traffictypediagnostic: MN2PR04MB6350:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB63501650708E9B7AF96A2559E7B29@MN2PR04MB6350.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gn6YnOQKqN8s2jxxajjQ/hwz6M+sGeTMdf2K8WFtqP2lDDEPygSEXyoVSDRxZIzWTvTR3wsoiPrSrVQOxY7A9A+PO6h1w7c+erFQx42vfSmRDA4sWaO25v7QO6BpZIIUMtzo9GIR6VCQ+B4fv/RMh9ZT2koxd4fPngE4o2UGhMvpnFVV0SlyctvOI2yiArXOKDy+unHGzoW9aSWZqMgg8s1U+oy5ImqIBKo5rP0a1aL/CEjkl6v23V6Qf3/mpMFMaVzwgEv/qvojtPcjV8XqcoCc+9rvrKzl6n2vazcrqn1Cc+J8iCumbO7IKDMFEdFnY6grHK9fsBxeiTsBtaN5BKtFUanORXH7Bz2PmpAjSJkGWar5mmynbeo61ev9rS3tlxVJsE/3amHEGfMRRjZMRPsj/ARnLvRFUChzt0HSFu4ILoLaqQkaea2muy3+8kE2ayjZEw2JiSBz2EX+HMhzqTXdOVCP1mLjRZqq9YIYsrFwuDNF1SgM1Xoib5ZGwFAhzAgJYUFrUwOIfkP7z4BCiw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(83380400001)(4326008)(6506007)(8676002)(71200400001)(2906002)(91956017)(64756008)(15650500001)(8936002)(76116006)(186003)(66556008)(66446008)(30864003)(66946007)(52536014)(66476007)(316002)(54906003)(478600001)(86362001)(5660300002)(53546011)(7696005)(33656002)(110136005)(55016002)(9686003)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?gKnd2MHJchvFGz3lDo1qTCre6V9it9eon9yh/rYguyb+I58CzuAq5obbAhEZ?=
 =?us-ascii?Q?13XvpxJ4v7XdTC1cjqSaRdJL1S1IfJIYyVA070jztqhc8/nWFScuh6YnF+lI?=
 =?us-ascii?Q?cm5FkYP1lp5XB+YyBug+lrt4BQLOTC20O+YOhbhvqM6FzvhlPtUIPoMdvLP7?=
 =?us-ascii?Q?CevVVEANA5sEXroPxgvETtptB34mgQiDbL7/afKHEW8D4LPvBw9JVm3OCbNk?=
 =?us-ascii?Q?7Q8+HZPzrNTd1U4X1bgx3RH8P2LP9j0l0+VITmElzjxhHkDgN2oq+sZIKCqL?=
 =?us-ascii?Q?IJOk4w3VncSDY9vfIcGlj7V3e0wWUrbFhhf5B3//uErTc2PdgWvwP+NwQBnK?=
 =?us-ascii?Q?nj1dEhrgd4mj6cyKhluwltNcSpmaBlYV8T+3HhFkiE2QrigZGib8jyQUL+Vo?=
 =?us-ascii?Q?30VUEeuPTYccsPrLNwxk3Tu1CyMAxzIvFikU0mTFQ12H7T6y1NxW1J3hLu/R?=
 =?us-ascii?Q?pSLFOdjr/9foSPalENAc4mfsVj3Ps7od9YkI0sMCYahQ1R+Mk+TZZWjMdYwE?=
 =?us-ascii?Q?xTyd8yNBqPhXzzQj9WY8zL0DoOlyFqaZGiLvw7xnxI8B5kbil4NSQy/fVoCW?=
 =?us-ascii?Q?mGk/SdNyv+3l+CREOUSn9Fa7Caj3uWzaagDrEOsp18RZukJT8mwP/83Ur8e6?=
 =?us-ascii?Q?osxBF+sHfq3ic23y6LgBt3oxMPssrrx5ssFg6RTIqUDxAEfH5s4K7ymoOrug?=
 =?us-ascii?Q?Wz0muoT1/9VvrD7CcBltEAmeYLq+vl36YbM4rnf59YqvlPRsEdNqC0x9k2Q+?=
 =?us-ascii?Q?GiaXWkAU2v3OUy/Pet6d0E5UMMuSO14fuMUvtk+piT9gYUeYVNitXGQcJi3M?=
 =?us-ascii?Q?K5uyN5cBeR3ZpqpTHYFc8j3kRRfmZZH0AsIRVh5mAgvss5ivL6zD7qBHS0KZ?=
 =?us-ascii?Q?YkJ93TPQ6uFORkbPtBZnZdbXl4CsiqvWDS6PlO1HWclXjtQAeFY9T683XhcE?=
 =?us-ascii?Q?Jirk7J0NCOgEKaHAGPvxYPw/Nda7blFrVsKK+/zLqYblcwHAQZTnP4YldAux?=
 =?us-ascii?Q?A82UxH9uovgGDeG/0kX9p4vcWaMcvQl8rlxmYlqcpA5Xvfkk/QYqpVT+XG+N?=
 =?us-ascii?Q?FcDKJ3d/FokTWOigNQshRMcGMDqoPbUy4jytMC4kwiVv+sjK0ma7neVic7hP?=
 =?us-ascii?Q?/cvumCWVmyerlV85YJXQynI/sud37Y3pdFuFbxqiUKKoiGcxYfpL8OsWm8+Y?=
 =?us-ascii?Q?01uCYrgc83bbdQIGXrEuef0CTMttODJBYs2HgcolSpwTgLjx2KEd3eXOZALd?=
 =?us-ascii?Q?LosbmmO63bEwSEQcoNzyM1jb6YAHMS86+X8CL/Ctd02doeoGKaxJC3kyQDLU?=
 =?us-ascii?Q?YmSPON1Wvo/HYcd4Z5GazCiP4cXr4EvRV8sB3+9du9R+VikZvzcfjr+1Ms3C?=
 =?us-ascii?Q?Mm8Of41AY0/RZ3fMV86gJTVPBkqZovm8IR1iRH2G7I/IN2tgwQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2deda642-09f7-4b88-5b5b-08d8ca30b1ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 23:49:36.3846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mJWyAXf1s4bdj8O4ImcJEHZsDXJJ4vfT6j8PNElT2XbX0XAVb7p337ByDAhYNlw857DgXQ/zpvIJhwSbyeJuEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_184943_086813_21C70591 
X-CRM114-Status: GOOD (  17.67  )
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
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/02/06 7:52, Sean Anderson wrote:
> On 2/5/21 3:25 PM, Rob Herring wrote:
>> On Fri, Feb 05, 2021 at 03:58:20PM +0900, Damien Le Moal wrote:
>>> Update the Canaan Kendryte K210 base device tree k210.dtsi to define
>>> all peripherals of the SoC, their clocks and reset lines. The device
>>> tree file k210.dts is renamed to k210_generic.dts and becomes the
>>> default value selection of the SOC_CANAAN_K210_DTB_BUILTIN_SOURCE
>>> configuration option. No device beside the serial console is defined by
>>> this device tree. This makes this generic device tree suitable for use
>>> with a builtin initramfs with all known K210 based boards.
>>>
>>> These changes result in the K210_CLK_ACLK clock ID to be unused and
>>> removed from the dt-bindings k210-clk.h header file.
>>>
>>> Most updates to the k210.dtsi file come from Sean Anderson's work on
>>> U-Boot support for the K210.
>>>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: devicetree@vger.kernel.org
>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>>> ---
>>>   arch/riscv/Kconfig.socs                     |   2 +-
>>>   arch/riscv/boot/dts/canaan/k210.dts         |  23 -
>>>   arch/riscv/boot/dts/canaan/k210.dtsi        | 535 +++++++++++++++++++-
>>>   arch/riscv/boot/dts/canaan/k210_generic.dts |  46 ++
>>>   include/dt-bindings/clock/k210-clk.h        |   1 -
>>>   5 files changed, 554 insertions(+), 53 deletions(-)
>>>   delete mode 100644 arch/riscv/boot/dts/canaan/k210.dts
>>>   create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts
>>>
>>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>>> index 6402746c68f3..7efcece8896c 100644
>>> --- a/arch/riscv/Kconfig.socs
>>> +++ b/arch/riscv/Kconfig.socs
>>> @@ -51,7 +51,7 @@ config SOC_CANAAN_K210_DTB_SOURCE
>>>   	string "Source file for the Canaan Kendryte K210 builtin DTB"
>>>   	depends on SOC_CANAAN
>>>   	depends on SOC_CANAAN_K210_DTB_BUILTIN
>>> -	default "k210"
>>> +	default "k210_generic"
>>>   	help
>>>   	  Base name (without suffix, relative to arch/riscv/boot/dts/canaan)
>>>   	  for the DTS file that will be used to produce the DTB linked into the
>>> diff --git a/arch/riscv/boot/dts/canaan/k210.dts b/arch/riscv/boot/dts/canaan/k210.dts
>>> deleted file mode 100644
>>> index 0d1f28fce6b2..000000000000
>>> --- a/arch/riscv/boot/dts/canaan/k210.dts
>>> +++ /dev/null
>>> @@ -1,23 +0,0 @@
>>> -// SPDX-License-Identifier: GPL-2.0+
>>> -/*
>>> - * Copyright (C) 2020 Western Digital Corporation or its affiliates.
>>> - */
>>> -
>>> -/dts-v1/;
>>> -
>>> -#include "k210.dtsi"
>>> -
>>> -/ {
>>> -	model = "Kendryte K210 generic";
>>> -	compatible = "kendryte,k210";
>>> -
>>> -	chosen {
>>> -		bootargs = "earlycon console=ttySIF0";
>>> -		stdout-path = "serial0";
>>> -	};
>>> -};
>>> -
>>> -&uarths0 {
>>> -	status = "okay";
>>> -};
>>> -
>>> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
>>> index 354b263195a3..63c1f4c98d6c 100644
>>> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
>>> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
>>> @@ -1,9 +1,11 @@
>>>   // SPDX-License-Identifier: GPL-2.0+
>>>   /*
>>> - * Copyright (C) 2019 Sean Anderson <seanga2@gmail.com>
>>> + * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
>>>    * Copyright (C) 2020 Western Digital Corporation or its affiliates.
>>>    */
>>>   #include <dt-bindings/clock/k210-clk.h>
>>> +#include <dt-bindings/pinctrl/k210-fpioa.h>
>>> +#include <dt-bindings/reset/k210-rst.h>
>>>   
>>>   / {
>>>   	/*
>>> @@ -12,14 +14,33 @@ / {
>>>   	 */
>>>   	#address-cells = <1>;
>>>   	#size-cells = <1>;
>>> -	compatible = "kendryte,k210";
>>> +	compatible = "canaan,kendryte-k210";
>>>   
>>>   	aliases {
>>> +		cpu0 = &cpu0;
>>> +		cpu1 = &cpu1;
>>> +		dma0 = &dmac0;
>>> +		gpio0 = &gpio0;
>>> +		gpio1 = &gpio1_0;
>>> +		i2c0 = &i2c0;
>>> +		i2c1 = &i2c1;
>>> +		i2c2 = &i2c2;
>>> +		pinctrl0 = &fpioa;
>>>   		serial0 = &uarths0;
>>> +		serial1 = &uart1;
>>> +		serial2 = &uart2;
>>> +		serial3 = &uart3;
>>> +		spi0 = &spi0;
>>> +		spi1 = &spi1;
>>> +		spi2 = &spi2;
>>> +		spi3 = &spi3;
>>> +		timer0 = &timer0;
>>> +		timer1 = &timer1;
>>> +		timer2 = &timer2;
>>
>> Don't add random aliases. Really, only the serialN ones should be here.
>> cpu, dma, pinctrl, timer are definitely non-standard.
> 
> 
> All of these except for cpu and dma are already found in the kernel.
> They were primarily added for U-Boot.

They are unused in the DTS. make dtbs_check passes keeping only the serial
aliases, just check. Can I remove them ? Will that be a problem for U-Boot ?

> 
>>
>>>   	};
>>>   
>>>   	/*
>>> -	 * The K210 has an sv39 MMU following the priviledge specification v1.9.
>>> +	 * The K210 has an sv39 MMU following the privileged specification v1.9.
>>>   	 * Since this is a non-ratified draft specification, the kernel does not
>>>   	 * support it and the K210 support enabled only for the !MMU case.
>>>   	 * Be consistent with this by setting the CPUs MMU type to "none".
>>> @@ -30,14 +51,14 @@ cpus {
>>>   		timebase-frequency = <7800000>;
>>>   		cpu0: cpu@0 {
>>>   			device_type = "cpu";
>>> +			compatible = "canaan,k210", "riscv";
>>>   			reg = <0>;
>>> -			compatible = "kendryte,k210", "sifive,rocket0", "riscv";
>>>   			riscv,isa = "rv64imafdc";
>>> -			mmu-type = "none";
>>> -			i-cache-size = <0x8000>;
>>> +			mmu-type = "riscv,none";
>>>   			i-cache-block-size = <64>;
>>> -			d-cache-size = <0x8000>;
>>> +			i-cache-size = <0x8000>;
>>>   			d-cache-block-size = <64>;
>>> +			d-cache-size = <0x8000>;
>>>   			cpu0_intc: interrupt-controller {
>>>   				#interrupt-cells = <1>;
>>>   				interrupt-controller;
>>> @@ -46,14 +67,14 @@ cpu0_intc: interrupt-controller {
>>>   		};
>>>   		cpu1: cpu@1 {
>>>   			device_type = "cpu";
>>> +			compatible = "canaan,k210", "riscv";
>>>   			reg = <1>;
>>> -			compatible = "kendryte,k210", "sifive,rocket0", "riscv";
>>>   			riscv,isa = "rv64imafdc";
>>> -			mmu-type = "none";
>>> -			i-cache-size = <0x8000>;
>>> +			mmu-type = "riscv,none";
>>>   			i-cache-block-size = <64>;
>>> -			d-cache-size = <0x8000>;
>>> +			i-cache-size = <0x8000>;
>>>   			d-cache-block-size = <64>;
>>> +			d-cache-size = <0x8000>;
>>>   			cpu1_intc: interrupt-controller {
>>>   				#interrupt-cells = <1>;
>>>   				interrupt-controller;
>>> @@ -64,10 +85,15 @@ cpu1_intc: interrupt-controller {
>>>   
>>>   	sram: memory@80000000 {
>>>   		device_type = "memory";
>>> +		compatible = "canaan,k210-sram";
>>>   		reg = <0x80000000 0x400000>,
>>>   		      <0x80400000 0x200000>,
>>>   		      <0x80600000 0x200000>;
>>>   		reg-names = "sram0", "sram1", "aisram";
>>> +		clocks = <&sysclk K210_CLK_SRAM0>,
>>> +			 <&sysclk K210_CLK_SRAM1>,
>>> +			 <&sysclk K210_CLK_AI>;
>>> +		clock-names = "sram0", "sram1", "aisram";
>>>   	};
>>>   
>>>   	clocks {
>>> @@ -81,40 +107,493 @@ in0: oscillator {
>>>   	soc {
>>>   		#address-cells = <1>;
>>>   		#size-cells = <1>;
>>> -		compatible = "kendryte,k210-soc", "simple-bus";
>>> +		compatible = "simple-bus";
>>>   		ranges;
>>>   		interrupt-parent = <&plic0>;
>>>   
>>> -		sysctl: sysctl@50440000 {
>>> -			compatible = "kendryte,k210-sysctl", "simple-mfd";
>>> -			reg = <0x50440000 0x1000>;
>>> -			#clock-cells = <1>;
>>> +		debug0: debug@0 {
>>> +			compatible = "canaan,k210-debug", "riscv,debug";
>>
>> Not documented.
> 
> On 1/14/21 7:06 PM, Sean Anderson wrote:
>> Here it's because "riscv,debug" doesn't exist. This is the "debug"
>> device as described in the debug spec. AFAIK Linux never needs to
>> configure this device. It could probably be removed. 
> 
> No objections here.

OK. Will drop this one.

> 
>>
>>> +			reg = <0x0 0x1000>;
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		rom0: nvmem@1000 {
>>> +			reg = <0x1000 0x1000>;
>>> +			read-only;
>>> +			status = "disabled";
>>>   		};
>>>   
>>>   		clint0: clint@2000000 {
>>
>> interrupt-controller@...
> 
> Yes, this should be changed.

The bindings doc say it should be timer@... Will change to that.

> 
>>
>>> -			#interrupt-cells = <1>;
>>> -			compatible = "riscv,clint0";
>>> +			compatible = "canaan,k210-clint", "sifive,clint0";
>>>   			reg = <0x2000000 0xC000>;
>>> -			interrupts-extended =  <&cpu0_intc 3 &cpu0_intc 7
>>> -						&cpu1_intc 3 &cpu1_intc 7>;
>>> +			interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
>>> +					      &cpu1_intc 3 &cpu1_intc 7>;
>>>   		};
>>>   
>>> -		plic0: interrupt-controller@c000000 {
>>> +		plic0: interrupt-controller@C000000 {
>>
>> No, lowercase hex in unit-addresses was correct.
> 
> Do you have any authoritative source for this? When I was creating this
> tree, I didn't see anything about what case the addresses should be in
> (and a quick grep for lower-case in Documentation/devicetree doesn't
> have any relevant results).
> 
>>
>>>   			#interrupt-cells = <1>;
>>> -			interrupt-controller;
>>> -			compatible = "kendryte,k210-plic0", "riscv,plic0";
>>> +			#address-cells = <0>;
>>> +			compatible = "canaan,k210-plic", "sifive,plic-1.0.0";
>>>   			reg = <0xC000000 0x4000000>;
>>> -			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 0xffffffff>,
>>> -					      <&cpu1_intc 11>, <&cpu1_intc 0xffffffff>;
>>> +			interrupt-controller;
>>> +			interrupts-extended = <&cpu0_intc 11 &cpu1_intc 11>;
>>>   			riscv,ndev = <65>;
>>> -			riscv,max-priority = <7>;
>>>   		};
>>>   
>>>   		uarths0: serial@38000000 {
>>> -			compatible = "kendryte,k210-uarths", "sifive,uart0";
>>> +			compatible = "canaan,k210-uarths", "sifive,uart0";
>>>   			reg = <0x38000000 0x1000>;
>>>   			interrupts = <33>;
>>> -			clocks = <&sysctl K210_CLK_CPU>;
>>> +			clocks = <&sysclk K210_CLK_CPU>;
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		gpio0: gpio-controller@38001000 {
>>> +			#interrupt-cells = <2>;
>>> +			#gpio-cells = <2>;
>>> +			compatible = "canaan,k210-gpiohs", "sifive,gpio0";
>>> +			reg = <0x38001000 0x1000>;
>>> +			interrupt-controller;
>>> +			interrupts = <34 35 36 37 38 39 40 41
>>> +				      42 43 44 45 46 47 48 49
>>> +				      50 51 52 53 54 55 56 57
>>> +				      58 59 60 61 62 63 64 65>;
>>> +			gpio-controller;
>>> +			ngpios = <32>;
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		kpu0: kpu@40800000 {
>>> +			compatible = "canaan,k210-kpu";
>>> +			reg = <0x40800000 0xc00000>;
>>> +			interrupts = <25>;
>>> +			clocks = <&sysclk K210_CLK_AI>;
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		fft0: fft@42000000 {
>>> +			compatible = "canaan,k210-fft";
>>> +			reg = <0x42000000 0x400000>;
>>> +			interrupts = <26>;
>>> +			clocks = <&sysclk K210_CLK_FFT>;
>>> +			resets = <&sysrst K210_RST_FFT>;
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		dmac0: dma-controller@50000000 {
>>> +			compatible = "snps,axi-dma-1.01a";
>>> +			reg = <0x50000000 0x1000>;
>>> +			interrupts = <27 28 29 30 31 32>;
>>> +			clocks = <&sysclk K210_CLK_DMA>, <&sysclk K210_CLK_DMA>;
>>> +			clock-names = "core-clk", "cfgr-clk";
>>> +			resets = <&sysrst K210_RST_DMA>;
>>> +			dma-channels = <6>;
>>> +			snps,dma-masters = <2>;
>>> +			snps,priority = <0 1 2 3 4 5>;
>>> +			snps,data-width = <5>;
>>> +			snps,block-size = <0x200000 0x200000 0x200000
>>> +					   0x200000 0x200000 0x200000>;
>>> +			snps,axi-max-burst-len = <256>;
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		apb0: bus@50200000 {
>>> +			#address-cells = <1>;
>>> +			#size-cells = <1>;
>>> +			compatible = "simple-pm-bus";
>>> +			ranges;
>>> +			clocks = <&sysclk K210_CLK_APB0>;
>>> +
>>> +			gpio1: gpio@50200000 {
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +				compatible = "snps,dw-apb-gpio";
>>> +				reg = <0x50200000 0x80>;
>>> +				clocks = <&sysclk K210_CLK_APB0>,
>>> +					 <&sysclk K210_CLK_GPIO>;
>>> +				clock-names = "bus", "db";
>>> +				resets = <&sysrst K210_RST_GPIO>;
>>> +				status = "disabled";
>>> +
>>> +				gpio1_0: gpio-port@0 {
>>> +					#gpio-cells = <2>;
>>> +					#interrupt-cells = <2>;
>>> +					compatible = "snps,dw-apb-gpio-port";
>>> +					reg = <0>;
>>> +					interrupt-controller;
>>> +					interrupts = <23>;
>>> +					gpio-controller;
>>> +					ngpios = <8>;
>>> +				};
>>> +			};
>>> +
>>> +			uart1: serial@50210000 {
>>> +				compatible = "snps,dw-apb-uart";
>>> +				reg = <0x50210000 0x100>;
>>> +				interrupts = <11>;
>>> +				clocks = <&sysclk K210_CLK_UART1>,
>>> +					 <&sysclk K210_CLK_APB0>;
>>> +				clock-names = "baudclk", "apb_pclk";
>>> +				resets = <&sysrst K210_RST_UART1>;
>>> +				reg-io-width = <4>;
>>> +				reg-shift = <2>;
>>> +				dcd-override;
>>> +				dsr-override;
>>> +				cts-override;
>>> +				ri-override;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			uart2: serial@50220000 {
>>> +				compatible = "snps,dw-apb-uart";
>>> +				reg = <0x50220000 0x100>;
>>> +				interrupts = <12>;
>>> +				clocks = <&sysclk K210_CLK_UART2>,
>>> +					 <&sysclk K210_CLK_APB0>;
>>> +				clock-names = "baudclk", "apb_pclk";
>>> +				resets = <&sysrst K210_RST_UART2>;
>>> +				reg-io-width = <4>;
>>> +				reg-shift = <2>;
>>> +				dcd-override;
>>> +				dsr-override;
>>> +				cts-override;
>>> +				ri-override;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			uart3: serial@50230000 {
>>> +				compatible = "snps,dw-apb-uart";
>>> +				reg = <0x50230000 0x100>;
>>> +				interrupts = <13>;
>>> +				clocks = <&sysclk K210_CLK_UART3>,
>>> +					 <&sysclk K210_CLK_APB0>;
>>> +				clock-names = "baudclk", "apb_pclk";
>>> +				resets = <&sysrst K210_RST_UART3>;
>>> +				reg-io-width = <4>;
>>> +				reg-shift = <2>;
>>> +				dcd-override;
>>> +				dsr-override;
>>> +				cts-override;
>>> +				ri-override;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			spi2: spi@50240000 {
>>> +				compatible = "canaan,k210-spi";
>>> +				spi-slave;
>>> +				reg = <0x50240000 0x100>;
>>> +				interrupts = <3>;
>>> +				clocks = <&sysclk K210_CLK_SPI2>,
>>> +					 <&sysclk K210_CLK_APB0>;
>>> +				clock-names = "ssi_clk", "pclk";
>>> +				resets = <&sysrst K210_RST_SPI2>;
>>> +				spi-max-frequency = <25000000>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			i2s0: i2s@50250000 {
>>> +				compatible = "snps,designware-i2s";
>>> +				reg = <0x50250000 0x200>;
>>> +				interrupts = <5>;
>>> +				clocks = <&sysclk K210_CLK_I2S0>;
>>> +				clock-names = "i2sclk";
>>> +				resets = <&sysrst K210_RST_I2S0>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			apu0: sound@520250200 {
>>> +				compatible = "canaan,k210-apu";
>>> +				reg = <0x50250200 0x200>;
>>
>> The unit-address and 'reg' value don't match.
> 
> Good catch. The unit address should be 50250200.

Fixed.

> 
>>
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			i2s1: i2s@50260000 {
>>> +				compatible = "snps,designware-i2s";
>>> +				reg = <0x50260000 0x200>;
>>> +				interrupts = <6>;
>>> +				clocks = <&sysclk K210_CLK_I2S1>;
>>> +				clock-names = "i2sclk";
>>> +				resets = <&sysrst K210_RST_I2S1>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			i2s2: i2s@50270000 {
>>> +				compatible = "snps,designware-i2s";
>>> +				reg = <0x50270000 0x200>;
>>> +				interrupts = <7>;
>>> +				clocks = <&sysclk K210_CLK_I2S2>;
>>> +				clock-names = "i2sclk";
>>> +				resets = <&sysrst K210_RST_I2S2>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			i2c0: i2c@50280000 {
>>> +				compatible = "snps,designware-i2c";
>>> +				reg = <0x50280000 0x100>;
>>> +				interrupts = <8>;
>>> +				clocks = <&sysclk K210_CLK_I2C0>,
>>> +					 <&sysclk K210_CLK_APB0>;
>>> +				clock-names = "ref", "pclk";
>>> +				resets = <&sysrst K210_RST_I2C0>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			i2c1: i2c@50290000 {
>>> +				compatible = "snps,designware-i2c";
>>> +				reg = <0x50290000 0x100>;
>>> +				interrupts = <9>;
>>> +				clocks = <&sysclk K210_CLK_I2C1>,
>>> +					 <&sysclk K210_CLK_APB0>;
>>> +				clock-names = "ref", "pclk";
>>> +				resets = <&sysrst K210_RST_I2C1>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			i2c2: i2c@502A0000 {
>>
>> Again, lowercase hex.
>>
>>> +				compatible = "snps,designware-i2c";
>>> +				reg = <0x502A0000 0x100>;
>>> +				interrupts = <10>;
>>> +				clocks = <&sysclk K210_CLK_I2C2>,
>>> +					 <&sysclk K210_CLK_APB0>;
>>> +				clock-names = "ref", "pclk";
>>> +				resets = <&sysrst K210_RST_I2C2>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			fpioa: pinmux@502B0000 {
>>> +				compatible = "canaan,k210-fpioa";
>>> +				reg = <0x502B0000 0x100>;
>>> +				clocks = <&sysclk K210_CLK_FPIOA>,
>>> +					 <&sysclk K210_CLK_APB0>;
>>> +				clock-names = "ref", "pclk";
>>> +				resets = <&sysrst K210_RST_FPIOA>;
>>> +				canaan,k210-sysctl-power = <&sysctl 108>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			sha256: sha256@502C0000 {
>>> +				compatible = "canaan,k210-sha256";
>>> +				reg = <0x502C0000 0x100>;
>>> +				clocks = <&sysclk K210_CLK_SHA>;
>>> +				resets = <&sysrst K210_RST_SHA>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			timer0: timer@502D0000 {
>>> +				compatible = "snps,dw-apb-timer";
>>> +				reg = <0x502D0000 0x100>;
>>> +				interrupts = <14 15>;
>>> +				clocks = <&sysclk K210_CLK_TIMER0>,
>>> +					 <&sysclk K210_CLK_APB0>;
>>> +				clock-names = "timer", "pclk";
>>> +				resets = <&sysrst K210_RST_TIMER0>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			timer1: timer@502E0000 {
>>> +				compatible = "snps,dw-apb-timer";
>>> +				reg = <0x502E0000 0x100>;
>>> +				interrupts = <16 17>;
>>> +				clocks = <&sysclk K210_CLK_TIMER1>,
>>> +					 <&sysclk K210_CLK_APB0>;
>>> +				clock-names = "timer", "pclk";
>>> +				resets = <&sysrst K210_RST_TIMER1>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			timer2: timer@502F0000 {
>>> +				compatible = "snps,dw-apb-timer";
>>> +				reg = <0x502F0000 0x100>;
>>> +				interrupts = <18 19>;
>>> +				clocks = <&sysclk K210_CLK_TIMER2>,
>>> +					 <&sysclk K210_CLK_APB0>;
>>> +				clock-names = "timer", "pclk";
>>> +				resets = <&sysrst K210_RST_TIMER2>;
>>> +				status = "disabled";
>>> +			};
>>> +		};
>>> +
>>> +		apb1: bus@50400000 {
>>> +			#address-cells = <1>;
>>> +			#size-cells = <1>;
>>> +			compatible = "simple-pm-bus";
>>> +			ranges;
>>> +			clocks = <&sysclk K210_CLK_APB1>;
>>> +
>>> +			wdt0: watchdog@50400000 {
>>> +				compatible = "snps,dw-wdt";
>>> +				reg = <0x50400000 0x100>;
>>> +				interrupts = <21>;
>>> +				clocks = <&sysclk K210_CLK_WDT0>,
>>> +					 <&sysclk K210_CLK_APB1>;
>>> +				clock-names = "tclk", "pclk";
>>> +				resets = <&sysrst K210_RST_WDT0>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			wdt1: watchdog@50410000 {
>>> +				compatible = "snps,dw-wdt";
>>> +				reg = <0x50410000 0x100>;
>>> +				interrupts = <22>;
>>> +				clocks = <&sysclk K210_CLK_WDT1>,
>>> +					 <&sysclk K210_CLK_APB1>;
>>> +				clock-names = "tclk", "pclk";
>>> +				resets = <&sysrst K210_RST_WDT1>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			otp0: nvmem@50420000 {
>>> +				#address-cells = <1>;
>>> +				#size-cells = <1>;
>>> +				compatible = "canaan,k210-otp";
>>> +				reg = <0x50420000 0x100>,
>>> +				      <0x88000000 0x20000>;
>>> +				reg-names = "reg", "mem";
>>> +				clocks = <&sysclk K210_CLK_ROM>;
>>> +				resets = <&sysrst K210_RST_ROM>;
>>> +				read-only;
>>> +				status = "disabled";
>>
>> Your disabled nodes seem a bit excessive. A device should really only be
>> disabled if it's a board level decision to use or not. I'd assume the
>> OTP is always there and usable.
> 
> It's disabled because there is no driver for it (yet). Though see below
> for the reasoning behind this.
> 
>>> +
>>> +				/* Bootloader */
>>> +				firmware@00000 {
>>
>> Drop leading 0s.
>>
>> Is this memory mapped? If so, you are missing 'ranges' in the parent to
>> make it translateable.
> 
> Yes, there should be ranges.
> 
> Though I am not sure that the ROM is controllable from this OTP...
> 
> Perhaps it should be its own node.

Not sures what to do here... I added "ranges;" to the node. Is that enough ? Or
should the range for each child be defined ?

> 
>>
>>> +					reg = <0x00000 0xC200>;
>>> +				};
>>> +
>>> +				/*
>>> +				 * config string as described in RISC-V
>>> +				 * privileged spec 1.9
>>> +				 */
>>> +				config-1-9@1c000 {
>>> +					reg = <0x1C000 0x1000>;
>>> +				};
>>> +
>>> +				/*
>>> +				 * Device tree containing only registers,
>>> +				 * interrupts, and cpus
>>> +				 */
>>> +				fdt@1d000 {
>>> +					reg = <0x1D000 0x2000>;
>>> +				};
>>> +
>>> +				/* CPU/ROM credits */
>>> +				credits@1f000 {
>>> +					reg = <0x1F000 0x1000>;
>>> +				};
>>> +			};
>>> +
>>> +			dvp0: camera@50430000 {
>>> +				compatible = "canaan,k210-dvp";
>>
>> No documented. Seems to be several of them.
> 
> Correct. At some point there may be drivers. But there is no
> authoritative information (memory map, list of registers, list of
> interrupts) outside of source code for this board.
> 
>>
>>> +				reg = <0x50430000 0x100>;
>>> +				interrupts = <24>;
>>> +				clocks = <&sysclk K210_CLK_DVP>;
>>> +				resets = <&sysrst K210_RST_DVP>;
>>> +				canaan,k210-misc-offset = <&sysctl 84>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			sysctl: syscon@50440000 {
>>> +				compatible = "canaan,k210-sysctl",
>>> +					     "syscon", "simple-mfd";
>>> +				reg = <0x50440000 0x100>;
>>> +				clocks = <&sysclk K210_CLK_APB1>;
>>> +				clock-names = "pclk";
>>> +
>>> +				sysclk: clock-controller {
>>> +					#clock-cells = <1>;
>>> +					compatible = "canaan,k210-clk";
>>> +					clocks = <&in0>;
>>> +				};
>>> +
>>> +				sysrst: reset-controller {
>>> +					compatible = "canaan,k210-rst";
>>> +					#reset-cells = <1>;
>>> +				};
>>> +
>>> +				reboot: syscon-reboot {
>>> +					compatible = "syscon-reboot";
>>> +					regmap = <&sysctl>;
>>> +					offset = <48>;
>>> +					mask = <1>;
>>> +					value = <1>;
>>> +				};
>>> +			};
>>> +
>>> +			aes0: aes@50450000 {
>>> +				compatible = "canaan,k210-aes";
>>> +				reg = <0x50450000 0x100>;
>>> +				clocks = <&sysclk K210_CLK_AES>;
>>> +				resets = <&sysrst K210_RST_AES>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			rtc: rtc@50460000 {
>>> +				compatible = "canaan,k210-rtc";
>>> +				reg = <0x50460000 0x100>;
>>> +				clocks = <&in0>;
>>> +				resets = <&sysrst K210_RST_RTC>;
>>> +				interrupts = <20>;
>>> +				status = "disabled";
>>> +			};
>>> +		};
>>> +
>>> +		apb2: bus@52000000 {
>>> +			#address-cells = <1>;
>>> +			#size-cells = <1>;
>>> +			compatible = "simple-pm-bus";
>>> +			ranges;
>>> +			clocks = <&sysclk K210_CLK_APB2>;
>>> +
>>> +			spi0: spi@52000000 {
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +				compatible = "canaan,k210-spi";
>>> +				reg = <0x52000000 0x100>;
>>> +				interrupts = <1>;
>>> +				clocks = <&sysclk K210_CLK_SPI0>,
>>> +					 <&sysclk K210_CLK_APB2>;
>>> +				clock-names = "ssi_clk", "pclk";
>>> +				resets = <&sysrst K210_RST_SPI0>;
>>> +				reset-names = "spi";
>>> +				spi-max-frequency = <25000000>;
>>> +				num-cs = <4>;
>>> +				reg-io-width = <4>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			spi1: spi@53000000 {
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +				compatible = "canaan,k210-spi";
>>> +				reg = <0x53000000 0x100>;
>>> +				interrupts = <2>;
>>> +				clocks = <&sysclk K210_CLK_SPI1>,
>>> +					 <&sysclk K210_CLK_APB2>;
>>> +				clock-names = "ssi_clk", "pclk";
>>> +				resets = <&sysrst K210_RST_SPI1>;
>>> +				reset-names = "spi";
>>> +				spi-max-frequency = <25000000>;
>>> +				num-cs = <4>;
>>> +				reg-io-width = <4>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			spi3: spi@54000000 {
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +				compatible = "snps,dwc-ssi-1.01a";
>>> +				reg = <0x54000000 0x200>;
>>> +				interrupts = <4>;
>>> +				clocks = <&sysclk K210_CLK_SPI3>,
>>> +					 <&sysclk K210_CLK_APB2>;
>>> +				clock-names = "ssi_clk", "pclk";
>>> +				resets = <&sysrst K210_RST_SPI3>;
>>> +				reset-names = "spi";
>>> +				/* Could possibly go up to 200 MHz */
>>> +				spi-max-frequency = <100000000>;
>>> +				num-cs = <4>;
>>> +				reg-io-width = <4>;
>>> +				status = "disabled";
>>> +			};
>>>   		};
>>>   	};
>>>   };
>>> diff --git a/arch/riscv/boot/dts/canaan/k210_generic.dts b/arch/riscv/boot/dts/canaan/k210_generic.dts
>>> new file mode 100644
>>> index 000000000000..396c8ca4d24d
>>> --- /dev/null
>>> +++ b/arch/riscv/boot/dts/canaan/k210_generic.dts
>>> @@ -0,0 +1,46 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +/*
>>> + * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
>>> + * Copyright (C) 2020 Western Digital Corporation or its affiliates.
>>> + */
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include "k210.dtsi"
>>> +
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +#include <dt-bindings/input/input.h>
>>> +
>>> +/ {
>>> +	model = "Kendryte K210 generic";
>>> +	compatible = "canaan,kendryte-k210";
>>> +
>>> +	chosen {
>>> +		bootargs = "earlycon console=ttySIF0";
>>> +		stdout-path = "serial0:115200n8";
>>> +	};
>>> +};
>>> +
>>> +&fpioa {
>>> +	pinctrl-0 = <&jtag_pins>;
>>> +	pinctrl-names = "default";
>>> +	status = "okay";
>>> +
>>> +	jtag_pins: jtag-pinmux {
>>> +		pinmux = <K210_FPIOA(0, K210_PCF_JTAG_TCLK)>,
>>> +			 <K210_FPIOA(1, K210_PCF_JTAG_TDI)>,
>>> +			 <K210_FPIOA(2, K210_PCF_JTAG_TMS)>,
>>> +			 <K210_FPIOA(3, K210_PCF_JTAG_TDO)>;
>>> +	};
>>> +
>>> +	uarths_pins: uarths-pinmux {
>>> +		pinmux = <K210_FPIOA(4, K210_PCF_UARTHS_RX)>,
>>> +			 <K210_FPIOA(5, K210_PCF_UARTHS_TX)>;
>>> +	};
>>> +};
>>> +
>>> +&uarths0 {
>>> +	pinctrl-0 = <&uarths_pins>;
>>> +	pinctrl-names = "default";
>>> +	status = "okay";
>>> +};
>>> diff --git a/include/dt-bindings/clock/k210-clk.h b/include/dt-bindings/clock/k210-clk.h
>>> index a48176ad3c23..b2de702cbf75 100644
>>> --- a/include/dt-bindings/clock/k210-clk.h
>>> +++ b/include/dt-bindings/clock/k210-clk.h
>>> @@ -9,7 +9,6 @@
>>>   /*
>>>    * Kendryte K210 SoC clock identifiers (arbitrary values).
>>>    */
>>> -#define K210_CLK_ACLK	0
>>>   #define K210_CLK_CPU	0
>>>   #define K210_CLK_SRAM0	1
>>>   #define K210_CLK_SRAM1	2
>>> -- 
>>> 2.29.2
>>>
> 
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
