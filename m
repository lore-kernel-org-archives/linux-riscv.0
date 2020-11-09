Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9712C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 21:39:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FB41206CB
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 21:39:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hWLQ/SK1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Ix6gBDY4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="jGbNLUNB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FB41206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=m2JTRJpcWJBqKDhbz1D0gLSKTG/NwwaDKQi3KmGJTek=; b=hWLQ/SK1P6miVUN9zTQrXQ4Vf
	/Z2boVp8AN3h9is94gzCGvkjRJgqE7CU8aoY0tFB/TNJHdUnlqF1IHLlNHP0pHzh4gYA31wlLfuP2
	ivp/P5keZG30i+40fZZ6sThHYzakObLEOsb3h2X+7gx7XA6s8JmiqI3p2D5Hig/WXN60GOkn7nZI9
	hINozjV4oSjm4kCosu70gdC49r1G6LAD9obko6PbzT/4FIEv23omKTIBawMCcQbsvsBHUfmx8doIX
	meZMwFeZlC33Bq0Ymmjr5NcsToJRleFS54GlI4pIqG+2Bm5JywDBnZIxygxHO6X0SQe3LCgrUXMPO
	7kOM5UrgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcEsq-0003l1-Ig; Mon, 09 Nov 2020 21:39:28 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcEsn-0003jw-UX
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 21:39:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604957965; x=1636493965;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=MUU59PgXzNdolf9yqQBKX2r1v8wNb7v5kWdKTrVfz6U=;
 b=Ix6gBDY4/QAoxYrYrU/P3xcTXA5Vn+/HpLvE6unVNVCu2s2K+7hwcO9A
 yg3LapnhatfTNG6qszXzjzH2Db7fEqMIRc+wzixK+f/rna248fpXJeClH
 5M6mW6lZmWL+2AWryHfRApUhDlbR8GjufT81FZ8QtQFUdTe5IMotSQb+9
 GDAer7JWUopVUfESanMYwttzFIavYwvFb440JPhb6Lfb/O9ylAzklzQMF
 UAZCI2mOk5g/p+UDmjk6Zx3NoEZqzVaCLDui5GtdgP18fpnP6jFyUrmlN
 4WFIHHsWMvlLVKBcAv/X6rGA4X60xkD+f3MR0kefZHBKYibhgFOQ61V9A w==;
IronPort-SDR: 4RXB3Pra7QmoFcG0BcEfPS+4DEwfdZbsbE/LORWvacHmZcb9mJCPVt5J1BLf2xl8CbHYT+1X7H
 lNojHoZ+2O5WfWyIG2U8nD1YYXUrOGDUvhHQJpp7Vw30UZ7AX82JDGOO73jGW2i45jA6ehIlZ9
 WJHVlL7YPxnSpJx4ht98cugkaY9/XqaPMg43DrKIz9r+aJcZpYSj/Ub4rUpprlAWvyDfe1HduM
 yxIk0XCtE50iqN0Vb2k+YcoWzB+BKuMFaNaWYelkbetgoJpe0I0dYo5IQCJALBdiuPW2MvbFgA
 fsQ=
