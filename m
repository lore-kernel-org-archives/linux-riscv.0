Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD9BC433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 00:32:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4774461222
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 00:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4774461222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=qbnEzdKfT2QIITHEFTBAd4JSBegmrSbLAynmkzJYk1c=; b=C+CT5i7mapK9KGjAZJ/Ygcpr3
	pxBobWTGHT0Tiv7qXPmSMno9S3fTOyaGyp3Hgk3P7XP1zT6a5aRBbtVRSKVC/UJ3YWWyjSDwtx7qJ
	uGviLLaXpz3340xxU8+VpjwUuq4DsilnsR2ABztos+TsTSjUqO9/RfGPSFNzMSSoYIr1CRZBwAdl5
	QqZe4EFGZN6q7Rbo/JCLtC90LUEj64KnlyDuQ2MpPRz/pUPrHsOYCbP83KRXc4TTLxb2S1A3N26xl
	z80KEO1HXWwH6gQ7Czg4gCvvV4FLYcGkdMosPl1ZPLMdFFibDURX8XPl/TgUe1u0G226UD4Hu64Q7
	2xjlwqlqQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWpvm-00EICm-Df; Thu, 15 Apr 2021 00:32:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWpvg-00EIAa-LV
 for linux-riscv@desiato.infradead.org; Thu, 15 Apr 2021 00:32:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-Type:References:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description:In-Reply-To;
 bh=L+wt4IRDhyagW0QnxAzRQ5XNJM8iny59WvQPQ3pja/I=; b=erCTR2Kxvbhksteg2gdf7OiJN/
 0ZRQmO0NJnyW8yMX/AsxrkcIREMihmBQwHrCCWtNL7Fw/1qBLTdG8rls29o07xjJHNVWzy9vcuXwL
 owWd01HnKFAHKsuHzTdIK7JJYiKG5ijsjtdusbiqfIUfVi3JNhCaQEftMr7M/y8wJ9R59wPALoR8C
 ckxiNcppJC3clVm+Pkn5wYBmeWMVBArAJQOz4hyAZ69Qvefw5+K5u7WuNXAdW9sPaOVjSWgQiVgZe
 TfHF/T0Hf/vQz4kKAZuZykEJRjIv3N7p9F9IOHJFP/gZ2C/G9EcpIEmgqzpuzx1jFD3CnaYHm1ihU
 B4iJqIKw==;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWpvc-008Bb1-Q7
 for linux-riscv@lists.infradead.org; Thu, 15 Apr 2021 00:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618446736; x=1649982736;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=L3rXogAfbcsyVi8VoZBkt1bovhVDF4OOEtaRp8JxTwo=;
 b=G1zzon4lBB5uX2wrynPQA9W6DBRi+r3ElJTSBrGe4oxiSheMaZwwhK6s
 W1I1NuPcVSzsJhyqZ0y9CdhNr/SDYJ+CrsQHnXskRDyLoVRs7vMYdTPC8
 7WHnhBsdXcUCGTwlUFAE+UXmOO8sxlk9qctPMsiK6C0ypT2ph06G5q94+
 j13M2Etznrp0YOANJMLqxeFnW2xf79HUILyoXVgsjHexN664tr+ZyO+Kw
 /Afd/X752+eZkgw7QEzugUypiwq/MlmtinxgGkYKtQA4Ola03ar9waRgf
 Al9py+2ur8K5L/vgn6HuUIOklR55M4+ZvjuD3PftNbOYBn+yn8G+Q/PbD A==;
IronPort-SDR: edi8IA9va79ty0gJPdKuskU+JNKnP11Q9l6gWHbZ4wb5BJezMn5aSNgrHIcOs6Iz8srmyD8qmI
 zJZIxZUHqu6a39B2B3+hgSS+E1mj2W0a5LzPK7fLPvu9pod6mPNj19a1d8UmeH+p9Mi6nuyxi3
 Y9zVvTLlmn3vDqrkOT8I4nMA4ApxmNtLhcsBZ71O7aTh1cA4s5jWLUZVhcSnBNgKGAER63NR+E
 YIxGHq+KkTorQ03TX+Z6/tzdsW4xrYUxGhadIXbPCxhp5Uy3Mz5/wlfDRMC16FzAHBti7s642X
 D6I=
