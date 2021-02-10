Return-Path: <SRS0=bbt8=HM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7F3C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 03:15:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77C6464E3F
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 03:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77C6464E3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=E/ylyb1PVaG1SIuJ6NnSQ81mT7f4PyxDEB6oIohds6k=; b=y6QzYFnCIOF2LOJ9L6GVXPulJ
	ezk/SowU3jyTuRnZNP4WpeirVUebVbaXHhjQ+DGAdiOx2S/9ITi+hHZSc5pg2AUBPXCa4SQ3gZhcc
	hawAh3Qixg31AYymR9xQetjl4XClCuUwH/MgJNs6OaWqrLvfEpI0kJm+GFIgDSbAYdylH+fnIo08u
	EyO/o/zXgIaqRNie4nvExsr6kB+6WmuXlB9zsl3xbRwPFIPhBHpiZLYvH4dH4+3LL1v+IzL/Vy4UF
	rMDj7Mt6myTkj6GnvinoaHWHKeD7AeZoNGLMiGwuFlCTlWq7fc3jMbve4w4U9lLGRmtmqZL00LjoJ
	xMWAzq8Vg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9fyh-000697-AQ; Wed, 10 Feb 2021 03:15:43 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9fye-00068b-EM
 for linux-riscv@lists.infradead.org; Wed, 10 Feb 2021 03:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612926940; x=1644462940;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=kw9QCcZ/M6ipzT0gc8Kr9cvPS3S2CDHNcC3RgRFkYqc=;
 b=gjNS3HWnRwbnRwoGery0PSSXANuCS8hk7UQsLyEA6lkcEcx5O70xwAb5
 K3cDMnsPozE161XhNqsnX6P1MQDo3FcDEq0lj9zdUeBjaCXd8YY9AAbnO
 DNAeVd6ZoQe8WV5JxKi5ZzxrSVT5jUwdjyjq1vuNiYvdyVuU5Mc+190Vr
 qaXDjRMgyfwHxUTgocFLcpoPJV0tKrlGmNKwAOJHbaehYr1CMGBmLAkhB
 FoX4YKKvgPKaR1rpCTqbbC0z9a7UwgsmzaQcachN19GPp7DBwH+0bGm7L
 HSYoVfjPT2AYYNU218VtdE2tFB3HENcXg8FptAhiIf+Gk/ni6jxM949E7 g==;
IronPort-SDR: DIc+zRCw0EXAIETYsyrnuK98Q4PZ9DmbQ27bouIkBM8JbsUI4kHZZt+a6eJvLsy8ZpeBnP7zX5
 9zbasfrCB8O8lF5wYA05Qy0hH3nwFnhVW3ZoADAak3HSUB6kYe3j+5TBQHfvl/xpRfvsFJYyr1
 jjH7AkwPPag17A5P7e0Kv0TsEVonU6Grby+jtZkJwjjCbR5nGV3ygyAxWbfaj6qsZ5bX0E/R+y
 iFWwUjryJnZLXGBo0ov8y2B1dIttXNOrNw+k09aJ2dJT+0oMzBvc7QrrK8L2kWWBXavn4163b/
 43U=