X-IronPort-AV: E=Sophos;i="5.77,464,1596470400"; d="scan'208";a="262225475"
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hgst.iphmx.com with ESMTP; 10 Nov 2020 05:39:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmeqwHws1DVU1JH1vavGlLx/u/g6UE/pI1L8fMTFc3XAoZUMzGXqfAhyhF7XVcGCTJZ3qiUDagpx/JFqZhGsNhcueRzu+G3ZqGx9hT7LukLi65VNTZCZFyWXuxl1EhANShXD4BugVN8XBI3BuohbUlKEVSq9V1/6WrIXDDSguLup7eINBF4LPZy1PKE8ECg5ZgR+6J7i2twVetZJRvZISZeozCVi1s6T6wu3Sdt2l/KpIIovfd6i/TxijFyHXZKv0mfltsAx2zqD+9R8oaafCfPmDCiz9oryceFvGjPuGqRBLEkfywJEmQ02ZFul+n1zdH1vgllC/3YsyUPxn+5/zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyI8kQ+p/OY8FQkWgRR7wqCWgbte95uHuqGPpC1yD+s=;
 b=K89i7qbzqYsEPtNEKJfDVAWfB10hY6QfoasxG9TQDYSxbkJjTdGm2BDUsHqyb76x7XC1pDYn5pqNxfmyuuQa8w0gatM1ml2A/M/l6iZ5OEPLPSZTS8JLrAJ+/WktfoM0C6J3oiFMz49LkIslML4J1FGODA9eVJgBoPOdB1839yznAOqgqW/yjOZ1KHdUsYG89qS3WgDKkQrugoOCQzr+vJSvEWoNbnif4nDzBFhdPpNYsCyfmEttwdz1hRfMTnxvE+9hr4KOoLDdfCzF01pU2yKtOWK3LLzySkUA943zcjyImYLejrsj1ys3KkMrReN3gTLViq7w9YIo/LPxdAgERg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyI8kQ+p/OY8FQkWgRR7wqCWgbte95uHuqGPpC1yD+s=;
 b=jGbNLUNB6rtDqNZUlTdSHJcpMKXbtGf7iSUQ5exPwCi7O5wAFsbdaW25crxV6UvNK+0+B8qEiZfdC/oPuPRjcpmMdCrZbZO/gN1QCylDYgr8Y6B+ecBVJ6UkNBV1S+Rmf89LMmh5Hi+gmcZ1qUICLfs4/4HcXUJEO3Bdy+J0QWA=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB6531.namprd04.prod.outlook.com (2603:10b6:208:1c5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 9 Nov
 2020 21:39:19 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.032; Mon, 9 Nov 2020
 21:39:19 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH 06/32] spi: dw: Add support for the Kendryte K210 SoC
Thread-Topic: [PATCH 06/32] spi: dw: Add support for the Kendryte K210 SoC
Thread-Index: AQHWtN4N0wumwRzXdUGPL6nbxUOPpw==
Date: Mon, 9 Nov 2020 21:39:19 +0000
Message-ID: <BL0PR04MB6514111AE633C1E53B6F08A3E7EA0@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-7-damien.lemoal@wdc.com>
 <20201109212158.y34otj3uy2hev75c@mobilestation>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:89bb:1cde:d92a:2dcb]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7b6e3fc7-a35a-4c75-5fa1-08d884f7ea56
