Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C3CC433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 08:26:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C81E6109F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 08:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C81E6109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=XxMA/K4/N8XFPFJCoFdX1UOm4YlXFq79c7XvZgEvaYs=; b=H0651T6KSpP7STygxxCek4wYj
	V6mni01FotEUlLO1knrSMd3mh7lIJ35QoIZ7xaGhstsxJnHr/snM2UtERIaDv1rDr7HhV4imn9lQ0
	3vnTVIH2v7GLRF115n3jTyxc3Gti3ibO8Cp7zxfkWN71UnuMO2LMUr3ehouye+GrT6J0Yjbl2JJWV
	1YJdP6H1/Y3Cj8cjbyz0E/hzDReDK1BXPkU6QG/fa0BAAU07tZ4+xRVmcU0hbFAPzxAsKwYOcGive
	CuYEqilcQ+A9yG1OgOw5YXduUU2FLX1KFt1OWXV5DNuaGjUK/KCpfS78eDp7suZQUIibKf9IoEGpp
	o8pppGCVA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljHWl-003KDK-IV; Wed, 19 May 2021 08:26:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljHWi-003KCk-V0
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 08:26:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-Type:References:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description:In-Reply-To;
 bh=DWwjHv+Pdt4L2I9dELupjyUvu9oSf+6RXBYBvHJL/gU=; b=k/qXLBXuk5NykNsHkNsw4pxhNl
 1u2l2tNfiSGhK0A76unBAKLy2Z7gJi+GM3ii5A+an8Ec5enZK4ZqoasF8J9WpxDG1V9hXXreJzalw
 l83F+55M8gQE74g922IxwBgcmifEpsbUqXvnr1BWkFkARtGorWNgbOVbXYprZIOybzZ6oet2YIzjW
 IeLonztQCdxCItEPwJVnPjeADJzsh6D4Zkzz/s/x4XBCbtFqKLf4j6nJH8jFKe6SNwZA+fyHLJhqg
 qjTgFF0A9X4V8ydrCvLKTm7ReaejvWY/AIMM76l9Dzn0g1mttBjavcjcfvZ86zdAW+7Na9Mu/WPH4
 KHydWW5Q==;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljHWf-00FHC8-Du
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 08:25:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1621412757; x=1652948757;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=DWwjHv+Pdt4L2I9dELupjyUvu9oSf+6RXBYBvHJL/gU=;
 b=Cf/F7h3rsOaQu2wQ9uvZgHH5Jy9JHms9C4OLlHMkphDzYoq3xzZNCfUh
 Dm8Q/Fx8ze55/7/KOzJp4AyWQPv4UJRh0exQJ/AtIXcVkwoIBPRfRsJy4
 4UomEW8ibzeasWfU8CwH1lxyAykU54fADkHNwkN1TeDKEXz7Mprp3qwZ5
 TgBugoM/23+6UYEfW7+8cBz6EcfEysCxzK25/HwBkGs36RfwNsQVsv8MB
 cxklSDi/1nx5C5e+/PFUpgez2t5rKD8i4N+hMkUZX9ZiInK5MeJUQJ8UA
 a32WLpiY1zJhE16BcIyyBQcWyZdYK6cVYSWv9plujfk8KpFpUTwll3dR8 g==;
IronPort-SDR: ihHjQ2EUxCHnDIFBi3sL66xCVK6q5gsNT61RfcmREB+ujLvwkxLbJfaoaxn30ynrj/056YhjZ1
 aQI3VgxgwkgxqDKY08m+8jTM5WbmuYln0yoqt9Cd/pvzAwworoDSJqhHsZequw4K+qNnrCCobD
 Ne0tg+V2e0487D7wEYKD71x7Osmrd+5k9u4o31HIBSHMnmUSNbbh2yW02RDUmLP8kQdzm/OiD4
 0qLgiVhTKhg077JTp6XBzssuuIouiU7/I7XVJM7/7gSKlD52bAkqsk5iy0nTX7DkqbapXbxS0P
 d5c=