X-IronPort-AV: E=Sophos;i="5.81,166,1610380800"; d="scan'208";a="160769533"
Received: from mail-cys01nam02lp2053.outbound.protection.outlook.com (HELO
 NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.53])
 by ob1.hgst.iphmx.com with ESMTP; 10 Feb 2021 11:15:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRx6PdWSzWATMvuRcSHWs6AdrGn5Kej96t0WS8/oRPBEWNSL1D/Q3XtBcw+5i/VGNa5/sbutF/868gTFoYbTUAJj9czBBqQlGoBGiHXKdph+SANSywSpy/YLyo8QeZ6in+x6m7VF1OnWov/Xa12H6nvmbNflse15EYMMkmw/vWRrv7vLpm3G9KIzI7LmIiGbhsVSymB20n4BiQj24uQk3TJibYPBpnsdGcsEJN0MLZdM1KdKWLx4G5txBAQFAX+veQmiJPZbvbwd5qPP6F4cWJ5GSkBwDf+v6GvLe0VjKsgR4JmzhzPthxXDa6RT8rqXJaPvuN/5luLLWAk+yDg6AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbrsFY9pnG4lzkp3qwLwI3g5oCZat0NkVd4XXYi9jZQ=;
 b=VcF01gLVn6yy2zNpsoYtTLPn1ZdVYeaQPxU/RmP4V/fo7v3e2bpfeH1btUffTg6K3Pm6FCePl41aoc8vdbfa2oiZNz44igF52y/5EvVahqmpLEYz0Sl7yLtCulUAl2tcrRoHmGpV7OlEft9ksXfUsIe51ee3y3HrGOU/hN76RXttuf7Bw3VT3yfvXyCOAMvONNuDeDHexgylJkI+jQ5wQ3Ho1ZUpbL1lqqxCs0xbeIEXxXmkvno5Q92IXvbkNvJOdPrN6rBJPz2fLnrzUnttrDUnM1fx9Y9klEKjVGhORd8/5B5pr6V0swkXXCOmNBNtjLNakAi5qr/XRNFjLFYBdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbrsFY9pnG4lzkp3qwLwI3g5oCZat0NkVd4XXYi9jZQ=;
 b=s9NDpJzvWYyf2FI5HmJaA9FDizblwH/6RLElhiFujOke5mkZy5BgYgRdwUgqGDLpsMuD+lwbZWl+PO9iidxQGPgL8HqrhEjozIo+CHOaQ83WDltuka+N9Zr+K/Uy20pPNjT8H5O5LbvZ4+s5JoWq4IezCL6vHyoXYYaT8/j2/KY=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB6484.namprd04.prod.outlook.com (2603:10b6:208:1c1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Wed, 10 Feb
 2021 03:15:36 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%7]) with mapi id 15.20.3825.030; Wed, 10 Feb 2021
 03:15:36 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Stephen Boyd <sboyd@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v18 01/16] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Topic: [PATCH v18 01/16] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Index: AQHW/t9XApJD7mlFuEyRKf7oQMzIIQ==
Date: Wed, 10 Feb 2021 03:15:36 +0000
Message-ID: <BL0PR04MB6514E2ED802BAE7E6350E304E78D9@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210209123014.165928-1-damien.lemoal@wdc.com>
 <20210209123014.165928-2-damien.lemoal@wdc.com>
 <161292028178.418021.10953574123293354986@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:f420:fabe:ea5e:e152]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3daf937d-a70b-4c92-c115-08d8cd72229b
