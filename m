Return-Path: <SRS0=kUFi=CZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8445CC433E2
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 03:09:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04C0D21D94
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 03:09:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0fvPZckn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Z2yfFru1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="ZAwDiOtE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04C0D21D94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=8V9kdVHV6+RydRD1jRlkKn9m+tFvCKv2lWWsN7VWsBA=; b=0fvPZckndWYu/StuN5owzdZFl
	dsGHJoqOa6b445UTt8iKcN9UKjpthcmQjdnI2LHvMSsv0fJeMTVsnmthngrh//VBB+UFHLe1wStQK
	GaHD7bwlxo8DTAYzVORNzEEEGJvHPxpVeE/ecyVaah1lxqXHVzH8os41xGIzf8tIeTnnhuxQJ4O9y
	JbEC4OOVHf7TwY8qXJg5ic7wRaaOIWj7Faj8xYxf67T9VR03uJ5PEx4/GVZ7JEhI3rrCk9ANDlZ2q
	R1o8iPVtPhVusUvLcGz3RNh/dsy9DdMeQFJCyjei0MWkLNTi/o12X8pNHtiUS/3/1mNdYKOahvQPr
	25YNjuNcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kINoR-0006Ck-Vt; Wed, 16 Sep 2020 03:08:52 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kINoO-0006Bq-Sv
 for linux-riscv@lists.infradead.org; Wed, 16 Sep 2020 03:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600225728; x=1631761728;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=MnDYK1ooi1gmLKadKjCl3nZ75ziK2I2tB5xo3pLgrAc=;
 b=Z2yfFru1q1vVQbvcYJdKK0ZPpmflZQfj0XeZVzhMSqWu8d7oAUqBy0Qw
 W1ayxpHin2rZrrUeLZsmNHxrFddhXev3htfQdhJPeRUuMCl++l8oeihNA
 BlRLrirF9pZnD7Yscua+N6kWpZ6k1YArQHPMy4KHLkSLG2eFHRxkjVPWt
 w5zi0t7a36+ZSzG+yOxPuBWN9UVeM3AIzd3Opa8nUJQvrpZ7oWIdTTQHk
 TGlV0EqZB7AVJCcUeEe5+ctwziUw7ICgCGlz2lUW+J6FJtuIP2a5+0tYY
 TyrLK7tUoG70FK9IE3UkF4K23cr43cb8SoXufdM33Tz1QpmGM0qREKHsO A==;
IronPort-SDR: F6pvMZ8pZ2sSIYBcE77czUzswDJQS09BT0KOR68bq8yxF5VdW7j8Fo1gi+0wzXiI3ALhUVv/eV
 HnVCsVl1uq/QbmjkrgzUcyWsoO5p6buWdLE+RZcAR7cXC76K0HghfCPp7WnBjBuHA5HAymOAqU
 1cSJIvTgbaiatbuqoadTMm/gsJjO+wVTONPzRELI6Uy5ruvjGU7PEzduzYlqgM2DJQUhqOkIyr
 iLTf6gEf8/JWjhh5GrJpl4v1wRz8fz0WQp99RAm/PWM9GhIJcdSXrRUDrLjqEASj6E/V2EoVn3
 Zro=
X-IronPort-AV: E=Sophos;i="5.76,431,1592841600"; d="scan'208";a="147405982"
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hgst.iphmx.com with ESMTP; 16 Sep 2020 11:08:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhnuTV7YBhrpoA1nu4pfbyymbv77pIcQyjPGAEV32bgy9Xe/dsJxsV7LjjKNKGll5IxYxGaS1raHTgmzMwegc/dknPBdEO2wrD3V/fp3UTjG9pUqYIlXQKwRH5r9L58Q1MgWbHpwjyFPCnPKwz3gMDFWQ6MimPLn4RDl++NjCaKZVhv22aasXrEOuu5Yaddocn6h8TFBRSDGsr0pvGiWjFhecv4G6L7GdZCSc6AB7jh/nq0K0N0QubyGUq2RMnOW+QY9WQvQQu6z6qboFCWs6Ek1p5X4DUIT/+tA95HU9thG/Bd05DQYSCyk2x5UGt224Nwzik9BKUGLZ5OqrmSekQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43z298AwjDebHhzpaOUqVa2+VFaUFPExx7F0P4T+WlI=;
 b=LswTzmBOv7+zgM9bEj1FDFlfYU2E5odg4Pgse2v8c3uSBcpUKsbLgguilxqOzLgH5DKcO4re6KVvm1OzsNiTywhYYtdxz0vfxbMSIvIjGWmgchjKw90oVBN5mFrRelCfFAK6qdztBZnS3gVwgrxKznwjm5BflH6Bq+Xj1PKiy4cyFYQ1GP7Ljpz0B1lklkdEBYMCvImy56Z8PccMNmJjU3Tl8C4v5OkHFjhPdyvl3FJX0LpGnb0CfAl7SBuRRSTs68joFGB/eVaqMkB1nDqrzvBqSqXlyFjzDnHtSZFVRUBB7cRJDUZRLGZ77ILn2a16pnhdVT3kFRQa68DPIyoC7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43z298AwjDebHhzpaOUqVa2+VFaUFPExx7F0P4T+WlI=;
 b=ZAwDiOtEphf7x/KaGWChdcSSsyazMHujeSuad2cHBYVt5V2ViqAGv/DRBcj0OVFDDWS7IaW/b8R8Ft/uvmtz2PvMNUEH2lkABZUbIrlpERd+sT2DG7Eryr41/UcF3ck1aWVdoK85ommDNRnYMt3xwSVXhw1qOYIo3EyitOEgy/0=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB1049.namprd04.prod.outlook.com (2603:10b6:910:56::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 03:08:42 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3370.019; Wed, 16 Sep 2020
 03:08:42 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Sean Anderson <seanga2@gmail.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] riscv: Fix Kendryte K210 device tree