X-IronPort-AV: E=Sophos;i="5.82,312,1613404800"; d="scan'208";a="167984169"
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hgst.iphmx.com with ESMTP; 19 May 2021 16:25:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLpCkqpg1joVz3V3fg1Wxb4+VKB2kM0QzWZpNFgM6f0w3cLoZ9oTx7oerPOy85g0zLYQBOkSKpWscqmu4SVZ/6aMz/H2M7cj4mQLIv//Op3d1ssePlpcqFKySqqYaJvEnmAdnnWyXd+4kR/CiHWAfl1aqc7v5MYdZ4chBs0xtSq+GZmBax0+zWJPNL0BsSMiDjrOGjpS1GYrVPE8j6QPIH5vvjegzHYWOYeX6IuL4VuTH6Y3PuvBaHHONXwvN22zCwiTwrURZZj+VQvVkFYw8gml+j9M2EJase02a11DYIpX7e7PoK/mmKA8PkStCJy1cQFY8pxft1hX+EVW6Vam/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWwjHv+Pdt4L2I9dELupjyUvu9oSf+6RXBYBvHJL/gU=;
 b=M8uWOEx3txWxAF9JtEOgiXSGHAjUDfvGDShL03jffqYT/HIkkQMjnVINOWHevvG0PngLct/iwp1uE1QwXFYskWk3eQ2+8ZeiSkmHkojf8IXziNlTSHPHkPWGDDBD7r4iyLXXo+ikwCFGc4QyEU3m0jRcvvkk+Dlz1fJPObwtiY8woWftjOYCvB5EwydTmb6JhYlrq2gZoY4JdNYCE51iibYmpNgDadPQ0ap88UbZB4WxQJjigO0yra8fuB4TQkfyYOlV4ndZk3O89rD9DNBDsRc1CwDWQsVKcU9J+08+SZYBLfIt4qG5BgsT8OT/2HBVuHHT9yKXUQ/jk8QSH4n1HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWwjHv+Pdt4L2I9dELupjyUvu9oSf+6RXBYBvHJL/gU=;
 b=qttKxFBQ97CnmL6H52Lhn3ap3xEtXgSpuhhE90jQAo0R6kOtPkoUwEWGKX8B+1ti+HMIv8axFAkTwe30T1JCU4Gv9D6JB5IVMPx7+EctRMt3/RP76DyY+I6awQqe8TX46PPu9Ae34ahY5CpxrbNtaYWw6ehq3HbUyEAYsHuIbkY=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM6PR04MB7082.namprd04.prod.outlook.com (2603:10b6:5:24d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 08:25:51 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::64f9:51d2:1e04:f806]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::64f9:51d2:1e04:f806%9]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 08:25:51 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Anup Patel <anup@brainfault.org>, Drew Fustini <drew@beagleboard.org>
CC: Christoph Hellwig <hch@lst.de>, Guo Ren <guoren@kernel.org>, Anup Patel
 <Anup.Patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 "wefu@redhat.com" <wefu@redhat.com>, =?gb2312?B?V2VpIFd1ICjO4s6wKQ==?=
 <lazyparser@gmail.com>, linux-riscv <linux-riscv@lists.infradead.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch
 <linux-arch@vger.kernel.org>, "linux-sunxi@lists.linux.dev"
 <linux-sunxi@lists.linux.dev>, Guo Ren <guoren@linux.alibaba.com>, Paul
 Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Thread-Topic: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Thread-Index: AQHXTGy92nyuT2I8ek2YUKBTb2A+Jw==
Date: Wed, 19 May 2021 08:25:51 +0000
Message-ID: <DM6PR04MB7081B71BCC6DE768525113EAE72B9@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTR5838=Uwc5P6Xs=G7vk80k0yqWcSsNe0OFcwc9sDBBHg@mail.gmail.com>
 <20210519060617.GA28397@lst.de> <20210519065431.GB3076809@x1>
 <CAAhSdy3C1owsbY_9gkxkhWfCXnL_noow7F4t=5+j7q+AJO3pZQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: brainfault.org; dkim=none (message not signed)
 header.d=none;brainfault.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:688d:8185:801b:83a0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5e60540-3a13-4bc7-a567-08d91a9fb6a0