x-ms-traffictypediagnostic: BL0PR04MB6484:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR04MB64847516FAF8EE1B8BCB385EE78D9@BL0PR04MB6484.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l+dKE0Z06WHdg+vlxKKGcoMzKOlqD9pULFbm5KE3E4F1DgNoJVBX/AKj6Kb7GmarxNJy8+PvS+VJjS7+tQxT/Fzpi+VEJj5qCSgcpyQcrKKU2NOmKUNh7y+qPYpFYVroMOvZifVkKSzOD6WIcdF62lnhfwEX2uB7VTB8s8/eLVtUV3N6UeP4QXwLF5zmhay6hIi7DHiH54KgFaS8MY4ymyhBcd3VKFHmbk6534/fVHWpUK88y8s0w5rYUZixXKvDbbNO9FOqoAghYo54RUGYFTwvXKDzKqhQL5FhmCpFZgApDESCu1rkp1FqOw0hsIQ2BQM3IVi2539FKZC2zlthNyCZfneg9n60Bh2MjWHZWHyq/dAh9aR4++EiIMUb/bszQKwZl5jK35mtKly1ZSdgQa5i5vy9OdCowyeLSZDRsFD2GxOUxVWTPEvB+ol339kj5/GUpiGmGOK5kBVb+PAVeTpVa3m3X7pjDB+hj8H6UuxQXU/y4HILD9CxXspybwtbD/y5NUWvJJGerBuMuOUncw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(53546011)(33656002)(71200400001)(186003)(86362001)(9686003)(8676002)(110136005)(55016002)(83380400001)(4326008)(54906003)(498600001)(5660300002)(52536014)(2906002)(7696005)(66476007)(66556008)(64756008)(66446008)(76116006)(66946007)(91956017)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?53AyIxBU++y1v5jgbGWkPREqsTLu6BTAA18D/YORf9TI5GTrHQBcFL4jdtyY?=
 =?us-ascii?Q?ZI2T9gXNA0KcWzKogm8VIx13TdxrLWwxWkIpYPR/YjnnhSOneudKHpH+84gx?=
 =?us-ascii?Q?gaDAXcyr3eh1dru9yGYdfyAELY4XD5sImrapjpG/DGHnMv5gxZcTF7H1wzRq?=
 =?us-ascii?Q?EJZLFm/d9nojoIvOBy2dyQ+DXtcLNUv201TeOqz5r5nKhXvaWFOQ63dztpbH?=
 =?us-ascii?Q?VrpbG9aF1LG/5/sScQZVy4sEorBNJjjy8geqRYmdI6aTXUxGOH/Z9axwh6YE?=
 =?us-ascii?Q?eUgx7WCMtTa88OUy2VG4Txm6W5GhVBc78v8daxByNGN92Dr+FQjwSu3FjMaR?=
 =?us-ascii?Q?8Dmx9ffJUdGA6mzMcm7esAa2yqXVQqROdKRGpphFhH7W0FOBCCIC7hpa/AiH?=
 =?us-ascii?Q?4LW5WHefmkYHRBHzKeM+KXycDgUXgKc3v/7oSbVr6gTdPZWPMkbPeUNP7bJG?=
 =?us-ascii?Q?/+mYU34jiA+cJXe301cNmDOdiA29eurzD8fdlMEPctFMI0xBHyVw325l/M18?=
 =?us-ascii?Q?/r8w1xlDbSmTfzCKiFNUgY/UPH/AEqIhpgZmn1Jpj85Zz3BrSvBkExx0KbkS?=
 =?us-ascii?Q?oDBGKc1cX7cPF5miJvq96DkklA8WFBLW6AMvUTn+vYbZMM8simyT1sY5uct9?=
 =?us-ascii?Q?XB65W3ozyjL+BhifmyFz/oytnMgpaB+eWaCX5Ra5dyIFSgYqUZjgGmi24Ttf?=
 =?us-ascii?Q?TxJqXTbr4+Ycaq7gyzH8jD4Kpin8r9izyF0Ggt5yodW/OaXsabQtNsBW6ou4?=
 =?us-ascii?Q?W7LdugrFoD8Vg10ikNg/w86Q+IK40Ef8nXhiOZSiiWoXrasOaWZcQeYRNjGh?=
 =?us-ascii?Q?MdEQgxSAaPI2RHWVji4MivbaJgT9WvAakcjwavs0yYwPX38EHKudP3Wog0O6?=
 =?us-ascii?Q?2qQvS6SENZ8SsUqOj+Ejz9jrtG2H1QBVosoII5KjkP7KKBqapEgXOWxpAgJp?=
 =?us-ascii?Q?S5iFAvG5i6ISxI9+j0GgtubkILvNpd3kWiu243x1bQPWQkLuYEjwfUeFbbZ2?=
 =?us-ascii?Q?IHgJLSmT28+YJ1Aim0xKwOTd8TO41XdPVZokA3taLPixgW4kCSiICEKMqyzw?=
 =?us-ascii?Q?wBKDuMoB08uAM8LP3ifm9Enm7L7Evpp96qPo2KtXmgagQ9jziPBJBkk5E4/V?=
 =?us-ascii?Q?4DH713aa+B7l+6jIjsx75DhhfIXHdeNLTI7MkC3670LU+ebpwRIFON6G5X/t?=
 =?us-ascii?Q?H/9mK5ieVeOkneISNg4PHlKiUZi12hZ4MqJeueb7UFJxHmxgECxwYz27qTqs?=
 =?us-ascii?Q?eJ/QHy/7HXrh2NNYHyh2FeSytTXwmeCWMoFRuURY4MkosVwS1G4O4idRbwWF?=
 =?us-ascii?Q?8zowkRPROIZctyvWxINNYIBvdy2ssk6y6QsNoL5rQdcGiyrY6jn1e/+BuvLv?=
 =?us-ascii?Q?Kj/Eq3crc/m6DzYUQkfuv8T5Mc6vA0+UfP3Lo1BXZHnFprDfxQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3daf937d-a70b-4c92-c115-08d8cd72229b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2021 03:15:36.2349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cg5DR8nJC9Kco0qAOEeBassTjxv2DTj/Y7PwBQnr7aOGm1OObfoR+EjU+lgCY1Ht9G44bcjKmmM5hESISqd+kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB6484
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_221540_845958_14122121 
X-CRM114-Status: GOOD (  22.03  )
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

