Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069E8C433B4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 12:09:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 631A0610D2
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 12:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 631A0610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2dL3EVUIUAQadjE8Y3JQmPnghIi+gHFXKdzRw70oHY8=; b=hWgKkNO6ZiVEf808qgDEdrYfR
	WoIzx1JZ1aXM4UhVbovSWHn3+hc9EFWGgq+75ouy3Mrc9CRWdQVTGqwvZW0M2zsHqL4r32tWW6C2K
	SOiMmLwc1VhNP0YSC/U0yRfY9qzentKJybl9OwUAHw18MAYAm1QUj3YkflRAvADzafRrVdv6kStPm
	YgUBJ9oUzK1berLt3Ou2a7AlYHemSVKKvrshpMO5iDYQ+wfZvYRw+rfQQBROFFa/fKflTS309H+ER
	OXWrskmYmR8Nj6odkvl9set7L+oz27/2tE3ZXnIOn1x0xOm+SmL4DfzPZ+YbvCaSr4ESo8cy9y47k
	/XzQ+edUg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSIbY-00CxBt-VY; Fri, 02 Apr 2021 12:08:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSIbT-00CxBH-BA
 for linux-riscv@lists.infradead.org; Fri, 02 Apr 2021 12:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617365323; x=1648901323;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2emxkhUUVTR8V9FmrPsoFlpjtYT1rVQcdB8H0Vbj4yc=;
 b=V6spERPqV2kyEZoJ2o4TE+L0NZ09KZPFxhP+ITKCrf8Mk0X7XsxutNia
 SstnEPI8fgShAixVXfSziO4rhg31nUPbq1WVPaQiV7+W/rLFnf5MtUjGE
 YVg7mOp7vS+QYnoCqWv/m05405lL4Ir3SgSxodhwLOHt6SnFmPfSjFEtD
 86OFn+sYhpTNGQoshQDwX7pXTyTp+hGR4bg+qFaUaBzex08CBpV9QbQkg
 f75sNsCxhLI774Oa6uorvpDYvyRiwZShN9LmghIibaPbkcNKLF4lrWih4
 bxZv0NFj7HTPT1x4/yrhnknyfz/t6PfTOwQDHjSk/LsxWSA3/IonNdRnB Q==;
IronPort-SDR: PI00e8hb5cFzw8WGXoBU6WLt4KGSn6Tfzqhf8Iscn21yR4eLgK1IZahp2NVctrDWrIY3K2Pf1D
 MzlQKCc2DH50LNbuZ241ecugS393GHcjsPkfGuoBbkm16KYjCt4mmTu4gRZ6SI6iKikLHE6bda
 9EU2oMG1H18J8uq0zyOG8/f4DcKBz3IUpbP6rALIWzT+7fudueK7WKbO+gU5kkHVwpqSjUGizR
 aY0333UbXC6YVfGSc7DYzztBxWQmtwRBymtR642boiS6eg/QVhOK+SH5fxhvFpWv7PQcVZlJAs
 dF8=
