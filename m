Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB7FC48291
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 16:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MWnl1U9+JB24GxWIyabN7xGLhlCFS0pEs+Wp8Bc+Lww=; b=nxrVTI8yxyUUuN
	6o/sVy7f++7VhdmWayHKzEszpCT1me/RvL8SE1/EsAoe7g56GbUCy1Y6uj0Vmqpn3+rFKr2EQoe3H
	DHCB/gs2c+iSYmmwhs2gwLUCKlbeppk3cBfvLmzqG7fKz7N0AHEnq6vvHLnqeMCn9mwCIKx6hf36e
	QJQlZPrLh4gfX9xaNOEyYrVamcFI2e8wgDeOc+QuuZJ6i2H6MlWTdtNzskkzlUCcCqIyMvQswlNdr
	rJWtnK61RruzesDqNYemA1e9Gj/4KehWM0PR4d3YYKE5LTG8rVSfedlqKj8BroTH0y+23TMVa9N+R
	wTy5NgOvCEOpNnCrZVIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVwRA-0000000CJQn-0Y51;
	Fri, 02 Feb 2024 16:30:44 +0000
Received: from mail-bjschn02on20727.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::727] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVMK3-00000006FNi-2MvE
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 01:57:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMCh51rwP1Zn6Gf+xLIRy5QLTkOMkUlAnwqPPDGR410FH4yoIimHA7BirFIEZi7VliERwYyulo03R4c9emotzQ8JLB2xWgj2jDw1m2RpEN7OW/SFQzSjjRZqCLIhEHz4ABuxOevqe9j5/GerS5mi/8LnfMsknuCBX0BDJff9BOz50XZhea9+0vPKPPn/hYudpBxI2vjdhabuz4R1K5Nc4i5LW5WvjOmA6FxzOVkwh27LCRVY5Lp/3Wo7DtL0MXF+AAMIjVLRk07iog20C8FUlgV1wo9HNOX8IFEfY+ThlMQM3n7x9y2rMcxJgG7y0tBXiAP4D+QhB58fZnEhahuUVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjJXMUpZGVhjiYlhAc9XLjPlTdVKSNpEgKtsR2ocXOk=;
 b=CNvoIXNFctbPpOrB+D5Gg4TZ0UUeo1VDnLQxvFY9G3RH3rlMSl4KpP43Bx3fS4pJHuCRHB+3UQyh6Ejc809hffFNh7HL94LcCPeNh7m2AWDMO8LQR0VQzKK88JkRtuolv8co6TB5i7OdbqqxSYDH29ynlUYQjOh2vtWc4cHzUEF6RUEj9BJmspd23wRPPusrhnK84aZMBh/QkIsFXlTkbbEIZnOPxwcwkTRKhtpWrRaeAe1M5oXPq5W+qkfA/yNQjyfs7BpVXOkYqpKTEHOlrjRyuCVNOZv5QFAaESMlWAm6zwNAyoyh41ktFOLYsr4sfOJ4gMrN4cjpzqIe89jFNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::21) by SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.31; Thu, 1 Feb
 2024 01:42:14 +0000
Received: from SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn
 ([fe80::a812:2d74:cde5:d094]) by
 SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn ([fe80::a812:2d74:cde5:d094%6])
 with mapi id 15.20.7228.029; Thu, 1 Feb 2024 01:42:13 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Emil
 Renner Berthing <kernel@esmil.dk>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Jack
 Zhu <jack.zhu@starfivetech.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: =?gb2312?B?u9i4tDogW3YyXSByaXNjdjogZHRzOiBzdGFyZml2ZTogamg3MTEwOiBBZGQg?=
 =?gb2312?Q?camera_subsystem_nodes?=
Thread-Topic: [v2] riscv: dts: starfive: jh7110: Add camera subsystem nodes
Thread-Index: AQHaU1XbC4h2Cxa8Q0qBcekBfbY08LDz/xMAgAC4KBA=
Date: Thu, 1 Feb 2024 01:42:13 +0000
Message-ID: <SH0PR01MB06675EF7ACD1452C4DEBE45FF243A@SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn>
References: <20240130082509.217683-1-changhuang.liang@starfivetech.com>
 <20240131-recycling-entering-b742e0e835eb@spud>
