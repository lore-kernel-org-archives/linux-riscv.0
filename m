Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD38C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Nov 2021 23:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=h6AGszDoFe/UDFovKXzDpcayv3fi18Yp+LYGqlAeJsY=; b=DR3U7scadp9miN
	zJBuHorVaGQJadasjs6h+dIGq+ip7va4NDRwYxPtPd0WDrZWJR0KHiIq1bawD48T875nOvAtYKRL5
	5L9eb1BGttNB/c7OKaEFZsv5bscj7AmC1fG45Uce62Gv6AaLvH/KeY6v4ZS6KHPz8tFwYLNH3QYNd
	ptdgJwPu+w687foehHh/IpRxBy7Q35E/Sxu9zwJwsgO9Axf8+iXfQAs7J0sAl8G9Sb2VLQj+LxY+q
	EZqY+gM/tA1DXrRbUT7bGK9ManIJMI3wUcKPHfiln+ehXStawt8B1STs1MAOTwxF72JJAoldcbRey
	MKdpKxv34Eiv5kWgQ2yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mowYY-00EXNd-0d; Sun, 21 Nov 2021 23:47:34 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mowYV-00EXN5-Lh
 for linux-riscv@lists.infradead.org; Sun, 21 Nov 2021 23:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1637538451; x=1669074451;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=oX/xzN6VTym1WWDuoJ1c3qss7QRszevgHmt8gSvg7hU=;
 b=MAE9ydvP9RPtY2V6tG8TBTnYQwmEFWmXJ7lg/phJo7SSojf+T+MR4wtM
 wjtbUyp3unmXeSqH4maC1rf1TWiJ6TqYf7LiO8WhhcXzrmHXe72bsPvjC
 vWinpBy42lSRg/ESsxiBBBqI6iBm2Ew/glzgybqxXcPuT8Aews2gA4Y2w
 cRHpWpNBLMMeP9cT8dkmf1pqYIFe3aNsWJ7tQS3EmMCmvH/Qi4nb/jji6
 Q0Gl7MQr5l8X+cYnL3MaazEtge3Ofd5j+wujK9mqCfRDpxpMODuHLrlM0
 l2j7DRdFVo2ZwP3OiA2p6hRLSnXpsa+CAeDnoMZJ8a0OBEcQ5XYSdOCxG g==;
X-IronPort-AV: E=Sophos;i="5.87,253,1631548800"; d="scan'208";a="185248382"
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hgst.iphmx.com with ESMTP; 22 Nov 2021 07:47:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjZtFZu3qdckkUDtShDWUA2lbiY4393HVPSJYa6GxR+hRovDzkNKlgt0J+yUO42kddJRnDUXYik7ZPX/cFp+Okw8Wcp7S8I7/AWSC01qrDDMwKzsMy9sOxrZnMhpU4yCpLpfG9cGEbQ25l6JXrfPx2G2XdxSC4T1iKXzxsNqjpWvOXqwu+HPTRWaXb0f9XXGzhf5Wkz3eVRb44xdTc5WY4PEjwWU4VIaV2qpMnc6b/kL3L1vjIRo13SfNDXgOe7BAUeGpZ3bNb/6wXRj/x9cHzmwpth4lViYg9G+9k1O8UFMiPrIJLRyBasx7quvEdlIf7oumI28JLqUPSIa2DAA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ere9rAgJXaC0eTrmK2ACSzXzPfiBK7nKfnowdNC3X3c=;
 b=MwtyL1lY+q3O37CUWRdFjFvMHVR9K/l1MwqilDLN8lOmQgELNloYq7iAZJXy5ZLMvTJJD6ElXqeOvi5q9j1vXGPE0bd5qm/6Zw0UH7ZX6rF1m6gr3O/cpJjAwPitnSNPqa/OHzdsaSOUW1ENylIHRgm0MsICCP9JB4/d3Cw+fxIK/hr+ZHhNQ53nFR5MnqqCVfIebuudOWYaGSBDgXEQAc36VdaVj7qkNRbnVyQGFK6g6zgskEDxTydlsK1JjMa3xjfDGHkTISAVVlsJB26XKvMFtyuWj0UCVJxhOaBmiLlCdO1ttPnMSN1KxeSid6O/M37i4lz3ggoiYtBjKOLklg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ere9rAgJXaC0eTrmK2ACSzXzPfiBK7nKfnowdNC3X3c=;
 b=qzCpRA29pZKqFdB1Jomv+wPgLQYo+uRDNRcdBVJ/LS94lBmFMRZc3zhTKO7ZHJf5tm+zAZgiIObyx0CO8LEArPB6hcJWogIc+FSh3seziLqxPjisIRxCO5ElmSxp7AZXWU6D84JW+1hfxaJQY9eBkbLx7gNj6pr4AlTkVxogXqw=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM6PR04MB5161.namprd04.prod.outlook.com (2603:10b6:5:fe::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Sun, 21 Nov
 2021 23:47:27 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::fdf1:de8f:9073:8487]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::fdf1:de8f:9073:8487%5]) with mapi id 15.20.4713.024; Sun, 21 Nov 2021
 23:47:27 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Anup
 Patel <Anup.Patel@wdc.com>, "heinrich.schuchardt@canonical.com"
 <heinrich.schuchardt@canonical.com>, "bin.meng@windriver.com"
 <bin.meng@windriver.com>, "sagar.kadam@sifive.com" <sagar.kadam@sifive.com>,
 "axboe@kernel.dk" <axboe@kernel.dk>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH 0/12] RISC-V: Clean up the defconfigs