X-IronPort-AV: E=Sophos;i="5.82,223,1613404800"; d="scan'208";a="164808262"
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2021 08:32:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jvqwx3SOOlq0HclEsUAswEPgCSORXaOFsfz3g35zIH9xsOZm1jkWHMH/upzxkTVYzEAv+aPib6IfvaE3oCXm2Q+z74n8rHzF5SCVLhEq0qd3GqwfDr7FnIlEzewwe9RbHOlNUyKGa22DNJEcBGlItukixn1gt4S4rpnM4yxpdZ/uXsZ8eFCdQEzB1hIh5yutZZJmrS1X8G6i3M3AIFM63Zk6Fe/YbCDChhmaYZm6YVrpMu3tN+97yGWhJ9Scu9EPOo4yooXEDzG4wVsNZ1ad3DvktU3Y42x/E1lZcO1TYyv3SrmiODiXI9lInBg3DCvhkNrfcQjmJ4Y1MS2z2jqhDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+wt4IRDhyagW0QnxAzRQ5XNJM8iny59WvQPQ3pja/I=;
 b=R+qkEF9oGbUzxS1OgEhT3cEiRv3Cw6aNpVxrECAzC6YeM4swbTO+m85+qoMnmrRQsyi+OmAJ1wc5q3nTWn3ylZKLmVhf4xbfPObWFua+q/+BgCyOObQdjSoAAfQwMCkOVwr1LcyPvKiuwacvoeSPsJhdCJG4Uf7iOaGS+qYg2yzdhw78j4bJGHuTE2ldlj6tdh3KMwaFFMLRLOvteKu/8/Yx2C3ET05LaxxHmbVxAwRC9OJl7SdsqVV/2GcALcujl6QQaBvRSXLaIJtfuKhBaCBso2v7jftKrRS3FsHp3X7GxbP4TUYJBsHm9rgbts8BmmHLWlCsCFo+fx5g6ywSdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+wt4IRDhyagW0QnxAzRQ5XNJM8iny59WvQPQ3pja/I=;
 b=fiE1sjF9I7cI6ZKnl/zeQrAGtfdZyeGGfylmDc2R4cro9c5KUFl06PtH22CLD25mNql+n7cavyAalW8Gqjnfl+t7ljBFbIjSJsAV8fKu3hpwqBD2LLk6FoQuz+d1YUzdNJav7zKVVEFaFUyQbozNEiL0KgQMqQHCdZIrKaDpBRI=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4980.namprd04.prod.outlook.com (2603:10b6:208:53::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Thu, 15 Apr
 2021 00:32:10 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::8557:ab07:8b6b:da78]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::8557:ab07:8b6b:da78%3]) with mapi id 15.20.4042.016; Thu, 15 Apr 2021
 00:32:10 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Max Filippov <jcmvbkbc@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Anup Patel <Anup.Patel@wdc.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 0/2] Fix binfmt_flat loader for RISC-V
