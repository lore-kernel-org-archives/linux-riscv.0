Return-Path: <SRS0=p8lL=J3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 816C8C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Apr 2021 04:07:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8C4F6121E
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Apr 2021 04:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8C4F6121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zBbLSDaFM4+PDqvFuyvR0uJgLjmaWHpajN3NO+SqK2A=; b=YKjLtD2h0OgVv0YZmCOM4dCOA
	+IaQ46Ntw8KXKFzyOXWm87vJPjZSj/KsrQPnfyuFR16leteZuAsicO3IQecen37Ae23qYkJL4ADQ1
	cB9BcGg1k7K2HCRXFiYcoUbdaZDGWqMKTHyaqhwImcnkRnODGlTuBS6asD/Y0MhzXDWwIOut+lANk
	3YurI7M460fcUyoocHW4udxX6GJIbxxNJqFEJ9wazkYMF5d70Px9zxGpoy5YqANsx4cId2+ZKa/fk
	RPmPK5xq7pyGnpB2kiGRtKN9/5s4/oyZVzqEJvqQvt5R3bcLxQhkCmj0hEBaZ9RWZbKFm7py0kgL5
	8eRKxIQpg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcKQT-00782K-Js; Fri, 30 Apr 2021 04:06:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcKQP-00781Z-GT
 for linux-riscv@desiato.infradead.org; Fri, 30 Apr 2021 04:06:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
 :Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=UafV2C2oXFHtqbhHQOdN+0VKmOnk+l6Whuq3Qmcn8G4=; b=W4oeEp3Xex09wECOakuy9An5GL
 2FyIJUdz1TfGZeXNmHIeJcJMOmsH2WLTp4xkAW5OEun5sRWmv5SUB+Hqe2IdXWikr2BfFqmenjyk4
 /n7nG+1/SLjNItufvUfkTi1Nf1IKwbA4WP8N1Zw4Xl9FM8wHShD3nYmCtMx0+o4P+jXF2j90Z8lb7
 m/fxdb18R+tZR2Dk9SXXYDZh2yybOJmFYxV04g15KbI8N7LedzjBID1JXF2VD786lQzY60rLb9h1u
 iWRTsXHTia9/qF3n6MEjsBy/gan+q2OBIDPgS8356lsz3Mbc1MGGBOF9nPjm17kpnvMpbZee611x5
 dgXS8o9Q==;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcKQK-0016KK-Fs
 for linux-riscv@lists.infradead.org; Fri, 30 Apr 2021 04:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1619755600; x=1651291600;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IQ80bnySfRXRxuU2drtO5GtuaETmfXcSvBFM+5EXFlI=;
 b=CUp8JKHodMNb/7YsJnxvNKklQ9RIgw9VTKdVcSD0xhXs5RM0iPKyuygA
 xHNKeQcZNuPfEmyvDMpVHa5yQyJS6Ta5yIiquxoxsQNPfQOdUoWeriNw/
 wr9QyrHnJ7MW+UzRajUhkB5D2tGRI5xqaYhteEA0SN3x2NDx9mqOvp6Rf
 i7OUTV+ob0XVpUj+EWRB6QvmL5+QPfKNumJNlYYCnkN3yVo3OR+igQ68u
 rn+Gr7RCiEstuxaulHJKTbnf4RCA4MTfRnbHJA/7h4qZNhUXOBb+VJM3p
 0y+iFwa+oHRjLtQ9SfTY+/1CzALxBzHdaRHtqYhnWVf9PEHLLcuO88o4C g==;
IronPort-SDR: YkmvJBfVQsvNz20PVO73+wOnctsN7Ft0FDPGHOeLrHxKqpP9TUaYoV8lHNiviuscxd7E3q0eI2
 xKfB67zb+pxseQGQjzHGFqvrqfn9NAxBhp30MT5Iuh8pa5q4fnRQF+hZHDl6uYEhhIzz90BKAA
 L0RWjFCSyd64ETFJZDSOzKCDpM+5XkmUamE7zacFXmn2OuOioyPVOqPJ7LV9or4fAIRzUB9IZx
 Sliv144dRRaGaPl0nMuNFEw7tM1Ng49HXIUHYiyv2lUuy47GVMSdcg2k0un5yY0jWF+FxyJU08
 CPY=
