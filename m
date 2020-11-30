Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C66C5519F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 07:27:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4CB520705
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 07:27:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PytlY2LF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="dEOf2uaQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="NgsS0D75"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4CB520705
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=qo5Hz4pAd6ClBcLtG2u2HKJhuV2EfVuImkuAJhJ+xHw=; b=PytlY2LFXr4o71bNBDtLQbBkM
	IEcYKD8z/csFbs6HLlwEFfl3m2aaXQ7CEHLaFEOsvfJggb61hftdmp2NHMwqLpATAaU8UphnzkRN8
	tSWFzZwnyjoWAUS7tICPzxySa2EAyhu2nIcN3sWKqLiPFJK81Vtuoa9KfbcFcUcSSzLdcZzex5Z0Z
	Z5wbgL3gHC12n2JmfHN+Ge0ZClSmQy9w8UWDijlNjdDJf/CEjDA9Q/XDpobJvmi3MN43GFm6d+Diw
	7zFmLcdGzudKn0+WD54MROUomTUpPmS8JUmPwHjs8MygWR/jBbHSBWznpEJKw0JrSN7ffH7461AiK
	BhArSX1SQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjdaW-0005lp-8P; Mon, 30 Nov 2020 07:27:08 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjdaT-0005l4-2E
 for linux-riscv@lists.infradead.org; Mon, 30 Nov 2020 07:27:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606721224; x=1638257224;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=Sn+sXuqVjpmHrWbzF+/IML/GzclRyEMR0qtiqewx7mE=;
 b=dEOf2uaQNRySrYKblqkSG81snJztuplqJ/0KvIYZ5WmfBYn94hmSnHo0
 q5paCcvgevL8djpH40JgFom1Te6fVZrsMbhoX2L5/p2t1j9KlIdocywke
 LqPwh83M+RvTsoO1snuUecc/Wm4LdlLQoqdYiZdZMMhfJC3JMvcTMwczQ
 /SmMpqbpiVz3DU5nGPwX0EPHgdFU4tuvH+XHCw/sdKXFBuLWsJFp8ctIR
 svTT6DN5Zo1D0GFy6rEp8y4z78Rvzug7zHDer+HYUuvO4KzDbJUS5mQIr
 DAd24Wyw3wJfmMsD3cJWyd06BjVEtjSLlbdWo5KB7VpRW4ooaXOKFdTpi Q==;
IronPort-SDR: xK35SajW9opJCCjgyZn03+gOLsFFQw0fgxN3z+iQZzVfPXn1HgEDKmhN2CqmW+CzUbrl8KWwWn
 TeWvUCC3oeuvpPlgntrFESzObnjM6So0A1JqlF+bVh3uAnoUtD0Oh+ri00+tqeZwKrPvwoKEEV
 Tl4FNHPOJn9FfSZNmeZW84YrSxDhUibInZAOmMhBPn8ZkDHdITaYLIAZQb6eahRk2gKQvF2FX5
 05hudNQR7uKinJh+zEuY25LaRSw3E3X/aKZBaNCdflRUVgFd3z10YQLL7vWJWZaWRWxiifb73D
 5qQ=
X-IronPort-AV: E=Sophos;i="5.78,381,1599494400"; d="scan'208";a="158255224"
Received: from mail-sn1nam04lp2058.outbound.protection.outlook.com (HELO
 NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.58])
 by ob1.hgst.iphmx.com with ESMTP; 30 Nov 2020 15:27:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9x8WIVYtI6XH2GyO8Ppx7CpOeaF5IySNoigQ780y8DrJ6axqUGEAp5G5Hb4UOJiiyg/BBUE+u1uxgO8Mwh8O/M7mKadcM4l87g7aw7YaRuLXfSD0IjP3/X/vCGdcUSyO7XOPUAQ6vZjbbAVPo8Xn4pgdASTzV6v1i2wVrd8843zogsWbvzdtmMFRXLaNaoXBPZk/W5lCxu+p3NDnHkjLGGqKL3F8lHG+rWwHvZC34kn+mfnaAUCc1RP71vbKNeWiprqERQb7QJFbewesXqzmnQkK38BOAZ/1cI4Ox7dsvCoLai5PIxa5hip1pI3X7a1GxD4d6u0VA6u1nHY+jL9OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQ5gzFltp5R1A2OG7D2VkD4tomdJbHXAEW5sMKuXy6c=;
 b=Q4cG87xCSQWTWoMKJTf9mDmiy1mnJlagJigldcFCcIA/ERl+4M5qGNyYBYhpHvyx8uUtyRpnInRcyTUn5RgISKuf98QMJLt6PJX1BC9mzPIh5hBOmgdeBltt11k44eRMAZRr3beo+/RcNtzn5pOVAKTACL2IHbORuXsntS3bTxXevrmOm2YqniL/IGj7Atu1+bWA9dYBNMq7ZEl7G50t4T9qnWnECXJiAh+WDH+ZwoPXaB5qR9mGHVX4FsEcVQ0KWaxg4HMxxq5RvGIes+LWepxxv6bpxDPs+L9Ebpm4NFQrLJbuY5xSDteQjIQBg2UsWJQyfI00Qw68W6YW4TDbuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQ5gzFltp5R1A2OG7D2VkD4tomdJbHXAEW5sMKuXy6c=;
 b=NgsS0D757fOrjGwxJAldSoSgRQOH5iNetyy432TKQCnjTMjm79y3ePZHpoFdzUrdG/nbf3WpUKc+GckLq89dL9ccDpte0R8JrdjIY/cCnbkvl5S7lviqY+ZKvBMhLGldas0jLSsUBBrUCM5OkmKsmvuBryjKMPkM4ajL4h7/VcA=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6757.namprd04.prod.outlook.com (2603:10b6:610:98::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Mon, 30 Nov
 2020 07:27:01 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3589.022; Mon, 30 Nov 2020
 07:27:00 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH 20/32] riscv: Add Kendryte K210 FPIOA pinctrl driver
