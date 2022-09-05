Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69FDECAAD3
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 17:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FDn4PD9ueSrWBXqsHARTAGsoND5BZVFb9ukAw7EdxrM=; b=WfTOF9RwysYTSY
	4SmPXMOsphWC8cgq5xzf96jHwXCp0L0p9chUyeMJJrvJUMOviLBxZ+wQKrFwuZrrpIV0KJlPtQ0+x
	X2Es68qrO6iNyHZHToiqjEU7sjdB+G9wfrXDe7Vp5NOqPUc82oGDAR6Y+6bVsNku9urrtQQQ8//cT
	V9gFcma2s/7dz6Sxa+pQd1QGG+Hvpcbms8519xUnWw3TGnIO2lvjmqwdlL6auUF7gQ4tmInQDiUte
	6KBKB4LPLRG3AlmvZd7a+M8C2UUthEIEU+Y/3xVkoj+hbNjJQBpRC1QLHi719u97dAUiKcIA1yl80
	BDHUV1Aq3KgvSNJ/J4wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVFhQ-007Nas-MG; Mon, 05 Sep 2022 17:15:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVDUQ-0058sC-IH
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 14:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662389659; x=1693925659;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=k1Z/locOtpR9qCOt7ipvc1Rd3Ls/D7vrvbU2uXeqq1c=;
  b=L3RxsrMZRkUcLKoXw1GipsloFY58u6Z/z5XDNyNJLiJ5Zni3NOOZVwKn
   IzilNxTggykGPvsgfZ7Vz06WuWe+zI2q2JC63EFE0nbAdOD4yWzwoR9wM
   dKlUoUBSDVhFpYMTqntUnt3OCmErwKtvmg5nAimuO6a94zjeo6tSbCidR
   1ooLybpMPogky7UvR/ckizvepZIuYCY5nP2HttT3Dub5M5KtaVlgH04rq
   8MZwlu/jDXxU8+8TyXKgfF1oaq46j5yWqQ0R5Z0E0AWBrHnfnMSpoLd0V
   rbU3WTTAOL59qAjfq5Kz3FriY/4Hskhd9b353DFGQ5/3b6WKZVU+AlWbD
   g==;
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="172439602"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Sep 2022 07:54:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 5 Sep 2022 07:54:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 5 Sep 2022 07:54:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lP0jdKEWjOdOI8ZsRWcN15fEybGtPFpyF9B4pRdDzfd1JerxSL4fe3/LdfXogtFM5QR5CsQl5TWc+ZV/mzQ9nzkMwk+/dbi+kfKD8n+0X2JegUpysO6hdRTp0228N/BoEPYvSYlKliRsQq8nizVRi0o1a5vKEGLnjctjdwrlQsx4WUxNBNNEQNMrUZq+CbfwBsWpxJvMpFQsq86wxGd3HOOWop/+uG99VpMmKY7vErhhBsamL/xoK9s6PlT9wySp5D6tTEPCgUhV9ru4kcxsfBLfUxaSTfE2zIffOXXcq4HBs87aWOfkIl6dctIDjlNVEl+1wafZo5ICwqWkPp2PKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1Z/locOtpR9qCOt7ipvc1Rd3Ls/D7vrvbU2uXeqq1c=;
 b=WHKTYd9iWIS/yusYmRhV9U6xFpYWMLiHKSejtm9lN5jEK/0UsTfC/HqxJQZYVzrCADbRfnZzHrDfmfX3DW8u/RvQpBLHidyP/kX6kBvr9DARVYNdSKpVxSWTHpmrkMgjog1AjzIEKBbZghVDh+BiGe51RmkFmKxGW1urSArLtFsxMhIRyx84WozDzshqrg5gIp2aOPG3YcVcBXNOKvnLInVJqdxhjkdYy3SBm+qaOdDCaPZgbOJQKuWHykSIMJUrLXz3J5dF6jbYVkz+uhLXYNGn5rORal+WwCd9ZR3tp7bYCGo9LEhwZJWkIXZz26tNLRhuDKXvyOUTy3g+QSdu9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1Z/locOtpR9qCOt7ipvc1Rd3Ls/D7vrvbU2uXeqq1c=;
 b=tGtCnNgS/oEwgHSLNBvy6a0co7iQopauYmQiCZC8GGIBKx0hNJTxKx/VesjhxF+t6RDa82HMtE5aIEaHvlDtNHtEGf/f/54kkLwZAQSlIONm6diUt8ychzc7rm4bKHUHA7+ROFNCVrEFG7EAUABCci6dt5ex3QM6OT37ukSV3YM=