X-IronPort-AV: E=Sophos;i="5.81,299,1610434800"; d="scan'208";a="115107936"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Apr 2021 05:08:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Apr 2021 05:08:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Fri, 2 Apr 2021 05:08:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0mTjmSKo5D/162FYbGaiqoukdM6YBhVGI5bLHXzBHWo93qClvPZmeUirA6lUGP3Z95G8PWS6tmEYoYl/RsaisPg3Ttk8K1JIbmfo4spc9bGZit9YGAX0rycafJJwKQBvhqJC6vjfOaxqIbX7yzs8wTYjob4SYpjKbeAfuYXRAwWFy5P9lLJX1GPik++bqNYas/zMjvoux80/+CCBT4y86ruwslxqaPmOFSwoxphdEY9OWJCxbPCdIvg6IbyXAvHcmsQBz4VEuSADfo48gF5DOsy42Yhk7/VvexCsvgt2AliuTMyvhXC271upyq5gLcPMnP3qOnEP+qCZ4nlCjUd3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2emxkhUUVTR8V9FmrPsoFlpjtYT1rVQcdB8H0Vbj4yc=;
 b=SJDP1nvlvruKtlxRAHJOneLjJfvvCVLls2XBo1CQZHarlPiokTPzmT5WoSzm/+6ZQB8eFlW9Vh8fAQVAhw/ad4kDLSOap5y4BDaKewnU0PBCTLnq4RVmtdBE4S6WiyuswvXURVEc7RiiKWvjtMFcT1OzqgpgmaY2GFr2hy9+gIYvTHt5Ma1bdBeO3MiKEPLDref38ENToDZu7uOo9ATSJjsBmd97hiYBarNhmrPwKNKdWJzxHbgcFJUksu8m1OZWYz6tTsatS3Bq7nGiuO4xME8aQZddG6C/Yai9jwXmXKPBHo0GWnUXhkA0xTmGnRZGLVjFj78ezgwllckDd91PAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2emxkhUUVTR8V9FmrPsoFlpjtYT1rVQcdB8H0Vbj4yc=;
 b=d27ChCFBQafW/bv7IocOzMbasCRRUN+SFbuDmEL+ogVYgvU1dcL+UqPswy40k9dZ06lAO2nyku82TokE1GEIkQEC3MJxhDCObGLNui5aX0ZIlTyrGA0qSeT4W9JndYgSpQJwTUA1ln24JBElbeLuvrWwsPxOzG+ymrdLUXcRh8w=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by CO1PR11MB4932.namprd11.prod.outlook.com (2603:10b6:303:98::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Fri, 2 Apr
 2021 12:08:35 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::1ddb:df6a:6208:ccf9]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::1ddb:df6a:6208:ccf9%5]) with mapi id 15.20.3999.029; Fri, 2 Apr 2021
 12:08:35 +0000
From: <Conor.Dooley@microchip.com>
To: <jassisinghbrar@gmail.com>
CC: <palmer@dabbelt.com>, <robh+dt@kernel.org>, <Damien.LeMoal@wdc.com>,
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>, <Lewis.Hanly@microchip.com>,
 <Cyril.Jean@microchip.com>, <Daire.McNamara@microchip.com>,
 <Atish.Patra@wdc.com>, <Anup.Patel@wdc.com>, <david.abdurachmanov@gmail.com>
Subject: Re: [PATCH v4 0/5] Add support for the PolarFire SoC system controller
Thread-Topic: [PATCH v4 0/5] Add support for the PolarFire SoC system
 controller
Thread-Index: AQHXJVTFPyo0SISS3U2ehOcAXtKWoqqdNUgAgAPx3QA=
Date: Fri, 2 Apr 2021 12:08:35 +0000
Message-ID: <bec1f254-12e2-0613-6233-43a7090e6643@microchip.com>
References: <mhng-1b7b4cb7-2f9a-4bdb-b00c-14ec1d7008b0@palmerdabbelt-glaptop>
 <1afc3d35-55ff-eefd-3fc9-6342f85fa887@microchip.com>
 <CABb+yY2s+ovT4Dhbsy4Mjn2EtgEwYdezhmUcL3H8GWCdaO2bPA@mail.gmail.com>