x-ms-traffictypediagnostic: DM6PR04MB7082:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR04MB7082237C07C90D8CC7B830F4E72B9@DM6PR04MB7082.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r6TOyVCVSJj8rEGm+6i3IbXWGWXVc0y1x2WvEDVG/N9/7/l+jvDLtLSqZRwjQ4VB0iwViHKgsB+LfHaAsGWfMUdS+vDIjuIem+1T7LmbLzwOiY98MpWxANHRq/cBGeTYGN6H7sfxiFvfpR1GdWHs/iRtJMdX1kNWQ+kUemvWA3gzNCnejAhsUL7gd5f7zAlaZvAtebEamsmIbCElAots2+jUqydioBrvdFZc0y0/AIuiOfj6zSVZbts91mnNOc8WBfDrGb4PcPBEmhMLmSY0DKUyGYhW79OAqTBJr9WlpzWAR4cy539N/JkN4DfmUZc0VG3JrbOK2bOlFQ33SxSKGOcHxbYTWejUFCGadrtMCOgBvF7SguTursuqpwlA6X7Qp/d97REVS+V8h1O+5fcc2ZK7RMfwJ91lzmHcFoqn7PWqyvznE9C/AL54WOWq0/ywD+dZSCtCdc4mmvu1mjSx3M+9JcB6FBP22khJOeS9Wx1655XGkhcbw6C8S4MVyfC13ITczOFg5+VOIZdrQTgA1ce/sszYNHlwVUREEg6dFkwfEw81/nTnx2DmcoyBmu8Mr1E6NWomJCJUn5TSP7g0mknQi7YGj+43ioO2L7XkrCY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39850400004)(346002)(136003)(366004)(396003)(122000001)(38100700002)(53546011)(83380400001)(86362001)(7696005)(186003)(6506007)(33656002)(71200400001)(64756008)(9686003)(2906002)(8936002)(55016002)(76116006)(4326008)(478600001)(91956017)(66946007)(66476007)(54906003)(110136005)(52536014)(316002)(5660300002)(66556008)(7416002)(66446008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?bnhPZFNDRDJ1bGx1bW1xMzA3dEpoWCtWcmNBWE5Sa0R1dlRpdk8yR1h5aHVT?=
 =?gb2312?B?blpuRHczbFFMdlRRRnVQbTI3Z28rbW00aTV0OENObmZSTkc2TkJzUEhBdjFK?=
 =?gb2312?B?cnpjdnV6QmplMEhHdFdhUk9YaG5yK2tIV3YycUlPb3BjTSt6bXF3L0NReWV5?=
 =?gb2312?B?ZC83VzVoSURRRzBuSzhrRGZJRmp2dzRKemU3b0RuOW9SaDBMMmRMNVd1ektz?=
 =?gb2312?B?d1VPczBLUDFhRDlmbEV0MWlOSTZTM1Y0Y29EaDJ4bjVlYURRc0tnVmJINXB2?=
 =?gb2312?B?SU4vc2IrVGliRVJ4bjQzR1F6S0Y4ZXZXb1JIeUJ6am9qaEhobXdWOGNZMXNx?=
 =?gb2312?B?NXlIT1BjaUkzRG5kUVJJRzBhbnh6Z0dueWJmeDhBbWNaNWpxVkk2Z29jTjRJ?=
 =?gb2312?B?RW1yaHRRV1Azd3ZqMUhzTDBNa0MvU3Vvd1B6NGhiREVDbWw4U2ZPUm04dmt3?=
 =?gb2312?B?WE5SLzdveDduSTRnQ1loMnVPb0NTR1kwNXptUUlEL1lOZ0dUQlJXUTNLNzh3?=
 =?gb2312?B?ck5iSHI5S3ArT2x5bGdYVkdDVWY1amVMWkNFaVNVTFBUTzVkOXNEaElUTDZx?=
 =?gb2312?B?TTFEVnY3WnU4MTd6ejloQXRnYU9jekhyR2VkVTJ1cHBmY0FWOXRJcFV3SDg1?=
 =?gb2312?B?bW8vMWVwVkp4VHZqSE1DT2kyYXRuMGFnZDYyYUVwQVY1Y1dUUTl6aUcxWVo0?=
 =?gb2312?B?NWdiQWc5VURIQXR0T3UwaVYxMjEreFJ1ZjE2aEM1WmU2ZldhTmJlanorVCtJ?=
 =?gb2312?B?SzF0Q2RZSThzZlRiaURIOTcyeXFNblJIbllRL3ZkekNPWHFwZ1V0aTRMVVNU?=
 =?gb2312?B?VGh4QmRMaFp2MnV0a0MybWJTQU1tRzJpVUFKeFV1UFFBV3kvb2pZTmhxT0R5?=
 =?gb2312?B?WjMvcGZyY2dCNmNBS1hNdndiMm5TUHhOSFhzbjM1TUx0b0VNanUvUWpRejlj?=
 =?gb2312?B?TWNyRXcxZU9pWTI4bURGbmRmMWF1NkRzNHhvdW9sQjFsL0NTelJJL1IvcGRt?=
 =?gb2312?B?WjNKWTA4N2JnYnUrNVZRZ3Njd2pIcElha25oVnlENFlXMmxDTTVQY04raVdu?=
 =?gb2312?B?UU5lODhKMzVHOG1NWHpOK0xQbXJyK0h5eTJ4Uk1pR1BBeVFTS2F2MjYyQUdY?=
 =?gb2312?B?VjJtVzNFd0NmdFh6ejN1QXdJWk9leVZNMGZ3elZFemRwb0l3ZHlpK0M2ck9x?=
 =?gb2312?B?WHRzOVNJZHd6bllZZC9ycGE1Q3RRNEsyNlVHZHkxOTNtc0hLZFRiZWpJcmFY?=
 =?gb2312?B?MHF1VFgwQmt6b0h0aC9GRDdtMi9saXZFWCtPZTZCVEhEY0hTaGp3Y2lULzMy?=
 =?gb2312?B?b0l5Q2w5TFVQOEtGM0JqV0NleDZwTkExbDJ1aU85K0U1b0tILzBQQzVjdHFW?=
 =?gb2312?B?MHhGQkxTa1V3Vm9tdkpYcjJYU2FObHRXYkR4cW1mZGVYb3EyWVZuOEwvaU9k?=
 =?gb2312?B?bXpNb1k0dTk1aVdzWW40SCtPTlpSc1AwVzMrS3dlaVBwTE44Slc0eE5ValJG?=
 =?gb2312?B?VHFrbkhSUmtHdHk5bDFCZE5PT1l5NktBYTJwdlljUldFQ2VFcmNTYUJ0N0dC?=
 =?gb2312?B?MVloOHcvYVdBVWNvc3pzdFg2MTlodlNzZVZJTVVsTHpSYVhkTTUzV2RjZFRX?=
 =?gb2312?B?cWZqbm1ORWdBdUNCMEw1ZHBLeXcrWThDN3lJSk80WG8wL0ZYMDdYMWtSYktB?=
 =?gb2312?B?bU44WWlHWlQ5cVRLdDFRMW5GVVpvN0ZwTW80a3NFQjltSGtMMytiV1htc2Vn?=
 =?gb2312?B?YWhNVVN0dUhxNjN3QjJvWnhMTkxHNzNNdnZTT3c5V2h3OWFJMEFFZEVXaER6?=
 =?gb2312?B?YkZSSlRmUWF0Mks2YVZZdlpYUVFjNFFFMDNxWHgyUk1Ob05oNFFxYTc3NkdJ?=
 =?gb2312?B?V3V4bGcvYnBrN1ZndWRiS2dEOWlYTG92T25aNEVUd2kyQ3c9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e60540-3a13-4bc7-a567-08d91a9fb6a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2021 08:25:51.4539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XVCSn3BwdxclqOYddvmHu668SG2C9924wxRQymgN51CvVC51cZmhP0MhKjGhxhAdIiu1y9XB0wm+1vGvAp/q3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB7082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_012557_552185_89C5D458 
X-CRM114-Status: GOOD (  24.35  )
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

On 2021/05/19 16:16, Anup Patel wrote:
> On Wed, May 19, 2021 at 12:24 PM Drew Fustini <drew@beagleboard.org> wrote:
>>
>> On Wed, May 19, 2021 at 08:06:17AM +0200, Christoph Hellwig wrote:
>>> On Wed, May 19, 2021 at 02:05:00PM +0800, Guo Ren wrote:
>>>> Since the existing RISC-V ISA cannot solve this problem, it is better
>>>> to provide some configuration for the SOC vendor to customize.
>>>
>>> We've been talking about this problem for close to five years.  So no,
>>> if you don't manage to get the feature into the ISA it can't be
>>> supported.
>>
>> Isn't it a good goal for Linux to support the capabilities present in
>> the SoC that a currently being fab'd?
>>
>> I believe the CMO group only started last year [1] so the RV64GC SoCs
>> that are going into mass production this year would not have had the
>> opporuntiy of utilizing any RISC-V ISA extension for handling cache
>> management.
> 
> The current Linux RISC-V policy is to only accept patches for frozen or
> ratified ISA specs.
> (Refer, Documentation/riscv/patch-acceptance.rst)
> 
> This means even if emulate CMO instructions in OpenSBI, the Linux
> patches won't be taken by Palmer because CMO specification is
> still in draft stage.
> 
> Also, we all know how much time it takes for RISCV international
> to freeze some spec. Judging by that we are looking at another
> 3-4 years at minimum.

Which is the root cause of most problems with riscv extension support in Linux.
All RISC-V foundation members need to apply pressure on the foundation and these
standard groups to deliver frozen specifications with an acceptable schedule.
c.f. the H extensions specs which are not yet frozen despite not having been
changed for months if not years.


-- 
Damien Le Moal
Western Digital Research
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