Thread-Topic: [PATCH v2 0/2] Fix binfmt_flat loader for RISC-V
Thread-Index: AQHXK8WacfnVzM4zUUS2ex+k23Zi9Q==
Date: Thu, 15 Apr 2021 00:32:10 +0000
Message-ID: <BL0PR04MB65148D80C819A7E3B8365242E74D9@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210407154924.1557489-1-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:a831:e732:e39f:8a81]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d69cca2-acc2-4abe-b132-08d8ffa5e866
x-ms-traffictypediagnostic: BL0PR04MB4980:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR04MB49800A4CB814F0ED2754A7E3E74D9@BL0PR04MB4980.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FCX6sAeUOOjwKB2OZNMhcawo5CFxRpwA7El6ACGDwuZqMfMNYo7/9kO/1wvRdP8TSlvjlLjGcytnvry0KGpawUgtJzLs28ZEF7eYmRRUM/Qitl68LwiS4oc2WFX8oQ+8JcFo5GdkPkjJ/aPVBr8lAK1pkVkPMuw7dqc+LaobZ4OBPwNf7Y7ebZGKlalMJLHqjPyVxlc5JI7i6GwK9HgzgTgeNxA1cGSxZuR9EIG8l9nNkube66MMh4JgptBOfehfqhtAs5XZxDg5dlo3X2O6BaHH9tfOp2ZN4y9XoJV7aJSo+XHp+l87YkqKogGiAXpZRAw3e/zLfyJZGry3AqNZM9FRUkioRd5ZSqtqvMsdriigyHqrW/M8btzFQY0GKtpudMyvu+8sZu4gKcCgymYz0FgZkucL9zn/opKtNeiLdps2363a4GbALf+ZwFYjv6Mh/URuZN5K9s2CXPv16ZzJcTt2GcRYLckfNdnXmqtHu+S/CgNrmOfgBk+Q1wi2TDxJGY+BzFiuj09PiGpd8syHzyGyKySLK9LDSz23GQ9cywTNXYSZ3KjoFL8ylwOrQ/WSsO37dZPLJ4qCDa7XcI38wh6kFR0+LnfAA1w3yr7s0sI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(186003)(66556008)(8936002)(55016002)(2906002)(54906003)(478600001)(66446008)(66476007)(38100700002)(66946007)(83380400001)(4326008)(64756008)(8676002)(122000001)(9686003)(71200400001)(33656002)(91956017)(110136005)(5660300002)(86362001)(76116006)(316002)(52536014)(53546011)(6506007)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Hi4BvWWyITowZIDGAEaYseBBkQLqNrYzojCiWIYbrda6eMARZoBZHO/Gx80V?=
 =?us-ascii?Q?hrd9ZXx01RncjlOukiZOhpHzw5pdbe4L+tYjCz1sCZypqPMA9wn93yyCRxDx?=
 =?us-ascii?Q?03Pw8zlrEWCT4Y4fBLG4NUVU3fv7fVlewgLZgwUBeWgh+pnSgSjlxGB5TUdy?=
 =?us-ascii?Q?+3IR2VYITIl4Nm8aQppOGiCM5tCABZGfzhtihF8zuHoZGcPrfK8I6ZI1uA9g?=
 =?us-ascii?Q?xqcbJsstXPS1aLxz/hNASuwZu2teNPgb1GpWLrgfaGMshaVNMBpCygLKDMST?=
 =?us-ascii?Q?/a4fHcPkADVi8G/EtmpZNNqeVQ/QbSRWja0QWZYmW8q2XVArhXXX1ji68wTF?=
 =?us-ascii?Q?rRwn9b8haoyUIYF08J7Z9IqJDstLLzTgTcnV0w6OTKKBqygNxOpXVTRHYhU9?=
 =?us-ascii?Q?gIxd9GwBDn+5c1J96ObJNF2UhubsoLszuEPMZVy1tqRaIynvIRLh2dIxu4ZD?=
 =?us-ascii?Q?h2OvsId31Fmo5x/PnjPzYkTX30moYoWLUxIz3pup3a2p/kusQmyRFTxAokoj?=
 =?us-ascii?Q?yBJd0EDtfsXGcvgW9TMIhmSTXDX6HbkpZKePxTKytnwA9eK+uyPK4EgvB245?=
 =?us-ascii?Q?vtlPob4DrMDizlKXn/RrcE/rfbYlmlbtpD4qwxXtwkpE3+4OkrPEcmCxFSvb?=
 =?us-ascii?Q?VmCFyxxbGGTUrWKGpE5zXqsSeNKsJk+8YEJgDGWKRXhG6SseLWKb2tmD2LgJ?=
 =?us-ascii?Q?20YPIhiWj7mc/3hByS0fUX4du5/7n6DwrJfHszcXv3/SX9GalutQSWncBPnL?=
 =?us-ascii?Q?CL+s55zF/xf6m5KrhMpw0CFlKPMtpCH5GHP7K15yryL3hbHv+3+wAHU5/agC?=
 =?us-ascii?Q?SrkmDTzbuagXfue5ythAvpYl2FpNTi2YL877q5IM9ecNl4spbVJDyD9SEB+/?=
 =?us-ascii?Q?3GuNY/cCm6qnu0gN9qK9fXOlKa0SPrqraE4hDdZVMrzTFYcebwP840boU9CU?=
 =?us-ascii?Q?VBSsgdaociKQVDh2jFSqck+/CAZyjmt3Ho6cNuyets89CV0oc4YYJ0DyENjp?=
 =?us-ascii?Q?b5rTj9lniObD3RAyhcbf3SfcJ+coVyypINtoz7O62Z4BYRmTT0OkLBF84HNh?=
 =?us-ascii?Q?0bHfAHeit/3S0hO7rNnjkU/LADcUWdR6zTfUPwl0wqhYSDvcoHckIy+9ZBz2?=
 =?us-ascii?Q?cermkI91S85GbcEceRcjtzwto11cu4ABS5VdKmznaASo0dVyNbUGoE2pMhEI?=
 =?us-ascii?Q?Fzu47+YAIU8OL+9Vgv3F8u3FuHT9t9nPcMqp2dQ4yweAgcP6+fEXSIXjD4PL?=
 =?us-ascii?Q?MhLCJBV2NZDFUrt9BlgqjyEm8NKFKhDkNn81+H0PoVXdqGWZzyRjSgCMJif5?=
 =?us-ascii?Q?Fo6OnlpcmmGZNKh1GTyChs/w6uUboldbJGdCGEyJoCF48gtBDvxk91mjnYI4?=
 =?us-ascii?Q?mAgTbIagaEHbS62iUfWy6wxPnn9NTuexKn0rHeqFt6X3EK/69A=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d69cca2-acc2-4abe-b132-08d8ffa5e866
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2021 00:32:10.5212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f2sY3z5C9JMvVaZc+YULG+bdhsOCiHbjEmO1CnygsWaPry5hiDr7fjlbhRqUZZZH3g5F/GkDPsXAUxO+WYeJLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4980
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_173216_940120_B5A4BDDD 
X-CRM114-Status: GOOD (  18.90  )
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