In-Reply-To: <CABb+yY2s+ovT4Dhbsy4Mjn2EtgEwYdezhmUcL3H8GWCdaO2bPA@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [89.204.252.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d53ecd9-3fe1-4401-7238-08d8f5d00a8d
x-ms-traffictypediagnostic: CO1PR11MB4932:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB4932A361A5D671C131E74B5C987A9@CO1PR11MB4932.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y6QjGz3ep6ZuazjRXE9jXa1oWhJYQFzEWLFJWMfny0XXWCNw+NtSw/zIWdZW8b0dWLDlMEQBt6eSTNd4yIiBRdEI0bCt2P4uc5tPSBz7GekXvOCQV4wjiWa7y7GP+wN4ebTbYKEqe7w2OR04mD5fK3mtu7IF69kqkFnLruqRJByDV0Zsey4Mr7/uOGU9HYVRVsmhnAmYBsnJnKdQ0UD0SlIBl2mAOlKE5JVssZohKVW/3e+OMrzxgbMbW0qcoEekO8Egcr4z0Lzt9cvazJAtvBfvTOI9sllB93LsKSoYs2J17zvnrcHtEenxN2oqJknF9kHU0NW/kXog5V9oAUI+QNyfIKBsdVLUDBClL+cWLGmnH07lbhG0E6xqY27mhw1wJqGSK9QfE95j0CU2JstHc1SZnPJkwd6vuMOpiL/3qpwynRhg1umKuA4fjJYhm8iZ6zG25EPM+OyWG/O6Zub6HRjcSJME8twXAz6qBK2VWM6Wu/qOWs22dVo2lSzDwRz34b3WBcQ7Q51C+L0MYo6Se8nf1HRHtqEClohZGr1xDxBAIE7Dd6RRfYyF0wZvlAnTFQDPjSCIW1JFCUnQaG1rRgPfIDHFAaWtgluRo+iO2rbbSQbOm3tIqjad+fv/Mplosyrytv1ZjNPx+xpTn3S/Il/3IG+oC35TjD1odnmLLLiX2kdWwmNcCYEPFMguts/GD4NN7qOmKIS5k/AasgWfDB04LK/CjZ9BKmsvLjyHwcvdulGKw/Ki0IrOWcr9r5IRXXIiM1RUx+UHJWmnEyjbNCUcopGdOK3VRB7fSzR6nlg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(366004)(376002)(346002)(39860400002)(38100700001)(71200400001)(966005)(83380400001)(66556008)(66446008)(64756008)(91956017)(8936002)(76116006)(478600001)(66946007)(66476007)(5660300002)(54906003)(26005)(6512007)(6486002)(316002)(4326008)(7416002)(6506007)(53546011)(6916009)(31686004)(31696002)(186003)(36756003)(2906002)(8676002)(86362001)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bm9SUzhPeWZ0dXBMZktxbWcxb1RyZEFBUmVrWUtlOWxweTN0c1VZUE1saFRy?=
 =?utf-8?B?SjdZKzloaHM0YkxXWWl4QnJGWDF1bStEdFFOQWVTWCtwTVl0V3c1OEdCMDdh?=
 =?utf-8?B?ZGZXUmZLRy80RjdkUFcweEgvaFhmR1VRb21PM3lEMk82MW1Kc2paUlJOUzFL?=
 =?utf-8?B?bTd6bkhDQXZoT0RIN01PWGl2WWVIcDNqTk5nM2ZoM2MrSm5JclB1d29PdE9y?=
 =?utf-8?B?MUNrVXFDK2Npc2dRMDNqcVZIUzZvTE5zdjlMaE5Cc2pKcDhxazZPdjNDV1Vh?=
 =?utf-8?B?bXNpamxoa0lMNnorZDlNbFVVWm5pNXpmY2JXVW03b2tSbFZzSHd2N01FMFRD?=
 =?utf-8?B?VnZ2T2szQVYvZmszSWpwK1NkdDB2VWI1S0EvaEFjLzBmbUhzM0xpRU9nZGhh?=
 =?utf-8?B?ajd5NE1QY2tUNUY1Q1p3MlFvMVpkbnFqeWxqZ1JQT21QMktsRXZ4VldJckIz?=
 =?utf-8?B?K0Eva2dzLzJoVEticEpZLzZUb2ZLTW45NlBQakxRVzBzUVp5UnZZMmIvTkVq?=
 =?utf-8?B?WWdJVUJFMzFmN1dydE9LQVBLTm1NVGlKcVBRY0tSeXI5Qk5CTlhMRGdLODds?=
 =?utf-8?B?dGpUVEZiUVNCYXVEWklzNExocHdTS3FvUW83NXluckdTc0swSjBFN1dxc1hQ?=
 =?utf-8?B?WVBRaFVBZEQyMzdMOWpWOWlPSm1kdVFkM24rM3Vyb2VoOHdyOWd3eHliS1BI?=
 =?utf-8?B?YlpUY1VLMW5LQlB0QVJaODlaZUIrQWRlWENhVFFXQmhud3pqak9Ha0pGRzNV?=
 =?utf-8?B?RVdPenp0ZVR4dUVISTNWOHM3SFlvM1BXQ2JTRUF2eXdremQzcHBoYzVYaFo1?=
 =?utf-8?B?TnEycVFSV0YvS2VOU240RkJtWG9wdVJzRkdjdytCZGZvRkZYbnhnVXdVd1RP?=
 =?utf-8?B?akkyajlzemZDeUxwUWJINmFaajV2VVh6UWp5SVpkZEZMbXFrc1JMa3dJTlNU?=
 =?utf-8?B?SmRKQjROMUUwbmxvSDUxRk5sSzg1Y2xWVUIzWXZuWnA3R1NkaHVhUnhoNlE3?=
 =?utf-8?B?aG9mOWowZ2Y0MVhXTkNhWUlmODRpSWZuNlNpSi9UalZnZkVwcHVGZ2FXak5j?=
 =?utf-8?B?L1dLblVLMERvempTbU1vbmg5dzBpZTVoRzkxVWs0OXBTTWkwcUtxbzh0bWE3?=
 =?utf-8?B?SmxWUE5DbEZnWGtlVndrL1M3bUo2anJyKzlNdjVoVU9QQ0dkdXVOc0hhQnV3?=
 =?utf-8?B?VCs1V0hQMXJJQ001NzU4clRBeTBjQ0lwdk1hSml0M3FsNEMydC9YRkZpNWJt?=
 =?utf-8?B?SWwwcjdabm9WZ0hZZWx5YkljQ05zOEovNFpuOEVwMGt5VHdwVWRlN1V6V01L?=
 =?utf-8?B?VzBCMXJGYXJ2Wmh4S1B3Z0k5MmNpTi81ajBnS1NZZU1LLzZXSysrU3dleVlQ?=
 =?utf-8?B?aE5KSnhNdEtNVVhHZzdoV0FFVUl4dXg4Zk1xMkM3bXE4MGhQZ2JmSHRrYUFt?=
 =?utf-8?B?eTd3cGlIbUtaTDZQd3dDcG5KaytPSzR6LzAyWm5ERmE2ayt3Z2I1MXpmWXBa?=
 =?utf-8?B?MzJHQkRBZXFzb2lEY2R5dTQ4MVBlU2RLYlhQcG15OHRxaVRBVWlIL2JsSUZW?=
 =?utf-8?B?NFpBakF1Mk1BK1ZDd0ZFbWY3TG5vaG1WM1FGOFg2RERqR3U4cDlCYXRzelFm?=
 =?utf-8?B?djNpR0wvUGd1NHozNysvOTVGYVh6Smdpbk5ZbXpmbzNEeTRJSHRudjZpL3JG?=
 =?utf-8?B?RFVxZmI2M1pDcEw4SCtOTWpLS3R0T05PcGNtN2VYMm5rSTd1Q0lLTmsvMHpP?=
 =?utf-8?Q?nvZQz6P6+9zM8GIk9thD1UZlOcJAySwoBzCIGoh?=
Content-ID: <E40BEDB52981964599946034E98DCD4B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d53ecd9-3fe1-4401-7238-08d8f5d00a8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2021 12:08:35.0625 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BOwRqhmVr5sWPk680lhlIaplP3vsj0uCcCL1e3s1i/8c0oBeEVdKCHQj7WZi7P7tRsDrf+F//3oGWlZ0QrhR7zuzH5oUnxSW019PPOsq8Rc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4932
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_130844_264271_4F691119 
X-CRM114-Status: GOOD (  17.55  )
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

On 31/03/2021 00:54, Jassi Brar wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> On Tue, Mar 30, 2021 at 6:06 AM <Conor.Dooley@microchip.com> wrote:
>
>>>>   create mode 100644
>>>> Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
>>>>   create mode 100644 drivers/mailbox/mailbox-mpfs.c
>>>>   create mode 100644 drivers/soc/microchip/Kconfig
>>>>   create mode 100644 drivers/soc/microchip/Makefile
>>>>   create mode 100644 drivers/soc/microchip/mpfs-sys-controller.c
>>>>   create mode 100644 include/soc/microchip/mpfs.h
>>> The only problem I see here is that patch #3 (the driver for the system
>>> controller) comes before patch #4 (the DT bindings for that driver).
>>> That
>>> triggers a checkpatch warning.  I can just reorder it, but it would be
>>> great to
>>> have some reviews from the DT and mailbox people.  If not I'll try and
>>> find
>>> some time to take a closer look.
>> I've had a fair bit of back and forth with Rob about the dt bindings,
>> hopefully this version he happy with - think all of his concerns have
>> now been addressed. Haven't heard anything from Jassi Brar on the device
>> tree side however

 >this version

this should read "the next version" not "this version"

> Nowhere is explained how the controller works, and the bindings seem
> trivial, so I have no concern.
>
> -j
We have documentation for the services provided by the system controller 
here, and I'll provide this link with the cover letter when I submit v5 
(direct download link to a pdf):
https://www.microsemi.com/document-portal/doc_download/1244853-ug0905-polarfire-soc-fpga-system-services-user-guide

Several of the services have drivers completed/in progress, but I have 
been holding off on submitting them until this series was accepted since 
they belong in a bunch of different subsystems.

Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