Received: from DM6PR11MB3258.namprd11.prod.outlook.com (2603:10b6:5:e::27) by
 DM6PR11MB3259.namprd11.prod.outlook.com (2603:10b6:5:5d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.16; Mon, 5 Sep 2022 14:54:07 +0000
Received: from DM6PR11MB3258.namprd11.prod.outlook.com
 ([fe80::c8cf:c82e:e86e:2db6]) by DM6PR11MB3258.namprd11.prod.outlook.com
 ([fe80::c8cf:c82e:e86e:2db6%6]) with mapi id 15.20.5588.017; Mon, 5 Sep 2022
 14:54:07 +0000
From: <Daire.McNamara@microchip.com>
To: <robh+dt@kernel.org>
CC: <Cyril.Jean@microchip.com>, <linux-riscv@lists.infradead.org>,
	<kw@linux.com>, <Conor.Dooley@microchip.com>,
	<david.abdurachmanov@gmail.com>, <devicetree@vger.kernel.org>,
	<lpieralisi@kernel.org>, <aou@eecs.berkeley.edu>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <linux-pci@vger.kernel.org>,
	<Padmarao.Begari@microchip.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<bhelgaas@google.com>, <heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: PCI: microchip: add fabric address
 translation properties
Thread-Topic: [PATCH v1 1/4] dt-bindings: PCI: microchip: add fabric address
 translation properties
Thread-Index: AQHYvtd/Zgatyqml9kOZM0lssTSnuq3MVEqAgAScuAA=
Date: Mon, 5 Sep 2022 14:54:07 +0000
Message-ID: <173950d1b76e13c1476f196afc0e804e93d6e602.camel@microchip.com>
References: <20220902142202.2437658-1-daire.mcnamara@microchip.com>
	 <20220902142202.2437658-2-daire.mcnamara@microchip.com>
	 <CAL_Jsq+5pKyOL8eu5YhQy9pLATd_gG_D71sR8bUp1GA6kif=nA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+5pKyOL8eu5YhQy9pLATd_gG_D71sR8bUp1GA6kif=nA@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f23453d-d075-46de-3ca4-08da8f4e7bdc
x-ms-traffictypediagnostic: DM6PR11MB3259:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jfm1n0fKms1PYpyol4tqwgukKslosw8GDkJ4rrfRXx4zRfxiJrIhdaWrY5AE3M2PMgZwb4lzVLCX6ZRR57dTNC/8U48T213BiLFJ22YLKKHLZQtfiDAQ9RHNRGkM1AhKO1lV655T21i+NlE7XjCPNv/5FqEoCC+vnEVmEAO53EtFyayWcaI05amrwtJf4x71p9N0tzWedBKlkL89f0Z73txertL/yPsPrnfgRwwti76lztPHcuZK8lfURtKNM+PKNiGD4snElHnYlVOf7PtrvJg0IO9idkm7TOdcHtx39SsMg7ehQliXzWjUVwVQ4/REwkUWeWIywa3UaEZkEm1Qu0I2A5YXV+vWpibWMLWt5xVtpeqy+Y7mTkT+8qsWmFTZ2h73HfvVxLeCBUwbAuUczq7g2wB3c6W3uc8USCyRkVZHb2XgPyFuFTj7iYAT06ONdLoo6IDV9eW9lsj3y81GuUzP9c33+AGTAm4QfPORc4uW17W2q4vYxzXw0v64ghCA4LlDlJTq6X9dRmuspvdBkZ5vAJ0Nn0GzLf+3kOjMnVLv1pbmBbOLIDePZFtCVRgyRk+z5uKwhszPmRbIM5dPXi9vuh1vUz8pFA1gDh0nNkte/Vdy9qqzVgeNM59+EId9n4B3rSxLN/R1L+dV7rzOroX4WTN2mkIT0gLl4mAf8PwrlT0Mt9Dhrg4GZugcQgBZCxdfXXUWu3nIa8JG96Fb4HzpDXE1iUbYtLKd8zDcpVnehaKZgAS9c8VmjLpozaUcx9PKq7XcMXuDYlva661bjrHi2WosF5QZdT92aqETE8k=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3258.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(396003)(376002)(136003)(346002)(2906002)(38070700005)(38100700002)(122000001)(91956017)(66476007)(66556008)(76116006)(66946007)(4326008)(8676002)(316002)(54906003)(64756008)(66446008)(5660300002)(7416002)(6486002)(83380400001)(8936002)(2616005)(26005)(186003)(53546011)(966005)(71200400001)(6506007)(6512007)(41300700001)(478600001)(86362001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eG1FT3MzZEcvbTFPYU5Ma1ZJYTd3cW0yN21vSERLS0xaaDJjTkl1MzFIanRa?=
 =?utf-8?B?VlhnQ29HMnRNTkxTWDkxS05RbWJqQ2hTYXlXT0M0cjNpajh2QXJJRVhCMGJt?=
 =?utf-8?B?a3VGNHVmTTRGKzMrTk9GN0dRMStUK1VBTVVXNXNuaFk3emhOZk51bFpCQkZK?=
 =?utf-8?B?ZU5IVlRIb3h2VFdVbWhhdG1YdzA0M2kwd0h4WnE3YmdIL2dlV25VZUsvYXBZ?=
 =?utf-8?B?c2ZBVmc0amVEakRWQk0vSnJ1MGJ3RmRGakxJVHBZN2ZQbkFmbFNUN21JbkVP?=
 =?utf-8?B?WTl1TEFVS25XYkdiTUVCMjlFV1NUd2Q0Tm1jeitLRU9tVTd6SzRuaGpyV1o2?=
 =?utf-8?B?bkF3ZUErTlFDSi9iV2toSEhnbFNLQjkzOWRzb2pjSnBTbElFYVJndXpHd1N3?=
 =?utf-8?B?OEtrTXovdDZ1aUdEMWF3TmVLMmZaSEJkTHdxeFBmOFFnZTI0MDIycjBYbUEx?=
 =?utf-8?B?N2tSQk0rMnBFeXB3L2ExU2ROalMyQzZodWczTTZpeFA4c1hSN1dESllualht?=
 =?utf-8?B?RXdpN1FGMTdqaUVTRFlzdXNWeDQwU1FCTC9ScDE4MU1GMFdVRjNvWjBTeUhC?=
 =?utf-8?B?MWtSTWN3T0ZIUlFpOTdKR0lRdVk2QmhZTzN1SXNUWncyTzF3bDBJK1hvM3ZI?=
 =?utf-8?B?UmJZWVVYMDM0N1Z5SXlzYkhSbzFrTTJnZkFkWU5Pd3RNenhjQ2hLcXdSZXEz?=
 =?utf-8?B?ZTlWYTNlUW8yYUErS2RVYjBhUlUzbDh0cW4ySllKNEl6cHh3aTI0aUdacGdN?=
 =?utf-8?B?OFhCWHJWK2ZLazhQak13aFZBV1VNVnN2cm12ZVBwb2phbGpFNDl3d0ZNdGtF?=
 =?utf-8?B?L0hDd3c5ZW45MzFldDhNNVBWNEVFbXFUMFVOTzJhTEZzSlZ6M0dUU3YyR1kv?=
 =?utf-8?B?NktTcmNTTnRIazVkbVd2bzVGak4wMDZZaTRidWgvQzN5cFR6QURMVGNlNERI?=
 =?utf-8?B?NFFQWkhyWTRVcWVZWGpKbUhNZ0pRbHpaUzhpc3RFWTJhQjMzWmhlOG5KUWsv?=
 =?utf-8?B?NkV0UFFyV2JhbHFyK0ZuNS85NXFUb1hxQXBUbjJ1YklQL29taVJ3eGluOTBs?=
 =?utf-8?B?Y00yUDcra3ovUjFMVzRYSFhoOTZCRVl5WjZkcmc4VkdWRkExRmlZMjJjc0JE?=
 =?utf-8?B?azhtODdyRE53aFlnTmcwWENQWDJVeHRSQ1dvY3Z3YlQ4NmtQZndiSFE3VWxr?=
 =?utf-8?B?a0RhMWhlWjFXU0cxbTEreU81dkJKRnovakI0RGdWdE10dmZsTjlHa1RHNWVW?=
 =?utf-8?B?MzJSQkNVNS81WEtSRjR4UDltUjdCRU1vZ2daL09yQ0FLMjZLWmsvZWwzL2NG?=
 =?utf-8?B?T1JTY3dwNXQ0Vmw0ckpzbU1NdWZjbE9xVzIySGk3M05CdGtpTTIwU3ZhUTFi?=
 =?utf-8?B?NUlnWkE3dFZEVHJybHB5N0g2Tyt5aldWemJSc2hPUjN6QTBhNmtreHR1OEtk?=
 =?utf-8?B?cmZYYm9oVkZaTzFNZnRxUmZTQnNNV2ZKM0drdWZnbkpxeTY2VUZWd3JmdEYx?=
 =?utf-8?B?aTd4TFhId3M2NmtzWno4T3VldWtOdldUNHJHbGIwVmQ4ZU91REVQb2Z3YytS?=
 =?utf-8?B?cGo5R2xid05xWlAvelJ3cm5uMVMxN1BPZ0w3SU9PR3JweHJ6aEI1TnVHWWMr?=
 =?utf-8?B?ZE93TC9OcFRuZGV1cUdlSmt1Q2ZGa1RYYjlWSmhDWEpXcHM2Ti9jOGRBdTBn?=
 =?utf-8?B?RmNrb3lBT2gyVUd4T2ZLL0pHVml3S1RXdzRMdXVwY0lCMlA3alJCMk90TC9q?=
 =?utf-8?B?dVE0VnhPWSs1U2dtRkNVclYweXRyTE10VHBYZ1c1c3hHV3VidGR1WWUrelRC?=
 =?utf-8?B?MGtvVVdlcXJGTGVzdllaNzBIVDZFZ1ZTb2lkcjJRQVI2NERpaHF1M1E2STVU?=
 =?utf-8?B?K2duMWZseTM0SjNlU1l0ZVhlM0tYcEcxL2lSVkxnbXowc29uaG1ZeTQ2YzNY?=
 =?utf-8?B?NmRabE1aMVRSNnNTc1dSUGV3dWVxendadFBTays3SmxLOTFiT09hOUZrK3Ji?=
 =?utf-8?B?VzhFc0hGL2JOdTJEeExVQkdtaDdNYUV3ZXhlNkpOOVp6TEcySVJrZVBvam50?=
 =?utf-8?B?V2ZlRnBvVTZhTjdsWDFBQjJYMG9uWUxGNFVDcjd6OEJJazN5Zm51ZFVER1U1?=
 =?utf-8?B?TU0xOGxJQjBaTHN1SzV5SGdGak8xY3RrQUtJMWljNGREZkxBU0UyWEQ0RUlS?=
 =?utf-8?B?aFE9PQ==?=
Content-ID: <BCB75C36974A7F4DB908FD5567BCA72F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3258.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f23453d-d075-46de-3ca4-08da8f4e7bdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 14:54:07.4129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ya9kDFpXJgjU5DowslcZ/y9CzYG8jXG1PxYE0ZA2iznjWxeWsSS2yQhapMngCzTjDn4aBGKXA87bTsNkZqtt1I5wruGgFvHgeFW80KShqdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3259
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_075418_776958_2925579F 
X-CRM114-Status: GOOD (  28.33  )
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

On Fri, 2022-09-02 at 11:28 -0500, Rob Herring wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Fri, Sep 2, 2022 at 9:22 AM <daire.mcnamara@microchip.com> wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > On PolarFire SoC both in- & out-bound address translations occur in two
> > stages. The specific translations are tightly coupled to the FPGA
> > designs and supplement the {dma-,}ranges properties. The first stage of
> > the translation is done by the FPGA fabric & the second by the root
> > port.
> > Add two properties so that the translation tables in the root port's
> > bridge layer can be configured to account for the translation done by
> > the FPGA fabric.
> 
> I'm skeptical that ranges/dma-ranges can't handle what you need.
> Anything in this area is going to need justification 'ranges doesn't
> work because x, y, z...'.
> 
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> > ---
> >  .../bindings/pci/microchip,pcie-host.yaml     | 107 ++++++++++++++++++
> >  1 file changed, 107 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> > index 23d95c65acff..29bb1fe99a2e 100644
> > --- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> > +++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> > @@ -71,6 +71,113 @@ properties:
> >      minItems: 1
> >      maxItems: 6
> > 
> > +  microchip,outbound-fabric-translation-ranges:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    minItems: 1
> > +    maxItems: 32
> > +    description: |
> > +      The CPU-to-PCIe (outbound) address translation takes place in two stages.
> > +      Depending on the FPGA bitstream, the outbound address translation tables
> > +      in the PCIe root port's bridge layer will need to be configured to account
> > +      for only its part of the overall outbound address translation.
> > +
> > +      The first stage of outbound address translation occurs between the CPU address
> > +      and an intermediate "FPGA address". The second stage of outbound address
> > +      translation occurs between this FPGA address and the PCIe address. Use this
> > +      property, in conjunction with the ranges property, to divide the overall
> > +      address translation into these two stages so that the PCIe address
> > +      translation tables can be correctly configured.
> 
> Sounds like you need 2 levels of ranges/dma-ranges.
> 
> / {
>     fpga-bus {
>         ranges = ...
>         dma-ranges = ...
>         pcie@... {
>             ranges = ...
>             dma-ranges = ...
>         };
>     };
> };
Thanks a million for looking at this! Very much appreciated.

So, this is what I tried.  I've cut down the dts I used to what I think is the minimum
fragment to discuss the issue I'm facing.

So, I replaced this stanza:

pcie: pcie@3000000000 {
    ...
    reg = <0x30 0x0 0x0 0x8000000>, <0x0 0x43000000 0x0 0x10000>;
    reg-names = "cfg", "apb";
    ranges = <0x0000000 0x0 0x0000000 0x30 0x0000000 0x0 0x8000000>,
             <0x3000000 0x0 0x8000000 0x30 0x8000000 0x0 0x80000000>;
    ...
};

with this two-level stanza:

fpga_bus: fpga-bus {
    #address-cells = <2>;
    #size-cells = <2>;
    ranges = <0 0 0x30 0 0x40 0>;
    compatible = "simple-bus";
    ...

    pcie: pcie@0 {
        reg = <0x0 0x0 0x0 0x8000000>, <0x0 0x43000000 0x0 0x10000>;
        reg-names = "cfg", "apb";
        ranges = <0x0000000 0x0 0x0000000 0 0x0000000 0x0 0x8000000>,
                 <0x3000000 0x0 0x8000000 0 0x8000000 0x0 0x80000000>;
        ...
    };
};

and I ran into two problems:
1) the ranges presented to the driver via  resource_list_for_each_entry(entry, &bridge->windows) 
   were unchanged. The start and end of both resources were still in 0x30'0000'0000 space, 
   not 0x0000'0000 as I'd hoped. The two levels of range had been amalgamated before 
   presentation to the rootport driver, so my initial problem was unchanged ...

2) a new issue cropped up. While the 'cfg' register property is in 0x30'0000'0000 space, 
   the 'abp' interface is actually delivered over a separate FIC and is in a 0x4000'0000 
   memory space. In the two-level stanza, it was now being provided to the rootport 
   driver at a base of 0x30'4000'0000 which is incorrect. This is very typical for 
   designers to route abp over a different FIC to axi. 