Thread-Topic: [PATCH 0/12] RISC-V: Clean up the defconfigs
Thread-Index: AQHX3WTlJVC8NavdvUafeUrdHgdZ2Q==
Date: Sun, 21 Nov 2021 23:47:27 +0000
Message-ID: <DM6PR04MB7081CC991251D8F9D3B8F301E79E9@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <20211119164413.29052-1-palmer@rivosinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 835f14fe-9061-4f8e-69ef-08d9ad494698
x-ms-traffictypediagnostic: DM6PR04MB5161:
x-microsoft-antispam-prvs: <DM6PR04MB5161F9B5F86FA8ED5F191F90E79E9@DM6PR04MB5161.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IXPhKEGSlQ297noFBah/CNNHWW4tsK1zaOG2y5yQirt/YVureeuTQdqr12q9C5HJTEVgcqIZaie38lIqY3xFMIcSYj9LqXnEoEQ0ofw/jWlLi7A9rpF8WmSEwhDey1XsijT2+5eNzmGKgkttTN6egpvJVsoXLBCaCISfGZ+J8kkBkS+xdoPQWGWfUBfMD2qd2zLvNmOOU1ZT7VR4/vg8yYGknDwuKv2pERR8cMG+u3FCotJRbVZcHShejpMqgXmXrFEE9llmd8oLITsZLbHi64TElx35TSUIA0u0TKja0FNBg8PRxBEObGa+VFCLW1j+1BhY+IkJopdnz+6aIKSWQ8uyqxqG7qv6PVnIvEk0wcgsbdu8/ynbVY0O6Z/nEMVicso2KHzSy3Sa1FfFGGoVBmGfRoBpAsxQmbJhkq6P7WN6T2dr6XJAdxa3oPmUTJw4KuGrmyppXNIqSEKNW5o6sxae2dqPZ+RNO0lubv+Dk6Q/cBXzUnW4QLXp6N21TEgS/IQrxApr8Q+cnq+AvQcd0kxJ5gmT4706QAs8t9AGx8rQC4MHs1GF1+V9NG1FUK8UKjC5x7dPPcFsKf/RTmmgk8XYMUYMcKuqJcykYbOsdAtBQbN5HHIhNDG8zLsJgcafYem/aJnn9oWcAm+9Wh2E/iWgZyazZpK0IEgZ5W5lwk6HDXq3+IOWd5NNiV7tQrWA90M3l6C1kViGsFw9RJdb9g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66446008)(64756008)(8676002)(66556008)(38100700002)(5660300002)(66476007)(55016002)(4326008)(7416002)(316002)(82960400001)(8936002)(66946007)(76116006)(91956017)(7696005)(52536014)(110136005)(54906003)(6506007)(71200400001)(4744005)(122000001)(9686003)(186003)(86362001)(508600001)(38070700005)(53546011)(2906002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gFnq7w+T/Ph3M1Hkk6A6LHnaTjqnwztxzU5srlpKxS6rfGd+9YH2c2787esZ?=
 =?us-ascii?Q?sXG1xWJq/FIxXnFxtKxfbOU9jud284MSL8suJ75kFp5PQhOSrDE/WzXQPkkp?=
 =?us-ascii?Q?cWTZlX1nF8csQgBXQEnU18M7JeNCWEDIYrR/Zgg+PD46i+sjs22E8ftZuzwt?=
 =?us-ascii?Q?FVXuhNIxEMQ8Bmhcw8FtO6DOiCbo/kKRzqbndjtjYWSk0CPTl74/od5znv99?=
 =?us-ascii?Q?BMRk/3w6rXolePbLUR5po6SfTQp21iPv624Dvw9RQgHnTl1xnyi8Mw9Hvxtx?=
 =?us-ascii?Q?cf4qhrEUwS8jpyggH4XYIaaZYt6/+n+m7AqSiZoOlkak1RUUAS/IWIWFmPk6?=
 =?us-ascii?Q?jTqVW3G1mR+u2MuoacCIXJLjg/0iQQzG2tJFZEubCzFRWRZSW8GcF6EYthod?=
 =?us-ascii?Q?vfrWPxhTX4j7vZMw6RieEDmDEKpRgChCgpAZfofpy+dk9INxOnDKN8/3FcHc?=
 =?us-ascii?Q?CZch2rEWB/BsKxSNqQ8GYdHRLWfHJKJsp27iniKrJlhqYXVl3ETaBZnmF3cu?=
 =?us-ascii?Q?IGeSrmT1tfJ/0ijHZroHnOPB+4j9W9u6QS/0O1p8uO0wauSODYki0gGlr6U/?=
 =?us-ascii?Q?lJ+yv3sRf8faBZiR49/027xiC+JNUN06hQQTx0J9eon/NrMRjk4Ljx6vVMkx?=
 =?us-ascii?Q?jS0s+g19Url9ALfVaF4CmkgulqARwWrep1pCwTr4y8aGAo6SZE9bEHmP46tL?=
 =?us-ascii?Q?QyLjbJE1g+HHbTgsT23sBrlTnB6OdQ+8LJTBbVXbklfeJtMU+7q/Lhrgu3D5?=
 =?us-ascii?Q?sI8yiyF3gE5d2u8oMfwoYAeyhsYw0OZdtAd81zYVVdQZtLOCDUYckvgPj0aW?=
 =?us-ascii?Q?NhbMeajCBou5F3q+qh6JP65XhhLlk2c7FiFo13pdzKsx5EkhCR+WMqUIP7av?=
 =?us-ascii?Q?d5y58OeGrbAHMyGYe9c4eSsip8IF98w5Sem9U7BU01nEUmg0AmN1LURPsBaI?=
 =?us-ascii?Q?HLv368x8+fC4sE1gXpuZmKDbzXZ0qcRzrQy0UiJ+mI6Jlxj46OGhHibpOXGb?=
 =?us-ascii?Q?o1zTlt6fTDV6HZpMU71igbH7JJMIBjxGoGZGmS1iZSwi2s8Sjtbeo+55WCEV?=
 =?us-ascii?Q?SRgsQk3RzZkE7UcoZKRo6yroUaSh6T9zbcVZ4krvg+QS/lRFA7+afeUQT78W?=
 =?us-ascii?Q?Q3PziWuwClXjzofRzW+xMJZFaUpI3iqEomjjLWhDMiJmeRmu1Ut1whLlsrTW?=
 =?us-ascii?Q?HwpPK31cQQkqIUWXpelzAD5wZ0Sen5QMdoeLH/PQwOWXFbU5z964i7xU42Bv?=
 =?us-ascii?Q?XmpG52Q1+Fa/nMH38AJjepWKbGsxrSx+hnxZvq/izUsoAaz5XMURqBE913dj?=
 =?us-ascii?Q?iSLHeRt58RhQTOH3k9lSJoLETbN1FLGRP0B9pKY2Yq+PgmIIcDd9d6Kqf42G?=
 =?us-ascii?Q?rICuL2eScalM+BvXnd0X5c7p9ssB3QHEtFfUyffoDkEqDCH6Uwa+W6rXDfDM?=
 =?us-ascii?Q?GAEiTcmPGz8P6SdaVVHRCFlW740NnFH1sEQomll+L9P8VdoKXKnTd3NjukSK?=
 =?us-ascii?Q?TVcrSghu/51Ys8mOZ9N/Pqq6sai4Tdx7maMDpBPomqpbqttl3Ada7xhOnSp/?=
 =?us-ascii?Q?XYVRYFjubCuQ+IGcBhU/zfoEMde/QlzVFPiVJqg/6ATo7WnC2EU0GnPMEo4O?=
 =?us-ascii?Q?8U4LB2uQNUJQ7aCfOK5nt8hcWsQg/Nki2GR7xDveSXEwQsIoOvPsf9JTZjAD?=
 =?us-ascii?Q?hLby+V8B6ZlwUDSZ0OrayM5+Nd4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 835f14fe-9061-4f8e-69ef-08d9ad494698
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2021 23:47:27.7729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rQj73Cf0QazMt6N28E4u3lr4e+BBsdG0N/fYhqb0Z8Lvf4On7DlXWkwHTn1YFWST7GEfmowvC3copZX2UgucrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211121_154731_805202_CFC85E42 
X-CRM114-Status: GOOD (  15.64  )
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

On 2021/11/20 1:45, Palmer Dabbelt wrote:
> It's been a while since updating the defconfigs, so I figured it would
> be good to go through all the diff to make sure nothing was lurking.  It
> turns out there were two minor issues, which I've fixed with the first
> two patches.  The rest of these are just cleanups that should have no
> functional change.
> 
> I don't have a K210 (I might somewhere, but I've yet to boot it) so I
> can't test this to make sure, but I think patch 2 is the reason we have
> a special !MMU PAGE_OFFSET config.  If someone does have one it'd be
> nice to be able to remove that special case.

Note: incorrect email address for Atish. Fixed here.

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
