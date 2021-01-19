Return-Path: <SRS0=fDxE=GW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367A8C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jan 2021 00:07:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A928922262
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jan 2021 00:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A928922262
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=+JEWROTwbogsRxhaNrtQ2NJvNrN5Q4b45E05m+AuvCI=; b=TcjiKiAynaZsjz2Idgpb2T6qw
	oqyUqFYZRnZOXrDRwaQfGG1ZCpqaBT9fDwt/rLEp9W8512Li/DCQdP3uRue/3Q0baowRrJ4/TkHkZ
	Xgk18DtWc9WzCan+Bpes0WtiofrP5/scsIL0j/TWBBekoQWRIO4SKure0jiRAWFan4DeTIDiAuTrD
	ITEBC6aEb5r0EZfRRwLakXAelvwDMxLvnIiZQm/7iuu1J/AoqCp5yRU3Tz1uJWAGRSXN7t+y/TYtE
	YWqqy5BqvW7+V5KfoR8ZZl4PL3nepERpaao3pMVn033O5biYq5tKrT5Ob7fRO4VaLBrqWUf8qlUZ6
	RBgqMoj8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1eXu-000704-8a; Tue, 19 Jan 2021 00:06:54 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1eXs-0006zN-2F
 for linux-riscv@lists.infradead.org; Tue, 19 Jan 2021 00:06:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611014811; x=1642550811;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=xuXh1odUMv3ZCsbn5SuDcSUCyS555z4BPfv7fDKV+EA=;
 b=mADk6MnvSfUGSFL1AYuA3iQFU/RitGschi1wYd3ao+amOQTiQMBdOkUo
 5tuf9drM27OGsbsuBJvPZsGngp4bL9ptC5S4a4MP8uftSmxWmYBxKXhgu
 evbXILAsV6VcCbeHfcQ08F4uk8TVM+OveiDO97BBtZ7RYuftEzTQZJMDl
 nNR2KXU2I7kXk763pvh/H17oyJYoKKweMXuzBwoNS5yIKdUaNW4nwvG/U
 v7h5ybMyMGdJCCZR7CZAseJee3FNOt8f3iF3qQh6fJsHDD60QYBvr1A6W
 wf6s6JcMqInPMtBKXG+xyrkNHQFEICZPJlKvHyVL+jfr2UZQwKJYXMobK A==;
IronPort-SDR: dLRTCUR9LtW28Q3mMzmVbgyuv+kKysdm0YfWOwbPjfpa82vWKVC3iwSr4TR3wf+8HOcWvdx2XM
 6/gcLRQ7fNKAEOapLuXXQW0laMZRSlGm8d72BUd2EwGFTpHX1g1N9YUfmtAKQOLCXZAecg1ibG
 gPWf3RuiJ0p7MJi9i/kWavPMPO+qUSaaZEgn7vQNqaTlfvG71ByX7dxFdWA+AYCpMu6uidAWa+
 N8eWEvxSx2PjC6QOUDa5q2/dEqe9Lq9F2CtrlrYYBukcrVyRsBGBIjx6P24Qd3Dl81lgvbIyUF
 udU=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="157745505"
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 08:06:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YekRtpumMRbagG673NCMwkUGplK7s9TK31VtzNIpoqHBe8JbEDykoNcS3ClfJvkbPnyaexwws/LZiN+Pw0Hn5oEmLSWud6tUtWipwBLSf7xkYjXyl9BcB3djiQPqdpT6AvTGcLP1b7t/XwWlYIHqpXz0tQMmR/Y3gDT1qE88pWdzde8HI4i503SvObiNLOjB8Qn1XaJzD0FKZJ/cG6jf5G6p/F36+bLnFHHDGfKhx3013NWa6Q0dmYQWsM2gOaX/w1CWEnI2cEuggGXkyBaXjKdX+86w7viwmsWgn8Fx6NDVBUBRutpaEK/hFnc6R3W7QZWezsIJqLgeiReesPOSYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuXh1odUMv3ZCsbn5SuDcSUCyS555z4BPfv7fDKV+EA=;
 b=SHW9VKcUnH/gcEQ+MAIMc88bqPUDETxFKWLsjbh39Se1zANYZcB0lwUqjefZpnscoYWM5F2x7Hepwb8sMRxu+M9avaqbOq1SrogCj3KcZ/McAZGcKNsKjzmm2M5CWpp5doDDyq3pf4Cfx0SuNXtdYMhwqnLTE9xcRJ72cNktr+HdaUzPa6ja70e4L3sLGT2uoMvGxx1h8awy99WUF73YmI5j9MTwfGl9b6K19TthdzPt2zY6xLOafLeRvi9zAp9TJTAtW3F+VvngNMCifUDB66DtYjuLLBcDKczQS2xDDeAmHjcPp+EgXPYzzEs0wjl4DWDjL03o0kRom4V/v1ux4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuXh1odUMv3ZCsbn5SuDcSUCyS555z4BPfv7fDKV+EA=;
 b=blnypCkAp3FakVgekq7oeeQugAsSj7u6yTqGV5MYquwX0x3HEw7NbPEpusdD3pCcf68NzG0/77zocJdhSjj61Kalv03AC5OkqmPyHI8oVS4eF6JFRIW8F3ieDbkfk1hiAjIWYW5c+2qyY4yGa74zwCs1L7yKleO0VflA36QN+EM=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4529.namprd04.prod.outlook.com (2603:10b6:208:4b::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Tue, 19 Jan
 2021 00:06:47 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%8]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 00:06:47 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v11 02/10] pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA
 driver