x-ms-traffictypediagnostic: BL0PR04MB6531:
x-microsoft-antispam-prvs: <BL0PR04MB6531BFED5F85EEC7EA71C17CE7EA0@BL0PR04MB6531.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NEYqwIkd7GN09dco3rVtYSNmEp9xwdoXI3VpsjDpLenAX5owHnkGU6lv9NYsRnJBQKrSBKeErsNpfFmHO2CJEL/0sN/X9vAw8/BAcisCjKp1G90OElUwCUxfIaveGuCLZmsf//CTqHJYZrWWuObTYMTqJuBblOifbNn64U9DIr+MOZ64+30P6PTFdUoDBBNpGzmusX3UDuY6lxMGr/lPFhbXNnkL5gIQw8mU2yXGdS7JbKSyh6Y2dLooZioIU/cI8VQ/XKnzJa6W+OZBtuZsbZNUPcWeD5lnp6zBFoVGw6JwJ2UWF8QePbqStrwDF93/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(91956017)(186003)(54906003)(64756008)(6506007)(53546011)(66556008)(316002)(66446008)(86362001)(55016002)(4326008)(9686003)(33656002)(7696005)(66476007)(71200400001)(76116006)(66946007)(52536014)(83380400001)(478600001)(2906002)(6916009)(7416002)(8676002)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: kTRzw6HpYRE3uL3GyI+6okkp8gx+O2UPmxMEprkx2sF8EJcD917ELP6zP1QABKrEgYhHXjtZB+pF/QD8TRQu5gufKvVvEC2yByMm0gpCvJCXkLl4id/ahX9KE/z4oPDQme1xzHmEFclAV8niA1HN8XJ6j4lPtIdAJbTfHqO6SKWwOl2JK/WL9m6ATi19AaI6s1X/K4granf6g6kY0cy2V3ztFww4rs5UU0jUog1dzzLuyZzrPtsJ3yZfBvKtJ16rv+jrWBWL8OeNGdKd+UKrFCnJcedSOE1j/2KwhjOm84lq8BCCFEdnskDfnU1lFFpCgUEoP5h5GIDthCZad8JhN/vaCWGySY7Crhg+zCsvg6JjGs0+jAeoFqntWJZRobUCMzpoEu7i8h6IjlZsLDpRmKw/WsRGM4RT55TUpqVi3E+SDVkFr+th0AoVf2/kR1wZ1KBR/MmgMtT0uD+/9dAa3HmvFurgHWsjTwxvm5MtclxH6MIGaKRlxnA4/UpZNvWnnjZ6b3shK9zRVUHCuWRoMDKF115r9CAcKAaMUZpsjoV1/A53UZFZAAUDD9HjOGBppICi8ux1D+rLMiGrRZZ5RQ/AJInEmvFntdGsoWOQDUfBFcjBiFchrEddiAit4ulLqilmbXnhpiSD4i5ya9YwyDhcYq5KtVH0UirxICiDx3bMSjaFXS0RXfkk6oEB+Lf8355wK4/mQ/JU5gtT/+bVeQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6e3fc7-a35a-4c75-5fa1-08d884f7ea56
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2020 21:39:19.5102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ff7lm4rwVhCoMdU9XnJOpTkQma273qddUkCOb3WrtZQApCwOKQu8Y9FqJoGc/IGp3xnMqkbm7ygmGAdaEHPSgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB6531
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_163926_186962_78BFA85C 
X-CRM114-Status: GOOD (  22.76  )
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
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Sean Anderson <seanga2@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/11/10 6:22, Serge Semin wrote:
> On Sat, Nov 07, 2020 at 05:13:54PM +0900, Damien Le Moal wrote:
>> The DW SPI master of the Kendryte K210 RISC-V SoC uses the 32-bits
>> ctrlr0 register format. This SoC is also quite slow and gets significant
>> SD card performance improvements from using no-delay polled transfers.
>> Add the dw_spi_k210_init() function tied to the
>> "canaan,kendryte-k210-spi" compatible string to set the
>> DW_SPI_CAP_DFS_32 and DW_SPI_CAP_POLL_NODELAY DW SPI capability fields
>> for this SoC.
>>
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> ---
>>  drivers/spi/spi-dw-mmio.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
>> index 3f1bc384cb45..a00def6c5b39 100644
>> --- a/drivers/spi/spi-dw-mmio.c
>> +++ b/drivers/spi/spi-dw-mmio.c
>> @@ -223,6 +223,14 @@ static int dw_spi_keembay_init(struct platform_device *pdev,
>>  	return 0;
>>  }
>>  
>> +static int dw_spi_k210_init(struct platform_device *pdev,
>> +			    struct dw_spi_mmio *dwsmmio)
>> +{
>> +	dwsmmio->dws.caps = DW_SPI_CAP_DFS_32 | DW_SPI_CAP_POLL_NODELAY;
>> +
>> +	return 0;
>> +}
>> +
>>  static int dw_spi_mmio_probe(struct platform_device *pdev)
>>  {
>>  	int (*init_func)(struct platform_device *pdev,
>> @@ -340,6 +348,7 @@ static const struct of_device_id dw_spi_mmio_of_match[] = {
>>  	{ .compatible = "snps,dwc-ssi-1.01a", .data = dw_spi_dwc_ssi_init},
>>  	{ .compatible = "intel,keembay-ssi", .data = dw_spi_keembay_init},
>>  	{ .compatible = "microchip,sparx5-spi", dw_spi_mscc_sparx5_init},
> 
>> +	{ .compatible = "canaan,kendryte-k210-spi", .data = dw_spi_k210_init},
> 
> Other than the comments from Sean and Mark regarding the DFS_32
> feature runtime detectability, I couldn't find a patch with adding the
> new new compatible string into the DW APB SSI DT schema. Have I missed
> it? If I haven't could you add one to the next version of the series?

Yes, I will. I forgot to change the DW DT binding doc for this. I did add a
patch for the "polling" property but forgot the compatible string.

In any case, I think that this new compatible string change can be dropped by
switching to automatically detecting the DFS32 and using a different solution
than the polling property change I sent for the RX fifo overflow problem.

I am still going through all the emails trying to understand what to try next to
avoid the polling "hack".

Thanks !

> 
> -Sergey
> 
>>  	{ /* end of table */}
>>  };
>>  MODULE_DEVICE_TABLE(of, dw_spi_mmio_of_match);
>> -- 
>> 2.28.0
>>
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
