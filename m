Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402A3C388F9
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 13:43:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4D31206ED
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 13:43:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rWKK8Opr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="rrwYeL2Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="ga/zI5ld"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4D31206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=aMGuN4DBA11stjxWVMFYvJdawFpf0MWYI3u0RnbhR5A=; b=rWKK8Opr/fnCYDNraJxaJSk1rD
	IpdhCV0FjA7ZmE3T+zdtXTQob3o73yLBIJJHXekWHbz1EX0HEvzbuk4E698xfjfQUo44T2Lebiv7O
	zJtkSl/QTXLsLynN1IIvnlt1qeSpquHUEEj9xllOtqH6P9c5id4U1kP3J6vRoflj+bBZTieMWxVrf
	ILLUH2jq1WQvE0SMfAn7hC93IWOrk6AeXarM0t8AT5G76hn3PCbdScsLDCjU/Qhjii/LLHMEiEiD3
	kBfUmnApFXy8k19Bvyd4kro0ZaTr0H0UciIivy8aVsG7Qv3jYKZtPBczbPFgtEArLoGUxXiG0+mT9
	E/jpNPPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbOUY-0004Zx-9s; Sat, 07 Nov 2020 13:42:54 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbOUV-0004ZN-Sv
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 13:42:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604756571; x=1636292571;
 h=from:to:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=EyfDn3dO+o9gop8SiRYLxECvpV04e7ByOl3C1JNEBLU=;
 b=rrwYeL2Y7KvqZ43ToVKsAnU0YYf3II8aqDOXnustU7B3trarYWSr7aH0
 XY+HdsMofsvXTXZGjT1o0VCxd6h2WsG/o+BdHQNZOdxp8SuDBe43Vpn58
 aqwlhIKKTiRh4bhqm+kmgteI0JAkV0lmJNev4PKRdJqKX3hPQbFKHeHGv
 XM/1OzycrA9Dfr1hwfB4G7NrMf7Atxpkr/xI+yfsJ0+nSEUPFD0qSplGH
 Iudkp3ZJggHJsjeEz/GCaWaggqPsjAuAHJAVZ50LtJ8RuTIzlDkelgbTm
 Hak+ggEDwO6hAILvJt5R0bewvD1126+eslItBm/Nf6XEPeCG5m/L8Yj8Z Q==;
IronPort-SDR: A4aSZLLGl5EZdIWY+N3M5ViKR9/FkWKOrbpw737WhmXKais1PiW/YKilou8cKT2Pboc4sx4iYB
 ScHK1Ra7OdDmugGfpOwKpnoIqwYKzWOpWq6uLCyOLTBSM34O0RmrIDNKyE7BSgW5njw+1nYD6K
 Xseh8244sCRThdkjd9AH9Hpc1++oY8x1UUveVLFTT0h7tfnsXetzN+3Nzf8JdLXyJHL6L/zX7U
 EWo9cF3Y5kDlMtqWdxYENkf3WUZaTXaBEgFMZe+cFPtWfJbs8lDVlvvTxAR8NPQsr1OBOZuOxt
 Co0=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="152196681"
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 21:42:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgrMqyu3BXfLLeVII3s15cDpi/VeryTVfYBsHKbG0zkr3s2374ba++HMdhn8JfNvUpjAhTY04RKZRlaepRETOUvlpbfj70e4yvxnLSiU+z3z22gh2DBqWru6IZW2Py/Y650NL3KyeE2+soVXiSv6r1cZXqCixgAY0jvcOjHrnt6zW7bx8/0iqGQGBaOaJVOTZcr190lmkTFlvMs9oo38Qadvs5t9vkDzv151WjobWW4HRakETAtFR8PjLVR/aM3jmXfwtTYGvuJ4UjFP5fpLY7TOkmSrro5cMeAZOSdAMOHhaKP96Ys0eDQ6XUFvS3DbSyHkpLb3x7L8wHWycyTjTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoj03cmZVHA5K9Oe2WO9gJdqZWY0+mU+e1gQBlpTDtk=;
 b=eHzXg7hYsnEX4PMz7PoA7GHxUttW1V3dNiwIPC3FAC76Sz4OhZIgCUnrTWw7Z3tYyPYRi6+l8ZjyUZCTKIBD2jwJO+xatGDWHJFFvz6dfDmKb3lvozF0BsJbzaDLoi4eV1ohtRfk6Sr2jmS0jRXV5xWVbhXeoa2gQ85JdttXa0seADm5oyHdxMPcX9Glp5JIvh7Gz2uGejQWXZpWACNsqOnBP7x76yKHijb6/WD8VaEUtlg+qEp9+nOAXeiJuscV8eer15bx8b9Is4Y4pknah2UJajTCnw/XjvWwWN0HARxjJ5r7g6bae3zViIqu8C1qjEW5X3R5TA+o5B8tzbRMxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoj03cmZVHA5K9Oe2WO9gJdqZWY0+mU+e1gQBlpTDtk=;
 b=ga/zI5ldKZZSKOnh57LivrK4A++HNjocv5vQxn5F11qGKy45jT1yfKhF403mDchxfUqZdSe92S+isIcE+h4lW1CtcT1NGk7L6VPgSj8Yf49iHloPOzJInjpGFL3Mw4pXFH32wLlzKnj3ZAud6ShTajnVM7CDSDWaQ0jwa8rmQ2M=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4980.namprd04.prod.outlook.com (2603:10b6:208:53::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Sat, 7 Nov
 2020 13:42:46 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.032; Sat, 7 Nov 2020
 13:42:46 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Sean Anderson <seanga2@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Rob
 Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Serge Semin
 <fancer.lancer@gmail.com>, Mark Brown <broonie@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, Stephen Boyd
 <sboyd@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 06/32] spi: dw: Add support for the Kendryte K210 SoC
