Return-Path: <SRS0=PCma=HN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5C6C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 02:42:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AF9064E05
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 02:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AF9064E05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=6gQD2/rkQKsEJSgSlIlIQyBPAljmyzrBAxs+9KSg9Rk=; b=axojJFlB0tkYUzeBQNqtqC3oU
	oYr3HM010pHAfVWInqJ6sdYxOcCvSUsorzkeh//24kNlUezEhIZyMIxfeKUNzOb8AonuadcRE4rVz
	1evcj6v2f8FTxZAjrzxxibvmX/uKE4eP2P2JJRzTLWxVeRowVMIGC8PTa3UE3nDLEy3pv94xZdeqH
	6DNusJ6uvHAAqa1u5PLleiLP3o4h86ejIi0K3APkvCRV1tGuYzwD+HiwTZVO+1LaV4MbCXR+RvKtG
	qhStTDk5FVlBpQcIfqdM/SQPhAJlxLXDPTBzmGaYAGOG4DNDT/PBEXkpRes3Ez5K0ZvMDzV17/oGO
	0JNFUOGiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lA1vU-0008G4-4g; Thu, 11 Feb 2021 02:41:52 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lA1vR-0008Fb-Ir
 for linux-riscv@lists.infradead.org; Thu, 11 Feb 2021 02:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613011330; x=1644547330;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=qW0qXARKPuuF+e8afDL3LzwcTLqA1ORZrqYpJNqDvpQ=;
 b=mAiKhghIhunrGi+PTPYAMkVWEMZ+bG0DwTfZj5toegRghmXSeLHlOoc2
 iFwmvSVTD9fgWHIo/kdKtAk19dvfFqFdTKCaLNqfJrZM8kyFTSIQ3dSbz
 8zTATYuo1FUAA6y1thGLFq49uMLhLLFX9c2Fm1Oj2sOU8jjLPBWYRBLe+
 ToBNnYyjFaFPxBLsiU/u6UW+4b7lOfg1Dj0i+FZcj+0AE84N0HiUelOt5
 0oBhlTi8Ascy0wjM7ZHvKgWqqUKmj+wEUPTZ4weLdyuLSMzAqL0u0kGl8
 9gwfewnFsrXbmhrdPAxQ+YXoNB2sH4J2x1McV06AP5caGN0AUlNcBx669 Q==;
IronPort-SDR: 8DJ9XS35R6qT/C9teq0ywi33ywvVLVZ+GzBMwdfBoNI53hEs9Szg+yCuUtkkeLCM2PYQ10TyCD
 wbvHzV/wH0F1sh5zYVajg8isLjvwhupjFdrOCOGT0/pVr10oIdkP+Z6GAR0oQKQZGcsAgLf9af
 c4JlZi0rQYgp2l16PihnbD8l1rlSuy8u8yhaCZMgYLzm+jVQdZkoMamvp3rTFXg2QOjNaM4EFS
 DQ1KuFJacgqhOFHHRMqHSawq9k2ICRAx/r69gvnBg6DDbXKoEomxpFAuc/kzcyP1dqpLjhSrV6
 MRY=
X-IronPort-AV: E=Sophos;i="5.81,169,1610380800"; d="scan'208";a="263840802"
Received: from mail-bn8nam08lp2048.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.48])
 by ob1.hgst.iphmx.com with ESMTP; 11 Feb 2021 10:42:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRdwMjWofB8yPT5VQbYswLu5V1kQ3rDbiuJYcxsBPcK4sZXOdxt6bpkf6XTTgBaA+x/wqZwzBhHmFbBTTzJ72sxcq7MToHsaRdo6JMKeQmXfaA+qxV8zfytnx4OKc3WpHcE6oYDV/u8tUcabAnjklqUJUJMU47zYoJ1H3no/otGTWuGA/WbMTKpnKWt1b0D0qp4+tEQXpLF/I7wzx6yuNsMSQ/UrjXRurC2r6fo/J64Kmd9NsIfkVkwRqcEV7ryyYyKXIeVp4P58T7OF5HaD2R7SXDlLhcmPaygl0/MbHOx9HgYF1KTqIic1/za7KmnXSIvnhSbv1oKwK0ScDHIdqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qW0qXARKPuuF+e8afDL3LzwcTLqA1ORZrqYpJNqDvpQ=;
 b=IFzpRZOxQrA6esskBW3avGCbUrp9RkQLmoHq1ONyxavaDK60ugcZvHR6x6RzMv30ldDDbBfcQc99H4EcvLHsQaYOeUP2jRmK3wBcaJYZuPUbevEJWkb99hAiPcn00jjQEpWI0RZsytXlfo3A3spBo6v71oy2DUtAe4KvFd/aWFZr9phMLGOJdzP9G4pwTgjRJBa7DvZnQkoLAbgDJ9vljKPLtAYEFcklsROVL0GzGoPYEUESA3Gj8hNizZXyF6h/05R900U/u/jT75s0Ht5phXPw2J0PvhlIi2l5KENrrRql0Z+KnWrWU+pY47LgfUXIsJZwNDLxmHaXUBuu19eiLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qW0qXARKPuuF+e8afDL3LzwcTLqA1ORZrqYpJNqDvpQ=;
 b=Fry8v5VOaupq8tnJkMd5sXZWH0QhyQE5R8oiIF44q6NvMkBXptSU9Bzd3GN3BEKykKoZcYOK1+8cYWigLWJpBmDmM59LE7YneND2/9Hno4rKtDA3ScIeTm9NtA5uSziY7Xg4DcE8jPvtaMb/29r8S/y1NOqKEKJ+9W8YscHVIoM=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6352.namprd04.prod.outlook.com (2603:10b6:208:1ab::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Thu, 11 Feb
 2021 02:41:46 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%7]) with mapi id 15.20.3846.027; Thu, 11 Feb 2021
 02:41:46 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Stephen Boyd <sboyd@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v19 01/17] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Topic: [PATCH v19 01/17] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Index: AQHW/2n3wc+Wqmw6uUaKB4SLUckc0Q==