On 2021/02/10 10:24, Stephen Boyd wrote:
> Quoting Damien Le Moal (2021-02-09 04:29:59)
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
>> Reviewed-by: Anup Patel <anup@brainfault.org>
>> ---
> 
> My inbox has this one patch multiple times and no changelog here. I also
> don't see the cover letter, so I guess I wasn't Cced? Can you please add
> a changelog so I know if anything has changed?

My apologies about this. I forgot to CC you on the cover letter. Will do for the
next version.

[...]
>> +static const struct clk_ops k210_clk_ops = {
>> +       .enable         = k210_clk_enable,
>> +       .disable        = k210_clk_disable,
>> +       .recalc_rate    = k210_clk_get_rate,
>> +};
> 
> From here...
> 
>> +
>> +static void k210_register_clk(struct k210_sysclk *ksc, int id,
>> +                             const struct clk_parent_data *parent_data,
>> +                             int num_parents, unsigned long flags)
>> +{
>> +       struct k210_clk *kclk = &ksc->clks[id];
>> +       struct clk_init_data init = {};
>> +       int ret;
>> +
>> +       init.name = k210_clk_cfgs[id].name;
>> +       init.flags = flags;
>> +       init.parent_data = parent_data;
>> +       init.num_parents = num_parents;
>> +       if (num_parents > 1)
>> +               init.ops = &k210_clk_mux_ops;
>> +       else
>> +               init.ops = &k210_clk_ops;
>> +
>> +       kclk->id = id;
>> +       kclk->ksc = ksc;
>> +       kclk->hw.init = &init;
>> +
>> +       ret = clk_hw_register(NULL, &kclk->hw);
>> +       if (ret) {
>> +               pr_err("%pOFP: register clock %s failed\n",
>> +                      ksc->node, k210_clk_cfgs[id].name);
>> +               kclk->id = -1;
>> +       }
>> +}
>> +
>> +/*
>> + * All muxed clocks have IN0 and PLL0 as parents.
>> + */
>> +static inline void k210_register_mux_clk(struct k210_sysclk *ksc,
>> +                                        const char *in0, int id)
>> +{
>> +       const struct clk_parent_data parent_data[2] = {
>> +               { .name = in0 },
>> +               { .hw = &ksc->plls[K210_PLL0].hw },
>> +       };
>> +
>> +       k210_register_clk(ksc, id, parent_data, 2, 0);
>> +}
>> +
>> +static inline void k210_register_in0_child(struct k210_sysclk *ksc,
>> +                                          const char *in0, int id)
>> +{
>> +       const struct clk_parent_data parent_data = {
>> +               .name = in0,
>> +       };
>> +
>> +       k210_register_clk(ksc, id, &parent_data, 1, 0);
>> +}
>> +
>> +static inline void k210_register_pll_child(struct k210_sysclk *ksc, int id,
>> +                                          enum k210_pll_id pllid,
>> +                                          unsigned long flags)
>> +{
>> +       const struct clk_parent_data parent_data = {
>> +               .hw = &ksc->plls[pllid].hw,
>> +       };
>> +
>> +       k210_register_clk(ksc, id, &parent_data, 1, flags);
>> +}
>> +
>> +static inline void k210_register_aclk_child(struct k210_sysclk *ksc, int id,
>> +                                           unsigned long flags)
>> +{
>> +       const struct clk_parent_data parent_data = {
>> +               .hw = &ksc->aclk,
>> +       };
>> +
>> +       k210_register_clk(ksc, id, &parent_data, 1, flags);
>> +}
>> +
>> +static inline void k210_register_clk_child(struct k210_sysclk *ksc, int id,
>> +                                          int parent_id)
>> +{
>> +       const struct clk_parent_data parent_data = {
>> +               .hw = &ksc->clks[parent_id].hw,
>> +       };
>> +
>> +       k210_register_clk(ksc, id, &parent_data, 1, 0);
>> +}
> 
> .. to here, shouldn't these all gain __init?