Thread-Topic: [PATCH v11 02/10] pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA
 driver
Thread-Index: AQHW6H603OQs4bGY/kKjaT3KXrLhfA==
Date: Tue, 19 Jan 2021 00:06:46 +0000
Message-ID: <BL0PR04MB6514F31612704D9338EBB3F9E7A30@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210112010307.200310-1-damien.lemoal@wdc.com>
 <CACRpkdbTazK7yLPVe79SoneD+tdiXv9GPvN29dSMgCZkf8Pjbg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:65ee:945c:c1cd:2690]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6d71aabe-acbf-4aa1-3e43-08d8bc0e1cb4
x-ms-traffictypediagnostic: BL0PR04MB4529:
x-microsoft-antispam-prvs: <BL0PR04MB4529C8FDC8EB3ABA8D7F824DE7A30@BL0PR04MB4529.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +PFrCyGg6E/VDHZNgAu6qpC1zrEifgHFUSuPXzi/S7U486G73YnQz997ukv2kLFeEhygvHNtjqx8U353wfXsw6XgQqUR6eP44E/xE7N9pqitU2wRxZH7XzVKga1tJy2ObSTFbA5+sz8rbclGBu1ti1h6PdSZpfC+z+ogL40MYK226Hhc8vohmHyoEKHYfxaqaH1nOp4R1aUN0e8yALNAugOkL6X7ZD8FXWPwuXPvgHjAxCylwQvc2qb2AnO/nBOje37SiMnZVM3q8h3wqOK6Vv4usfUgEXGziv31wMnrsXAu8GCaMXsFlZfSbUqX0TNz1UKhz9SPagwMQ0GT0r/kdUv+bfcm8EjNweYUoX2LwFFexB6lOU7+978sG5jB8NM8KvX3gY9jAxCEW5BKRnPX3i+Ay8HYvjVEmvfWKkx7MHvjE6GkR21E3YpZ3vbXWaHxajHgO/24w7TE53NuNrbUtsKRqwPrJFQnaYfdRh8zfI0uRlVkpZsdj6RlRdvS/MKFSvEGw9Ot5oyhUmvWZ5J+5w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(53546011)(6506007)(71200400001)(64756008)(7696005)(186003)(55016002)(5660300002)(4744005)(54906003)(478600001)(4326008)(8676002)(8936002)(316002)(52536014)(9686003)(2906002)(66446008)(6916009)(66946007)(86362001)(66556008)(91956017)(66476007)(33656002)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?P5eCcHVVDyvcsW874XzvEZlohnI0j8VP0mpetFazAstY3WiaHTe/8pjV29Lr?=
 =?us-ascii?Q?fWAwhvdE0Enlg0mPFYZpup2ElY5Q5/cNyuf9JeCZ6DhTU1CBkDDGJjaatIls?=
 =?us-ascii?Q?/NvrooH7gxKm7adhaF1wghue6Jj5RO48MZiupGL37l+bUSJA6svOoAHFk8Ym?=
 =?us-ascii?Q?AadsVzhTjU1MSSxVb5qS7QUQXvYnJTWZKvwqcYrTcdcFYIwMHREcGaZxGS+U?=
 =?us-ascii?Q?DbcWi/WEInPVlJk1geQrZaId3akzITQq53pB9qZ+ZD8TIvV5ihZfyvC9/koz?=
 =?us-ascii?Q?OXlvCC3wej2Z/gweSM2uHtYdcEkPHIVEwWrrahqPpKXQRuC3CiVKr01VGTpB?=
 =?us-ascii?Q?8678lL/63PSZBR6eRXowWjO7Vh87VHZex9H96Jnc6nkAZ5k/Fk3AELdg2rwu?=
 =?us-ascii?Q?UxYLo9ds/qY1VbLpkP2KvJIlDeWVWordTqu/VRr0zuFLjLMmvpJODcxNqN0m?=
 =?us-ascii?Q?fpO/Xztlu4r0Tdfk7PDQSElG8YKOFJMh2s43kIbvTbgPN3+1rQajG5FNjtrE?=
 =?us-ascii?Q?t62RrCpaCCNnaejWD82uQxpCtrsTDX306xOuCedxMNDk5kMgJXHr6QWydeho?=
 =?us-ascii?Q?h1WuZ1DOsdHeH613zK4lQXsuKZhOxdAh6ogO8jZcw8ASul/NgL2igvzBKILE?=
 =?us-ascii?Q?8y+8QL5Wg2rOrlkrvnyGD+P/V2PG/bPigT10gGuuwCw9PrnRnYJVMH7E1fgm?=
 =?us-ascii?Q?tqcBwgYVkNBnKzG+tL5O48FVlWnV9VKMwu9SPxQvFH+clI2+yaH1QOBkELAh?=
 =?us-ascii?Q?o+cC6rODvh5Uso+iMOstWfSBtD4L9f1BL6/rA4DeZ9tOhGeFF09ir50kdFcb?=
 =?us-ascii?Q?Ppyn/T8/MKIBEf6O7omTsd6axuSbbiJXWb8UFcoeqba4n0RpuDfcfOzwKj7o?=
 =?us-ascii?Q?/EUbOqdSih6Gh31n3pUPSaDDwnIKwcqyzKIFqAdPyQJZsurCOmw+4MRyjjsx?=
 =?us-ascii?Q?D2lJ/kMeDg6ncKUIAyBaeqfEfBHCZ40R5xiOzqdQHSvBm3ydIU0hsVEolcNR?=
 =?us-ascii?Q?cAK/j8v6NMXFfZNfAwzbfcOf2+LYWDLYJ08ttGOx1RdkKoBdUyoNwgBwetxb?=
 =?us-ascii?Q?+9V7/cvnH/1Kf1ws1wBQ2Uh/JAUkeb9nlVzVxq1TxurJwvqpTefUhy82Eqge?=
 =?us-ascii?Q?Pp8RuFFQKVMrBiZfMgZ4+qawodVc2bqnZg=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d71aabe-acbf-4aa1-3e43-08d8bc0e1cb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2021 00:06:46.8968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UxysaEAwYTteyclJ3h83OjFFSpLDRwVtKKcVuSbqavui9elmE2zFHujVzwxEnYeICt/MMArFRJqW9NZPc1moJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4529
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_190652_236053_F400BE7C 
X-CRM114-Status: GOOD (  11.05  )
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/01/18 22:33, Linus Walleij wrote:
> Hi Damien,
> 
> this looks all right to me.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks !

> 
> Shall I apply just this one patch to the pinctrl tree?
> 
> I think the line that touches arch/*/Kconfig should be dropped
> then, that better go to the SoC tree.

Good point. I can send a v14 series that does that. Or simpler, if that is OK
with you and Palmer, Palmer could may be take the patch through the riscv tree ?

> 
> Yours,
> Linus Walleij
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