On 2021/04/08 0:49, Damien Le Moal wrote:
> RISC-V NOMMU flat binaries cannot tolerate a gap between the text and
> data section as the toolchain fully resolves at compile time the PC
> relative global pointer (__global_pointer$ value loaded in gp register).
> Without a relocation entry provided, the flat bin loader cannot fix the
> value if a gap is introduced and executables fail to run.
> 
> This series fixes this problem by allowing an architecture to request
> the flat loader to suppress the gap between the text and data sections.
> The first patch fixes binfmt_flat flat_load_file() using the new
> configuration option CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP. The second
> patch enables this option for RISCV NOMMU builds.
> 
> These patches do not change the binfmt_flat loader behavior for other
> architectures.
> 
> Changes from v1:
> * Replace FLAT_TEXT_DATA_NO_GAP macro with
>   CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP config option (patch 1).
> * Remove the addition of riscv/include/asm/flat.h and set
>   CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP for RISCV and !MMU
> 
> Damien Le Moal (2):
>   binfmt_flat: allow not offsetting data start
>   riscv: Disable text-data gap in flat binaries
> 
>  arch/riscv/Kconfig |  1 +
>  fs/Kconfig.binfmt  |  3 +++
>  fs/binfmt_flat.c   | 21 +++++++++++++++------
>  3 files changed, 19 insertions(+), 6 deletions(-)
> 

Ping ?

Any comment on these patches ?

Without them, RISC-V NOMMU user space does not run... I would really like to get
these in this cycle if possible.


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