Thread-Topic: [PATCH] riscv: Fix Kendryte K210 device tree
Thread-Index: AQHWi89QsjtToLdSnE2Y2f7yWfoi0Q==
Date: Wed, 16 Sep 2020 03:08:42 +0000
Message-ID: <CY4PR04MB3751F5C2D0C0403596040E4FE7210@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200915125501.110326-1-damien.lemoal@wdc.com>
 <78347150-d43e-9300-8d4c-db8cc74ec11f@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:b178:89b:b9c7:c5e0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3eaf2c2c-a095-421a-229e-08d859edd11c
x-ms-traffictypediagnostic: CY4PR04MB1049:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR04MB104999AAF73A91B39F915B63E7210@CY4PR04MB1049.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nbWRKEKd7cYgYD3H/UANr8tqCNZQLhPEIhfAbKiq4NJWB2kDG/MTDWr1MOyXPrwac4hL/UeOi9BF9l52EShQ2IKajOAfMfV3Awxg2iWZlVqmVOKV2n6nWYpZqB47fUKTcCOMmpwsAd8By9INTQ58ufrJL9aKyA11AwzHFPzfDWARaZeWqPIycEXL8Duj07vsfFxSnyJJaVRKe9Lxp+APDK7W5yeA4ZZx/CJ7QxQ18ocxv+7WY71sRLfFYok2Of6P7cLVvb/JJ+ibKs1V8rj6S6j61NgM1UL5EASgUjPhfH9Q2woTZyJ2PzG63aU4tZ+v4rWPH/sWhRnY+kB8O39rgegbUMTVjFN19K3gZmPLsnDqhOma1GZjluEmLga6jPtjNmYnGMxyoBsRKQHnMnFWuA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(316002)(76116006)(91956017)(9686003)(86362001)(5660300002)(478600001)(966005)(4326008)(7696005)(55016002)(71200400001)(33656002)(110136005)(53546011)(6506007)(8936002)(83380400001)(66446008)(64756008)(2906002)(8676002)(186003)(66556008)(52536014)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ezkRknuuxuY723afrtIUNwM/QPVVkWr0N1Gy8RRy86gqk1riN+Elyyoiw48QlXcDxVui8GrDJvqUyuoKrsQVtZHXuMMp5XC7o1wsoqr+Quy0gly/qr1NCB8Sn+mcNqrpgxJfwJvtLImmlwBJqx0DXkTOkOg3Xr5HinYcrZhiFFnpuUL8bYWPTfwazgOkTlI3RTYDi7z4e3zB5Z2urCsvhP35ECk3Hks30wy1KQCEBWQamOu+LSu0SjHF6p9cIor1W+3Nai+oejrJvOTlZliTMN9L8w0+wxwosvNmhD3fuJXQxnnV3YFBFJibNnhp89B8B601gl09WA5EjxxKWxIez8rz+3rQKOExV5AqHCmTh7SUm7uKPGSappzP7JSRtBIge4f2Xw2nmbbiTqE3S9N/+ml+ljP7eUx/Kic8popSkehNii2K/Ia/cduePoi4MTg8la7pMNrrz7K1/0xwADuHlBf/+cGVxkuYA+qa7/KKbvatpF4Nbi0XfUmqNUl4ePI4t3KNm9e9+VBq4g6ZIpGymi06UpFNhxmORf5qSrnszw1+abBwIrmFSTkxjXcZsTLBQdzt7Lrnefw1qBWG1CY4BXp1x7ingG1tzfUXS42c3UJyupvSJMGv9YDC1nZCrQ5nGVT50iB+LFe9g3fadiqnL0GXv4CyGctTkuudcwb5ajCUGx3gvz7LOnTRyuGG1VXlGKBon3HjYiYiiHttBlHwmg==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eaf2c2c-a095-421a-229e-08d859edd11c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2020 03:08:42.2668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aw9P1pUjae/+GLVXPmXXbRTMVLaLrJWAcJy+q0ZXSWkbkzjPoNukWoEdL37dkBBL30kzlk9mT3SmJqEdPSciIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_230849_240546_9029B591 
X-CRM114-Status: GOOD (  20.64  )
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
Cc: Anup Patel <Anup.Patel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/09/16 11:15, Sean Anderson wrote:
> On 9/15/20 8:55 AM, Damien Le Moal wrote:
>> The Kendryte K210 SoC CLINT is compatible with Sifive clint v0
>> (sifive,clint0). Fix the Kendryte K210 device tree clint entry to be
>> inline with the sifive timer definition documented in
>> Documentation/devicetree/bindings/timer/sifive,clint.yaml. Rename the
>> clint0 entry to "timer", fix the register mapping and fix the interrupt
>> extended entry.
>>
>> This fixes boot failures with Kendryte K210 SoC boards.
>>
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> ---
>>  arch/riscv/boot/dts/kendryte/k210.dtsi | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/boot/dts/kendryte/k210.dtsi b/arch/riscv/boot/dts/kendryte/k210.dtsi
>> index c1df56ccb8d5..48d65fea45e9 100644
>> --- a/arch/riscv/boot/dts/kendryte/k210.dtsi
>> +++ b/arch/riscv/boot/dts/kendryte/k210.dtsi
>> @@ -95,10 +95,11 @@ sysctl: sysctl@50440000 {
>>  			#clock-cells = <1>;
>>  		};
>>  
>> -		clint0: interrupt-controller@2000000 {
>> +		timer@2000000 {
>>  			compatible = "riscv,clint0";
>> -			reg = <0x2000000 0xC000>;
>> -			interrupts-extended = <&cpu0_intc 3>,  <&cpu1_intc 3>;
>> +			reg = <0x2000000 0x10000>;
> 
> Why the change in size? The docs from the SDK [1] (which I think were copied
> from SiFive documentation around the time of their release) state that
> the CLINT is 0xC000 bytes. In addition, accessing memory past 0x0200C000
> yields a repeating memory pattern:

Oops. Copy-paste error. I will change that back to 0x0000C000.
> 
> 
> 0200c000: 69823183 02020120 6083c006 00008002    .1.i ......`....
> 0200c010: 69823183 02020120 6083c006 00008002    .1.i ......`....
> 0200c020: 69823183 02020120 6083c006 00008002    .1.i ......`....
> 0200c030: 69823183 02020120 6083c006 00008002    .1.i ......`....
> (continues until 0x02010000)
> 
> To me, it is clear that the CLINT is not 0x10000 in size, even though
> the legal address space extends to that size.
> 
> I am more curious how this fixes booting. What was the issue before?

There were 2 problems:
1) The old declaration of the entry as clint0: interrupt-controller@2000000 led
to a failure to find the driver.
2) The interrupt extended entry was wrong

> 
>> +			interrupts-extended =  <&cpu0_intc 3 &cpu0_intc 7
>> +						&cpu1_intc 3 &cpu1_intc 7>;
>>  			clocks = <&sysctl K210_CLK_ACLK>;
> 
> This clock is 50 times too fast(!) See [2] and [3] for a fix. I don't
> know if adding a "virtual" clock is the best solution for Linux. I would
> like to keep the device trees relatively in-sync, so please let me know
> if you think there is a better solution.

Huu... Let me check that. Once booted, using commands such as date or time does
not give me weird results, well at least, before this patch and clint changes. I
forgot to check yesterday when I tested (I only boot tested). Will check.

And yes, I will make effort to keep the DT in sync. Is the Kendryte support
upstream in U-Boot now ? I have not checked recently.

> 
>>  		};
>>  
>>
> 
> [1] https://github.com/kendryte/kendryte-standalone-sdk/blob/develop/lib/drivers/include/clint.h
> [2] https://patchwork.ozlabs.org/project/uboot/patch/20200915141724.503929-8-seanga2@gmail.com/
> [3] https://patchwork.ozlabs.org/project/uboot/patch/20200915141724.503929-9-seanga2@gmail.com/
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