X-IronPort-AV: E=Sophos;i="5.82,260,1613404800"; d="scan'208";a="166089312"
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hgst.iphmx.com with ESMTP; 30 Apr 2021 12:06:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAT4ivY/u9GNoknAQyWLWhzLJqhF3aTzrCClkr/o3FMMMJaP2mycMKhdT5HMWwtBmRtu93vdjELHp7uenb7zxHycKw6s7YON9Uxs89HB0O8Qh9UGO3ia+2zOBPoMpAnOfl8forSkAAlS9s7p5rbHMXcTpJhl4QzLwFFbNC9gEXbMuF2+P6at7/g0vwThZwnP8QWO9HLeJuNbJ5tUlGU7NeWk6kWcEVZYgszacxW7ALdlAvg/aK7pNhcQaLD1fIHYnM8qtxuR3TocowUwMEI/HFoUkwPod1O4KMNGmomR3urcFi8UIJvKl6RH3aTooDfkc6wHYfdmmZ87XyLD6Ua4nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UafV2C2oXFHtqbhHQOdN+0VKmOnk+l6Whuq3Qmcn8G4=;
 b=QP3UWvzNrKP78stD3N/1v7CucurupV5pdSEN7+DhaeCqO41l2svZ9B1LNyYGKHr2iUvuXsqdPl5MX6CH9bCHkZfze4xqL6JO6+vgA7AIHk9EXSiXrY+B0eSpB8XE6AR3Bla9ERhoIPfRwUjGPSHUxwR5lY8F3/tJu/pdRxuK1JZa9pYscDUhR3qA4Zug7qzDpJdyCUaG2gZ3h+BmVgeQ9e0Jc80FJcN858XA0FmmKQ44KjXuWqE38NwhU23gPXqd3Ab++SrOz45RhmBaLAVPA4DnNVaxVJHKRl6CSq9loNNYMhtWBFOXm8H0MwtMTonda+UNkD14vCEL9KCPrqkH8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UafV2C2oXFHtqbhHQOdN+0VKmOnk+l6Whuq3Qmcn8G4=;
 b=og9YOKz+lHEdpwQaHCIR2UXq2zrdpLak7YzNV1sa51mYtGU8hIPhGlIOo/WbW7wcj9S07I7kxChb8pLG4bnNA1I3DCjlp67iskj1y5DeNcUsGmwiHjrbB5IawVnvnn+PGEvbkc4hK8w7STQtFBh2S6aUhNJUwy8GLgSnWwKvHzc=