In-Reply-To: <20240131-recycling-entering-b742e0e835eb@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SH0PR01MB0667:EE_
x-ms-office365-filtering-correlation-id: b781fb56-fd2b-4495-1499-08dc22c703b2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k8+fKsN/huevOrOJtopgnHF8pQwOkPHJZcSgun1SH0SogiYfsDJYWB/A8Ha8fW368Li1bI81Vv0ywq2xchjhKgKRWubpQWoQdWNkKgm3/mJfIQdu4lDZngfZ8Lq5ZOQvZk6PYvylIspqlpawCG5iixMMP+2EvFtC0q7xjrln73eWoAERiR11C5UvhWOFPey4ruTEoqfU2c1bqsvH0sIGosqPbLgIOPv6XQNZfJHq7G8S44+1p3BrdlM1IlNZAffVucvGatdfDROmCx1GaJQMbfwcO9ds2mDCNHJsOdQ9RdVS+OfxBpvtTXuTPla4Vqql7ad2YghMpBCo1qURkuE1qRkXymAGPw9zbk7FkUIhVNm4FaHUcGCvncDghDf/Q2vUl9TrGd2qwrreBxKvK485IjeRk3iX+A+93IyDldNdEBiiS7HUMYbwy+5TLJBDrTQtiS0kPcucuTYGj3vF42sYWg7XFH4NzGTkD0gS0hcsFC+MpBK7wd6j2t08lXpWv7S+b+9G6f2oBKSYr4hj/p3N5xaeKsD5+IgUk/VR4xDFJ0kuenmeag/oOQqJcNTu6bj7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(136003)(396003)(366004)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(38070700009)(41300700001)(40180700001)(33656002)(2906002)(5660300002)(41320700001)(7416002)(26005)(7696005)(83380400001)(66556008)(66946007)(66476007)(66446008)(6916009)(64756008)(86362001)(54906003)(76116006)(508600001)(71200400001)(55016003)(9686003)(4326008)(122000001)(224303003)(44832011)(38100700002)(40160700002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?ZjlXYlZCZlMvUVorS2lPZms5VzNKVldBYlFRaml4UlVhc3orTXZWM3J6WTQ3?=
 =?gb2312?B?SmZGcERlVWI0cjkzYW1tbnE5ZGpCRWh2UTArYmcwOURiYWFxWE96YVlFdjVq?=
 =?gb2312?B?Y3FQVmhMSzF5YitlNUhCTlh5N0tmQ3RhNlJmSHdQYU5aSFdTVnllcC8xTDVs?=
 =?gb2312?B?RDdsNG51WVpFU3NwQ21xek5EY0p4dUhTTVppN1Zib3YweU9naWRCOFo1K3ZT?=
 =?gb2312?B?SFk0MzZCS2lIck53d3Ivc1QxbVJyVzVESmJkNU5rUXMyTm9rbjM4dThST3lD?=
 =?gb2312?B?WXhLMmlJakRyY01wUkN5bXhsdTR3TEVuSWEyMXFqVCtrY2t3ckRsVEl5eEkv?=
 =?gb2312?B?U1V5WjJrME9SanpobDFlTG5tWDRyUmJyeGJwcnhZeUYwYW5QY3llUCtnQWRB?=
 =?gb2312?B?SytwU0hkeHA0cDIrYjVlcHdjRTdzTGxRbkI3VlpwNVpyUU8yUUpmNStkSzBY?=
 =?gb2312?B?NSs0S1N1Mk01Y2ZFYzFGRURkVXB6TDdkWEMrWnJxa2RodmhGbTR1Wks5Y0Ew?=
 =?gb2312?B?OVZsSzc0dkhmMVREVXZ4cVlWdFJWUGN5NVhadDdrazFYNUVpSnU1cFR3V0Ji?=
 =?gb2312?B?QmRiM2dEdnVZRi9zWkNDRjR6ajhBWStDcnlxckh0ZHdTWDJ0akQ4OVFKbmhr?=
 =?gb2312?B?dG90R2EwSmkyR1dOckR5VFlUbC8vREh0RFdmbjRHZ3lyRVlwUFpuQ2phcUF0?=
 =?gb2312?B?QUdGbThDY3BuSVl6a1dFOFd1bDRGUWRjRGd5RkpXWDRILzJDSWh5blFDTmFi?=
 =?gb2312?B?QmRvdW81R1o0bTlrSGRmM2d5RDh6VGpWbjZnN0ZSdW9OeDgxNkVYTmtJZDkz?=
 =?gb2312?B?b0hIak4wbytqYVRaMGRrNldHb0t4MFMzcEx5d3VSakJldFBqSEY5aUJhTGN0?=
 =?gb2312?B?ajBhaXBKYy9YMXdjdm9CR3dNTWt2SnpSek40d0x4TENIQnp5ZUx3S3ExZEM0?=
 =?gb2312?B?MThKNG5vMXk5RWhyN1dRaWhzeFdBVTlwbkxyNEJRMU1ubG00UFdzZjd2RlNN?=
 =?gb2312?B?c1NRT3JQU1pnYi84d2huNWEvNzVtQ0R4d0xDenpsRWxRZkZxczNScEYrRGR6?=
 =?gb2312?B?V3NUTW93VXhhajdvd1V1OXUyUWtUcnI3YUtRVWQ5dmdPa2g5dHZPcDdUclVp?=
 =?gb2312?B?RlpWaFJYVCs1UXBsc3RMQ3BhMVZRa3pIVU5TSjFGMEtlbHR6SjF5ZkNvY2cz?=
 =?gb2312?B?V01uVE9MTXdsSDlwNDNOVDd3SnFpVk83TnpYQkhNZ3QyY3ZrQ0hvMDVIclA0?=
 =?gb2312?B?Tm1jTXZ4dWU3Slk0d1AvSjlwLzRSRXhzR2JBQ2FxdjNZRks0SFZEZ3g1ZndS?=
 =?gb2312?B?cmRZVzF5Z09oQTRKTitySFFIY1Q1VHNhdGZBSkxZUmZVdXpRMTNFclAyWEow?=
 =?gb2312?B?QitackdKNGhHa3NDeHVtdHZDTTVydXdHdTcrSWV6NWNyVlk2bjlyWGpqOTZD?=
 =?gb2312?B?Um9xeHptT0NwczRwSGt3VHordUJra0Exb3lvV095b3d6Qmlqdkp5RitGandF?=
 =?gb2312?B?WXZpMStuMGtTZlZYcDhtUGpNS0tqcVVDZGRXbzBCMEloM09kZmljTkErbmww?=
 =?gb2312?B?Zys5YU1tQXN0SWZrMkVhNysvLyt3ZXNqSERyUnVPWlZWRHlocHo1VzZ4MmJU?=
 =?gb2312?B?bHRUcTJOKzY0ZGVYQmU4SjNBNWNTWjdyOFl1SzJXRXRrNmxoZzVqY0UrQUd0?=
 =?gb2312?B?MkthSnhlL3NSL2s4ZWNUcUYvMzVBOTBnY3p1bkJuY0NpaFRMWkhwbFNlU0k0?=
 =?gb2312?B?OFBQVjRWbjNnNzRvOUZndnNSU25sSWtvS3Vvb01PRFZaNXBEd2lrblRCMVlY?=
 =?gb2312?B?SWFuWk8xTVNad2FqYjJmK0pEcFU4YTFuTVN6ZUZJQmV5T1EvYmNMdFBnK1Rh?=
 =?gb2312?B?VmQwSHNtQU8yQmt0aCtBdzZxYldsWEc3b3dEOTJuNnh5MG1DQnF1SWVKcGZu?=
 =?gb2312?B?aUFQR0RMTUpRdXdKcVU0YU04eit2MDJONVh5ZGwvN0orMEQxNlhiVjBGSjZT?=
 =?gb2312?B?N1JUWU5tdkVSZjFab1cwUmJjd0hjdVBUaDBXV1pUZFQ2emlpUGVWYyt4WUZs?=
 =?gb2312?B?L2p3Ri93bmlqRk5GTUdraDRJZ0F2SGJFcWJMREc0d1BjcmdDTEF0UFpOZTZn?=
 =?gb2312?B?SFcydHdTQ2ZXZStZZmNnMklpdFY5ZGVMVkM4RWErOW1UMnIxVHF0ZzNzSXFo?=
 =?gb2312?B?a1E9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: b781fb56-fd2b-4495-1499-08dc22c703b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 01:42:13.5524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hDi7fcF0XfAwjLCrD5SexH0kihNM2509AGShcEQOiQ9GWUt/yLGW/otjW77BClmSab15Ai1tzJ5kAdMtzdygCGnDhYX6ybTy4a+l4LHVZfHbAcztJsmtl7EGD8gsZA9s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0667
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_175659_622527_F2A4E439 
X-CRM114-Status: GOOD (  13.39  )
X-Mailman-Approved-At: Fri, 02 Feb 2024 08:30:41 -0800
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
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

Hi, Conor

> On Tue, Jan 30, 2024 at 12:25:09AM -0800, Changhuang Liang wrote:
> > Add camera subsystem nodes for the StarFive JH7110 SoC. They contain
> > the imx219, dphy-rx, csi2rx, camss nodes.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  .../jh7110-starfive-visionfive-2.dtsi         | 103
> ++++++++++++++++++
> >  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  67 ++++++++++++
> >  2 files changed, 170 insertions(+)
> >
> > diff --git
> > a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > index b89e9791efa7..e0027bb379ef 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > @@ -30,6 +30,37 @@ cpus {
> >  		timebase-frequency = <4000000>;
> >  	};
> >
> > +	imx219_clk: imx219-clock {
> > +		compatible = "fixed-clock";
> > +		clock-output-names = "imx219_clk";
> > +		clock-frequency = <24000000>;
> > +		#clock-cells = <0>;
> > +	};
> 
> Why do you need an output name here?

The output name can be unnecessary. 

> Also, where does this clock come from? Is it an oscillator on the board?
> 

This clock come from imx219, not the VisionFive 2 board.

regards
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