Date: Thu, 11 Feb 2021 02:41:45 +0000
Message-ID: <BL0PR04MB65141208E5636BC15ADD4A73E78C9@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210210050230.131281-1-damien.lemoal@wdc.com>
 <20210210050230.131281-2-damien.lemoal@wdc.com>
 <161301087300.1254594.18438542581140302342@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:4d23:6652:258b:81d8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cdeb2d1f-7f0f-4778-4075-08d8ce3692e1
x-ms-traffictypediagnostic: MN2PR04MB6352:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB6352B1328699002E60F36F87E78C9@MN2PR04MB6352.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KD5WRgmLYuCwk3h+LqVdCr/4ucr7GWbUoOY4veixVEWBw5dR51WVk89O2Nj7QRV8P7ZspJ+z6cSWXFtncTIJAo4qEAu+FcJJ9wdirTqQk4bk2hqjOpV+qarSmRQXVtirB5fohRlasVBGCscrBoMY8b4Uc0bHdK2WyRbGvHqhi6ev1/Ky5Jlc3re0faH6XcyQyU2zFaxIKn8K9t/HgJ03M0770u8/9CMnUIMOKsTlG6if2Bg/7xz6fkwTGtHOqP107exViclcXGM+uaz7Zy23uSCG1roi4Xe3b8ptr0IuDwCJT20lALS5wPzc7ZeHFRyABOwG3ENMjfb6l1Y6WmhpaSo3moaHLI89dfWErkUBcJMSqfMu/Q6skLVk03CmRuz0SIvoPY1ImvnAWUWPBO3MYwSz6auFiSJkCn8blSb/WIztBA2XTgQswjoLlwLR7JeY3fNIgQNmCLljPucRBPqEvZyrtmIjAsseQm35jMxhmXhRpxgJVtjmkv/JjCEGivAopsI6Rs1NVVgnuKtyn5kwXw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(7696005)(5660300002)(86362001)(478600001)(186003)(9686003)(8936002)(66946007)(55016002)(316002)(52536014)(6506007)(53546011)(71200400001)(8676002)(2906002)(4326008)(110136005)(66446008)(64756008)(66556008)(54906003)(66476007)(33656002)(91956017)(83380400001)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?mV6/lBwdbBEMpe8EU3UXftGaAaVu8EnLgP5fqkuekTEfn2hkv3BIEEE/EQys?=
 =?us-ascii?Q?EJhwJ8KY4UdwE6J4+nADB6OxwtHfDOhHnUSiOmbybVNWeXERC9hfyUZcjk1v?=
 =?us-ascii?Q?ZRfk5Wig4tvwN/mYCfnqxhAaVZp59wCgKE6OL80PYJd8ahvzBjSb0IbehL8v?=
 =?us-ascii?Q?KaHAUg3uIJrwFXD3goQMkzlIf8udqUOxo99XKB9gOx3UQuBnblBpTGpkzRlp?=
 =?us-ascii?Q?VM4kdnIPwBoS+u4cSWZZoGwgwOIsuYEbXZQ5CWJ3nlHcktD/cEnceU6FyyEi?=
 =?us-ascii?Q?ocmR5ybbue3Co7PfXZtLA9bdnjqsGLEMzGzGzPPbXzTlRXl5xahTys8Cxcoo?=
 =?us-ascii?Q?y8ZUpLXLzgmcK7X+Phx7NWZlXCOC3RjavCIRMZRL95LjTwjJIe83OlKWP8QV?=
 =?us-ascii?Q?+RN3TF/Anz5zWbCsfZazX4sO7IUeSwrGHIJErl3ydLvX73J2BGNDMH+6Tfnb?=
 =?us-ascii?Q?4iCOdVkxCjQej42Z5l5Qon4/lvwae/11J275T1sgO8Rb65nq8kTMtX8xhwPG?=
 =?us-ascii?Q?zb0mHY/8CGvsR9xDuLw/2spQ9TDGMTj5Le6ZNuP1rgpmHkUpgzKiBojwPRYx?=
 =?us-ascii?Q?KkrJPh3zeyCe3m/ken5wbcFO9nFg9CHh9liPU/PWBopvoU68jahNjBfuSRTG?=
 =?us-ascii?Q?7nGdl8ENVwMJ3zM0917xrPWzzib6nfiK1dT+dOgj1GbSFbK5rHZolHbHKdp8?=
 =?us-ascii?Q?HLqMjxAqtmnFgOCGkDQZEEg7bz+pwMHseocuLRE8jqcpZ8vFkIKUC72Q70NE?=
 =?us-ascii?Q?aOurybECex+LZIKZ99KcoB4ADCpYG7tge264SM231j8cF6R+UEQEpGakAUah?=
 =?us-ascii?Q?LBBDzjeohUiFmZOLQszWKv3Q8Vs2FoSyc1Zmp/FxoxQvZg6eq/Vf93cFSHhT?=
 =?us-ascii?Q?GJ5BNF5EqX3YVeiw3tk8bk+p+sKIbLVWOp4V7Y945pH3jz8wrWR1bbslOf8c?=
 =?us-ascii?Q?TTDgcdZC64v+rAdo3Bmw54anUrU2RM1EOv9iZ5rHjlhXzDqh+LgW4AZwMuNB?=
 =?us-ascii?Q?nh/9Ti96bmv7N+Yck99/3p9PlhDY2WYnGYFgRQtIJlaA3neLje0aJSwAjpqd?=
 =?us-ascii?Q?xp5A7dIWAGI0CeujCoSrQmuPmnq6fQP4gr6YvlXPPhKnp5+pOvGSN3dCE3bR?=
 =?us-ascii?Q?gUMz1DtNuoRJ+3k5gMRyUnZ+3ucmgDkTBXigSXfYlysU2VXbISpU4fkSiE13?=
 =?us-ascii?Q?t5uMYHND6c6zbBAVAjJE2cIOeNYWXESgTjWS+AQA6YO1Bj6DDls/zVS4RZlT?=
 =?us-ascii?Q?9MU1JYi8v1mk1gOlzZUhk9TkV0wvgmMtKQkcWR6WcxFbcpuK2JXEEBa+TdlA?=
 =?us-ascii?Q?XSUL2jKpIdHnC65Tv3i6pj9U17a4LSxvrfrt3f3dDN6FJVMOA8+6ibd/XL2z?=
 =?us-ascii?Q?WumjZrkysjKCPLvxoVGAwRj6ZcjXQUvCfPAKeAqIxaOR0RZWWA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdeb2d1f-7f0f-4778-4075-08d8ce3692e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2021 02:41:46.0009 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wfg2SbAqlCnCMI7NvZW5E3AV4kXoeexc4Z+MSn11qspglkSskzY4lpk3znxadPuFxb53fD725+l5RPFnsgsQ5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6352
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_214149_767811_7AA276FA 
X-CRM114-Status: GOOD (  13.23  )
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
 Michael Turquette <mturquette@baylibre.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/02/11 11:34, Stephen Boyd wrote:
> Quoting Damien Le Moal (2021-02-09 21:02:14)
>> Add a clock provider driver for the Canaan Kendryte K210 RISC-V SoC.
>> This new driver with the compatible string "canaan,k210-clk" implements
>> support for the full clock structure of the K210 SoC. Since it is
>> required for the correct operation of the SoC, this driver is
>> selected by default for compilation when the SOC_CANAAN option is
>> selected.
>>
>> With this change, the k210-sysctl driver is turned into a simple
>> platform driver which enables its power bus clock and triggers
>> populating its child nodes. The sysctl driver retains the SOC early
>> initialization code, but the implementation now relies on the new
>> function k210_clk_early_init() provided by the new clk-k210 driver.
>>
>> The clock structure implemented and many of the coding ideas for the
>> driver come from the work by Sean Anderson on the K210 support for the
>> U-Boot project.
>>
>> Cc: Stephen Boyd <sboyd@kernel.org>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: linux-clk@vger.kernel.org
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> ---
> 
> No change log :/

It is in the cover letter :)

> 
> Minor nitpicks but otherwise
> 
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>

Thanks !

I will address your nits in follow up patches. I really want to get this queued
in 5.12. So not resending a v20 :)

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