I hope I'm making the issues clear.

Any suggestions welcome!

> 
> > +
> > +      If this property is present, one entry is required per range. This is so
> > +      FPGA designers can choose to route different address ranges through different
> > +      Fabric Interface Controllers and other logic as they see fit.
> > +
> > +      If this property is not present, the entire address translation
> > +      in any ranges property is attempted by the root port driver via its outbound
> > +      address translation tables.
> > +
> > +      Each element in this property has three components. The first is a
> > +      PCIe address, the second is an FPGA address, and the third is a size.
> > +      These properties may be 32 or 64 bit values.
> > +
> > +      In operation, the driver will expect a one-to-one correspondance between
> > +      range properties and this property.  For each pair of range and
> > +      outbound-fabric-translation-range properties, the root port driver will
> > +      subtract the FPGA address in this property from the CPU address in the
> > +      corresponding range property and use the remainder to program its
> > +      outbound address translation tables.
> > +
> > +      For each range, take its PCIe address and size - these are the PCIe
> > +      address & size for the element. The FPGA address is derived from a given
> > +      FPGA fabric design and is the address delivered by that FPGA fabric
> > +      design to the Core Complex. For a trivial configuration, it is likely to be the
> > +      lower 32 bits of the PCIe address in the range property and the upper
> > +      bits of the base address of the Fabric Interface Controller the design uses.
> > +      Otherwise, it is tightly coupled with the data path configured in the
> > +      FPGA fabric between the root port and the Core Complex.
> > +
> > +      For more information on the tables, see Section 1.3.3,
> > +      "PCIe/AXI4 Address Translation" of the PolarFire SoC PCIe User Guide:
> > +      https://www.microsemi.com/document-portal/doc_download/1245812-polarfire-fpga-and-polarfire-soc-fpga-pci-express-user-guide
> > +
> > +    items:
> > +      minItems: 3
> > +      maxItems: 6
> > +
> > +  microchip,inbound-fabric-translation-ranges:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    minItems: 1
> > +    maxItems: 32
> > +    description: |
> > +      The PCIe-to-CPU (inbound) address translation takes place in two stages.
> > +      Depending on the FPGA bitstream, the inbound address translation tables
> > +      in the PCIe root port's bridge layer will need to be configured to account
> > +      for only its part of the overall inbound address translation.
> > +
> > +      The first stage of address translation occurs between the PCIe address and
> > +      an intermediate FPGA address. The second stage of address translation
> > +      occurs between the FPGA address and the CPU address. Use this property
> > +      in conjunction with the dma-ranges property to divide the address
> > +      translation into these two stages.
> > +
> > +      If this property is present, one entry is required per dma-range. This is so
> > +      FPGA designers can choose to route different address ranges through different
> > +      Fabric Interface Controllers and other logic as they see fit.
> > +
> > +      If this property is not present, the entire address translation
> > +      in any dma-ranges property is attempted by the root port driver via its
> > +      inbound address translation tables.
> > +
> > +      Each element in this property has three components. The first is a
> > +      PCIe address, the second is an FPGA address, and the third is a size.
> > +      These properties may be 32 or 64 bit values.
> > +
> > +      In operation, the driver will expect a one-to-one correspondance between
> > +      dma-range properties and this property.  For each pair of dma-range and
> > +      inbound-fabric-translation-range properties, the root port driver will
> > +      subtract the FPGA address in this property from the CPU address in the
> > +      corresponding dma-range property and use the remainder to program its
> > +      inbound address translation tables.
> > +
> > +      From each dma-range, take its PCIe address and size - these are the PCIe
> > +      address & size for the element. The FPGA address is derived from a given
> > +      FPGA fabric design and is the address delivered by that FPGA fabric
> > +      design to the Core Complex. For a trivial configuration, this property
> > +      is unlikely to be required (i.e. no fabric translation on the inbound
> > +      interface).  Otherwise, it is tightly coupled with the inbound data path
> > +      configured in the FPGA fabric between the root port and the Core Complex.
> > +      It is expected that more than one translation range may be added to
> > +      an FPGA fabric design, e.g. to deliver data to cached or non-cached
> > +      DDR.
> > +
> > +      For more information on the tables, see Section 1.3.3,
> > +      "PCIe/AXI4 Address Translation" of the PolarFire SoC PCIe User Guide:
> > +      https://www.microsemi.com/document-portal/doc_download/1245812-polarfire-fpga-and-polarfire-soc-fpga-pci-express-user-guide
> > +
> > +    items:
> > +      minItems: 4
> > +      maxItems: 7
> > +
> >    msi-controller:
> >      description: Identifies the node as an MSI controller.
> > 
> > --
> > 2.25.1
> > 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