Thread-Topic: [PATCH 06/32] spi: dw: Add support for the Kendryte K210 SoC
Thread-Index: AQHWtN4N0wumwRzXdUGPL6nbxUOPpw==
Date: Sat, 7 Nov 2020 13:42:45 +0000
Message-ID: <BL0PR04MB65145CB4FC66106B62E179CEE7EC0@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-7-damien.lemoal@wdc.com>
 <53859725-ca0b-5f57-9147-10346707b3cb@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:89bb:1cde:d92a:2dcb]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ca959040-81cd-49a0-2926-08d883230271
x-ms-traffictypediagnostic: BL0PR04MB4980:
x-microsoft-antispam-prvs: <BL0PR04MB498007F07A1BF1A2B9CEBBCCE7EC0@BL0PR04MB4980.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L85EEZvlO8jJ10iCG8ML4IcBic53nTUiRuSNr4hTI1+4xXytMFNgDK0vUMrxsL58Mm2sYd6WJeQZf4mgAYq8DiqJFsYRpJFHINXZoHojnczZg/t7mHoxnX1XrrDIZCrI2Uf0YyY1W0wGmqIFE9tH9t0sjgFhZx8QppRHWY7wcs2epM3cI9+KPTfqpKPHVzUCm3Yd93mUPiV3NUSg9GLcMGaNFX+SkNqhJFXJzLjFBQXEV3SWI+n4GAU0YMu0ODXui6TazGFpKWimAyy75NU5zU9b6Obnwls4B4h+R+QMIonjq/n9DgViaY/jjI44XT1GeMvir4mHHcqW2vFpDyr0FlYmjr2OD1o13xy/0CdVfkdfls2jwMtlw6j4hbVQ9STN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(316002)(66556008)(8676002)(66476007)(110136005)(83380400001)(76116006)(64756008)(2906002)(478600001)(53546011)(6506007)(66946007)(86362001)(71200400001)(186003)(91956017)(8936002)(33656002)(5660300002)(66446008)(52536014)(7696005)(9686003)(7416002)(55016002)(921003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: SKTT4yQ3lnNEUyl96rxsgHx23YoMxEbP7jv/QTF5GYSR1thvZZvU2/TWqkybvgHworDAO6h43nFcU2/Q2tAm2+Hdd83hwieCZorQ7rIDjAE2XP5pWchzFV+/J3qHGpKJ9j8ekL68uldwW+NHvI5WRwUyeNsekIglpXz2t+xhUB1RBtboOPJZkfZAYlNqV/SIE247IPEwY7UgPOGcECd0bZSt+SLGZsjydRjJ6KmDSNQVVYfdVn2Zz1UYMQhMDBab7H4hjElAx/nOpifhsQDWwxoeoj1cdxvGi8deJZ2JxbYDe3pWVU16Ka8h/1g9u/ihbyAu8bE0A0yHa0AbJY9ySgNApoENLyfwzMXwsemVHjqRMDx906DPeRg5ejndKjQxwl+0KBd7fEcZ6sFIxnAK/pUgQuwQGhmLoJdpoTKGIxFgp4vBfy7wbdJlBgSMlzRYy2D2p1JHh3Va2S+HTlHUYtJW/h+0m/cjLoHMmmk3a5Aq2bqZGB0NdtRF+9Q/83KiX5D4m6SMTW+VsoPwrGkOq8J30+H23DS9VMXEt7zwaLoTGihPrUkH2ByhoAq0BWCLjtLxkg3+gH+/iCwuUP8ExR/voqR9b/nMDElBxqQZniLw7bMG6mBMG+OBrGvo0/MqKzdKEZdk/HWM351T4nFcyd5jNNreVPgkaOXOpjn6jJ60IGehBCHyPEuCCUhBaKAQe60bvNcsxfpdU39h/RAz6Q==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca959040-81cd-49a0-2926-08d883230271
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2020 13:42:45.9212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VxyyQcW7rDF6cW5ejfAL2+MEoVXacszDH0foUjf/1UNIlQKAc+ioJy8VJcIIFVffuJ4chrLSEB0Cba6EmNz4Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4980
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_084252_218738_952B25B3 
X-CRM114-Status: GOOD (  15.93  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/11/07 22:31, Sean Anderson wrote:
> On 11/7/20 3:13 AM, Damien Le Moal wrote:
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
> 
> Can't you do runtime detection of DFS_32 in probe?

I think it is possible, but it was much easier this way given that it seems that
only the K210 uses the DFS_32.

> 
> --Sean
> 
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
>> +	{ .compatible = "canaan,kendryte-k210-spi", .data = dw_spi_k210_init},
>>  	{ /* end of table */}
>>  };
>>  MODULE_DEVICE_TABLE(of, dw_spi_mmio_of_match);
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
