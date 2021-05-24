Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E13C2B9F7
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 02:49:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 680406140E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 02:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 680406140E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=UIcqIAFDmLmx8957QP9GzJthUGhSwjGOLpUVD2GSeow=; b=IWuNusZCeq8nr7
	lYNp8qc2CE1ebYvvGNHUHDazfrZFsgfveGgsykpwuik6jSZZpzyjsshnDxmPaiOeQgL1Wfc/zwcBy
	AKl/GN3vVUjdewwgktqMFUmkrnoDgLyxf8OxzGehqCLkUv4k4uQVnVLLJikC0Roax6Csehb2Z3MQ+
	F4QycD0KydzrwUznjQM8FD6y4rZGflrY9wS0QSImJlMYP06bUCbRHVoeztYbCTavTbH/h+QUP21uS
	e/yY3mUPLrQIMb5aLPwwBvFrwZgNOaSktSV+nhWFax2JUqjoMvTu7LmM/9RVFQKlmSgtfSXbOOUQJ
	/bhQf2wWR9+UXcrWsXfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llN8Q-002zrV-SY; Tue, 25 May 2021 02:49:34 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llJga-002HOL-26; Mon, 24 May 2021 23:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1621897715; x=1653433715;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=u5hxu/oLMUwpJxXL7qYIX+G7am8QB+9rKdd7n11Oico=;
 b=jVefNMVVknKAaegnu3Z4e8v2Vt6UeS+leL4xH/bSUX8vTWHf78seCHzU
 3IG8I6BgmxT6SOCe2CwVJ6fov7KlUOOH+9hCidHEF5VGCa/y87ppSruqI
 SoY22eL3UveWKm+8K7P65E7rAK6ActfDbxEbnGNvj/a40sBoIwexTYrgR
 /qRIHF/xzU0mJkwym9uFfvnNliy8jRF99ZCDE+oAKzsFynF4UO0EjtiXW
 PgjLr55yeknoJ6xTs/x4NaWTSUeoqCsv6GuzvOC+DVByZ8CuBU78XoXKC
 lRo2JQiXZx5GU5F/xPID2PMfuPPObM9XW8IogMIFQRX/VHmk3cloeXVpF A==;
IronPort-SDR: J0DZGpyptfWeeEH4yGdhG7C8BIonjtWgzWREQpGcmpv8sGCkXMCbo1N/a0caYS3ZnlQ0ZhxMl4
 ozlo0SOTGJYazygpnYlYwg4dd25WTVc0uorJHLUpYVdhNs9/6lZnZhBBDFNeypHxsj+Tz4Dz8D
 0ml2uQ3cxkA4mcsIbFNSjqsLzka1z0FPNPY/1ud0H5NooSps7ayABdw15sGT+khtAy5wLEwxnh
 Qh90pOzvVX55EcRpmhH/ppf3tfSIOT4YsN19ZvnN7Iy6ar0MTIhQ1XnYiMhn25PX5+PnIkvdRI
 A5k=
X-IronPort-AV: E=Sophos;i="5.82,327,1613404800"; d="scan'208";a="280587040"
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2021 07:08:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMQF20omfak5RyHZvz++mnwuBPWq76rSeKmS5ey0LUved/h4BzZimNDZN7s4c6lJIdJllMZ8exwpRAE4lbC+NlmVymlXaAgrDC4c17FaxQJbCYJ5gwUYqQL2qUn3HV/7sDlD9313grw512Pn4CNd4ozzdtZQ+zQ9leKLA7PZIQNki5qAnBauch1mac0CM/xFvnYqf9OdLwm1IJn08r866izOzl+WkP7u10zz0Yyh8ZSZTmMZm8XbjN5m+Qwj+aW0m9l6ut8LkklmA+nmFo2dUc6+HIStSjTqgNA9mehYa4un3ahdJ2bZLjT0m9L3eYezU7BhN5vRoeVnvHuMOvDHjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPuNmpaB8CJpY0oMAsNQwmn9udWlehH/GjazbAckpL8=;
 b=BVzYpDOOkAgT2ynN9J0ZEDAEWpvG12NgP1qvC6i44ebwJf42JjhOKHFQi9ZWL0fsmsOoQxeF5LSHgW5eLTAnPG3TyI6sQvP6qQW5DwC6JsG3jtHXJk78NktokADiJBvd3uIHL+kCyQOcr7L2UfoGJNRm71KJwyAx0j1bOcljboauuEUc+797lzY/3yQmlqxIpq+295S/P4Kxhld8iQ7WvXIBwxvZecQJAF2EoqTH8NPRHEe8Cifl6R4VAIpSEX/XyJbIu8bZgId9GEJRNPVWBjrm8BEiXZMMS/ktUS4GHfbChXC/yVnAXU+sFsqL4glSz7of6PbPVGQ3D0rumkdBeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPuNmpaB8CJpY0oMAsNQwmn9udWlehH/GjazbAckpL8=;
 b=jIGC8n6hT+x1m1HKk+RxdbYsBbcH+Tht4Nbrpwq+bPzeCDR9dJTK0H9lONgfI7CX+Af08UT4aielfq51+RnMhVuPtHeXOGOwjiCuowu/5dzXMGKTWPPKc655K6UCOx9/HvW5L7C5XVGShAeUkIgxv51xrsI2vPPd+21a35dWHHI=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM6PR04MB4346.namprd04.prod.outlook.com (2603:10b6:5:a3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Mon, 24 May
 2021 23:08:30 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::64f9:51d2:1e04:f806]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::64f9:51d2:1e04:f806%9]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 23:08:30 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>, "guoren@kernel.org"
 <guoren@kernel.org>
