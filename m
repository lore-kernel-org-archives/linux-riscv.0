Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FEDCE7A81
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 05:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eCHT4qwt0mwIgkBQBFBwIwehI/J3iQha15SwH25TOLY=; b=fRT8ViI4HV6DcC
	kQv3yudYMJaDLM/2Pj63bjikt3oeqwOh1St1iimXCFL38CveBzNIfE4YSENoS8NsYnINarxnYgd0T
	RR414NEC99iGtol6BsFhstqIZL0mx7PK87asgLjLtNWPSwdMx5CzBGDs2DNAqzAbG5rlGJ2AtoPtY
	q+r6mBvXtV86rQ9XrHMIgIomsyi6FPFvQKcmpQl5QrfpLWh1BxSqRFtpwJ4qGg5cXee3u7tNMrzxd
	Qo34UeeLvAJOuss/Yam0OO0vmRxqF/+TbXCc9s7Uj67FmaqHG1cqzntT5PuiPqMGEiKe5L4zgK/dP
	fWv1r3R6flo8w8U2BMVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qke3D-00DLn6-2y;
	Mon, 25 Sep 2023 05:22:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qke3A-00DLj6-0k
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 05:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695619348; x=1727155348;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PdD+D67Qrt0G9QFJ/R9GzPxY3oKiFXD7WSnWOeG79gU=;
  b=H8vT19JkoY9lW8wGVOQxN1tIceI5atQBJVSOPH0y95PiimMXxl5c5ACL
   J6Gy3h4DjYtiWDJsGJuaRyD9GCwbLmOURHxzJqBZYgkjzAUNsetZq34yB
   s8uPHK5LewSujXoUV9eVM2gE2jo3ognyEN47oL5+wzxEmYcjWpwk6Sd5O
   QtS8BQUlIjfOap2DiARu0OC7ov9PVPZ5FbgVxK8bxT/Quj76PlDhcFV6u
   LJrA75kC1UpsoQEy+raInH0pMpqOaGJKZogloUL0lQcGhBtfdIXj7p78y
   oIHaMtzBRL1w5F/brSTBTOvkbE4Zx76vYwSZis07+zpuG6I0ZvUnrTW47
   A==;
X-CSE-ConnectionGUID: 3h27R2lGRrqgV+MBSgebfQ==
X-CSE-MsgGUID: 1MIOiB2XS/u1vwn27IGU0Q==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="173371334"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Sep 2023 22:22:06 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 24 Sep 2023 22:22:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Sun, 24 Sep 2023 22:22:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWg+FdsgFZ4KwRo9rS4oyPaEAdqGVZJEGfS+MisYC3xS34lullFc6+xqlm0KLdS02AxOMQ2uPJzhopk4nnSfMlM2Xpvlk7Hp/OE+SBPDZ627dQNRScCBkL4FQiHY+qnsUMPdylgisiRCj8M50RSTAFDCJm2iJXDOQ2Ad4Ztzf1EAAq9eu/CoSTrCvQ9/pri7vRu9LS8ntM8m632ZgdUg5sFIiM3I3XUXLS/MlB1hSfIoUP3J6CoBjzd6giQMAm1r1g8oHWf3ffJwBpiFnqJuC0HbFCQy+wIL7Xod+pwhjn+hl7Ow0gWEfNLWPHsdFrTwFvi0x0c4miRANEadyTR54g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Ih93hxn2LMURoSrgUn7L1dB4hKEtztT4/VPu0evxRg=;
 b=huzHUV6zr1+QYSdGcHI/z5e4TUAW8PUjoZXaair/zNZ7hhf4ag6t0BWK4OE1hcS5Q5Aoeax1oveSQoMgMfgygGAA+TCLspd+usDEDprC9rRJTZuT2t4XDkOkHGWMZr71RZzH5kYp96/QoyzzihMQJLGsZg9eaSpTnAzdpQfFxVv3Vu9CxM9hLOQ+w/qopTBtBZE8aFYj6CpgoC8Z7LQH9ZKXejWlJLsVsV9I3SAl4Bbxwr784eJ9j42o0aBkVSnMhqi2fCAlIbpAddFSmR2+mvFqH7Bzd8hpyaqARDv89iUoJI2rwjT3T1HXnv0G9j/vIKZi9rYwTfoEzN46b8o/Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ih93hxn2LMURoSrgUn7L1dB4hKEtztT4/VPu0evxRg=;
 b=e7wG5imOH7JUsIWQeVKYBgVSf+wZu0iUBJvSoyy/oQCuO9i6STAxQDp6ciFKQbQW/6sQbaTxfZHjzqmqHOGxu0KYOuZPBkIWM0sEKihWKbAsxw0eNkuNMLZnWB80Bigl8EjkL49ME+V0K4bWynZ1zqWiIzpePTfg/6MdNcHsORM=
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by MN2PR11MB4631.namprd11.prod.outlook.com (2603:10b6:208:262::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 05:22:03 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::1133:b6c0:3f07:84bc]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::1133:b6c0:3f07:84bc%7]) with mapi id 15.20.6813.017; Mon, 25 Sep 2023
 05:22:03 +0000