Yes indeed, they can. Fixed that.

>> +
>> +static struct clk_hw *k210_clk_hw_onecell_get(struct of_phandle_args *clkspec,
>> +                                             void *data)
>> +{
>> +       struct k210_sysclk *ksc = data;
>> +       unsigned int idx = clkspec->args[0];
>> +
>> +       if (idx >= K210_NUM_CLKS)
>> +               return ERR_PTR(-EINVAL);
>> +
>> +       return &ksc->clks[idx].hw;
>> +}
>> +
>> +static void __init k210_clk_init(struct device_node *np)
>> +{
>> +       struct device_node *sysctl_np;
>> +       struct k210_sysclk *ksc;
>> +       const char *in0;
>> +       int i, ret;
>> +
>> +       ksc = kzalloc(sizeof(*ksc), GFP_KERNEL);
>> +       if (!ksc)
>> +               return;
>> +
>> +       ksc->node = np;
>> +       spin_lock_init(&ksc->clk_lock);
>> +       sysctl_np = of_get_parent(np);
>> +       ksc->regs = of_iomap(sysctl_np, 0);
>> +       of_node_put(sysctl_np);
>> +       if (!ksc->regs) {
>> +               pr_err("%pOFP: failed to map registers\n", np);
>> +               return;
>> +       }
>> +
>> +       in0 = of_clk_get_parent_name(np, 0);
> 
> I'm still lost why we need to get the clk parent name here vs. using the
> index approach and using clk_parent_data. There were some comments about
> #clock-cells which didn't make sense to me. The fixed rate clk in DT
> should have #clock-cells as it is a clk.

It is like this because I could not get your suggested approach to work. I am
using clk_parent_data[]->hw for specifying the parents of the clocks registered
by this driver. But using this data structure, I failed to figure out how to
specify the "in0" clock as a parent without using the clock name itself. The
other option I see is using fw_name (I do not understand that one) and hw, but I
do not have that pointer since the clock is registered by the common framework.
What am I missing here ?

>> +       if (!in0) {
>> +               pr_err("%pOFP: undefined fixed-rate oscillator clock\n", np);
>> +               return;
>> +       }
>> +
>> +       ret = k210_register_plls(ksc, in0);
> 
> I suspect the 'np' should be passed to these functions instead, and then
> use of_clk_hw_register().

Done.
I also addressed all your nits. Thanks for the comments.


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