CC: Anup Patel <Anup.Patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, Greg KH
 <gregkh@linuxfoundation.org>, "graf@amazon.com" <graf@amazon.com>, Atish
 Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "anup@brainfault.org" <anup@brainfault.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "kvm-riscv@lists.infradead.org"
 <kvm-riscv@lists.infradead.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-staging@lists.linux.dev"
 <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
Thread-Topic: [PATCH v18 00/18] KVM RISC-V Support
Thread-Index: AQHXTGAgKECmO/ER7EehkQtXersO1g==
Date: Mon, 24 May 2021 23:08:30 +0000
Message-ID: <DM6PR04MB708173B754E145BC843C4123E7269@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <mhng-b093a5aa-ff9d-437f-a10b-47558f182639@palmerdabbelt-glaptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:9d12:5efd:fc6d:4ecd]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b83efae-2391-48b2-b0af-08d91f08d8f1
x-ms-traffictypediagnostic: DM6PR04MB4346:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR04MB43468BB1FA3EBA0F467C47D8E7269@DM6PR04MB4346.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KKh+S+Jqa0bw78lcZ8CEn0vee5e7PnfW/IydDl5IvU32eacz5osf6RXOHxA+muEZ4t7aqOdWUAgM2tocwxdX+g7olSue3Ak8HI70hYhakdtHpp3j37tcVrY+XJ2Z0VN/gkS/zM128mh4zV5hADDrPmfAFGM6hS1etl60iHsGQskhyUwbfP9i+D+oqSX0mhxzLVss+vPN4U6v7TB6b5nJZQXQMmgwIWYjYreP61ZDyh0bQVh8qeBLu9P0N1DRya38vysgIH59w3u892AI2gLRTSp5oOm+DkkTe37guVBUN0j4mKq4RnSr3l5Kl53aY3cYRsESp55fTCyPL70LUWb35ZZL65u5zUMzSBljYEc4sVPSCKX0EjjSGPLfTUect4EfkbkYyqxZ/jA6qYaZRU3p+Urk9Eq4qM8ECc8ZzrHjsIro9ir29iHoJw+qrp/0gbVIodn+Mw7laAdkKUSjkyJJ44zofsWL3BWgdWoS7r+DsbyG0ha5q0yze9fkO4L+UrESWplvGQl/8SVemPbvKQZBILh2Ugh2O1dES3VZZWav2roLX8QMg8fPOK9FC3okgpWcfKuL+FRlgm1iNTdgColMdSWCELjVnOBhooDOWYemJqQNbQKnt4jhvrlZD292aBrah8PjZg9Trh2WfAX6jEmLzNu0dVdp8QwZVBFix/5h/B8xLL4wx2VSg6nCLiHdv+NW/Kw3YprMQEMObEOmMeICFR/hZwkRZWID2bErep05m5oPkXXnzO/niMz8Kf2Xqdm+x5DnY9DXS1hMxQsM3xkykA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(39850400004)(346002)(33656002)(7416002)(5660300002)(966005)(478600001)(54906003)(186003)(110136005)(4326008)(8936002)(52536014)(9686003)(66446008)(122000001)(8676002)(66946007)(38100700002)(71200400001)(76116006)(91956017)(66476007)(66556008)(64756008)(86362001)(7696005)(2906002)(30864003)(6506007)(53546011)(83380400001)(55016002)(316002)(42580500001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?iPlNiCd5iSNkPkcWZGRDsxKlttlCiXyiVOicahhOiATCz6xvNO2sdbUBRcjm?=
 =?us-ascii?Q?9s8rkrMmIK0nfFz/mBkWH9BrnsycSocurNICiRIx0qI/mx3e18bIzrgxSjph?=
 =?us-ascii?Q?lARrpEccwfWseC2NQYXcmfCpEYIxT4bPoJ7x/CNyQ7+NZdCIeN4flerjAxaI?=
 =?us-ascii?Q?OauhiVZgjiZ/Msax2NqAJzGr8gG/UcLeikAmDeFUZGzgV9c36EyZjvixANAJ?=
 =?us-ascii?Q?9hpK3iw28pevC57OE7HBcHGRXlCzwVsa+pgREOCiYotwL6VvxOOYPreK0JrQ?=
 =?us-ascii?Q?YqhqaifAXF/OJGr1Trl/7TuWoCUDg277Faq2j8toDWbkYNRKdAYJI89KaROj?=
 =?us-ascii?Q?wXttchUSvbrStOENRMOaXPd3G/VuLlgtxMD/pGBSyGhj9n7pBPdkJgsBOXBA?=
 =?us-ascii?Q?Wsv/N5HGVEOVni9Oo0bn78LT+1LaPHB2ywDWREAMgbM6Pk2DDLsiu3Umag/l?=
 =?us-ascii?Q?HqF9fAzOmr6yiZwUfz4He9X7lL4YMv0O8OIeat3q3VgrTYCQ/upU3oyEnHo+?=
 =?us-ascii?Q?NFLww++7mFtIYiIwe/ew69JK+mCrmPAg2U2gqnkIfsyOtwyz0VLFrZqIwsn6?=
 =?us-ascii?Q?Cpz13sIgCyxPqSjeZsRHPeSd3vYExW9i0dKqcXaSYw3D1GgoF0alIIzoLuob?=
 =?us-ascii?Q?o31JI8qUhq3Meajp06iUfxlas7Lrn9WImki9GTnCZjwvcAGdQd/WsHJPskJV?=
 =?us-ascii?Q?B4SFVKjahxQG632vS0Hq7Y0vZRFimotEPAC6V3b7rZUCXhf46Qrs/PWssMqW?=
 =?us-ascii?Q?vIP+VZctDObj/+2+WpnFdW3G7UgFhKgwqLx1SVj3RYGRe21K4nwMI7UqtoTv?=
 =?us-ascii?Q?s9fECEcuMt5a1f40RN1INorlmgoSRaLPoRQwM6ERjw5rA/qeQxChpyjX0O1J?=
 =?us-ascii?Q?475SV1K2WOCBcTzKAXA/vV2Ngvb+qLH4D1Q+7jjdmezWRdGBIkBZ9ZDOO5po?=
 =?us-ascii?Q?CH/uH/I0x9iUFzwrnvjJtt+Vi7UfPNGcnckGJPgFI6IgZWL+1n9XpCKRncPp?=
 =?us-ascii?Q?CfFS9D6xwLycYPzLFt72Q/2XCWxXrD4xo5QCS9ldM8jQaImj7kHcgY3IMBJc?=
 =?us-ascii?Q?/jo7HA/jyh0qpHzHRoyZMJzGt8swSgOWNJFRhmSQHpoGduiqZfqhmqkTGGOr?=
 =?us-ascii?Q?mIZdkKJHjwf5I3MYMNpSP+BmrnypyAvoh2REdYw6gGQsIfK4WzaApbtDyS5t?=
 =?us-ascii?Q?yELnJpHCYfhoX8JZuHInLvOucwt1QGuYmJ99OkGsmYmnHT0eSI5b/2De5lhH?=
 =?us-ascii?Q?bJ9EpsyT84h+V0arfAHfEUwbG39QPfpuQiZ4JC+kGh47a3QkA23lM/C3DqsV?=
 =?us-ascii?Q?L5a/bGEmwsSzggDLVPC76AdKoNbVuDyvfPiE7lsKovrxvDseGV/BjJNt5NBQ?=
 =?us-ascii?Q?t8zfdKgliCkyYD+gx6wKASrSD5n5AjWpBZPX6otrcK+5g6ybOQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b83efae-2391-48b2-b0af-08d91f08d8f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2021 23:08:30.8229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MskZXvNnDRynah0SfI12/OB3HJ81v7DlMUmN/bxmZIOJi4PWn+e2bNoZA7rOYjukucP7VhU3qIrhtOSI2Qtk/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4346
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_160836_240197_782329FE 
X-CRM114-Status: GOOD (  43.18  )
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

On 2021/05/25 7:57, Palmer Dabbelt wrote:
> On Mon, 24 May 2021 00:09:45 PDT (-0700), guoren@kernel.org wrote:
>> Thx Anup,
>>
>> Tested-by: Guo Ren <guoren@kernel.org> (Just on qemu-rv64)
>>
>> I'm following your KVM patchset and it's a great job for riscv
>> H-extension. I think hardware companies hope Linux KVM ready first
>> before the real chip. That means we can ensure the hardware could run
>> mainline linux.
> 
> I understand that it would be wonderful for hardware vendors to have a 
> guarantee that their hardware will be supported by the software 
> ecosystem, but that's not what we're talking about here.  Specifically, 
> the proposal for this code is to track the latest draft extension which 
> would specifically leave vendors who implement the current draft out in 
> the cold was something to change.  In practice that is the only way to 
> move forward with any draft extension that doesn't have hardware 
> available, as the software RISC-V implementations rapidly deprecate 
> draft extensions and without a way to test our code it is destined to 
> bit rot.

To facilitate the process of implementing, and updating, against draft
specifications, I proposed to have arch/riscv/staging added. This would be the
place to put code based on drafts. Some simple rules can be put in place:
1) The code and eventual ABI may change any time, no guarantees of backward
compatibility
2) Once the specifications are frozen, the code is moved out of staging
somewhere else.
3) The code may be removed any time if the specification proposal is dropped, or
any other valid reason (can't think of any other right now)
4) ...