From: <Shravan.Chippa@microchip.com>
To: <conor@kernel.org>
CC: <green.wan@sifive.com>, <vkoul@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <conor+dt@kernel.org>, <palmer@sifive.com>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Nagasuresh.Relli@microchip.com>, <Praveen.Kumar@microchip.com>,
	<Conor.Dooley@microchip.com>
Subject: RE: [PATCH v1 3/3] dmaengine: sf-pdma: add mpfs-pdma compatible name
Thread-Topic: [PATCH v1 3/3] dmaengine: sf-pdma: add mpfs-pdma compatible name
Thread-Index: AQHZ7TpYtoHe5V6jCkaV0cVSgcPUurAmncAAgARoOAA=
Date: Mon, 25 Sep 2023 05:22:03 +0000
Message-ID: <PH0PR11MB561127E9DFD6986C6479CC6B81FCA@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20230922095039.74878-1-shravan.chippa@microchip.com>
 <20230922095039.74878-4-shravan.chippa@microchip.com>
 <20230922-sappy-huddle-1484d64b27f3@spud>
In-Reply-To: <20230922-sappy-huddle-1484d64b27f3@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|MN2PR11MB4631:EE_
x-ms-office365-filtering-correlation-id: 18b3e43a-b1d0-4f8b-7cf0-08dbbd875a0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Kf8wbDcmtiYDemXfAAAcSyYT+Qn7sR3/hT04FuJQLFmAo1j81guoa1IYSwuIK1vTaM0uOw+YYUOmOpipME1Xpkj8+O/HSnSb5aWJPI0mFoazW+PiuFTVbNpIIy1AqpRTTTUD+y7suTW6PsCNaE1x6IlNE/fFZoxEBRIRAyrKklC6bObY6/xAGU05UPPkAooa22WcHALJhIM3stpYRKlM/08Dy++pmgKJzRaC6RMsRvZ3/YAuBt5Sf5NDx+kWhZoLqryhyiTgqUQP7nW82cUfq0DpcOBVKt8QwqV69KPx10U7uy4phEe/kr0kFxbe1elETswSEfiqja3UxUksZvkd4l3xr+XT3aOOeDZopqODa239QVuV1oF/WX63l0Vl3bbtVN5pK725ZJa00LzkaQqs0rbNQvrQiBVh/gY3zHr3k9XH8ea0e+b/5i9dZ6ngwxt8tmGHAXvce8NrFrLXVn4I0WTrHmZs2MYbHFYeKaqKe+PzMwnEsIeFAm+3k3gUauLAICroY8z6pMv/SfhUj6WN+uo8wcVIO08xUyXKLxvdavVkxghqcDoKdF0czAuhEzYkDRTWr6/Oc5MLWXSJXVfj7odLLk932WHfXUt24XJq99P3ABu8CBPdKfmBtJwJxb2q
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(346002)(136003)(376002)(230922051799003)(451199024)(1800799009)(186009)(7416002)(54906003)(83380400001)(2906002)(55016003)(5660300002)(316002)(6916009)(41300700001)(52536014)(8676002)(8936002)(4326008)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(33656002)(86362001)(53546011)(9686003)(7696005)(6506007)(26005)(71200400001)(107886003)(122000001)(38070700005)(38100700002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0uPsDPrbc5/BY5QPKKeX86SIJweJa14tcMNIPfHWaFzHCd0YCTt+ff/C5oRc?=
 =?us-ascii?Q?H7ma5E1WLFVDnoMX9jFBbN4OmnhqkXsxLdCALQKsn2mRNjdP8OJDVtJqYIIl?=
 =?us-ascii?Q?TDtlOMXi01CnDZGtN6doBZNT4x+Yr5aX6ec/A26zFHoRaD9eQXovBgRsnKCd?=
 =?us-ascii?Q?AHmr2JRDD0Fmf0PR1yl/ZGgXZRzNWen+4djKF/zfDs/Z7vqGb8WRGr2jhIFD?=
 =?us-ascii?Q?jqfjhFDwnQW0MkJO+2BkG5pQUY6TKFzn4z4uLBU2QSiCTJTyaewopkMs3Slg?=
 =?us-ascii?Q?EjDmsAjIaN/+p83ZENTjYDpMEcB8FxglS3TyEk4AV30T/pw0sLp7f8Cqqf69?=
 =?us-ascii?Q?VNbT6Nr6P2Z3UYwXyN1eEM0fxqGezQ14jb89cY0bt43dIloK4lq9hrV1Arfi?=
 =?us-ascii?Q?ubUNcCwK/K13gVVA95WdydhlczoharfGQ/Kqsjy0zC9Ftpp0pA8r1WfF96da?=
 =?us-ascii?Q?cfJIhSwm227FnXLKETRVfdio19JRr85FPRvVE5qYZSBhvCWIjg3gMUe+WvB9?=
 =?us-ascii?Q?7hRbIiTUA/8kXtBlw4K7bovz++EWpG1+uXSnQTiMnKUbdXoQCka/SVeyF2XA?=
 =?us-ascii?Q?0qK3twzHeVHlzn5ZRM4L8I12Cp5kI5eL/TL1V82oE1B0dU+T2W/Dms3+iNA1?=
 =?us-ascii?Q?Lpl5yICUwld/BsAFv1mBhNn2ef5Aiya0MNPMIYVOI0KzvwUTYrcXY7hQ3Q/c?=
 =?us-ascii?Q?2tXyXRMmfrXtpQO2PhSjD9qOkqrq5zAboYmUaL2EhyEr5+vPp7lDW7IaDOBu?=
 =?us-ascii?Q?w9f0s28lhhNkH6aRiuKiI+tNHi7uafE9FT0JL9xAd9VphNOEPANbVkZyVRqd?=
 =?us-ascii?Q?FnUvbiy+izKqkgk0tUUPkXbQCDd3jVT+mHiyfOh7hiY4IJ3lTgOZjN8dm00V?=
 =?us-ascii?Q?ZGQE6Xl5RRjnousQhjumH+QRjy1ZSYlo/7QLCCzs1fz+RTRT/YX3fpz0CF/F?=
 =?us-ascii?Q?1cRfIEoVjV0HNW+dAJqNBi2sD/X6VKj3pqlQTIi8YczpDVov5Ekiq7tAV1lb?=
 =?us-ascii?Q?IYnH1qmzMiiKWXBqXeDp+jn5PeBq0iR2LZCHUaQ4dkdFpWzX1zrp3bJ8jW7I?=
 =?us-ascii?Q?GOk5U+oeE57jjoTFCzFuApGbq86T4jwHvWt885NQ+UrwTHpoqgIEgTP6+wE8?=
 =?us-ascii?Q?1iEYBga3VfU/JSp/oPhgIzZdcUUipvYuJdnNVoYHUL6ukTreuWXuDaqdwKjE?=
 =?us-ascii?Q?dbdbhyuI56dQSmM61epxLbD68/yIdEEXw+4hEp4CXbCLoPzoh0uPX4vViheL?=
 =?us-ascii?Q?M5I4wndRomUl1VwbXjjzxxeqRoZMZb5SwsxKR9UcIDIiskM4dtRKbp2iTxr0?=
 =?us-ascii?Q?fAF7qguTbhFSomPSg9DE/CmToUd7Vk+g88SpyFXHngVCO6E0rrIysm7vEzXJ?=
 =?us-ascii?Q?uzYJuDZ8nLStPn0JkFIhOE5wqu/D5pC5Jgnwf+Y0hP86Ip9j2U9pK+yaOVqj?=
 =?us-ascii?Q?yM85Ru0Hz/b0zOZDH4/DxhXSTMchwA7UylFNCOQW322zOHjAfuuLBEG0aD3E?=
 =?us-ascii?Q?wB5HWdsNxxrhfrKZyKfrSStjyx8TzjYFNSjUS4SFe7zItObkIMv1EjnXT+Cd?=
 =?us-ascii?Q?tx5iDSDCv2RQgtVl1NnSpYE+93zmTdOxLzpVNGJbqk/jhCajQlAInPf6/3Y8?=
 =?us-ascii?Q?DA=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b3e43a-b1d0-4f8b-7cf0-08dbbd875a0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 05:22:03.1696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UegKb9uWY86qhUtZ6zb8P7hxrxTIYWjDYAKfEa5RaG7xKV87yoP4Nn6+JfRLgVEi6qk1oPZenTu6GjbuDKUFO4j29XeEvMLJEl+iTk+P0bg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4631
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_222228_379470_E233DB8A 
X-CRM114-Status: GOOD (  30.11  )
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



> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Friday, September 22, 2023 3:34 PM
> To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> Cc: green.wan@sifive.com; vkoul@kernel.org; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; palmer@dabbelt.com;
> paul.walmsley@sifive.com; conor+dt@kernel.org; palmer@sifive.com;
> dmaengine@vger.kernel.org; devicetree@vger.kernel.org; linux-
> riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Nagasuresh Relli -
> I67208 <Nagasuresh.Relli@microchip.com>; Praveen Kumar - I30718
> <Praveen.Kumar@microchip.com>; Conor Dooley - M52691
> <Conor.Dooley@microchip.com>
> Subject: Re: [PATCH v1 3/3] dmaengine: sf-pdma: add mpfs-pdma compatible
> name
> 
> Hey Shravan,
> 
> On Fri, Sep 22, 2023 at 03:20:39PM +0530, shravan chippa wrote:
> > From: Shravan Chippa <shravan.chippa@microchip.com>
> >
> > Sifive platform dma does not allow out-of-order transfers,
> 
> Can you remind me why we determined that this was the case?
> IOW, why could we not enable the out-of-order transfers and get a
> performance benefit for everyone? It's been a year or so (I think) and I have
> forgotten.
> 

I will try to modify the commit message.

Thanks,
Shravan

> Cheers,
> Conor.
> 
> > buf out-of-order dma has a significant performance advantage.
> > Add a PolarFire SoC specific compatible and code to support for
> > out-of-order dma transfers
> >
> > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  drivers/dma/sf-pdma/sf-pdma.c | 27 ++++++++++++++++++++++++---
> > drivers/dma/sf-pdma/sf-pdma.h |  6 ++++++
> >  2 files changed, 30 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/dma/sf-pdma/sf-pdma.c
> > b/drivers/dma/sf-pdma/sf-pdma.c index c7558c9f9ac3..992a804166d5
> > 100644
> > --- a/drivers/dma/sf-pdma/sf-pdma.c
> > +++ b/drivers/dma/sf-pdma/sf-pdma.c
> > @@ -21,6 +21,7 @@
> >  #include <linux/dma-mapping.h>
> >  #include <linux/of.h>
> >  #include <linux/of_dma.h>
> > +#include <linux/of_device.h>
> >  #include <linux/slab.h>
> >
> >  #include "sf-pdma.h"
> > @@ -66,7 +67,7 @@ static struct sf_pdma_desc
> > *sf_pdma_alloc_desc(struct sf_pdma_chan *chan)  static void
> sf_pdma_fill_desc(struct sf_pdma_desc *desc,
> >  			      u64 dst, u64 src, u64 size)
> >  {
> > -	desc->xfer_type = PDMA_FULL_SPEED;
> > +	desc->xfer_type =  desc->chan->pdma->transfer_type;
> >  	desc->xfer_size = size;
> >  	desc->dst_addr = dst;
> >  	desc->src_addr = src;
> > @@ -520,6 +521,7 @@ static struct dma_chan *sf_pdma_of_xlate(struct
> > of_phandle_args *dma_spec,
> >
> >  static int sf_pdma_probe(struct platform_device *pdev)  {
> > +	const struct sf_pdma_driver_platdata *ddata;
> >  	struct sf_pdma *pdma;
> >  	int ret, n_chans;
> >  	const enum dma_slave_buswidth widths = @@ -545,6 +547,14 @@
> static
> > int sf_pdma_probe(struct platform_device *pdev)
> >
> >  	pdma->n_chans = n_chans;
> >
> > +	pdma->transfer_type = PDMA_FULL_SPEED;
> > +
> > +	ddata  = of_device_get_match_data(&pdev->dev);
> > +	if (ddata) {
> > +		if (ddata->quirks & NO_STRICT_ORDERING)
> > +			pdma->transfer_type &= ~(NO_STRICT_ORDERING);
> > +	}
> > +
> >  	pdma->membase = devm_platform_ioremap_resource(pdev, 0);
> >  	if (IS_ERR(pdma->membase))
> >  		return PTR_ERR(pdma->membase);
> > @@ -629,11 +639,22 @@ static int sf_pdma_remove(struct
> platform_device *pdev)
> >  	return 0;
> >  }
> >
> > +static const struct sf_pdma_driver_platdata mpfs_pdma = {
> > +	.quirks = NO_STRICT_ORDERING,
> > +};
> > +
> >  static const struct of_device_id sf_pdma_dt_ids[] = {
> > -	{ .compatible = "sifive,fu540-c000-pdma" },
> > -	{ .compatible = "sifive,pdma0" },
> > +	{
> > +		.compatible = "sifive,fu540-c000-pdma",
> > +	}, {
> > +		.compatible = "sifive,pdma0",
> > +	}, {
> > +		.compatible = "microchip,mpfs-pdma",
> > +		.data	    = &mpfs_pdma,
> > +	},
> >  	{},
> >  };
> > +
> >  MODULE_DEVICE_TABLE(of, sf_pdma_dt_ids);
> >
> >  static struct platform_driver sf_pdma_driver = { diff --git
> > a/drivers/dma/sf-pdma/sf-pdma.h b/drivers/dma/sf-pdma/sf-pdma.h
> index
> > 5c398a83b491..3b16db4daa0b 100644
> > --- a/drivers/dma/sf-pdma/sf-pdma.h
> > +++ b/drivers/dma/sf-pdma/sf-pdma.h
> > @@ -49,6 +49,7 @@
> >
> >  /* Transfer Type */
> >  #define PDMA_FULL_SPEED					0xFF000008
> > +#define NO_STRICT_ORDERING				BIT(3)
> >
> >  /* Error Recovery */
> >  #define MAX_RETRY					1
> > @@ -112,8 +113,13 @@ struct sf_pdma {
> >  	struct dma_device       dma_dev;
> >  	void __iomem            *membase;
> >  	void __iomem            *mappedbase;
> > +	u32			transfer_type;
> >  	u32			n_chans;
> >  	struct sf_pdma_chan	chans[];
> >  };
> >
> > +struct sf_pdma_driver_platdata {
> > +	u32 quirks;
> > +};
> > +
> >  #endif /* _SF_PDMA_H */
> > --
> > 2.34.1
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