Thread-Topic: [PATCH 20/32] riscv: Add Kendryte K210 FPIOA pinctrl driver
Thread-Index: AQHWtN4lakjfsgLC7Uq3vn4b+Zr42Q==
Date: Mon, 30 Nov 2020 07:27:00 +0000
Message-ID: <CH2PR04MB65222356DBDB314A49BE3AA6E7F50@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-21-damien.lemoal@wdc.com>
 <CACRpkdZhOxz5NhrkFxZ5G4aOrmBoAcQodOvqzNROQtXpHVQGDQ@mail.gmail.com>
 <CH2PR04MB65228DE061918A4D2A08A0CFE7FB0@CH2PR04MB6522.namprd04.prod.outlook.com>
 <CACRpkdbA_JMiyraKC_3WT26mMUxfuLD=Q_HREmbEB=yNPpuHjw@mail.gmail.com>
 <b92c455b1db0f1b4a82d8cea0fbdebb47609bf42.camel@wdc.com>
 <20201130070556.pyxv4opwtimojmyw@mobilestation>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:3811:272:f33b:9d56]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 558a8eee-03b4-43ed-2826-08d8950153f3
x-ms-traffictypediagnostic: CH2PR04MB6757:
x-microsoft-antispam-prvs: <CH2PR04MB6757DC124DCEEB0055A7A7A7E7F50@CH2PR04MB6757.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: scdwZa3R7nXkOTQnuHpnbEIPIh5pp7NuDv9Z7hThA4neSETPM8clzA9N+sVs/biHyfpodQxHsRw7MvCe5iqmNiblmdB+hqc2m3OBB/Scr+1eFOO+pNeMMGqI3Ogaoq3q/rWperHfALxufh+pIvxWvu5kagll9JOOVOOzGcYKVSR6k/qnSZXgJDzuu/SRbyHheQXlq+Z4SAx3nzMZ0A8XGbL6bdgREwujWQTeMSucfBPym/8eYS42vVMXT/RWGLMrE9+gzpILKMUMc7WL9ZJwPU0A0O9sH/rzYllukNElJpe+QWpUC0xNuo1LmnFSV5Tz12j42YM1WnOiatrZVySsFw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(7416002)(8676002)(4326008)(6916009)(8936002)(86362001)(33656002)(71200400001)(52536014)(91956017)(5660300002)(76116006)(66476007)(66556008)(66946007)(64756008)(66446008)(6506007)(53546011)(478600001)(55016002)(9686003)(186003)(2906002)(54906003)(7696005)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?z5hFeLkpf7Yg284fq/Zo9g3sfXkPuB+omQfUhbzwQo/xr1y9IsNLTGzRBuGp?=
 =?us-ascii?Q?4gCs+6YZTlzZhfwVZnPUMz9jly4j1iL5hqrF0MyczsrWaUIvvXo3MC2JC0cP?=
 =?us-ascii?Q?RLYuByh98QbwjCIrdAtpaGK2j/WQjm008nFod/vZ/5vptwz9kP/hk15n0eJe?=
 =?us-ascii?Q?vttZ64Vj8o4xoR961tpjj+sC2A7AZEF52pbIEO9rNuh8ZGPYTbBnamDd8F5j?=
 =?us-ascii?Q?gw464ot1Ys4N579Wr2pegtqH0wqGwq3ke1n/okWImdo3pbhUZLXC25s39yvr?=
 =?us-ascii?Q?Q9A400n6oF+27j1+2m2T38AleRbnHVR8iO/yNjIKItVyIRHCkZiMi2r/dBfq?=
 =?us-ascii?Q?8oyongR5dNBiaFtr7eSbnQ/zGza8CqX5ksbfYeSmxBO/Eo3xRtZxl/wL4bHN?=
 =?us-ascii?Q?rf2U8n2rlTV0QNdU/iKgzB3dLa/bTHBtRqQsxRU/FfrFI50eZmIUPHEsOw0Y?=
 =?us-ascii?Q?6nqVAZJ19kDHonZ9fO+o4OVAchDEWQvTCtBxB/KlJdSvGMMmXvc+9pUmA72g?=
 =?us-ascii?Q?nzAb2ialtOUT+U1zpqi2tNwmP7ddrB7lpeRndO8iPVNyJG1rnZaRwsFbZXs7?=
 =?us-ascii?Q?8+eY2yrIG0176WZHQTwFDNEOp5imqtAf6FAwYHmw9YrCzkPco6SqylUserPL?=
 =?us-ascii?Q?n9OY1N+S4hsgZpIjn7oFSV58uOa60XalZoRiS9jknCa4goJ/PNkXt1h70a8p?=
 =?us-ascii?Q?OxlaZ8QMuOJS4L+MzS6rvZLZ65uwQ/+SOiK+tAXR4zHlio+wGKd97cWS87+t?=
 =?us-ascii?Q?qNNOEcPTgBMkLA/Xcuse364xU+t6tdQ9zPni6Hi8FuoA7JSzHVP5KaFX1pLL?=
 =?us-ascii?Q?1e273F/3nMICgQZPEamcPsS3H3xoq3+ERPNTCDQ+Ex5ZO3lgaL67zmvrdcBV?=
 =?us-ascii?Q?OAlMNglyaCv2Q9k/I8GTYQVmfqzViaHHQOB0PIusmS3kRXbdfX5MWRgr5vBR?=
 =?us-ascii?Q?alR3cZ2P86GAkDax+Rx/akmuZgtJeH9EME77jrNsGgzhtb+3F5NoXfVTIpG4?=
 =?us-ascii?Q?HuwSi/cKqx/006z81LbYs2PaCeL5W1ZagyenXOu/ZYP64qo/ibHVkKFl9Dyf?=
 =?us-ascii?Q?MXvpZ2tl?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 558a8eee-03b4-43ed-2826-08d8950153f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 07:27:00.8039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zsp19slTszVUmIFYw7XS8sFf9ue+RxQHJz9264d63wB38fbzCv23Jtcg6S1/wAZhWzqMH+D8yMFgJCH6fuPxBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6757
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_022705_356665_9DDAD9EA 
X-CRM114-Status: GOOD (  17.60  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "seanga2@gmail.com" <seanga2@gmail.com>,
 "frowand.list@gmail.com" <frowand.list@gmail.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/11/30 16:06, Serge Semin wrote:
> Damien,
> Just a tiny nitpick below.
> 
> On Mon, Nov 30, 2020 at 03:13:45AM +0000, Damien Le Moal wrote:
>> [...]
>>
>> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
>> index 2a9046c0fb16..4a801e83919b 100644
>> --- a/drivers/gpio/gpio-dwapb.c
>> +++ b/drivers/gpio/gpio-dwapb.c
>> @@ -617,8 +617,10 @@ static int dwapb_get_reset(struct dwapb_gpio *gpio)
>>  
>>         gpio->rst = devm_reset_control_get_optional_shared(gpio->dev, NULL);
> 
>>         if (IS_ERR(gpio->rst)) {
>> -               dev_err(gpio->dev, "Cannot get reset descriptor\n");
>> -               return PTR_ERR(gpio->rst);
>> +               err = PTR_ERR(gpio->rst);
>> +               if (err != -EPROBE_DEFER)
>> +                       dev_err(gpio->dev, "Cannot get reset descriptor\n");
>> +               return err;
>>         }
> 
> There is a dedicated method to generically handle the PROBE_DEFER
> error returned by functions like get(resource): dev_err_probe().
> So here you'd just need to do:
> 
> -	if (IS_ERR(gpio->rst)) {
> -		dev_err(gpio->dev, "Cannot get reset descriptor\n");
> -		return PTR_ERR(gpio->rst);
> -	}
> +	if (IS_ERR(gpio->rst))
> +		return dev_err_probe(gpio->dev, PTR_ERR(gpio->rst),
> +				     "Cannot get reset descriptor\n");
> 

Great to know. Thank you for the hint.
Will send a patch.

> -Sergey
> 
>>
>> and all drivers can now use builtin_platform_driver() declaration with a clean
>> boot log. If you are OK with the above patch, I will send it.
>>
>> Thanks !
>>
>>>
>>> Yours,
>>> Linus Walleij
>>
>> -- 
>> Damien Le Moal
>> Western Digital
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