This way, the implementation process would be greatly facilitated and
interactions between different extensions can be explored much more easily.

Thoughts ?



> 
> If vendors want to make sure their hardware is supported then the best 
> way to do that is to make sure specifications get ratified in a timely 
> fashion that describe the behavior required from their products.  That 
> way we have an agreed upon interface that vendors can implement and 
> software can rely on.  I understand that a lot of people are frustrated 
> with the pace of that process when it comes to the H extension, but 
> circumventing that process doesn't fix the fundamental problem.  If 
> there really are products out there that people can't build because the 
> H extension isn't upstream then we need to have a serious discussion 
> about those, but without something specific to discuss this is just 
> going to devolve into speculation which isn't a good use of time.
> 
> I can't find any hardware that implements the draft H extension, at 
> least via poking around on Google and in my email.  I'm very hesitant to 
> talk about private vendor roadmaps in public, as that's getting way too 
> close to my day job, but I've yet to have a vendor raise this as an 
> issue to me privately and I do try my best to make sure to talk to the 
> RISC-V hardware vendors whenever possible (though I try to stick to 
> public roadmaps there, to avoid issues around discussions like this and 
> conflicts with work).  Anup is clearly in a much more privileged 
> position than I am here, given that he has real hardware and is able to 
> allude to vendor roadmaps that I can't find in public, but until we can 
> all get on the same page about that it's going to be difficult to have a 
> reasonable discussion -- if we all have different information we're 
> naturally going to arrive at different conclusions, which IMO is why 
> this argument just keeps coming up.  It's totally possible I'm just 
> missing something here, in which case I'd love to be corrected as we can 
> be having a very different discussion.
> 
> I certainly hope that vendors understand that we're willing to work with 
> them when it comes to making the software run on their hardware.  I've 
> always tried to be quite explicit that's our goal here, both by just 
> saying so and by demonstrating that we're willing to take code that 
> exhibits behavior not specified by the specifications but that is 
> necessary to make real hardware work.  There's always a balance here and 
> I can't commit to making every chip with a RISC-V logo on it run Linux 
> well, as there will always be some implementations that are just 
> impossible to run real code on, but I'm always willing to do whatever I 
> can to try to make things work.
> 
> If anyone has concrete concerns about RISC-V hardware not being 
> supported by Linux then I'm happy to have a discussion about that.  
> Having a discussion in public is always best, as then everyone can be on 
> the same page, but as far as I know we're doing a good job supporting 
> the publicly available hardware -- not saying we're perfect, but given 
> the size of the RISC-V user base and how new much of the hardware is I 
> think we're well above average when it comes to upstream support of real 
> hardware.  I have a feeling anyone's worries would be about unreleased 
> hardware, in which case I can understand it's difficult to have concrete 
> discussions in public.  I'm always happy to at least make an attempt to 
> have private discussions about these (private discussion are tricky, 
> though, so I can't promise I can always participate), and while I don't 
> think those discussions should meaningfully sway the kernel's policies 
> one way or the other it could at least help alleviate any acute concerns 
> that vendors have.  We've gotten to the point where some pretty serious 
> accusations are starting to get thrown around, and that sort of thing 
> really doesn't benefit anyone so I'm willing to do whatever I can to 
> help fix that.
> 
> IMO we're just trying to follow the standard Linux development policies 
> here, where the focus is on making real hardware work in a way that can 
> be sustainably maintained so we don't break users.  If anything I think 
> we're a notch more liberal WRT the code we accept than standard with the 
> current policy, as accepting anything in a frozen extension doesn't even 
> require a commitment from a hardware vendor WRT implementing the code.  
> That obviously opens us up to behavior differences between the hardware 
> and the specification, which have historically been retrofitted back to 
> the specifications, but I'm willing to take on the extra work as it 
> helps lend weight to the specification development process.
> 
> If I'm just missing something here and there is publicly available 
> hardware that implements the H extension then I'd be happy to have that 
> pointed out and very much change the tune of this discussion, but until 
> hardware shows up or the ISA is frozen I just don't see any way to 
> maintain this code up the standards generally set by Linux or 
> specifically by arch/riscv and therefor cannot support merging it.
> 
>>
>> Good luck!
>>
>> On Wed, May 19, 2021 at 11:36 AM Anup Patel <anup.patel@wdc.com> wrote:
>>>
>>> From: Anup Patel <anup@brainfault.org>
>>>
>>> This series adds initial KVM RISC-V support. Currently, we are able to boot
>>> Linux on RV64/RV32 Guest with multiple VCPUs.
>>>
>>> Key aspects of KVM RISC-V added by this series are:
>>> 1. No RISC-V specific KVM IOCTL
>>> 2. Minimal possible KVM world-switch which touches only GPRs and few CSRs
>>> 3. Both RV64 and RV32 host supported
>>> 4. Full Guest/VM switch is done via vcpu_get/vcpu_put infrastructure
>>> 5. KVM ONE_REG interface for VCPU register access from user-space
>>> 6. PLIC emulation is done in user-space
>>> 7. Timer and IPI emuation is done in-kernel
>>> 8. Both Sv39x4 and Sv48x4 supported for RV64 host
>>> 9. MMU notifiers supported
>>> 10. Generic dirtylog supported
>>> 11. FP lazy save/restore supported
>>> 12. SBI v0.1 emulation for KVM Guest available
>>> 13. Forward unhandled SBI calls to KVM userspace
>>> 14. Hugepage support for Guest/VM
>>> 15. IOEVENTFD support for Vhost
>>>
>>> Here's a brief TODO list which we will work upon after this series:
>>> 1. SBI v0.2 emulation in-kernel
>>> 2. SBI v0.2 hart state management emulation in-kernel
>>> 3. In-kernel PLIC emulation
>>> 4. ..... and more .....
>>>
>>> This series can be found in riscv_kvm_v18 branch at:
>>> https//github.com/avpatel/linux.git
>>>
>>> Our work-in-progress KVMTOOL RISC-V port can be found in riscv_v7 branch
>>> at: https//github.com/avpatel/kvmtool.git
>>>
>>> The QEMU RISC-V hypervisor emulation is done by Alistair and is available
>>> in master branch at: https://git.qemu.org/git/qemu.git
>>>
>>> To play around with KVM RISC-V, refer KVM RISC-V wiki at:
>>> https://github.com/kvm-riscv/howto/wiki
>>> https://github.com/kvm-riscv/howto/wiki/KVM-RISCV64-on-QEMU
>>> https://github.com/kvm-riscv/howto/wiki/KVM-RISCV64-on-Spike
>>>
>>> Changes since v17:
>>>  - Rebased on Linux-5.13-rc2
>>>  - Moved to new KVM MMU notifier APIs
>>>  - Removed redundant kvm_arch_vcpu_uninit()
>>>  - Moved KVM RISC-V sources to drivers/staging for compliance with
>>>    Linux RISC-V patch acceptance policy
>>>
>>> Changes since v16:
>>>  - Rebased on Linux-5.12-rc5
>>>  - Remove redundant kvm_arch_create_memslot(), kvm_arch_vcpu_setup(),
>>>    kvm_arch_vcpu_init(), kvm_arch_has_vcpu_debugfs(), and
>>>    kvm_arch_create_vcpu_debugfs() from PATCH5
>>>  - Make stage2_wp_memory_region() and stage2_ioremap() as static
>>>    in PATCH13
>>>
>>> Changes since v15:
>>>  - Rebased on Linux-5.11-rc3
>>>  - Fixed kvm_stage2_map() to use gfn_to_pfn_prot() for determing
>>>    writeability of a host pfn.
>>>  - Use "__u64" in-place of "u64" and "__u32" in-place of "u32" for
>>>    uapi/asm/kvm.h
>>>
>>> Changes since v14:
>>>  - Rebased on Linux-5.10-rc3
>>>  - Fixed Stage2 (G-stage) PDG allocation to ensure it is 16KB aligned
>>>
>>> Changes since v13:
>>>  - Rebased on Linux-5.9-rc3
>>>  - Fixed kvm_riscv_vcpu_set_reg_csr() for SIP updation in PATCH5
>>>  - Fixed instruction length computation in PATCH7
>>>  - Added ioeventfd support in PATCH7
>>>  - Ensure HSTATUS.SPVP is set to correct value before using HLV/HSV
>>>    intructions in PATCH7
>>>  - Fixed stage2_map_page() to set PTE 'A' and 'D' bits correctly
>>>    in PATCH10
>>>  - Added stage2 dirty page logging in PATCH10
>>>  - Allow KVM user-space to SET/GET SCOUNTER CSR in PATCH5
>>>  - Save/restore SCOUNTEREN in PATCH6
>>>  - Reduced quite a few instructions for __kvm_riscv_switch_to() by
>>>    using CSR swap instruction in PATCH6
>>>  - Detect and use Sv48x4 when available in PATCH10
>>>
>>> Changes since v12:
>>>  - Rebased patches on Linux-5.8-rc4
>>>  - By default enable all counters in HCOUNTEREN
>>>  - RISC-V H-Extension v0.6.1 spec support
>>>
>>> Changes since v11:
>>>  - Rebased patches on Linux-5.7-rc3
>>>  - Fixed typo in typecast of stage2_map_size define
>>>  - Introduced struct kvm_cpu_trap to represent trap details and
>>>    use it as function parameter wherever applicable
>>>  - Pass memslot to kvm_riscv_stage2_map() for supporing dirty page
>>>    logging in future
>>>  - RISC-V H-Extension v0.6 spec support
>>>  - Send-out first three patches as separate series so that it can
>>>    be taken by Palmer for Linux RISC-V
>>>
>>> Changes since v10:
>>>  - Rebased patches on Linux-5.6-rc5
>>>  - Reduce RISCV_ISA_EXT_MAX from 256 to 64
>>>  - Separate PATCH for removing N-extension related defines
>>>  - Added comments as requested by Palmer
>>>  - Fixed HIDELEG CSR programming
>>>
>>> Changes since v9:
>>>  - Rebased patches on Linux-5.5-rc3
>>>  - Squash PATCH19 and PATCH20 into PATCH5
>>>  - Squash PATCH18 into PATCH11
>>>  - Squash PATCH17 into PATCH16
>>>  - Added ONE_REG interface for VCPU timer in PATCH13
>>>  - Use HTIMEDELTA for VCPU timer in PATCH13
>>>  - Updated KVM RISC-V mailing list in MAINTAINERS entry
>>>  - Update KVM kconfig option to depend on RISCV_SBI and MMU
>>>  - Check for SBI v0.2 and SBI v0.2 RFENCE extension at boot-time
>>>  - Use SBI v0.2 RFENCE extension in VMID implementation
>>>  - Use SBI v0.2 RFENCE extension in Stage2 MMU implementation
>>>  - Use SBI v0.2 RFENCE extension in SBI implementation
>>>  - Moved to RISC-V Hypervisor v0.5 draft spec
>>>  - Updated Documentation/virt/kvm/api.txt for timer ONE_REG interface
>>>
>>> Changes since v8:
>>>  - Rebased series on Linux-5.4-rc3 and Atish's SBI v0.2 patches
>>>  - Use HRTIMER_MODE_REL instead of HRTIMER_MODE_ABS in timer emulation
>>>  - Fixed kvm_riscv_stage2_map() to handle hugepages
>>>  - Added patch to forward unhandled SBI calls to user-space
>>>  - Added patch for iterative/recursive stage2 page table programming
>>>  - Added patch to remove per-CPU vsip_shadow variable
>>>  - Added patch to fix race-condition in kvm_riscv_vcpu_sync_interrupts()
>>>
>>> Changes since v7:
>>>  - Rebased series on Linux-5.4-rc1 and Atish's SBI v0.2 patches
>>>  - Removed PATCH1, PATCH3, and PATCH20 because these already merged
>>>  - Use kernel doc style comments for ISA bitmap functions
>>>  - Don't parse X, Y, and Z extension in riscv_fill_hwcap() because it will
>>>    be added in-future
>>>  - Mark KVM RISC-V kconfig option as EXPERIMENTAL
>>>  - Typo fix in commit description of PATCH6 of v7 series
>>>  - Use separate structs for CORE and CSR registers of ONE_REG interface
>>>  - Explicitly include asm/sbi.h in kvm/vcpu_sbi.c
>>>  - Removed implicit switch-case fall-through in kvm_riscv_vcpu_exit()
>>>  - No need to set VSSTATUS.MXR bit in kvm_riscv_vcpu_unpriv_read()
>>>  - Removed register for instruction length in kvm_riscv_vcpu_unpriv_read()
>>>  - Added defines for checking/decoding instruction length
>>>  - Added separate patch to forward unhandled SBI calls to userspace tool
>>>
>>> Changes since v6:
>>>  - Rebased patches on Linux-5.3-rc7
>>>  - Added "return_handled" in struct kvm_mmio_decode to ensure that
>>>    kvm_riscv_vcpu_mmio_return() updates SEPC only once
>>>  - Removed trap_stval parameter from kvm_riscv_vcpu_unpriv_read()
>>>  - Updated git repo URL in MAINTAINERS entry
>>>
>>> Changes since v5:
>>>  - Renamed KVM_REG_RISCV_CONFIG_TIMEBASE register to
>>>    KVM_REG_RISCV_CONFIG_TBFREQ register in ONE_REG interface
>>>  - Update SPEC in kvm_riscv_vcpu_mmio_return() for MMIO exits
>>>  - Use switch case instead of illegal instruction opcode table for simplicity
>>>  - Improve comments in stage2_remote_tlb_flush() for a potential remote TLB
>>>   flush optimization
>>>  - Handle all unsupported SBI calls in default case of
>>>    kvm_riscv_vcpu_sbi_ecall() function
>>>  - Fixed kvm_riscv_vcpu_sync_interrupts() for software interrupts
>>>  - Improved unprivilege reads to handle traps due to Guest stage1 page table
>>>  - Added separate patch to document RISC-V specific things in
>>>    Documentation/virt/kvm/api.txt
>>>
>>> Changes since v4:
>>>  - Rebased patches on Linux-5.3-rc5
>>>  - Added Paolo's Acked-by and Reviewed-by
>>>  - Updated mailing list in MAINTAINERS entry
>>>
>>> Changes since v3:
>>>  - Moved patch for ISA bitmap from KVM prep series to this series
>>>  - Make vsip_shadow as run-time percpu variable instead of compile-time
>>>  - Flush Guest TLBs on all Host CPUs whenever we run-out of VMIDs
>>>
>>> Changes since v2:
>>>  - Removed references of KVM_REQ_IRQ_PENDING from all patches
>>>  - Use kvm->srcu within in-kernel KVM run loop
>>>  - Added percpu vsip_shadow to track last value programmed in VSIP CSR
>>>  - Added comments about irqs_pending and irqs_pending_mask
>>>  - Used kvm_arch_vcpu_runnable() in-place-of kvm_riscv_vcpu_has_interrupt()
>>>    in system_opcode_insn()
>>>  - Removed unwanted smp_wmb() in kvm_riscv_stage2_vmid_update()
>>>  - Use kvm_flush_remote_tlbs() in kvm_riscv_stage2_vmid_update()
>>>  - Use READ_ONCE() in kvm_riscv_stage2_update_hgatp() for vmid
>>>
>>> Changes since v1:
>>>  - Fixed compile errors in building KVM RISC-V as module
>>>  - Removed unused kvm_riscv_halt_guest() and kvm_riscv_resume_guest()
>>>  - Set KVM_CAP_SYNC_MMU capability only after MMU notifiers are implemented
>>>  - Made vmid_version as unsigned long instead of atomic
>>>  - Renamed KVM_REQ_UPDATE_PGTBL to KVM_REQ_UPDATE_HGATP
>>>  - Renamed kvm_riscv_stage2_update_pgtbl() to kvm_riscv_stage2_update_hgatp()
>>>  - Configure HIDELEG and HEDELEG in kvm_arch_hardware_enable()
>>>  - Updated ONE_REG interface for CSR access to user-space
>>>  - Removed irqs_pending_lock and use atomic bitops instead
>>>  - Added separate patch for FP ONE_REG interface
>>>  - Added separate patch for updating MAINTAINERS file
>>>
>>> Anup Patel (14):
>>>   RISC-V: Add hypervisor extension related CSR defines
>>>   RISC-V: Add initial skeletal KVM support
>>>   RISC-V: KVM: Implement VCPU create, init and destroy functions
>>>   RISC-V: KVM: Implement VCPU interrupts and requests handling
>>>   RISC-V: KVM: Implement KVM_GET_ONE_REG/KVM_SET_ONE_REG ioctls
>>>   RISC-V: KVM: Implement VCPU world-switch
>>>   RISC-V: KVM: Handle MMIO exits for VCPU
>>>   RISC-V: KVM: Handle WFI exits for VCPU
>>>   RISC-V: KVM: Implement VMID allocator
>>>   RISC-V: KVM: Implement stage2 page table programming
>>>   RISC-V: KVM: Implement MMU notifiers
>>>   RISC-V: KVM: Document RISC-V specific parts of KVM API
>>>   RISC-V: KVM: Move sources to drivers/staging directory
>>>   RISC-V: KVM: Add MAINTAINERS entry
>>>
>>> Atish Patra (4):
>>>   RISC-V: KVM: Add timer functionality
>>>   RISC-V: KVM: FP lazy save/restore
>>>   RISC-V: KVM: Implement ONE REG interface for FP registers
>>>   RISC-V: KVM: Add SBI v0.1 support
>>>
>>>  Documentation/virt/kvm/api.rst                | 193 +++-
>>>  MAINTAINERS                                   |  11 +
>>>  arch/riscv/Kconfig                            |   1 +
>>>  arch/riscv/Makefile                           |   1 +
>>>  arch/riscv/include/uapi/asm/kvm.h             | 128 +++
>>>  drivers/clocksource/timer-riscv.c             |   9 +
>>>  drivers/staging/riscv/kvm/Kconfig             |  36 +
>>>  drivers/staging/riscv/kvm/Makefile            |  23 +
>>>  drivers/staging/riscv/kvm/asm/kvm_csr.h       | 105 ++
>>>  drivers/staging/riscv/kvm/asm/kvm_host.h      | 271 +++++
>>>  drivers/staging/riscv/kvm/asm/kvm_types.h     |   7 +
>>>  .../staging/riscv/kvm/asm/kvm_vcpu_timer.h    |  44 +
>>>  drivers/staging/riscv/kvm/main.c              | 118 +++
>>>  drivers/staging/riscv/kvm/mmu.c               | 802 ++++++++++++++
>>>  drivers/staging/riscv/kvm/riscv_offsets.c     | 170 +++
>>>  drivers/staging/riscv/kvm/tlb.S               |  74 ++
>>>  drivers/staging/riscv/kvm/vcpu.c              | 997 ++++++++++++++++++
>>>  drivers/staging/riscv/kvm/vcpu_exit.c         | 701 ++++++++++++
>>>  drivers/staging/riscv/kvm/vcpu_sbi.c          | 173 +++
>>>  drivers/staging/riscv/kvm/vcpu_switch.S       | 401 +++++++
>>>  drivers/staging/riscv/kvm/vcpu_timer.c        | 225 ++++
>>>  drivers/staging/riscv/kvm/vm.c                |  81 ++
>>>  drivers/staging/riscv/kvm/vmid.c              | 120 +++
>>>  include/clocksource/timer-riscv.h             |  16 +
>>>  include/uapi/linux/kvm.h                      |   8 +
>>>  25 files changed, 4706 insertions(+), 9 deletions(-)
>>>  create mode 100644 arch/riscv/include/uapi/asm/kvm.h
>>>  create mode 100644 drivers/staging/riscv/kvm/Kconfig
>>>  create mode 100644 drivers/staging/riscv/kvm/Makefile
>>>  create mode 100644 drivers/staging/riscv/kvm/asm/kvm_csr.h
>>>  create mode 100644 drivers/staging/riscv/kvm/asm/kvm_host.h
>>>  create mode 100644 drivers/staging/riscv/kvm/asm/kvm_types.h
>>>  create mode 100644 drivers/staging/riscv/kvm/asm/kvm_vcpu_timer.h
>>>  create mode 100644 drivers/staging/riscv/kvm/main.c
>>>  create mode 100644 drivers/staging/riscv/kvm/mmu.c
>>>  create mode 100644 drivers/staging/riscv/kvm/riscv_offsets.c
>>>  create mode 100644 drivers/staging/riscv/kvm/tlb.S
>>>  create mode 100644 drivers/staging/riscv/kvm/vcpu.c
>>>  create mode 100644 drivers/staging/riscv/kvm/vcpu_exit.c
>>>  create mode 100644 drivers/staging/riscv/kvm/vcpu_sbi.c
>>>  create mode 100644 drivers/staging/riscv/kvm/vcpu_switch.S
>>>  create mode 100644 drivers/staging/riscv/kvm/vcpu_timer.c
>>>  create mode 100644 drivers/staging/riscv/kvm/vm.c
>>>  create mode 100644 drivers/staging/riscv/kvm/vmid.c
>>>  create mode 100644 include/clocksource/timer-riscv.h
>>>
>>> --
>>> 2.25.1
>>>
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