Received: from MN2PR04MB6207.namprd04.prod.outlook.com (2603:10b6:208:de::32)
 by MN2PR04MB6029.namprd04.prod.outlook.com (2603:10b6:208:da::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Fri, 30 Apr
 2021 04:06:35 +0000
Received: from MN2PR04MB6207.namprd04.prod.outlook.com
 ([fe80::2cff:8019:a3d5:3755]) by MN2PR04MB6207.namprd04.prod.outlook.com
 ([fe80::2cff:8019:a3d5:3755%6]) with mapi id 15.20.4087.035; Fri, 30 Apr 2021
 04:06:35 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Steven Rostedt <rostedt@goodmis.org>, Changbin Du <changbin.du@gmail.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "peterz@infradead.org"
 <peterz@infradead.org>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 "jbaron@akamai.com" <jbaron@akamai.com>, "ardb@kernel.org" <ardb@kernel.org>, 
 Atish Patra <Atish.Patra@wdc.com>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>, "rppt@kernel.org" <rppt@kernel.org>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>, "zong.li@sifive.com"
 <zong.li@sifive.com>, "guoren@linux.alibaba.com" <guoren@linux.alibaba.com>,
 "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>,
 "0x7f454c46@gmail.com" <0x7f454c46@gmail.com>, "chenhuang5@huawei.com"
 <chenhuang5@huawei.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kernel-team@android.com"
 <kernel-team@android.com>, Palmer Dabbelt <palmerdabbelt@google.com>
Subject: RE: [PATCH] RISC-V: insn: Use a raw spinlock to protect TEXT_POKE*
Thread-Topic: [PATCH] RISC-V: insn: Use a raw spinlock to protect TEXT_POKE*
Thread-Index: AQHXPL+/nC0TgFS8Ak2mo06nM8KQNarLsFWAgABauoCAAFHTAIAAFTAg
Date: Fri, 30 Apr 2021 04:06:35 +0000
Message-ID: <MN2PR04MB6207E102997326E6513416AB8D5E9@MN2PR04MB6207.namprd04.prod.outlook.com>
References: <20210429061713.783628-1-palmer@dabbelt.com>
 <20210429123007.5144fc0d@gandalf.local.home>
 <20210429215451.yuey5gzmfh2dkzp5@mail.google.com>
 <20210429224742.391154ae@oasis.local.home>
In-Reply-To: <20210429224742.391154ae@oasis.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: goodmis.org; dkim=none (message not signed)
 header.d=none;goodmis.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [122.171.168.110]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b47abb9-a9b2-4302-25ae-08d90b8d58e1
x-ms-traffictypediagnostic: MN2PR04MB6029:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB60296723571BF766C75A30038D5E9@MN2PR04MB6029.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6CAxK1R/SxWq1qDCU0jsRjziKpSnhbcTQ7qq0Mur4vGzNPjz3rapV9l1h9Hpe0OCYLgFFTsUKQWhOBmgUoVbT5fmmxDnGMKXO/klznKud3q4JWujOtfqDW9NUu/XFYD0cFf8ioF1OVsZbOWCsuHTo61pNM+iL/woTVMWuWGumpdBVsrkn3gfqyoYiQpl/TYwx8sci0PiwyrZpQwyMgw1r29R6csgCaA1sU3pajOOK/Lj8LgtH/UwDQ5tZL5svlANWS1D92Oq/wOzecTWEy3Wi0M5Cln+IcGKHq0Z9+Uiz2gMd8Ht5ugQZ3E8aMtRaxgUzCCF0kwPGCy3D/ctDDS0eJT2zEq8upmLhTaaOcbq1cdK+9AhKmlzcg0NyTcwcBZmkeV+ZVJf7xHGFLpCDaQJRV9ccKP0nJoOzk5ZBdpSo7utIHT0407nESrQbqBCiOhIBfL9z/oO5nL1nBfuSlUbhH6EGQFonjklGixuPqLNp4WGjtNKna/QYyn54l5cYzH5d78ViYXaG61JHJteYqMNO4U0pUmfpvAMrslMhr5huopGDBQDx9s9IwPMP5jCDiLMQ2vTa7bS8xQDXpV1JJILuF+JglXBtUP2DTnQ3aKZnAeSq510TVysmJenqXRfZXUt2vEvGK3OyhvZAQUQdgq4b2RzlqvRg/zTi7EJsUqku9ThJIBvBN2OlNXIXLNo2dcS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB6207.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(52536014)(316002)(7696005)(8936002)(122000001)(71200400001)(33656002)(66946007)(7416002)(8676002)(186003)(38100700002)(2906002)(83380400001)(55016002)(64756008)(4326008)(6506007)(26005)(53546011)(86362001)(5660300002)(76116006)(966005)(66446008)(54906003)(9686003)(66476007)(66556008)(478600001)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?cpOfDgzkJEOfIg8xLzvzystDsI6N3M0tqB9+dIVre+bius3KCXWor5h4uVpn?=
 =?us-ascii?Q?wBg3IhF1imVV+4vIfDUCick1/+snshxZzOvi3v0XYB6sqNeMvPGRr0r/k/DE?=
 =?us-ascii?Q?igKMAL1Z/aoh+Z4P8PoQBQue+O+UuRZ8l/JHOGtNglbgTZMiH7mVgI0oXReE?=
 =?us-ascii?Q?lCmWIwn6g8bPXEInq9f3uIPLmrQxVSxqu2+jM9WrjGFPYRXXp/Dsm5j7Qh1A?=
 =?us-ascii?Q?6RBJXZdM6DCnUJlMkhGL8iAkLONO6ONeTRLRpRp4f+q1gtU02aELEDbvYn/b?=
 =?us-ascii?Q?vgDA+EDjj+UPGkt7dLuY+V9YBxD2xjd4+DvUklT5S8RObjkND79XrOvVF9CU?=
 =?us-ascii?Q?fVXelFwaB4eIX1DUWsA3XVoyG6sTZ0bYb0qtpj0rAYx9xTbE48Th852qhoUB?=
 =?us-ascii?Q?RS7ERpLIxz/duxOK+ptHvFwQgYaWL0a66g2IsMBBcrlBNrZLyfetU23h+KiX?=
 =?us-ascii?Q?bnd4BRfVfE8vilqU+QYjK/RFJQ8a2xLxgsTIT0eMXDP3Lr6T0AuejQSbZQF2?=
 =?us-ascii?Q?RfYALPFMeygxh4hBoWkhv6MUhF468DS51C/0YztiFEDswc7zIoyAaDF3B3p9?=
 =?us-ascii?Q?FlA46wLeWRnO2ECCNMhaAP3zsICTp1yYGRCsyBqQ0LVP9u6xb78+3vzKGvqx?=
 =?us-ascii?Q?GnM6i8ufWlAwlL2pKoLzyUB/ZAlFW6YM/vbEjjUc0sgv6bd9mohSY+CSjLxz?=
 =?us-ascii?Q?scxycKj7EQ8Syg8hhV0WQqzQw1nImDP6pkBIrIzzH3KdjGlhSy82QaIvIcz9?=
 =?us-ascii?Q?Br1iDaeCIRBCueGrmDb9cHGha/crYNvCiH/RXUh6zP34mbEE3WMxmTkmcq+B?=
 =?us-ascii?Q?Wy80h28bUja4v3RRAD2bIzC8OMkgaRPIfMFfJPd+7zaIZh/jCZHAhW7UF0Fn?=
 =?us-ascii?Q?JzdmeUszf+QDWDJEhE9UFaAoPcYTYnCS9a+GErWELraklyuqRnXWYrNhe2H/?=
 =?us-ascii?Q?HaE1J5jinanpof1dbVIBmPwYUBC+3kXZM+HmrevTX1kUYPNPGmwG9wvDrX3T?=
 =?us-ascii?Q?/m6YqIiM9EX4osbeLeTO0uYIZsnoetVj8ds+wwcilIb/kDnXS5s/mNRD2gVa?=
 =?us-ascii?Q?yvwODOjtouEzznL5orSB14O83vn+tWw1g729kW/pWoBgkRrf2RKaBrKM81Vb?=
 =?us-ascii?Q?njg4Jxc1BjbJ8vHjbOB25zUABSlzG3OBiVUPoj37uYtiobJHsVWCvplANAd7?=
 =?us-ascii?Q?ABYzNNB20TMiKMdGP5shQRQJmtyNcHtUl+QZOjjxXlkCGH20gdrlNS1wsj2f?=
 =?us-ascii?Q?Fv3v6zKGP725qSAaxf0ankbB7d/+ogtoIwsRXNzD+67PkJIzszOIb4xVRHdz?=
 =?us-ascii?Q?CwhvuSc0FTzIwY7U38v1VBXV?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB6207.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b47abb9-a9b2-4302-25ae-08d90b8d58e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 04:06:35.6261 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i3c+Zpe0JPZe8yurn3Xw4gvi0K8RHDKY1ULupxzl3G5fFL1OEuyOnc1uxQVff6b3P7z0HcLRmgxyn3GNX4pBgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_210640_615033_6DB53786 
X-CRM114-Status: GOOD (  26.16  )
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
> From: Steven Rostedt <rostedt@goodmis.org>
> Sent: 30 April 2021 08:18
> To: Changbin Du <changbin.du@gmail.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>; linux-riscv@lists.infradead.org;
> Paul Walmsley <paul.walmsley@sifive.com>; aou@eecs.berkeley.edu;
> peterz@infradead.org; jpoimboe@redhat.com; jbaron@akamai.com;
> ardb@kernel.org; Atish Patra <Atish.Patra@wdc.com>; Anup Patel
> <Anup.Patel@wdc.com>; akpm@linux-foundation.org; rppt@kernel.org;
> mhiramat@kernel.org; zong.li@sifive.com; guoren@linux.alibaba.com;
> wangkefeng.wang@huawei.com; 0x7f454c46@gmail.com;
> chenhuang5@huawei.com; linux-kernel@vger.kernel.org; kernel-
> team@android.com; Palmer Dabbelt <palmerdabbelt@google.com>
> Subject: Re: [PATCH] RISC-V: insn: Use a raw spinlock to protect TEXT_POKE*
> 
> On Fri, 30 Apr 2021 05:54:51 +0800
> Changbin Du <changbin.du@gmail.com> wrote:
> 
> > The problem is that lockdep cannot handle locks across tasks since we
> > use stopmachine to patch code for risc-v. So there's a false positive report.
> > See privious disscussion here
> 
> > https://lkml.org/lkml/2021/4/29/63
> 
> Please use lore.kernel.org, lkml.org is highly unreliable, and is considered
> deprecated for use of referencing linux kernel archives.
> 
> Would the following patch work?

This patch only takes care of ftrace path.

The RISC-V instruction patching is used by RISC-V jump label implementation
as well and will called from various critical parts of core kernel.

The RAW spinlock approach allows same instruction patching to be used
for kprobes, ftrace, and jump label.

Regards,
Anup

> 
> (note, I did not even compile test it)
> 
> -- Steve
> 
> diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> index 845002cc2e57..19acbb4aaeff 100644
> --- a/arch/riscv/include/asm/ftrace.h
> +++ b/arch/riscv/include/asm/ftrace.h
> @@ -25,6 +25,8 @@ struct dyn_arch_ftrace {  };  #endif
> 
> +extern int running_ftrace;
> +
>  #ifdef CONFIG_DYNAMIC_FTRACE
>  /*
>   * A general call in RISC-V is a pair of insts:
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c index
> 7f1e5203de88..834ab4fad637 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -11,15 +11,19 @@
>  #include <asm/cacheflush.h>
>  #include <asm/patch.h>
> 
> +int running_ftrace;
> +
>  #ifdef CONFIG_DYNAMIC_FTRACE
>  int ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)  {
>  	mutex_lock(&text_mutex);
> +	running_ftrace = 1;
>  	return 0;
>  }
> 
>  int ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
> {
> +	running_ftrace = 0;
>  	mutex_unlock(&text_mutex);
>  	return 0;
>  }
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c index
> 0b552873a577..4cd1c79a9689 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -12,6 +12,7 @@
>  #include <asm/cacheflush.h>
>  #include <asm/fixmap.h>
>  #include <asm/patch.h>
> +#include <asm/ftrace.h>
> 
>  struct patch_insn {
>  	void *addr;
> @@ -59,8 +60,13 @@ static int patch_insn_write(void *addr, const void
> *insn, size_t len)
>  	 * Before reaching here, it was expected to lock the text_mutex
>  	 * already, so we don't need to give another lock here and could
>  	 * ensure that it was safe between each cores.
> +	 *
> +	 * ftrace uses stop machine, and even though the text_mutex is
> +	 * held, the stop machine task that calls this function will not
> +	 * be the owner.
>  	 */
> -	lockdep_assert_held(&text_mutex);
> +	if (!running_ftrace)
> +		lockdep_assert_held(&text_mutex);
> 
>  	if (across_pages)
>  		patch_map(addr + len, FIX_TEXT_POKE1);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
